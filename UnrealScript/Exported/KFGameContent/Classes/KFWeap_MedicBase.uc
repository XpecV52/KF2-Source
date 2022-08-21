//=============================================================================
// KFWeap_MedicBase
//=============================================================================
// Base class for medic weapons that shoot healing darts and can lock on
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_MedicBase extends KFWeapon
	abstract;

/*********************************************************************************************
 * @name Healing Darts
 ********************************************************************************************* */
/** DamageTypes for Instant Hit Weapons */
var	class<DamageType>   HealingDartDamageType;

/** How much to heal for when using this weapon */
var(Healing) int		HealAmount;

/** Cost of healing per fire */
var(Healing) int        HealAmmoCost;

/** How many points of heal ammo to recharge per second */
var(Healing) float      HealFullRechargeSeconds;

/** Keeps track of incremental healing since we have to heal in whole integers */
var          float      HealingIncrement;

/** How many points of heal ammo to recharge per second. Calculated from the HealFullRechargeSeconds */
var          float      HealRechargePerSecond;

/** The sound of the healing dart hitting someone they will heal */
var AKEvent	HealImpactSoundPlayEvent;

/** The sound of the healing dart hitting someone they will hurt */
var AKEvent	HurtImpactSoundPlayEvent;

/** Sound to play when the weapon is fired */
var(Sounds)	WeaponFireSndInfo DartFireSnd;

const ShootDartAnim		= 'Shoot_Dart';
const ShootDartIronAnim	= 'Shoot_Iron_Dart';

/** How long after we shoot a healing dart before a zed can grab us.
  * Prevents us from missing healing shots from being grabbed */
var(Weapon) float   HealDartShotWeakZedGrabCooldown;

/*********************************************************************************************
 * @name Weapon lock on support
 ********************************************************************************************* */

/** The frequency with which we will check for a lock */
var(Locking) float		LockCheckTime;

/** How far out should we be considering actors for a lock */
var(Locking) float		LockRange;

/** How long does the player need to target an actor to lock on to it*/
var(Locking) float		LockAcquireTime;

/** Once locked, how long can the player go without painting the object before they lose the lock */
var(Locking) float		LockTolerance;

/** When true, this weapon is locked on target */
var bool         		bLockedOnTarget;

/** What "target" is this weapon locked on to */
var repnotify Actor 	LockedTarget;

/** What "target" is current pending to be locked on to */
var repnotify Actor		PendingLockedTarget;

/** angle for locking for lock targets */
var(Locking) float 		LockAim;

/** The frequency with which we play the Lock Targeting sound */
var(Locking) float		LockTargetingSoundInterval;

/** Sound Effects to play when Locking */
var AkBaseSoundObject   LockAcquiredSoundFirstPerson;
var AkBaseSoundObject   LockTargetingStopEvent;
var AkBaseSoundObject   LockTargetingStopEventFirstPerson;
var AkBaseSoundObject   LockLostSoundFirstPerson;
var AkBaseSoundObject   LockTargetingSoundFirstPerson;

/** If true, weapon will try to lock onto targets */
var bool bTargetLockingActive;

/** How much time is left before pending lock-on can be acquired */
var float PendingLockAcquireTimeLeft;
/** How much time is left before pending lock-on is lost */
var float PendingLockTimeout;
/** How much time is left before lock-on is lost */
var float LockedOnTimeout;

/*********************************************************************************************
 @name Optics UI
********************************************************************************************* */

var class<KFGFxWorld_MedicOptics> OpticsUIClass;
var KFGFxWorld_MedicOptics OpticsUI;

/** The last updated value for our ammo - Used to know when to update our optics ammo */
var byte StoredPrimaryAmmo;
var byte StoredSecondaryAmmo;

replication
{
	// Server->Client properties
	if (bNetDirty && Role == ROLE_Authority)
		bLockedOnTarget, LockedTarget, PendingLockedTarget;
}

