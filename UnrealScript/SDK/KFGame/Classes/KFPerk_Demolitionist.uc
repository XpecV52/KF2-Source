//=============================================================================
// KFPerk_Demolitionist
//=============================================================================
// The demo perk class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Christian "schneidzekk" Schneider
//=============================================================================

class KFPerk_Demolitionist extends KFPerk;

`include(KFOnlineStats.uci)

var				const	PerkSkill 					ExplosiveDamage;			// 1% increased explosive damage per level (max 25%)
var 			const	PerkSkill					ExplosiveResistance;        // 10% explosive resistance, additional 2% resistance per level (max 60%)
var 			const	PerkSkill					ExplosiveAmmo;            	// 1 extra explosive ammo for every 5 levels. Weapons only

var						Array<KFPawn_Human>			SuppliedPawnList;

var 	private const   float 						SharedExplosiveResistance;
var 	private const 	class<Damagetype>			ExplosiveResistableDamageTypeSuperClass;
var 	private const 	float 						ExplosiveResistanceRadius;

var 					KFGameExplosion				SacrificeExplosionTemplate;
var 					KFGameExplosion				NukeExplosionTemplate;
var 					KFGameExplosion				DoorTrapExplosionTemplate;
var 					String 						NukeExplosionActorClassName;
var						String						NukeExplosionDamageTypeName;
var						String 						NukeProjectileClassName;
var 					String 						SacrificeExplosionDamageTypeName;
var 					String 						DoorTrapsExplosionDamageTypeName;
var 					array<name>					NukeIgnoredProjectileNames;
var 	private const 	float 						NukeDamageModifier;
var 	private const 	float 						NukeRadiusModifier;

var 					AkEvent 					ConcussiveExplosionSound;
var 	private			bool 						bUsedSacrifice;

enum EDemoSkills
{
	EDemoGrenadeSupplier,
	EDemoOnContact,
	EDemoExplosiveResistance,
	EDemoSacrifice,
	EDemoDoorTraps,
	EDemoSirenResistance,
	EDemoOffPerk,
	EDemoOnPerk,
	EDemoNuke,
	EDemoConcussiveForce
};

/*********************************************************************************************
* @name	 Perk init and spawning
******************************************************************************************** */

/**
 * @brief(Server) Modify Instigator settings based on selected perk
 */
function ApplySkillsToPawn()
{
	Super.ApplySkillsToPawn();

	if( MyPRI != none )
	{
		MyPRI.bNukeActive = IsNukeActive();
		MyPRI.bConcussiveActive = IsConcussiveForceActive();
	}

	InitSupplier();
}

/**
 * @brief Resets certain perk values on wave start/end
 */
event ResetPerk()
{
	Super.ResetPerk();

	bUsedSacrifice = false;
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
simulated function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType )
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
		TempDamage +=  (InDamage * GetPassiveValue( ExplosiveDamage, CurrentLevel )) - InDamage;
	}
	else
	{
		if( IsOffPerkActive() )
		{
			TempDamage += InDamage * GetSkillValue( PerkSkills[EDemoOffPerk] );
		}
	}

	`QALog( "Total Damage Given" @ DamageType @ KFW @ GetPercentage( InDamage, Round( TempDamage ) ), bLogPerk );
	InDamage = Round( TempDamage );
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

	TempDamage = InDamage;

	if( ClassIsChildOf( DamageType, class'KFDT_Explosive' ) )
	{
		TempDamage *= 1 - GetPassiveValue( ExplosiveResistance, CurrentLevel );		
	}

	`QALog( "Total Damage Resistance" @ DamageType @ GetPercentage(InDamage, Round(TempDamage)), bLogPerk );
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
	local class<KFPerk> WeaponPerkClass;
	local bool bUsesAmmo;

	if( KFW == none )
	{
		WeaponPerkClass = TraderItem.AssociatedPerkClass;
		bUsesAmmo = TraderItem.bUsesAmmo;
	}
	else
	{
		WeaponPerkClass = KFW.AssociatedPerkClass;
		bUsesAmmo = KFW.UsesAmmo();
	}
	
	if( bUsesAmmo && IsWeaponOnPerk( KFW, WeaponPerkClass ) )
	{
		`QALog( "StartingAmmo" @ KFW @ "New" @ PrimarySpareAmmo + GetExtraAmmo( CurrentLevel ) @ "Old" @ PrimarySpareAmmo, bLogPerk );
		PrimarySpareAmmo += GetExtraAmmo( CurrentLevel );
	}
}

