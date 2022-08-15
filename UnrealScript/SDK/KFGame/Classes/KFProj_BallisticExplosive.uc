//=============================================================================
// KFProj_BallisticExplosive
//=============================================================================
// Superclass for projectiles that need to fly through the air quickly
// and damage things they impact, but also explode
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibso
//=============================================================================

class KFProj_BallisticExplosive extends KFProjectile
	abstract
	hidedropdown;

/** This projectile is a dud, it hit too soon */
var  repnotify   bool                bDud;

/** When true this projectile will collide/hit/explode when hitting teammates */
var() bool bCollideWithTeammates;

var bool bClientDudHit;

/** Distance this projectile arms itself at */
var()   float               ArmDistSquared;

/** The effect to display when the projectile becomes a dud */
var(Projectile) ParticleSystem ProjDudTemplate;

/** Information about grenade bounce effects for this class */
var KFImpactEffectInfo GrenadeBounceEffectInfo;

/** Dampen amount for every bounce */
var() float DampenFactor;

/** Dampen amount for parallel angle to velocity */
var() float DampenFactorParallel;

/** How much to offset the emitter mesh when the grenade has landed so that it doesn't penetrate the ground */
var() vector LandedTranslationOffset;

replication
{
	if ( Role == ROLE_Authority )
		bDud;
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
    local vector AimDir;
	local float CurrentSpeed;
	local bool bLowSpeed;

    // If the projectile had become a dud, and this is the owning client,
    // and it hasn't hit something yet, get it moving again so it can
    // get a hit. Otherwise it might miss a client side hit on a pawn
	if (VarName == nameof(bDud) && !bClientDudHit && Owner != none
        && KFWeapon(Owner) != none && Instigator != none &&
        Instigator.Role < ROLE_Authority && Instigator.IsLocallyControlled() )
	{
        CurrentSpeed = VSize(Velocity);

        // Only used velocity if the projectile is still moving near full speed
        bLowSpeed = CurrentSpeed < default.Speed * 0.75;

        // Set the aim direction to the vector along the line where the
        // projectile would hit based on velocity. This is the most accurate
        if( !bLowSpeed )
        {
            AimDir = Normal(Velocity);
        }

        // Set the aim direction to the vector along the line where the
        // projectile would hit based on where it has moved away from
        // the original location if it has gone more than 1 meter
        if( bLowSpeed && !IsZero(OriginalLocation) && VSize(Location-OriginalLocation) > 100  )
        {
            AimDir = Normal(Location-OriginalLocation);
        }

        // Use the rotation if the location calcs give a zero direction
        if( IsZero(AimDir) )
        {
            AimDir = Normal(Vector(Rotation));
        }

        /*
        // Direction debug drawing
        // Green, velocity direction
        Instigator.DrawDebugLine(Location + Vect(0,0,1),Location + Normal(Velocity) * 32.0,0,255,0,TRUE);
        Instigator.DrawDebugSphere(Location, 3, 6, 0, 255, 0, TRUE);

        // Red, Original Location direction
        Instigator.DrawDebugLine(Location + Vect(0,0,2),Location + Normal(Location-OriginalLocation) * 32.0,255,0,0,TRUE);
        Instigator.DrawDebugSphere(Location, 4, 6, 255, 0, 0, TRUE);

        // Blue, Rotation direction
        Instigator.DrawDebugLine(Location + Vect(0,0,3),Location + Normal(Vector(Rotation)) * 32.0,0,0,255,TRUE);
        Instigator.DrawDebugSphere(Location, 5, 6, 0, 0, 255, TRUE);

        // Yellow, used direction
        Instigator.DrawDebugLine(Location,Location + AimDir * 32.0,255,255,0,TRUE);
        Instigator.DrawDebugSphere(Location, 6, 6, 255, 255, 0, TRUE);

        // White, original location
        Instigator.DrawDebugSphere(OriginalLocation, 12, 6, 255, 255, 255, TRUE);
        */

        // Restore the original physics, since it will be set to none or falling on the server when it's a dud
        SetPhysics(default.Physics);

        // Adjust the velocity of the projectile so it will hit where
        // it is supposed to
        Velocity = Speed * Normal(AimDir);
	}
    else
	{
		Super.ReplicatedEvent(VarName);
	}
}

