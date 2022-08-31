//=============================================================================
// KFPerk_Survivalist
//=============================================================================
// The survivalist perk class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFPerk_Survivalist extends KFPerk
	native;

//`include(KFOnlineStats.uci)

/** Passives */
var private const PerkSkill	WeaponDamage;
var private	const PerkSkill	DamageResistance;
var private	const PerkSkill	HeavyBodyArmor;
var	private	const PerkSkill	ZedTimeReload;

/** Selectable skills */
enum ESurvivalistPerkSkills
{
	ESurvivalist_TacticalReload,
	ESurvivalist_HeavyWeaponsReload,
	ESurvivalist_FieldMedic,
	ESurvivalist_MeleeExpert,
	ESurvivalist_AmmoVest,
	ESurvivalist_BigPockets,
	ESurvivalist_Shrapnel,
	ESurvivalist_MakeThingsGoBoom,
	ESurvivalist_MadMan,
	ESurvivalist_IncapMaster
};

var private const float 			InjectionPotencyModifier;
var private const float 			MeleeExpertAttackSpeedModifier;
var private const GameExplosion		ShrapnelExplosionTemplate;
var private const float 			ShrapnelChance;
var private const float 			SnarePower;
var private const float 			MeleeExpertMovementSpeedModifier;

var class<KFWeaponDefinition>		HealingGrenadeWeaponDef;
var class<KFWeaponDefinition>		MolotovGrenadeWeaponDef;

var private const array<class<KFWeaponDefinition> > PrimaryWeaponPaths;
var private const array<string>	KnifeWeaponPaths;
var int StartingWeaponClassIndex;

var private const array<name>		TacticalReloadAsReloadRateClassNames;

/** When MakeThingsGoBoom skill is selected the survivalist gets additional explosive resistance */
var private const float				MakeThingsGoBoomExplosiveResistance;

/*********************************************************************************************
* @name	 Perk init and spawning
******************************************************************************************** */

/** On spawn, modify owning pawn based on perk selection */
function SetPlayerDefaults( Pawn PlayerPawn )
{
	local float NewArmor;

	super.SetPlayerDefaults( PlayerPawn );

	if( OwnerPawn.Role == ROLE_Authority )
	{
		NewArmor = OwnerPawn.default.MaxArmor * GetPassiveValue( HeavyBodyArmor, CurrentLevel );
		OwnerPawn.AddArmor( Round( NewArmor ) );
	}
}

/**
 * @brief(Server) Modify Instigator settings based on selected perk
 */
function ApplyWeightLimits()
{
	local KFInventoryManager KFIM;

	KFIM = KFInventoryManager(OwnerPawn.InvManager);
	if( KFIM != none )
	{
		if( IsBigPocketsActive() )
		{
			;
			KFIM.MaxCarryBlocks = KFIM.default.MaxCarryBlocks + GetSkillValue( PerkSkills[ESurvivalist_BigPockets] );
			CheckForOverWeight( KFIM );
		}
		else
		{
			super.ApplyWeightLimits();
		}
	}
}

function bool ShouldGetAllTheXP()
{
	return true;
}


/* Returns the primary weapon's class path for this perk */
simulated function string GetPrimaryWeaponClassPath()
{
	StartingWeaponClassIndex = Rand(PrimaryWeaponPaths.length);
	AutoBuyLoadOutPath.InsertItem(0,PrimaryWeaponPaths[StartingWeaponClassIndex]);
    return PrimaryWeaponPaths[StartingWeaponClassIndex].default.WeaponClassPath;
}

function bool ShouldAutosellWeapon(class<KFWeaponDefinition> DefClass)
{
    //Because survivalists get a random first weapon in their auto buy load out, if they ever swap
    //      to another valid on-perk T1 then attempt to autobuy, they could be left in situations where
    //      they sell the new valid T1, but don't have enough money to buy any other weapons.  In this
    //      case, we shouldn't sell the weapon if it's also part of the primary weapons that they could
    //      start with in a valid match.
    if (super.ShouldAutosellWeapon(DefClass))
    {
        return PrimaryWeaponPaths.Find(DefClass) == INDEX_NONE;
    }

    return false;
}

