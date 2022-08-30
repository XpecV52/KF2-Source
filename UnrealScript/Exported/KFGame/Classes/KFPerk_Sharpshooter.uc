//=============================================================================
// KFPerk_Sharpshooter
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber and Jeff Robinson
//=============================================================================

class KFPerk_Sharpshooter extends KFPerk
	native;


//`include(KFOnlineStats.uci)

var private const PerkSkill		HeadshotDamage;
var private	const PerkSkill		Recoil;
var private	const PerkSkill		WeaponSwitchSpeed;
var private	const AkEvent		RhythmMethodSoundReset;
var private	const AkEvent		RhythmMethodSoundHit;
var private	const AkEvent		RhythmMethodSoundTop;
var private	const name 			RhytmMethodRTPCName;

enum ESharpshooterPerkSkills
{
	ESharpshooterStationaryAim,		
	ESharpshooterTrigger,			
	ESharpshooterCrouchAim,			
	ESharpshooterStun,				
	ESharpshooterRhythmMethod,		
	ESharpshooterTacticalReload,	
	ESharpshooterScoped,			
	ESharpshooterAmmoPouch,			
	ESharpshooterZTKnockdown,		
	ESharpshooterZTStun				
};

var private 	  int			HeadShotComboCount;
var private 	  int			HeadShotComboCountDisplay;
var private const float 		HeadShotCountdownIntervall;
var private const int 			MaxHeadShotComboCount;
var private const float 		CameraViewShakeScale;
var private const float 		TriggerMovementSpeedModifier;
var private const float 		CrouchAimMovementSpeedModifier;
var private const float 		CrouchAimReloadSpeedModifier;
var	private const array<Name>	AdditionalOnPerkWeaponNames;
var	private const array<Name>	AdditionalOnPerkDTNames;

/** The % chance that zed time will be activated when damage is done when the Zed Time perk skills are active */
var float SkillZedTimeChance;

/*********************************************************************************************
* @name	 Stats/XP
********************************************************************************************* */

simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Round(GetPassiveValue( default.HeadshotDamage, Level ) * 100) $ "%";
	PassiveValues[1] = Round(GetPassiveValue( default.Recoil, Level ) * 100) $ "%";
	PassiveValues[2] = Round(GetPassiveValue( default.WeaponSwitchSpeed, Level ) * 100) $ "%";
	PassiveValues[3] = "";
	PassiveValues[4] = "";

	Increments[0] = "[" @ Left( string( default.HeadshotDamage.Increment * 100 ), InStr(string(default.HeadshotDamage.Increment * 100), ".") + 2 )$"% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ Left( string( default.Recoil.Increment * 100 ), InStr(string(default.Recoil.Increment * 100), ".") + 2 )$ "% /" @ default.LevelString @ "]";
	Increments[2] = "[" @ Left( string( default.WeaponSwitchSpeed.Increment * 100 ), InStr(string(default.WeaponSwitchSpeed.Increment * 100), ".") + 2 )$ "% /" @ default.LevelString @ "]";
	Increments[3] = "";
	Increments[4] = "";
}

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

/**
 * @brief Weapons and perk skills can affect the jog/sprint speed
 *
 * @param Speed jog/sprint speed
  */
simulated function ModifySpeed( out float Speed )
{
	if( IsTriggerActive() )
	{
		;
		Speed += Speed * static.GetTriggerMovementSpeedModifier();
	}

	if( IsCrouchAimActive(GetOwnerWeapon()) )
	{
		;
		Speed += Speed * static.GetCrouchAimMovementSpeedModifier();	
	}
}

/**
 * @brief The Quick Switch skill modifies the weapon switch speed
 *
 * @param ModifiedSwitchTime Duration of putting down or equipping the weapon
 */
