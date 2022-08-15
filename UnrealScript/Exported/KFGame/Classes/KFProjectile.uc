//=============================================================================
// KFProjectile
//=============================================================================
// Killing Floor base projectile class.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFProjectile extends Projectile
	abstract
	native
	nativereplication;

/*********************************************************************************************
* @name Network
********************************************************************************************* */

/** The location this projectile spawned in */
var Repnotify Vector OriginalLocation;

/** This will cause the projectile to move to the Original Spawn location when first replicated. This solves the issue of the projectile spawning some distance away from the player when first replicated */
var() bool	bSyncToOriginalLocation;
/** If bSyncToOriginalLocation && !Instigator.IsFirstPerson(), will move the projectile to the third person weapon attachment muzzle bone */
var() bool	bSyncToThirdPersonMuzzleLocation;
/** Replicated and used by bSyncToThirdPersonMuzzleLocation for dual weapons */
var   bool	bFiredFromLeftHandWeapon;

/** Don't replicate this projectile to the Instigator. Used for client side hit detection so that we can spawn a local projectile to do the hit detection and won't have to wait for replication */
var bool bNoReplicationToInstigator;
/** Use client side hit detection for this projectile. Only compatible with projectiles that damage on impact in ProcessBulletTouch, not for projectiles that damage when they Explode() */
var bool bUseClientSideHitDetection;

/** Replicate the hits as sub projectile fragments. This is used for projectiles that aren't fired from a weapon, but rather are released as a projectile explodes.
Only compatible with projectiles that damage on impact in ProcessBulletTouch and have bUseClientSideHitDetection on */
var bool bReplicateClientHitsAsFragments;

/** Like Pawn setting with the same name */
var float AlwaysRelevantDistanceSquared;

/*********************************************************************************************
* @name Penetration
********************************************************************************************* */

/** How much penetration power this projectile starts with. Set by the spawning weapon and replicated */
var repnotify float InitialPenetrationPower;

/** How much penetration power this projectile has remaining (not replicated) */
var float PenetrationPower;

/** Used to store information about projectile touches */
struct native TouchInfo
{
	var Actor Actor;
	var float Time;
};

/** The info for the last actor this projectile penetrated via ProcessTouch() */
var TouchInfo LastTouched;

/** World time of last HitWall/Bounce */
var TouchInfo LastBounced;

/** Ignore additional touches on the same actor within this threshhold */
var float TouchTimeThreshhold;

/** If true, this projectile will damage non-pawn actors it touches */
var bool bDamageDestructiblesOnTouch;

enum FracturedMeshGlassShatterType
{
	FMGS_ShatterNone,
	FMGS_ShatterDamaged,
	FMGS_ShatterAll
};

var FracturedMeshGlassShatterType GlassShatterType;

/*********************************************************************************************
* @name Physics
********************************************************************************************* */

/** Additional Z Axis velocity to apply when launching this projectile */
var(Projectile) float TossZ;

/** How much to scale gravity for this projectile. Used to get different kinds of projectile arcs */
var(Projectile) float GravityScale;

/** Cached OtherComp from Touch, useful for applying damage on touch */
var transient PrimitiveComponent LastTouchComponent;

/** (Advanced) Perform additional zero-extent collision traces at a given offset */
var array<vector> ExtraLineCollisionOffsets;

/** TerminalVelocity for this projectile when falling */
var(Projectile) float TerminalVelocity;

/*********************************************************************************************
* @name Explosions
********************************************************************************************* */

/** Explosion actor class to spawn */
var class<GameExplosionActor> ExplosionActorClass;

/** Defines the explosion. */
var(Projectile) instanced editinline KFGameExplosion	ExplosionTemplate;

/** True if this projectile has already blown up, used to ensure only a single explosion. */
var repnotify bool bHasExploded;

/** If this projectile is being replicated, it's location will be force updated when it explodes. Ensure explosion happens the same place on client as it did on the server */
var bool bReplicateLocationOnExplosion;

/** When this projectile explodes in multiplayer, do extra checks to validate the explosion hitnormal. Useful for projectiles that explode when they hit something */
var bool bValidateExplosionNormalOnClient;

/** True if this projectile has been disintegrated (by Siren Scream, etc.). */
var repnotify bool bHasDisintegrated;

