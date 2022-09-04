//=============================================================================
// KFTargetingWeaponComponent
//=============================================================================
// Actor that encapsulates the management and replication of targeting weapon info.
// Enables any weapon to be targeting.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFTargetingWeaponComponent extends Actor
	abstract;

/** Fire mode 0 is the default weapon firing. */
const DEFAULT_FIREMODE			= 0;
/** Fire mode 1 is the alternate weapon firing. */
const ALTFIRE_FIREMODE			= 1;

var KFWeapon KFW;

/*********************************************************************************************
 * @name Weapon lock on support
 **********************************************************************************************/

var byte TargetingEnabled[2];
var byte TargetZeds[2];
var byte TargetPlayers[2];

/** How far out should we be considering actors for a lock */
var float LockRange[2];

/** How long does the player need to target an actor to lock on to it*/
var float LockAcquireTime[2];

/** How long does the player need to target a large zed to lock on to it */
var float LockAcquireTime_Large[2];

/** How long does the player need to target a boss to lock on to it*/
var float LockAcquireTime_Boss[2];

/** How long does the player need to target a versus zed to lock on to it */
var float LockAcquireTime_Versus[2];

/** Once locked, how long can the player go without painting the object before they lose the lock */
var float LockTolerance[2];

/** What "target" is this weapon locked on to */
var KFPawn LockedTarget;

/** What hitzone is this weapon locked on to */
var int LockedHitZone;

/** What "target" is current pending to be locked on to */
var KFPawn PendingLockedTarget;

/** What hitzone is this weapon trying to lock on to */
var int PendingHitZone;

/** angle for locking for lock targets */
var float LockAim[2];

/** The frequency with which we play the Lock Targeting sound */
var float LockTargetingSoundInterval;

/** Sound Effects to play when Locking */
var AkBaseSoundObject LockAcquiredSoundFirstPerson;
var AkBaseSoundObject LockLostSoundFirstPerson;
var AkBaseSoundObject LockTargetingSoundFirstPerson;

/** How much time is left before pending lock-on can be acquired */
var float PendingLockAcquireTimeLeft;
/** How much time is left before pending lock-on is lost */
var float PendingLockTimeout;
/** How much time is left before lock-on is lost */
var float LockedOnTimeout;

/** Location on an enemy we're currently locked onto */
var vector LockedAimLocation;

var array<name> HumanTargetableBoneNames;

/** Vulnerable zones on an enemy we're currently locked onto */
var array<vector> TargetVulnerableLocations;

/** The frequency with which we replicate the targeting location to the server. Only matters for showing other players where we shot */
var float TargetLocationReplicationInterval;

var bool bTargetingUpdated;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	SetTickIsDisabled(true);
}

simulated function Init()
{
	KFW = KFWeapon(Owner);
	Instigator = KFW.Instigator;
}

simulated event Tick(float DeltaTime)
{
	super.Tick(DeltaTime);

	if (KFW == none)
	{
		KFW = KFWeapon(Owner);
		if (KFW == none)
		{
			return;
		}

		Instigator = KFW.Instigator;
	}

	if (Owner.bPendingDelete && !bPendingDelete)
	{
		// Owner has been destroyed
		Destroy();
		return;
	}

	if (Instigator != none && Instigator.Controller != none && Instigator.IsLocallyControlled())
    {
        CheckTargetLock(DeltaTime);
    }
}

/**
* This function checks to see if we are locked on a target
*/
simulated function CheckTargetLock(float DeltaTime)
{
	local Actor BestTarget;

	bTargetingUpdated = false;

	if ((Instigator == None) ||
		(Instigator.Controller == None) ||
		(KFW != Instigator.Weapon) ||
		KFPlayerController(Instigator.Controller) == none)
	{
		return;
	}

    TargetVulnerableLocations.Length = 0;

	if (!AllowTargetLockOn())
	{
		AdjustLockTarget(None);
		PendingLockedTarget = None;
		LockedAimLocation=vect(0,0,0);
		ClearTimer(nameof(PlayTargetingBeepTimer));
		return;
	}

	BestTarget = DetermineBestTarget();
	UpdateLockTargets(DeltaTime, BestTarget);
	SetupAimLock(DeltaTime);

	bTargetingUpdated = true;
}