simulated function ModifyWeaponSwitchTime( out float ModifiedSwitchTime )
{
	;
	ModifiedSwitchTime *= (1.f - GetPassiveValue(WeaponSwitchSpeed, CurrentLevel));
}

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

	if( (KFW != none && IsWeaponOnPerk( KFW,, self.class )) || (DamageType != none && IsDamageTypeOnPerk(DamageType)) )
	{
		if( MyKFPM != none && HitZoneIdx == HZI_HEAD )
		{
			;
			TempDamage += InDamage * GetPassiveValue( HeadshotDamage, CurrentLevel );

			if( GetScopedActive(KFW) )
			{
				;
				TempDamage += InDamage * GetSkillValue( PerkSkills[ESharpshooterScoped] );
			}

			// cause dramatic event during damage so that perk's zed time modifications to incaps can happen same frame
			if( IsZTKnockdownActive() || IsZTStunActive() )
			{
				if( MyKFGI != none )
				{
					MyKFGI.DramaticEvent( SkillZedTimeChance );
				}
			}

			if( GetZTKnockdownActive() )
			{
				;
				TempDamage += InDamage * GetSkillValue( PerkSkills[ESharpshooterZTKnockdown] );
			}
		}

		if( IsStationaryAimActive() && VSizeSq(OwnerPawn.Velocity) <= 0 )
		{
			;
			TempDamage += InDamage * GetSkillValue( PerkSkills[ESharpshooterStationaryAim] );
		}

		if( IsCrouchAimActive(GetOwnerWeapon()) )
		{
			;
			TempDamage += InDamage * GetSkillValue( PerkSkills[ESharpshooterCrouchAim] );
		}

		if( IsRhythmMethodActive() && HeadShotComboCount > 0 )
		{
			;
			TempDamage += Indamage * GetSkillValue( PerkSkills[ESharpshooterRhythmMethod] ) * HeadShotComboCount;
		}
	}

	;
	InDamage = FCeil( TempDamage );
}

/**
 * @brief The Quick Shot skill allows you to shoot faster
 *
 * @param InRate delay between shots
 * @param KFW Equipped weapon
 *
 */
simulated function ModifyRateOfFire( out float InRate, KFWeapon KFW )
{
	if( IsTriggerActive() && IsWeaponOnPerk( KFW,, self.class ) )
	{
		;
		InRate -= InRate * GetSkillValue( PerkSkills[ESharpshooterTrigger] );
	}
}

/**
 * @brief Modifies the reload speed for sharpshooter weapons
 *
 * @param ReloadDuration Length of the reload animation
 * @param GiveAmmoTime Time after the weapon actually gets some ammo
 */
simulated function float GetReloadRateScale( KFWeapon KFW )
{
	if( IsCrouchAimActive(KFW) )
	{
		;
		return 1.f - GetCrouchAimReloadSpeedModifier();
	}

	return 1.f;
}

/**
 * @brief Modifies the weapon's recoil
 *
 * @param CurrentRecoilModifier percent recoil lowered
 */
simulated function ModifyRecoil( out float CurrentRecoilModifier, KFWeapon KFW )
{
    if (IsWeaponOnPerk(KFW, , self.class))
    {
        CurrentRecoilModifier -= CurrentRecoilModifier * GetPassiveValue(Recoil, CurrentLevel);

        if (GetScopedActive(KFW))
        {
            ;
            CurrentRecoilModifier -= CurrentRecoilModifier * GetSkillValue(PerkSkills[ESharpshooterScoped]);
        }
    }	
}

simulated event float GetCameraViewShakeModifier( KFWeapon OwnerWeapon )
{
	if( GetScopedActive( OwnerWeapon ) )
	{
		return static.GetCameraViewShakeScale();
	}

	return 1;
}

simulated final static function float GetCameraViewShakeScale()
{
	return default.CameraViewShakeScale;
}

/**
 * @brief Modifies the max spare ammo
 *
 * @param KFW The weapon
 * @param MaxSpareAmmo ammo amount
 * @param TraderItem the weapon's associated trader item info
 */