/* epic ===============================================
* ::ReplicatedEvent
*
* Called when a variable with the property flag "RepNotify" is replicated
*
* =====================================================
*/
simulated event ReplicatedEvent(name VarName)
{
    if (VarName == nameof(LockedTarget))
	{
		// Clear the lock if we lost our LockedTarget and don't have a new PendingLockedTarget
		if( OpticsUI != none )
		{
		if (LockedTarget == none && PendingLockedTarget == none)
		{
			OpticsUI.ClearLockOn();
		}
		else if (LockedTarget != none)
		{
			OpticsUI.LockedOn();
		}
	}
	}
	else if (VarName == nameof(PendingLockedTarget))
	{
		// Clear the lock if we lost our LockedTarget and don't have a new PendingLockedTarget
		if( OpticsUI != none )
		{
		if (PendingLockedTarget == none && LockedTarget == none)
		{
			OpticsUI.ClearLockOn();
		}
		else if (PendingLockedTarget != none)
		{
			OpticsUI.StartLockOn();
		}
	}
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

/*********************************************************************************************
 @name Actor
********************************************************************************************* */

/**
  * Check target locking - server-side only
  * HealAmmo Regen client and server
  */
simulated event Tick( FLOAT DeltaTime )
{
	// If we're not fully charged tick the HealAmmoRegen system
    if( AmmoCount[ALTFIRE_FIREMODE] < MagazineCapacity[ALTFIRE_FIREMODE] )
	{
        HealAmmoRegeneration(DeltaTime);
	}

	if (Instigator != none && Instigator.weapon == self)
	{
		UpdateOpticsUI();
	}

	Super.Tick(DeltaTime);
}

/*********************************************************************************************
 @name Firing / Projectile
********************************************************************************************* */

/** Instead of switch fire mode use as immediate alt fire */
simulated function AltFireMode()
{
	if ( !Instigator.IsLocallyControlled() )
	{
		return;
	}

	// StartFire - StopFire called from KFPlayerInput
	StartFire(ALTFIRE_FIREMODE);
}

simulated function bool HasAmmo(byte FireModeNum, optional int Amount = 1)
{
	if(FireModeNum == ALTFIRE_FIREMODE)
	{
		return AmmoCount[ALTFIRE_FIREMODE] >= HealAmmoCost;
	}

	return Super.HasAmmo(FireModeNum, Amount);
}

/** @see KFWeapon::ConsumeAmmo */
simulated function ConsumeAmmo( byte FireModeNum )
{
    local int AmmoGroup;

    // If its not the healing fire mode, return
    if( FireModeNum != ALTFIRE_FIREMODE )
    {
        Super.ConsumeAmmo(FireModeNum);
        return;
    }








	// If AmmoCount is being replicated, don't allow the client to modify it here
	if ( Role == ROLE_Authority || bAllowClientAmmoTracking )
	{
		AmmoGroup = GetAmmoType(FireModeNum);
        // Don't consume ammo if magazine size is 0 (infinite ammo with no reload)
		if (MagazineCapacity[AmmoGroup] > 0 && AmmoCount[AmmoGroup] > 0)
		{
			// Reduce ammo amount by heal ammo cost
            AmmoCount[AmmoGroup] = Max(AmmoCount[AmmoGroup] - HealAmmoCost, 0);
		}
	}
}

/**
 * See Pawn.ProcessInstantHit
 * @param DamageReduction: Custom KF parameter to handle penetration damage reduction
 */
simulated function ProcessInstantHitEx( byte FiringMode, ImpactInfo Impact, optional int NumHits, optional out float out_PenetrationVal, optional int ImpactNum )
{
    local KFPawn HealTarget;
    local KFPlayerController Healer;

    HealTarget = KFPawn(Impact.HitActor);
    Healer = KFPlayerController(Instigator.Controller);

	if (FiringMode == ALTFIRE_FIREMODE && HealTarget != none && WorldInfo.GRI.OnSameTeam(Instigator,HealTarget) )
	{
        // Let the accuracy system know that we hit someone
		if( Healer != none )
		{
            Healer.AddShotsHit(1);
		}

    	HealTarget.HealDamage(HealAmount, Instigator.Controller, HealingDartDamageType);

    	if( Healer != none )
    	{
    		Healer.GetPerk().CheckForAirborneAgent( HealTarget, HealingDartDamageType, HealAmount );
    	}
        // Play a healed impact sound for the healee
        if( HealImpactSoundPlayEvent != None && HealTarget != None && !bSuppressSounds  )
    	{
    	    HealTarget.PlaySoundBase(HealImpactSoundPlayEvent, false, false,,Impact.HitLocation);
    	}
	}
	else
	{
        // Play a hurt impact sound for the hurt
        if( HurtImpactSoundPlayEvent != None && HealTarget != None && !bSuppressSounds  )
    	{
    	    HealTarget.PlaySoundBase(HurtImpactSoundPlayEvent, false, false,,Impact.HitLocation);
    	}
        Super.ProcessInstantHitEx(FiringMode, Impact, NumHits, out_PenetrationVal);
	}
}

/** Spawn projectile is called once for each shot pellet fired */
simulated function KFProjectile SpawnProjectile( class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir )
{
    local KFProjectile SpawnedProjectile;

	SpawnedProjectile = Super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);

    if (bLockedOnTarget && KFProj_HealingDart(SpawnedProjectile) != None)
	{
		KFProj_HealingDart(SpawnedProjectile).SeekTarget = LockedTarget;
	}

	return SpawnedProjectile;
}

/*********************************************************************************************
 * State WeaponSingleFiring
 * Fire must be released between every shot.
 *********************************************************************************************/

simulated state WeaponSingleFiring
{
	/** Handle ClearPendingFire */
	simulated function FireAmmunition()
    {
        if(CurrentFireMode == ALTFIRE_FIREMODE)
        {
            // Don't let a weak zed grab us when we just shot a healing dart
            SetWeakZedGrabCooldownOnPawn(HealDartShotWeakZedGrabCooldown);
            StartHealRecharge();
        }

        Super.FireAmmunition();
	}

	/**
	 * We override BeginFire() so that we can check for zooming and/or empty weapons
	 */
	simulated function BeginFire(Byte FireModeNum)
	{
		if( FireModeNum == ALTFIRE_FIREMODE && !CanHealFire() )
		{
            return;
		}

        Super.BeginFire(FireModeNum);
	}
}

/**
 * Has enough heal charge to fire a dart
 */
simulated event bool CanHealFire()
{
	return AmmoCount[ALTFIRE_FIREMODE] >= HealAmmoCost;
}

/*********************************************************************************************
 @name Reload / recharge
********************************************************************************************* */

/** Overridden to call StartHealRecharge on server */
function GivenTo( Pawn thisPawn, optional bool bDoNotActivate )
{
	super.GivenTo( thisPawn, bDoNotActivate );

	// StartHealRecharge gets called on the client from ClientWeaponSet (called from ClientGivenTo, called from GivenTo),
	// but we also need this called on the server for remote clients, since the server needs to track the ammo too (to know if/when to spawn projectiles)

	if( Role == ROLE_Authority && !thisPawn.IsLocallyControlled() )
	{
		StartHealRecharge();
	}
}

/** Start the heal recharge cycle */
simulated function StartHealRecharge()
{
	local KFPerk InstigatorPerk;
	local float UsedHealRechargeTime;

	InstigatorPerk = GetPerk();
	// begin ammo recharge on server
	if ( Role == ROLE_Authority || bAllowClientAmmoTracking )
	{
		UsedHealRechargeTime = HealFullRechargeSeconds;

        InstigatorPerk.ModifyHealerRechargeTime( UsedHealRechargeTime );
		// Set the healing recharge rate whenever we start charging
        HealRechargePerSecond = MagazineCapacity[ALTFIRE_FIREMODE]/UsedHealRechargeTime;
		HealingIncrement = 0;
	}
}

/** Heal Ammo Regen */
simulated function HealAmmoRegeneration(float DeltaTime)
{
    HealingIncrement += HealRechargePerSecond * DeltaTime;

    if( HealingIncrement >= 1.0 && AmmoCount[ALTFIRE_FIREMODE] < MagazineCapacity[ALTFIRE_FIREMODE] )
    {
        AmmoCount[ALTFIRE_FIREMODE]++;
        HealingIncrement -= 1.0;
    }
}

/** Returns true if weapon should be auto-reloaded */
simulated function bool ShouldAutoReload(byte FireModeNum)
{
    local bool bHasAmmo;

    bHasAmmo = HasAmmo(FireModeNum);

    // do dry fire sounds
    if( !bHasAmmo && WeaponDryFireSnd[FireModeNum] != none && Instigator != none && Instigator.IsLocallyControlled() )
    {
        WeaponPlaySound(WeaponDryFireSnd[FireModeNum]);
        if( Role < ROLE_Authority )
        {
            ServerPlayDryFireSound(FireModeNum);
        }
    }

    // If its the healing fire mode, don't auto reload
    if( FireModeNum == ALTFIRE_FIREMODE )
    {
        return false;
    }

	return (!bHasAmmo && CanReload());
}

/*********************************************************************************************
 @name Target Locking
********************************************************************************************* */

/**
 *  This function is used to adjust the LockTarget.
 */
function AdjustLockTarget(actor NewLockTarget)
{
	if ( LockedTarget == NewLockTarget )
	{
		// no need to update
		return;
	}

	if (NewLockTarget == None)
	{
		// Clear the lock
		if (bLockedOnTarget)
		{
			bLockedOnTarget = false;
			LockedTarget = None;

			if (OpticsUI != none && PendingLockedTarget == none)
			{
				// Optics UI only exists for local players
				OpticsUI.ClearLockOn();
			}

			ClientPlayTargetingSound(LockLostSoundFirstPerson);
		}
	}
	else
	{
		// Set the lock
		bLockedOnTarget = true;
		LockedTarget = NewLockTarget;

		if (OpticsUI != none)
		{
			// Optics UI only exists for local players
			OpticsUI.LockedOn();
		}

		ClientPlayTargetingSound(LockAcquiredSoundFirstPerson);
	}
}

/**
* Given an potential target TA determine if we can lock on to it.  By default only allow locking on
* to pawns.
*/
simulated function bool CanLockOnTo(Actor TA)
{
	Local Pawn PawnTarget;

    PawnTarget = Pawn(TA);

    // Make sure the pawn is legit, isn't dead, and isn't already at full health
    if ( (TA == None) || !TA.bProjTarget || TA.bDeleteMe || (PawnTarget == None)
        || (TA == Instigator) || (PawnTarget.Health <= 0) || (PawnTarget.Health >= PawnTarget.HealthMax) )
	{
		return false;
	}

	// Make sure and only lock onto players on the same team
    return WorldInfo.GRI.OnSameTeam(Instigator,TA);
}

/** returns true if lock-on is possible */
function bool AllowTargetLockOn()
{
	return !Instigator.bNoWeaponFiring;
}

/**
* This function checks to see if we are locked on a target
*/
function CheckTargetLock()
{
    local Actor BestTarget, HitActor, TA;
	local vector StartTrace, EndTrace, Aim, HitLocation, HitNormal;
	local rotator AimRot;
	local float BestAim, BestDist;

	if ( (Instigator == None) || (Instigator.Controller == None) || (self != Instigator.Weapon) )
	{
		return;
	}

	if ( !AllowTargetLockOn() )
	{
		AdjustLockTarget(None);
		PendingLockedTarget = None;
		ClearTimer(nameof(PlayTargetingBeepTimer));
		return;
	}

	// clear lock if target is destroyed
	if ( LockedTarget != None )
	{
		if ( LockedTarget.bDeleteMe )
		{
			AdjustLockTarget(None);
		}
	}

	BestTarget = None;

	//@todo: if we ever want AI to use medic weapons, then bring back the commented-out code that used to be here

	// Begin by tracing the shot to see if it hits anyone
	Instigator.Controller.GetPlayerViewPoint( StartTrace, AimRot );
	Aim = vector(AimRot);
	EndTrace = StartTrace + Aim * LockRange;
	HitActor = Trace(HitLocation, HitNormal, EndTrace, StartTrace, true,,, TRACEFLAG_Bullet);

	// Check for a hit
	if ( (HitActor == None) || !CanLockOnTo(HitActor) )
	{
		// We didn't hit a valid target, have the controller attempt to pick a good target
		BestAim = LockAim;
		BestDist = 0.0;
		TA = Instigator.Controller.PickTarget(class'Pawn', BestAim, BestDist, Aim, StartTrace, LockRange, True);
		if ( TA != None && CanLockOnTo(TA) )
		{
            // Trace to see if we hit a destructible, as the PickTarget code only traces against world geometry
            // @todo: Set up pick target to ignore pawns (as it should), but not trace through destructibles
            HitActor = Trace(HitLocation, HitNormal, TA.Location, StartTrace, true,,, TRACEFLAG_Bullet);

            // Make sure we didn't hit a destructible
            if( KFFracturedMeshActor(HitActor) != none || KFDestructibleActor(HitActor) != none )
            {
                BestTarget = none;
            }
            else
            {
                BestTarget = TA;
        	}
		}
	}
	else	// We hit a valid target
	{
		BestTarget = HitActor;
	}

	// If we have a "possible" target, note its time mark
	if ( BestTarget != None )
	{
		if ( BestTarget == LockedTarget )
		{
			LockedOnTimeout = LockTolerance;
		}
		// We have our best target, see if they should become our current target.
		// Check for a new Pending Lock
		else if (PendingLockedTarget != BestTarget)
		{
			PendingLockedTarget = BestTarget;
			PendingLockTimeout = LockTolerance;
			PendingLockAcquireTimeLeft = LockAcquireTime;

			SetTimer(LockTargetingSoundInterval, true, nameof(PlayTargetingBeepTimer));

			if (OpticsUI != none)
			{
				// Optics UI only exists for local players
				OpticsUI.StartLockOn();
			}

			// Play the "targeting" beep when we begin attempting to lock onto a target
			// that we haven't locked onto yet
			ClientPlayTargetingSound(LockTargetingSoundFirstPerson);
		}
		// Acquire new target if LockAcquireTime has passed
		if ( PendingLockedTarget != None )
		{
			PendingLockAcquireTimeLeft -= LockCheckTime;
			if ( PendingLockedTarget == BestTarget && PendingLockAcquireTimeLeft <= 0 )
			{
				AdjustLockTarget(PendingLockedTarget);
				PendingLockedTarget = None;
				ClearTimer(nameof(PlayTargetingBeepTimer));
			}
		}
	}
	// If we lost a target, attempt to invalidate the pending target
	else if ( PendingLockedTarget != None )
	{
		PendingLockTimeout -= LockCheckTime;
		if ( PendingLockTimeout <= 0 || !CanLockOnTo(PendingLockedTarget) )
		{
			PendingLockedTarget = None;
			if (OpticsUI != none)
			{
				// Optics UI only exists for local players
				OpticsUI.ClearLockOn();
			}
			ClearTimer(nameof(PlayTargetingBeepTimer));
		}
	}

	// If the new target is not the same, attempt to invalidate current locked on target
	if ( LockedTarget != None && BestTarget != LockedTarget )
	{
		LockedOnTimeout -= LockCheckTime;
		if ( LockedOnTimeout <= 0.f || !CanLockOnTo(LockedTarget) )
		{
			AdjustLockTarget(None);
		}
	}
}

/** Called while we have a new pending lock-on target */
function PlayTargetingBeepTimer()
{
	ClientPlayTargetingSound(LockTargetingSoundFirstPerson);
}

/** Plays a first person targeting beep sound (Local Player Only) */
unreliable client function ClientPlayTargetingSound(AkBaseSoundObject Sound)
{
	if( Sound != None && !bSuppressSounds )
	{
		if ( Instigator != None && Instigator.IsHumanControlled() )
		{
			PlaySoundBase(Sound, true);
		}
	}
}

/**
 * Tells the weapon to play a firing sound (uses CurrentFireMode)
 * Overridden to support the dart shooting sounds
 */
simulated function PlayFiringSound( byte FireModeNum )
{
	if ( !bPlayingLoopingFireSnd )
	{
		if( FireModeNum == ALTFIRE_FIREMODE )
		{
    		WeaponPlayFireSound(DartFireSnd.DefaultCue, DartFireSnd.FirstPersonCue);
        }
        else
        {
			Super.PlayFiringSound(FireModeNum);
			return;
		}
	}

	// Need to make noise if super isn't called
	MakeNoise(1.0,'PlayerFiring'); // AI
}

/** Override for 1st person healing dart anims */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	if ( FireModeNum == ALTFIRE_FIREMODE )
	{
		return (bUsingSights) ? ShootDartIronAnim : ShootDartAnim;
	}

	return Super.GetWeaponFireAnim(FireModeNum);
}