/** returns true if lock-on is possible */
simulated function bool AllowTargetLockOn()
{
	return !Instigator.bNoWeaponFiring &&
			KFW.bUsingSights &&
			TargetingIsEnabled();
}

simulated function AdjustLockTarget(KFPawn NewLockTarget)
{
	if (LockedTarget == NewLockTarget)
	{
		// no need to update
		return;
	}

	if (NewLockTarget == None)
	{
		// Clear the lock
		if (LockedTarget != none)
		{
			LockedTarget = None;
			TargetVulnerableLocations.Length = 0;
			LockedAimLocation=vect(0,0,0);
			ServerSetTargetingLocation(LockedAimLocation);

			if (Instigator != None && Instigator.IsHumanControlled())
    		{
    			KFW.PlaySoundBase(LockLostSoundFirstPerson, true);
    		}
		}
	}
	else
	{
		// Set the lock
		LockedTarget = NewLockTarget;

		if (Instigator != None && Instigator.IsHumanControlled())
		{
			KFW.PlaySoundBase(LockAcquiredSoundFirstPerson, true);
		}
	}
}

simulated function PlayTargetingBeepTimer()
{
	if (Instigator != None && Instigator.IsHumanControlled() )
	{
		KFW.PlaySoundBase(LockTargetingSoundFirstPerson, true);
	}
}

simulated function Actor PickTarget(vector Aim, vector StartTrace)
{
	local float BestAim, BestDist;

	BestAim = GetLockAim();
	BestDist = 0.0;
	return KFPlayerController(Instigator.Controller).GetPickedAimAtTarget(
		BestAim, BestDist, Aim, StartTrace, GetLockRange(), False);
}