simulated function ModifyMaxSpareAmmoAmount( KFWeapon KFW, out int MaxSpareAmmo, optional const out STraderItem TraderItem, optional bool bSecondary=false )
{
	local float TempMaxSpareAmmoAmount;

	if( IsAmmoPouchActive() && IsWeaponOnPerk( KFW, TraderItem.AssociatedPerkClasses, self.class, TraderItem.ClassName ) )
	{
		TempMaxSpareAmmoAmount = MaxSpareAmmo;
		TempMaxSpareAmmoAmount += TempMaxSpareAmmoAmount * GetSkillValue( PerkSkills[ESharpshooterAmmoPouch] );
		MaxSpareAmmo = Round( TempMaxSpareAmmoAmount );
	}
}

/**
 * @brief Applies skill specific changes after new skills were selected
  */
simulated protected event PostSkillUpdate()
{
	if( IsAmmoPouchActive() )
	{
		MaxGrenadeCount = default.MaxGrenadeCount + default.MaxGrenadeCount * GetSkillValue( PerkSkills[ESharpshooterAmmoPouch] );
	}
	else
	{
		MaxGrenadeCount = default.MaxGrenadeCount;
	}

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

event Destroyed()
{
	if( Role == Role_Authority )
	{
		ServerClearHeadShotsCombo();
	}
}

/**
 * @brief Should the tactical reload skill adjust the reload speed
 *
 * @param KFW weapon in use
 * @return true/false
 */
simulated function bool GetUsingTactialReload( KFWeapon KFW )
{
	;
	return IsTacticalReloadActive() && (IsWeaponOnPerk( KFW, , self.class) || IsBackupWeapon( KFW ));
}

/**
 * @brief skills and weapons can modify the stun power
 * @return stun power modifier
 */
function float GetStunPowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx )
{
	if( IsDamageTypeOnPerk(class<KFDamageType>(DamageType)) )
	{
		if( HitZoneIdx == HZI_Head && GetZTStunActive() )
		{
			;
			return GetSkillValue( PerkSkills[ESharpshooterZTStun] );
		}
		else if( IsStunActive() )
		{
			;
        	return GetSkillValue( PerkSkills[ESharpshooterStun] );
		}
	}

    return 0.f;
}

/**
 * @brief Checks if the Stationary Aim skill is active
 *
 * @return true/false
 */
function bool IsStationaryAimActive()
{
	return PerkSkills[ESharpshooterStationaryAim].bActive && IsPerkLevelAllowed(ESharpshooterStationaryAim);
}

/**
 * @brief Checks if the Trigger skill is active
 *
 * @return true/false
 */
simulated function bool IsTriggerActive()
{
	return PerkSkills[ESharpshooterTrigger].bActive && IsPerkLevelAllowed(ESharpshooterTrigger);
}

/**
 * @brief Checks if the Crouch Aim skill is active
 *
 * @return true/false
 */
simulated function bool IsCrouchAimActive( KFWeapon W )
{
	return PerkSkills[ESharpshooterCrouchAim].bActive && CheckOwnerPawn() && OwnerPawn.bIsCrouched && IsWeaponOnPerk( W,, self.class ) && IsPerkLevelAllowed(ESharpshooterCrouchAim);
}

/**
 * @brief Checks if the Stun skill is active
 *
 * @return true/false
 */
simulated function bool IsStunActive()
{
	return PerkSkills[ESharpshooterStun].bActive && IsPerkLevelAllowed(ESharpshooterStun);
}

/**
 * @brief Checks if the Rhythm Method skill is active
 *
 * @return true/false
 */
simulated function bool IsRhythmMethodActive()
{
	return PerkSkills[ESharpshooterRhythmMethod].bActive && IsPerkLevelAllowed(ESharpshooterRhythmMethod);
}

/**
 * @brief Checks if the Tactical Reload skill is active
 *
 * @return true/false
 */