/** If true, always replicated bHasDisintegrated */
var bool bAlwaysReplicateDisintegration;

/** If true, always replicate bHasExploded intstead of relying on client to be correct */
var bool bAlwaysReplicateExplosion;

/** If TRUE, ExplosionActor will be attached to InterpActor if it hits one */
var	bool	bAttachExplosionToHitMover;

/** If TRUE, can be disintegrated (currently by Siren's scream) */
var bool	bCanDisintegrate;

/** Effects Template for projectile being disintegrated by siren's scream */
var(Projectile) ParticleSystem ProjDisintegrateTemplate;
var ParticleSystemComponent	ProjDisintegrateEffects;
var rotator DisintegrateEffectRotation;

/** The explosion actor to store when this projectile is created */
var GameExplosionActor ExplosionActor;

/** The amount of time before this projectile is destroyed after exploding */
var float PostExplosionLifetime;

/** If true, use an alternate set of explosion effects */
var bool    bAltExploEffects;
var KFImpactEffectInfo AltExploEffects;

/*********************************************************************************************
* @name Flight Effects
********************************************************************************************* */

/** This is the effect that is played while in flight */
var ParticleSystemComponent	ProjEffects;
var(Projectile) ParticleSystem ProjFlightTemplate;

/** We're currently fading out ProjEffects */
var bool bFadingOutProjEffects;
/** If set to something greater than zero the ProjEffects won't be instantly stopped on shutdown, they'll need to do a custom fade out that will shut them down over time*/
var float ProjEffectsFadeOutDuration;

/** Effects Template for the bullet flying through the air in Zed time */
var(Projectile) ParticleSystem ProjFlightTemplateZedTime;

/** if True, this projectile will remain alive (but hidden) until the flight effect is done */
var bool bWaitForEffects;

/** if true, the shutdown function has been called and 'new' effects shouldn't happen */
var bool bShuttingDown;

/*********************************************************************************************
* @name Sounds
********************************************************************************************* */

var bool bSuppressSounds;

/** The AKEvent to trigger the ambient sound to start playing */
var AKEvent	AmbientSoundPlayEvent;
/** The AKEvent to trigger the ambient sound to stop playing */
var AKEvent	AmbientSoundStopEvent;
/** The audio component for the ambient sound */
var AkComponent  AmbientComponent;
/** Whether to start playing the ambient sound automatically */
var bool        bAutoStartAmbientSound;
/** Whether to stop the ambient sound when the projectile explodes/impacts */
var bool        bStopAmbientSoundOnExplode;
 /** If true, never cut out ambient sound for detail settings */
var	bool		bImportantAmbientSound;
 /** If true, only this ambient sound should only play in Zed Time */
var	bool		bAmbientSoundZedTimeOnly;

/** Impact info (sfx, vfx, etc.), so that each projectile type can have different effects if desired (assigned by weapon) */
var KFImpactEffectInfo ImpactEffects;

/*********************************************************************************************
* @name Perk
********************************************************************************************* */

/** Grenades do not have a weapoon owner, we have to store the associated perk in the projectile */
var class<KFPerk> AssociatedPerkClass;

/*********************************************************************************************
* End Vars
********************************************************************************************* */

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if( bNetDirty && bCanDisintegrate )
		bHasDisintegrated, DisintegrateEffectRotation;

	// Location
	if ( bNetInitial && bSyncToOriginalLocation )
		OriginalLocation;
    if ( bNetInitial && bSyncToThirdPersonMuzzleLocation )
        bFiredFromLeftHandWeapon;

	// send initially so that if the projectile exploded on the first tick it was alive, the client handles it correctly
	// in other cases the client should be able to simulate everything
	if ( bNetInitial || bAlwaysReplicateExplosion )
		bHasExploded;

    // Need to replicate the penetration power so the clients can properly simulate the penetration
    if( bNetInitial )
        InitialPenetrationPower, bAltExploEffects;
}

/** returns terminal velocity (max speed while falling) for this actor.  Unless overridden, it returns the TerminalVelocity of the PhysicsVolume in which this actor is located.
* Overridden so we can have projectiles falling faster than the PhysicsVolume terminal velocity
*/
native function float GetTerminalVelocity();

/*********************************************************************************************
* @name Initialization / construction / replication
********************************************************************************************* */

/**
 * When this actor begins its life, play any ambient sounds attached to it
 */
simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

	if ( bDeleteMe || bShuttingDown)
		return;

	// Spawn any effects needed for flight
	SpawnFlightEffects();
}

/**
 * Initialize the Projectile
 */
function Init(vector Direction)
{
	SetRotation(rotator(Direction));

	Velocity = Speed * Direction;
	Velocity.Z += TossZ;

    if( KFWeapon(Owner) != none )
    {
		// used in SyncOriginalLocation, called below
        bFiredFromLeftHandWeapon = KFWeapon(Owner).GetCurrentMuzzleID() == 1;
    }

	if( bSyncToOriginalLocation )
    {
        OriginalLocation = Location;
		SyncOriginalLocation();
    }
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
    local vector ExplosionNormal;

	if (VarName == nameof(bHasExploded))
	{
        bHasExploded = false;

		ExplosionNormal = vect(0,0,1);

		if( bValidateExplosionNormalOnClient )
		{
            ExplosionNormal = ValidateExplosionNormal();
		}

		CallExplode(Location, ExplosionNormal);
	}
	else if (VarName == nameof(bHasDisintegrated))
	{
		Disintegrate( DisintegrateEffectRotation );
	}
	else if (VarName == nameof(OriginalLocation))
	{
        SyncOriginalLocation();
	}
    else if (VarName == nameof(InitialPenetrationPower))
    {
        PenetrationPower = InitialPenetrationPower;
    }
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

/** Validate an explosion normal on the client */
simulated function vector ValidateExplosionNormal()
{
    local vector ExplosionNormal;
    local vector AimDir;
	local vector			HitLocation, HitNormal;
	local Actor				TraceActor, HitActor;

    // Set the aim direction to the vector along the line where the
    // projectile would hit based on velocity. This is the most accurate
    if( !IsZero(Velocity) )
    {
        AimDir = Normal(Velocity);
    }

    // Set the aim direction to the vector along the line where the
    // projectile would hit based on where it has moved away from
    // the original location
    if( IsZero(Velocity) && !IsZero(OriginalLocation) )
    {
        AimDir = Normal(Location-OriginalLocation);
    }

    // Use the rotation if the location calcs give a zero direction
    if( IsZero(AimDir) )
    {
        AimDir = Normal(Vector(Rotation));
    }

	// Perform trace to retrieve hit info
    TraceActor = Instigator != None ? Instigator : self;
	HitActor = TraceActor.Trace(HitLocation, HitNormal, Location + AimDir * 32.0, Location - AimDir * 32.0, TRUE,,, TRACEFLAG_Bullet);

    //Instigator.DrawDebugLine(Location - AimDir * 32.0,Location + AimDir * 32.0,255,255,0,TRUE);
    //DrawDebugSphere(Location + AimDir * 32.0, 4, 6, 255, 255, 0, TRUE);

	// If we hit something set the ExplosionNormal
	if( HitActor != None )
	{
        ExplosionNormal	= HitNormal;
	}

	return ExplosionNormal;
}

/** This will cause the projectile to move to the Original Spawn location when first replicated. This solves the issue of the projectile spawning some distance away from the player when first replicated */
simulated function SyncOriginalLocation()
{
	local vector MuzzleLocation, PredictedHitLocation, AimDir, EndTrace, MuzzleToPredictedHit;

	if ( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	// For remote pawns, have the projectile look like its actually
    // coming from the muzzle of the third person weapon
    if( bSyncToThirdPersonMuzzleLocation && Instigator != none
        && !Instigator.IsFirstPerson() && KFPawn(Instigator) != none
        && KFPawn(Instigator).WeaponAttachment != none )
    {
        MuzzleLocation = KFPawn(Instigator).WeaponAttachment.GetMuzzleLocation(bFiredFromLeftHandWeapon ? 1 : 0);

        // Set the aim direction to the vector along the line where the
        // projectile would hit based on velocity. This is the most accurate
        if( !IsZero(Velocity) )
        {
            AimDir = Normal(Velocity);
        }

        // Set the aim direction to the vector along the line where the
        // projectile would hit based on where it has moved away from
        // the original location
        if( IsZero(Velocity) )
        {
            AimDir = Normal(Location-OriginalLocation);
        }

        // Use the rotation if the location calcs give a zero direction
        if( IsZero(AimDir) )
        {
            AimDir = Normal(Vector(Rotation));
        }

        if( Location != MuzzleLocation )
        {
        	// if projectile is spawned at different location than the third
            // person muzzle location, then simulate an instant trace where
            // the projectile would hit
        	EndTrace = Location + AimDir * 16384;
        	PredictedHitLocation = GetPredictedHitLocation(Location, EndTrace);

        	MuzzleToPredictedHit = Normal(PredictedHitLocation - MuzzleLocation);

        	// only adjust AimDir if PredictedHitLocation is "forward" (i.e. don't let projectile fire back towards the shooter)
            //@todo: still need to make this less wonky (can still shoot straight up sometimes when using long weapons, like the sawblade shooter)
        	if( MuzzleToPredictedHit dot vector(Rotation) > 0.f )
        	{
        		// Then we realign projectile aim direction to match where the projectile would hit.
        		AimDir = MuzzleToPredictedHit;
        	}
        }

        // Move the projectile to the MuzzleLocation
        SetLocation(MuzzleLocation);

        // If the Velocity is zero (usually because the projectile impacted
        // something on the server in its first tick before replicating)
        // then turn its phyics and collion back on
        if( IsZero(Velocity) )
        {
            SetPhysics(default.Physics);
            SetCollision(true,true);
        }

        // Adjust the velocity of the projectile so it will hit where
        // it is supposed to
        Velocity = Speed * Normal(AimDir);
    }
	// set location based on 'OriginalLocation'
    else if ( Role < ROLE_Authority )
    {
        // If the Velocity is zero (usually because the projectile impacted
        // something on the server in its first tick before replicating)
        // then turn its physics and collion back on and give it velocity
        // again so the simulation will work properly on the client
        if( IsZero(Velocity) )
        {
            SetPhysics(default.Physics);

            // Set the aim direction to the vector along the line where the
            // projectile would hit
            AimDir = Normal(Location-OriginalLocation);

            // Use the rotation if the location calcs give a zero direction
            if( IsZero(AimDir) )
            {
                AimDir = Vector(Rotation);
            }

            Velocity = Speed * AimDir;
            SetCollision(true,true);
        }

        SetLocation(OriginalLocation);
    }
}

/**
 * Trace out and see where this projectile would hit if it kept going in a straight line
 */
simulated function vector GetPredictedHitLocation(vector StartTrace, vector EndTrace)
{
	local vector			HitLocation, HitNormal;
	local Actor				HitActor;

	// Perform trace to retrieve hit info
	HitActor = Instigator.Trace(HitLocation, HitNormal, EndTrace, StartTrace, TRUE,,, TRACEFLAG_Bullet);

	// If we didn't hit anything, then set the HitLocation as being the EndTrace location
	if( HitActor == None )
	{
		HitLocation	= EndTrace;
	}

	return HitLocation;
}

/*********************************************************************************************
* @name Collision
********************************************************************************************* */
/** Calculates rotator that aligns actor to hit surface */
native function Rotator CalculateStickOrientation( vector HitNormal );

simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	local StaticMeshComponent HitStaticMesh;

	// Catch CanBecomeDynamic actors with BlockActors=FALSE and process as a wall hit
	if ( Other.bStatic && Other.bWorldGeometry )
	{
		HitStaticMesh = StaticMeshComponent(OtherComp);
		if ( (HitStaticMesh != None) && HitStaticMesh.CanBecomeDynamic() )
		{
			HitWall(HitNormal, Other, OtherComp);
		}
		return;
	}

	LastTouchComponent = OtherComp;
	Super.Touch(Other, OtherComp, HitLocation, HitNormal);
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    if (Other != Instigator)
	{
		if (ExplosionTemplate != None)
        {
        	TriggerExplosion(HitLocation, HitNormal, Other);
        }

		Shutdown();	// cleanup/destroy projectile
	}
}

// Don't touch the same actor multiple time's immediately after just
// touching it if the TouchTimeThreshhold is set to greater than 0.
// This was causing projectiles just to "stop" sometimes when hitting
// dead/ragdolled pawns because it was counting as multiple penetrations
simulated function bool CheckRepeatingTouch(Actor Other)
{
	if( LastTouched.Actor == Other && TouchTimeThreshhold > 0
        && (WorldInfo.TimeSeconds - LastTouched.Time) <= TouchTimeThreshhold )
    {
        return true;
    }

    // Store the past touch by this projectile
    LastTouched.Actor = Other;
    LastTouched.Time = WorldInfo.TimeSeconds;

	return false;
}

/** Adjusts movement/physics of projectile.
  * Returns true if projectile actually bounced / was allowed to bounce */
simulated function bool Bounce( vector HitNormal, Actor BouncedOff );

/** Called by projectiles that bounce off world geometry when they touch a damagable non-pawn actor */
simulated function ProcessDestructibleTouchOnBounce( Actor Other, Vector HitLocation, Vector HitNormal )
{
	local TraceHitInfo HitInfo;

	if ( !Other.bWorldGeometry && Other.bCanBeDamaged )
	{
		// @todo: look into CheckRepeatingTouch here. For some reason it didn't really work, but why not?
  		if ( LastBounced.Actor == Other && (WorldInfo.TimeSeconds - LastBounced.Time) <= TouchTimeThreshhold )
		{
			return;
		}

  		if( bDamageDestructiblesOnTouch )
  		{
	  		HitInfo.HitComponent = LastTouchComponent;
			HitInfo.Item = INDEX_None;	// force TraceComponent on fractured meshes
	        Other.TakeDamage(Damage, InstigatorController, HitLocation, MomentumTransfer * Normal(Velocity), MyDamageType, HitInfo, self);// special cases for types of destructibles, bShouldBreakSolidGlassOnBounce
    	}

		if ( Other.bBlockActors )
		{
			LastBounced.Actor = Other;
			LastBounced.Time = WorldInfo.TimeSeconds;
			HitWall(HitNormal, Other, None);
		}
	}
}

/** Handle bullet collision and damage */
simulated function ProcessBulletTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	local Pawn Victim;
	local array<ImpactInfo> HitZoneImpactList;
	local vector StartTrace, EndTrace, Direction;
	local TraceHitInfo HitInfo;

	// Do the impact effects
    if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// Use ImpactEffectManager to handle material based impacts
		KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(HitLocation, Instigator,, ImpactEffects);
	}

	if ( !Other.IsA('Pawn') )
	{
		if ( bDamageDestructiblesOnTouch && Other.bCanBeDamaged )
		{
			HitInfo.HitComponent = LastTouchComponent;
			HitInfo.Item = INDEX_None;	// force TraceComponent on fractured meshes
			Other.TakeDamage(Damage, InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType, HitInfo, self);
		}

		// Reduce the penetration power to zero if we hit something other than a pawn or foliage actor
		if( InteractiveFoliageActor(Other) == None )
		{
    		PenetrationPower = 0;
    		return;
		}
	}

	Victim = Pawn(Other);
	if( Victim != none )
	{
		StartTrace = HitLocation;
		Direction = Normal(Velocity);
		EndTrace = StartTrace + Direction * (Victim.CylinderComponent.CollisionRadius * 6.0);

		TraceProjHitZones(Victim, EndTrace, StartTrace, HitZoneImpactList);

		// Right now we just send the first impact. TODO: Figure out what the
		// most "important" or high damage impact is and send that one! Or,
		// if we need the info on the server send the whole thing - Ramm
		if ( HitZoneImpactList.length > 0 )
		{
            HitZoneImpactList[0].RayDir	= Direction;

			if( bReplicateClientHitsAsFragments )
			{
				if( Instigator != none && KFWeapon(Instigator.Weapon) != none )
				{
				   KFWeapon(Instigator.Weapon).HandleGrenadeProjectileImpact(HitZoneImpactList[0], class);
				}
			}
			// Owner is none on a remote client, or the weapon on the server/local player
			else if( Owner != none && KFWeapon( Owner ) != none )
			{
                KFWeapon(Owner).HandleProjectileImpact(HitZoneImpactList[0], PenetrationPower);
			}
		}
	}
}

