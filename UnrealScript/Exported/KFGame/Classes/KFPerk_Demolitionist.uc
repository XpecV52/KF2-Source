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
var 					array<name>					NukeIgnoredProjectileNames;
/** How much to modify a projectile's damage when the nuke skill is active */
var 	private const 	float 						NukeDamageModifier;
/** How much to modify a projectile's damage radius when the nuke skill is active */
var 	private const 	float 						NukeRadiusModifier;
var 					AkEvent 					ConcussiveExplosionSound;
var 	private	const	float 						AoeDamageModifier;
var 	private	const	int 						LingeringNukePoisonDamage;
var 	private const	array<name>					PassiveExtraAmmoIgnoredClassNames;
var 	private const	array<name>					ExtraAmmoIgnoredClassNames;
var 	private const 	array<name>					OnlySecondaryAmmoWeapons;
var 	private const 	array<name>					DamageIgnoredDTs;
var 	private	const	float 						DaZedEMPPower;
var 	private const   float 						ProfessionalAoEModifier;
var 	private			bool 						bUsedSacrifice;
var 	private const 	class<KFDamagetype>			LingeringNukeDamageType;

enum EDemoSkills
{
	EDemoDamage,
	EDemoTacticalReload,
	EDemoDirectHit,
	EDemoAmmo,
	EDemoSirenResistance,
	EDemoAoE,
	EDemoCriticalHit,
	EDemoConcussiveForce,
	EDemoNuke,
	EDemoProfessional
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

	if( DamageType != none && IsDamageIgnoredDT( DamageType ) )
	{
		return;
	}

	TempDamage = InDamage;
	;

	if( DamageCauser != none )
	{
		KFW = GetWeaponFromDamageCauser( DamageCauser );
	}

	if( (KFW != none && IsWeaponOnPerk( KFW )) || (DamageType != none && IsDamageTypeOnPerk( DamageType )) )
	{
		;
		//Passive
		TempDamage +=  InDamage * GetPassiveValue( ExplosiveDamage, CurrentLevel );
		;
		//Damage skill
		if( IsDamageActive() )
		{
			TempDamage +=  InDamage * GetSkillValue( PerkSkills[EDemoDamage] );
			;
		}

		if( IsDirectHitActive() && DamageType != none && IsDamageTypeOnPerk( DamageType ) )
		{
			if( class<KFDT_Ballistic_Shell>(DamageType) != none )
			{
				TempDamage += InDamage * GetSkillValue( PerkSkills[EDemoDirectHit] );
				;
			}
		}

		if( IsCriticalHitActive() && MyKFPM != none &&
			IsCriticalHitZone( MyKFPM, HitZoneIdx ) )
		{
			TempDamage += InDamage * GetSkillValue( PerkSkills[EDemoCriticalHit] );
			;
		}

		if( IsAoEActive() )
		{
			TempDamage -= InDamage * GetAoEDamageModifier();
		}
	}
	
	;
	InDamage = Round( TempDamage );
	;
}

static protected function bool IsDamageIgnoredDT( class<KFDamageType> KFDT )
{
	return default.DamageIgnoredDTs.Find( KFDT.name ) != INDEX_NONE;
}

protected function bool IsCriticalHitZone( KFPawn TestPawn, int HitZoneIndex )
{
	if( TestPawn != none && HitzoneIndex >= 0 && HitzoneIndex < TestPawn.HitZones.length )
	{
		return TestPawn.HitZones[HitZoneIndex].DmgScale > 1.f;
	}

	return false;
}

/**
 * @brief DamageType on perk?
 *
 * @param KFDT The damage type
 * @return true/false
 */
