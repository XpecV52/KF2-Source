//=============================================================================
// KFWeap_Rifle_RailGun
//=============================================================================
// A Horzine technology Rail Gun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_Rifle_RailGun extends KFWeap_ScopedBase;

var ScriptedTexture CanvasTexture;

/** Current length of the square scope texture. This is checked against before modifying the
    ScopeTextureSize in the scenario when InitFOV is called multiple times with the same values */
var int CurrentCanvasTextureSize;

/** Icon textures for lock on drawing */
var Texture2D LockedHitZoneIcon;
var Texture2D DefaultHitZoneIcon;
var LinearColor RedIconColor;
var LinearColor YellowIconColor;
var LinearColor BlueIconColor;

/*********************************************************************************************
 * @name Weapon lock on support
 **********************************************************************************************/

/** How far out should we be considering actors for a lock */
var(Locking) float		LockRange;

/** How long does the player need to target an actor to lock on to it*/
var(Locking) float		LockAcquireTime;

/** How long does the player need to target a large zed to lock on to it */
var(Locking) float		LockAcquireTime_Large;

/** How long does the player need to target a boss to lock on to it*/
var(Locking) float		LockAcquireTime_Boss;

/** How long does the player need to target a versus zed to lock on to it */
var(Locking) float		LockAcquireTime_Versus;

/** Once locked, how long can the player go without painting the object before they lose the lock */
var(Locking) float		LockTolerance;

/** When true, this weapon is locked on target */
var bool         		bLockedOnTarget;

/** What "target" is this weapon locked on to */
var KFPawn_Monster		LockedTarget;

/** What hitzone is this weapon locked on to */
var int                 LockedHitZone;

/** What "target" is current pending to be locked on to */
var KFPawn_Monster		PendingLockedTarget;

/** What hitzone is this weapon trying to lock on to */
var int                 PendingHitZone;

/** angle for locking for lock targets */
var(Locking) float 		LockAim;

/** angle of the maximum FOV extents of the scope for rending things onto the scope canvas */
var(Locking) float 		MaxScopeScreenDot;

/** The frequency with which we play the Lock Targeting sound */
var(Locking) float		LockTargetingSoundInterval;

/** Sound Effects to play when Locking */
var AkBaseSoundObject   LockAcquiredSoundFirstPerson;
//var AkBaseSoundObject   LockTargetingStopEvent;
//var AkBaseSoundObject   LockTargetingStopEventFirstPerson;
var AkBaseSoundObject   LockLostSoundFirstPerson;
var AkBaseSoundObject   LockTargetingSoundFirstPerson;

/** How much time is left before pending lock-on can be acquired */
var float PendingLockAcquireTimeLeft;
/** How much time is left before pending lock-on is lost */
var float PendingLockTimeout;
/** How much time is left before lock-on is lost */
var float LockedOnTimeout;

/** Location on an enemy we're currently locked onto */
var vector LockedAimLocation;

/** Vulnerable zones on an enemy we're currently locked onto */
var array<vector> TargetVulnerableLocations;

/** The frequency with which we replicate the targeting location to the server. Only matters for showing other players where we shot */
var float         TargetLocationReplicationInterval;

/*********************************************************************************************
 * @name Ambient sound
 ********************************************************************************************* */
/** Pilot light sound play event */
var AkEvent                         AmbientSoundPlayEvent;

/** Pilot light sound stop event */
var AkEvent	                        AmbientSoundStopEvent;

/** Socket to attach the ambient sound to. */
var() name AmbientSoundSocketName;

/**
 * Initialize the FOV settings for this weapon, adjusting for aspect ratio
 * @param SizeX the X resolution of the screen
 * @param SizeY the Y resolution of the screen
 * @param DefaultPlayerFOV the default player FOV of the player holding this weapon
 */
