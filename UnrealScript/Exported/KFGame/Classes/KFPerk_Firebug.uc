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



 


 


  



 



 




 



 




 



 



 



 



 



 





 


 


 









 

#linenumber 14

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

	;
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
		;
		TempDamage *= 1 - GetPassiveValue( UsedResistance, CurrentLevel );
	}

	;
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
			;
		}
		else
		{
			TempSpareAmmoAmount = PrimarySpareAmmo;
			TempSpareAmmoAmount *= 1 + GetStartingAmmoPercent( CurrentLevel );
			;
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
		;
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
	;
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
			;
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

/**
 * @brief how much XP is earned by a bloat kill depending on the game's difficulty
 *
 * @param Difficulty current game difficulty
 * @return XP earned
 */
simulated static function int GetBloatKillXP( byte Difficulty )
{
	// Currently the same XP as a crawler
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
		LogInternal("PASSIVE PERKS");
		LogInternal("-WeaponDamage:" @ GetPassiveValue( default.WeaponDamage, GetLevel() ) - 1 $ "%");
		LogInternal("-WeaponReload:" @ GetPassiveValue( default.WeaponReload, GetLevel() ) $ "%");
		LogInternal("-FireResistance:" @ GetPassiveValue( default.FireResistance, GetLevel() ) $ "%");
		LogInternal("-OwnFireResistance:" @ GetPassiveValue( default.OwnFireResistance, GetLevel() ) $ "%");
		LogInternal("-Ammo:" @ GetStartingAmmoPercent( GetLevel() ) $ "%");

	    LogInternal("Skill Tree");
	    LogInternal("-FullyStoked:" @ PerkSkills[EFirebugFullyStocked].bActive);
	    LogInternal("-FlarotovCoctail:" @ PerkSkills[EFirebugFlarotovCoctail].bActive);
	    LogInternal("-Fuse:" @ PerkSkills[EFirebugFuse].bActive);
	    LogInternal("-HeatWave:" @ PerkSkills[EFirebugHeatWave].bActive);
	    LogInternal("-ZedShrapnel:" @ PerkSkills[EFirebugZedShrapnel].bActive);
	    LogInternal("-Napalm:" @ PerkSkills[EFirebugNapalm].bActive);
	    LogInternal("-Range:" @ PerkSkills[EFirebugRange].bActive);
	    LogInternal("-SplashDamage:" @ PerkSkills[EFirebugSplashDamage].bActive @ GetSplashDamageModifier());
	    LogInternal("-Combustion:" @ PerkSkills[EFirebugCombustion].bActive);
	    LogInternal("-Scorch:" @ PerkSkills[EFirebugScorch].bActive);
	}
}

defaultproperties
{
   WeaponDamage=(Name="Weapon Damage",Increment=0.010000,StartingValue=1.000000,MaxValue=1.250000)
   WeaponReload=(Name="Weapon Reload Speed",Increment=0.010000,MaxValue=0.250000)
   FireResistance=(Name="Fire Resistance",Increment=0.020000,StartingValue=0.300000,MaxValue=0.800000)
   OwnFireResistance=(Name="Own fire Resistance",Increment=0.030000,StartingValue=0.250000,MaxValue=1.000000)
   StartingAmmo=(Name="Starting Ammo",Increment=0.050000,MaxValue=0.250000)
   HeatWaveRadiusSQ=90000
   ShrapnelChance=0.200000
   ExplosionTemplate=KFGameExplosion'KFGame.Default__KFPerk_Firebug:ExploTemplate0'
   ShrapnelExplosionDamageTypeName="KFGameContent.KFDT_Explosive_Shrapnel"
   AssistDoshModifier=2.000000
   ProgressStatID=30
   PerkBuildStatID=31
   SecondaryXPModifier(0)=2
   SecondaryXPModifier(1)=3
   SecondaryXPModifier(2)=3
   SecondaryXPModifier(3)=5
   PerkName="Firebug"
   Passives(0)=(Title="Perk Weapon Damage",Description="Perk weapon damage increased by %x%")
   Passives(1)=(Title="Perk Weapon Reload",Description="Perk weapon reload speed increased by %x%")
   Passives(2)=(Title="Resist Zed Fire Damage",Description="%x% resistance to fire damage")
   Passives(3)=(Title="Immunity to your own Fire",Description="%x% resistance to personal fire damage")
   Passives(4)=(Title="Starting Ammo",Description="%x% more starting ammo")
   SkillCatagories(0)="Supplies"
   SkillCatagories(1)="Spicy"
   SkillCatagories(2)="Burn"
   SkillCatagories(3)="Flame"
   SkillCatagories(4)="Advanced Training"
   EXPAction1="Dealing Firebug weapon damage"
   EXPAction2="Killing Crawlers with Firebug weapons"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Firebug'
   PerkSkills(0)=(Name="FullyStocked",IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_FullyStocked")
   PerkSkills(1)=(Name="FlarotovCoctail",IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_FlarotovCocktail")
   PerkSkills(2)=(Name="Fuse",StartingValue=1.700000,MaxValue=1.700000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Fuse")
   PerkSkills(3)=(Name="HeatWave",StartingValue=1.000000,MaxValue=1.000000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_HeatWave")
   PerkSkills(4)=(Name="ZedShrapnel",StartingValue=1.200000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_ZedShrapnel")
   PerkSkills(5)=(Name="Napalm",StartingValue=1.500000,MaxValue=1.500000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Napalm")
   PerkSkills(6)=(Name="Range",StartingValue=0.300000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Range")
   PerkSkills(7)=(Name="SplashDamage",StartingValue=2.000000,MaxValue=2.000000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_SplashDamage")
   PerkSkills(8)=(Name="Combustion",StartingValue=1.030000,MaxValue=1.030000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Combustion")
   PerkSkills(9)=(Name="Scorch",StartingValue=0.900000,MaxValue=0.900000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Scorch")
   ZedTimeModifyingStates(0)="WeaponFiring"
   ZedTimeModifyingStates(1)="WeaponBurstFiring"
   ZedTimeModifyingStates(2)="WeaponSingleFiring"
   ZedTimeModifyingStates(3)="SprayingFire"
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_CaulkBurn'
   KnifeWeaponDef=Class'KFGame.KFWeapDef_Knife_Firebug'
   GrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Firebug'
   HitAccuracyHandicap=-2.000000
   HeadshotAccuracyHandicap=5.000000
   Name="Default__KFPerk_Firebug"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
