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


`include(KFOnlineStats.uci)

//Passives
var 		const				PerkSkill				HeadshotDamage;
var 		const				PerkSkill				Recoil;
var 		const				PerkSkill				WeaponSwitchSpeed;

var 		protected 	const	AkEvent					RhythmMethodSoundReset;
var 		protected 	const	AkEvent					RhythmMethodSoundHit;
var 		protected 	const	AkEvent					RhythmMethodSoundTop;

var 		protected 	const 	name 					RhytmMethodRTPCName;

enum ESharpshooterPerkSkills
{
	ESharpshooterStationaryAim,		// 10% more damage in ironsights when standing still
	ESharpshooterTrigger,			// 10% faster firing, 10% faster movement
	ESharpshooterCrouchAim,			// 10% more damage in ironsights when crouched
	ESharpshooterStun,				// 30% more stun power with perk weapons
	ESharpshooterRhythmMethod,		// 5% more damage per consecutive headshot (up to 50%, resets on miss)
	ESharpshooterTacticalReload,	// Play tactical reload anims
	ESharpshooterScoped,			// 10% less recoil and 10% more damage on headshots when in scope or sights
	ESharpshooterAmmoPouch,			// 25% more ammo and grenades
	ESharpshooterZTKnockdown,		// Headshots with perk weapons cause knockdown in Zed Time
	ESharpshooterZTStun				// Headshots with perk weapons cause stun in Zed Time
};

//Selectable skills
var 		private 		int							HeadShotComboCount;
var 		private 		int							HeadShotComboCountDisplay;
var 		private const	int 						MaxHeadShotComboCount;

var 		private const 	float 						CameraViewShakeScale;

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
	PassiveValues[5] = "";

	Increments[0] = "[" @ int(default.HeadshotDamage.Increment * 100) $"% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ int(default.Recoil.Increment * 100)  $ "% /" @ default.LevelString @ "]";
	Increments[2] = "[" @ int(default.WeaponSwitchSpeed.Increment * 100) $ "% /" @ default.LevelString @ "]";
	Increments[3] = "";
	Increments[4] = "";
	Increments[5] = "";
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
	if( IsTriggerActive() )// && IsWeaponOnPerk( KFW ) )
	{
		`QALog( "(Trigger) speed" @ Speed @ GetPercentage(Speed, (Speed * (1.f + PerkSkills[ESharpshooterTrigger].MaxValue))), bLogPerk );
		Speed *= (1.f + PerkSkills[ESharpshooterTrigger].MaxValue);
	}
}

/**
 * @brief The Quick Switch skill modifies the weapon switch speed
 *
 * @param ModifiedSwitchTime Duration of putting down or equipping the weapon
 */
simulated function ModifyWeaponSwitchTime( out float ModifiedSwitchTime )
{
	`QALog( "(Passive Weapon Switch) Increase:" @ GetPercentage( ModifiedSwitchTime,  ModifiedSwitchTime * (1.f - GetPassiveValue(WeaponSwitchSpeed, CurrentLevel)) ), bLogPerk );
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

	if( (KFW != none && IsWeaponOnPerk(KFW)) || (DamageType != none && IsDamageTypeOnPerk(DamageType)) )
	{
		if( MyKFPM != none && HitZoneIdx == HZI_HEAD )
		{
			`QALog( "(Headshot), damage mod=" $GetPassiveValue( HeadshotDamage, CurrentLevel ), bLogPerk );
			TempDamage += InDamage * GetPassiveValue( HeadshotDamage, CurrentLevel );

			if( GetScopedActive(KFW) )
			{
				`QALog( "(Scoped), damage mod=" $GetSkillValue( PerkSkills[ESharpshooterScoped] ), bLogPerk );
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
		}

		if( IsStationaryAimActive() && VSizeSq(OwnerPawn.Velocity) <= 0 )
		{
			`QALog( "(Stationary), damage mod=" $GetSkillValue( PerkSkills[ESharpshooterStationaryAim] ), bLogPerk );
			TempDamage += InDamage * GetSkillValue( PerkSkills[ESharpshooterStationaryAim] );
		}

		if( IsCrouchAimActive() && OwnerPawn.bIsCrouched )
		{
			`QALog( "(Crouched), damage mod=" $GetSkillValue( PerkSkills[ESharpshooterCrouchAim] ), bLogPerk );
			TempDamage += InDamage * GetSkillValue( PerkSkills[ESharpshooterCrouchAim] );
		}

		if( IsRhythmMethodActive() && HeadShotComboCount > 0 )
		{
			`QALog( "(RhythmMethod), HeadShotComboCount=" $HeadShotComboCount$", DamageMod="$(GetSkillValue( PerkSkills[ESharpshooterRhythmMethod] ) * HeadShotComboCount), bLogPerk );
			TempDamage += Indamage * GetSkillValue( PerkSkills[ESharpshooterRhythmMethod] ) * HeadShotComboCount;
		}
	}

	`QALog( "Total Damage Given - DamageType: "$DamageType$"; Weapon: "$KFW$"; In: "$InDamage$"; Out: "$FCeil( TempDamage )$"; Pct: "$GetPercentage( InDamage, Round( TempDamage ) ), bLogPerk );
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
	if( IsTriggerActive() )// && IsWeaponOnPerk( KFW ) )
	{
		`QALog( "(Trigger)" @ KFW @ GetPercentage( InRate, ( InRate - InRate *  PerkSkills[ESharpshooterTrigger].StartingValue ) ), bLogPerk );
		InRate -= InRate * PerkSkills[ESharpshooterTrigger].StartingValue;
	}
}

