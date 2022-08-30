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

//`include(KFOnlineStats.uci)

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

var	private	const float				SnarePower;
var private const float				SnareSpeedModifier;
var private const class<DamageType> SnareCausingDmgTypeClass;
var private const int 				NapalmDamage;
/** Multiplier on CylinderComponent.CollisionRadius to check for infecting other zeds */
var private const float 			NapalmCheckCollisionScale;


enum EFirebugSkills
{
	EFirebugBringTheHeat,
	EFirebugHighCapFuelTank,
	EFirebugFuse,
	EFirebugGroundFire,
	EFirebugNapalm,
	EFirebugZedShrapnel,
	EFirebugSplashDamage,
	EFirebugRange,
	EFirebugScorch,
	EFirebugInferno
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
		MyPRI.bSplashActive = IsGroundFireActive();
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

	if( (KFW != none && IsWeaponOnPerk( KFW,, self.class )) || (DamageType != none && IsDamageTypeOnPerk( DamageType )) )
	{
		TempDamage *= GetPassiveValue( WeaponDamage, CurrentLevel );

		if( IsBringTheHeatActive() )
		{
			TempDamage += InDamage * GetSkillValue( PerkSkills[EFirebugBringTheHeat] );
		}

		if( IsInfernoActive() )
		{
			TempDamage += InDamage * GetSkillValue( PerkSkills[EFirebugInferno] );
		}
	}