/** Pre-process calling the Explode function so it can be overridden in subclasses */
simulated function CallExplode( vector HitLocation, vector HitNormal )
{
    Explode(HitLocation, HitNormal);
}

/** Returns a list of hitzone impacts for a collision with a given pawn
 * @note: To trace the PhysicsAsset the pawn cylinder should have BlockZeroExtent=FALSE
 */
simulated function bool TraceProjHitZones(Pawn P, vector EndTrace, vector StartTrace, out array<ImpactInfo> out_Hits)
{
	local Matrix RotMatrix;
	local vector WorldOffset;
	local int i;

	// Default trace
	if ( TraceAllPhysicsAssetInteractions(P.Mesh, EndTrace, StartTrace, out_Hits, vect(0,0,0), true) )
	{
		return true;
	}

	// If no hit is found, try using the extra line collision.  This shouldn't happen for zero-extent
	// collision because the StartTrace is the HitLocation, but it could happen if we have a cylinder extent.
	if ( ExtraLineCollisionOffsets.Length > 0 )
	{
		RotMatrix = MakeRotationMatrix(Rotation);
		for (i = 0; i < ExtraLineCollisionOffsets.Length ; i++)
		{
			WorldOffset = TransformVector(RotMatrix, ExtraLineCollisionOffsets[i]);
			if ( TraceAllPhysicsAssetInteractions(P.Mesh, EndTrace + WorldOffset, StartTrace + WorldOffset, out_Hits, vect(0,0,0), true) )
			{
				return true;
			}
		}
	}

	return false;
}

