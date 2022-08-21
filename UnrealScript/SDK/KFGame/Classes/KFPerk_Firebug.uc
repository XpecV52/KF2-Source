//=============================================================================
// KFPerk_Firebug
//=============================================================================
// The firebug perk class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Christian "schneidzekk" Schneider
//=============================================================================

class KFPerk_Firebug extends KFPerk
	native;

`include(KFOnlineStats.uci)

var		const	PerkSkill 			WeaponDamage;						// 1% increased Perk weapon damage per level (max 25%)
var 	const	PerkSkill			WeaponReload;              			// 1% faster perk weapon reload per level (max 25%)
var 	const	PerkSkill			FireResistance;            			// 30% resistance to fire, additional 2% resistance per level (max 80%)
var 	const	PerkSkill			OwnFireResistance;           		// 25% resistance to personal fire damage (max 100%)
var 	const	PerkSkill			StartingAmmo;   	        		// 5% more starting ammo for every 5 levels (max 25%)

 /** The range that an enemy needs to be within for the "Heat Wave" skill to function */
var 	const 	int 				HeatWaveRadiusSQ;

/** Chance that zeds will explode from the Shrapnel skill */
var		const	float 				ShrapnelChance;
var 			GameExplosion		ExplosionTemplate;
var 	const 	String				ShrapnelExplosionDamageTypeName;

var private const float 			AssistDoshModifier;

enum EFirebugSkills
{
	EFirebugFullyStocked,
	EFirebugFlarotovCoctail,
	EFirebugFuse,
	EFirebugHeatWave,
	EFirebugZedShrapnel,
	EFirebugNapalm,
	EFirebugRange,
	EFirebugSplashDamage,
	EFirebugCombustion,
	EFirebugScorch
};

/*********************************************************************************************
* @name	 Perk init and spawning
******************************************************************************************** */

/** (Server) Modify Instigator settings based on selected perk */
function ApplySkillsToPawn()
{
	super.ApplySkillsToPawn();

	if( MyPRI != none )
	{
		MyPRI.bExtraFireRange = IsRangeActive();
		MyPRI.bSplashActive = IsSplashDamageActive();
	}
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
		TempDamage *= GetPassiveValue( WeaponDamage, CurrentLevel );
	}

	`QALog( "Total Damage Given" @ DamageType @ KFW @ GetPercentage( InDamage, Round( TempDamage ) ), bLogPerk );
	InDamage = Round( TempDamage );
}

/**
 * @brief Modifies the reload speed for the flamethrower
 *
 * @param ReloadDuration Length of the reload animation
 * @param GiveAmmoTime Time after the weapon actually gets some ammo
 */
simulated function float GetReloadRateScale(KFWeapon KFW)
{
	if( IsWeaponOnPerk( KFW ) )
	{
		return 1.f - GetPassiveValue( WeaponReload, CurrentLevel );
	}

	return 1.f;
}

/**
 * @brief Modifies the damage taken
 *
 * @param InDamage damage
 * @param DamageType the damage type used (optional)
 * @param InstigatedBy damage instigator (optional)
 */