simulated function InitFOV(float SizeX, float SizeY, float DefaultPlayerFOV)
{
    local int NewScopeTextureSize;

    super.InitFOV(SizeX, SizeY, DefaultPlayerFOV);

    NewScopeTextureSize = int(ScopeTextureScale*SizeX);

    if(NewScopeTextureSize > MaxSceneCaptureSize)
        NewScopeTextureSize = MaxSceneCaptureSize;

    if( CurrentCanvasTextureSize != NewScopeTextureSize )
    {
        CanvasTexture =  ScriptedTexture(class'ScriptedTexture'.static.Create(NewScopeTextureSize, NewScopeTextureSize, PF_FloatRGB, MakeLinearColor(0,0,0,0)));

        CanvasTexture.Render = OnRender;
        CanvasTexture.bNeedsTwoCopies = true;

        if( ScopeLenseMIC != none )
        {
            ScopeLenseMIC.SetTextureParameterValue('ScopeText', CanvasTexture);
        }
        CurrentCanvasTextureSize = NewScopeTextureSize;
    }
}

/**
 * Set parameters for the weapon once replication is complete (works in Standalone as well)
 */
reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
	Super.ClientWeaponSet(bOptionalSet);

    // Only want to spawn sniper lenses on human players, but when PostBeginPlay
    // gets called Instigator isn't valid yet. So using NetMode == NM_Client,
    // since weapons should only exist on owning human clients with that netmode
    if( Instigator != none && Instigator.IsLocallyControlled() && Instigator.IsHumanControlled() )
    {
        if( ScopeLenseMIC != none )
        {
            ScopeLenseMIC.SetTextureParameterValue('ScopeText', CanvasTexture);
        }
    }
}

simulated function StartFire(byte FireModeNum)
{
	// Attempt auto-reload
	if ( FireModeNum == ALTFIRE_FIREMODE )
	{
		`log("Nope, use the default you dirty cheater :)");
		FiremodeNum = DEFAULT_FIREMODE;
	}

	Super.StartFire(FireModeNum);
}

/** Return true if this weapon should play the fire last animation for this shoot animation */
simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
//    if( SpareAmmoCount[GetAmmoType(FireModeNum)] == 0 )
//    {
//        return true;
//    }

    return false;
}

/** Returns animation to play based on reload type and status */
simulated function name GetReloadAnimName( bool bTacticalReload )
{
	if ( AmmoCount[0] > 0 )
	{
		// Disable half-reloads for now.  This can happen if server gets out
		// of sync, but choosing the wrong animation will just make it worse!
		`warn("Railgun reloading with non-empty mag");
	}

	return bTacticalReload ? ReloadEmptyMagEliteAnim : ReloadEmptyMagAnim;
}

/*********************************************************************************************
 * @name Ambient sound
 **********************************************************************************************/
/**
 * Starts playing looping ambient sound
 */
simulated function StartAmbientSound()
{
	if( Instigator != none && Instigator.IsLocallyControlled() && Instigator.IsFirstPerson() )
	{
        PostAkEventOnBone(AmbientSoundPlayEvent, AmbientSoundSocketName, false, true);
    }
}

/**
 * Stops playing looping ambient sound
 */
simulated function StopAmbientSound()
{
    PostAkEventOnBone(AmbientSoundStopEvent, AmbientSoundSocketName, false, true);
}

/**
 * Detach weapon from skeletal mesh
 *
 * @param	SkeletalMeshComponent weapon is attached to.
 */
simulated function DetachWeapon()
{
    StopAmbientSound();
    Super.DetachWeapon();
}

/*********************************************************************************************
 * @name Weapon lock on and targeting
 **********************************************************************************************/

/**
 * Tick the weapon (used for simple updates)
 *
 * @param	DeltaTime Elapsed time.
 */
simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);

    if( Instigator != none && Instigator.Controller != none && Instigator.IsLocallyControlled() )
    {
        CheckTargetLock(DeltaTime);
    }
}