simulated event PreBeginPlay()
{
    Super.PreBeginPlay();
    AdjustCanDisintigrate();
}

/**
 * This is only here to handle Projectile class calls
 * Should use TriggerExplosion instead which handles delayed shutdown
 */
simulated function Explode(vector HitLocation, vector HitNormal)
{
	// Just do a standard explosion if its a locally authoritive player
    if( WorldInfo.NetMode == NM_Standalone ||
        (WorldInfo.NetMode == NM_ListenServer && Instigator != none && Instigator.IsLocallyControlled()) )
    {
        Super.Explode(HitLocation, HitNormal);
        return;
    }

    // Replication the explosion to the server if this is the owning client
    if( Owner != none && KFWeapon( Owner ) != none && Instigator != none )
	{
		if( Instigator.Role < ROLE_Authority && Instigator.IsLocallyControlled() )
		{
            KFWeapon(Owner).HandleClientProjectileExplosion(HitLocation, self);
            Super.Explode(HitLocation, HitNormal);
            return;
        }
	}

	StopSimulating();
}

/** Pre-process calling the Explode function so it can be overridden in subclasses */
simulated function CallExplode( vector HitLocation, vector HitNormal )
{
    // Move this projectile to the explode location since it might have been
    // replicated, and this ensures it happens in the right place
    SetLocation( HitLocation );
    Super.Explode(HitLocation, HitNormal);
}