/*********************************************************************************************
* @name	 Passives
******************************************************************************************** */
/**
 * @brief Modifies the damage dealt
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
	TempDamage += InDamage * GetPassiveValue( WeaponDamage, CurrentLevel );

	if( DamageCauser != none )
	{
		KFW = GetWeaponFromDamageCauser( DamageCauser );
	}

	if( KFW != none )
	{
		if( KFW.IsMeleeWeapon() && IsMeleeExpertActive() )
		{
			TempDamage +=  InDamage * GetSkillValue( PerkSkills[ESurvivalist_MeleeExpert] );
		}
	}

	;
	InDamage = Round(TempDamage);
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
	TempDamage -= InDamage * GetPassiveValue( DamageResistance, CurrentLevel );
	if (IsMakeThingsGoBoomActive())
	{
		// only for explosive damage
		if (ClassIsChildOf(DamageType, class'KFDT_Explosive'))
		{
			TempDamage = FMax(TempDamage - InDamage * MakeThingsGoBoomExplosiveResistance, 0.0f);
		}
	}

	;
	InDamage = Round( TempDamage );
}

/**
 * @brief Some perk skills modify the melee attack speed
 *
 * @param InDuration delay in between attacks
 */
simulated function ModifyMeleeAttackSpeed( out float InDuration, KFWeapon KFW )
{
	local float TempDuration;

	if( KFW == none || !KFW.IsMeleeWeapon() )
	{
		return;
	}

	TempDuration = InDuration;

	if( IsMeleeExpertActive() )
	{
		TempDuration -= TempDuration * static.GetMeleeExpertAttackSpeedModifier();
	}

	;
	InDuration = TempDuration;
}

/**
 * @brief Weapons and perk skills can affect the jog/sprint speed
 *
 * @param Speed jog/sprint speed
  */
simulated function ModifySpeed( out float Speed )
{
	local float TempSpeed;
	local KFWeapon KFW;


	if( IsMeleeExpertActive() )
	{
		KFW = GetOwnerWeapon();
		if( KFW != none && KFW.IsMeleeWeapon() )
		{
			TempSpeed = Speed + Speed * static.GetMeleeExpertMovementSpeedModifier();
			Speed = TempSpeed;
		}
	}
}

simulated private static function float GetMeleeExpertMovementSpeedModifier()
{
	return default.MeleeExpertMovementSpeedModifier;
}

simulated private static function float GetMeleeExpertAttackSpeedModifier()
{
	return default.MeleeExpertAttackSpeedModifier;
}

simulated function bool HasHeavyArmor()
{
	return true;
}

/**
 * @brief Modifies the reload speed for commando weapons
 *
 * @param ReloadDuration Length of the reload animation
 * @param GiveAmmoTime Time after the weapon actually gets some ammo
 */