/**
 * Explode when the projectile comes to rest on the floor.  It's called from the native physics processing functions.  By default,
 * when we hit the floor, we just explode.
 */
simulated event Landed( vector HitNormal, actor FloorActor )
{
	HitWall(HitNormal, FloorActor, None);
}

/**
 * This is only here to handle Projectile class calls
 * Should use TriggerExplosion instead which handles delayed shutdown
 */
simulated function Explode(vector HitLocation, vector HitNormal)
{
    TriggerExplosion(HitLocation, HitNormal, None);
	Shutdown();	// cleanup/destroy projectile
}

/** Updates bCanDisintegrate based on perk abilities and possibly other things */
simulated function AdjustCanDisintigrate()
{
    local KFPerk InstigatorPerk;
    local KFPawn InstigatorPawn;

    InstigatorPawn = KFPawn(Instigator);
    if( InstigatorPawn != none )
    {
        InstigatorPerk = InstigatorPawn.GetPerk();
        if( InstigatorPerk != none && InstigatorPerk.ShouldRandSirenResist() )
        {
            bCanDisintegrate = false;
        }
    }
}

simulated function Disintegrate( rotator InDisintegrateEffectRotation )
{
    if( bHasExploded )
    {
        return;
    }

    if (WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_DedicatedServer)
    {
        DisintegrateEffectRotation = Rotator(-Velocity);
    }

    SetPhysics( PHYS_None );

    if( ProjDisintegrateTemplate != None && WorldInfo.NetMode != NM_DedicatedServer )
    {
        ProjDisintegrateEffects = WorldInfo.MyEmitterPool.SpawnEmitter( ProjDisintegrateTemplate, Location, inDisintegrateEffectRotation );
    }

	bHasDisintegrated = true;
	DeferredDestroy(0.1f); // cleanup/destroy projectile
}

