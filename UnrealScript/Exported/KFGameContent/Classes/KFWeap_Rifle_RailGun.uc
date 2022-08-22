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

/** How long to wait after firing to force reload */
var()			float		ForceReloadTime;

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


/**
 * PlayFireEffects Is the root function that handles all of the effects associated with
 * a weapon.  This function creates the 1st person effects.  It should only be called
 * on a locally controlled player.
 */
simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
{
    Super.PlayFireEffects( FireModeNum, HitLocation );

	if( Instigator != none && Instigator.IsLocallyControlled() && AmmoCount[0] == 0 )
	{
        SetTimer(ForceReloadTime, false, nameof( ForceReload ) );
	}
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
		WarnInternal("Railgun reloading with non-empty mag");
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
         (TA == Instigator) || (PawnTarget.Health <= 0) || PawnTarget.bIsCloaking ||
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
   ForceReloadTime=0.500000
   LockedHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Yellow_Red_Target'
   DefaultHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Blue_Target'
   RedIconColor=(R=1.000000,G=0.000000,B=0.000000,A=1.000000)
   YellowIconColor=(R=1.000000,G=1.000000,B=0.000000,A=1.000000)
   BlueIconColor=(R=0.250000,G=0.600000,B=1.000000,A=1.000000)
   LockRange=200000.000000
   LockAcquireTime=0.350000
   LockAcquireTime_Large=0.600000
   LockAcquireTime_Boss=1.100000
   LockAcquireTime_Versus=1.100000
   LockTolerance=0.200000
   LockAim=0.995000
   MaxScopeScreenDot=0.200000
   LockTargetingSoundInterval=0.090000
   LockAcquiredSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Locked'
   LockLostSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Lost'
   LockTargetingSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Locking'
   TargetLocationReplicationInterval=0.016000
   AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Loop'
   AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Railgun.Stop_Railgun_Loop'
   AmbientSoundSocketName="AmbientSound"
   Begin Object Class=TWSceneCapture2DDPGComponent Name=SceneCapture2DComponent0 Archetype=TWSceneCapture2DDPGComponent'KFGame.Default__KFWeap_ScopedBase:SceneCapture2DComponent0'
      bRenderForegroundDPG=False
      FieldOfView=23.000000
      NearPlane=10.000000
      FarPlane=0.000000
      bUpdateMatrices=False
      bEnabled=False
      bEnableFog=True
      ViewMode=SceneCapView_Lit
      FrameRate=60.000000
      Name="SceneCapture2DComponent0"
      ObjectArchetype=TWSceneCapture2DDPGComponent'KFGame.Default__KFWeap_ScopedBase:SceneCapture2DComponent0'
   End Object
   SceneCapture=SceneCapture2DComponent0
   ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_RailGun_MAT.Wep_1stP_RailGun_Lens_MIC'
   ScopedSensitivityMod=16.000000
   FireModeIconPaths(0)=Texture2D'UI_SecondaryAmmo_TEX.UI_FireModeSelect_AutoTarget'
   FireModeIconPaths(1)=Texture2D'UI_SecondaryAmmo_TEX.UI_FireModeSelect_ManualTarget'
   InventorySize=10
   MagazineCapacity(0)=1
   bHasIronSights=True
   bWarnAIWhenAiming=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   PenetrationPower(0)=10.000000
   PenetrationPower(1)=10.000000
   MeshIronSightFOV=27.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=-0.250000,Y=0.000000,Z=0.000000)
   DOF_BlendInSpeed=3.000000
   DOF_FG_FocalRadius=0.000000
   DOF_FG_MaxNearBlurSize=3.500000
   AimWarningDelay=(X=0.400000,Y=0.800000)
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'WEP_UI_RailGun_TEX.UI_WeaponSelect_Railgun'
   SpareAmmoCapacity(0)=20
   InitialSpareMags(0)=6
   AmmoPickupScale(0)=3.000000
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(0)="RW_TopLeft_RadShield1"
   BonesToLockOnEmpty(1)="RW_TopRight_RadShield1"
   BonesToLockOnEmpty(2)="RW_TopLeft_RadShield2"
   BonesToLockOnEmpty(3)="RW_TopRight_RadShield2"
   BonesToLockOnEmpty(4)="RW_TopLeft_RadShield3"
   BonesToLockOnEmpty(5)="RW_TopRight_RadShield3"
   BonesToLockOnEmpty(6)="RW_TopLeft_RadShield4"
   BonesToLockOnEmpty(7)="RW_TopRight_RadShield4"
   BonesToLockOnEmpty(8)="RW_TopLeft_RadShield5"
   BonesToLockOnEmpty(9)="RW_TopRight_RadShield5"
   BonesToLockOnEmpty(10)="RW_TopLeft_RadShield6"
   BonesToLockOnEmpty(11)="RW_TopRight_RadShield6"
   BonesToLockOnEmpty(12)="RW_BottomLeft_RadShield2"
   BonesToLockOnEmpty(13)="RW_BottomRight_RadShield2"
   BonesToLockOnEmpty(14)="RW_BottomLeft_RadShield3"
   BonesToLockOnEmpty(15)="RW_BottomRight_RadShield3"
   BonesToLockOnEmpty(16)="RW_BottomLeft_RadShield4"
   BonesToLockOnEmpty(17)="RW_BottomRight_RadShield4"
   BonesToLockOnEmpty(18)="RW_BottomLeft_RadShield5"
   BonesToLockOnEmpty(19)="RW_BottomRight_RadShield5"
   BonesToLockOnEmpty(20)="RW_BottomLeft_RadShield6"
   BonesToLockOnEmpty(21)="RW_BottomRight_RadShield6"
   BonesToLockOnEmpty(22)="RW_BottomLeft_RadShield1"
   BonesToLockOnEmpty(23)="RW_BottomRight_RadShield1"
   BonesToLockOnEmpty(24)="RW_Bullets1"
   BonesToLockOnEmpty(25)="RW_AcceleratorMagnetrons"
   BonesToLockOnEmpty(26)="RW_Bolt"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_Railgun.Play_WEP_SA_Railgun_DryFire'
   PlayerViewOffset=(X=3.000000,Y=7.000000,Z=-2.000000)
   AttachmentArchetype=KFWeapAttach_Railgun'WEP_RailGun_ARCH.Wep_RailGun_3P_Updated'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Rifle_RailGun:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_RailGun_ARCH.Wep_RailGun_MuzzleFlash'
   IronSightsSpreadMod=0.010000
   maxRecoilPitch=600
   minRecoilPitch=450
   maxRecoilYaw=250
   minRecoilYaw=-250
   RecoilBlendOutRatio=1.100000
   RecoilViewRotationScale=0.600000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   HippedRecoilModifier=2.333330
   FallingRecoilModifier=1.500000
   AssociatedPerkClass=Class'KFGame.KFPerk_Sharpshooter'
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=None
   WeaponProjectiles(1)=None
   FireInterval(0)=0.400000
   FireInterval(1)=0.400000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.005000
   Spread(1)=0.005000
   InstantHitDamage(0)=375.000000
   InstantHitDamage(1)=750.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=30.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_RailGun'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_RailGun'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_RailGun'
   FireOffset=(X=30.000000,Y=3.000000,Z=-2.500000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ScopedBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_RailGun_MESH.WEP_1stP_RailGun_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_RailGun_ANIM.WEP_1P_RailGun_ANIM'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ScopedBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Rail Gun"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ScopedBase:StaticPickupComponent'
      StaticMesh=StaticMesh'wep_3p_railgun_mesh.Wep_3rdP_RailGun_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ScopedBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Components(0)=SceneCapture2DComponent0
   Name="Default__KFWeap_Rifle_RailGun"
   ObjectArchetype=KFWeap_ScopedBase'KFGame.Default__KFWeap_ScopedBase'
}