simulated function bool IsTacticalReloadActive()
{
	return PerkSkills[ESharpshooterTacticalReload].bActive && IsPerkLevelAllowed(ESharpshooterTacticalReload);
}

/**
 * @brief Checks if the Speed Freak skill is active
 *
 * @return true/false
 */
simulated function bool IsScopedActive()
{
	return PerkSkills[ESharpshooterScoped].bActive && IsPerkLevelAllowed(ESharpshooterScoped);
}

simulated function bool GetScopedActive( KFWeapon KFW )
{
	return IsScopedActive() && KFW != none && KFW.bUsingSights;
}

/**
 * @brief Checks if the Deep Freeze skill is active
 *
 * @return true/false
 */
simulated function bool IsAmmoPouchActive()
{
	return PerkSkills[ESharpshooterAmmoPouch].bActive && IsPerkLevelAllowed(ESharpshooterAmmoPouch);
}

/**
 * @brief Checks if the Knockdown skill is active
 *
 * @return true/false
 */
simulated function bool IsZTKnockdownActive()
{
	return PerkSkills[ESharpshooterZTKnockdown].bActive && IsPerkLevelAllowed(ESharpshooterZTKnockdown);
}

/**
 * @brief Checks if the Speed Freak skill is active and if we are in zed time
 *
 * @return true/false
 */