static function bool IsDamageTypeOnPerk( class<KFDamageType> KFDT )
{
	if( KFDT != none && IsDamageIgnoredDT( KFDT ) )
	{
		return false;
	}

	return super.IsDamageTypeOnPerk( KFDT );
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

	if( InDamage <= 0 )
	{
		return;
	}

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
simulated function ModifySpareAmmoAmount( KFWeapon KFW, out int PrimarySpareAmmo, optional const out STraderItem TraderItem, optional bool bSecondary=false )
{
	local class<KFPerk> WeaponPerkClass;
	local bool bUsesAmmo;
	local name WeaponClassName;

	if( KFW == none )
	{
		WeaponPerkClass = TraderItem.AssociatedPerkClass;
		bUsesAmmo = TraderItem.WeaponDef.static.UsesAmmo();
		WeaponClassName = TraderItem.ClassName;
	}
	else
	{
		WeaponPerkClass = KFW.AssociatedPerkClass;
		bUsesAmmo = KFW.UsesAmmo();
		WeaponClassName = KFW.class.Name;
	}

	if( bUsesAmmo )
	{
		GivePassiveExtraAmmo( PrimarySpareAmmo, KFW, WeaponPerkClass, WeaponClassName, bSecondary );
		GiveAmmoExtraAmmo( PrimarySpareAmmo, KFW, WeaponPerkClass, WeaponClassName, bSecondary );
	}
}

simulated private function GivePassiveExtraAmmo( out int PrimarySpareAmmo, KFWeapon KFW, class<KFPerk> WeaponPerkClass, name WeaponClassName, optional bool bSecondary=false )
{
	if( ShouldGiveOnlySecondaryAmmo( WeaponClassName ) && !bSecondary )
	{
		return;
	}

	if( IsWeaponOnPerk( KFW, WeaponPerkClass ) && 
		PassiveExtraAmmoIgnoredClassNames.Find( WeaponClassName ) == INDEX_NONE )
	{
		PrimarySpareAmmo += GetExtraAmmo( CurrentLevel );
	}
}

simulated private function GiveAmmoExtraAmmo( out int PrimarySpareAmmo, KFWeapon KFW, class<KFPerk> WeaponPerkClass, name WeaponClassName, optional bool bSecondary=false  )
{
	if( ShouldGiveOnlySecondaryAmmo( WeaponClassName ) && !bSecondary )
	{
		return;
	}

	if( IsWeaponOnPerk( KFW, WeaponPerkClass ) && 
		ExtraAmmoIgnoredClassNames.Find( WeaponClassName ) == INDEX_NONE )
	{
		PrimarySpareAmmo += GetAmmoExtraAmmo();
	}
}

simulated function bool ShouldGiveOnlySecondaryAmmo( name WeaponClassName )
{
	return OnlySecondaryAmmoWeapons.Find( WeaponClassName ) != INDEX_NONE;
}

/**
 * @brief Modifies the max spare ammo
 *
 * @param KFW The weapon
 * @param PrimarySpareAmmo ammo amount
 * @param TraderItem the weapon's associated trader item info
 */
simulated function ModifyMaxSpareAmmoAmount( KFWeapon KFW, out int MaxSpareAmmo, optional const out STraderItem TraderItem, optional bool bSecondary=false )
{
	local class<KFPerk> WeaponPerkClass;
	local bool bUsesAmmo;
	local name WeaponClassName;

	if( KFW == none )
	{
		WeaponPerkClass = TraderItem.AssociatedPerkClass;
		bUsesAmmo = TraderItem.WeaponDef.static.UsesAmmo();
		WeaponClassName = TraderItem.ClassName;
	}
	else
	{
		WeaponPerkClass = KFW.AssociatedPerkClass;
		bUsesAmmo = KFW.UsesAmmo();
		WeaponClassName = KFW.class.Name;
	}

	if( bUsesAmmo )
	{
		GivePassiveExtraAmmo( MaxSpareAmmo, KFW, WeaponPerkClass, WeaponClassName, bSecondary );
		GiveAmmoExtraAmmo( MaxSpareAmmo, KFW, WeaponPerkClass, WeaponClassName, bSecondary );
	}
}

/**
 * @brief Calculates the additional ammo per perk level
 *
 * @param Level Current perk level
 * @return additional ammo
 */
simulated private final static function int GetExtraAmmo( int Level )
{
	return default.ExplosiveAmmo.Increment * FFloor( float( Level ) / 5.f );
}

/*********************************************************************************************
* @name	 Selectable skills
********************************************************************************************* */
simulated function float GetAoERadiusModifier()
{ 
	local float RadiusModifier;

	RadiusModifier = IsAoEActive() ? GetSkillValue( PerkSkills[EDemoAoE] ) : 1.f;
	RadiusModifier = IsProfessionalActive() ? (RadiusModifier + default.ProfessionalAoEModifier) : RadiusModifier;

	return RadiusModifier;
}

simulated function float GetAoEDamageModifier()
{ 
	return IsAoEActive() ? default.AoeDamageModifier : 1.f;
}

simulated protected function int GetAmmoExtraAmmo()
{
	return IsAmmoActive() ? GetSkillValue( PerkSkills[EDemoAmmo] ) : 0.f;
}

/**
 * @brief Should the tactical reload skill adjust the reload speed
 *
 * @param KFW weapon in use
 * @return true/false
 */
simulated function bool GetUsingTactialReload( KFWeapon KFW )
{
	return ( IsTacticalReloadActive() && (IsWeaponOnPerk( KFW ) || IsBackupWeapon( KFW )) );
}

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

	if( MyPRI != none )
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
			InteractionTrigger.SetInteractionIndex( IMT_ReceiveGrenades );
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
	local bool bReceivedGrenades;

	if( SuppliedPawnList.Find( KFPH ) != INDEX_NONE )
	{
		return;
	}

	KFIM = KFInventoryManager(KFPH.InvManager);
	if( KFIM != None )
	{
		bReceivedGrenades = KFIM.AddGrenades( 1 );
	}

	if( bReceivedGrenades )
	{
		SuppliedPawnList.AddItem( KFPH );
		
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

				;
			}
		}
	}
	else
	{
		if( Role == ROLE_Authority )
		{
			KFPC = KFPlayerController(KFPH.Controller);
			if( KFPC != none )
			{
				KFPC.ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_AmmoIsFull, OwnerPC.PlayerReplicationInfo );
			}
		}
	}
}