/**
 * Explode this Projectile
 */
simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	local vector NudgedHitLocation, ExplosionDirection;

	if( bHasDisintegrated )
	{
		return;
	}
	if (!bHasExploded)
	{
        // Stop ambient sounds when this projectile explodes
    	if( bStopAmbientSoundOnExplode && AmbientSoundStopEvent != none && AmbientComponent != none )
    	{
            AmbientComponent.StopEvents();
    	}

		if (ExplosionTemplate != None)
		{
			StopSimulating();

			// using a hitlocation slightly away from the impact point is nice for certain things
			NudgedHitLocation = HitLocation + (HitNormal * 32.f);

            SetExplosionActorClass();
            ExplosionActor = Spawn(ExplosionActorClass, self,, NudgedHitLocation, rotator(HitNormal));
			if (ExplosionActor != None)
			{
				ExplosionActor.Instigator = Instigator;
				ExplosionActor.InstigatorController = InstigatorController;

				PrepareExplosionTemplate();

            	// If the locations are zero (probably because this exploded in the air) set defaults
                if( IsZero(HitLocation) )
                {
                    HitLocation = Location;
                }

            	if( IsZero(HitNormal) )
                {
                    HitNormal = vect(0,0,1);
                }

				// these are needed for the decal tracing later in GameExplosionActor.Explode()
				ExplosionTemplate.HitLocation = HitLocation;// NudgedHitLocation
				ExplosionTemplate.HitNormal = HitNormal;

				// If desired, attach to mover if we hit one
				if(bAttachExplosionToHitMover && InterpActor(HitActor) != None)
				{
					ExplosionActor.Attachee = HitActor;
					ExplosionTemplate.bAttachExplosionEmitterToAttachee = TRUE;
					ExplosionActor.SetBase(HitActor);
				}

				// directional?
				if (ExplosionTemplate.bDirectionalExplosion)
				{
					ExplosionDirection = GetExplosionDirection(HitNormal);
					//DrawDebugLine(ExplosionActor.Location, ExplosionActor.Location+ExplosionDirection*64, 255, 255, 0, TRUE);
				}

				// @todo: make this function responsible for setting explosion instance parameters, and take instance parameters
				// out of GearExplosion (e.g. Attachee)
				PrepareExplosionActor(ExplosionActor);

				ExplosionActor.Explode(ExplosionTemplate, ExplosionDirection);		// go bewm
			}

			// done with it
			if (!bPendingDelete && !bDeleteMe)
			{
				// defer destruction so any replication of explosion stuff can happen if necessary
				DeferredDestroy(PostExplosionLifetime);
			}
		}

		bHasExploded = true;
	}
}

