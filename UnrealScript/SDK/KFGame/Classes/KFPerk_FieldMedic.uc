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
var()	const	PerkSkill 		HealerRecharge;						// 8% faster syringe charges per level (max 200%)
var()	const	PerkSkill 		HealPotency;						// more potent medical injections per level (max 50%)
var() 	const	PerkSkill		BloatBileResistance;                // 25% less damage from Bloat Bile
var() 	const	PerkSkill		MovementSpeed;                		// 1% increased movement speed every level (max 25%)
var() 	const	PerkSkill		Armor;                				// 3% more armor each level (max 75%)

var 	array<name>				VaccinationResistableDamageTypeNames;

/** How much additional damage to add to the "toxic" healing dart when acidic compound is active */
const							ToxicDartDamage 	=	15;
/** Airborne Agent radius squared, extra healing range */
const 							AARangeSq			=	250000;
/** How much to reduce the damage of a "vaccinated" teammate when the skill is active */
const							VaccinationResist 	= 	0.25;

var 	const private int		VaccBloatBileResistance;
var 	const private ParticleSystem AAParticleSystem;

enum EMedicPerkSkills
{
	EMedicHealingSurge,			// 20% Increased health
	EMedicEnforcer,				// Ammo increased n percent for your pistol and Perk weapons.
	EMedicCombatant,			// The Medic begins a game with body armor and receives a 60% discount on armor purchases.
	EMedicArmament,				// Your healing effectiveness is reduced n percent, but your target will take n percent less damage for a time, and n percent of target body armor is repaired.
	EMedicRegeneration,			// The medic slowly regains health using nano bot technology
	EMedicLacerate,				// You cause bleed damage with all Perk weapons
	EMedicVaccination,			// Your heals now grant increased armor and temporary resistance to poison damage.
	EMedicAcidicCompound,		// Zeds can now be poisoned with your healing darts and grenades, causing them to panic
	EMedicAirborneAgent,		// During Zed Time, your Medic darts have an AoE effect. When the medicine is delivered to the target, it explodes in a cloud. The target, and all allies who inhale the mixture receive n% more healing
	EMedicSedative				// During Zed Time, your darts or grenades have an AoE effect, releasing a powerful sedative that can temporarily stop Zed movement.
};

/*********************************************************************************************
* @name	 Perk init and spawning
******************************************************************************************** */