/**
 * @brief Can other pawns interact with us?
 *
 * @param MyKFPH the other pawn
 * @return true/false
 */
simulated function bool CanInteract( KFPawn_HUman MyKFPH )
{
	return SuppliedPawnList.Find( MyKFPH ) == INDEX_NONE;
}

/**
 * @brief Checks if we should blow up close to death
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
 * @brief Modifies the damage if the shared explosive resistance skill is selected
 *
 * @param InDamage the damage to modify
 */
simulated static function ModifyExplosiveDamage( out float InDamage )
{
	InDamage -= Indamage * GetSharedExplosiveResistance();
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
	return IsSirenResistanceActive();
}

/**
 * @brief skills and weapons can modify the knockdown power chance
 * @return knockdown power multiplier
 */
function float GetKnockdownPowerModifier( optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting=false )
{
	local float KnockDownMultiplier;

	KnockDownMultiplier = 1.f;

	if( IsDamageTypeOnPerk( class<KFDamageType>(DamageType) ) )
	{
		if( IsConcussiveForceActive() )
		{
			KnockDownMultiplier += GetSkillValue( PerkSkills[EDemoConcussiveForce] );
		}

		if( IsTacticalReloadActive() )
		{
			KnockDownMultiplier += GetSkillValue( PerkSkills[EDemoTacticalReload] );
		}
	}

	;
	return KnockDownMultiplier;
}

/**
 * @brief skills and weapons can modify the stumbling power chance
 * @return stumbling power modifier
 */
function float GetStumblePowerModifier( optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart )
{
	local float StumbleMultiplier;

	StumbleMultiplier = 1.f;

	if( IsConcussiveForceActive() && IsDamageTypeOnPerk( DamageType ) )
	{
		StumbleMultiplier += GetSkillValue( PerkSkills[EDemoConcussiveForce] );
	}

	;
	return StumbleMultiplier;
}