/**
 * Give the projectiles a chance to situationally customize/tweak any explosion parameters.
 * We will also copy in any data we exposed here for .ini file access.
 */
simulated protected function PrepareExplosionTemplate()
{
	GetRadialDamageValues(ExplosionTemplate.Damage, ExplosionTemplate.DamageRadius, ExplosionTemplate.DamageFalloffExponent);
}

/** Returns values for radial damage. */
simulated protected function GetRadialDamageValues(out float outDamage, out float outRadius, out float outFalloff);

/**
 *  Give the projectile the chance to situationally customize the explosion actor before it actually explodes.
 */
simulated function vector GetExplosionDirection(vector HitNormal);
simulated protected function PrepareExplosionActor(GameExplosionActor GEA);
simulated protected function SetExplosionActorClass();

/*********************************************************************************************
* @name Cleanup
********************************************************************************************* */

/**
 * Clean up
 */
simulated function Shutdown()
{
	// Stop ambient sounds when this projectile ShutsDown
	if( bStopAmbientSoundOnExplode && AmbientSoundStopEvent != none && AmbientComponent != none )
	{
        AmbientComponent.StopEvents();
	}

	// If cleanup has already begun, just wait
	if ( bShuttingDown )
	{
		return;
	}

    bShuttingDown = true;
	StopSimulating();

	// If we have to wait for effects, tweak the death conditions
	if (ProjEffectsFadeOutDuration > 0.0)
	{
		if ( WorldInfo.NetMode == NM_DedicatedServer )
		{
			// We are on a dedicated server and not replicating anything nor do we have effects so destroy right away
			// At least give us some time to replicate if we are spawned/destroyed in the same tick!
			DeferredDestroy(0.15f);
		}
		else
		{
			DeferredDestroy(ProjEffectsFadeOutDuration + 0.1f);
		}
	}
	else
	{
		Destroy();
	}
}

/** Stops projectile simulation without destroying it.  Projectile is resting, essentially. */
simulated protected function StopSimulating()
{
    Velocity = vect(0,0,0);
	Acceleration = vect(0,0,0);
	RotationRate = rot(0,0,0);
	SetPhysics(PHYS_None);
	SetCollision(FALSE, FALSE);

	StopFlightEffects();

	bRotationFollowsVelocity = FALSE;
}

/** Makes projectile "dead", but doesn't actually kill it for some time. */
simulated protected function DeferredDestroy(float DelaySec)
{
	local MeshComponent ComponentIt;

	foreach ComponentList(class'MeshComponent', ComponentIt)
	{
		ComponentIt.SetHidden(true);
	}

	SetPhysics(PHYS_None);
	SetCollision(false, false);
	bCollideWorld = false;

	// So that shutdown doesn't call this more than once
	bShuttingDown = true;

	LifeSpan = DelaySec;
}

