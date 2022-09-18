//=============================================================================
// KFPerk_FieldMedic
//=============================================================================
// The medic perk class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFPerk_FieldMedic extends KFPerk
	native;

//`include(KFOnlineStats.uci)

/** Passive skills */
var	const PerkSkill 				HealerRecharge;
var	const PerkSkill 				HealPotency;
var	const PerkSkill					BloatBileResistance;
var	const PerkSkill					MovementSpeed;
var	const PerkSkill					Armor;

var const private float				SelfHealingSurgePct;
var const private float				MaxSurvivalistResistance;
var const private float				CombatantSpeedModifier;
var const private float				MaxHealingSpeedBoost;
var const private float				HealingSpeedBoostDuration;
var const private float				MaxHealingDamageBoost;
var const private float				HealingDamageBoostDuration;
var const private float				MaxHealingShield;
var const private float				HealingShieldDuration;
var const private ParticleSystem 	AAParticleSystem;
var const private float 			SnarePower;
var private const float				SnareSpeedModifier;

/** Defines the explosion. */
var 	  private KFGameExplosion	AAExplosionTemplate;
var const private class<KFDamageType> AAExplosionDamageType;

/** Toxic cloud explosion */
var private KFGameExplosion	TCExplosionTemplate;
var class<KFExplosionActor>	ZedativeCloudExplosionActorClass;

var float ZedativeExplosionDelay;
var int ZedativeHealth;
var int ZedativeDamage;
var class<KFDamageType> ZedativeDamageType;
var class<KFDamageType> ZedativeHealingType;
var int ZedativeEffectRadius;

enum EMedicPerkSkills
{
	EMedicHealingSurge,
	EMedicSurvivalist,
	EMedicHealingSpeedBoost,
	EMedicCombatant,
	EMedicHealingDamageBoost,
	EMedicAcidicCompound,
	EMedicHealingShield,
	EMedicEnforcer,
	EMedicAirborneAgent,
	EMedicZedative
};

/*********************************************************************************************
* @name	 Perk init and spawning
******************************************************************************************** */


/*********************************************************************************************
* @name	 Passive skills functions
********************************************************************************************* */

/**
 * @brief Modifies how long one recharge cycle takes
 *
 * @param RechargeRate charging rate per sec
  */
simulated function ModifyHealerRechargeTime( out float RechargeRate )
{
    local float HealerRechargeTimeMod;

    HealerRechargeTimeMod = GetPassiveValue( HealerRecharge, GetLevel() );
    ;
	RechargeRate /= HealerRechargeTimeMod;
}

/**
 * @brief Modifies how potent one healing shot is
 *
 * @param HealAmount health repaired
 * @return true if Armament is active to repair armor if possible
 */
function bool ModifyHealAmount( out float HealAmount )
{
	HealAmount *= GetPassiveValue( HealPotency, GetLevel() );

	return IsHealingSurgeActive();
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
	local float SurvivalistResistance;

	if( InDamage <= 0 )
	{
		return;
	}

	TempDamage = InDamage;

	switch( DamageType.Name )
	{
		case 'KFDT_BloatPuke':
			TempDamage -= TempDamage * GetPassiveValue( BloatBileResistance, GetLevel() );
			FMax( TempDamage, 1.f );
		break;
	}

	if( IsSurvivalistActive() )
	{
		SurvivalistResistance = (OwnerPawn.HealthMax - OwnerPawn.Health) * GetSkillValue( PerkSkills[EMedicSurvivalist] );
		TempDamage -= TempDamage * FMin( SurvivalistResistance, MaxSurvivalistResistance );
		;
	}

	;
	InDamage = Round( TempDamage );
}

/**
 * @brief Weapons and perk skills can affect the jog/sprint speed
 *
 * @param Speed jog/sprint speed
  */
