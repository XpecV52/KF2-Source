//=============================================================================
// KFPerk_Gunslinger
//=============================================================================
// The gunslinger perk class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFPerk_Gunslinger extends KFPerk
		native;



 


 


  



 



 




 



 




 



 



 



 



 



 





 


 



 







#linenumber 14

//Passives
var			const				PerkSkill 				WeaponDamage;
var 		const				PerkSkill				BulletResistance;
var 		const				PerkSkill				MovementSpeed;
var 		const				PerkSkill				Recoil;

var 		protected 	const	array<Name>				SpecialZedClassNames;
var 		protected 	const	array<Name>				AdditionalOnPerkWeaponNames;
var 		protected 	const	array<Name>				AdditionalOnPerkDTNames;

var 		protected 	const	AkEvent					RhythmMethodSoundReset;
var 		protected 	const	AkEvent					RhythmMethodSoundHit;
var 		protected 	const	AkEvent					RhythmMethodSoundTop;

var 		protected 	const 	name 					RhytmMethodRTPCName;

/* The bob damping amount when the Shoot and Move perk skill is active */
var			private 	const	float					ShootnMooveBobDamp;

enum EGunslingerSkills
{
	EGunslingerShootnMove,
	EGunslingerQuickSwitch,
	EGunslingerRhythmMethod,
	EGunslingerBoneBreaker,
	EGunslingerSpeedReload,
	EGunslingerPenetration,
	EGunslingerCenterMass,
	EGunslingerLimbShots,
	EGunslingerFanfare,
	EGunslingerUberAmmo
};

//Selectable skills
var 		private 		int							HeadShotComboCount;
var 		private 		int							HeadShotComboCountDisplay;
/** The maximum number of headshots that count toward the Rhythm Method perk skill damage multiplier */
var 		private const	int 						MaxHeadShotComboCount;

/*********************************************************************************************
* @name	 Perk init and spawning
******************************************************************************************** */


/*********************************************************************************************
* @name	 Stats/XP
********************************************************************************************* */
/**
 * @brief how much XP is earned per head shot depending on the game's difficulty
 *
 * @param Difficulty current game difficulty
 * @return XP earned
 */
simulated static function int GetHeadshotXP( byte Difficulty )
{
	return default.SecondaryXPModifier[Difficulty];
}

/*********************************************************************************************
* @name	 Passives
********************************************************************************************* */
/**
 * @brief Modifes the damage dealt
  *
 * @param InDamage damage
 * @param DamageCauser weapon or projectile (optional)
 * @param MyKFPM the zed damaged (optional)
 * @param DamageInstigator responsible controller (optional)
 * @param class DamageType the damage type used (optional)
 */
simulated function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx )
{
	local KFWeapon KFW;
	local float TempDamage;

	TempDamage = InDamage;

	if( DamageCauser != none )
	{
		KFW = GetWeaponFromDamageCauser( DamageCauser );
	}

	if( (KFW != none && IsWeaponOnPerk( KFW )) || (DamageType != none && IsDamageTypeOnPerk( DamageType )) )
	{
		TempDamage += InDamage * GetPassiveValue( WeaponDamage, CurrentLevel );

		if( IsBoneBreakerActive() )
		{
			TempDamage += InDamage * GetSkillValue( PerkSkills[EGunslingerBoneBreaker] );
		}

		if( IsRhythmMethodActive() && HeadShotComboCount > 0 )
		{
			;
			TempDamage += Indamage * GetSkillValue( PerkSkills[EGunslingerRhythmMethod] ) * HeadShotComboCount;
		}
	}

	;
	InDamage = FCeil( TempDamage );
}

/**
 * @brief Modifies the damage taken
 *
 * @param InDamage damage
 * @param DamageType the damage type used (optional)
 */
function ModifyDamageTaken( out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy )
{
	local float TempDamage;

	TempDamage = InDamage;

	if( ClassIsChildOf(DamageType, class'KFDT_Ballistic') )
	{
		TempDamage -= InDamage * GetPassiveValue( BulletResistance, CurrentLevel );
	}

	;
	InDamage = Round( TempDamage );
}

