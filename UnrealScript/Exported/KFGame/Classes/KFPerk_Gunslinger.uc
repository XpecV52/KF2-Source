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

//`include(KFOnlineStats.uci)

//Passives
var	const				PerkSkill 				WeaponDamage;
var const				PerkSkill				BulletResistance;
var const				PerkSkill				MovementSpeed;
var const				PerkSkill				Recoil;
var	const 				PerkSkill				ZedTimeReload;

var	protected 	const	array<Name>				SpecialZedClassNames;
var	protected 	const	array<Name>				AdditionalOnPerkWeaponNames;
var	protected 	const	array<Name>				AdditionalOnPerkDTNames;
var	protected 	const	AkEvent					RhythmMethodSoundReset;
var	protected 	const	AkEvent					RhythmMethodSoundHit;
var	protected 	const	AkEvent					RhythmMethodSoundTop;
var	protected 	const 	name 					RhytmMethodRTPCName;
var	protected	const	float					QuickSwitchSpeedModifier;
var private 	const	float					QuickSwitchRecoilModifier;

/* The bob damping amount when the Shoot and Move perk skill is active */
var	private 	const	float					ShootnMooveBobDamp;

var	private		const 	array<byte>				BoneBreakerBodyParts;
var	private 	const   float					BoneBreakerDamage;
var	private 	const   float					SnarePower;

enum EGunslingerSkills
{
	EGunslingerShootnMove,
	EGunslingerQuickSwitch,
	EGunslingerRhythmMethod,
	EGunslingerBoneBreaker,
	EGunslingerPenetration,
	EGunslingerSpeedReload,
	EGunslingerSkullCracker,
	EGunslingerKnockEmDown,
	EGunslingerUberAmmo,
	EGunslingerFanfare
};

//Selectable skills
var private 			int						HeadShotComboCount;
var private 			int						HeadShotComboCountDisplay;
/** The maximum number of headshots that count toward the Rhythm Method perk skill damage multiplier */
var private const		int 					MaxHeadShotComboCount;
var private const		float 					HeadShotCountdownIntervall;
	
/*********************************************************************************************
* @name	 Perk init and spawning
******************************************************************************************** */
/**
 * @brief Weapons and perk skills can affect the jog/sprint speed
 *
 * @param Speed jog/sprint speed
  */
simulated function ModifySpeed( out float Speed )
{
	local float TempSpeed;

	TempSpeed = Speed;
	TempSpeed += Speed * GetPassiveValue( MovementSpeed, GetLevel() );

	if( IsQuickSwitchActive() )
	{
		TempSpeed += Speed * GetQuickSwitychSpeedModifier();
	}

	;
	Speed = Round( TempSpeed );
}

/**
 * @brief Modifies skill related attributes
 */
simulated protected event PostSkillUpdate()
{
	super.PostSkillUpdate();

	SetTickIsDisabled( !IsRhythmMethodActive() );

	if( Role == Role_Authority )
	{
		if( IsRhythmMethodActive() )
		{
			ServerClearHeadShotsCombo();
		}
	}
}

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

	if( (KFW != none && IsWeaponOnPerk( KFW,, self.class )) || (DamageType != none && IsDamageTypeOnPerk( DamageType )) )
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

		if( IsBoneBreakerActive() && MyKFPM != none &&
			HitShouldGiveBodyPartDamage( MyKFPM.HitZones[HitZoneIdx].Limb ) )
		{
			;
			TempDamage += Indamage * static.GetBoneBreakerDamage();
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

	if( InDamage <= 0 )
	{
		return;
	}

	TempDamage = InDamage;

	if( ClassIsChildOf(DamageType, class'KFDT_Ballistic') && TempDamage > 0 )
	{
		TempDamage -= InDamage * GetPassiveValue( BulletResistance, CurrentLevel );
	}

	;
	InDamage = Round( TempDamage );
}

/**
 * @brief Modifies the weapon's recoil
 *
 * @param CurrentRecoilModifier percent recoil lowered
 */
simulated function ModifyRecoil( out float CurrentRecoilModifier, KFWeapon KFW )
{
	if( IsWeaponOnPerk( KFW,, self.class ) )
	{
		;
		CurrentRecoilModifier -= CurrentRecoilModifier * GetPassiveValue( Recoil, GetLevel() );

		if( IsQuickSwitchActive() && !KFW.bUsingSights )
		{
			CurrentRecoilModifier *= static.GetQuickSwitchRecoilModifier();
			;
		}
	}
}

simulated private static function float GetQuickSwitchRecoilModifier()
{
	return default.QuickSwitchRecoilModifier;
} 