/**
* Given an potential target TA determine if we can lock on to it.  By default only allow locking on
* to pawns.
*/
simulated function bool CanLockOnTo(Actor TA)
{
	Local KFPawn PawnTarget;

    PawnTarget = KFPawn(TA);

    // Make sure the pawn is legit, isn't dead, and isn't already at full health
    if ( (TA == None) || !TA.bProjTarget || TA.bDeleteMe || (PawnTarget == None) ||
         (TA == Instigator) || (PawnTarget.Health <= 0)  ||
         !HasAmmo( DEFAULT_FIREMODE ) )
	{
		return false;
	}

	// Make sure and only lock onto players on the same team
    return !WorldInfo.GRI.OnSameTeam(Instigator,TA);
}

/**
 *  This function is used to adjust the LockTarget.
 */
simulated function AdjustLockTarget(KFPawn_Monster NewLockTarget )
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
			TargetVulnerableLocations.Length = 0;
			LockedAimLocation=vect(0,0,0);
			ServerSetTargetingLocation(LockedAimLocation);

//			if (OpticsUI != none && PendingLockedTarget == none)
//			{
//				// Optics UI only exists for local players
//				OpticsUI.ClearLockOn();
//			}

			if ( Instigator != None && Instigator.IsHumanControlled() )
    		{
    			PlaySoundBase(LockLostSoundFirstPerson, true);
    		}
		}
	}
	else
	{
		// Set the lock
		bLockedOnTarget = true;
		LockedTarget = NewLockTarget;

//		if (OpticsUI != none)
//		{
//			// Optics UI only exists for local players
//			OpticsUI.LockedOn();
//		}

		if ( Instigator != None && Instigator.IsHumanControlled() )
		{
			PlaySoundBase(LockAcquiredSoundFirstPerson, true);
		}
	}
}

/** returns true if lock-on is possible */
simulated function bool AllowTargetLockOn()
{
	return !Instigator.bNoWeaponFiring && bUsingSights && !bUseAltFireMode;
}

