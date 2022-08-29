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

var bool bIsTimedExplosive;

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

/** Dampen amount for every bounce */
var() float WallHitDampenFactor;

/** Dampen amount for parallel angle to velocity */
var() float WallHitDampenFactorParallel;

/** How much to offset the emitter mesh when the grenade has landed so that it doesn't penetrate the ground */
var() vector LandedTranslationOffset;

//to keep track if we are hitting an actor multiple times.
var array<Actor> ImpactList;

replication
{
	if ( Role == ROLE_Authority && !bNetOwner )
		bDud;

    if( bNetInitial && !bNetOwner )
        ArmDistSquared;
}

simulated function SyncOriginalLocation()
{
	local KFPerk InstigatorPerk;
    local KFPawn KFP;

    KFP = KFPawn(Instigator);

    if( KFP != none )
    {
        InstigatorPerk = KFP.GetPerk();
        if( InstigatorPerk != none && InstigatorPerk.ShouldNeverDud() )
        {
            ArmDistSquared = 0;
        }
    }

    // If server has already collided we need to recover our velocity.  Reuse the code
	// in super by zeroing velocity.
    if ( Physics == PHYS_Falling && Role < ROLE_Authority
        && Instigator != none && Instigator.IsLocallyControlled() )
    {
        Velocity = vect(0,0,0);
    }

    Super.SyncOriginalLocation();
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
	local TraceHitInfo HitInfo;
	local float TraveledDistance;

    // Need to do client side dud hits if this is a client
    if( Instigator != none && Instigator.Role < ROLE_Authority )
	{
        bWantsClientSideDudHit = true;
    }

	TraveledDistance = ((WorldInfo.TimeSeconds - CreationTime) * Speed);
	TraveledDistance *= TraveledDistance;

    // Bounce off the wall and cause the shell to dud if we hit too close
    if( bDud || ((TraveledDistance < ArmDistSquared) || bIsTimedExplosive || (OriginalLocation == vect(0,0,0) && ArmDistSquared > 0)))
    {
		// Reflect off Wall w/damping
		VNorm = (Velocity dot HitNormal) * HitNormal;
		Velocity = -VNorm * WallHitDampenFactor + (Velocity - VNorm) * WallHitDampenFactorParallel;
		Speed = VSize(Velocity);

        if( (!bDud || ( bWantsClientSideDudHit && !bClientDudHit)) )
        {
			SetIsDud(bWantsClientSideDudHit, HitNormal);
        }

    	if ( WorldInfo.NetMode != NM_DedicatedServer && Pawn(Wall) == none )
    	{
            // do the impact effects
    		KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(Location, Instigator, HitNormal, GrenadeBounceEffectInfo, true );
    	}

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

		if( !Wall.bStatic && Wall.bCanBeDamaged && (DamageRadius == 0 || bDamageDestructiblesOnTouch) && !CheckRepeatingTouch(Wall) )
		{
			HitInfo.HitComponent = WallComp;
			HitInfo.Item = INDEX_None;
			Wall.TakeDamage( Damage, InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType, HitInfo, self);
		}
    }

    if( !bDud && !bIsTimedExplosive )
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
    local bool bWantsClientSideDudHit;
	local float TraveledDistance;
	local Vector VNorm;

    // If we collided with a Siren shield, let the shield code handle touches
    if( Other.IsA('KFTrigger_SirenProjectileShield') )
    {
        return;
    }

	if ( !bCollideWithTeammates && Pawn(Other) != None )
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

	TraveledDistance = ((WorldInfo.TimeSeconds - CreationTime) * Speed);
	TraveledDistance *= TraveledDistance;

    if( (!bDud || ( bWantsClientSideDudHit && !bClientDudHit)) && ((TraveledDistance < ArmDistSquared) || bIsTimedExplosive || (OriginalLocation == vect(0,0,0) && ArmDistSquared > 0)))
    {
        // Don't touch the same actor multiple time's immediately after just
        // touching it if the TouchTimeThreshhold is set to greater than 0.
        // This was causing projectiles just to "stop" sometimes when hitting
        // dead/ragdolled pawns because it was counting as multiple penetrations
        if( LastTouched.Actor == Other && TouchTimeThreshhold > 0
            && (WorldInfo.TimeSeconds - LastTouched.Time) <= TouchTimeThreshhold )
        {
            return;
        }

		//TODO: Add an impact sound here
		SetIsDud(bWantsClientSideDudHit, HitNormal);

		if (Other != Instigator && !Other.bStatic && Other.GetTeamNum() != GetTeamNum() && !CheckRepeatingTouch(Other))
		{
			ProcessBulletTouch(Other, HitLocation, HitNormal);
		}
		// Reflect off Wall w/damping
		VNorm = (Velocity dot HitNormal) * HitNormal;
		Velocity = -VNorm * DampenFactor + (Velocity - VNorm) * DampenFactorParallel;
		Speed = VSize(Velocity);
    }
	if (!bDud && !bIsTimedExplosive)
	{
        // Process impact hits
    	if (Other != Instigator && !Other.bStatic)
    	{
			// check/ignore repeat touch events
			if( !CheckRepeatingTouch(Other) && Other.GetTeamNum() != GetTeamNum())
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

/** Handle bullet collision and damage */
simulated function ProcessBulletTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if (ImpactList.Find(Other) != INDEX_NONE)
	{
		return;
	}
	if (Other != none)
	{
		ImpactList.AddItem(Other);
	}

	super.ProcessBulletTouch(Other, HitLocation, HitNormal);
}

simulated function SetIsDud(bool bWantsClientSideDudHit, vector HitNormal)
{
	bDud = true;

	if (bWantsClientSideDudHit)
	{
		bClientDudHit = true;
	}
	LifeSpan = 1.0;
	SetPhysics(PHYS_Falling);
	GravityScale = 1.0;

	// Replace the flying effects with the dud mesh effects
	StopFlightEffects();
	ProjFlightTemplate = ProjDudTemplate;
	ProjFlightTemplateZedTime = ProjDudTemplate;
	SpawnFlightEffects();
	OnDudEffect();
}

simulated function OnDudEffect();

/** Returns a list of hitzone impacts for a collision with a given pawn
* @note: To trace the PhysicsAsset the pawn cylinder should have BlockZeroExtent=FALSE
*/
simulated function bool TraceProjHitZones(Pawn P, vector EndTrace, vector StartTrace, out array<ImpactInfo> out_Hits)
{
	local vector ClosestHit, Direction;

	Super.TraceProjHitZones(P, EndTrace, StartTrace, out_Hits);

	// If we didn't hit anything, that means we hit the big cylinder but
	// missed the body. Just grab the nearest bone and hit that
    if( bDud && out_Hits.length == 0 )
	{
		P.Mesh.FindClosestBone(StartTrace, ClosestHit);

		if( !IsZero(ClosestHit) )
		{
            StartTrace = ClosestHit;
			Direction = Normal(ClosestHit-StartTrace);
			EndTrace = StartTrace + Direction * (P.CylinderComponent.CollisionRadius * 6.0);

			Super.TraceProjHitZones(P, EndTrace, StartTrace, out_Hits);
		}
	}

    return out_Hits.Length > 0;
}

// for nukes && concussive force
simulated protected function PrepareExplosionTemplate()
{
    class'KFPerk_Demolitionist'.static.PrepareExplosive( Instigator, self );

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
   DampenFactor=0.025000
   DampenFactorParallel=0.050000
   WallHitDampenFactor=0.025000
   WallHitDampenFactorParallel=0.050000
   LandedTranslationOffset=(X=2.000000,Y=0.000000,Z=0.000000)
   bSyncToOriginalLocation=True
   bSyncToThirdPersonMuzzleLocation=True
   bUseClientSideHitDetection=True
   bDamageDestructiblesOnTouch=True
   bReplicateLocationOnExplosion=True
   bValidateExplosionNormalOnClient=True
   bAlwaysReplicateDisintegration=True
   bAlwaysReplicateExplosion=True
   bCanDisintegrate=True
   bAutoStartAmbientSound=True
   bStopAmbientSoundOnExplode=True
   AlwaysRelevantDistanceSquared=6250000.000000
   GlassShatterType=FMGS_ShatterAll
   TouchTimeThreshhold=0.150000
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   bBlockedByInstigator=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=5.000000
      CollisionRadius=5.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   bNetTemporary=False
   bCollideComplex=True
   bBounce=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_BallisticExplosive"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