simulated function Destroyed()
{
    if (ProjEffects != None)
    {
        DetachComponent(ProjEffects);
        WorldInfo.MyEmitterPool.OnParticleSystemFinished(ProjEffects);
        ProjEffects = None;
    }

    // Stop ambient sounds when this projectile is destroyed
    if( AmbientSoundStopEvent != none && AmbientComponent != none)
    {
        // @todo: Fade out the ambient sound
        AmbientComponent.StopEvents();
    }

    super.Destroyed();
}

/*********************************************************************************************
* @name Actor
********************************************************************************************* */

/**
 * Get gravity currently affecting this actor
 */
native function float GetGravityZ();

simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);

    if( WorldInfo.NetMode != NM_DedicatedServer )
    {
        // Stop zed time only ambient sounds if zed time gets deactivated
        if( AmbientSoundPlayEvent != None && bAmbientSoundZedTimeOnly && !(self.WorldInfo.TimeDilation < 1.f)
            && AmbientSoundStopEvent != none && AmbientComponent != none )
        {
            // TODO: Fade this out - Ramm
            AmbientComponent.StopEvents();
            AmbientComponent = None;
        }

        if( ProjEffects!=None && bFadingOutProjEffects && bShuttingDown )
        {
            if( ProjEffectsFadeOutDuration >= 0.0 )
            {
                ProjEffectsFadeOutDuration -= DeltaTime;

                if( ProjEffectsFadeOutDuration <= 0.0 )
                {
                    bFadingOutProjEffects=false;
                    ProjEffectsFadeOutDuration=0.0;
                    ProjEffects.KillParticlesForced();

                    // If we were waiting for the fade out, it's safe to destroy now
                    Destroy();
                }
            }
        }
    }
}

/*********************************************************************************************
* @name Effects
********************************************************************************************* */

/**
 * Spawns any effects needed for the flight of this projectile
 */
simulated function SpawnFlightEffects()
{
	if (WorldInfo.NetMode != NM_DedicatedServer )
	{
		// Set its Ambient Sound
		if (bAutoStartAmbientSound && AmbientSoundPlayEvent != None
			&& !bSuppressSounds && (!bAmbientSoundZedTimeOnly || (self.WorldInfo.TimeDilation < 1.f)) )
		{
			if ( bImportantAmbientSound || (!WorldInfo.bDropDetail && (WorldInfo.GetDetailMode() != DM_Low)) )
			{
				if ( AmbientComponent != None )
				{
					AmbientComponent.StopEvents();
					AmbientComponent.PlayEvent( AmbientSoundPlayEvent );
				}
			}
		}

		// Play zed time flight effects
        if( (self.WorldInfo.TimeDilation < 1.f) && ProjFlightTemplateZedTime != none )
		{
            ProjEffects = WorldInfo.MyEmitterPool.SpawnEmitterCustomLifetime(ProjFlightTemplateZedTime);
        }
        // Play normal speed flight effects
        else if( ProjFlightTemplate != None )
        {
            ProjEffects = WorldInfo.MyEmitterPool.SpawnEmitterCustomLifetime(ProjFlightTemplate);
        }
        // No flight effects specified, return
        else
        {
            return;
        }
		ProjEffects.SetAbsolute(false, false, false);
		ProjEffects.SetLODLevel(WorldInfo.bDropDetail ? 1 : 0);
		ProjEffects.bUpdateComponentInTick = true;
		AttachComponent(ProjEffects);
	}
}

simulated protected function StopFlightEffects()
{
	if (ProjEffects!=None)
	{
		// If the ProjEffectsFadeOutDuration is greater than zero we need to
		// wait to turn off the effects because we are going to fade them out
		// in the Tick function by setting bFadingOutProjEffects.
        if( ProjEffectsFadeOutDuration > 0.0 )
		{
            bFadingOutProjEffects=true;
        }

        // Turn off the projectile effects. In the emitter, some parts of the
        // effect can be set not to shut down on deactivate, and those are the
        // ones you can fade out over time (like the zed time bullet trail)
        ProjEffects.DeactivateSystem();
	}
}

defaultproperties
{
   GravityScale=1.000000
   PostExplosionLifetime=1.000000
   Speed=4000.000000
   MaxSpeed=4000.000000
   MomentumTransfer=1.000000
   MyDamageType=Class'KFGame.KFDT_Ballistic'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Projectile:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Projectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__KFProjectile"
   ObjectArchetype=Projectile'Engine.Default__Projectile'
}