/**
* This function checks to see if we are locked on a target
*/
simulated function CheckTargetLock(float DeltaTime)
{
    local KFPawn_Monster KFP;
    local vector StartTrace;
    local rotator ViewRotation;
    local vector X,Y,Z;
    local Actor BestTarget, HitActor, TA;
	local vector EndTrace, Aim, HitLocation, HitNormal;
	local float BestAim, BestDist;
	local vector BestZoneLocation;
	local KFPlayerController KFPC;
	local int OldHitZone;

    KFPC = KFPlayerController(Instigator.Controller);

	if ( (Instigator == None) || (Instigator.Controller == None) || (self != Instigator.Weapon)
        || KFPC == none )
	{
		return;
	}

    TargetVulnerableLocations.Length = 0;

	if ( !AllowTargetLockOn() )
	{
		AdjustLockTarget(None);
		PendingLockedTarget = None;
		LockedAimLocation=vect(0,0,0);
		ClearTimer(nameof(PlayTargetingBeepTimer));
		return;
	}

    // Need to update the scope targeting boxes if we're aiming
    if( bUsingSights )
    {
        CanvasTexture.bNeedsUpdate = true;
    }

	// clear lock if target is destroyed
	if ( LockedTarget != None )
	{
		if ( LockedTarget.bDeleteMe )
		{
			AdjustLockTarget(None);
		}
	}

	// Get the location and rotation that a shot would take
	StartTrace = GetSafeStartTraceLocation();
    ViewRotation = Instigator.GetViewRotation();

	// Add in the free-aim rotation
	ViewRotation += KFPC.WeaponBufferRotation;

    GetAxes(ViewRotation, X, Y, Z);

	BestTarget = None;

	// Begin by tracing the shot to see if it hits anyone
	Aim = vector(ViewRotation);
	EndTrace = StartTrace + Aim * LockRange;
	HitActor = Trace(HitLocation, HitNormal, EndTrace, StartTrace, true,,, TRACEFLAG_Bullet);

	// Check for a hit
	if ( (HitActor == None) || !CanLockOnTo(HitActor) )
	{
		// We didn't hit a valid target, have the controller attempt to pick a good target
		BestAim = LockAim;
		BestDist = 0.0;
		TA = KFPC.GetPickedAimAtTarget(BestAim, BestDist, Aim, StartTrace, LockRange, False);

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

    KFP = KFPawn_Monster(BestTarget);

	// If we have a "possible" target, note its time mark
	if ( BestTarget != None && KFP != none )
	{
		if ( BestTarget == LockedTarget )
		{
			LockedOnTimeout = LockTolerance;
			if( PendingLockedTarget != none )
			{
    			ClearTimer(nameof(PlayTargetingBeepTimer));
    			PendingLockedTarget = None;
			}
		}
		// We have our best target, see if they should become our current target.
		// Check for a new Pending Lock
		else if (PendingLockedTarget != BestTarget)
		{
			PendingLockedTarget = KFP; // BestTarget
			PendingLockTimeout = LockTolerance;

			if(KFP.IsABoss())
			{
				PendingLockAcquireTimeLeft	= LockAcquireTime_Boss;
			}
			else if(KFP.bVersusZed)
			{
				PendingLockAcquireTimeLeft	= LockAcquireTime_Versus;
			}
			else
			{
				if(KFP.IsLargeZed())
				{
					PendingLockAcquireTimeLeft	= LockAcquireTime_Large;
				}
				else
				{
					PendingLockAcquireTimeLeft	= LockAcquireTime;
				}
			}

			SetTimer(LockTargetingSoundInterval, true, nameof(PlayTargetingBeepTimer));

//			if (OpticsUI != none)
//			{
//				// Optics UI only exists for local players
//				OpticsUI.StartLockOn();
//			}

			// Play the "targeting" beep when we begin attempting to lock onto a target
			// that we haven't locked onto yet
    		if ( Instigator != None && Instigator.IsHumanControlled() )
    		{
    			PlaySoundBase(LockTargetingSoundFirstPerson, true);
    		}
		}
		// Acquire new target if LockAcquireTime has passed
		if ( PendingLockedTarget != None )
		{
			PendingLockAcquireTimeLeft -= DeltaTime;
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
		PendingLockTimeout -= DeltaTime;
		if ( PendingLockTimeout <= 0 || !CanLockOnTo(PendingLockedTarget) )
		{
			PendingLockedTarget = None;
//			if (OpticsUI != none)
//			{
//				// Optics UI only exists for local players
//				OpticsUI.ClearLockOn();
//			}
			ClearTimer(nameof(PlayTargetingBeepTimer));
		}
	}

	// If the new target is not the same, attempt to invalidate current locked on target
	if ( LockedTarget != None && BestTarget != LockedTarget )
	{
		LockedOnTimeout -= DeltaTime;
		if ( LockedOnTimeout <= 0.f || !CanLockOnTo(LockedTarget) )
		{
			AdjustLockTarget(None);
		}
	}

	// Set the aiming location if we have a target lock
    if ( LockedTarget != none )
	{
        OldHitZone = LockedHitZone;
        LockedHitZone = AddTargetingZones(LockedTarget, StartTrace, Aim, BestZoneLocation);
        if( OldHitZone != LockedHitZone )
        {
       		if ( Instigator != None && Instigator.IsHumanControlled() )
			{
				PlaySoundBase(LockTargetingSoundFirstPerson, true);
			}
        }

        TargetLocationReplicationInterval -= DeltaTime;

        if( TargetLocationReplicationInterval <= 0 || IsZero(LockedAimLocation) )
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
    if ( PendingLockedTarget != none )
	{
        PendingHitZone = AddTargetingZones(PendingLockedTarget, StartTrace, Aim, BestZoneLocation);
	}
	else
	{
	   PendingHitZone = -1;
	}
}

/**
 * Handles calling the zoom in function on the server
 *
 * @param bAnimateTransition whether or not to animate this zoom transition
 */
reliable server private function ServerSetTargetingLocation(vector NewTargetingLocation)
{
	LockedAimLocation = NewTargetingLocation;
}

/**
* Add targeting locations to the targeting array
*/
simulated function int AddTargetingZones(KFPawn_Monster KFPTarget, vector StartTrace, vector Aim, out vector BestZoneLocation)
{
	local vector ZoneLocation;
	local int BestZoneIndex;
	local float BestZoneDot;
	local vector DirToZone;
	local float DotToZone;
	local int i;

	BestZoneIndex = -1;

	// Get all the vulnerable hit zones
	for (i = 0; i < KFPTarget.WeakSpotSocketNames.Length; i++)
	{
		KFPTarget.Mesh.GetSocketWorldLocationAndRotation(KFPTarget.WeakSpotSocketNames[i], ZoneLocation);

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

/** Called while we have a new pending lock-on target */
simulated function PlayTargetingBeepTimer()
{
	if ( Instigator != None && Instigator.IsHumanControlled() )
	{
		PlaySoundBase(LockTargetingSoundFirstPerson, true);
	}
}

/** Event called when weapon actor is destroyed */
simulated event Destroyed()
{
    if( CanvasTexture != none )
    {
        CanvasTexture = none;
    }

    StopAmbientSound();

	super.Destroyed();
}

/**
 * Performs an 'Instant Hit' shot.
 * Network: Local Player and Server
 * Overriden to support the aim targeting of the railgun
 */
simulated function InstantFireClient()
{
	local vector			StartTrace, EndTrace;
	local rotator			AimRot;
	local Array<ImpactInfo>	ImpactList;
	local int				Idx;
	local ImpactInfo		RealImpact;
	local float				CurPenetrationValue;

	// see Controller AimHelpDot() / AimingHelp()
	bInstantHit = true;

	// define range to use for CalcWeaponFire()
	StartTrace = GetSafeStartTraceLocation();

	if( !IsZero(LockedAimLocation) )
	{
    	AimRot = rotator(Normal(LockedAimLocation - StartTrace));
    	EndTrace = StartTrace + vector(AimRot) * GetTraceRange();
	}
	else
	{
    	AimRot = GetAdjustedAim(StartTrace);
    	EndTrace = StartTrace + vector(AimRot) * GetTraceRange();
	}

	bInstantHit = false;

    // Initialize penetration power
    PenetrationPowerRemaining = GetInitialPenetrationPower(CurrentFireMode);
    CurPenetrationValue = PenetrationPowerRemaining;

	// Perform shot
	RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);

	// Set flash location to trigger client side effects.  Bypass Weapon.SetFlashLocation since
	// that function is not marked as simulated and we want instant client feedback.
	// ProjectileFire/IncrementFlashCount has the right idea:
	//	1) Call IncrementFlashCount on Server & Local
	//	2) Replicate FlashCount if ( !bNetOwner )
	//	3) Call WeaponFired() once on local player
	if( Instigator != None )
	{
		// If we have penetration, set the hitlocation to the last thing we hit
        if( ImpactList.Length > 0 )
		{
            Instigator.SetFlashLocation( Self, CurrentFireMode, ImpactList[ImpactList.Length - 1].HitLocation );
        }
        else
        {
            Instigator.SetFlashLocation( Self, CurrentFireMode, RealImpact.HitLocation );
        }
	}

	// local player only for clientside hit detection
	if ( Instigator != None && Instigator.IsLocallyControlled() )
	{
		// allow weapon to add extra bullet impacts (useful for shotguns)
		InstantFireClient_AddImpacts(StartTrace, AimRot, ImpactList);

		for (Idx = 0; Idx < ImpactList.Length; Idx++)
		{
			ProcessInstantHitEx(CurrentFireMode, ImpactList[Idx],, CurPenetrationValue, Idx);
		}

		if ( Instigator.Role < ROLE_Authority )
		{
            SendClientImpactList(CurrentFireMode, ImpactList);
		}
	}
}

/*********************************************************************************************
 * @name Targeting HUD
 **********************************************************************************************/

/** Handle drawing items on the scope ScriptedTexture */
simulated function OnRender(Canvas C)
{
    local int i;

    if( !bUsingSights )
    {
       return;
    }

    // Draw the targeting locations on the scope
    for (i = 0; i < TargetVulnerableLocations.Length; i++)
    {
        if( !IsZero(TargetVulnerableLocations[i]) )
        {
            DrawTargetingIcon( C, i );
        }
    }

    CanvasTexture.bNeedsUpdate = true;
}

/**
 * @brief Draws an icon when human players are hidden but in the field of view
 *
 * @param PRI Player's PlayerReplicationInfo
 * @param IconWorldLocation The "player's" location in the world
 */
simulated function DrawTargetingIcon( Canvas Canvas, int index )
{
    local vector WorldPos;
    local float IconSize, IconScale;
    local vector2d ScreenPos;

    // Project world pos to canvas
    WorldPos = TargetVulnerableLocations[index];
    ScreenPos = WorldToCanvas(Canvas, WorldPos);

    // calculate scale based on resolution and distance
    IconScale = FMin(float(Canvas.SizeX) / 1024.f, 1.f);
	// Scale down up to 40 meters away, with a clamp at 20% size
    IconScale *= FClamp(1.f - VSize(WorldPos - Instigator.Location) / 4000.f, 0.2f, 1.f);

    // Apply size scale
    IconSize = 300.f * IconScale;
    ScreenPos.X -= IconSize / 2.f;
    ScreenPos.Y -= IconSize / 2.f;

    // Off-screen check
    if( ScreenPos.X < 0 || ScreenPos.X > Canvas.SizeX || ScreenPos.Y < 0 || ScreenPos.Y > Canvas.SizeY )
    {
        return;
    }

    Canvas.SetPos( ScreenPos.X, ScreenPos.Y );

    // Pick the color of the targeting box to draw
    if( LockedHitZone >= 0 && index == LockedHitZone )
    {
        Canvas.DrawTile( LockedHitZoneIcon, IconSize, IconSize, 0, 0, LockedHitZoneIcon.SizeX, LockedHitZoneIcon.SizeY, RedIconColor);
    }
    else if( PendingHitZone >= 0 && index == PendingHitZone )
    {
        Canvas.DrawTile( LockedHitZoneIcon, IconSize, IconSize, 0, 0, LockedHitZoneIcon.SizeX, LockedHitZoneIcon.SizeY, YellowIconColor);
    }
    else
    {
        Canvas.DrawTile( DefaultHitZoneIcon, IconSize, IconSize, 0, 0, DefaultHitZoneIcon.SizeX, DefaultHitZoneIcon.SizeY, BlueIconColor);
    }
}

/**
 * Canvas.Project() doesn't work because our Canvas doesn't have a FSceneView, so
 * we have to get the transforms out of the scene capture actor... or in this
 * case we can make it work with angles
 */
simulated function vector2d WorldToCanvas( Canvas Canvas, vector WorldPoint)
{
	local vector ViewLoc, ViewDir;
	local rotator ViewRot;
	local vector X,Y,Z;
	local vector2d ScreenPoint;
	local float DotToZedUpDown, DotToZedLeftRight, UpDownScale, LeftRightScale;

	Instigator.Controller.GetPlayerViewPoint(ViewLoc, ViewRot);
	GetAxes(ViewRot, X, Y, Z);
	ViewDir = Normal(WorldPoint - ViewLoc);

    DotToZedUpDown = Z dot ViewDir;
    DotToZedLeftRight = Y dot ViewDir;

    UpDownScale = DotToZedUpDown/MaxScopeScreenDot;
    LeftRightScale = DotToZedLeftRight/MaxScopeScreenDot;

    ScreenPoint.X = CanvasTexture.SizeX * (0.5 + LeftRightScale * 0.5);
    ScreenPoint.Y = CanvasTexture.SizeY * (0.5 - UpDownScale * 0.5);

	return ScreenPoint;
}

/*
{
	local vector V;

	// transform by viewProjectionMatrix
	V = TransformVector(SceneCapture.ViewMatrix * SceneCapture.ProjMatrix, WorldPoint);

	// apply clip "matrix"
	V.X = (Canvas.ClipX/2.f) + (V.X*(Canvas.ClipX/2.f));
	V.Y *= -1.f;
	V.Y = (Canvas.ClipY/2.f) + (V.Y*(Canvas.ClipY/2.f));

	return V;
}
*/

/*********************************************************************************************
 * state Inactive
 * This state is the default state.  It needs to make sure Zooming is reset when entering/leaving
 *********************************************************************************************/

auto simulated state Inactive
{
	simulated function BeginState(name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);
		StopAmbientSound();
		AdjustLockTarget(None);
		ClearTimer(nameof(PlayTargetingBeepTimer));
	}
}

/*********************************************************************************************
 * State WeaponEquipping
 * The Weapon is in this state while transitioning from Inactive to Active state.
 * Typically, the weapon will remain in this state while its selection animation is being played.
 * While in this state, the weapon cannot be fired.
*********************************************************************************************/

simulated state WeaponEquipping
{
	simulated function BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
        StartAmbientSound();
	}
}

/*********************************************************************************************
 * State WeaponPuttingDown
 * Putting down weapon in favor of a new one.
 * Weapon is transitioning to the Inactive state.
*********************************************************************************************/

simulated state WeaponPuttingDown
{
	simulated event BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
		StopAmbientSound();
	}
}

/*********************************************************************************************
* State WeaponAbortEquip
* Special PuttingDown state used when WeaponEquipping is interrupted.  Must come after
* WeaponPuttingDown definition or this willextend the super version.
*********************************************************************************************/

simulated state WeaponAbortEquip
{
	simulated event BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
		StopAmbientSound();
	}
}