/**
 * @brief Modidies the max spare ammo
 *
 * @param KFW The weapon
 * @param PrimarySpareAmmo ammo amount
 * @param TraderItem the weapon's associated trader item info
 */
simulated function ModifyMaxSpareAmmoAmount( KFWeapon KFW, out int MaxSpareAmmo, optional const out STraderItem TraderItem)
{
	local class<KFPerk> WeaponPerkClass;
	local bool bUsesAmmo;

	if( KFW == none )
	{
		WeaponPerkClass = TraderItem.AssociatedPerkClass;
		bUsesAmmo = TraderItem.bUsesAmmo;
	}
	else
	{
		WeaponPerkClass = KFW.AssociatedPerkClass;
		bUsesAmmo = KFW.UsesAmmo();
	}

	if( bUsesAmmo && IsWeaponOnPerk( KFW, WeaponPerkClass ) )
	{
		MaxSpareAmmo += GetExtraAmmo( CurrentLevel );
	}
}


/**
 * @brief Calculates the additional ammo per perk level
 * 
 * @param Level Current perk level
 * @return additional ammo
 */
simulated static private final function int GetExtraAmmo( int Level )
{
	return default.ExplosiveAmmo.Increment * FFloor( float( Level ) / 5.f );	
}

/*********************************************************************************************
* @name	 Selectable skills
********************************************************************************************* */

/**
 * @brief Sets up the supllier skill
 */
simulated final private function InitSupplier()
{
	if( MyPRI != none )
	{
		if( SuppliedPawnList.Length > 0 )
		{
			SuppliedPawnList.Remove( 0, SuppliedPawnList.Length );
		}
	}

	if( IsSupplierActive() )
	{
		if( InteractionTrigger != none )
		{
			InteractionTrigger.Destroy();
			InteractionTrigger = none;
		}

		if( CheckOwnerPawn() )
		{
			InteractionTrigger = Spawn( class'KFUsablePerkTrigger', OwnerPawn,, OwnerPawn.Location, OwnerPawn.Rotation,, true );
			InteractionTrigger.SetBase( OwnerPawn );
			InteractionTrigger.SetInteractionIndex( IMT_ReceiveAmmo );
			OwnerPC.SetPendingInteractionMessage();
		}
	}
	else if( InteractionTrigger != none )
	{
		InteractionTrigger.Destroy();
	}
}

/**
 * @brief General interaction with another pawn, here: give grenades
 *
 * @param KFPH Pawn to interact with
 */
simulated function Interact( KFPawn_Human KFPH )
{
	local KFInventoryManager KFIM;
	local KFPlayerController KFPC;

	if( SuppliedPawnList.Find( KFPH ) != INDEX_NONE )
	{
		return;
	}

	if( Role == ROLE_Authority )
	{
		KFPC = KFPlayerController(KFPH.Controller);
		if( KFPC != none )
		{
			OwnerPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_GaveGrenadesTo, KFPC.PlayerReplicationInfo );
			KFPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_ReceivedGrenadesFrom, OwnerPC.PlayerReplicationInfo );
		}
	}

	KFIM = KFInventoryManager(KFPH.InvManager);
	if( KFIM != None )
	{
		KFIM.AddGrenades( 1 );
		`QALog( "Grenade Supplier" @ KFPC.PlayerReplicationInfo.PlayerName, bLogPerk );
	}

	SuppliedPawnList.AddItem( KFPH );
}

/**
 * @brief Can other pawns interact with us?
 *
 * @param MyKFPH the other pawn
 * @return true/false
 */
simulated function bool CanInteract( KFPawn_HUman MyKFPH )
{
	return IsSupplierActive() && SuppliedPawnList.Find( MyKFPH ) == INDEX_NONE;
}

/**
 * @brief Modifies the damage if the shared explosive resistance skill is selected
 * 
 * @param InDamage the damage to modify
 */
simulated static function ModifyExplosiveDamage( out float InDamage )
{
	InDamage -= Indamage * GetSharedExplosiveResistance();
}

/**
 * @brief Checks if we should blow up on death
 * 
 * @return kaboom or not.
 */
simulated function bool ShouldSacrifice()
{ 
	return IsSacrificeActive() && !bUsedSacrifice;
}

function NotifyPerkSacrificeExploded()
{
	bUsedSacrifice = true;
}

/**
 * @brief Door Traps skill modifies the welding speed
 *
 * @param FastenRate how much slower do we weld
 * @param UnfastenRate how much slower do we unweld
 *
  */
simulated function ModifyWeldingRate( out float FastenRate, out float UnfastenRate )
{
	local float WeldingModifier;

	if( IsDoorTrapsActive() )
	{
		WeldingModifier = GetSkillValue( PerkSkills[EDemoDoorTraps]  );

		`QALog( "Welding Modifier =" @ 1 - WeldingModifier, bLogPerk );
		FastenRate *= 1 - WeldingModifier;
		UnFastenRate *= 1 - WeldingModifier;
	}
}