/**
 * @brief Modifies the reload speed for commando weapons
 *
 * @param ReloadDuration Length of the reload animation
 * @param GiveAmmoTime Time after the weapon actually gets some ammo
 */
simulated function float GetReloadRateScale( KFWeapon KFW )
{
	if( IsWeaponOnPerk( KFW,, self.class ) && WorldInfo.TimeDilation < 1.f && !IsFanFareActive() && IsZedTimeReloadAllowed() )
	{
		return 1.f -  GetPassiveValue( ZedTimeReload, GetLevel() );
	}

	return 1.f;
}

/**
 * @brief For modes that disable zed time skill tiers, also disable zed time reload
 */
simulated function bool IsZedTimeReloadAllowed()
{
    return MyKFGRI != none ? (MyKFGRI.MaxPerkLevel == MyKFGRI.default.MaxPerkLevel) : false;
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
	return IsSpeedReloadActive() && IsWeaponOnPerk( KFW,, self.class );
}

/**
 * @brief Skills can can chnage the knock down power
 * @return knock down power in %
 */
function float GetKnockdownPowerModifier( optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting=false )
{
	if( IsKnockEmDownActive() && HitShouldKnockdown( BodyPart ) && bIsSprinting )
	{
		;
		return GetSkillValue( PerkSkills[EGunslingerKnockEmDown] );
	}

	return 0.f;
}

/**
 * @brief skills and weapons can modify the stumbling power
 * @return stumpling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart )
{
	if( IsKnockEmDownActive() && ( HitShouldStumble( BodyPart ) || CheckSpecialZedBodyPart( KFP.class, BodyPart )) )
	{
		;
        return GetSkillValue( PerkSkills[EGunslingerKnockEmDown] );
	}

	return 0.f;
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

	if( GetFanfareActive() && IsWeaponOnPerk( W,, self.class ) )
	{
		StateName = W.GetStateName();
		if( ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
		{
			;
			return GetSkillValue( PerkSkills[EGunslingerFanfare] );
		}

		if( StateName == 'Reloading' )
		{
			return 1.f;
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
	return IsWeaponOnPerk( KFW,, self.class ) && IsUberAmmoActive() && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief A head shot happened - count it if the damage type is on perk
 *
 * @param KFDT Damage type of the weapon used
 */
function AddToHeadShotCombo( class<KFDamageType> KFDT, KFPawn_Monster KFPM )
{
	if( IsDamageTypeOnPerk( KFDT ) )
	{
		++HeadShotComboCount;
		HeadShotComboCountDisplay++;
		HeadShotComboCount = Min( HeadShotComboCount, MaxHeadShotComboCount );
		HeadShotMessage( HeadShotComboCount, HeadShotComboCountDisplay,, KFPM );
		SetTimer( HeadShotCountdownIntervall, true, nameOf( SubstractHeadShotCombo ) );
	}
}