defaultproperties
{
	// Inventory / Grouping
	InventorySize=9 //10
	GroupPriority=100
	WeaponSelectTexture=Texture2D'WEP_UI_RailGun_TEX.UI_WeaponSelect_Railgun'
   	AssociatedPerkClasses(0)=class'KFPerk_Sharpshooter'

   	// 2D scene capture
	Begin Object Name=SceneCapture2DComponent0
	   //TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
	   FieldOfView=23.0 // "1.5X" = 35.0(our real world FOV determinant)/1.5
	End Object

    ScopedSensitivityMod=16.0

	ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_RailGun_MAT.Wep_1stP_RailGun_Lens_MIC'

    // FOV
	MeshIronSightFOV=27
    PlayerIronSightFOV=70

	// Depth of field
	DOF_BlendInSpeed=3.0
	DOF_FG_FocalRadius=0//70
	DOF_FG_MaxNearBlurSize=3.5

	// Content
	PackageKey="RailGun"
	FirstPersonMeshName="WEP_1P_RailGun_MESH.WEP_1stP_RailGun_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_RailGun_ANIM.WEP_1P_RailGun_ANIM"
	PickupMeshName="wep_3p_railgun_mesh.Wep_3rdP_RailGun_Pickup"
	AttachmentArchetypeName="WEP_RailGun_ARCH.Wep_RailGun_3P_Updated"
	MuzzleFlashTemplateName="WEP_RailGun_ARCH.Wep_RailGun_MuzzleFlash"

	// Ammo
	MagazineCapacity[0]=1
	SpareAmmoCapacity[0]=32 //20
	InitialSpareMags[0]=6
	bCanBeReloaded=true
	bReloadFromMagazine=true
	AmmoPickupScale[0]=3.0

	// Zooming/Position
	PlayerViewOffset=(X=3.0,Y=7,Z=-2)
	IronSightPosition=(X=-0.25,Y=0,Z=0) // any further back along X and the scope clips through the camera during firing

	// AI warning system
	bWarnAIWhenAiming=true
	AimWarningDelay=(X=0.4f, Y=0.8f)
	AimWarningCooldown=0.0f

	// Recoil
	maxRecoilPitch=600
	minRecoilPitch=450
	maxRecoilYaw=250
	minRecoilYaw=-250
	RecoilRate=0.09
	RecoilBlendOutRatio=1.1
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=1500
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65485
	RecoilViewRotationScale=0.6
	FallingRecoilModifier=1.5
	HippedRecoilModifier=2.33333

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'UI_SecondaryAmmo_TEX.UI_FireModeSelect_AutoTarget'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_RailGun'
	InstantHitDamage(DEFAULT_FIREMODE)=280  //375
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_RailGun'
	FireInterval(DEFAULT_FIREMODE)=0.1 //0.4
	PenetrationPower(DEFAULT_FIREMODE)=10.0
	Spread(DEFAULT_FIREMODE)=0.005
	FireOffset=(X=30,Y=3.0,Z=-2.5)
	ForceReloadTimeOnEmpty=0.5

	IronSightsSpreadMod=0.01

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'UI_SecondaryAmmo_TEX.UI_FireModeSelect_ManualTarget'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=none
	InstantHitDamage(ALTFIRE_FIREMODE)=560 //750
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_RailGun'
	FireInterval(ALTFIRE_FIREMODE)=0.1 //0.4
	PenetrationPower(ALTFIRE_FIREMODE)=10.0
	Spread(ALTFIRE_FIREMODE)=0.005


	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_RailGun'
	InstantHitDamage(BASH_FIREMODE)=30

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_Fire_1P')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_DryFire'
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_Fire_1P')
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	// Custom animations
	FireSightedAnims=(Shoot_Iron, Shoot_Iron2, Shoot_Iron3)
    BonesToLockOnEmpty=(RW_TopLeft_RadShield1,RW_TopRight_RadShield1,RW_TopLeft_RadShield2,RW_TopRight_RadShield2,RW_TopLeft_RadShield3,RW_TopRight_RadShield3,RW_TopLeft_RadShield4,RW_TopRight_RadShield4,RW_TopLeft_RadShield5,RW_TopRight_RadShield5,RW_TopLeft_RadShield6,RW_TopRight_RadShield6,RW_BottomLeft_RadShield2,RW_BottomRight_RadShield2,RW_BottomLeft_RadShield3,RW_BottomRight_RadShield3,RW_BottomLeft_RadShield4,RW_BottomRight_RadShield4,RW_BottomLeft_RadShield5,RW_BottomRight_RadShield5,RW_BottomLeft_RadShield6,RW_BottomRight_RadShield6,RW_BottomLeft_RadShield1,RW_BottomRight_RadShield1,RW_Bullets1,RW_AcceleratorMagnetrons,RW_Bolt)

    MaxScopeScreenDot=0.2

	//Ambient Sounds
    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Railgun.Stop_Railgun_Loop'
	AmbientSoundSocketName=AmbientSound

    // Lock on sounds
    LockTargetingSoundInterval=0.09
	LockAcquiredSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Locked'
	LockLostSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Lost'
	LockTargetingSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Locking'

    // Lock on icons
    LockedHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Yellow_Red_Target'
    DefaultHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Blue_Target'
    RedIconColor=(R=1.f, G=0.f, B=0.f)
    YellowIconColor=(R=1.f, G=1.f, B=0.f)
    BlueIconColor=(R=0.25, G=0.6f, B=1.f)

	// Lock On Functionality
    LockRange=200000
	LockAim=0.995
	LockAcquireTime=0.35
	LockAcquireTime_Large=0.6
	LockAcquireTime_Boss=1.1
	LockAcquireTime_Versus=1.1
	LockTolerance=0.2
	TargetLocationReplicationInterval=0.016

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'

	// Weapon Upgrade stat boosts
	//WeaponUpgrades[1]=(IncrementDamage=1.25f,IncrementWeight=1)

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.25f), (Stat=EWUS_Damage1, Scale=1.25f), (Stat=EWUS_Weight, Add=1)))
}