simulated function Actor DetermineBestTarget()
{
    local vector StartTrace;
    local rotator ViewRotation;
    local vector X,Y,Z;
    local Actor BestTarget, HitActor, TA;
	local vector EndTrace, Aim, HitLocation, HitNormal;
	local KFPlayerController KFPC;

    KFPC = KFPlayerController(Instigator.Controller);

	// Get the location and rotation that a shot would take
	//StartTrace = KFW.GetSafeStartTraceLocation();
	StartTrace = Instigator.GetWeaponStartTraceLocation();
    ViewRotation = Instigator.GetViewRotation();

	// Add in the free-aim rotation
	ViewRotation += KFPC.WeaponBufferRotation;

    GetAxes(ViewRotation, X, Y, Z);

	BestTarget = None;

	// Begin by tracing the shot to see if it hits anyone
	Aim = vector(ViewRotation);
	EndTrace = StartTrace + Aim * GetLockRange();
	HitActor = KFW.Trace(HitLocation, HitNormal, EndTrace, StartTrace, true,,, TRACEFLAG_Bullet);

	// Check for a hit
	if ((HitActor == None) || !CanLockOnTo(HitActor))
	{
		TA = PickTarget(Aim, StartTrace);
		if (TA != None && CanLockOnTo(TA))
		{
            // Trace to see if we hit a destructible, as the PickTarget code only traces against world geometry
            // @todo: Set up pick target to ignore pawns (as it should), but not trace through destructibles
            HitActor = Trace(HitLocation, HitNormal, TA.Location, StartTrace, true,,, TRACEFLAG_Bullet);

            // Make sure we didn't hit a destructible
            if (KFFracturedMeshActor(HitActor) != none || KFDestructibleActor(HitActor) != none)
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

	return BestTarget;
}

simulated function bool CanLockOnTo(Actor TA)
{
	Local KFPawn PawnTarget;

    PawnTarget = KFPawn(TA);

    // Make sure the pawn is legit, isn't dead, and isn't already at full health
    if ((TA == None) ||
		!TA.bProjTarget ||
		TA.bDeleteMe ||
		(PawnTarget == None) ||
        (TA == Instigator) ||
		(PawnTarget.Health <= 0) ||
        (!KFW.bUseAltFireMode && !KFW.HasAmmo(DEFAULT_FIREMODE)) ||
		(KFW.bUseAltFireMode && !KFW.HasAmmo(ALTFIRE_FIREMODE)))
	{
		return false;
	}

	return WorldInfo.GRI.OnSameTeam(Instigator,TA) == KFW.bUseAltFireMode;
}

simulated function UpdateLockTargets(float DeltaTime, Actor BestTarget)
{
	// clear lock if target is destroyed
	if (LockedTarget != None)
	{
		if (LockedTarget.bDeleteMe)
		{
			AdjustLockTarget(None);
		}
	}

	// If we have a "possible" target, note its time mark
	if (BestTarget != None)
	{
		if (BestTarget == LockedTarget)
		{
			UpdateTargetLocked();
		}
		// We have our best target, see if they should become our current target.
		// Check for a new Pending Lock
		else if (PendingLockedTarget != BestTarget)
		{
			UpdatePendingLockTarget(BestTarget);
		}

		AcquireLockTarget(DeltaTime, BestTarget);
	}
	// If we lost a target, attempt to invalidate the pending target
	else
	{
		TimeoutPendingLockTarget(DeltaTime);
	}

	TimeoutLockTarget(DeltaTime, BestTarget);
}

simulated function SetupAimLock(float DeltaTime)
{
	local vector Aim, StartTrace, BestZoneLocation;
	local int OldHitZone;

	Aim = vector(Instigator.GetViewRotation());
	//StartTrace = KFW.GetSafeStartTraceLocation();
	StartTrace = Instigator.GetWeaponStartTraceLocation();

	// Set the aiming location if we have a target lock
    if (LockedTarget != none)
	{
        OldHitZone = LockedHitZone;
        LockedHitZone = AddTargetingZones(LockedTarget, StartTrace, Aim, BestZoneLocation);
        if (OldHitZone != LockedHitZone)
        {
       		if (Instigator != None && Instigator.IsHumanControlled())
			{
				KFW.PlaySoundBase(LockTargetingSoundFirstPerson, true);
			}
        }

        TargetLocationReplicationInterval -= DeltaTime;

        if (TargetLocationReplicationInterval <= 0 || IsZero(LockedAimLocation))
        {
            TargetLocationReplicationInterval = default.TargetLocationReplicationInterval;
            ServerSetTargetingLocation(LockedAimLocation);
        }

        // Set the location where the shot will go
        LockedAimLocation = BestZoneLocation;
	}
	else
	{
        LockedHitZone = -1;
	}

	// Set the pending target location
    if (PendingLockedTarget != none)
	{
        PendingHitZone = AddTargetingZones(PendingLockedTarget, StartTrace, Aim, BestZoneLocation);
	}
	else
	{
	   PendingHitZone = -1;
	}
}

simulated function int AddTargetingZones(KFPawn KFPTarget, vector StartTrace, vector Aim, out vector BestZoneLocation)
{
	local KFPawn_Monster KFPM;
	local KFPawn_Human KFPH;

	KFPM = KFPawn_Monster(KFPTarget);
	if (CanTargetZeds() && KFPM != none)
	{
		return GetZedVulnerableLocations(KFPM, Aim, StartTrace, BestZoneLocation);
	}

	KFPH = KFPawn_Human(KFPTarget);
	if (CanTargetPlayers() && KFPH != none)
	{
		return GetHumanVulnerableLocations(KFPH, Aim, StartTrace, BestZoneLocation);
	}

	return -1;
}

simulated function int GetZedVulnerableLocations(
	KFPawn_Monster Zed, vector Aim, vector StartTrace, out vector BestZoneLocation)
{
	local vector ZoneLocation;
	local int BestZoneIndex;
	local float BestZoneDot;
	local vector DirToZone;
	local float DotToZone;
	local int i;

	// Get all the vulnerable hit zones
	for (i = 0; i < Zed.WeakSpotSocketNames.Length; i++)
	{
		Zed.Mesh.GetSocketWorldLocationAndRotation(Zed.WeakSpotSocketNames[i], ZoneLocation);

		if (!IsZero(ZoneLocation))
		{
			TargetVulnerableLocations.AddItem(ZoneLocation);

			// Figure out which target zone we are closest to
			DirToZone = ZoneLocation - StartTrace;
			DotToZone = Normal(Aim) dot Normal(DirToZone);

			if (DotToZone > BestZoneDot)
			{
				BestZoneIndex = TargetVulnerableLocations.Length - 1;
				BestZoneDot = DotToZone;

				// Set the location for the zone we are closest targeting
				BestZoneLocation = ZoneLocation;
			}
		}
	}

	return BestZoneIndex;
}

simulated function int GetHumanVulnerableLocations(
	KFPawn_Human Human, vector Aim, vector StartTrace, out vector BestZoneLocation)
{
	local vector ZoneLocation;
	local int BestZoneIndex;
	local float BestZoneDot;
	local vector DirToZone;
	local float DotToZone;
	local int i;

	// Get all the vulnerable hit zones
	for (i = 0; i < HumanTargetableBoneNames.Length; i++)
	{
		ZoneLocation = Human.Mesh.GetBoneLocation(HumanTargetableBoneNames[i]);
		if(!IsZero(ZoneLocation))
		{
			TargetVulnerableLocations.AddItem(ZoneLocation);

			// Figure out which target zone we are closest to
			DirToZone = ZoneLocation - StartTrace;
			DotToZone = Normal(Aim) dot Normal(DirToZone);

			if( DotToZone > BestZoneDot )
			{
				BestZoneIndex = TargetVulnerableLocations.Length - 1;
				BestZoneDot = DotToZone;

				// Set the location for the zone we are closest targeting
				BestZoneLocation = ZoneLocation;
			}
		}
	}

	return BestZoneIndex;
}

reliable server private function ServerSetTargetingLocation(vector NewTargetingLocation)
{
	LockedAimLocation = NewTargetingLocation;
}

simulated function TimeoutLockTarget(float DeltaTime, Actor BestTarget)
{
	// If the new target is not the same, attempt to invalidate current locked on target
	if (LockedTarget != None && BestTarget != LockedTarget)
	{
		LockedOnTimeout -= DeltaTime;
		if (LockedOnTimeout <= 0.f || !CanLockOnTo(LockedTarget))
		{
			AdjustLockTarget(None);
		}
	}
}

simulated function TimeoutPendingLockTarget(float DeltaTime)
{
	if (PendingLockedTarget != None)
	{
		PendingLockTimeout -= DeltaTime;
		if (PendingLockTimeout <= 0 || !CanLockOnTo(PendingLockedTarget))
		{
			PendingLockedTarget = None;
			ClearTimer(nameof(PlayTargetingBeepTimer));
		}
	}
}

simulated function AcquireLockTarget(float DeltaTime, Actor BestTarget)
{
	// Acquire new target if LockAcquireTime has passed
	if (PendingLockedTarget != None)
	{
		PendingLockAcquireTimeLeft -= DeltaTime;
		if (PendingLockedTarget == BestTarget && PendingLockAcquireTimeLeft <= 0)
		{
			AdjustLockTarget(PendingLockedTarget);
			PendingLockedTarget = None;
			ClearTimer(nameof(PlayTargetingBeepTimer));
		}
	}
}

simulated function UpdatePendingLockTarget(Actor BestTarget)
{
	local KFPawn_Monster KFP;
	local KFPawn_Human KFH;

	KFP = KFPawn_Monster(BestTarget);
	KFH = KFPawn_Human(BestTarget);
	if ((KFP != None && CanTargetZeds()) ||
		(KFH != None && CanTargetPlayers()))
	{
		PendingLockedTarget = KFPawn(BestTarget);
		PendingLockTimeout = GetLockTolerance();
		PendingLockAcquireTimeLeft = GetLockAcquireTime();

		if (KFP != none)
		{
			if (KFP.IsABoss())
			{
				PendingLockAcquireTimeLeft = GetLockAcquireTime_Boss();
			}
			else if (KFP.bVersusZed)
			{
				PendingLockAcquireTimeLeft = GetLockAcquireTime_Versus();
			}
			else if (KFP.IsLargeZed())
			{
				PendingLockAcquireTimeLeft = GetLockAcquireTime_Large();
			}
		}

		SetTimer(LockTargetingSoundInterval, true, nameof(PlayTargetingBeepTimer));

		// Play the "targeting" beep when we begin attempting to lock onto a target
		// that we haven't locked onto yet
		if (Instigator != None && Instigator.IsHumanControlled())
		{
    		PlaySoundBase(LockTargetingSoundFirstPerson, true);
		}
	}
}

simulated function UpdateTargetLocked()
{
	LockedOnTimeout = GetLockTolerance();
	if (PendingLockedTarget != none)
	{
    	ClearTimer(nameof(PlayTargetingBeepTimer));
    	PendingLockedTarget = None;
	}
}

/*********************************************************************************************
 * @name KFWeapon hooks
 **********************************************************************************************/

simulated function OnWeaponAttachedTo()
{
	SetTickIsDisabled(false);
}

simulated function OnWeaponDetached()
{
	SetTickIsDisabled(true);
}

/*********************************************************************************************
 * @name Getters
 **********************************************************************************************/

simulated function bool TargetingIsEnabled()
{
	return TargetingEnabled[KFW.bUseAltFireMode ? ALTFIRE_FIREMODE : DEFAULT_FIREMODE] == 1;
}

simulated function bool CanTargetZeds()
{
	return TargetZeds[KFW.bUseAltFireMode ? ALTFIRE_FIREMODE : DEFAULT_FIREMODE] == 1;
}

simulated function bool CanTargetPlayers()
{
	return TargetPlayers[KFW.bUseAltFireMode ? ALTFIRE_FIREMODE : DEFAULT_FIREMODE] == 1;
}

simulated function float GetLockRange()
{
	return LockRange[KFW.bUseAltFireMode ? ALTFIRE_FIREMODE : DEFAULT_FIREMODE];
}

simulated function float GetLockAim()
{
	return LockAim[KFW.bUseAltFireMode ? ALTFIRE_FIREMODE : DEFAULT_FIREMODE];
}

simulated function float GetLockAcquireTime()
{
	return LockAcquireTime[KFW.bUseAltFireMode ? ALTFIRE_FIREMODE : DEFAULT_FIREMODE];
}

simulated function float GetLockAcquireTime_Large()
{
	return LockAcquireTime_Large[KFW.bUseAltFireMode ? ALTFIRE_FIREMODE : DEFAULT_FIREMODE];
}

simulated function float GetLockAcquireTime_Boss()
{
	return LockAcquireTime_Boss[KFW.bUseAltFireMode ? ALTFIRE_FIREMODE : DEFAULT_FIREMODE];
}

simulated function float GetLockAcquireTime_Versus()
{
	return LockAcquireTime_Versus[KFW.bUseAltFireMode ? ALTFIRE_FIREMODE : DEFAULT_FIREMODE];
}

simulated function float GetLockTolerance()
{
	return LockTolerance[KFW.bUseAltFireMode ? ALTFIRE_FIREMODE : DEFAULT_FIREMODE];
}

defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=true
	bHidden=true
	bCollideActors=false
	bProjTarget=false
	bStatic=false
	bNoDelete=false
}
