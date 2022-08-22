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

`include(KFOnlineStats.uci)

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

/** Defines the explosion. */
var 	  private KFGameExplosion	AAExplosionTemplate;
var const private string AAExplosionActorClassPath;
var const private string AAExplosionDamageTypePath;

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
	EMedicSlug			
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
    `QALog( "HealerRecharge" @ HealerRechargeTimeMod, bLogPerk );
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
		`QALog( "Survivalist Damage Resistance =" @ FMin( SurvivalistResistance, MaxSurvivalistResistance ), bLogPerk );
	}

	`QALog( "Change in Damage Taken" @ GetPercentage( InDamage, Round(TempDamage) ), bLogPerk );
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
	`QALog( "Modify MaxArmor" @ GetPercentage( MaxArmor, FCeil( TempArmor )), bLogPerk );
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
		`QALog( "Healing Surge" @ GetPercentage( InHealth, Round( TempHealth ) ), bLogPerk );
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
simulated function ModifyMagSizeAndNumber( KFWeapon KFW, out byte MagazineCapacity, optional Class<KFPerk> WeaponPerkClass, optional bool bSecondary=false )
{
	local float TempCapacity;

	TempCapacity = MagazineCapacity;

	if( IsWeaponOnPerk( KFW, WeaponPerkClass ) && (KFW == none || !KFW.bNoMagazine) && !bSecondary )
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
		if( IsEnforcerActive() && IsWeaponOnPerk( KFW )  )
		{
			TempDamage += InDamage * GetSkillValue( PerkSkills[EMedicEnforcer] );
			`QALog( "Enforcer Damage Given" @  InDamage * GetSkillValue( PerkSkills[EMedicEnforcer] ), bLogPerk );
		}
	}

	if( IsSlugActive() && DamageType != none && ClassIsChildOf( DamageType, class'KFDT_Toxic' ) )
	{
		TempDamage += InDamage * GetSkillValue( PerkSkills[EMedicSlug] );
		`QALog( "Slug Damage Given" @  InDamage * GetSkillValue( PerkSkills[EMedicSlug] ), bLogPerk );
	}

	`QALog( "Total Damage Given" @ DamageType @ KFW @ GetPercentage( InDamage, FCeil(TempDamage) ), bLogPerk );
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
	local class<KFDamageType> DamageTypeClass;

	DamageTypeClass = class<KFDamageType>(DynamicLoadObject(default.AAExplosionDamageTypePath, class'Class'));
	return DamageTypeClass;
}

simulated static function class<KFExplosion_AirborneAgent> GetAAExplosionActorClass()
{
	return class'KFExplosion_AirborneAgent';
}

simulated static function ParticleSystem GetAAEffect()
{
	return default.AAParticleSystem;
}

simulated function float GetSnarePower( optional class<DamageType> DamageType, optional byte HitZoneIdx )
{
	if( IsSlugActive() && DamageType != none && IsDamageTypeOnPerk( class<KFDamageType>(DamageType) ) )
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
	return PerkSkills[EMedicAirborneAgent].bActive;
}

/**
 * @brief Checks if Acidic Compound skill is active
 *
 * @return true/false
 */
function bool IsAcidicCompoundActive()
{
	return PerkSkills[EMedicAcidicCompound].bActive;
}

/**
 * @brief  Can we give poisoning damage over time?
 *
 * @return true if we have the skill and the currently used weapon can poison zeds
 */
function bool IsToxicDmgActive()
{
	return IsAcidicCompoundActive() && IsWeaponOnPerk( GetOwnerWeapon() );
}

/**
 * @brief Checks if the Healing Speed Boost skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsHealingSpeedBoostActive()
{
	return PerkSkills[EMedicHealingSpeedBoost].bActive;
}

/**
 * @brief Checks if the Healing Damage Boost skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsHealingDamageBoostActive()
{
	return PerkSkills[EMedicHealingDamageBoost].bActive;
}

/**
 * @brief Checks if the Healing Shield skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsHealingShieldActive()
{
	return PerkSkills[EMedicHealingShield].bActive;
}

/**
 * @brief Checks if the Combatant skill is active Network: client and server.
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsCombatantActive()
{
	return PerkSkills[EMedicCombatant].bActive;
}

/**
 * @brief Checks if the Enforcer skill is active Network: client and server.
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsEnforcerActive()
{
	return PerkSkills[EMedicEnforcer].bActive;
}

/**
 * @brief Checks if the healing surge skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsHealingSurgeActive()
{
	return PerkSkills[EMedicHealingSurge].bActive;
}

/**
 * @brief Checks if the Survivalist skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsSurvivalistActive()
{
	return PerkSkills[EMedicSurvivalist].bActive;
}

/**
 * @brief Checks if the Slug skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private function bool IsSlugActive()
{
	return PerkSkills[EMedicSlug].bActive && WorldInfo.TimeDilation < 1.f;
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

	Increments[0] = "[" @ Round(default.HealerRecharge.Increment * 100)   $"% /" @ default.LevelString @"]";
	Increments[1] = "[" @ Round(default.HealPotency.Increment * 100)  $"% /" @ default.LevelString @"]";
	Increments[2] = "[" @ Round(default.BloatBileResistance.Increment * 100) $ "% /" @ default.LevelString @"]";
	Increments[3] = "[" @ left(string(default.MovementSpeed.Increment * 100), 3) $ "% /" @ default.LevelString @"]";
	Increments[4] = "[" @ Round(default.Armor.Increment * 100)  $"% /" @ default.LevelString @"]";
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
		`log( "-HealerRecharge:" @ Int(HealerRecharge.Increment * GetLevel() * 100) $"%" );
		`log( "-HealPotency:" @ Int(HealPotency.Increment * GetLevel() * 100) $"%" );
		`log( "-BloatBileResistance:" @ Int(BloatBileResistance.Increment * GetLevel() * 100) $"%" );
		`log( "-MovementSpeed:" @ Int(MovementSpeed.Increment * GetLevel() * 100) $"%" );
		`log( "-Armor:" @ Int(Armor.Increment * GetLevel() * 100) $"%" );

	    `log( "Skill Tree" );
	}
}

DefaultProperties
{
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Medic'

	PrimaryWeaponDef=class'KFWeapDef_MedicPistol'
	KnifeWeaponDef=class'KFWeapDef_Knife_Medic'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Medic'

	ProgressStatID=`STATID_Medic_Progress
   	PerkBuildStatID=`STATID_Medic_Build

  	SelfHealingSurgePct=0.1f
	MaxSurvivalistResistance=0.5f //0.8
	CombatantSpeedModifier=0.1f

	MaxHealingSpeedBoost=30 //15 //50
	HealingSpeedBoostDuration=5.f

	MaxHealingDamageBoost=20 //15 //30
	HealingDamageBoostDuration=5.f
	
	MaxHealingShield=30 //50 //60
	HealingShieldDuration=5.0f //1.0
	
	SnarePower=100

	AAParticleSystem=ParticleSystem'FX_Impacts_EMIT.FX_Medic_Airborne_Agent_01'

	AAExplosionDamageTypePath="KFGameContent.KFDT_Toxic_MedicGrenade"

	ToxicDmgTypeClass=class'KFDT_Toxic_AcidicRounds'

		// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=50  //50
		DamageRadius=350
		DamageFalloffExponent=0.f
		DamageDelay=0.f
		
		// Damage Effects
		KnockDownStrength=0
		KnockDownRadius=0
		FractureMeshRadius=0
		FracturePartVel=0
		ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.Medic_Perk_Explosion'
		ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Explosion'
		MomentumTransferScale=0
	End Object
	AAExplosionTemplate=ExploTemplate0

   	/** Passive skills */
   	HealerRecharge=(Name="Healer Recharge",Increment=0.08f,Rank=0,StartingValue=1.f,MaxValue=3.f)
   	HealPotency=(Name="Healer Potency",Increment=0.02f,Rank=0,StartingValue=1.0f,MaxValue=1.5f)
	BloatBileResistance=(Name="Bloat Bile Resistance",Increment=0.02,Rank=0,StartingValue=0.f,MaxValue=0.5f)
	MovementSpeed=(Name="Movement Speed",Increment=0.004f,Rank=0,StartingValue=0.f,MaxValue=0.1f)
	Armor=(Name="Armor",Increment=0.03f,Rank=0,StartingValue=1.f,MaxValue=1.75f)

	PerkSkills(EMedicHealingSurge)=(Name="HealingSurge",IconPath="UI_PerkTalent_TEX.Medic.UI_Talents_Medic_HealingSurge", Increment=0.f,Rank=0,StartingValue=0.25,MaxValue=0.25)
	PerkSkills(EMedicSurvivalist)=(Name="Survivalist",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Resilience", Increment=0.f,Rank=0,StartingValue=0.01f,MaxValue=0.01f)
	PerkSkills(EMedicHealingSpeedBoost)=(Name="HealingSpeedBoost",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_AdrenalineShot", Increment=0.f,Rank=0,StartingValue=10.0f,MaxValue=10.0f) //3.0
	PerkSkills(EMedicCombatant)=(Name="Combatant",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_CombatantDoctor", Increment=0.f,Rank=0,StartingValue=0.5f,MaxValue=0.5f)
	PerkSkills(EMedicHealingDamageBoost)=(Name="HealingDamageBoost",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_FocusInjection", Increment=0.f,Rank=0,StartingValue=5.0f,MaxValue=5.0f) //3.0
	PerkSkills(EMedicAcidicCompound)=(Name="AcidicCompound",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_AcidicRounds", Increment=0.f,Rank=0,StartingValue=0.5f,MaxValue=0.5f)
	PerkSkills(EMedicHealingShield)=(Name="HealingShield",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_CoagulantBooster", Increment=0.f,Rank=0,StartingValue=10.f,MaxValue=10.f) //25.0
	PerkSkills(EMedicEnforcer)=(Name="Enforcer",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_BattleSurgeon", Increment=0.f,Rank=0,StartingValue=0.2f,MaxValue=0.2f)
	PerkSkills(EMedicAirborneAgent)=(Name="AirborneAgent",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_AirborneAgent", Increment=0.f,Rank=0,StartingValue=0.2f,MaxValue=0.2f)
	PerkSkills(EMedicSlug)=(Name="Sedative",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Zedative", Increment=0.f,Rank=0,StartingValue=100.0f,MaxValue=100.0f) //0.5

	VaccinationDuration=10.f

	SecondaryXPModifier[0]=4
	SecondaryXPModifier[1]=4
	SecondaryXPModifier[2]=4
	SecondaryXPModifier[3]=4

    // Skill tracking
	HitAccuracyHandicap=5.0
	HeadshotAccuracyHandicap=-0.75

	AutoBuyLoadOutPath=(class'KFWeapDef_MedicPistol', class'KFWeapDef_MedicSMG', class'KFWeapDef_MedicShotgun', class'KFWeapDef_MedicRifle')
}
