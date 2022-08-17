//=============================================================================
// KFPerk_Demolitionist
//=============================================================================
// The demo perk class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Christian "schneidzekk" Schneider
//=============================================================================

class KFPerk_Demolitionist extends KFPerk
		native;



 


 


  



 



 




 



 




 



 



 



 



 



 





 


 



 







#linenumber 14

var				const	PerkSkill 					ExplosiveDamage;			// 1% increased explosive damage per level (max 25%)
var 			const	PerkSkill					ExplosiveResistance;        // 10% explosive resistance, additional 2% resistance per level (max 60%)
var 			const	PerkSkill					ExplosiveAmmo;            	// 1 extra explosive ammo for every 5 levels. Weapons only

var						Array<KFPawn_Human>			SuppliedPawnList;

var 	private const   float 						SharedExplosiveResistance;
var 	private const 	class<Damagetype>			ExplosiveResistableDamageTypeSuperClass;
/** the radius in within the shared explosive resistance works */
var 	private const 	float 						ExplosiveResistanceRadius;

/** Template for explosion when you die with the Sacrifice perk skill*/
var 					KFGameExplosion				SacrificeExplosionTemplate;
/** Template for explosion when do an explosion with the Nuke perk skill*/
var 					KFGameExplosion				NukeExplosionTemplate;
/** Template for explosion when a door is opened by zeds that has been welded when you have the Door Trap perk skill*/
var 					KFGameExplosion				DoorTrapExplosionTemplate;
var 					String 						NukeExplosionActorClassName;
var						String						NukeExplosionDamageTypeName;
var						String 						NukeProjectileClassName;
var 					String 						SacrificeExplosionDamageTypeName;
var 					String 						DoorTrapsExplosionDamageTypeName;
var 					array<name>					NukeIgnoredProjectileNames;
/** How much to modify a projectile's damage when the nuke skill is active */
var 	private const 	float 						NukeDamageModifier;
/** How much to modify a projectile's damage radius when the nuke skill is active */
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

	ResetSupplier();
}

/**
 * @brief Resets certain perk values on wave start/end
 */