simulated function ModifySpeed( out float Speed )
{
	local float TempSpeed;

	TempSpeed = Speed + Speed * GetPassiveValue( MovementSpeed, GetLevel() );

	if( IsCombatantActive() )
	{
		TempSpeed += Speed * static.GetComabatantSpeedModifier();
	}

	Speed = TempSpeed;
}

private simulated static function float GetComabatantSpeedModifier()
{
	return default.CombatantSpeedModifier;
}
/**
 * @brief Modifies the pawn's MaxArmor
 *
 * @param MaxArmor the maximum armor value
 */
function ModifyArmor( out byte MaxArmor )
{
	local float TempArmor;

	TempArmor = MaxArmor;
	TempArmor *= GetPassiveValue( Armor, GetLevel() );
	;
	MaxArmor = FCeil( TempArmor );
}

/*********************************************************************************************
* @name	 Selectable skills functions
********************************************************************************************* */

/**
 * @brief modifies the players health
 *
 * @param InHealth health
  */
function ModifyHealth( out int InHealth )
{
	local float TempHealth;

	if( IsHealingSurgeActive() )
	{
		TempHealth = InHealth;
		TempHealth += InHealth * GetSkillValue( PerkSkills[EMedicHealingSurge] );
		;
		InHealth = Round( TempHealth );
	}
}

simulated function float GetSelfHealingSurgePct()
{
	return default.SelfHealingSurgePct;
}

/**
 * @brief Modifies mag capacity and count
 *
 * @param KFW the weapon
 * @param MagazineCapacity modified mag capacity
 * @param WeaponPerkClass the weapon's associated perk class (optional)
 */
simulated function ModifyMagSizeAndNumber( KFWeapon KFW, out int MagazineCapacity, optional array< Class<KFPerk> > WeaponPerkClass, optional bool bSecondary=false, optional name WeaponClassname )
{
	local float TempCapacity;

	TempCapacity = MagazineCapacity;

	if( IsWeaponOnPerk( KFW, WeaponPerkClass, self.class ) && (KFW == none || !KFW.bNoMagazine) && !bSecondary )
	{
		if( IsCombatantActive() )
		{
			TempCapacity += MagazineCapacity * GetSkillValue( PerkSkills[EMedicCombatant] );
		}
	}

	MagazineCapacity = Round( TempCapacity );
}

simulated function bool GetHealingSpeedBoostActive()
{
	return IsHealingSpeedBoostActive();
}

simulated static function byte GetHealingSpeedBoost()
{
	return byte(GetSkillValue( default.PerkSkills[EMedicHealingSpeedBoost] ));
}

simulated static function byte GetMaxHealingSpeedBoost()
{
	return default.MaxHealingSpeedBoost;
}

simulated static function float GetHealingSpeedBoostDuration()
{
	return default.HealingSpeedBoostDuration;
}

simulated function bool GetHealingDamageBoostActive()
{
	return IsHealingDamageBoostActive();
}

simulated static function byte GetHealingDamageBoost()
{
	return byte(GetSkillValue( default.PerkSkills[EMedicHealingDamageBoost] ));
}

simulated static function byte GetMaxHealingDamageBoost()
{
	return default.MaxHealingDamageBoost;
}

simulated static function float GetHealingDamageBoostDuration()
{
	return default.HealingDamageBoostDuration;
}

simulated function bool GetHealingShieldActive()
{
	return IsHealingShieldActive();
}

simulated static function byte GetHealingShield()
{
	return byte(GetSkillValue( default.PerkSkills[EMedicHealingShield] ));
}

simulated static function byte GetMaxHealingShield()
{
	return default.MaxHealingShield;
}

simulated static function float GetHealingShieldDuration()
{
	return default.HealingShieldDuration;
}

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

	if( DamageCauser != none )
	{
		KFW = GetWeaponFromDamageCauser( DamageCauser );
	}

	if( KFW != none )
	{
		if( IsEnforcerActive() && IsWeaponOnPerk( KFW,, self.class )  )
		{
			TempDamage += InDamage * GetSkillValue( PerkSkills[EMedicEnforcer] );
			;
		}
		
		if( IsZedativeActive() && IsWeaponOnPerk( KFW,, self.class ) )
		{
			TempDamage += InDamage * GetSkillValue( PerkSkills[EMedicZedative] );
			;
		}
	}


	;
	InDamage = Round(TempDamage);
}

