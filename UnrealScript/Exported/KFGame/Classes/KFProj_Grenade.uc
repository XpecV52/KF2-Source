//=============================================================================
// KFProj_Grenade
//=============================================================================
// Base class for grenade projectiles
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_Grenade extends KFProjectile
	abstract
	native;

/** How long to wait until this grenade explodes */
var float FuseTime;

/** Information about grenade bounce effects for this class */
var KFImpactEffectInfo GrenadeBounceEffectInfo;

/** Dampen amount for every bounce */
var() float DampenFactor;

/** Dampen amount for parallel angle to velocity */
var() float DampenFactorParallel;

/** How much to offset the emitter mesh when the grenade has landed so that it doesn't penetrate the ground */
var() vector LandedTranslationOffset;

/** Whether or not we want to prevent this grenade from being tossed during the initial zed grab rotation. If the nade can insta kill the player, set to false */
var(Grab) bool bAllowTossDuringZedGrabRotation;

///** The UI image for this grenade.  Needed so the images have a reference and are cooked into packages. */
var() Texture2D WeaponSelectTexture;

/** Set on the server and replicated to clients. Ensures that even if Instigator isn't relevant, we still have a valid team */
var repnotify byte TeamNum;

replication
{
	if( bNetInitial && !bNetOwner )
		TeamNum;
}

/* epic ===============================================
* ::ReplicatedEvent
*
* Called when a variable with the property flag "RepNotify" is replicated
*
* =====================================================
*/
simulated event ReplicatedEvent( name VarName )
{
	if( VarName == nameOf(TeamNum) )
	{
		EnableGrenadeWarning();
	}
	else
	{
		super.ReplicatedEvent( VarName );
	}
}

event PreBeginPlay()
{
	super.PreBeginPlay();

	if( Instigator != none )
	{
		TeamNum = Instigator.GetTeamNum();
	}
}

/**
 * Set the initial velocity and cook time
 */
simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	RandSpin(100000);

	if( Role == ROLE_Authority )
	{
	   SetTimer(FuseTime, false, 'ExplodeTimer');
	}

	AdjustCanDisintigrate();
}

/**
 * Spawns any effects needed for the flight of this projectile
 */
simulated function SpawnFlightEffects()
{
	super.SpawnFlightEffects();

	// Enable the warning on listen servers (and standalone technically, but likely not used)
	if( WorldInfo.Role == ROLE_Authority )
	{
		EnableGrenadeWarning();
	}
}

/** Toggles an emitter in the projectile effects particle system to display a warning sprite */
simulated function EnableGrenadeWarning()
{
	local PlayerController LocalPC;	

	if( ProjEffects == none || GetTeamNum() != 0 )
	{
		return;
	}

	LocalPC = GetALocalPlayerController();
	if( LocalPC != none && !LocalPC.IsSpectating() && LocalPC.GetTeamNum() != GetTeamNum() )
	{
		ProjEffects.SetFloatParameter( 'Warning' , 0.75f );
	}
}

/** Override so we can grab our replicated TeamNum */
simulated function byte GetTeamNum()
{
	if( !bNetOwner )
	{
		return TeamNum;
	}

	return super.GetTeamNum();
}

/**
 * Explode after a certain amount of time
 */
function ExplodeTimer()
{
    local Actor HitActor;
    local vector HitLocation, HitNormal;

    GetExplodeEffectLocation(HitLocation, HitNormal, HitActor);

    TriggerExplosion(HitLocation, HitNormal, HitActor);
}

simulated function Destroyed()
{
    local Actor HitActor;
    local vector HitLocation, HitNormal;

	// Final Failsafe check for explosion effect
	if (!bHasExploded && !bHasDisintegrated)
	{
		GetExplodeEffectLocation(HitLocation, HitNormal, HitActor);
        TriggerExplosion(HitLocation, HitNormal, HitActor);
	}

	super.Destroyed();
}

/**
 * Trace down and get the location to spawn the explosion effects and decal
 */
simulated function GetExplodeEffectLocation(out vector HitLocation, out vector HitRotation, out Actor HitActor)
{
    local vector EffectStartTrace, EffectEndTrace;
	local TraceHitInfo HitInfo;

	EffectStartTrace = Location + vect(0,0,1) * 4.f;
	EffectEndTrace = EffectStartTrace - vect(0,0,1) * 32.f;

    // Find where to put the decal
	HitActor = Trace(HitLocation, HitRotation, EffectEndTrace, EffectStartTrace, false,, HitInfo, TRACEFLAG_Bullet);

	// If the locations are zero (probably because this exploded in the air) set defaults
    if( IsZero(HitLocation) )
    {
        HitLocation = Location;
    }

	if( IsZero(HitRotation) )
    {
        HitRotation = vect(0,0,1);
    }
}