function UpdatePerkHeadShots( ImpactInfo Impact, class<DamageType> DamageType, int NumHit )
{
   	local int HitZoneIdx;
   	local KFPawn_Monster KFPM;

   	if( !IsRhythmMethodActive() )
	{
		return;
	}

   	KFPM = KFPawn_Monster(Impact.HitActor);
   	if( KFPM != none && !KFPM.bIsHeadless )
   	{
	   	HitZoneIdx = KFPM.HitZones.Find('ZoneName', Impact.HitInfo.BoneName);
	   	if( HitZoneIdx == HZI_Head && KFPM != none && KFPM.IsAliveAndWell() )
		{
			AddToHeadShotCombo( class<KFDamageType>(DamageType), KFPM  );
		}
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
		case 1:	case 2:	case 3:	
		case 4:	
			if( !bMissed )
			{
				//OwnerPC.ClientSpawnCameraLensEffect(class'KFCameraLensEmit_RackemHeadShot');
				TempAkEvent = RhythmMethodSoundHit;
			}
			break;
		case 5:
			if( !bMissed )
			{
				//OwnerPC.ClientSpawnCameraLensEffect(class'KFCameraLensEmit_RackemHeadShotPing');
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
	else if( HeadShotComboCount <= 0 )
	{
		ClearTimer( nameOf( SubstractHeadShotCombo ) );
	}
}

reliable private final server function ServerClearHeadShotsCombo()
{
	HeadShotComboCountDisplay = 0;
	HeadShotComboCount = 0;
	HeadShotMessage( HeadShotComboCount, HeadShotComboCountDisplay );
	ClearTimer( nameOf( SubstractHeadShotCombo ) );
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
	if( IsShootnMooveActive() && IsWeaponOnPerk( KFW,, self.class ) )
	{
		;
		return  GetSkillValue( PerkSkills[EGunslingerShootnMove] );
	}

	return 1.f;
}

simulated function ModifyWeaponBopDamping( out float BobDamping, KFWeapon PawnWeapon )
{
	If( IsShootnMooveActive() && IsWeaponOnPerk( PawnWeapon,, self.class ) )
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

private function bool HitShouldGiveBodyPartDamage( byte BodyPart ) 
{
	return BoneBreakerBodyParts.Find( BodyPart ) != INDEX_NONE;
}

private static function float GetBoneBreakerDamage()
{
	return default.BoneBreakerDamage;
}

simulated function bool IgnoresPenetrationDmgReduction()
{
	return IsPenetrationActive();
}

simulated function float GetSnarePowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx )
{
	if( IsSkullCrackerActive() && 
		DamageType != none && 
		IsDamageTypeOnPerk( class<KFDamageType>(DamageType) ) &&
		HitZoneIdx == HZI_Head )
	{
		return default.SnarePower;
	}

	return 0.f;
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
	return PerkSkills[EGunslingerShootnMove].bActive && IsPerkLevelAllowed(EGunslingerShootnMove);
}

/**
 * @brief Checks if the Quick Switch skill is active
 *
 * @return true/false
 */
simulated function bool IsQuickSwitchActive()
{
	return PerkSkills[EGunslingerQuickSwitch].bActive && IsPerkLevelAllowed(EGunslingerQuickSwitch);
}

/**
 * @brief Checks if the Rhythm Method skill is active
 *
 * @return true/false
 */
simulated function bool IsRhythmMethodActive()
{
	return PerkSkills[EGunslingerRhythmMethod].bActive && IsPerkLevelAllowed(EGunslingerRhythmMethod);
}

/**
 * @brief Checks if the Bone Breaker skill is active
 *
 * @return true/false
 */
function bool IsBoneBreakerActive()
{
	return PerkSkills[EGunslingerBoneBreaker].bActive && IsPerkLevelAllowed(EGunslingerBoneBreaker);
}

/**
 * @brief Checks if the Speed Reload skill is active
 *
 * @return true/false
 */
simulated function bool IsSpeedReloadActive()
{
	return PerkSkills[EGunslingerSpeedReload].bActive && IsPerkLevelAllowed(EGunslingerSpeedReload);
}

/**
 * @brief Checks if the Quick Shoot skill is active
 *
 * @return true/false
 */
simulated function bool IsPenetrationActive()
{
	return PerkSkills[EGunslingerPenetration].bActive && IsPerkLevelAllowed(EGunslingerPenetration);
}

/**
 * @brief Checks if the Knock'em Down skill is active
 *
 * @return true/false
 */
simulated function bool IsKnockEmDownActive()
{
	return PerkSkills[EGunslingerKnockEmDown].bActive && IsPerkLevelAllowed(EGunslingerKnockEmDown);
}

/**
 * @brief Checks if the Fanfare skill is active
 *
 * @return true/false
 */
simulated function bool IsFanfareActive()
{
	return PerkSkills[EGunslingerFanfare].bActive && IsPerkLevelAllowed(EGunslingerFanfare);
}

/**
 * @brief Checks if the Fanfare skill is active and if we are in zed time
 *
 * @return true/false
 */
simulated function bool GetFanfareActive()
{
	return IsFanfareActive();
}

/**
 * @brief Checks if the Uber Ammo skill is active
 *
 * @return true/false
 */
simulated function bool IsUberAmmoActive()
{
	return PerkSkills[EGunslingerUberAmmo].bActive && IsPerkLevelAllowed(EGunslingerUberAmmo);
}

simulated function bool IsSkullCrackerActive()
{
	return PerkSkills[EGunslingerSkullCracker].bActive && IsPerkLevelAllowed(EGunslingerSkullCracker);
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
static simulated function bool IsWeaponOnPerk( KFWeapon W, optional array < class<KFPerk> > WeaponPerkClass, optional class<KFPerk> InstigatorPerkClass, optional name WeaponClassName )
{
	if( W != none && default.AdditionalOnPerkWeaponNames.Find( W.class.name ) != INDEX_NONE )
	{
		return true;
	}
    else if (WeaponClassName != '' && default.AdditionalOnPerkWeaponNames.Find(WeaponClassName) != INDEX_NONE)
    {
        return true;
    }

	return super.IsWeaponOnPerk( W, WeaponPerkClass, InstigatorPerkClass, WeaponClassName );
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


simulated static private function float GetQuickSwitychSpeedModifier()
{
	return default.QuickSwitchSpeedModifier;
}


event Destroyed()
{
	if( Role == Role_Authority )
	{
		ServerClearHeadShotsCombo();
	}
}

simulated function PlayerDied()
{
	if( Role == Role_Authority )
	{
		ServerClearHeadShotsCombo();
	}
}

/*********************************************************************************************
* @name	 UI
********************************************************************************************* */

static function int GetMaxHeadShotsValue()
{
	return default.MaxHeadShotComboCount;
}

simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Round( GetPassiveValue( default.WeaponDamage, Level ) * 100 ) $ "%";
	PassiveValues[1] = Round( GetPassiveValue( default.BulletResistance, Level ) * 100 ) $ "%";
	PassiveValues[2] = Round( GetPassiveValue( default.MovementSpeed, Level ) * 100 ) $ "%";
	PassiveValues[3] = Round( GetPassiveValue( default.Recoil, Level ) * 100 ) $ "%";
	PassiveValues[4] = Round( GetPassiveValue( default.ZedTimeReload, Level ) * 100 ) $ "%";

	Increments[0] = "[" @ Left( string( default.WeaponDamage.Increment * 100 ), InStr(string(default.WeaponDamage.Increment * 100), ".") + 2 )  $ "% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ "5% +" @ Left( string( default.BulletResistance.Increment * 100 ), InStr(string(default.BulletResistance.Increment * 100), ".") + 2 )  $ "% /" @ default.LevelString @ "]";
	Increments[2] = "[" @ Left( string( default.MovementSpeed.Increment * 100 ), InStr(string(default.MovementSpeed.Increment * 100), ".") + 2 )  $ "% /" @ default.LevelString @ "]";
	Increments[3] = "[" @ Left( string( default.Recoil.Increment * 100 ), InStr(string(default.Recoil.Increment * 100), ".") + 2 )  $ "% /" @ default.LevelString @ "]";
	Increments[4] = "[" @ Left( string( default.ZedTimeReload.Increment * 100 ), InStr(string(default.ZedTimeReload.Increment * 100), ".") + 2 )  $ "% /" @ default.LevelString @ "]";
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
	    //`log( "-CenterMass:" @ PerkSkills[EGunslingerCenterMass].bActive );
	    //`log( "-LimbShots:" @ PerkSkills[EGunslingerLimbShots].bActive );
	    LogInternal("-Fanfare:" @ PerkSkills[EGunslingerFanfare].bActive);
	    LogInternal("-UberAmmo:" @ PerkSkills[EGunslingerUberAmmo].bActive);
	}
}

defaultproperties
{
   WeaponDamage=(Name="Weapon Damage",Increment=0.010000,MaxValue=0.250000)
   BulletResistance=(Name="Bullet Resistance",Increment=0.010000,StartingValue=0.050000,MaxValue=0.300000)
   MovementSpeed=(Name="Movement Speed",Increment=0.008000,MaxValue=0.200000)
   Recoil=(Name="Recoil",Increment=0.010000,MaxValue=0.250000)
   ZedTimeReload=(Name="Zed Time Reload",Increment=0.030000,MaxValue=0.750000)
   SpecialZedClassNames(0)="KFPawn_ZedFleshpound"
   AdditionalOnPerkWeaponNames(0)="KFWeap_Pistol_9mm"
   AdditionalOnPerkWeaponNames(1)="KFWeap_Pistol_Dual9mm"
   AdditionalOnPerkWeaponNames(2)="KFWeap_GrenadeLauncher_HX25"
   AdditionalOnPerkDTNames(0)="KFDT_Ballistic_9mm"
   AdditionalOnPerkDTNames(1)="KFDT_Ballistic_Pistol_Medic"
   AdditionalOnPerkDTNames(2)="KFDT_Ballistic_Winchester"
   AdditionalOnPerkDTNames(3)="KFDT_Ballistic_HX25Impact"
   AdditionalOnPerkDTNames(4)="KFDT_Ballistic_HX25SubmunitionImpact"
   RhythmMethodSoundReset=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Reset'
   RhythmMethodSoundHit=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Hit'
   RhythmMethodSoundTop=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Top'
   RhytmMethodRTPCName="R_Method"
   QuickSwitchSpeedModifier=0.050000
   QuickSwitchRecoilModifier=0.500000
   ShootnMooveBobDamp=1.110000
   BoneBreakerBodyParts(0)=2
   BoneBreakerBodyParts(1)=3
   BoneBreakerBodyParts(2)=4
   BoneBreakerBodyParts(3)=5
   BoneBreakerDamage=0.300000
   SnarePower=100.000000
   MaxHeadShotComboCount=5
   HeadShotCountdownIntervall=2.000000
   ProgressStatID=80
   PerkBuildStatID=81
   SecondaryXPModifier(1)=1
   SecondaryXPModifier(2)=1
   SecondaryXPModifier(3)=1
   PerkName="Gunslinger"
   Passives(0)=(Title="Perk Weapon Damage",Description="Increase perk weapon damage %x% per level")
   Passives(1)=(Title="Bullet Resistance",Description="Increase resistance to projectile damage 5% plus %x% per level")
   Passives(2)=(Title="Movement Speed",Description="Increase movement speed %x% every five levels")
   Passives(3)=(Title="Recoil",Description="Reduce perk weapon recoil %x% per level")
   Passives(4)=(Title="Zedtime Reload",Description="Increase reload speed in Zed time %x% per level")
   SkillCatagories(0)="Techniques"
   SkillCatagories(1)="Skill"
   SkillCatagories(2)="Advanced Techniques"
   SkillCatagories(3)="Critical hits"
   SkillCatagories(4)="Master Techniques"
   EXPAction1="Dealing Gunslinger weapon damage"
   EXPAction2="Head shots with Gunslinger weapons"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Gunslinger'
   PerkSkills(0)=(Name="ShootnMove",StartingValue=2.000000,MaxValue=2.000000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_Steady")
   PerkSkills(1)=(Name="QuickSwitch",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_QuickSwitch")
   PerkSkills(2)=(Name="RhythmMethod",StartingValue=0.100000,MaxValue=0.100000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_RackEmUp")
   PerkSkills(3)=(Name="BoneBreaker",StartingValue=0.200000,MaxValue=0.200000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_BoneBreaker")
   PerkSkills(4)=(Name="Penetration",StartingValue=1.000000,MaxValue=1.000000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_LineEmUp")
   PerkSkills(5)=(Name="SpeedReload",IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_SpeedReload")
   PerkSkills(6)=(Name="Skullcracker",StartingValue=2.000000,MaxValue=2.000000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_Skullcracker")
   PerkSkills(7)=(Name="KnockEmDown",StartingValue=4.100000,MaxValue=4.100000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_KnockEmDown")
   PerkSkills(8)=(Name="UberAmmo",IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_ZEDAmmo")
   PerkSkills(9)=(Name="Fanfare",StartingValue=1.000000,MaxValue=1.000000,IconPath="UI_PerkTalent_TEX.Gunslinger.UI_Talents_Gunslinger_ZEDSpeed")
   ZedTimeModifyingStates(0)="WeaponFiring"
   ZedTimeModifyingStates(1)="WeaponBurstFiring"
   ZedTimeModifyingStates(2)="WeaponSingleFiring"
   ZedTimeModifyingStates(3)="WeaponSingleFireAndReload"
   ZedTimeModifyingStates(4)="Reloading"
   ZedTimeModifyingStates(5)="AltReloading"
   BodyPartsCanStumble(0)=0
   BodyPartsCanStumble(1)=2
   BodyPartsCanStumble(2)=0
   BodyPartsCanStumble(3)=3
   BodyPartsCanKnockDown(0)=4
   BodyPartsCanKnockDown(1)=5
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_Remington1858Dual'
   KnifeWeaponDef=Class'KFGame.KFWeapDef_Knife_Gunslinger'
   GrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Gunslinger'
   AutoBuyLoadOutPath(0)=Class'KFGame.KFWeapDef_Remington1858'
   AutoBuyLoadOutPath(1)=Class'KFGame.KFWeapDef_Remington1858Dual'
   AutoBuyLoadOutPath(2)=Class'KFGame.KFWeapDef_Colt1911'
   AutoBuyLoadOutPath(3)=Class'KFGame.KFWeapDef_Colt1911Dual'
   AutoBuyLoadOutPath(4)=Class'KFGame.KFWeapDef_Deagle'
   AutoBuyLoadOutPath(5)=Class'KFGame.KFWeapDef_DeagleDual'
   AutoBuyLoadOutPath(6)=Class'KFGame.KFWeapDef_SW500'
   AutoBuyLoadOutPath(7)=Class'KFGame.KFWeapDef_SW500Dual'
   HitAccuracyHandicap=-5.000000
   HeadshotAccuracyHandicap=-8.000000
   Name="Default__KFPerk_Gunslinger"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