/**
 * @brief Modifies the weapon's recoil
 *
 * @param CurrentRecoilModifier percent recoil lowered
 */
simulated function ModifyRecoil( out float CurrentRecoilModifier, KFWeapon KFW )
{
	CurrentRecoilModifier -= CurrentRecoilModifier * GetPassiveValue( Recoil, CurrentLevel );

	if( GetScopedActive(KFW) ) // IsWeaponOnPerk( KFW ) )
	{
		`QALog( "(Scoped)" @ KFW @ GetPercentage( CurrentRecoilModifier, CurrentRecoilModifier - CurrentRecoilModifier * GetSkillValue( PerkSkills[ESharpshooterScoped] ) ), bLogPerk );
		CurrentRecoilModifier -= CurrentRecoilModifier * GetSkillValue( PerkSkills[ESharpshooterScoped] );
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
simulated function ModifyMaxSpareAmmoAmount( KFWeapon KFW, out int MaxSpareAmmo, optional const out STraderItem TraderItem)
{
	local float TempMaxSpareAmmoAmount;

	if( IsAmmoPouchActive() && IsWeaponOnPerk( KFW, TraderItem.AssociatedPerkClass ) )
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
	`QALog( "Tactical Reload Active =" @ (IsTacticalReloadActive() && IsWeaponOnPerk( KFW )), bLogPerk );
	return IsTacticalReloadActive() && (IsWeaponOnPerk( KFW ) || IsBackupWeapon( KFW ));
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
			`QALog( "(ZT Stun)" @ GetSkillValue(PerkSkills[ESharpshooterZTStun]), bLogPerk );
			return GetSkillValue( PerkSkills[ESharpshooterZTStun] );
		}
		else if( IsStunActive() )
		{
			`QALog( "(Stun)" @ GetSkillValue( PerkSkills[ESharpshooterStun] ), bLogPerk );
        	return GetSkillValue( PerkSkills[ESharpshooterStun] );
		}
	}

    return 1.f;
}

/**
 * @brief Skills can can chnage the knock down power
 * @return knock down power in %
 */