	if( IsGroundFireActive() && DamageType != none && ClassIsChildOf( DamageType,  SnareCausingDmgTypeClass ) )
	{
		TempDamage += InDamage * GetSkillValue( PerkSkills[EFirebugGroundFire] );
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
	if( IsWeaponOnPerk( KFW,, self.class ) )
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

	if( InDamage <= 0 )
	{
		return;
	}

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
simulated function ModifySpareAmmoAmount( KFWeapon KFW, out int PrimarySpareAmmo, optional const out STraderItem TraderItem, optional bool bSecondary )
{
	local float TempSpareAmmoAmount;
	local array< class<KFPerk> > WeaponPerkClass;

	if( KFW == none )
	{
		WeaponPerkClass = TraderItem.AssociatedPerkClasses;
	}
	else
	{
		WeaponPerkClass = KFW.GetAssociatedPerkClasses();
	}

	if( IsWeaponOnPerk( KFW, WeaponPerkClass, self.class ) )
	{
			TempSpareAmmoAmount = PrimarySpareAmmo;
			TempSpareAmmoAmount *= 1 + GetStartingAmmoPercent( CurrentLevel );
			;
			PrimarySpareAmmo = Round( TempSpareAmmoAmount );
	}
}

/**
 * @brief Sets spare ammo to maximum (can't use ModifySpareAmmoAmount because we need a weapon or a weapon class and ModifySpareAmmoAmount potentially provides neither)
 *
 * @param WeaponPerkClass the weapon's associated perk class
 * @param PrimarySpareAmmo "out" ammo amount
 * @param MaxPrimarySpareAmmo maximum to set spare ammo to
 */
simulated function MaximizeSpareAmmoAmount( array< Class<KFPerk> >  WeaponPerkClass, out int PrimarySpareAmmo, int MaxPrimarySpareAmmo )
{
	// basically IsWeaponOnPerk
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
function float GetDoTScalerAdditions(class<KFDamageType> KFDT)
{
	local float ScalarAdditions;

	if (IsDamageTypeOnPerk(KFDT))
	{
		if (IsFuseActive())
		{
			ScalarAdditions += GetSkillValue(PerkSkills[EFirebugFuse]);
		}

		if (IsNapalmActive())
		{
			ScalarAdditions += GetSkillValue(PerkSkills[EFirebugNapalm]);
		}
	}

	return ScalarAdditions;
}

static function int GetNapalmDamage()
{
	return default.NapalmDamage;
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
 * @brief Modifies mag capacity and count
 *
 * @param KFW the weapon
 * @param MagazineCapacity modified mag capacity
 * @param WeaponPerkClass the weapon's associated perk class (optional)
 */
simulated function ModifyMagSizeAndNumber( KFWeapon KFW, out byte MagazineCapacity, optional array< Class<KFPerk> > WeaponPerkClass, optional bool bSecondary=false, optional name WeaponClassname )
{
	local float TempCapacity;

	TempCapacity = MagazineCapacity;

	if( IsWeaponOnPerk( KFW, WeaponPerkClass, self.class ) && IsHighCapFuelTankActive() )
	{
		TempCapacity += MagazineCapacity * GetSkillValue( PerkSkills[EFirebugHighCapFuelTank] );
	}

	MagazineCapacity = Round(TempCapacity);
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

static final function float GetNapalmCheckCollisionScale()
{
	return default.NapalmCheckCollisionScale;
}

/**
 * @brief Checks if a zed could potentially explode later
 *
 * @param KFDT damage type used to deal damage
 * @return if the zed could explode when dying
 */
function bool CouldBeZedShrapnel( class<KFDamageType> KFDT )
{
	return IsZedShrapnelActive() && IsDamageTypeOnPerk( KFDT );
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
	return IsZedShrapnelActive() && fRand() <= default.ShrapnelChance;
}

/**
 * @brief The Zed shrapnel skill can spawn an explosion, this function delivers the template
 *
 * @return A game explosion template
 */
function GameExplosion GetExplosionTemplate()
{
	return default.ExplosionTemplate;
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

	if( GetScorchActive() && IsWeaponOnPerk( W,, self.class ) )
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
		CooldownModifier = GetSkillValue( PerkSkills[EFirebugSplashDamage] );
		return 1000.f;
	}

	CooldownModifier = 1.f;
	return 0.f;
}

simulated function float GetSnareSpeedModifier()
{
	return IsGroundFireActive() ? SnareSpeedModifier : 1.f;
}

simulated function float GetSnarePowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx )
{
	if( IsGroundFireActive() &&	DamageType != none &&
		ClassIsChildOf( DamageType,  SnareCausingDmgTypeClass ) )
	{
		return default.SnarePower;
	}

	if( IsInfernoActive() && IsDamageTypeOnPerk( class<KFDamageType>(DamageType) ) )
	{
		return default.SnarePower;
	}

	return 0.f;
}

/**
 * @brief Checks if Rapid Assault is selected and if the weapon is on perk
 *
 * @param KFW Weapon used
 * @return true or false
 */
simulated function bool GetIsUberAmmoActive( KFWeapon KFW )
{
	return IsWeaponOnPerk( KFW,, self.class ) && GetScorchActive();
}

/*********************************************************************************************
* @name	 Getters etc
********************************************************************************************* */

/**
 * @brief Checks if Fully stocked skill is active (client & server)
 *
 * @return true/false
 */
simulated final private function bool IsBringTheHeatActive()
{
	return PerkSkills[EFirebugBringTheHeat].bActive && IsPerkLevelAllowed(EFirebugBringTheHeat);
}

/**
 * @brief Checks if the Flarotov Cocktail skill is active
 *
 * @return true/false
 */
simulated function bool IsHighCapFuelTankActive()
{
	return PerkSkills[EFirebugHighCapFuelTank].bActive && IsPerkLevelAllowed(EFirebugHighCapFuelTank);
}

/**
 * @brief Checks if the Flarotov Cocktail skill is active
 *
 * @return true/false
 */
simulated final private function bool IsFuseActive()
{
	return PerkSkills[EFirebugFuse].bActive && IsPerkLevelAllowed(EFirebugFuse);
}

/**
 * @brief Checks if the Ground Fire skill is active
 *
 * @return true/false
 */
simulated final private function bool IsGroundFireActive()
{
	return PerkSkills[EFirebugGroundFire].bActive && IsPerkLevelAllowed(EFirebugGroundFire);
}

simulated function bool IsFlarotovActive()
{
	return true;
}

/**
 * @brief Checks if the Heat wave skill is active
 *
 * @return true/false
 */
simulated final private function bool IsHeatWaveActive()
{
	return PerkSkills[EFirebugSplashDamage].bActive && IsPerkLevelAllowed(EFirebugSplashDamage);
}

/**
 * @brief Checks if the Zed Shrapnel skill is active
 *
 * @return true/false
 */
simulated final private function bool IsZedShrapnelActive()
{
	return PerkSkills[EFirebugZedShrapnel].bActive && IsPerkLevelAllowed(EFirebugZedShrapnel);
}

/**
 * @brief Checks if the Napalm skill is active
 *
 * @return true/false
 */
simulated final private function bool IsNapalmActive()
{
	return PerkSkills[EFirebugNapalm].bActive && IsPerkLevelAllowed(EFirebugNapalm);
}

/**
 * @brief Checks if the Range skill is active
 *
 * @return true/false
 */
simulated function bool IsRangeActive()
{
	return PerkSkills[EFirebugRange].bActive && IsPerkLevelAllowed(EFirebugRange);
}

/**
 * @brief Checks if the Splash Damage skill is active
 *
 * @return true/false
 */
simulated final private function bool IsSplashDamageActive()
{
	return false;
}

/**
 * @brief Checks if the Inferno skill is active
 *
 * @return true/false
 */
simulated final private function bool IsInfernoActive()
{
	return PerkSkills[EFirebugInferno].bActive && WorldInfo.TimeDilation < 1.f && IsPerkLevelAllowed(EFirebugInferno);
}

/**
 * @brief Checks if the Heat wave skill is active and if we are in Zed time
 *
 * @return true/false
 */
simulated final private function bool GetScorchActive()
{
	return IsScorchActive() && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Checks if the Heat wave skill is active
 *
 * @return true/false
 */
simulated final private function bool IsScorchActive()
{
	return PerkSkills[EFirebugScorch].bActive && IsPerkLevelAllowed(EFirebugScorch);
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

	Increments[0] = "[" @ Left( string( default.WeaponDamage.Increment * 100 ), InStr(string(default.WeaponDamage.Increment * 100), ".") + 2 ) $ "% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ Left( string( default.WeaponReload.Increment * 100 ), InStr(string(default.WeaponReload.Increment * 100), ".") + 2 ) $ "% /" @ default.LevelString @ "]";
	Increments[2] = "[" @ Left( string( default.FireResistance.StartingValue * 100 ), InStr(string(default.FireResistance.StartingValue * 100), ".") + 2 ) $ "%" @ "+"
						@Left( string( default.FireResistance.Increment * 100 ), InStr(string(default.FireResistance.Increment * 100), ".") + 2 ) $ "% /" @ default.LevelString @ "]";
	Increments[3] = "[" @ Left( string( default.OwnFireResistance.StartingValue * 100 ), InStr(string(default.OwnFireResistance.StartingValue * 100), ".") + 2 ) $ "%" @ "+"
						@Left( string( default.OwnFireResistance.Increment * 100 ), InStr(string(default.OwnFireResistance.Increment * 100), ".") + 2 )  $ "% /" @ default.LevelString @ "]";
	Increments[4] = "[" @ Left( string( default.StartingAmmo.Increment * 100 ), InStr(string(default.StartingAmmo.Increment * 100), ".") + 2 )$ "% / 5" @ default.LevelString @ "]";
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
	   // `log( "-FullyStoked:" @ PerkSkills[EFirebugFullyStocked].bActive );
	    //`log( "-FlarotovCoctail:" @ PerkSkills[EFirebugFlarotovCoctail].bActive );
	    LogInternal("-Fuse:" @ PerkSkills[EFirebugFuse].bActive);
	    //`log( "-HeatWave:" @ PerkSkills[EFirebugHeatWave].bActive );
	    LogInternal("-ZedShrapnel:" @ PerkSkills[EFirebugZedShrapnel].bActive);
	    LogInternal("-Napalm:" @ PerkSkills[EFirebugNapalm].bActive);
	    LogInternal("-Range:" @ PerkSkills[EFirebugRange].bActive);
	    LogInternal("-SplashDamage:" @ PerkSkills[EFirebugSplashDamage].bActive @ GetSplashDamageModifier());
	    //`log( "-Combustion:" @ PerkSkills[EFirebugCombustion].bActive );
	    LogInternal("-Scorch:" @ PerkSkills[EFirebugScorch].bActive);
	}
}

defaultproperties
{
   WeaponDamage=(Name="Weapon Damage",Increment=0.008000,StartingValue=1.000000,MaxValue=1.200000)
   WeaponReload=(Name="Weapon Reload Speed",Increment=0.008000,MaxValue=0.200000)
   FireResistance=(Name="Fire Resistance",Increment=0.020000,StartingValue=0.300000,MaxValue=0.800000)
   OwnFireResistance=(Name="Own fire Resistance",Increment=0.030000,StartingValue=0.250000,MaxValue=1.000000)
   StartingAmmo=(Name="Starting Ammo",Increment=0.100000,MaxValue=0.500000)
   HeatWaveRadiusSQ=90000
   ShrapnelChance=0.300000
   ExplosionTemplate=KFGameExplosion'KFGame.Default__KFPerk_Firebug:ExploTemplate0'
   SnarePower=100.000000
   SnareSpeedModifier=0.700000
   SnareCausingDmgTypeClass=Class'KFGame.KFDT_Fire_Ground'
   NapalmDamage=7
   NapalmCheckCollisionScale=2.000000
   ProgressStatID=30
   PerkBuildStatID=31
   SecondaryXPModifier(0)=2
   SecondaryXPModifier(1)=3
   SecondaryXPModifier(2)=3
   SecondaryXPModifier(3)=5
   PerkName="Firebug"
   Passives(0)=(Title="Perk Weapon Damage",Description="Increase perk weapon damage %x% per level")
   Passives(1)=(Title="Perk Weapon Reload",Description="Increase perk weapon reload speed %x% per level")
   Passives(2)=(Title="Resist Zed Fire Damage",Description="Resistance to Zed fire starts at 30% and increases %x% per level")
   Passives(3)=(Title="Immunity to your own Fire",Description="Increase resistance to your own fire gains 25%, which increases %x% per level")
   Passives(4)=(Title="Starting Ammo",Description="Increase starting ammo %x% every five levels")
   SkillCatagories(0)="Supplies"
   SkillCatagories(1)="Spicy"
   SkillCatagories(2)="Burn"
   SkillCatagories(3)="Flame"
   SkillCatagories(4)="Advanced Training"
   EXPAction1="Dealing Firebug weapon damage"
   EXPAction2="Killing Bloats and Crawlers with Firebug weapons"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Firebug'
   PerkSkills(0)=(Name="BringTheHeat",StartingValue=0.350000,MaxValue=0.350000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_BringtheHeat")
   PerkSkills(1)=(Name="HighCapFuelTank",StartingValue=1.000000,MaxValue=1.000000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_HighCapacityFuel")
   PerkSkills(2)=(Name="Fuse",StartingValue=1.500000,MaxValue=1.500000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Fuse")
   PerkSkills(3)=(Name="GroundFire",StartingValue=2.000000,MaxValue=2.000000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_HeatWave")
   PerkSkills(4)=(Name="Napalm",StartingValue=1.500000,MaxValue=1.500000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Napalm")
   PerkSkills(5)=(Name="ZedShrapnel",StartingValue=1.200000,MaxValue=1.200000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_ZedShrapnel")
   PerkSkills(6)=(Name="SplashDamage",StartingValue=1.000000,MaxValue=1.000000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_GroundFire")
   PerkSkills(7)=(Name="Range",StartingValue=0.300000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Range")
   PerkSkills(8)=(Name="Scorch",StartingValue=0.900000,MaxValue=0.900000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Scorch")
   PerkSkills(9)=(Name="Inferno",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.Firebug.UI_Talents_Firebug_Inferno")
   ZedTimeModifyingStates(0)="WeaponFiring"
   ZedTimeModifyingStates(1)="WeaponBurstFiring"
   ZedTimeModifyingStates(2)="WeaponSingleFiring"
   ZedTimeModifyingStates(3)="SprayingFire"
   ZedTimeModifyingStates(4)="HuskCannonCharge"
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_CaulkBurn'
   KnifeWeaponDef=Class'KFGame.KFWeapDef_Knife_Firebug'
   GrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Firebug'
   AutoBuyLoadOutPath(0)=Class'KFGame.KFWeapDef_CaulkBurn'
   AutoBuyLoadOutPath(1)=Class'KFGame.KFWeapDef_DragonsBreath'
   AutoBuyLoadOutPath(2)=Class'KFGame.KFWeapDef_FlameThrower'
   AutoBuyLoadOutPath(3)=Class'KFGame.KFWeapDef_MicrowaveGun'
   AutoBuyLoadOutPath(4)=Class'KFGame.KFWeapDef_MicrowaveRifle'
   HitAccuracyHandicap=-2.000000
   HeadshotAccuracyHandicap=5.000000
   PrestigeRewardItemIconPaths(0)="WEP_SkinSet_Prestige01_Item_TEX.knives.FirebugKnife_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(1)="WEP_SkinSet_Prestige02_Item_TEX.tier01.CaulcNBurn_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(2)="WEP_skinset_prestige03_itemtex.tier02.Dragonsbreath_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(3)="wep_skinset_prestige04_itemtex.tier03.FlameThrower_PrestigePrecious_Mint_Large"
   PrestigeRewardItemIconPaths(4)="WEP_SkinSet_Prestige05_Item_TEX.tier04.MicrowaveGun_PrestigePrecious_Mint_large"
   Name="Default__KFPerk_Firebug"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