simulated function bool GetZTKnockdownActive()
{
	return IsZTKnockdownActive() && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Checks if the ZTStun skill is active
 *
 * @return true/false
 */
simulated function bool IsZTStunActive()
{
	return PerkSkills[ESharpshooterZTStun].bActive && IsPerkLevelAllowed(ESharpshooterZTStun);
}

/**
 * @brief Checks if the Speed Freak skill is active and if we are in zed time
 *
 * @return true/false
 */
simulated function bool GetZTStunActive()
{
	return IsZTStunActive() && WorldInfo.TimeDilation < 1.f;
}

static function int GetMaxHeadShotComboCount()
{
	return default.MaxHeadShotComboCount;
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

simulated private static function float GetTriggerMovementSpeedModifier()
{
	return default.TriggerMovementSpeedModifier;
}

simulated private static function float GetCrouchAimMovementSpeedModifier()
{
	return default.CrouchAimMovementSpeedModifier;
}

simulated private static function float GetCrouchAimReloadSpeedModifier()
{
	return default.CrouchAimReloadSpeedModifier;
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

defaultproperties
{
   HeadshotDamage=(Name="Headshot Damage",Increment=0.010000,MaxValue=0.250000)
   Recoil=(Name="Recoil",Increment=0.010000,MaxValue=0.250000)
   WeaponSwitchSpeed=(Name="Weapon Switch Speed",Increment=0.020000,MaxValue=0.500000)
   RhythmMethodSoundReset=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Reset'
   RhythmMethodSoundHit=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Hit'
   RhythmMethodSoundTop=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Top'
   RhytmMethodRTPCName="R_Method"
   HeadShotCountdownIntervall=2.000000
   MaxHeadShotComboCount=5
   CameraViewShakeScale=0.500000
   TriggerMovementSpeedModifier=0.100000
   CrouchAimMovementSpeedModifier=0.500000
   CrouchAimReloadSpeedModifier=0.200000
   AdditionalOnPerkWeaponNames(0)="KFWeap_Pistol_9mm"
   AdditionalOnPerkWeaponNames(1)="KFWeap_Pistol_Dual9mm"
   AdditionalOnPerkWeaponNames(2)="KFWeap_Revolver_Rem1858"
   AdditionalOnPerkWeaponNames(3)="KFWeap_Revolver_SW500"
   AdditionalOnPerkDTNames(0)="KFDT_Ballistic_9mm"
   AdditionalOnPerkDTNames(1)="KFDT_Ballistic_SW500"
   AdditionalOnPerkDTNames(2)="KFDT_Ballistic_Rem1858"
   SkillZedTimeChance=0.050000
   ProgressStatID=50
   PerkBuildStatID=51
   SecondaryXPModifier(1)=1
   SecondaryXPModifier(2)=1
   SecondaryXPModifier(3)=1
   PerkName="Sharpshooter"
   Passives(0)=(Title="Headshot Damage",Description="Increase headshot damage %x% per level")
   Passives(1)=(Title="Recoil",Description="Decrease recoil %x% per level")
   Passives(2)=(Title="Weapon Switch",Description="Increase weapon switch speed %x% per level")
   Passives(3)=()
   Passives(4)=()
   SkillCatagories(0)="Movement"
   SkillCatagories(1)="Basic Technique"
   SkillCatagories(2)="Skill"
   SkillCatagories(3)="Equipment"
   SkillCatagories(4)="Master Techniques"
   EXPAction1="Dealing Sharpshooter weapon damage"
   EXPAction2="Head shots with Sharpshooter weapons"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Sharpshooter'
   AssistDoshModifier=1.100000
   PerkSkills(0)=(Name="StationaryAim",StartingValue=0.250000,MaxValue=0.250000,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_StationaryAim")
   PerkSkills(1)=(Name="Trigger",StartingValue=0.250000,MaxValue=0.250000,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_Trigger")
   PerkSkills(2)=(Name="CrouchAim",StartingValue=0.300000,MaxValue=0.300000,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_CrouchAim")
   PerkSkills(3)=(Name="Stun",StartingValue=1.000000,MaxValue=1.000000,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_Stun")
   PerkSkills(4)=(Name="RhythmMethod",StartingValue=0.100000,MaxValue=0.100000,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_RackUmUp")
   PerkSkills(5)=(Name="TacticalReload",IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_TacticalReload")
   PerkSkills(6)=(Name="Scoped",StartingValue=0.100000,MaxValue=0.100000,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_Scoped")
   PerkSkills(7)=(Name="AmmoPouch",StartingValue=0.250000,MaxValue=0.250000,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_AmmoPouch")
   PerkSkills(8)=(Name="ZTKnockdown",StartingValue=0.350000,MaxValue=0.350000,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_ZED-KnockDown")
   PerkSkills(9)=(Name="ZTStun",StartingValue=4.000000,MaxValue=4.000000,IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_ZED-Stun")
   ZedTimeModifyingStates(0)="WeaponFiring"
   ZedTimeModifyingStates(1)="WeaponBurstFiring"
   ZedTimeModifyingStates(2)="WeaponSingleFiring"
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_Winchester1894'
   KnifeWeaponDef=Class'KFGame.KFWeapDef_Knife_SharpShooter'
   GrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Sharpshooter'
   AutoBuyLoadOutPath(0)=Class'KFGame.KFWeapDef_Winchester1894'
   AutoBuyLoadOutPath(1)=Class'KFGame.KFWeapDef_Crossbow'
   AutoBuyLoadOutPath(2)=Class'KFGame.KFWeapDef_M14EBR'
   AutoBuyLoadOutPath(3)=Class'KFGame.KFWeapDef_RailGun'
   AutoBuyLoadOutPath(4)=Class'KFGame.KFWeapDef_M99'
   HitAccuracyHandicap=-9.000000
   HeadshotAccuracyHandicap=-16.000000
   PrestigeRewardItemIconPaths(0)="WEP_SkinSet_Prestige01_Item_TEX.knives.SharpshooterKnife_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(1)="WEP_SkinSet_Prestige02_Item_TEX.tier01.Winchester1894_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(2)="WEP_skinset_prestige03_itemtex.tier02.Crossbow_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(3)="wep_skinset_prestige04_itemtex.tier03.M14EBR_PrestigePrecious_Mint_Large"
   PrestigeRewardItemIconPaths(4)="WEP_SkinSet_Prestige05_Item_TEX.tier04.Railgun_PrestigePrecious_Mint_large"
   Name="Default__KFPerk_Sharpshooter"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