function float GetKnockdownPowerModifier( optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting=false )
{
	if( WorldInfo.TimeDilation < 1.f && BodyPart == BP_Head && IsZTKnockdownActive() && IsDamageTypeOnPerk(class<KFDamageType>(DamageType)) )
	{
		`QALog( "(Knockdown)" @ BodyPart @ GetSkillValue( PerkSkills[ESharpshooterZTKnockdown] ), bLogPerk );
		return GetSkillValue( PerkSkills[ESharpshooterZTKnockdown] );
	}

	return 1.f;
}

/**
 * @brief Checks if the Stationary Aim skill is active
 *
 * @return true/false
 */
function bool IsStationaryAimActive()
{
	return PerkSkills[ESharpshooterStationaryAim].bActive;
}

/**
 * @brief Checks if the Trigger skill is active
 *
 * @return true/false
 */
simulated function bool IsTriggerActive()
{
	return PerkSkills[ESharpshooterTrigger].bActive;
}

/**
 * @brief Checks if the Crouch Aim skill is active
 *
 * @return true/false
 */
function bool IsCrouchAimActive()
{
	return PerkSkills[ESharpshooterCrouchAim].bActive;
}

/**
 * @brief Checks if the Stun skill is active
 *
 * @return true/false
 */
simulated function bool IsStunActive()
{
	return PerkSkills[ESharpshooterStun].bActive;
}

/**
 * @brief Checks if the Rhythm Method skill is active
 *
 * @return true/false
 */
simulated function bool IsRhythmMethodActive()
{
	return PerkSkills[ESharpshooterRhythmMethod].bActive;
}

/**
 * @brief Checks if the Tactical Reload skill is active
 *
 * @return true/false
 */
simulated function bool IsTacticalReloadActive()
{
	return PerkSkills[ESharpshooterTacticalReload].bActive;
}

/**
 * @brief Checks if the Speed Freak skill is active
 *
 * @return true/false
 */
simulated function bool IsScopedActive()
{
	return PerkSkills[ESharpshooterScoped].bActive;
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
	return PerkSkills[ESharpshooterAmmoPouch].bActive;
}

/**
 * @brief Checks if the Knockdown skill is active
 *
 * @return true/false
 */
simulated function bool IsZTKnockdownActive()
{
	return PerkSkills[ESharpshooterZTKnockdown].bActive;
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
	return PerkSkills[ESharpshooterZTStun].bActive;
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

static function int GetMaxHeadShotsValue()
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
	`QALog( "", bLogPerk );

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

DefaultProperties
{
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Sharpshooter'

	PrimaryWeaponDef=class'KFWeapDef_Winchester1894'
	KnifeWeaponDef=class'KFWeapDef_Knife_Sharpshooter'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Sharpshooter'

	ProgressStatID=`STATID_Shrp_Progress
   	PerkBuildStatID=`STATID_Shrp_Build

   	MaxHeadShotComboCount=4
   	RhytmMethodRTPCName="R_Method"
   	RhythmMethodSoundReset=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Reset'
	RhythmMethodSoundHit=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Hit'
	RhythmMethodSoundTop=AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Top'

   	HeadshotDamage=(Name="Headshot Damage",Increment=0.01f,Rank=0,StartingValue=0.0f,MaxValue=0.25f)
   	Recoil=(Name="Recoil",Increment=0.01f,Rank=0,StartingValue=0.0f,MaxValue=0.25f)
   	WeaponSwitchSpeed=(Name="Weapon Switch Speed",Increment=0.02f,Rank=0,StartingValue=0.0f,MaxValue=0.50f)

   	ZedTimeModifyingStates(0)="WeaponFiring"
   	ZedTimeModifyingStates(1)="WeaponBurstFiring"
   	ZedTimeModifyingStates(2)="WeaponSingleFiring"

   	PerkSkills(ESharpshooterStationaryAim)=(Name="StationaryAim",IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_StationaryAim",			Increment=0.f,Rank=0,StartingValue=0.25,MaxValue=0.25)    //0.1
	PerkSkills(ESharpshooterTrigger)=(Name="Trigger",IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_Trigger",						Increment=0.f,Rank=0,StartingValue=0.25f,MaxValue=0.1f)
	PerkSkills(ESharpshooterCrouchAim)=(Name="CrouchAim",IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_CrouchAim",				Increment=0.f,Rank=0,StartingValue=0.30,MaxValue=0.30)
	PerkSkills(ESharpshooterStun)=(Name="Stun",IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_Stun",							Increment=0.f,Rank=0,StartingValue=2.0,MaxValue=2.0)
	PerkSkills(ESharpshooterRhythmMethod)=(Name="RhythmMethod",IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_RackUmUp",			Increment=0.f,Rank=0,StartingValue=0.17f,MaxValue=0.17f)
	PerkSkills(ESharpshooterTacticalReload)=(Name="TacticalReload",IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_TacticalReload",			Increment=0.f,Rank=0,StartingValue=0.0f,MaxValue=0.0f)
	PerkSkills(ESharpshooterScoped)=(Name="Scoped",IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_Scoped",							Increment=0.f,Rank=0,StartingValue=0.1f,MaxValue=0.1f)
	PerkSkills(ESharpshooterAmmoPouch)=(Name="AmmoPouch",IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_AmmoPouch",					Increment=0.f,Rank=0,StartingValue=0.25f,MaxValue=0.25f)
	PerkSkills(ESharpshooterZTKnockdown)=(Name="ZTKnockdown",IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_ZED-KnockDown",					Increment=0.f,Rank=0,StartingValue=17.0,MaxValue=17.0)
	PerkSkills(ESharpshooterZTStun)=(Name="ZTStun",IconPath="UI_PerkTalent_TEX.Sharpshooter.UI_Talents_Sharpshooter_ZED-Stun",						Increment=0.f,Rank=0,StartingValue=5.0,MaxValue=5.0)

	SkillZedTimeChance=0.05  //0.05

    // Skill tracking
	HitAccuracyHandicap=-9.0
	HeadshotAccuracyHandicap=-16.0

	SecondaryXPModifier(0)=1
   	SecondaryXPModifier(1)=1
   	SecondaryXPModifier(2)=2
   	SecondaryXPModifier(3)=3

   	CameraViewShakeScale=0.5
}