simulated function bool CanExplosiveWeld()
{
	return IsDoorTrapsActive();
}

/**
 * @brief Checks if the projectile should be immune to the pesky siren effects
 * 
 * @return Immune or not
 */
simulated function bool ShouldRandSirenResist()
{
	return IsSirenResistanceActive() /*&& FRand() <= GetSkillValue( PerkSkills[EDemoSirenResistance] )*/; 
}

/**
 * @brief skills and weapons can modify the knockdown power chance
 * @return true/false
 */
function float GetKnockdownPowerModifier( optional class<DamageType> DamageType )
{
	local float KnockDownMultiplier;

	KnockDownMultiplier = 1.f;

	if( IsDamageTypeOnPerk( class<KFDamageType>(DamageType) ) )
	{
		KnockDownMultiplier += IsOnPerkActive() ? GetSkillValue( PerkSkills[EDemoOnPerk] ) : 0.f;
		KnockDownMultiplier += IsConcussiveForceActive() ? GetSkillValue( PerkSkills[EDemoConcussiveForce] ) : 0.f;
	}
	`QALog( "KnockDownMultiplier" @ KnockDownMultiplier, bLogPerk );
	return KnockDownMultiplier;
}

/**
 * @brief skills and weapons can modify the stumbling power chance
 * @return stumpling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier )
{
	if( IsOnPerkActive() && IsDamageTypeOnPerk( DamageType ) )
	{
		`QALog( "OnPerk, StumbleModifier" @ 1.f + GetSkillValue( PerkSkills[EDemoOnPerk] ), bLogPerk );
		return 1.f + GetSkillValue( PerkSkills[EDemoOnPerk] );
	}


	return 1.f;
}

/**
 * @brief skills and weapons can modify the stun power chance
 * 
 * @return stun power modifier
 */