simulated event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
{
    local Vector VNorm;
    local rotator NewRotation;
    local Vector Offset;
    local bool bWantsClientSideDudHit;

    // Need to do client side dud hits if this is a client
    if( Instigator != none && Instigator.Role < ROLE_Authority )
	{
        bWantsClientSideDudHit = true;
    }

    // Bounce off the wall and cause the shell to dud if we hit too close
    if( bDud || ((VSizeSq(Location - OriginalLocation) < ArmDistSquared) || (OriginalLocation == vect(0,0,0) && ArmDistSquared > 0) ) )
    {
        if( (!bDud || ( bWantsClientSideDudHit && !bClientDudHit)) )
        {
            bDud = true;
            if( bWantsClientSideDudHit )
            {
                bClientDudHit = true;
            }

            LifeSpan=1.0;
            SetPhysics(PHYS_Falling);
            GravityScale=1.0;

            // Replace the flying effects with the dud mesh effects
            StopFlightEffects();
            ProjFlightTemplate=ProjDudTemplate;
            ProjFlightTemplateZedTime=ProjDudTemplate;
            SpawnFlightEffects();
        }

    	if ( WorldInfo.NetMode != NM_DedicatedServer && Pawn(Wall) == none )
    	{
            // do the impact effects
    		`ImpactEffectManager.PlayImpactEffects(Location, Instigator, HitNormal, GrenadeBounceEffectInfo, true );
    	}

        // Reflect off Wall w/damping
        VNorm = (Velocity dot HitNormal) * HitNormal;
        Velocity = -VNorm * DampenFactor + (Velocity - VNorm) * DampenFactorParallel;
        Speed = VSize(Velocity);

		// if we hit a pawn or we are moving too slowly stop moving and lay down flat
		if ( Speed < 40  )
		{
			ImpactedActor = Wall;
			SetPhysics(PHYS_None);

			if( ProjEffects != none )
			{
                ProjEffects.SetTranslation(LandedTranslationOffset);
            }

        	// Position the shell on the ground
            RotationRate.Yaw = 0;
        	RotationRate.Pitch = 0;
        	RotationRate.Roll = 0;
        	NewRotation = Rotation;
        	NewRotation.Pitch = 0;
			SetRotation(NewRotation);
			Offset.Z = LandedTranslationOffset.X;
			SetLocation(Location + Offset);
		}
    }

    if( !bDud )
    {
        Super.HitWall(HitNormal, Wall, WallComp);
    }
}

/** returns terminal velocity (max speed while falling) for this actor.  Unless overridden, it returns the TerminalVelocity of the PhysicsVolume in which this actor is located.
* Overridden so we can have projectiles falling faster than the PhysicsVolume terminal velocity
*/
function float GetTerminalVelocity()
{
    if( bDud )
    {
        // Use the actor super class terminal velocity so duds fall slowly, but
        // the projectile can still move quickly when it is flying through the air
        return Super(Actor).GetTerminalVelocity();
    }
    else
    {
        return Super.GetTerminalVelocity();
    }
}

//==============
// Touching
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    local Vector VNorm;
    local bool bWantsClientSideDudHit;

    // If we collided with a Siren shield, let the shield code handle touches
    if( Other.IsA('KFTrigger_SirenProjectileShield') )
    {
        return;
    }

	if ( !bCollideWithTeammates && Pawn(other) != None )
	{
        // Don't hit teammates
		if( Other.GetTeamNum() == GetTeamNum() )
		{
            return;
		}
	}

    // Need to do client side dud hits if this is a client
    if( Instigator != none && Instigator.Role < ROLE_Authority )
	{
        bWantsClientSideDudHit = true;
    }

    if( (!bDud || ( bWantsClientSideDudHit && !bClientDudHit)) && ((VSizeSq(Location - OriginalLocation) < ArmDistSquared) || (OriginalLocation == vect(0,0,0) && ArmDistSquared > 0)) )
    {
        // Don't touch the same actor multiple time's immediately after just
        // touching it if the TouchTimeThreshhold is set to greater than 0.
        // This was causing projectiles just to "stop" sometimes when hitting
        // dead/ragdolled pawns because it was counting as multiple penetrations
        if( LastTouched.Actor == Other && TouchTimeThreshhold > 0
            && `TimeSince(LastTouched.Time) <= TouchTimeThreshhold )
        {
            return;
        }

        //TODO: Add an impact sound here

        bDud = true;

    	if (Other != Instigator && !Other.bStatic)
    	{
    		ProcessBulletTouch(Other, HitLocation, HitNormal);
        }

        if( bWantsClientSideDudHit )
        {
            bClientDudHit = true;
        }
        LifeSpan=1.0;
        SetPhysics(PHYS_Falling);
        GravityScale=1.0;

        // Reflect off Wall w/damping
        VNorm = (Velocity dot HitNormal) * HitNormal;
        Velocity = -VNorm * DampenFactor + (Velocity - VNorm) * DampenFactorParallel;
        Speed = VSize(Velocity);

        // Replace the flying effects with the dud mesh effects
        StopFlightEffects();
        ProjFlightTemplate=ProjDudTemplate;
        ProjFlightTemplateZedTime=ProjDudTemplate;
        SpawnFlightEffects();
    }

    if( !bDud )
    {
        // Process impact hits
    	if (Other != Instigator && !Other.bStatic)
    	{
			// check/ignore repeat touch events
			if( !CheckRepeatingTouch(Other) )
			{
				ProcessBulletTouch(Other, HitLocation, HitNormal);
			}
    	}

    	if( WorldInfo.NetMode == NM_Standalone ||
            (WorldInfo.NetMode == NM_ListenServer && Instigator != none && Instigator.IsLocallyControlled()) )
        {
            Super.ProcessTouch( Other, HitLocation, HitNormal );
            return;
        }

        if( Owner != none && KFWeapon( Owner ) != none && Instigator != none )
    	{
    		if( Instigator.Role < ROLE_Authority && Instigator.IsLocallyControlled() )
    		{
                KFWeapon(Owner).HandleClientProjectileExplosion(HitLocation, self);
                Super.ProcessTouch( Other, HitLocation, HitNormal );
                return;
            }
    	}

    	StopSimulating();
	}
}