/** On spawn, modify owning pawn based on perk selection */
function SetPlayerDefaults(Pawn PlayerPawn)
{
	super.SetPlayerDefaults( PlayerPawn );

	if( OwnerPawn.Role == ROLE_Authority && IsCombatantActive() )
	{
		`QALog( "Combatant Armor" @ OwnerPawn.MaxArmor, bLogPerk );
		OwnerPawn.GiveMaxArmor();
	}
}

/**
 * @brief Modifies skill related attributes
 */
simulated protected event PostSkillUpdate()
{
	super.PostSkillUpdate();

	// enable tick if we have the regeneration skill
	SetTickIsDisabled( !IsRegenerationActive() );
}

/*********************************************************************************************
* @name	 Passive skills functions
********************************************************************************************* */
/**
 * @brief Changes the damage of the "toxic" healing dart when acidic compound is active
 *
 * @param InDamage the damage amount
 */
function ModifyACDamage( out int InDamage )
{
	if( IsAcidicCompoundActive() )
	{
		InDamage += ToxicDartDamage;
	}
}

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
 * @param HealAmount healthg repaired
 * @return true if Armament is active to repair armor if possible
 */
function bool ModifyHealAmount( out float HealAmount )
{
	HealAmount *= GetPassiveValue( HealPotency, GetLevel() );

	if( IsArmamentActive() )
	{
		`QALog( "Armament Healing" @ GetPercentage( HealAmount, HealAmount - PerkSkills[EMedicArmament].StartingValue * HealAmount ), bLogPerk );
		HealAmount -= PerkSkills[EMedicArmament].StartingValue * HealAmount;
	}

	return IsArmamentActive() || IsVaccinationActive();
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

	TempDamage = InDamage;

	switch( DamageType.Name )
	{
		case 'KFDT_BloatPuke':
			TempDamage -= TempDamage * GetPassiveValue( BloatBileResistance, GetLevel() );
			FMax( TempDamage, 1.f );
		break;
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
	`QALog( "MovementSpeed" @ GetPercentage( Speed, Speed * GetPassiveValue( MovementSpeed, GetLevel() ) ), bLogPerk );
	Speed *= GetPassiveValue( MovementSpeed, GetLevel() );
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
		TempHealth *= FMin( PerkSkills[EMedicHealingSurge].MaxValue, PerkSkills[EMedicHealingSurge].StartingValue );
		`QALog( "Healing Surge" @ GetPercentage( InHealth, Round( TempHealth ) ), bLogPerk );
		InHealth = Round( TempHealth );
	}
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
	local Float TempAmmo;
	local class<KFPerk> WeaponPerkClass;

	WeaponPerkClass = (KFW == none) ? TraderItem.AssociatedPerkClass : KFW.AssociatedPerkClass;
	if( IsEnforcerActive() && (IsWeaponOnPerk( KFW, WeaponPerkClass ) || IsBackupWeapon( KFW )) )
	{
		TempAmmo = PrimarySpareAmmo;
		TempAmmo += TempAmmo * GetSkillValue( PerkSkills[EMedicEnforcer] );
		`QALog( "Enforcer" @ KFW @ GetPercentage( PrimarySpareAmmo, Round( TempAmmo ) ), bLogPerk );
		PrimarySpareAmmo = Round( TempAmmo );
	}
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
	local class<KFPerk> WeaponPerkClass;

	WeaponPerkClass = (KFW == none) ? TraderItem.AssociatedPerkClass : KFW.AssociatedPerkClass;
	if( IsEnforcerActive() && (IsWeaponOnPerk( KFW, WeaponPerkClass ) || IsBackupWeapon( KFW )) )
	{
		TempMaxSpareAmmoAmount = MaxSpareAmmo;
		TempMaxSpareAmmoAmount += TempMaxSpareAmmoAmount * GetSkillValue( PerkSkills[EMedicEnforcer] );
		MaxSpareAmmo = Round( TempMaxSpareAmmoAmount );
	}
}

/**
 * @brief Modifies the armor price
 *
 * @param ArmorPrice armor price
 * @todo: Greg, use this for the trader
 */
simulated function float GetArmorDiscountMod()
{
	if( IsCombatantActive() )
	{
		return 1 - GetSkillValue( PerkSkills[EMedicCombatant] );
	}
	return 1;
}

/**
 * @brief Do we need to tick the perk?
 *
 * @return true if perk needs to be ticked
 */
simulated function bool PerkNeedsTick()
{
	return IsRegenerationActive();
}

/**
 * @brief Armament skill can repairs armor
 *
 * @param HealTarget the pawn we are healing
 * @return true if armomr was repaired
 */
function bool RepairArmor( Pawn HealTarget )
{
	local KFPawn_Human KFPH;
	local float	TempArmor;
	local bool bRepairedArmor;

	if( IsArmamentActive() )
	{
		KFPH = KFPawn_Human(Healtarget);
		if( KFPH != none && KFPH.Armor < KFPH.MaxArmor )
		{
			TempArmor = float(KFPH.MaxArmor) * PerkSkills[EMedicArmament].MaxValue;
			KFPH.AddArmor( Round( TempArmor ) );
			`QALog( "Armament Armor Added" @ KFPH.PlayerReplicationInfo.PlayerName @ Round( TempArmor ), bLogPerk );
			bRepairedArmor = true;
		}
	}

	if( IsVaccinationActive() )
	{
		KFPH = KFPawn_Human(Healtarget);
		if( KFPH != none )
		{
			KFPH.EnableMedicVaccinationBuff();
			if( KFPH.Armor < KFPH.MaxArmor )
			{
				TempArmor = float(KFPH.MaxArmor) * FMin( PerkSkills[EMedicVaccination].StartingValue , PerkSkills[EMedicVaccination].MaxValue );
				`QALog( "Vaccination Armor" @ KFPH.PlayerReplicationInfo.PlayerName @ Round( TempArmor ), bLogPerk );
				KFPH.AddArmor( Round( TempArmor ) );
				bRepairedArmor = true;
			}
		}
	}

	return bRepairedArmor;
}

/**
 * @brief Checks if any armor repairing skills are available
 *
 * @return true if armor repairing skills are available
 */
simulated function bool CanRepairArmor()
{
	return IsVaccinationActive() || IsArmamentActive();
}

static function float GetBloatBileResistance()
{
	return default.VaccBloatBileResistance;
}

/** Takes the weapons primary damage and calculates the bleeding over time value */
/**
 * @brief  Takes the weapons primary damage and calculates the bleeding over time value
 *
 * @param BleedDamage the bleeding damage
 */
static function ModifyBleedDmg( out int BleedDamage )
{
	local float TempDamage;

	TempDamage = float(BleedDamage) * FMin( default.PerkSkills[EMedicLacerate].StartingValue, default.PerkSkills[EMedicLacerate].MaxValue );
	BleedDamage = FCeil( TempDamage );
}

/**
 * @brief script tick (server)
  *
 * @param DeltaTime time since the last tick
 */
event Tick( float DeltaTime )
{
	super.Tick( DeltaTime );

	if( IsRegenerationActive() )
	{
		TickRegen( DeltaTime );
	}
}

/**
 * @brief Modifies dealt damage with vaccination skill
 *
 * @param InDamage damage
 */
static function ModifyVaccinationDamage( out float InDamage, class<DamageType> DmgType, optional int MedicLevel = -1 )
{
	if( IsDmgTypeVaccinationResistable( DmgType ) )
	{
		if( MedicLevel == INDEX_NONE )
		{
			InDamage *= 1 - VaccinationResist;
		}
		else
		{
			InDamage -= InDamage * FMin( default.BloatBileResistance.MaxValue - (default.BloatBileResistance.StartingValue * MedicLevel), VaccinationResist );
		}
	}
}

/**
 * @brief Give benefits when Airborne Agent skill is active
 * @param HealTarget The pawn we want to give some extra health
 */
function CheckForAirborneAgent( KFPawn HealTarget, class<DamageType> DamType, int HealAmount )
{
	if( IsAirborneAgentActive() )
	{
		GiveMedicAirborneAgentHealth( HealTarget, DamType, HealAmount );
	}
}

/**
 * @brief Heals damage for pawns in range
 * @param HealTarget The healed pawn. Center of the checked radius.
 */
private final function GiveMedicAirborneAgentHealth( KFPawn HealTarget, class<DamageType> DamType, int HealAmount )
{
	local KFPawn KFP;
	local int RoundedExtraHealAmount;

	RoundedExtraHealAmount = FCeil( float(HealAmount) * FMin( PerkSkills[EMedicAirborneAgent].StartingValue, PerkSkills[EMedicAirborneAgent].MaxValue ) );

	foreach WorldInfo.Allpawns(class'KFPawn', KFP)
	{
		if( VSizeSQ( KFP.Location - HealTarget.Location ) <= AARangeSq &&
			KFP.IsAliveAndWell() && WorldInfo.GRI.OnSameTeam( HealTarget, KFP ) )
		{
			if ( HealTarget == KFP )
			{
				KFP.HealDamage( RoundedExtraHealAmount, OwnerPawn.Controller, DamType );
				`QALog( "AirborneAgent Heal Damage - KFP == HealTarget. Extra HealAmount =" @ PerkSkills[EMedicAirborneAgent].StartingValue @ "% rounded up of" @ HealAmount @ "=" @ RoundedExtraHealAmount, bLogPerk );
			}
			else
			{
				KFP.HealDamage( RoundedExtraHealAmount + HealAmount, OwnerPawn.Controller, DamType );
				`QALog( "AirborneAgent Heal Damage - KFP != HealTarget: Extra HealAmount =" @ HealAmount @ "+" @ RoundedExtraHealAmount, bLogPerk );
			}
		}
	}
}

function bool ShouldSedate()
{
	return IsSedadtiveActive();
}

static function bool IsDmgTypeVaccinationResistable( class<DamageType> DmgType )
{
	return default.VaccinationResistableDamageTypeNames.Find( DmgType.Name ) != INDEX_NONE;
}

/*********************************************************************************************
* @name Getters
********************************************************************************************* */
/**
 * @brief Checks if sedative skill is active and if we are in zed time
 *
 * @return true/false
 */
private final function bool IsSedadtiveActive()
{
	return PerkSkills[EMedicSedative].bActive && WorldInfo.TimeDilation < 1.f;
}

/**
 * @brief Checks if the Airborne Agent is active and we are in zed time
 * @return true/false
 */
private final function bool IsAirborneAgentActive()
{
	return PerkSkills[EMedicAirborneAgent].bActive && WorldInfo.TimeDilation < 1.f;
}

simulated function bool ShouldPlayAAEffect()
{
	return PerkSkills[EMedicAirborneAgent].bActive;
}

simulated static function ParticleSystem GetAAEffect()
{
	return default.AAParticleSystem;
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
 * @brief  Can we give bleeding damage over time?
 *
 * @return true if we have the skill and the currently used weapon can let zeds bleed
 */
function bool IsBleedDmgActive()
{
	return IsLacerateActive() && IsWeaponOnPerk( GetOwnerWeapon() );
}

/**
 * @brief Checks if the enforcer skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsEnforcerActive()
{
	return PerkSkills[EMedicEnforcer].bActive;
}

/**
 * @brief Checks if the combatant skill is active Network: client and server.
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsCombatantActive()
{
	return PerkSkills[EMedicCombatant].bActive;
}

/**
 * @brief Checks if the regeneration skill is active
 *
 * @return true if we have the skill enabled
 */
private final function bool IsRegenerationActive()
{
	return PerkSkills[EMedicRegeneration].bActive;
}

/**
 * @brief Checks if the healing surge skill is active
 *
 * @return true if we have the skill enabled
 */
private final function bool IsHealingSurgeActive()
{
	return PerkSkills[EMedicHealingSurge].bActive;
}

/**
 * @brief Checks if the Armament skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsArmamentActive()
{
	return PerkSkills[EMedicArmament].bActive;
}

/**
 * @brief Checks if the lacerate skill is active
 *
 * @return true if we have the skill enabled
 */
private final function bool IsLacerateActive()
{
	return PerkSkills[EMedicLacerate].bActive;
}

/**
 * @brief Checks if the Vaccination skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsVaccinationActive()
{
	return PerkSkills[EMedicVaccination].bActive;
}

/*********************************************************************************************
* @name	 Hud/UI
********************************************************************************************* */
/*********************************************************************************************
* @name	  UI / HUD
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
	Increments[3] = "[" @ Round(default.MovementSpeed.Increment * 100)  $"% /" @ default.LevelString @"]";
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
	    `log( "-HealingSurge:" @ PerkSkills[EMedicHealingSurge].bActive );
	    `log( "-Enforcer:" @ PerkSkills[EMedicEnforcer].bActive );
	    `log( "-Combatant:" @ PerkSkills[EMedicCombatant].bActive );
	    `log( "-ArmamentHealth:" @ PerkSkills[EMedicArmament].bActive );
	    `log( "-Regeneration:" @ PerkSkills[EMedicRegeneration].bActive );
	    `log( "-Lacerate:" @ PerkSkills[EMedicLacerate].bActive );
	    `log( "-Vaccination:" @ PerkSkills[EMedicVaccination].bActive );
	    `log( "-AcidicCompound:" @ PerkSkills[EMedicAcidicCompound].bActive );
	    `log( "-AirborneAgent:" @ PerkSkills[EMedicAirborneAgent].bActive );
	    `log( "-Sedative:" @ PerkSkills[EMedicSedative].bActive );
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

   	RegenerationInterval=5.f
	RegenerationAmount=2

	VaccBloatBileResistance=0.45

	VaccinationResistableDamageTypeNames(0)="KFDT_BloatPuke"
	VaccinationResistableDamageTypeNames(1)="KFDT_Toxic"

   	/** Passive skills */
   	HealerRecharge=(Name="Healer Recharge",Increment=0.08f,Rank=0,StartingValue=1.f,MaxValue=3.f)
   	HealPotency=(Name="Healer Recharge",Increment=0.02f,Rank=0,StartingValue=1.0f,MaxValue=1.5f)
	BloatBileResistance=(Name="Bloat Bile Resistance",Increment=0.02,Rank=0,StartingValue=0.f,MaxValue=0.5f)
	MovementSpeed=(Name="Movement Speed",Increment=0.01f,Rank=0,StartingValue=1.0f,MaxValue=1.25f)
	Armor=(Name="Armor",Increment=0.03f,Rank=0,StartingValue=1.f,MaxValue=1.75f)

	PerkSkills(EMedicHealingSurge)=(Name="HealingSurge",IconPath="UI_PerkTalent_TEX.Medic.UI_Talents_Medic_HealingSurge", Increment=0.f,Rank=0,StartingValue=1.2f,MaxValue=1.2f)
	PerkSkills(EMedicEnforcer)=(Name="Enforcer",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Enforcer", Increment=0.f,Rank=0,StartingValue=0.2f,MaxValue=0.2f)
	PerkSkills(EMedicCombatant)=(Name="Combatant",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Combatant", Increment=0.f,Rank=0,StartingValue=0.6f,MaxValue=0.6f)
	PerkSkills(EMedicArmament)=(Name="Armament",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Armament", Increment=0.f,Rank=0,StartingValue=0.25,MaxValue=0.01f)
	PerkSkills(EMedicRegeneration)=(Name="Regeneration",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Regenerate", Increment=0.f,Rank=0,StartingValue=0.02f,MaxValue=0.02f)
	PerkSkills(EMedicLacerate)=(Name="Lacerate",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Lacerate", Increment=0.f,Rank=0,StartingValue=0.02f,MaxValue=0.02f)
	PerkSkills(EMedicVaccination)=(Name="VaccinationArmor",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Vaccination", Increment=0.f,Rank=0,StartingValue=0.02f,MaxValue=0.02f)
	PerkSkills(EMedicAcidicCompound)=(Name="VaccinationDamageMod",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_AcidicCompound", Increment=0.f,Rank=0,StartingValue=0.75f,MaxValue=0.75f)
	PerkSkills(EMedicAirborneAgent)=(Name="AirborneAgent",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_AirborneAgent", Increment=0.f,Rank=0,StartingValue=0.2f,MaxValue=0.2f)
	PerkSkills(EMedicSedative)=(Name="Sedative",IconPath="ui_perktalent_tex.Medic.UI_Talents_Medic_Anesthetist", Increment=0.f,Rank=0,StartingValue=0.0f,MaxValue=0.0f)

	BleedDmgTypeClass=KFDT_Bleeding
	VaccinationDuration=10.f

	SecondaryXPModifier[0]=4
	SecondaryXPModifier[1]=4
	SecondaryXPModifier[2]=4
	SecondaryXPModifier[3]=4

    // Skill tracking
	HitAccuracyHandicap=5.0
	HeadshotAccuracyHandicap=-0.75

	AAParticleSystem=ParticleSystem'FX_Impacts_EMIT.FX_Medic_Airborne_Agent_01'
}