simulated function float GetReloadRateScale( KFWeapon KFW )
{
	if( WorldInfo.TimeDilation < 1.f && IsZedTimeReloadAllowed() )
	{
		return 1.f -  GetPassiveValue( ZedTimeReload, GetLevel() );
	}

	if (((IsTacticalReloadActive() && IsWeaponOnPerkLight(KFW)) ||
		(IsHeavyReloadActive() && IsWeaponOnPerkHeavy(KFW)))
		&& TacticalReloadAsReloadRateClassNames.Find(KFW.class.Name) != INDEX_NONE)
	{
		return 0.8f;
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

/**
 * @brief Modifies the pawn's MaxArmor
 *
 * @param MaxArmor the maximum armor value
 */
function ModifyArmor( out byte MaxArmor )
{
	local float TempArmor;

	if( HasHeavyArmor() )
	{
		TempArmor = MaxArmor;
		TempArmor += MaxArmor * GetPassiveValue( HeavyBodyArmor, CurrentLevel );
		MaxArmor = Round( TempArmor );
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
	return (((IsTacticalReloadActive() && IsWeaponOnPerkLight(KFW)) ||
			(IsHeavyReloadActive() && IsWeaponOnPerkHeavy(KFW))) &&
		    TacticalReloadAsReloadRateClassNames.Find(KFW.class.Name) == INDEX_NONE);
}

simulated function bool IsWeaponOnPerkLight( KFWeapon KFW )
{
	if( KFW != none )
	{
		return (class'KFPerk_Commando'.static.IsWeaponOnPerk( KFW,, class'KFPerk_Commando' ) ||
				class'KFPerk_Gunslinger'.static.IsWeaponOnPerk( KFW,, class'KFPerk_Gunslinger' ) ||
				class'KFPerk_SWAT'.static.IsWeaponOnPerk( KFW,, class'KFPerk_SWAT' ));
	}

	return false;
}

simulated function bool IsWeaponOnPerkHeavy( KFWeapon KFW )
{
	if( KFW != none )
	{
		return (class'KFPerk_Demolitionist'.static.IsWeaponOnPerk( KFW,, class'KFPerk_Demolitionist' ) ||
				class'KFPerk_Support'.static.IsWeaponOnPerk( KFW,, class'KFPerk_Support' ) ||
				class'KFPerk_Sharpshooter'.static.IsWeaponOnPerk( KFW,, class'KFPerk_Sharpshooter' ) ||
				KFW.IsA('KFPerk_Survivalist') ||
				(KFW.IsHeavyWeapon() && IsWeaponOnPerk(KFW)) );
	}


	return false;
}

/**
 * @brief Modifies how long one recharge cycle takes
 *
 * @param RechargeRate charging rate per sec
  */
simulated function ModifyHealerRechargeTime( out float RechargeRate )
{
    if( IsFieldMedicActive() )
    {
    	RechargeRate -= RechargeRate * GetSkillValue(  PerkSkills[ESurvivalist_FieldMedic] );
    }
}

/**
 * @brief Modifies how potent one healing shot is
 *
 * @param HealAmount health repaired
 * @return true if Armament is active to repair armor if possible
 */
function bool ModifyHealAmount( out float HealAmount )
{
	 if( IsFieldMedicActive() )
    {
		HealAmount *= static.GetInjectionPotencyModifier();
	}

	return IsFieldMedicActive();
}

static private function float GetInjectionPotencyModifier()
{
	return default.InjectionPotencyModifier;
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
	local bool bUsesAmmo;
	local float TempMaxSpareAmmoAmount;

	bUsesAmmo = (KFW == none) ? TraderItem.WeaponDef.static.UsesAmmo() : KFW.UsesAmmo();
	if( IsAmmoVestActive() && bUsesAmmo )
	{
		TempMaxSpareAmmoAmount = MaxSpareAmmo;
		TempMaxSpareAmmoAmount += MaxSpareAmmo * GetSkillValue( PerkSkills[ESurvivalist_AmmoVest] );
		MaxSpareAmmo = Round( TempMaxSpareAmmoAmount );
	}
}

/**
 * @brief Checks if a zed could potentially explode later
 *
 * @param KFDT damage type used to deal damage
 * @return if the zed could explode when dying
 */
function bool CouldBeZedShrapnel( class<KFDamageType> KFDT )
{
	return IsZedShrapnelActive();
}

/**
 * @brief The Zed shrapnel skill can spawn an explosion, this function delivers the template
 *
 * @return A game explosion template
 */
function GameExplosion GetExplosionTemplate()
{
	return default.ShrapnelExplosionTemplate;
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

simulated function float GetAoERadiusModifier()
{
	return IsMakeThingsGoBoomActive() ? GetSkillValue( PerkSkills[ESurvivalist_MakeThingsGoBoom] ) : 1.f;
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

	if( GetMadManActive() && !W.IsMeleeWeapon() )
	{
		StateName = W.GetStateName();
		if( ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
		{
			return GetSkillValue( PerkSkills[ESurvivalist_MadMan] );
		}
	}

	return 0.f;
}

/**
 * @brief Skills can can change the knock down power
 * @return knock down power in %
 */
function float GetKnockdownPowerModifier( optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting=false )
{
	if( GetIncapMasterActive() )
	{
		;
		return GetSkillValue( PerkSkills[ESurvivalist_IncapMaster] );
	}

	return 0.f;
}

/**
 * @brief skills and weapons can modify the stumbling power
 * @return stumpling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart )
{
	if( GetIncapMasterActive() )
	{
		;
        return GetSkillValue( PerkSkills[ESurvivalist_IncapMaster] );
	}

	return 0.f;
}

/**
 * @brief skills and weapons can modify the stun power
 * @return stun power modifier
 */
function float GetStunPowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx )
{
	if( GetIncapMasterActive() )
	{
		;
		return GetSkillValue( PerkSkills[ESurvivalist_IncapMaster] );
	}

    return 0.f;
}

simulated function float GetSnarePowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx )
{
	if( GetIncapMasterActive() )
	{
		return default.SnarePower;
	}

	return 0.f;
}

/* Returns the grenade class for this perk */
simulated function class< KFProj_Grenade > GetGrenadeClass()
{
    if( IsAmmoVestActive() )
    {
    	return class<KFProj_Grenade>(DynamicLoadObject(HealingGrenadeWeaponDef.default.WeaponClassPath, class'Class'));
    }
    else if( IsBigPocketsActive() )
    {
		return class<KFProj_Grenade>(DynamicLoadObject(MolotovGrenadeWeaponDef.default.WeaponClassPath, class'Class'));
    }

    return GrenadeClass;
}

/*********************************************************************************************
* @name	 Getters etc
********************************************************************************************* */
/**
 * @brief Checks if tactical reload skill is active (client & server)
 *
 * @return true/false
 */
simulated private function bool IsTacticalReloadActive()
{
	return PerkSkills[ESurvivalist_TacticalReload].bActive && IsPerkLevelAllowed(ESurvivalist_TacticalReload);
}

/**
 * @brief Checks if the heavy weapons reload skill is active (client & server)
 *
 * @return true/false
 */
simulated private function bool IsHeavyReloadActive()
{
	return PerkSkills[ESurvivalist_HeavyWeaponsReload].bActive && IsPerkLevelAllowed(ESurvivalist_HeavyWeaponsReload);
}

/**
 * @brief Checks if Field Medic skill is active
 *
 * @return true/false
 */
simulated private function bool IsFieldMedicActive()
{
	return PerkSkills[ESurvivalist_FieldMedic].bActive && IsPerkLevelAllowed(ESurvivalist_FieldMedic);
}

/**
 * @brief Checks if Melee Expert skill is active
 *
 * @return true/false
 */
simulated private function bool IsMeleeExpertActive()
{
	return PerkSkills[ESurvivalist_MeleeExpert].bActive && IsPerkLevelAllowed(ESurvivalist_MeleeExpert);
}

/**
 * @brief Checks if Big Pockets skill is active
 *
 * @return true/false
 */
simulated private function bool IsAmmoVestActive()
{
	return PerkSkills[ESurvivalist_AmmoVest].bActive && IsPerkLevelAllowed(ESurvivalist_AmmoVest);
}

/**
 * @brief Checks if Big Pockets skill is active
 *
 * @return true/false
 */
simulated private function bool IsBigPocketsActive()
{
	return PerkSkills[ESurvivalist_BigPockets].bActive && IsPerkLevelAllowed(ESurvivalist_BigPockets);
}

/**
 * @brief Checks if Big Pockets skill is active
 *
 * @return true/false
 */
simulated private function bool IsZedShrapnelActive()
{
	return PerkSkills[ESurvivalist_Shrapnel].bActive && IsPerkLevelAllowed(ESurvivalist_Shrapnel);
}

/**
 * @brief Checks if Big Pockets skill is active
 *
 * @return true/false
 */
simulated private function bool IsMakeThingsGoBoomActive()
{
	return PerkSkills[ESurvivalist_MakeThingsGoBoom].bActive && IsPerkLevelAllowed(ESurvivalist_MakeThingsGoBoom);
}

/**
 * @brief Checks if the Madman skill is active and if we are in zed time
 *
 * @return true/false
 */
simulated function bool GetMadManActive()
{
	return IsMadManActive() && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Checks if Big Pockets skill is active
 *
 * @return true/false
 */
simulated private function bool IsMadManActive()
{
	return PerkSkills[ESurvivalist_MadMan].bActive && IsPerkLevelAllowed(ESurvivalist_MadMan);
}

/**
 * @brief Checks if the Incap Master skill is active and if we are in zed time
 *
 * @return true/false
 */
simulated function bool GetIncapMasterActive()
{
	return IsIncapMasterActive() && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Checks if Incap Master skill is active
 *
 * @return true/false
 */
simulated private function bool IsIncapMasterActive()
{
	return PerkSkills[ESurvivalist_IncapMaster].bActive && IsPerkLevelAllowed(ESurvivalist_IncapMaster);
}

/*********************************************************************************************
* @name	 UI
********************************************************************************************* */
simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Left( string(GetPassiveValue( default.WeaponDamage, Level ) * 100 ), InStr(string(GetPassiveValue( default.WeaponDamage, Level ) * 100 ), ".") + 2 ) $ "%";
	PassiveValues[1] = Round( GetPassiveValue( default.DamageResistance, Level ) * 100 ) $ "%";
	PassiveValues[2] = Round( GetPassiveValue( default.HeavyBodyArmor, Level ) * 100 ) $ "%";
	PassiveValues[3] = Round( GetPassiveValue( default.ZedTimeReload, Level ) * 100 ) $ "%";

	Increments[0] = "[" @ Left( string( default.WeaponDamage.Increment * 100 ), 	InStr(string(default.WeaponDamage.Increment * 100), ".") + 2 ) 		$ "% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ Left( string( default.DamageResistance.Increment * 100 ), InStr(string(default.DamageResistance.Increment * 100), ".") + 2 ) 	$ "% /" @ default.LevelString @ "]";
	Increments[2] = "[" @ Left( string( default.HeavyBodyArmor.Increment * 100 ),	InStr(string(default.HeavyBodyArmor.Increment * 100), ".") + 2 ) 	$ "% /" @ default.LevelString @ "]";
	Increments[3] = "[" @ Left( string( default.ZedTimeReload.Increment * 100 ),	InStr(string(default.ZedTimeReload.Increment * 100), ".") + 2 ) 	$ "% /" @ default.LevelString @ "]";
}

simulated function string GetGrenadeImagePath()
{
	if( IsAmmoVestActive() )
    {
		return default.HealingGrenadeWeaponDef.Static.GetImagePath();
    }
    else if( IsBigPocketsActive() )
    {
		return default.MolotovGrenadeWeaponDef.Static.GetImagePath();
	}

	return default.GrenadeWeaponDef.Static.GetImagePath();
}


simulated function class<KFWeaponDefinition> GetGrenadeWeaponDef()
{
	if( IsAmmoVestActive() )
    {
		return default.HealingGrenadeWeaponDef;
    }
    else if( IsBigPocketsActive() )
    {
		return default.MolotovGrenadeWeaponDef;
	}

	return default.GrenadeWeaponDef;
}

defaultproperties
{
   WeaponDamage=(Name="Weapon Damage",Increment=0.006000,MaxValue=0.150000)
   DamageResistance=(Name="Damage Resistance",Increment=0.010000,MaxValue=0.250000)
   HeavyBodyArmor=(Name="Heavy Body Armor",Increment=0.010000,MaxValue=0.250000)
   ZedTimeReload=(Name="Zed Time Reload",Increment=0.030000,MaxValue=0.750000)
   InjectionPotencyModifier=1.300000
   MeleeExpertAttackSpeedModifier=0.200000
   ShrapnelExplosionTemplate=KFGameExplosion'KFGame.Default__KFPerk_Survivalist:ExploTemplate0'
   ShrapnelChance=0.300000
   SnarePower=20.000000
   MeleeExpertMovementSpeedModifier=0.250000
   HealingGrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Medic'
   MolotovGrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Firebug'
   PrimaryWeaponPaths(0)=Class'KFGame.KFWeapDef_AR15'
   PrimaryWeaponPaths(1)=Class'KFGame.KFWeapDef_MB500'
   PrimaryWeaponPaths(2)=Class'KFGame.KFWeapDef_Crovel'
   PrimaryWeaponPaths(3)=Class'KFGame.KFWeapDef_HX25'
   PrimaryWeaponPaths(4)=Class'KFGame.KFWeapDef_MedicPistol'
   PrimaryWeaponPaths(5)=Class'KFGame.KFWeapDef_CaulkBurn'
   PrimaryWeaponPaths(6)=Class'KFGame.KFWeapDef_Remington1858Dual'
   PrimaryWeaponPaths(7)=Class'KFGame.KFWeapDef_Winchester1894'
   PrimaryWeaponPaths(8)=Class'KFGame.KFWeapDef_MP7'
   StartingWeaponClassIndex=-1
   TacticalReloadAsReloadRateClassNames(0)="KFWeap_GrenadeLauncher_M32"
   MakeThingsGoBoomExplosiveResistance=0.400000
   ProgressStatID=70
   PerkBuildStatID=71
   PerkName="Survivalist"
   Passives(0)=(Title="Weapon Damage",Description="Increase weapon damage %x% per level")
   Passives(1)=(Title="Global Damage Resistance",Description="Increase resistance to all damage %x% per level")
   Passives(2)=(Title="Heavy Body Armor",Description="%x% every level (max 25%) take no health damage if you have armor.")
   Passives(3)=(Title="Zedtime Reload",Description="Increase reload speed in Zed time %x% per level")
   Passives(4)=()
   SkillCatagories(0)="Weapon Handling"
   SkillCatagories(1)="Survival Techniques"
   SkillCatagories(2)="Equipment"
   SkillCatagories(3)="Destruction"
   SkillCatagories(4)="Specialist Training"
   EXPAction1="Dealing weapon damage with any weapon"
   EXPAction2="Killing Clots with any weapons"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Survivalist'
   PerkSkills(0)=(Name="TacticalReload",StartingValue=0.250000,MaxValue=0.250000,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_TacticalReload")
   PerkSkills(1)=(Name="HeavyWeaponsReload",StartingValue=2.500000,MaxValue=2.500000,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_HeavyWeapons")
   PerkSkills(2)=(Name="FieldMedic",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_FieldMedic")
   PerkSkills(3)=(Name="MeleeExpert",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_MeleeExpert")
   PerkSkills(4)=(Name="AmmoVest",StartingValue=0.150000,MaxValue=0.150000,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_AmmoVest")
   PerkSkills(5)=(Name="BigPockets",StartingValue=5.000000,MaxValue=5.000000,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_BigPockets")
   PerkSkills(6)=(Name="ZedShrapnel",StartingValue=2.000000,MaxValue=2.000000,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_Shrapnel")
   PerkSkills(7)=(Name="MakeThingsGoBoom",StartingValue=1.400000,MaxValue=1.400000,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_Boom")
   PerkSkills(8)=(Name="MadMan",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_Madman")
   PerkSkills(9)=(Name="IncapMaster",StartingValue=1.000000,MaxValue=1.000000,IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_IncapMaster")
   ZedTimeModifyingStates(0)="WeaponFiring"
   ZedTimeModifyingStates(1)="WeaponBurstFiring"
   ZedTimeModifyingStates(2)="WeaponSingleFiring"
   ZedTimeModifyingStates(3)="WeaponSingleFireAndReload"
   ZedTimeModifyingStates(4)="SprayingFire"
   ZedTimeModifyingStates(5)="WeaponAltFiring"
   ZedTimeModifyingStates(6)="HuskCannonCharge"
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_Random'
   KnifeWeaponDef=Class'KFGame.KFWeapDef_Knife_Survivalist'
   GrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Commando'
   AutoBuyLoadOutPath(0)=Class'KFGame.KFWeapDef_DragonsBreath'
   AutoBuyLoadOutPath(1)=Class'KFGame.KFWeapDef_FreezeThrower'
   AutoBuyLoadOutPath(2)=Class'KFGame.KFWeapDef_MedicRifle'
   AutoBuyLoadOutPath(3)=Class'KFGame.KFWeapDef_LazerCutter'
   PrestigeRewardItemIconPaths(0)="WEP_SkinSet_Prestige01_Item_TEX.knives.SurvivalistKnife_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(1)="WEP_SkinSet_Prestige02_Item_TEX.tier01.FreezeThrower_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(2)="WEP_skinset_prestige03_itemtex.tier02.TommyGun_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(3)="wep_skinset_prestige04_itemtex.tier03.VLAD-1000Nailgun_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(4)="WEP_SkinSet_Prestige05_Item_TEX.tier04.Killerwatt_PrestigePrecious_Mint_large"
   Name="Default__KFPerk_Survivalist"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