/** Handle bullet collision and damage. Overridden to handle finding a nearby hit on the body when hitting the big collision cylinder */
simulated function ProcessBulletTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	local Pawn Victim;
	local array<ImpactInfo> HitZoneImpactList;
	local vector StartTrace, EndTrace, Direction;
	local TraceHitInfo HitInfo;
	local vector ClosestHit;

	// Do the impact effects
    if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// Use ImpactEffectManager to handle material based impacts
		`ImpactEffectManager.PlayImpactEffects(HitLocation, Instigator,, ImpactEffects);
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

        // If we didn't hit anything, that means we hit the big cylinder but
        // missed the body. Just grab the nearest bone and hit that
        if( bDud && HitZoneImpactList.length == 0 )
        {
            Victim.Mesh.FindClosestBone(StartTrace, ClosestHit);

            if( !IsZero(ClosestHit) )
            {
        		StartTrace = ClosestHit;
        		Direction = Normal(ClosestHit-HitLocation);
        		EndTrace = StartTrace + Direction * (Victim.CylinderComponent.CollisionRadius * 6.0);

                TraceProjHitZones(Victim, EndTrace, StartTrace, HitZoneImpactList);
            }
        }

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

// for nukes && concussive force
simulated protected function PrepareExplosionTemplate()
{
    local KFPlayerReplicationInfo InstigatorPRI;

    if( bWasTimeDilated && Instigator != none )
    {
        InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
        if( InstigatorPRI != none )
        {
            if( InstigatorPRI.bNukeActive && class'KFPerk_Demolitionist'.static.ProjectileShouldNuke( self ) )
            {
                ExplosionTemplate = class'KFPerk_Demolitionist'.static.GetNukeExplosionTemplate();
                ExplosionTemplate.Damage = default.ExplosionTemplate.Damage * class'KFPerk_Demolitionist'.static.GetNukeDamageModifier();
                ExplosionTemplate.DamageRadius = default.ExplosionTemplate.DamageRadius * class'KFPerk_Demolitionist'.static.GetNukeRadiusModifier();
                ExplosionTemplate.DamageFalloffExponent = default.ExplosionTemplate.DamageFalloffExponent;        
            }
            else if( InstigatorPRI.bConcussiveActive && AltExploEffects != none )
            {
                ExplosionTemplate.ExplosionEffects = AltExploEffects;
                ExplosionTemplate.ExplosionSound = class'KFPerk_Demolitionist'.static.GetConcussiveExplosionSound();
            }
        }
    }

    super.PrepareExplosionTemplate();
}

simulated protected function SetExplosionActorClass()
{
   local KFPlayerReplicationInfo InstigatorPRI;

    if( bWasTimeDilated && Instigator != none )
    {
       InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
        if( InstigatorPRI != none )
        {
            if( InstigatorPRI.bNukeActive && class'KFPerk_Demolitionist'.static.ProjectileShouldNuke( self ) )
            {
                ExplosionActorClass = class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass();
            }
        }
    }

    super.SetExplosionActorClass();
}

defaultproperties
{
    bBounce=true
    ProjEffectsFadeOutDuration=0.0

    DampenFactor=0.025000
    DampenFactorParallel=0.050000
    LandedTranslationOffset=(X=2)

    bCollideComplex=TRUE	// Ignore simple collision on StaticMeshes, and collide per poly

	// CollideActors=true allows detection via OverlappingActors or CollidingActors (for Siren scream)
	Begin Object Name=CollisionCylinder
		CollisionRadius=5.f
		CollisionHeight=5.f
		BlockNonZeroExtent=false
		CollideActors=true
	End Object

	// Lets the projectile collide with both the big collision cylinder, and any
	// parts of the pawn outside the collision cylinder
    ExtraLineCollisionOffsets.Add(())

	bNetTemporary=False
	bBlockedByInstigator=false
	bAlwaysReplicateExplosion=true
	bUseClientSideHitDetection=true
	bNoReplicationToInstigator=false
	bReplicateLocationOnExplosion=true
	bValidateExplosionNormalOnClient=true

	bSyncToOriginalLocation=true
	bSyncToThirdPersonMuzzleLocation=true

	ExplosionActorClass=class'KFExplosionActor'

	TouchTimeThreshhold=0.15

    Begin Object Class=AkComponent name=AmbientAkSoundComponent
    	bStopWhenOwnerDestroyed=true
    	bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.25;
    End Object
    AmbientComponent=AmbientAkSoundComponent
    Components.Add(AmbientAkSoundComponent)

    bAutoStartAmbientSound=true
    bStopAmbientSoundOnExplode=true

    bCanDisintegrate=true
    GlassShatterType=FMGS_ShatterAll
	// network
    bAlwaysReplicateDisintegration=true
	AlwaysRelevantDistanceSquared=6250000 // 25m

	bCollideWithTeammates=false
}