/*********************************************************************************************
 @name Optics UI
********************************************************************************************* */

/** Get our optics movie from the inventory once our InvManager is created */
reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
	local KFInventoryManager KFIM;

	super.ClientWeaponSet(bOptionalSet, bDoNotActivate);

	if (OpticsUI == none)
	{
		KFIM = KFInventoryManager(InvManager);
		if (KFIM != none)
		{
			//Create the screen's UI piece
			OpticsUI = KFGFxWorld_MedicOptics(KFIM.GetOpticsUIMovie(OpticsUIClass));
			// Initialize our displayed ammo count and healer charge
			StartHealRecharge();
		}
	}
}

function ItemRemovedFromInvManager()
{
	local KFInventoryManager KFIM;
	local KFWeap_MedicBase KFW;

	Super.ItemRemovedFromInvManager();

	if (OpticsUI != none)
	{
		KFIM = KFInventoryManager(InvManager);
		if (KFIM != none)
		{
			// @todo future implementation will have optics in base weapon class
			foreach KFIM.InventoryActors(class'KFWeap_MedicBase', KFW)
			{
				if( KFW != self && KFW.OpticsUI.Class == OpticsUI.class)
				{
					// A different weapon is still using this optics class
					return;
				}
			}

			//Create the screen's UI piece
			KFIM.RemoveOpticsUIMovie(OpticsUI.class);

			OpticsUI.Close();
			OpticsUI = none;
		}
	}
}