/**
 * @brief Weapons and perk skills can affect the jog/sprint speed
 *
 * @param Speed jog/sprint speed
  */
function ModifySpeed( out float Speed )
{
	local float TempSpeed;

	TempSpeed = Speed;
	TempSpeed += Speed * GetPassiveValue( MovementSpeed, GetLevel() );

	;
	Speed = Round( TempSpeed );
}

/**
 * @brief Modifies the weapon's recoil
 *
 * @param CurrentRecoilModifier percent recoil lowered
 */
simulated function ModifyRecoil( out float CurrentRecoilModifier, KFWeapon KFW )
{
	if( IsWeaponOnPerk( KFW ) )
	{
		;
		CurrentRecoilModifier -= CurrentRecoilModifier * GetPassiveValue( Recoil, GetLevel() );
	}
}

/*********************************************************************************************
* @name	 Selectable skills functions
********************************************************************************************* */
/**
 * @brief Should the tactical reload skill adjust the reload speed
 *
 * @param KFW weapon in use
 * @return true/false
 */
simulated function bool GetUsingTactialReload( KFWeapon KFW )
{
	return IsSpeedReloadActive() && IsWeaponOnPerk( KFW );
}

/**
 * @brief Skills can can chnage the knock down power
 * @return knock down power in %
 */
function float GetKnockdownPowerModifier( optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting=false )
{
	if( IsLimbShotsActive() && (BodyPart == BP_LeftLeg || BodyPart == BP_RightLeg) && bIsSprinting )
	{
		;
		return GetSkillValue( PerkSkills[EGunslingerLimbShots] );
	}

	return 1.f;
}

/**
 * @brief skills and weapons can modify the stumbling power
 * @return stumpling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart )
{
	if( IsCenterMassActive() && (BodyPart == BP_Torso || CheckSpecialZedBodyPart( KFP.class, BodyPart )) )
	{
		;
        return GetSkillValue( PerkSkills[EGunslingerCenterMass] );
	}

	return 1.f;
}

/**
 * @brief Some zeds have special body parts that cover the torso (FP for example)
 *
 * @param PawnClass The zed hit
 * @param BodyPart The body part
 *
 * @return valid body part or not
 */
function bool CheckSpecialZedBodyPart( class<KFPawn> PawnClass, byte BodyPart )
{
	if( BodyPart == BP_Special && SpecialZedClassNames.Find( PawnClass.name ) != INDEX_NONE )
	{
		return true;
	}

	return false;
}

/**
 * @brief Skills can modify the zed time time delation
 *
 * @param W used weapon
 * @return time dilation modifier
 */