/** Takes the weapons primary damage and calculates the poisoning over time value */
/**
 * @brief  Takes the weapons primary damage and calculates the bleeding over time value
 *
 * @param ToxicDamage the bleeding damage
 */
static function ModifyToxicDmg( out int ToxicDamage )
{
	local float TempDamage;

	TempDamage = float(ToxicDamage) * GetSkillValue( default.PerkSkills[EMedicAcidicCompound] );
	ToxicDamage = FCeil( TempDamage );
}

function NotifyZedTimeStarted()
{
	if( IsAirborneAgentActive() && OwnerPawn != none && OwnerPawn.IsAliveAndWell() )
	{
		OwnerPawn.StartAirBorneAgentEvent();
	}
}

simulated static function KFGameExplosion GetAAExplosionTemplate()
{
	return default.AAExplosionTemplate;
}

simulated static function class<DamageType> GetAADamageTypeClass()
{
	return default.AAExplosionDamageType;
}

simulated static function class<KFExplosion_AirborneAgent> GetAAExplosionActorClass()
{
	return class'KFExplosion_AirborneAgent';
}

simulated static function ParticleSystem GetAAEffect()
{
	return default.AAParticleSystem;
}

simulated function float GetSnareSpeedModifier()
{
	return IsZedativeActive() ? SnareSpeedModifier : 1.f;
}

simulated function float GetSnarePowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx )
{
	if( IsZedativeActive() && DamageType != none && IsDamageTypeOnPerk( class<KFDamageType>(DamageType) ) )
	{
		return default.SnarePower;
	}

	return 0.f;
}


/*********************************************************************************************
* @name Getters
********************************************************************************************* */
/**
 * @brief Checks if the Airborne Agent is active and we are in zed time
 * @return true/false
 */
private final function bool IsAirborneAgentActive()
{
	return PerkSkills[EMedicAirborneAgent].bActive && IsPerkLevelAllowed(EMedicAirborneAgent);
}

/**
 * @brief Checks if Acidic Compound skill is active
 *
 * @return true/false
 */
function bool IsAcidicCompoundActive()
{
	return PerkSkills[EMedicAcidicCompound].bActive && IsPerkLevelAllowed(EMedicAcidicCompound);
}

/**
 * @brief  Can we give poisoning damage over time?
 *
 * @return true if we have the skill and the currently used weapon can poison zeds
 */
function bool IsToxicDmgActive()
{
	return IsAcidicCompoundActive() && IsWeaponOnPerk( GetOwnerWeapon(),, self.class );
}

/**
 * @brief Checks if the Healing Speed Boost skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsHealingSpeedBoostActive()
{
	return PerkSkills[EMedicHealingSpeedBoost].bActive && IsPerkLevelAllowed(EMedicHealingSpeedBoost);
}

/**
 * @brief Checks if the Healing Damage Boost skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsHealingDamageBoostActive()
{
	return PerkSkills[EMedicHealingDamageBoost].bActive && IsPerkLevelAllowed(EMedicHealingDamageBoost);
}

/**
 * @brief Checks if the Healing Shield skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsHealingShieldActive()
{
	return PerkSkills[EMedicHealingShield].bActive && IsPerkLevelAllowed(EMedicHealingShield);
}

/**
 * @brief Checks if the Combatant skill is active Network: client and server.
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsCombatantActive()
{
	return PerkSkills[EMedicCombatant].bActive && IsPerkLevelAllowed(EMedicCombatant);
}

/**
 * @brief Checks if the Enforcer skill is active Network: client and server.
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsEnforcerActive()
{
	return PerkSkills[EMedicEnforcer].bActive && IsPerkLevelAllowed(EMedicEnforcer);
}

/**
 * @brief Checks if the healing surge skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsHealingSurgeActive()
{
	return PerkSkills[EMedicHealingSurge].bActive && IsPerkLevelAllowed(EMedicHealingSurge);
}

/**
 * @brief Checks if the Survivalist skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsSurvivalistActive()
{
	return PerkSkills[EMedicSurvivalist].bActive && IsPerkLevelAllowed(EMedicSurvivalist);
}

/**
 * @brief Checks if the Zedative skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsZedativeActive()
{
	return PerkSkills[EMedicZedative].bActive && WorldInfo.TimeDilation < 1.f && IsPerkLevelAllowed(EMedicZedative);
}

/*********************************************************************************************
* @name	 Effects
********************************************************************************************* */

