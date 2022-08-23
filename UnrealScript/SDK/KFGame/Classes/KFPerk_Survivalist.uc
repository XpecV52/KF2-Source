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
			`QALog( "Big Pockets Mod" @ GetPercentage(KFIM.MaxCarryBlocks, KFIM.default.MaxCarryBlocks + PerkSkills[ESurvivalist_BigPockets].StartingValue), bLogPerk );
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

	`QALog( "Total Damage Given" @ DamageType @ KFW @ GetPercentage( InDamage, Round(TempDamage) ), bLogPerk );
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

	`QALog( "Total DamageResistance" @ DamageType @ GetPercentage( InDamage, Round( TempDamage ) ) @ "Start/End" @ InDamage @ Round( TempDamage ), bLogPerk );
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

	`QALog( "Total, Melee Attack Speed" @ GetPercentage( InDuration, TempDuration ) @ "Start/End" @ InDuration @ TempDuration, bLogPerk );
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
	if( WorldInfo.TimeDilation < 1.f )
	{
		return 1.f -  GetPassiveValue( ZedTimeReload, GetLevel() );
	}

	return 1.f;
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
	return ( (IsTacticalReloadActive() && IsWeaponOnPerkLight( KFW )) ||
			 (IsHeavyReloadActive() && IsWeaponOnPerkHeavy( KFW )) );
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
		`QALog( "LimbShots knockdown, Hit" @ BodyPart @ GetSkillValue( PerkSkills[ESurvivalist_IncapMaster] ), bLogPerk );
		return GetSkillValue( PerkSkills[ESurvivalist_IncapMaster] );
	}

	return 1.f;
}

/**
 * @brief skills and weapons can modify the stumbling power
 * @return stumpling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart )
{
	if( GetIncapMasterActive() )
	{
		`QALog( "CenterMass Stumble, Hit" @ BodyPart @ GetSkillValue( PerkSkills[ESurvivalist_IncapMaster] ), bLogPerk );
        return GetSkillValue( PerkSkills[ESurvivalist_IncapMaster] );
	}

	return 1.f;
}

/**
 * @brief skills and weapons can modify the stun power
 * @return stun power modifier
 */