/** Unpause our optics movie and reinitialize our ammo when we equip the weapon */
simulated function AttachWeaponTo(SkeletalMeshComponent MeshCpnt, optional Name SocketName)
{
	super.AttachWeaponTo(MeshCpnt, SocketName);

	if (OpticsUI != none)
	{
		OpticsUI.SetPause(false);
		OpticsUI.ClearLockOn();
		UpdateOpticsUI(true);
		OpticsUI.SetShotPercentCost( HealAmmoCost );
	}
}

/** Pause the optics movie once we unequip the weapon so it's not playing in the background */
simulated function DetachWeapon()
{
	local Pawn OwnerPawn;
	super.DetachWeapon();

	OwnerPawn = Pawn(Owner);
	if( OwnerPawn != none && OwnerPawn.Weapon == self )
	{
		if (OpticsUI != none)
		{
			OpticsUI.SetPause();
		}
	}
}

/**
 * Update our displayed ammo count if it's changed
 */
simulated function UpdateOpticsUI(optional bool bForceUpdate)
{
	if (OpticsUI != none && OpticsUI.OpticsContainer != none)
	{
		if (AmmoCount[DEFAULT_FIREMODE] != StoredPrimaryAmmo || bForceUpdate)
		{
			StoredPrimaryAmmo = AmmoCount[DEFAULT_FIREMODE];
			OpticsUI.SetPrimaryAmmo(StoredPrimaryAmmo);
		}

		if (AmmoCount[ALTFIRE_FIREMODE] != StoredSecondaryAmmo || bForceUpdate)
		{
			StoredSecondaryAmmo = AmmoCount[ALTFIRE_FIREMODE];
			OpticsUI.SetHealerCharge(StoredSecondaryAmmo);
		}

		if(OpticsUI.MinPercentPerShot != HealAmmoCost)
		{
			OpticsUI.SetShotPercentCost( HealAmmoCost );
		}
	}
}