/**
 * @brief Spawns a toxic cloud that hurts other Zeds and heals other players
 *
 * @param Killer The monster's killer (that had the zedative skill enabled)
 * @param ZedKilled The monster killed
 */
function ToxicCloudExplode( Controller Killer, Pawn ZedKilled )
{
	local KFExplosion_ZedativeCloud ExploActor;
	local Actor InstigatorActor;

	if ( Role < ROLE_Authority )
	{
		return;
	}

	InstigatorActor = ZedKilled;

	// explode using the given template
	ExploActor = Spawn(class'KFExplosion_ZedativeCloud', InstigatorActor,, ZedKilled.Location,,, true);
	if( ExploActor != None )
	{
		ExploActor.InstigatorController = Killer;

		if( Killer.Pawn != none )
		{
			ExploActor.Instigator = Killer.Pawn;
		}
		
		ExploActor.Explode( GetExplosionTemplate() );
	}
}

/**
 * @brief The Zedative skill can spawn a toxic explosion, this function delivers the template
 *
 * @return A game explosion template
 */
function GameExplosion GetExplosionTemplate()
{
	return default.TCExplosionTemplate;
}

/**
 * @brief Checks if a zed could potentially explode in a toxic cloud later
 *
 * @param KFDT damage type used to deal damage
 * @return if the zed could explode when dying
 */
function bool CouldBeZedToxicCloud( class<KFDamageType> KFDT )
{ 
	// Special case for doshinegun. Only this perk should apply.
	return IsZedativeActive() && (IsDamageTypeOnPerk( KFDT ) || KFDT.Name == 'KFDT_Bludgeon_Doshinegun_Shot');
}

static function float GetZedativeExplosionDelay()
{
	return default.ZedativeExplosionDelay;
}

static function int GetZedativeHealth()
{
	return default.ZedativeHealth;
}

static function int GetZedativeDamage()
{
	return default.ZedativeDamage;
}

static function class<KFDamageType> GetZedativeDamageType()
{
	return default.ZedativeDamageType;
}

static function class<KFDamageType> GetZedativeHealingType()
{
	return default.ZedativeHealingType;
}

static function float GetZedativeEffectRadius()
{
	return default.ZedativeEffectRadius;
}

/*********************************************************************************************
* @name	 HUD / UI
********************************************************************************************* */

simulated function class<EmitterCameraLensEffectBase> GetPerkLensEffect( class<KFDamageType> DmgType )
{
	if( ClassIsChildOf( DmgType,  class'KFDT_Toxic' ) )
	{
		return DmgType.default.AltCameraLensEffectTemplate;
	}

	return super.GetPerkLensEffect( DmgType );
}


simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Round(default.HealerRecharge.Increment * Level * 100) $ "%";
	PassiveValues[1] = Round(default.HealPotency.Increment * Level * 100) $ "%";
	PassiveValues[2] = Round(default.BloatBileResistance.Increment * Level * 100) $ "%";
	PassiveValues[3] = Round(default.MovementSpeed.Increment * Level * 100) $ "%";
	PassiveValues[4] = Round(default.Armor.Increment * Level * 100) $ "%";

	Increments[0] = "[" @ Left( string( default.HealerRecharge.Increment * 100 ), InStr(string(default.HealerRecharge.Increment * 100), ".") + 2 )   $"% /" @ default.LevelString @"]";
	Increments[1] = "[" @ Left( string( default.HealPotency.Increment * 100 ), InStr(string(default.HealPotency.Increment * 100), ".") + 2 )  $"% /" @ default.LevelString @"]";
	Increments[2] = "[" @ Left( string( default.BloatBileResistance.Increment * 100 ), InStr(string(default.BloatBileResistance.Increment * 100), ".") + 2 ) $ "% /" @ default.LevelString @"]";
	Increments[3] = "[" @ left(string(default.MovementSpeed.Increment * 100), 3) $ "% /" @ default.LevelString @"]";
	Increments[4] = "[" @ Left( string( default.Armor.Increment * 100 ), InStr(string(default.Armor.Increment * 100), ".") + 2 )  $"% /" @ default.LevelString @"]";
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
		LogInternal("-HealerRecharge:" @ Int(HealerRecharge.Increment * GetLevel() * 100) $"%");
		LogInternal("-HealPotency:" @ Int(HealPotency.Increment * GetLevel() * 100) $"%");
		LogInternal("-BloatBileResistance:" @ Int(BloatBileResistance.Increment * GetLevel() * 100) $"%");
		LogInternal("-MovementSpeed:" @ Int(MovementSpeed.Increment * GetLevel() * 100) $"%");
		LogInternal("-Armor:" @ Int(Armor.Increment * GetLevel() * 100) $"%");

	    LogInternal("Skill Tree");
	}
}

