//=============================================================================
// KFProj_Nail_Nailgun
//=============================================================================
// Nail class for the the Nailgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_Nail_Nailgun extends KFProj_PinningBullet
	hidedropdown;

simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
    // Don't bounce any more if being used to pin a zed
    if( bSpawnedForPin )
    {
        BouncesLeft=0;
    }

	SetRotation(rotator(Normal(Velocity)));
    SetPhysics(PHYS_Falling);

    // check if we should do a bounce, otherwise stick
    if( !Bounce(HitNormal, Wall) )
    {
        // Turn off the corona when it stops
    	if ( WorldInfo.NetMode != NM_DedicatedServer && ProjEffects!=None )
    	{
            ProjEffects.DeactivateSystem();
        }

        // if our last hit is a destructible, don't stick
        if ( !Wall.bStatic && !Wall.bWorldGeometry && Wall.bProjTarget )
    	{
            Explode(Location, HitNormal);
            ImpactedActor = None;
    	}
        else
        {
        	// Play the bullet impact sound and effects
        	if ( WorldInfo.NetMode != NM_DedicatedServer )
        	{
        		`ImpactEffectManager.PlayImpactEffects(Location, Instigator, HitNormal);
        	}

            SetPhysics(PHYS_None);
            LifeSpan = 5.0;

        	// Stop ambient sounds when this projectile ShutsDown
        	if( bStopAmbientSoundOnExplode && AmbientSoundStopEvent != none && AmbientComponent != none )
        	{
                AmbientComponent.StopEvents();
        	}

			//@todo: check for pinned victim
        }

        bBounce = false;
    }
}

//==============
// Touching
// Overriden to get nails bouncing off of destructible meshes
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    // @todo: Implement functionality properly choosing which actors to
    // ProcessTouch for when this projectile is being used to pin ragdolls

	if ( Other != Instigator && !Other.bWorldGeometry && Other.bCanBeDamaged )
	{
		if ( Pawn(other) != None )
		{
            Super.ProcessTouch(Other, HitLocation, HitNormal);
		}
		else
        {
            ProcessDestructibleTouchOnBounce( Other, HitLocation, HitNormal );
        }
	}
	else
	{
        Super.ProcessTouch(Other, HitLocation, HitNormal);;
	}
}

simulated function Tick( float DeltaTime )
{
    super.Tick(DeltaTime);

    if ( WorldInfo.NetMode != NM_DedicatedServer && Physics != PHYS_None )
    {
        SetRotation(Rotator(Normal(Velocity)));
    }
}

simulated function Landed( Vector HitNormal, actor FloorActor )
{
    // Turn off the corona when it stops
	if ( WorldInfo.NetMode != NM_DedicatedServer && ProjEffects!=None )
	{
        ProjEffects.DeactivateSystem();
    }

    SetPhysics(PHYS_None);
    LifeSpan = 5.0;

	// Stop ambient sounds when this projectile ShutsDown
	if( bStopAmbientSoundOnExplode && AmbientSoundStopEvent != none && AmbientComponent != none )
	{
        AmbientComponent.StopEvents();
	}
}

defaultproperties
{
	MaxSpeed=7000.0
	Speed=7000.0

	DamageRadius=0

    BouncesLeft=2
    DampingFactor=0.65
    RicochetEffects=KFImpactEffectInfo'WEP_Nail_Shotgun_ARCH.NailBulletImpacts'

	ProjFlightTemplate=ParticleSystem'WEP_1P_Nail_Shotgun_EMIT.FX_Nail_Shotgun_Tracer'
	ProjFlightTemplateZedTime=ParticleSystem'WEP_1P_Nail_Shotgun_EMIT.FX_Nail_Shotgun_Tracer_ZEDTime'
}