/*********************************************************************************************
 * state Inactive
 * This state is the default state.  It needs to make sure Zooming is reset when entering/leaving
 *********************************************************************************************/

auto simulated state Inactive
{
	simulated function BeginState(name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);

		if ( Role == ROLE_Authority )
		{
			bTargetLockingActive = false;
			AdjustLockTarget(None);
			ClearTimer(nameof(CheckTargetLock));
		}

		// force stop beep/lock
		PendingLockedTarget = None;
		ClearTimer(nameof(PlayTargetingBeepTimer));
	}

	simulated function EndState(Name NextStateName)
	{
		Super.EndState(NextStateName);

		if ( Role == ROLE_Authority )
		{
			bTargetLockingActive = true;
			SetTimer(LockCheckTime, true, nameof(CheckTargetLock));
		}
	}
}

/*********************************************************************************************
 * State WeaponSprinting
 * This is the default Sprinting State.  It's performed on both the client and the server.
 *********************************************************************************************/

/** Override AllowTargetLockOn */
simulated state WeaponSprinting
{
	ignores AllowTargetLockOn;
}

/*********************************************************************************************
 * Trader
 ********************************************************************************************/

/** Allows weapon to set its own trader stats (can set number of stats, names and values of stats) */
static simulated event SetTraderWeaponStats( out array<STraderItemWeaponStats> WeaponStats )
{
	super.SetTraderWeaponStats( WeaponStats );

	WeaponStats.Length = WeaponStats.Length + 1;
	WeaponStats[WeaponStats.Length-1].StatType = TWS_HealAmount;
	WeaponStats[WeaponStats.Length-1].StatValue = default.HealAmount;

	WeaponStats.Length = WeaponStats.Length + 1;
	WeaponStats[WeaponStats.Length-1].StatType = TWS_RechargeTime;
	WeaponStats[WeaponStats.Length-1].StatValue = default.HealFullRechargeSeconds;
}