/**
 * Give a little bounce
 */
simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	// check to make sure we didn't hit a pawn
	if ( Pawn(Wall) != none )
	{
		return;
	}

    Bounce( HitNormal, Wall );

	// if we are moving too slowly stop moving and lay down flat
	// also, don't allow rest on -Z surfaces.
	if ( Speed < 40 && HitNormal.Z > 0 )
	{
		ImpactedActor = Wall;
		GrenadeIsAtRest();
	}
}

/** Adjusts movement/physics of projectile.
  * Returns true if projectile actually bounced / was allowed to bounce */
simulated function bool Bounce( vector HitNormal, Actor BouncedOff )
{
	local vector VNorm;

	if ( WorldInfo.NetMode != NM_DedicatedServer )
    {
        // do the impact effects
    	KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(Location, Instigator, HitNormal, GrenadeBounceEffectInfo, true );
    }

    // Reflect off BouncedOff w/damping
    VNorm = (Velocity dot HitNormal) * HitNormal;
    Velocity = -VNorm * DampenFactor + (Velocity - VNorm) * DampenFactorParallel;
    Speed = VSize(Velocity);

	// also done from ProcessDestructibleTouchOnBounce. update LastBounced to solve problem with bouncing rapidly between world/non-world geometry
	LastBounced.Actor = BouncedOff;
	LastBounced.Time = WorldInfo.TimeSeconds;

	return true;
}

/** Called once the grenade has finished moving */
simulated event GrenadeIsAtRest()
{
    local rotator NewRotation;

	SetPhysics(PHYS_None);

	if( ProjEffects != none )
	{
        ProjEffects.SetTranslation(LandedTranslationOffset);
    }

	RotationRate.Yaw = 0;
	RotationRate.Pitch = 0;
	RotationRate.Roll = 0;
	NewRotation.Pitch=16384;
	SetRotation(NewRotation);
}

//==============
// Touching
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if ( Other != none && Other != Instigator && (!Other.bWorldGeometry || !Other.bStatic) )
	{
		if ( Pawn(other) != None )
		{
            // For opposing team, make the grenade stop and just start falling
			if( Pawn(Other).GetTeamNum() != GetTeamNum() )
			{
				// Setting SetCollision makes the grenade undetectable by the Siren's scream, so instead
				// disable Touch & HitWall event notifications. If there's a problem with using execDisable, we
				// can add a new flag instead, like "bStopBounce" to exit ProcessTouch & HitWall early if true.
				// Events with indices between NAME_PROBEMIN and NAME_PROBEMAX can be enabled/disabled.
				Disable( 'Touch' );

				Velocity = Vect(0,0,0);
			}
		}
		else if ( !Other.bCanBeDamaged && Other.bBlockActors )
		{
			// Not a destructible... treat as if it's bWorldGeometry=TRUE
			// e.g. SkeletalMeshActor
			if ( !CheckRepeatingTouch(Other) )
			{
				HitWall(HitNormal, Other, LastTouchComponent);
			}
		}
		else
		{
			ProcessDestructibleTouchOnBounce( Other, HitLocation, HitNormal );
		}
	}
}

defaultproperties
{
   FuseTime=2.000000
   GrenadeBounceEffectInfo=KFImpactEffectInfo'FX_Impacts_ARCH.DefaultGrenadeImpacts'
   DampenFactor=0.250000
   DampenFactorParallel=0.400000
   LandedTranslationOffset=(X=2.000000,Y=0.000000,Z=0.000000)
   TeamNum=128
   bAlwaysReplicateDisintegration=True
   bAlwaysReplicateExplosion=True
   bCanDisintegrate=True
   AlwaysRelevantDistanceSquared=6250000.000000
   GlassShatterType=FMGS_ShatterAll
   TouchTimeThreshhold=0.150000
   TossZ=250.000000
   Speed=2500.000000
   MaxSpeed=2500.000000
   bBlockedByInstigator=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Physics=PHYS_Falling
   bNetTemporary=False
   bCollideComplex=True
   bBounce=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Grenade"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