defaultproperties
{
   HealerRecharge=(Name="Healer Recharge",Increment=0.080000,StartingValue=1.000000,MaxValue=3.000000)
   HealPotency=(Name="Healer Potency",Increment=0.020000,StartingValue=1.000000,MaxValue=1.500000)
   BloatBileResistance=(Name="Bloat Bile Resistance",Increment=0.020000,MaxValue=0.500000)
   MovementSpeed=(Name="Movement Speed",Increment=0.004000,MaxValue=0.100000)
   Armor=(Name="Armor",Increment=0.020000,StartingValue=1.000000,MaxValue=1.500000)
   SelfHealingSurgePct=0.060000
   MaxSurvivalistResistance=0.600000
   CombatantSpeedModifier=0.100000
   MaxHealingSpeedBoost=30.000000
   HealingSpeedBoostDuration=5.000000
   MaxHealingDamageBoost=20.000000
   HealingDamageBoostDuration=5.000000
   MaxHealingShield=30.000000
   HealingShieldDuration=5.000000
   AAParticleSystem=ParticleSystem'FX_Impacts_EMIT.FX_Medic_Airborne_Agent_01'
   SnarePower=100.000000
   SnareSpeedModifier=0.700000
   AAExplosionTemplate=KFGameExplosion'KFGame.Default__KFPerk_FieldMedic:ExploTemplate0'
   AAExplosionDamageType=Class'KFGame.KFDT_Toxic_MedicGrenade'
   TCExplosionTemplate=KFGameExplosion'KFGame.Default__KFPerk_FieldMedic:ExploTemplate1'
   ZedativeCloudExplosionActorClass=Class'KFGame.KFExplosion_ZedativeCloud'
   ZedativeExplosionDelay=0.150000
   ZedativeHealth=15
   ZedativeDamage=150
   ZedativeDamageType=Class'KFGame.KFDT_Toxic_ZedativeCloud'
   ZedativeHealingType=Class'KFGame.KFDT_Healing'
   ZedativeEffectRadius=400
   ProgressStatID=40
   PerkBuildStatID=41
   SecondaryXPModifier(0)=4
   SecondaryXPModifier(1)=4
   SecondaryXPModifier(2)=4
   SecondaryXPModifier(3)=4
   PerkName="Field Medic"
   Passives(0)=(Title="Syringe Recharge Rate",Description="Increase syringe recharge rate %x% per level")
   Passives(1)=(Title="Syringe Potency",Description="Increase Health restored by syringe %x% per level")
   Passives(2)=(Title="Bloat Bile Resistance",Description="Decrease damage from poison %x% per level")
   Passives(3)=(Title="Movement Speed",Description="Increase movement speed %x% every five levels")
   Passives(4)=(Title="Armor Bonus",Description="Increase Armor %x% per level")
   SkillCatagories(0)="Conditioning"
   SkillCatagories(1)="Movement"
   SkillCatagories(2)="Damage"
   SkillCatagories(3)="Combat Technician"
   SkillCatagories(4)="Advanced Tech"
   EXPAction1="Dealing Field Medic weapon damage"
   EXPAction2="Healing teammates"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Medic'
   PerkSkills(0)=(Name="HealingSurge",StartingValue=0.250000,MaxValue=0.250000,IconPath="UI_PerkTalent_TEX.Medic.UI_Talents_Medic_HealingSurge")
   PerkSkills(1)=(Name="Survivalist",StartingValue=0.010000,MaxValue=0.010000,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Resilience")
   PerkSkills(2)=(Name="HealingSpeedBoost",StartingValue=10.000000,MaxValue=10.000000,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_AdrenalineShot")
   PerkSkills(3)=(Name="Combatant",StartingValue=0.500000,MaxValue=0.500000,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_CombatantDoctor")
   PerkSkills(4)=(Name="HealingDamageBoost",StartingValue=5.000000,MaxValue=5.000000,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_FocusInjection")
   PerkSkills(5)=(Name="AcidicCompound",StartingValue=0.650000,MaxValue=0.650000,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_AcidicRounds")
   PerkSkills(6)=(Name="HealingShield",StartingValue=10.000000,MaxValue=10.000000,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_CoagulantBooster")
   PerkSkills(7)=(Name="Enforcer",StartingValue=0.200000,MaxValue=0.200000,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_BattleSurgeon")
   PerkSkills(8)=(Name="AirborneAgent",StartingValue=0.200000,MaxValue=0.200000,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_AirborneAgent")
   PerkSkills(9)=(Name="Sedative",StartingValue=0.300000,MaxValue=0.300000,IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Zedative")
   VaccinationDuration=10.000000
   ToxicDmgTypeClass=Class'KFGame.KFDT_Toxic_AcidicRounds'
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_MedicPistol'
   KnifeWeaponDef=Class'KFGame.KFWeapDef_Knife_Medic'
   GrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Medic'
   AutoBuyLoadOutPath(0)=Class'KFGame.KFWeapDef_MedicPistol'
   AutoBuyLoadOutPath(1)=Class'KFGame.KFWeapDef_MedicSMG'
   AutoBuyLoadOutPath(2)=Class'KFGame.KFWeapDef_MedicShotgun'
   AutoBuyLoadOutPath(3)=Class'KFGame.KFWeapDef_MedicRifle'
   AutoBuyLoadOutPath(4)=Class'KFGame.KFWeapDef_MedicRifleGrenadeLauncher'
   HitAccuracyHandicap=5.000000
   HeadshotAccuracyHandicap=-0.750000
   PrestigeRewardItemIconPaths(0)="WEP_SkinSet_Prestige01_Item_TEX.knives.MedicKnife_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(1)="WEP_SkinSet_Prestige02_Item_TEX.tier01.MedicPistol_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(2)="WEP_skinset_prestige03_itemtex.tier02.MedicSMG_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(3)="wep_skinset_prestige04_itemtex.tier03.HMTech-301Shotgun_PrestigePrecious_Mint_large"
   PrestigeRewardItemIconPaths(4)="WEP_SkinSet_Prestige05_Item_TEX.tier04.HMTech-401AssaultRifle_PrestigePrecious_Mint_large"
   Name="Default__KFPerk_FieldMedic"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