function float GetStunPowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx )
{
	if( IsOnPerkActive() && IsDamageTypeOnPerk( class<KFDamageType>(DamageType) ) )
	{
		`QALog( "OnPerk, StunModifier" @ 1.f + GetSkillValue( PerkSkills[EDemoOnPerk] ), bLogPerk );
		return 1.f + GetSkillValue( PerkSkills[EDemoOnPerk] );
	}

	return 1.f;
}

simulated static function bool ProjectileShouldNuke( KFProjectile Proj )
{
	return default.NukeIgnoredProjectileNames.Find( Proj.class.name ) == INDEX_NONE;
}

/*********************************************************************************************
* @name	 Getters etc
********************************************************************************************* */

/**
 * @brief Checks if the Supplier skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsSupplierActive()
{
	return PerkSkills[EDemoGrenadeSupplier].bActive;
}

/**
 * @brief Checks if the On Contact skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsOnContactActive()
{ 
	return PerkSkills[EDemoOnContact].bActive;
}

simulated function bool IsSharedExplosiveResistaneActive()
{
	return PerkSkills[EDemoExplosiveResistance].bActive;
}

/**
 * @brief Returns the shared explosive resistance
 * @return Percent in float (.3f default)
 */
simulated static private final function float GetSharedExplosiveResistance()
{
	return default.SharedExplosiveResistance;
}

/**
 * @brief Gets the radius in within the shared explosive restince works
 * @return radius in UU float
 */
simulated static function float GetExplosiveResistanceRadius()
{
	return default.ExplosiveResistanceRadius;
}

/**
 * @brief Shared explosive resistance obviously opnly works with explosives
 * 
 * @param DmgType Damage type to test
 * 
 * @return true if resistable
 */
static function bool IsDmgTypeExplosiveResistable( class<DamageType> DmgType )
{
	return ClassIsChildOf( DmgType, default.ExplosiveResistableDamageTypeSuperClass );
}

/**
 * @brief The Sacrifice skill can spawn an explosion, this function delivers the template
 *
 * @return A game explosion template
 */
static function GameExplosion GetSacrificeExplosionTemplate()
{
	return default.SacrificeExplosionTemplate;
}

static function class<KFDamageType> GetSacrificeDamageTypeClass()
{
	local class<KFDamageType> DamageTypeClass;

	DamageTypeClass = class<KFDamageType>(DynamicLoadObject(default.SacrificeExplosionDamageTypeName, class'Class'));
	return DamageTypeClass;
}

 /**
 * @brief Checks if the Sacrifice skill is active
 *
 * @return true if we have the skill enabled
 */
 simulated private final function bool IsSacrificeActive()
 {
 	return PerkSkills[EDemoSacrifice].bActive;
 }

 /**
 * @brief Checks if the Door Traps skill is active
 *
 * @return true if we have the skill enabled
 */
 simulated private final function bool IsDoorTrapsActive()
 {
 	return PerkSkills[EDemoDoorTraps].bActive;
 }

/**
 * @brief The Door Traps skill can spawn an explosion, this function delivers the template
 *
 * @return A game explosion template
 */
static function GameExplosion GetDoorTrapsExplosionTemplate()
{
	return default.DoorTrapExplosionTemplate;
}

static function class<KFDamageType> GetDoorTrapsDamageTypeClass()
{
	local class<KFDamageType> DamageTypeClass;

	DamageTypeClass = class<KFDamageType>(DynamicLoadObject(default.DoorTrapsExplosionDamageTypeName, class'Class'));
	return DamageTypeClass;
}

 /**
 * @brief Checks if the Siren Resistance skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsSirenResistanceActive()
{
	return PerkSkills[EDemoSirenResistance].bActive;
}

 /**
 * @brief Checks if the On Perk skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsOnPerkActive()
{
	return PerkSkills[EDemoOnPerk].bActive;	
}

/**
 * @brief Checks if the Off Perk skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsOffPerkActive()
{
	return PerkSkills[EDemoOffPerk].bActive;	
}

/**
 * @brief Checks if the Nuke skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsNukeActive()
{
	return PerkSkills[EDemoNuke].bActive;
}

/**
 * @brief The nuke skill spawns a radioactive cloud, this function delivers the template
 *
 * @return Nuke explosion template
 */
static simulated function KFGameExplosion GetNukeExplosionTemplate()
{
	return default.NukeExplosionTemplate;
}

static simulated function class<GameExplosionActor> GetNukeExplosionActorClass()
{
	local class<GameExplosionActor> TempExplosionActorClass;

	TempExplosionActorClass = class<GameExplosionActor>(DynamicLoadObject(default.NukeExplosionActorClassName, class'Class'));
	return TempExplosionActorClass;
}

/**
 * @brief Some weapons have to swap the projectile when nuke is active to work online
 * @return Projectile with nuke effects enabled
 */
static simulated function class<KFProjectile> GetNukeProjectileClass()
{
	local class<KFProjectile> ProjectileClass;

	ProjectileClass = class<KFProjectile>(DynamicLoadObject(default.NukeProjectileClassName, class'Class'));
	return ProjectileClass;
}

/**
 * @brief Modifies a projectile's damage when the nuke skill is avtive
 * @return damage modifier
 */
static function float GetNukeDamageModifier()
{
	return default.NukeDamageModifier;
}

/**
 * @brief Modifies a projectile's damage radius when the nuke skill is avtive
 * @return damage radius modifier
 */
static function float GetNukeRadiusModifier()
{
	return default.NukeRadiusModifier;
}

/**
 * @brief Checks if the Concussive Force skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsConcussiveForceActive()
{
	return PerkSkills[EDemoConcussiveForce].bActive && WorldInfo.TimeDilation < 1.f;
}

simulated final static function AkEvent GetConcussiveExplosionSound()
{
	return default.ConcussiveExplosionSound;
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
simulated static function int GetFleshpoundKillXP( byte Difficulty )
{
	return default.SecondaryXPModifier[Difficulty];
}

/*********************************************************************************************
* @name	 UI
********************************************************************************************* */
simulated static function GetPassiveStrings( out array<string> PassiveValues, out array<string> Increments, byte Level )
{
	PassiveValues[0] = Round((GetPassiveValue( default.ExplosiveDamage, Level ) * 100) - 100) $ "%";
	PassiveValues[1] = Round(GetPassiveValue( default.ExplosiveResistance, Level ) * 100) $ "%";		
	PassiveValues[2] = string(GetExtraAmmo( Level ));

	Increments[0] = "[" @ Round(default.ExplosiveDamage.Increment * 100)  $ "% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ Round(default.ExplosiveResistance.StartingValue * 100)  $ "%" @ "+" @ int(default.ExplosiveResistance.Increment * 100)  $ "% /" @ default.LevelString @ "]";
	Increments[2] = "[" @ Round(default.ExplosiveAmmo.Increment) @ "/ 5" @ default.LevelString @ "]";
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
		`log( "-ExplosiveDamage:" @ GetPassiveValue( ExplosiveDamage, GetLevel() ) $ "%" );
		`log( "-ExplosiveResistance:" @ GetPassiveValue( ExplosiveResistance, GetLevel() ) $ "%" );
		`log( "-ExplosiveAmmo:" @ GetExtraAmmo( GetLevel() ) $ "%" );

	    `log( "Skill Tree" );
	    `log( "-GrenadeSupplier:" @ PerkSkills[EDemoGrenadeSupplier].bActive );
	    `log( "-OnContact:" @ PerkSkills[EDemoOnContact].bActive );
	    `log( "-ExplosiveResistance:" @ PerkSkills[EDemoExplosiveResistance].bActive );
	    `log( "-Sacrifice:" @ PerkSkills[EDemoSacrifice].bActive );
	    `log( "-DoorTraps:" @ PerkSkills[EDemoDoorTraps].bActive );
	    `log( "-SirenResistance:" @ PerkSkills[EDemoSirenResistance].bActive );
	    `log( "-OffPerk:" @ PerkSkills[EDemoOffPerk].bActive );
	    `log( "-OnPerk:" @ PerkSkills[EDemoOnPerk].bActive );
	    `log( "-Nuke:" @ PerkSkills[EDemoNuke].bActive );
	    `log( "-ConcussiveForce:" @ PerkSkills[EDemoConcussiveForce].bActive );
	}
}

DefaultProperties
{	
	SharedExplosiveResistance=0.3f

	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Demolition'

	PrimaryWeaponClassName="KFGameContent.KFWeap_GrenadeLauncher_HX25"
	MeleeWeaponClassName="KFGameContent.KFWeap_Knife_Demolitionist"
	GrenadeClassName="KFGameContent.KFProj_DynamiteGrenade"

	ProgressStatID=`STATID_Demo_Progress
   	PerkBuildStatID=`STATID_Demo_Build

   	SecondaryXPModifier(0)=10
	SecondaryXPModifier(1)=17
	SecondaryXPModifier(2)=21
	SecondaryXPModifier(3)=30

	ExplosiveResistableDamageTypeSuperClass=class'KFDT_Explosive'
	ExplosiveResistanceRadius=500.f

   	ExplosiveDamage=(Name="Explosive Damage",Increment=0.01f,Rank=0,StartingValue=1.f,MaxValue=1.25)
	ExplosiveResistance=(Name="Explosive Resistance",Increment=0.02f,Rank=0,StartingValue=0.1f,MaxValue=0.6f)
	ExplosiveAmmo=(Name="Explosive Ammo",Increment=1.f,Rank=0,StartingValue=0.0f,MaxValue=5.f)

	PerkSkills(EDemoGrenadeSupplier)=(Name="GrenadeSupplier",IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_GrenadeSupplier")
	PerkSkills(EDemoOnContact)=(Name="OnContact",IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_OnContact")
	PerkSkills(EDemoExplosiveResistance)=(Name="ExplosiveResistance",IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_ExplosiveResistance",Increment=0.f,Rank=0,StartingValue=1.2f,MaxValue=1.2f)
	PerkSkills(EDemoSacrifice)=(Name="Sacrifice",IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Sacrifice",Increment=0.f,Rank=0,StartingValue=2.0f,MaxValue=2.f,)
	PerkSkills(EDemoDoorTraps)=(Name="DoorTraps",IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_DoorTraps",Increment=0.f,Rank=0,StartingValue=0.3f,MaxValue=0.3f)
	PerkSkills(EDemoSirenResistance)=(Name="SirenResistance",IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_SirenResistance",Increment=0.f,Rank=0,StartingValue=0.5,MaxValue=0.5)
	PerkSkills(EDemoOffPerk)=(Name="OffPerk",IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_OffPerk",Increment=0.f,Rank=0,StartingValue=0.15,MaxValue=0.15)
	PerkSkills(EDemoOnPerk)=(Name="OnPerk",IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_OnPerk",Increment=0.f,Rank=0,StartingValue=0.3f,MaxValue=0.3f)
	PerkSkills(EDemoNuke)=(Name="Nuke",IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Nuke",Increment=0.f,Rank=0,StartingValue=1.03,MaxValue=1.03)
	PerkSkills(EDemoConcussiveForce)=(Name="ConcussiveForce",IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_ConcussiveForce",Increment=0.f,Rank=0,StartingValue=1.f,MaxValue=1.f)

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=200
		DamageRadius=500
		DamageFalloffExponent=1.f
		DamageDelay=0.f

		// Damage Effects
		KnockDownStrength=10
		KnockDownRadius=100
		FractureMeshRadius=500.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'WEP_Dynamite_ARCH.Dynamite_Explosion'
		ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Frag.Play_WEP_EXP_Grenade_Frag_Explosion'

		// Camera Shake
		CamShake=CameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
		CamShakeInnerRadius=450
		CamShakeOuterRadius=900
		CamShakeFalloff=0.5f
		bOrientCameraShakeTowardsEpicenter=true
		bUseOverlapCheck=false
	End Object
	SacrificeExplosionTemplate=ExploTemplate0

	Begin Object Class=KFGameExplosion Name=ExploTemplate1
		Damage=15
		DamageRadius=450
		DamageFalloffExponent=0.f
		DamageDelay=0.f
		MyDamageType=class'KFDT_Toxic_DemoNuke'
		//bIgnoreInstigator is set to true in PrepareExplosionTemplate

		// Damage Effects
		KnockDownStrength=0
		KnockDownRadius=0
		FractureMeshRadius=0
		FracturePartVel=0
		ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.Nuke_Explosion'
		ExplosionSound=AkEvent'WW_GLO_Runtime.Play_WEP_Nuke_Explo'
		MomentumTransferScale=1.f

		// Camera Shake
		CamShake=CameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
		CamShakeInnerRadius=450
		CamShakeOuterRadius=900
		CamShakeFalloff=1.f
		bOrientCameraShakeTowardsEpicenter=true
	End Object
	NukeExplosionTemplate=ExploTemplate1

	Begin Object Class=KFGameExplosion Name=ExploTemplate2
		Damage=200
		DamageRadius=500
		DamageFalloffExponent=1.f
		DamageDelay=0.f

		// Damage Effects
		KnockDownStrength=10
		KnockDownRadius=100
		FractureMeshRadius=500.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'WEP_Dynamite_ARCH.Dynamite_Explosion'
		ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Frag.Play_WEP_EXP_Grenade_Frag_Explosion'

		// Camera Shake
		CamShake=CameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
		CamShakeInnerRadius=450
		CamShakeOuterRadius=900
		CamShakeFalloff=0.5f
		bOrientCameraShakeTowardsEpicenter=true
		bUseOverlapCheck=false
	End Object
	DoorTrapExplosionTemplate=ExploTemplate2

	NukeExplosionActorClassName="KFGameContent.KFExplosion_Nuke"
	NukeProjectileClassName="KFGameContent.KFProj_ExplosiveSubmunition_HX25_Nuke"
	SacrificeExplosionDamageTypeName="KFGameContent.KFDT_Explosive_Sacrifice"
	DoorTrapsExplosionDamageTypeName="KFGameContent.KFDT_Explosive_DoorTrap"

	NukeIgnoredProjectileNames(0)="KFProj_ExplosiveSubmunition_HX25"
	NukeDamageModifier=1.25
	NukeRadiusModifier=1.25

	ConcussiveExplosionSound=AkEvent'WW_GLO_Runtime.Play_WEP_Demo_Conc'
}