simulated function float GetZedTimeModifier( KFWeapon W )
{
	local name StateName;

	if( GetFanfareActive() && IsWeaponOnPerk( W ) )
	{
		StateName = W.GetStateName();
		if( ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
		{
			;
			return GetSkillValue( PerkSkills[EGunslingerFanfare] );
		}
	}

	return 0.f;
}

/**
 * @brief Checks if Uber Ammo is selected, the weapon is on perk and if we are in zed time
 *
 * @param KFW Weapon used
 * @return true or false
 */
simulated function bool GetIsUberAmmoActive( KFWeapon KFW )
{
	return IsWeaponOnPerk( KFW ) && IsUberAmmoActive() && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief A head shot happened - count it if the damage type is on perk
 *
 * @param KFDT Damage type of the weapon used
 */
function AddToHeadShotCombo( class<KFDamageType> KFDT, KFPawn_Monster KFPM )
{
	if( IsRhythmMethodActive() )
	{
		if( IsDamageTypeOnPerk( KFDT ) )
		{
			++HeadShotComboCount;
			HeadShotComboCountDisplay++;
			HeadShotComboCount = Min( HeadShotComboCount, MaxHeadShotComboCount );

			HeadShotMessage( HeadShotComboCount, HeadShotComboCountDisplay,, KFPM );
		}
		else
		{
			SubstractHeadShotCombo();
		}
	}
}

function UpdatePerkHeadShots( ImpactInfo Impact, class<DamageType> DamageType, int NumHit )
{
   	local int HitZoneIdx;
   	local KFPawn_Monster KFPM;

   	KFPM = KFPawn_Monster(Impact.HitActor);
   	if( KFPM == none )
   	{
   		if( Numhit < 1 )
   		{
   			SubstractHeadShotCombo();
   		}

   		return;
   	}

   	HitZoneIdx = KFPM.HitZones.Find('ZoneName', Impact.HitInfo.BoneName);
   	if( HitZoneIdx == HZI_Head && KFPM.IsAliveAndWell() )
	{
		AddToHeadShotCombo( class<KFDamageType>(DamageType), KFPM  );
	}
	else if( NumHit < 1 )
	{
		SubstractHeadShotCombo();
	}
}

/**
 * @brief Give the use some feedback when a headshot or miss happens
 *
 * @param HeadShotNum Number of successfull headshots in a row
 * @param bMissed If the last shot was a miss
 *
 */
reliable client function HeadShotMessage( byte HeadShotNum, byte DisplayValue, optional bool bMissed=false, optional KFPawn_Monster KFPM )
{
	local int i;
	local AkEvent TempAkEvent;

	if( OwnerPC == none || OwnerPC.MyGFxHUD == none || !IsRhythmMethodActive() )
	{
		return;
	}

	i = HeadshotNum;
	OwnerPC.UpdateRhythmCounterWidget( DisplayValue, MaxHeadShotComboCount );

	switch( i )
	{
		case 0:
			TempAkEvent = RhythmMethodSoundReset;
			break;
		case 1:	case 2:	case 3:	case 4:	case 5:
		case 6:
			if( !bMissed )
			{
				OwnerPC.ClientSpawnCameraLensEffect(class'KFCameraLensEmit_RackemHeadShot');
				TempAkEvent = RhythmMethodSoundHit;
			}
			break;
		case 7:
			if( !bMissed )
			{
				OwnerPC.ClientSpawnCameraLensEffect(class'KFCameraLensEmit_RackemHeadShotPing');
				TempAkEvent = RhythmMethodSoundTop;
				i = 6;
			}
			break;
	}

	if( TempAkEvent != none )
	{
		OwnerPC.PlayRMEffect( TempAkEvent, RhytmMethodRTPCName, i );
	}
}

/**
 * @brief Ccccccombo breaker ( Rhytm method )
 */
function SubstractHeadShotCombo()
{
	;

	if( IsRhythmMethodActive() && HeadShotComboCount > 0 )
	{
		--HeadShotComboCount;
		HeadShotComboCountDisplay = HeadShotComboCount;
		HeadShotMessage( HeadShotComboCount, HeadShotComboCountDisplay, true );
	}
}

/**
 * @brief Ccccccombo breaker ( Rhytm method )
 */
reliable private final server event ServerResetHeadShotCombo()
{
	SubstractHeadShotCombo();
}

reliable private final server function ServerClearHeadShotsCombo()
{
	HeadShotComboCountDisplay =0;
	HeadShotComboCount=0;
	HeadShotMessage( HeadShotComboCount, HeadShotComboCountDisplay );
}

simulated event bool GetIsHeadShotComboActive()
{
	return IsRhythmMethodActive();
}

/**
 * @brief The Quick Shot skill allows you to shoot faster
 *
 * @param InRate delay between shots
 * @param KFW Equipped weapon
 *
 */
/**simulated function ModifyRateOfFire( out float InRate, KFWeapon KFW )
{
	if( IsQuickShootActive() && IsWeaponOnPerk( KFW ) )
	{
		`QALog( "QuickShoot" @ KFW @ GetPercentage( InRate, ( InRate - InRate *  GetSkillValue( PerkSkills[EGunslingerQuickShoot] ) ) ), bLogPerk );
		InRate -= InRate *  GetSkillValue( PerkSkills[EGunslingerQuickShoot] );
	}
}*/

/**
 * @brief Adds some extra penetration
 *
 * @param Level current perk level
 * @param DamageType the used weapon's damage type
 * @param bForce
 * @return the additional penetrations
 */
simulated function float GetPenetrationModifier( byte Level, class<KFDamageType> DamageType, optional bool bForce  )
{
    // Only buff damage types that are associated with support
    if( (!IsPenetrationActive() && !bForce) || (DamageType == none || !IsDamageTypeOnPerk( Damagetype )) )
    {
        return 0;
    }

    return GetSkillValue( PerkSkills[EGunslingerPenetration] );
}

/**
 * @brief The Shoot'n'move skill lets you move quicker in iron sights
 *
 * @param KFW Weapon equipped
 * @return Speed modifier
 */
simulated event float GetIronSightSpeedModifier( KFWeapon KFW )
{
	if( IsShootnMooveActive() && IsWeaponOnPerk( KFW ) )
	{
		;
		return  GetSkillValue( PerkSkills[EGunslingerShootnMove] );
	}

	return 1.f;
}

simulated function ModifyWeaponBopDamping( out float BobDamping, KFWeapon PawnWeapon )
{
	If( IsShootnMooveActive() && IsWeaponOnPerk( PawnWeapon ) )
	{
		BobDamping *= default.ShootnMooveBobDamp;
	}
}

/**
 * @brief The Quick Switch skill modifies the weapon switch speed
 *
 * @param ModifiedSwitchTime Duration of putting down or equipping the weapon
 */
simulated function ModifyWeaponSwitchTime( out float ModifiedSwitchTime )
{
	if( IsQuickSwitchActive() )
	{
		;
		ModifiedSwitchTime *= GetSkillValue( PerkSkills[EGunslingerQuickSwitch] );
	}
}

simulated function bool ShouldInstantlySwitchWeapon( KFWeapon KFW )
{
	return IsQuickSwitchActive();
}

/*********************************************************************************************
* @name	The ususal getters
********************************************************************************************* */
/**
 * @brief Checks if the Shoot'n'move skill is active
 *
 * @return true/false
 */
simulated function bool IsShootnMooveActive()
{
	return PerkSkills[EGunslingerShootnMove].bActive;
}

/**
 * @brief Checks if the Quick Switch skill is active
 *
 * @return true/false
 */
simulated function bool IsQuickSwitchActive()
{
	return PerkSkills[EGunslingerQuickSwitch].bActive;
}

/**
 * @brief Checks if the Rhythm Method skill is active
 *
 * @return true/false
 */
simulated function bool IsRhythmMethodActive()
{
	return PerkSkills[EGunslingerRhythmMethod].bActive;
}

/**
 * @brief Checks if the Bone Breaker skill is active
 *
 * @return true/false
 */
function bool IsBoneBreakerActive()
{
	return PerkSkills[EGunslingerBoneBreaker].bActive;
}

/**
 * @brief Checks if the Speed Reload skill is active
 *
 * @return true/false
 */
simulated function bool IsSpeedReloadActive()
{
	return PerkSkills[EGunslingerSpeedReload].bActive;
}

/**
 * @brief Checks if the Quick Shoot skill is active
 *
 * @return true/false
 */
simulated function bool IsPenetrationActive()
{
	return PerkSkills[EGunslingerPenetration].bActive;
}

/**
 * @brief Checks if the Center Mass skill is active
 *
 * @return true/false
 */
simulated function bool IsCenterMassActive()
{
	return PerkSkills[EGunslingerCenterMass].bActive;
}

/**
 * @brief Checks if the Limb Shots skill is active
 *
 * @return true/false
 */
simulated function bool IsLimbShotsActive()
{
	return PerkSkills[EGunslingerLimbShots].bActive;
}

/**
 * @brief Checks if the Fanfare skill is active
 *
 * @return true/false
 */
simulated function bool IsFanfareActive()
{
	return PerkSkills[EGunslingerFanfare].bActive;
}

/**
 * @brief Checks if the Fanfare skill is active and if we are in zed time
 *
 * @return true/false
 */
simulated function bool GetFanfareActive()
{
	return IsFanfareActive() && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Checks if the Uber Ammo skill is active
 *
 * @return true/false
 */
simulated function bool IsUberAmmoActive()
{
	return PerkSkills[EGunslingerUberAmmo].bActive;
}

/**
 * @brief Returns true if the weapon is associated with this perk
 * @details Uses WeaponPerkClass if we do not have a spawned weapon (such as in the trader menu)
 *
 * @param W the weapon
 * @param WeaponPerkClass weapon's perk class (optional)
 *
 * @return true/false
 */
static simulated function bool IsWeaponOnPerk( KFWeapon W, optional class<KFPerk> WeaponPerkClass )
{
	if( W != none && default.AdditionalOnPerkWeaponNames.Find( W.class.name ) != INDEX_NONE )
	{
		return true;
	}

	return super.IsWeaponOnPerk( W, WeaponPerkClass );
}

/**
 * @brief DamageType on perk?
 *
 * @param KFDT The damage type
 * @return true/false
 */
static function bool IsDamageTypeOnPerk( class<KFDamageType> KFDT )
{
	if( KFDT != none && default.AdditionalOnPerkDTNames.Find( KFDT.name ) != INDEX_NONE )
	{
		return true;
	}

	return super.IsDamageTypeOnPerk( KFDT );
}

simulated protected event PostSkillUpdate()
{
	super.PostSkillUpdate();

	if(Role == Role_Authority)
	{
		if(IsRhythmMethodActive())
		{
			ServerClearHeadShotsCombo();
		}
	}
}

event Destroyed()
{
	if(Role == Role_Authority)
	{
			ServerClearHeadShotsCombo();
	}
}

simulated function PlayerDied()
{
	if(Role == Role_Authority)
	{
			ServerClearHeadShotsCombo();
	}
}

/*********************************************************************************************
* @name	 UI
********************************************************************************************* */

static function int GetMaxHeadShotsValue ()
{
	return default.MaxHeadShotComboCount;
}

simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Round( GetPassiveValue( default.WeaponDamage, Level ) * 100 ) $ "%";
	PassiveValues[1] = Round( GetPassiveValue( default.BulletResistance, Level ) * 100 ) $ "%";
	PassiveValues[2] = Round( GetPassiveValue( default.MovementSpeed, Level ) * 100 ) $ "%";
	PassiveValues[3] = Round( GetPassiveValue( default.Recoil, Level ) * 100 ) $ "%";

	Increments[0] = "[" @ Int( default.WeaponDamage.Increment * 100 )  $ "% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ "5% +" @ int(default.BulletResistance.Increment * 100)  $ "% /" @ default.LevelString @ "]";
	Increments[2] = "[" @ Int( default.MovementSpeed.Increment * 100 )  $ "% /" @ default.LevelString @ "]";
	Increments[3] = "[" @ Int( default.Recoil.Increment * 100 )  $ "% /" @ default.LevelString @ "]";
}

/*********************************************************************************************
* @name	 debug
********************************************************************************************* */
/** QA Logging - Report Perk Info */
simulated function LogPerkSkills()
{
	super.LogPerkSkills();

	if( bLogPerk )
	{
		LogInternal("PASSIVE PERKS");
		LogInternal("-WeaponDamage:" @ GetPassiveValue( WeaponDamage, GetLevel() ) * 100 $ "%");
		LogInternal("-BulletResistance:" @ GetPassiveValue( BulletResistance, GetLevel() ) * 100 $ "%");
		LogInternal("-MovementSpeed:" @ GetPassiveValue( MovementSpeed, GetLevel() ) * 100 $ "%");
		LogInternal("-Recoil:" @ GetPassiveValue( Recoil, GetLevel() ) * 100 $ "%");

	    LogInternal("Skill Tree");
	    LogInternal("-Shot n Move:" @ PerkSkills[EGunslingerShootnMove].bActive);
	    LogInternal("-QuickSwitch:" @ PerkSkills[EGunslingerQuickSwitch].bActive);
	    LogInternal("-RhythmMethod:" @ PerkSkills[EGunslingerRhythmMethod].bActive);
	    LogInternal("-BoneBreaker:" @ PerkSkills[EGunslingerBoneBreaker].bActive);
	    LogInternal("-SpeedReload:" @ PerkSkills[EGunslingerSpeedReload].bActive);
	    LogInternal("-Penetration:" @ PerkSkills[EGunslingerPenetration].bActive);
	    LogInternal("-CenterMass:" @ PerkSkills[EGunslingerCenterMass].bActive);
	    LogInternal("-LimbShots:" @ PerkSkills[EGunslingerLimbShots].bActive);
	    LogInternal("-Fanfare:" @ PerkSkills[EGunslingerFanfare].bActive);
	    LogInternal("-UberAmmo:" @ PerkSkills[EGunslingerUberAmmo].bActive);
	}
}

defaultproperties
{
   WeaponDamage=(Name="Weapon Damage",Increment=0.010000,MaxValue=0.250000)
   BulletResistance=(Name="Bullet Resistance",Increment=0.010000,StartingValue=0.050000,MaxValue=0.300000)
   MovementSpeed=(Name="Movement Speed",Increment=0.010000,MaxValue=0.250000)
   Recoil=(Name="Recoil",Increment=0.010000,MaxValue=0.250000)
   SpecialZedClassNames(0)="KFPawn_ZedFleshpound"
   AdditionalOnPerkWeaponNames(0)="KFWeap_Pistol_9mm"
   AdditionalOnPerkWeaponNames(1)="KFWeap_Pistol_Dual9mm"
   AdditionalOnPerkDTNames(0)="KFDT_Ballistic_9mm"
   RhythmMethodSoundReset=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Reset'
   RhythmMethodSoundHit=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Hit'
   RhythmMethodSoundTop=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Top'
   RhytmMethodRTPCName="R_Method"
   ShootnMooveBobDamp=1.110000
   MaxHeadShotComboCount=7
   ProgressStatID=80
   PerkBuildStatID=81
   SecondaryXPModifier(1)=1
   SecondaryXPModifier(2)=1
   SecondaryXPModifier(3)=1
   PerkName="Gunslinger"
   Passives(0)=(Title="Perk Weapon Damage",Description="Perk weapon damage increased by %x%")
   Passives(1)=(Title="Bullet Resistance",Description="Resistance to projectile damage increased by %x%")
   Passives(2)=(Title="Movement Speed",Description="Movement speed increased by %x%")
   Passives(3)=(Title="Recoil",Description="%x% less recoil")
   Passives(4)=()
   SkillCatagories(0)="Technique"
   SkillCatagories(1)="Skill"
   SkillCatagories(2)="Advanced Techniques"
   SkillCatagories(3)="Critical hits"
   SkillCatagories(4)="Master Techniques"
   EXPAction1="Dealing Gunslinger weapon damage"
   EXPAction2="Head shots with Gunslinger weapons"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Gunslinger'
   PerkSkills(0)=(Name="ShootnMove",StartingValue=2.000000,MaxValue=2.000000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_ShootNMove")
   PerkSkills(1)=(Name="QuickSwitch",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_QuickSwitch")
   PerkSkills(2)=(Name="RhythmMethod",StartingValue=0.100000,MaxValue=0.100000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_RhythmMethod")
   PerkSkills(3)=(Name="BoneBreaker",StartingValue=0.200000,MaxValue=0.200000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_BoneBreaker")
   PerkSkills(4)=(Name="SpeedReload",IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_SpeedReload")
   PerkSkills(5)=(Name="Penetration",StartingValue=1.000000,MaxValue=1.000000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_Penetration")
   PerkSkills(6)=(Name="CenterMass",StartingValue=1.400000,MaxValue=1.400000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_CenterMass")
   PerkSkills(7)=(Name="LimbShots",StartingValue=3.100000,MaxValue=3.100000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_LimbShots")
   PerkSkills(8)=(Name="Fanfare",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_ZEDSpeed")
   PerkSkills(9)=(Name="UberAmmo",IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_ZEDAmmo")
   ZedTimeModifyingStates(0)="WeaponFiring"
   ZedTimeModifyingStates(1)="WeaponBurstFiring"
   ZedTimeModifyingStates(2)="WeaponSingleFiring"
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_Remington1858Dual'
   KnifeWeaponDef=Class'KFGame.KFWeapDef_Knife_Gunslinger'
   GrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Gunslinger'
   HitAccuracyHandicap=-5.000000
   HeadshotAccuracyHandicap=-8.000000
   Name="Default__KFPerk_Gunslinger"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