defaultproperties
{
   HealingDartDamageType=Class'kfgamecontent.KFDT_Dart_Healing'
   HealAmount=20
   HealAmmoCost=50
   HealFullRechargeSeconds=15.000000
   HealImpactSoundPlayEvent=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Heal'
   HurtImpactSoundPlayEvent=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Hurt'
   DartFireSnd=(DefaultCue=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Fire_1P')
   HealDartShotWeakZedGrabCooldown=0.500000
   LockCheckTime=0.100000
   LockRange=50000.000000
   LockAcquireTime=0.200000
   LockTolerance=0.200000
   LockAim=0.980000
   LockTargetingSoundInterval=0.070000
   LockAcquiredSoundFirstPerson=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Alert_Locked_1P'
   LockLostSoundFirstPerson=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Alert_Lost_1P'
   LockTargetingSoundFirstPerson=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Alert_Locking_1P'
   OpticsUIClass=Class'KFGame.KFGFxWorld_MedicOptics'
   MagazineCapacity(1)=100
   bCanRefillSecondaryAmmo=False
   AimCorrectionSize=40.000000
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_MedicBase:MeleeHelper_0'
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=None
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_HealingDart'
   FireInterval(1)=0.175000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.000000
   Spread(1)=0.015000
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Dart_Toxic'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeapon:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeapon:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_MedicBase"
   ObjectArchetype=KFWeapon'KFGame.Default__KFWeapon'
}