function float GetStunPowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx )
{
	if( GetIncapMasterActive() )
	{
		`QALog( "(ZT Stun)" @ GetSkillValue(PerkSkills[ESharpshooterZTStun]), bLogPerk );
		return GetSkillValue( PerkSkills[ESurvivalist_IncapMaster] );
	}

    return 1.f;
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
	return PerkSkills[ESurvivalist_TacticalReload].bActive;
}

/**
 * @brief Checks if the heavy weapons reload skill is active (client & server)
 *
 * @return true/false
 */
simulated private function bool IsHeavyReloadActive()
{
	return PerkSkills[ESurvivalist_HeavyWeaponsReload].bActive;
}

/**
 * @brief Checks if Field Medic skill is active
 *
 * @return true/false
 */
simulated private function bool IsFieldMedicActive()
{
	return PerkSkills[ESurvivalist_FieldMedic].bActive;
}

/**
 * @brief Checks if Melee Expert skill is active
 *
 * @return true/false
 */
simulated private function bool IsMeleeExpertActive()
{
	return PerkSkills[ESurvivalist_MeleeExpert].bActive;
}

/**
 * @brief Checks if Big Pockets skill is active
 *
 * @return true/false
 */
simulated private function bool IsAmmoVestActive()
{
	return PerkSkills[ESurvivalist_AmmoVest].bActive;
}

/**
 * @brief Checks if Big Pockets skill is active
 *
 * @return true/false
 */
simulated private function bool IsBigPocketsActive()
{
	return PerkSkills[ESurvivalist_BigPockets].bActive;
}

/**
 * @brief Checks if Big Pockets skill is active
 *
 * @return true/false
 */
simulated private function bool IsZedShrapnelActive()
{
	return PerkSkills[ESurvivalist_Shrapnel].bActive;
}

/**
 * @brief Checks if Big Pockets skill is active
 *
 * @return true/false
 */
simulated private function bool IsMakeThingsGoBoomActive()
{
	return PerkSkills[ESurvivalist_MakeThingsGoBoom].bActive;
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
	return PerkSkills[ESurvivalist_MadMan].bActive;
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
	return PerkSkills[ESurvivalist_IncapMaster].bActive;
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

DefaultProperties
{
	StartingWeaponClassIndex=Index_None
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Survivalist'
	
	PrimaryWeaponDef=class'KFWeapDef_Random'
	KnifeWeaponDef=class'KFweapDef_Knife_Support'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Commando'
	HealingGrenadeWeaponDef=class'KFWeapDef_Grenade_Medic'
	MolotovGrenadeWeaponDef=class'KFWeapDef_Grenade_Firebug'

	ProgressStatID=STATID_Surv_Progress
   	PerkBuildStatID=STATID_Surv_Build

	WeaponDamage=(Name="Weapon Damage",Increment=0.006f,Rank=0,StartingValue=0.f,MaxValue=0.15f)
	DamageResistance=(Name="Damage Resistance",Increment=0.01,Rank=0,StartingValue=0.f,MaxValue=0.25)
	HeavyBodyArmor=(Name="Heavy Body Armor",Increment=0.01,Rank=0,StartingValue=0.f,MaxValue=0.25)
   	ZedTimeReload=(Name="Zed Time Reload",Increment=0.03f,Rank=0,StartingValue=0.f,MaxValue=0.75f)
	
 	PerkSkills(ESurvivalist_TacticalReload)=(Name="TacticalReload",IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_TacticalReload", Increment=0.f,Rank=0,StartingValue=0.25,MaxValue=0.25)    //0.1
	PerkSkills(ESurvivalist_HeavyWeaponsReload)=(Name="HeavyWeaponsReload",IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_HeavyWeapons", Increment=0.f,Rank=0,StartingValue=2.5f,MaxValue=2.5f)
	PerkSkills(ESurvivalist_FieldMedic)=(Name="FieldMedic",IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_FieldMedic", Increment=0.f,Rank=0,StartingValue=0.25f,MaxValue=0.25f)
	PerkSkills(ESurvivalist_MeleeExpert)=(Name="MeleeExpert",IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_MeleeExpert", Increment=0.f,Rank=0,StartingValue=0.1f,MaxValue=0.1f)
	PerkSkills(ESurvivalist_AmmoVest)=(Name="AmmoVest",IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_AmmoVest", Increment=0.f,Rank=0,StartingValue=0.15f,MaxValue=0.15f)
	PerkSkills(ESurvivalist_BigPockets)=(Name="BigPockets",IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_BigPockets", Increment=0.f,Rank=0,StartingValue=5.f,MaxValue=5.f)
	PerkSkills(ESurvivalist_Shrapnel)=(Name="ZedShrapnel",IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_Shrapnel", Increment=0.f,Rank=0,StartingValue=2.f,MaxValue=2.f)
	PerkSkills(ESurvivalist_MakeThingsGoBoom)=(Name="MakeThingsGoBoom",IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_Boom", Increment=0.f,Rank=0,StartingValue=1.25f,MaxValue=1.25f)
	PerkSkills(ESurvivalist_MadMan)=(Name="MadMan",IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_Madman", Increment=0.f,Rank=0,StartingValue=0.5f,MaxValue=0.5f)
	PerkSkills(ESurvivalist_IncapMaster)=(Name="IncapMaster",IconPath="UI_PerkTalent_TEX.Survivalist.UI_Talents_Survivalist_IncapMaster", Increment=0.f,Rank=0,StartingValue=2.f,MaxValue=2.f)

	InjectionPotencyModifier=1.20
	MeleeExpertAttackSpeedModifier=0.15f
	ShrapnelChance=0.2f
	SnarePower=20
	MeleeExpertMovementSpeedModifier=0.25 //0.25

	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=10  //231  //120
		DamageRadius=200   //840  //600
		DamageFalloffExponent=1
		DamageDelay=0.f
		MyDamageType=class'KFDT_Explosive_Shrapnel'

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
	ShrapnelExplosionTemplate=ExploTemplate0

   	ZedTimeModifyingStates(0)="WeaponFiring"
   	ZedTimeModifyingStates(1)="WeaponBurstFiring"
   	ZedTimeModifyingStates(2)="WeaponSingleFiring"
   	ZedTimeModifyingStates(3)="WeaponSingleFireAndReload"
   	ZedTimeModifyingStates(4)="SprayingFire"

   	PrimaryWeaponPaths(0)=class'KFWeapDef_AR15'
   	PrimaryWeaponPaths(1)=class'KFWeapDef_MB500'
   	PrimaryWeaponPaths(2)=class'KFWeapDef_Crovel'
   	PrimaryWeaponPaths(3)=class'KFWeapDef_HX25'
   	PrimaryWeaponPaths(4)=class'KFWeapDef_MedicPistol'
   	PrimaryWeaponPaths(5)=class'KFWeapDef_CaulkBurn'
   	PrimaryWeaponPaths(6)=class'KFWeapDef_Remington1858Dual'
   	PrimaryWeaponPaths(7)=class'KFWeapDef_Winchester1894'
   	PrimaryWeaponPaths(8)=class'KFWeapDef_MP7'
   	AutoBuyLoadOutPath=(class'KFWeapDef_DragonsBreath', class'KFWeapDef_M16M203', class'KFWeapDef_MedicRifle')
}