/**
 * @brief skills and weapons can modify the stun power chance
 *
 * @return stun power modifier
 */
function float GetStunPowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx )
{
	local float StunMultiplier;

	StunMultiplier = 1.f;

	if( IsConcussiveForceActive() && IsDamageTypeOnPerk( class<KFDamageType>(DamageType) ) )
	{
		StunMultiplier += GetSkillValue( PerkSkills[EDemoConcussiveForce] );
	}

	;
	return StunMultiplier;
}

function float GetReactionModifier( optional class<KFDamageType> DamageType )
{
	local float ReactionMultiplier;

	ReactionMultiplier = 1.f;

	if( IsConcussiveForceActive() && IsDamageTypeOnPerk( DamageType ) )
	{
		ReactionMultiplier += GetSkillValue( PerkSkills[EDemoConcussiveForce] );
	}

	;
	return ReactionMultiplier;
}

simulated static function bool ProjectileShouldNuke( KFProjectile Proj )
{
	return default.NukeIgnoredProjectileNames.Find( Proj.class.name ) == INDEX_NONE;
}

simulated function bool DoorShouldNuke()
{
	return IsNukeActive() && WorldInfo.TimeDilation < 1.f;
}

simulated function bool ShouldNeverDud()
{
	return (IsNukeActive() || IsProfessionalActive()) && WorldInfo.TimeDilation < 1.f; 
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

	StateName = W.GetStateName();
	if( IsProfessionalActive() && IsWeaponOnPerk(W) )
	{
		if( ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
		{
			;
			return GetSkillValue( PerkSkills[EDemoProfessional] );
		}
	}

	return 0.f;
}

/*********************************************************************************************
* @name	 Getters etc
********************************************************************************************* */

/**
 * @brief Checks if the Damage skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsDamageActive()
{
	return PerkSkills[EDemoDamage].bActive;
}

/**
 * @brief Checks if the Damage skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsTacticalReloadActive()
{
	return PerkSkills[EDemoTacticalReload].bActive;
}

/**
 * @brief Checks if the Direct hit skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsDirectHitActive()
{
	return PerkSkills[EDemoDirectHit].bActive;
}

/**
 * @brief Checks if the Ammo skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsAmmoActive()
{
	return PerkSkills[EDemoAmmo].bActive;
}

/**
 * @brief Checks if the Area of Effect skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsAoEActive()
{
	return PerkSkills[EDemoAoE].bActive;
}

/**
 * @brief Checks if the Critical hit skill is active
 *
 * @return true if we have the skill enabled
 */
simulated function bool IsCriticalHitActive()
{
	return PerkSkills[EDemoCriticalHit].bActive;
}

/**
 * @brief Checks if the Heat wave skill is active and if we are in Zed time
 *
 * @return true/false
 */
simulated final private function bool IsProfessionalActive()
{
	return PerkSkills[EDemoProfessional].bActive && WorldInfo.TimeDilation < 1.f;
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

 /**
 * @brief Checks if the Door Traps skill is active
 *
 * @return true if we have the skill enabled
 */
 simulated private final function bool IsDoorTrapsActive()
 {
 	return true;
 }

 /**
 * @brief Checks if the Sacrifice skill is active
 *
 * @return true if we have the skill enabled
 */
 simulated private final function bool IsSacrificeActive()
 {
 	return true;
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

static simulated function class<KFExplosionActor> GetNukeExplosionActorClass()
{
	local class<KFExplosionActor> TempExplosionActorClass;

	TempExplosionActorClass = class<KFExplosionActor>(DynamicLoadObject(default.NukeExplosionActorClassName, class'Class'));
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
 * @brief Modifies a projectile's damage when the nuke skill is active
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

static function int GetLingeringPoisonDamage()
{
	return default.LingeringNukePoisonDamage;
}

static function class<KFDamageType> GetLingeringDamageType()
{
	return default.LingeringNukeDamageType;
}

/**
 * @brief Checks if the Concussive Force skill is active
 *
 * @return true if we have the skill enabled
 */
simulated private final function bool IsConcussiveForceActive()
{
	return PerkSkills[EDemoConcussiveForce].bActive;
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
	PassiveValues[0] = Round( GetPassiveValue( default.ExplosiveDamage, Level ) * 100 ) $ "%";
	PassiveValues[1] = Round( GetPassiveValue( default.ExplosiveResistance, Level ) * 100 ) $ "%";
	PassiveValues[2] = string(GetExtraAmmo( Level ));
	PassiveValues[3] = "";
	PassiveValues[4] = "";
	PassiveValues[5] = "";

	Increments[0] = "[" @ Round(default.ExplosiveDamage.Increment * 100)  $ "% /" @ default.LevelString @ "]";
	Increments[1] = "[" @ Round(default.ExplosiveResistance.StartingValue * 100)  $ "%" @ "+" @ int(default.ExplosiveResistance.Increment * 100)  $ "% /" @ default.LevelString @ "]";
	Increments[2] = "[" @ Round(default.ExplosiveAmmo.Increment) @ "/ 5" @ default.LevelString @ "]";
	Increments[3] = "";
	Increments[4] = "";
	Increments[5] = "";
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

/**	    `log( "Skill Tree" );
	    `log( "-GrenadeSupplier:" @ PerkSkills[EDemoGrenadeSupplier].bActive );
	    `log( "-OnContact:" @ PerkSkills[EDemoOnContact].bActive );
	    `log( "-ExplosiveResistance:" @ PerkSkills[EDemoExplosiveResistance].bActive );
	    `log( "-Sacrifice:" @ PerkSkills[EDemoSacrifice].bActive );
	    `log( "-DoorTraps:" @ PerkSkills[EDemoDoorTraps].bActive );
	    `log( "-SirenResistance:" @ PerkSkills[EDemoSirenResistance].bActive );
	    `log( "-OffPerk:" @ PerkSkills[EDemoOffPerk].bActive );
	    `log( "-OnPerk:" @ PerkSkills[EDemoOnPerk].bActive );
	    `log( "-Nuke:" @ PerkSkills[EDemoNuke].bActive );
	    `log( "-ConcussiveForce:" @ PerkSkills[EDemoConcussiveForce].bActive );*/
	}
}

defaultproperties
{
   ExplosiveDamage=(Name="Explosive Damage",Increment=0.010000,MaxValue=0.250000)
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
   NukeIgnoredProjectileNames(0)="KFProj_ExplosiveSubmunition_HX25"
   NukeIgnoredProjectileNames(1)="KFProj_ExplosiveSubmunition_HX25_Nuke"
   NukeDamageModifier=1.500000
   NukeRadiusModifier=1.350000
   ConcussiveExplosionSound=AkEvent'WW_GLO_Runtime.Play_WEP_Demo_Conc'
   AoeDamageModifier=0.700000
   LingeringNukePoisonDamage=20
   PassiveExtraAmmoIgnoredClassNames(0)="KFProj_DynamiteGrenade"
   ExtraAmmoIgnoredClassNames(0)="KFProj_DynamiteGrenade"
   ExtraAmmoIgnoredClassNames(1)="KFWeap_Thrown_C4"
   OnlySecondaryAmmoWeapons(0)="KFWeap_AssaultRifle_M16M203"
   DamageIgnoredDTs(0)="KFDT_Ballistic_M16M203"
   DamageIgnoredDTs(1)="KFDT_Bludgeon_M16M203"
   ProfessionalAoEModifier=0.250000
   LingeringNukeDamageType=Class'KFGame.KFDT_DemoNuke_Toxic_Lingering'
   ProgressStatID=60
   PerkBuildStatID=61
   SecondaryXPModifier(0)=10
   SecondaryXPModifier(1)=17
   SecondaryXPModifier(2)=21
   SecondaryXPModifier(3)=30
   PerkName="Demolitionist"
   Passives(0)=(Title="Perk Weapon Damage",Description="Perk weapon damage increases %x% per level")
   Passives(1)=(Title="Explosive Resistance",Description="Explosive resistance gains 10% and increases %x% per level")
   Passives(2)=(Title="Extra Explosive Ammo",Description="Explosive ammo increases %x% every five levels")
   Passives(3)=(Title="+Grenade Supplier",Description="Teammates can get one grenade from you each wave")
   Passives(4)=(Title="+Door Traps",Description="Doors you weld will explode when destroyed")
   Passives(5)=(Title="Reactive Armor",Description="When first reduced to 0 Health your armor will explode and leave you with 1 Health")
   SkillCatagories(0)="Technique"
   SkillCatagories(1)="Explosives"
   SkillCatagories(2)="Advanced Techniques"
   SkillCatagories(3)="Weapon Techniques"
   SkillCatagories(4)="Advanced Explosives"
   EXPAction1="Dealing Demolitionist weapon damage"
   EXPAction2="Killing Fleshpounds with Demolitionist weapons"
   PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Demolition'
   InteractIcon=Texture2D'UI_World_TEX.Demolitionist_Supplier_HUD'
   PerkSkills(0)=(Name="Damage",StartingValue=0.250000,MaxValue=0.250000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_GrenadeSupplier")
   PerkSkills(1)=(Name="Speed",StartingValue=0.100000,MaxValue=0.100000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Speed")
   PerkSkills(2)=(Name="DirectHit",StartingValue=0.250000,MaxValue=0.250000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_ExplosiveResistance")
   PerkSkills(3)=(Name="Ammo",StartingValue=5.000000,MaxValue=5.000000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Ammo")
   PerkSkills(4)=(Name="SirenResistance",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_SirenResistance")
   PerkSkills(5)=(Name="AreaOfEffect",StartingValue=1.500000,MaxValue=1.500000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_AoE")
   PerkSkills(6)=(Name="CriticalHit",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Crit")
   PerkSkills(7)=(Name="ConcussiveForce",StartingValue=0.500000,MaxValue=0.500000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_ConcussiveForce")
   PerkSkills(8)=(Name="Nuke",StartingValue=1.030000,MaxValue=1.030000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Nuke")
   PerkSkills(9)=(Name="Professional",StartingValue=0.900000,MaxValue=0.900000,IconPath="UI_PerkTalent_TEX.demolition.UI_Talents_Demolition_Professional")
   ZedTimeModifyingStates(0)="WeaponFiring"
   ZedTimeModifyingStates(1)="WeaponBurstFiring"
   ZedTimeModifyingStates(2)="WeaponSingleFiring"
   ZedTimeModifyingStates(3)="Reloading"
   ZedTimeModifyingStates(4)="WeaponSingleFireAndReload"
   ZedTimeModifyingStates(5)="FiringSecondaryState"
   ZedTimeModifyingStates(6)="AltReloading"
   PrimaryWeaponDef=Class'KFGame.KFWeapDef_HX25'
   KnifeWeaponDef=Class'KFGame.KFWeapDef_Knife_Demo'
   GrenadeWeaponDef=Class'KFGame.KFWeapDef_Grenade_Demo'
   AutoBuyLoadOutPath(0)=Class'KFGame.KFWeapDef_HX25'
   AutoBuyLoadOutPath(1)=Class'KFGame.KFWeapDef_M79'
   AutoBuyLoadOutPath(2)=Class'KFGame.KFWeapDef_M16M203'
   AutoBuyLoadOutPath(3)=Class'KFGame.KFWeapDef_RPG7'
   HitAccuracyHandicap=2.000000
   Name="Default__KFPerk_Demolitionist"
   ObjectArchetype=KFPerk'KFGame.Default__KFPerk'
}