function OnWaveEnded()
{
	Super.OnWaveEnded();
	bUsedSacrifice = false;
	ResetSupplier();
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
		TempDamage +=  (InDamage * GetPassiveValue( ExplosiveDamage, CurrentLevel )) - InDamage;
	}
	else
	{
		if( IsOffPerkActive() )
		{
			TempDamage += InDamage * GetSkillValue( PerkSkills[EDemoOffPerk] );
		}
	}

	;
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
	local class<KFPerk> WeaponPerkClass;
	local bool bUsesAmmo;

	if( KFW == none )
	{
		WeaponPerkClass = TraderItem.AssociatedPerkClass;
		bUsesAmmo = TraderItem.WeaponDef.static.UsesAmmo();
	}
	else
	{
		WeaponPerkClass = KFW.AssociatedPerkClass;
		bUsesAmmo = KFW.UsesAmmo();
	}

	if( bUsesAmmo && IsWeaponOnPerk( KFW, WeaponPerkClass ) )
	{
		;
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
		bUsesAmmo = TraderItem.WeaponDef.static.UsesAmmo();
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
simulated final private function ResetSupplier()
{
	if( MyPRI != none )
	{
		if( SuppliedPawnList.Length > 0 )
		{
			SuppliedPawnList.Remove( 0, SuppliedPawnList.Length );
		}
	}

	if( MyPRI != none && IsSupplierActive() )
	{
		if( SuppliedPawnList.Length > 0 )
		{
			SuppliedPawnList.Remove( 0, SuppliedPawnList.Length );
		}

		MyPRI.bPerkCanSupply = true;

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
	local KFPlayerReplicationInfo OwnerPRI, UserPRI;

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

			UserPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
			OwnerPRI = KFPlayerReplicationInfo(OwnerPC.PlayerReplicationInfo);
			if( UserPRI != none && OwnerPRI != none )
			{
				UserPRI.MarkSupplierOwnerUsed( OwnerPRI );
			}
		}
	}

	KFIM = KFInventoryManager(KFPH.InvManager);
	if( KFIM != None )
	{
		KFIM.AddGrenades( 1 );
		;
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

		;
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
function float GetKnockdownPowerModifier( optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting=false )
{
	local float KnockDownMultiplier;

	KnockDownMultiplier = 1.f;

	if( IsDamageTypeOnPerk( class<KFDamageType>(DamageType) ) )
	{
		KnockDownMultiplier += IsOnPerkActive() ? GetSkillValue( PerkSkills[EDemoOnPerk] ) : 0.f;
		KnockDownMultiplier += IsConcussiveForceActive() ? GetSkillValue( PerkSkills[EDemoConcussiveForce] ) : 0.f;
	}
	;
	return KnockDownMultiplier;
}

/**
 * @brief skills and weapons can modify the stumbling power chance
 * @return stumpling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart )
{
	if( IsOnPerkActive() && IsDamageTypeOnPerk( DamageType ) )
	{
		;
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
		;
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
		LogInternal("PASSIVE PERKS");
		LogInternal("-ExplosiveDamage:" @ GetPassiveValue( ExplosiveDamage, GetLevel() ) $ "%");
		LogInternal("-ExplosiveResistance:" @ GetPassiveValue( ExplosiveResistance, GetLevel() ) $ "%");
		LogInternal("-ExplosiveAmmo:" @ GetExtraAmmo( GetLevel() ) $ "%");

	    LogInternal("Skill Tree");
	    LogInternal("-GrenadeSupplier:" @ PerkSkills[EDemoGrenadeSupplier].bActive);
	    LogInternal("-OnContact:" @ PerkSkills[EDemoOnContact].bActive);
	    LogInternal("-ExplosiveResistance:" @ PerkSkills[EDemoExplosiveResistance].bActive);
	    LogInternal("-Sacrifice:" @ PerkSkills[EDemoSacrifice].bActive);
	    LogInternal("-DoorTraps:" @ PerkSkills[EDemoDoorTraps].bActive);
	    LogInternal("-SirenResistance:" @ PerkSkills[EDemoSirenResistance].bActive);
	    LogInternal("-OffPerk:" @ PerkSkills[EDemoOffPerk].bActive);
	    LogInternal("-OnPerk:" @ PerkSkills[EDemoOnPerk].bActive);
	    LogInternal("-Nuke:" @ PerkSkills[EDemoNuke].bActive);
	    LogInternal("-ConcussiveForce:" @ PerkSkills[EDemoConcussiveForce].bActive);
	}
}

defaultproperties
{
   ExplosiveDamage=(Name="Explosive Damage",Increment=0.010000,StartingValue=1.000000,MaxValue=1.250000)
   ExplosiveResistance=(Name="Explosive Resistance",Increment=0.020000,StartingValue=0.100000,MaxValue=0.600000)
   ExplosiveAmmo=(Name="Explosive Ammo",Increment=1.000000,MaxValue=5.000000)
   SharedExplosiveResistance=0.300000
   ExplosiveResistableDamageTypeSuperClass=Class'KFGame.KFDT_Explosive'
   ExplosiveResistanceRadius=500.000000
   SacrificeExplosionTemplate=KFGameExplosion'KFGame.Default__KFPerk_Demolitionist:ExploTemplate0'
   NukeExplosionTemplate=KFGameExplosion'KFGame.Default__KFPerk_Demolitionist:ExploTemplate1'
   DoorTrapExplosionTemplate=KFGameExplosion'KFGame.Default__KFPerk_Demolitionist:ExploTemplate2'
   NukeExplosionActorClassName="KFGameContent.KFExplosion_Nuke"
   NukeProjectileClassName="KFGameContent.KFProj_ExplosiveSubmunition_HX25_Nuke"
   SacrificeExplosionDamageTypeName="KFGameContent.KFDT_Explosive_Sacrifice"
   DoorTrapsExplosionDamageTypeName="KFGameContent.KFDT_Explosive_DoorTrap"
   NukeIgnoredProjectileNames(0)="KFProj_ExplosiveSubmunition_HX25"
   NukeIgnoredProjectileNames(1)="KFProj_ExplosiveSubmunition_HX25_Nuke"
   NukeDamageModifier=1.250000
   NukeRadiusModifier=1.250000
   ConcussiveExplosionSound=AkEvent'WW_GLO_Runtime.Play_WEP_Demo_Conc'
   ProgressStatID=60
   PerkBuildStatID=61
   SecondaryXPModifier(0)=10
   SecondaryXPModifier(1)=17
   SecondaryXPModifier(2)=21
   SecondaryXPModifier(3)=30
   PerkName="Demolitionist"
   Passives(0)=(Title="Perk Weapon Damage",Description="Perk weapon damage increased by %x%")
   Passives(1)=(Title="Explosive Resistance",Description="%x% resistance to explosive damage")
   Passives(2)=(Title="Extra Explosive Ammo",Description="%x% more starting explosive ammo")
   Passives(3)=()
   Passives(4)=()
   SkillCatagories(0)="Technique"
   SkillCatagories(1)="Resistance"
   SkillCatagories(2)="Advanced Techniques"
   SkillCatagories(3)="Weapon Techniques"
   SkillCatagories(4)="Advanced Explosives"
   EXPAction1="Dealing Demolitionist weapon damage"
   EXPAction2="Killing Fleshpounds with Demolitionist weapons"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Demolition'
   InteractIcon=Texture2D'UI_World_TEX.Demolitionist_Supplier_HUD'
   PerkSkills(0)=(Name="GrenadeSupplier",IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_GrenadeSupplier")
   PerkSkills(1)=(Name="OnContact",IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_OnContact")
   PerkSkills(2)=(Name="ExplosiveResistance",Increment=0.020000,StartingValue=0.100000,MaxValue=0.600000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_ExplosiveResistance")
   PerkSkills(3)=(Name="Sacrifice",StartingValue=2.000000,MaxValue=2.000000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Sacrifice")
   PerkSkills(4)=(Name="DoorTraps",StartingValue=0.300000,MaxValue=0.300000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_DoorTraps")
   PerkSkills(5)=(Name="SirenResistance",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_SirenResistance")
   PerkSkills(6)=(Name="OffPerk",StartingValue=0.100000,MaxValue=0.100000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_OffPerk")
   PerkSkills(7)=(Name="OnPerk",StartingValue=0.300000,MaxValue=0.300000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_OnPerk")
   PerkSkills(8)=(Name="Nuke",StartingValue=1.030000,MaxValue=1.030000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Nuke")
   PerkSkills(9)=(Name="ConcussiveForce",StartingValue=1.000000,MaxValue=1.000000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_ConcussiveForce")
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_HX25'
   KnifeWeaponDef=Class'KFGame.KFWeapDef_Knife_Demo'
   GrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Demo'
   HitAccuracyHandicap=2.000000
   Name="Default__KFPerk_Demolitionist"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