function ModifyDamageTaken( out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy )
{
	local float TempDamage;
	local PerkSkill UsedResistance;

	TempDamage = InDamage;

	if( ClassIsChildOf( DamageType, class'KFDT_Fire' ) )
	{
		UsedResistance = (InstigatedBy != none && InstigatedBy == OwnerPC) ? OwnFireResistance : FireResistance;
		`QALog( "UsedResistance" @ UsedResistance.Name, bLogPerk );
		TempDamage *= 1 - GetPassiveValue( UsedResistance, CurrentLevel );
	}

	`QALog( "Total Damage Resistance" @ DamageType @ GetPercentage( InDamage, Round(TempDamage) ), bLogPerk );
	InDamage = Round( TempDamage );
}

/**
 * @brief Modifies starting spare ammo
 *
 * @param KFW The weapon
 * @param PrimarySpareAmmo ammo amount
 * @param TraderItem the weapon's associated trader item info
 */
simulated function ModifySpareAmmoAmount( KFWeapon KFW, out int PrimarySpareAmmo, optional const out STraderItem TraderItem)
{
	local float TempSpareAmmoAmount;
	local class<KFPerk> WeaponPerkClass;

	if( KFW == none )
	{
		WeaponPerkClass = TraderItem.AssociatedPerkClass;
	}
	else
	{
		WeaponPerkClass = KFW.AssociatedPerkClass;
	}

	if( IsWeaponOnPerk( KFW, WeaponPerkClass ) )
	{
		if( KFW != none && IsFullyStockedActive() )
		{
			// ammocount is included in maxspareammo, so remove it here
			PrimarySpareAmmo = KFW.MaxSpareAmmo[0] - KFW.AmmoCount[0];
			`QALog( "FullyStoked, Ammo Now" @ KFW @ PrimarySpareAmmo @ "Max" @ KFW.MaxSpareAmmo[0] -  KFW.AmmoCount[0], bLogPerk );
		}
		else
		{
			TempSpareAmmoAmount = PrimarySpareAmmo;
			TempSpareAmmoAmount *= 1 + GetStartingAmmoPercent( CurrentLevel );
			`QALog( "Mod Spare Ammo, Primary" @ KFW @ "Original" @ PrimarySpareAmmo @ "Now" @ Round( TempSpareAmmoAmount ), bLogPerk );
			PrimarySpareAmmo = Round( TempSpareAmmoAmount );
		}
	}
}

/**
 * @brief Sets spare ammo to maximum (can't use ModifySpareAmmoAmount because we need a weapon or a weapon class and ModifySpareAmmoAmount potentially provides neither)
 *
 * @param WeaponPerkClass the weapon's associated perk class
 * @param PrimarySpareAmmo "out" ammo amount
 * @param MaxPrimarySpareAmmo maximum to set spare ammo to
 */
simulated function MaximizeSpareAmmoAmount( class<KFPerk> WeaponPerkClass, out int PrimarySpareAmmo, int MaxPrimarySpareAmmo )
{
	// basically IsWeaponOnPerk
	if( WeaponPerkClass == default.Class )
	{
		if( IsFullyStockedActive() )
		{
			PrimarySpareAmmo = MaxPrimarySpareAmmo;
		}
	}
}

/**
 * @brief Calculates the additional starting ammo
 *
 * @param Level Current perk level
 * @return additional ammo in perc
 */
simulated static private final function float GetStartingAmmoPercent( int Level )
{
	return default.StartingAmmo.Increment * FFloor( float( Level ) / 5.f );
}

/*********************************************************************************************
* @name	 Selectable skills
********************************************************************************************* */

/**
 * @brief Modifies the DoT length
 *
 * @param DotScaler The time scaler
 * @param KFDT The damage type used
 */
function ModifyDoTScaler( out float DoTScaler, optional class<KFDamageType> KFDT )
{
	if( IsFuseActive() && IsDamageTypeOnPerk( KFDT ) )
	{
		`QALog( "Fuse DotScaler" @ KFDT @ GetPercentage( DoTScaler, DoTScaler * GetSkillValue( PerkSkills[EFirebugFuse] ) ),bLogPerk );
		DotScaler *= GetSkillValue( PerkSkills[EFirebugFuse] );
	}
}

/**
 * @brief Checks if we are in point blank range
 *
 * @param KFP the pawn to check the distyance to (squared)
 * @return in range or not
 */
function bool InHeatRange( KFPawn KFP )
{
	return VSizeSQ( OwnerPawn.Location - KFP.Location ) <= HeatWaveRadiusSQ;
}

/**
 * @brief Checks if we have the napalm skill selected and able to spread some love
 *
 * @return true if active
 */
function bool CanSpreadNapalm()
{
	return IsNapalmActive();
}

/**
 * @brief Checks if a zed could potentially explode later
 *
 * @param KFDT damage type used to deal damage
 * @return if the zed could explode when dying
 */
function bool CouldBeZedShrapnel( class<KFDamageType> KFDT )
{
	return (IsZedShrapnelActive() || IsCombustionSelected()) && IsDamageTypeOnPerk( KFDT );
}

/**
 * @brief Modifies the splash damage given to a pawn
 *
 * @return The damage multiplier
 */
simulated function float GetSplashDamageModifier()
{
	`QALog( "SplashDamage Mod" @ ( IsSplashDamageActive() ? GetSkillValue( PerkSkills[EFirebugSplashDamage] ) : 1.f ), bLogPerk );
	return IsSplashDamageActive() ? GetSkillValue( PerkSkills[EFirebugSplashDamage] ) : 1.f;
}

/**
 * @brief Checks if a Zed should explode
 *
 * @return explode or not
 */
simulated function bool ShouldShrapnel()
{
	return IsCombustionActive() || (IsZedShrapnelActive() && fRand() <= default.ShrapnelChance);
}

/**
 * @brief The Zed shrapnel skill can spawn an explosion, this function delivers the template
 *
 * @return A game explosion template
 */
static function GameExplosion GetExplosionTemplate()
{
	return default.ExplosionTemplate;
}

static function class<KFDamageType> GetShrapnelDamageTypeClass()
{
	local class<KFDamageType> DamageTypeClass;

	DamageTypeClass = class<KFDamageType>(DynamicLoadObject(default.ShrapnelExplosionDamageTypeName, class'Class'));
	return DamageTypeClass;
}

/**
 * @brief Skills can modify the zed time time delation
 *
 * @param StateName used weapon's state
 * @return time dilation modifier
 */
simulated function float GetZedTimeModifier( KFWeapon W )
{
	local name StateName;

	if( GetScorchActive() && IsWeaponOnPerk(W) )
	{
		StateName = W.GetStateName();
		if( ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
		{
			`QALog( "Scorch Modifier" @ StateName @ GetSkillValue( PerkSkills[EFirebugScorch] ), bLogPerk );
			return GetSkillValue( PerkSkills[EFirebugScorch] );
		}
	}

	return 0.f;
}

/**
 * @brief skills and weapons can modify the stumbling power
 * @return stumpling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart )
{
	if( IsHeatWaveActive() && IsDamageTypeOnPerk(DamageType) && InHeatRange(KFP) )
	{
		CooldownModifier = GetSkillValue( PerkSkills[EFirebugHeatwave] );
		return 1000.f;
	}

	CooldownModifier = 1.f;
	return 1.f;
}

/*********************************************************************************************
* @name	 Getters etc
********************************************************************************************* */

/**
 * @brief Checks if Fully stocked skill is active (client & server)
 *
 * @return true/false
 */
simulated final private function bool IsFullyStockedActive()
{
	return PerkSkills[EFirebugFullyStocked].bActive;
}

/**
 * @brief Checks if the Flarotov Cocktail skill is active
 *
 * @return true/false
 */
simulated function bool IsFlarotovActive()
{
	return PerkSkills[EFirebugFlarotovCoctail].bActive;
}

/**
 * @brief Checks if the Flarotov Cocktail skill is active
 *
 * @return true/false
 */
simulated final private function bool IsFuseActive()
{
	return PerkSkills[EFirebugFuse].bActive;
}

/**
 * @brief Checks if the Heat wave skill is active
 *
 * @return true/false
 */
simulated final private function bool IsHeatWaveActive()
{
	return PerkSkills[EFirebugHeatWave].bActive;
}

/**
 * @brief Checks if the Zed Shrapnel skill is active
 *
 * @return true/false
 */
simulated final private function bool IsZedShrapnelActive()
{
	return PerkSkills[EFirebugZedShrapnel].bActive;
}

/**
 * @brief Checks if the Napalm skill is active
 *
 * @return true/false
 */
simulated final private function bool IsNapalmActive()
{
	return PerkSkills[EFirebugNapalm].bActive;
}

/**
 * @brief Checks if the Range skill is active
 *
 * @return true/false
 */
simulated function bool IsRangeActive()
{
	return PerkSkills[EFirebugRange].bActive;
}

/**
 * @brief Checks if the Splash Damage skill is active
 *
 * @return true/false
 */
simulated final private function bool IsSplashDamageActive()
{
	return PerkSkills[EFirebugSplashDamage].bActive;
}

/**
 * @brief Checks if the Combustion skill is active
 *
 * @return true/false
 */
simulated final private function bool IsCombustionSelected()
{
	return PerkSkills[EFirebugCombustion].bActive;
}

/**
 * @brief Checks if the Combustion skill is active
 *
 * @return true/false
 */
simulated final private function bool IsCombustionActive()
{
	return PerkSkills[EFirebugCombustion].bActive && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Checks if the Heat wave skill is active and if we are in Zed time
 *
 * @return true/false
 */
simulated final private function bool GetScorchActive()
{
	return PerkSkills[EFirebugScorch].bActive && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Checks if the Heat wave skill is active
 *
 * @return true/false
 */
simulated final private function bool IsScorchActive()
{
	return PerkSkills[EFirebugScorch].bActive;
}


/*********************************************************************************************
* @name	 Stats/XP
********************************************************************************************* */

/**
 * @brief how much XP is earned by a crawler kill depending on the game's difficulty
 *
 * @param Difficulty current game difficulty
 * @return XP earned
 */
simulated static function int GetCrawlerKillXP( byte Difficulty )
{
	return default.SecondaryXPModifier[Difficulty];
}

static function ModifyAssistDosh( out int EarnedDosh )
{
	local float TempDosh;

	TempDosh = EarnedDosh;
	TempDosh *= GetAssistDoshModifer();
	EarnedDosh = Round( TempDosh );
}

private static function float GetAssistDoshModifer()
{
	return default.AssistDoshModifier;
}

/*********************************************************************************************
* @name	 UI
********************************************************************************************* */
simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Round( GetPassiveValue( default.WeaponDamage, Level ) * 100  - 100 ) $ "%";
	PassiveValues[1] = Round( GetPassiveValue( default.WeaponReload, Level ) * 100 ) $ "%";
	PassiveValues[2] = Round( GetPassiveValue( default.FireResistance, Level ) * 100 ) $ "%";
	PassiveValues[3] = Round( GetPassiveValue( default.OwnFireResistance, Level ) * 100 ) $ "%";
	PassiveValues[4] = Round( GetStartingAmmoPercent( Level ) * 100 ) $ "%";

	Increments[0] = "[" @ Int( default.WeaponDamage.Increment * 100 )  $ "% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ Int( default.WeaponReload.Increment * 100 )  $ "% /" @ default.LevelString @ "]";
	Increments[2] = "[" @ Int( default.FireResistance.StartingValue * 100 )$ "%" @ "+" @ Int( default.FireResistance.Increment * 100 ) $ "% /" @ default.LevelString @ "]";
	Increments[3] = "[" @ Int( default.OwnFireResistance.StartingValue * 100 ) $ "%" @ "+" @ Int( default.OwnFireResistance.Increment * 100 ) @ "%" @ default.LevelString @ "]";
	Increments[4] = "[" @ Int( default.StartingAmmo.Increment * 100 ) $ "% / 5" @ default.LevelString @ "]";
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
		`log( "PASSIVE PERKS" );
		`log( "-WeaponDamage:" @ GetPassiveValue( default.WeaponDamage, GetLevel() ) - 1 $ "%" );
		`log( "-WeaponReload:" @ GetPassiveValue( default.WeaponReload, GetLevel() ) $ "%" );
		`log( "-FireResistance:" @ GetPassiveValue( default.FireResistance, GetLevel() ) $ "%" );
		`log( "-OwnFireResistance:" @ GetPassiveValue( default.OwnFireResistance, GetLevel() ) $ "%" );
		`log( "-Ammo:" @ GetStartingAmmoPercent( GetLevel() ) $ "%" );

	    `log( "Skill Tree" );
	    `log( "-FullyStoked:" @ PerkSkills[EFirebugFullyStocked].bActive );
	    `log( "-FlarotovCoctail:" @ PerkSkills[EFirebugFlarotovCoctail].bActive );
	    `log( "-Fuse:" @ PerkSkills[EFirebugFuse].bActive );
	    `log( "-HeatWave:" @ PerkSkills[EFirebugHeatWave].bActive );
	    `log( "-ZedShrapnel:" @ PerkSkills[EFirebugZedShrapnel].bActive );
	    `log( "-Napalm:" @ PerkSkills[EFirebugNapalm].bActive );
	    `log( "-Range:" @ PerkSkills[EFirebugRange].bActive );
	    `log( "-SplashDamage:" @ PerkSkills[EFirebugSplashDamage].bActive @ GetSplashDamageModifier() );
	    `log( "-Combustion:" @ PerkSkills[EFirebugCombustion].bActive );
	    `log( "-Scorch:" @ PerkSkills[EFirebugScorch].bActive );
	}
}

DefaultProperties
{
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Firebug'

	PrimaryWeaponDef=class'KFWeapDef_CaulkBurn'
	KnifeWeaponDef=class'KFWeapDef_Knife_Firebug'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Firebug'

	ProgressStatID=`STATID_Fire_Progress
   	PerkBuildStatID=`STATID_Fire_Build

   	HeatWaveRadiusSQ=90000

   	ShrapnelChance=0.20   //0.2

   	AssistDoshModifier=2.f

	WeaponDamage=(Name="Weapon Damage",Increment=0.01f,Rank=0,StartingValue=1.f,MaxValue=1.25)
	WeaponReload=(Name="Weapon Reload Speed",Increment=0.01f,Rank=0,StartingValue=0.f,MaxValue=0.25)
	FireResistance=(Name="Fire Resistance",Increment=0.02,Rank=0,StartingValue=0.3f,MaxValue=0.8f)
	OwnFireResistance=(Name="Own fire Resistance",Increment=0.03,Rank=0,StartingValue=0.25f,MaxValue=1.f)
	StartingAmmo=(Name="Starting Ammo",Increment=0.05,Rank=0,StartingValue=0.f,MaxValue=0.25)

	PerkSkills(EFirebugFullyStocked)=(Name="FullyStocked",IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_FullyStocked")
	PerkSkills(EFirebugFlarotovCoctail)=(Name="FlarotovCoctail",IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_FlarotovCocktail")
	PerkSkills(EFirebugFuse)=(Name="Fuse",IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Fuse",Increment=0.f,Rank=0,StartingValue=1.7f,MaxValue=1.7f)
	PerkSkills(EFirebugHeatWave)=(Name="HeatWave",IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_HeatWave",Increment=0.f,Rank=0,StartingValue=1.0f,MaxValue=1.0f)
	PerkSkills(EFirebugZedShrapnel)=(Name="ZedShrapnel",IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_ZedShrapnel",Increment=0.f,Rank=0,StartingValue=1.2f,MaxValue=0.f)
	PerkSkills(EFirebugNapalm)=(Name="Napalm",IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Napalm",Increment=0.f,Rank=0,StartingValue=1.5f,MaxValue=1.5f)
	PerkSkills(EFirebugRange)=(Name="Range",IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Range",Increment=0.f,Rank=0,StartingValue=0.3f,MaxValue=0.f)
	PerkSkills(EFirebugSplashDamage)=(Name="SplashDamage",IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_SplashDamage",Increment=0.f,Rank=0,StartingValue=2.f,MaxValue=2.f)
	PerkSkills(EFirebugCombustion)=(Name="Combustion",IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Combustion",Increment=0.f,Rank=0,StartingValue=1.03,MaxValue=1.03)
	PerkSkills(EFirebugScorch)=(Name="Scorch",IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Scorch",Increment=0.f,Rank=0,StartingValue=0.9f,MaxValue=0.9f)

	ZedTimeModifyingStates(0)="WeaponFiring"
   	ZedTimeModifyingStates(1)="WeaponBurstFiring"
   	ZedTimeModifyingStates(2)="WeaponSingleFiring"
   	ZedTimeModifyingStates(3)="SprayingFire"

   	SecondaryXPModifier(0)=2
	SecondaryXPModifier(1)=3
	SecondaryXPModifier(2)=4
	SecondaryXPModifier(3)=7

	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=10  //231  //120
		DamageRadius=200   //840  //600
		DamageFalloffExponent=1
		DamageDelay=0.f
		// Damage Effects
		//KnockDownStrength=0
		FractureMeshRadius=200.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'FX_Explosions_ARCH.FX_Combustion_Explosion'
		ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Frag.Play_WEP_EXP_Grenade_Frag_Explosion'

		// Camera Shake
		CamShake=CameraShake'FX_CameraShake_Arch.Misc_Explosions.Perk_ShrapnelCombustion'
		CamShakeInnerRadius=450
		CamShakeOuterRadius=900
		CamShakeFalloff=1.f
		bOrientCameraShakeTowardsEpicenter=true
	End Object
	ExplosionTemplate=ExploTemplate0

	ShrapnelExplosionDamageTypeName="KFGameContent.KFDT_Explosive_Shrapnel"

    // Skill tracking
	HitAccuracyHandicap=-2.0
	HeadshotAccuracyHandicap=5.0
}
