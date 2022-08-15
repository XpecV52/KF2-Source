//=============================================================================
// KFProj_GrenadeShard
//=============================================================================
// Grenade fragment projectie
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_GrenadeShard extends KFProj_RicochetBullet
	hidedropdown;

simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
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

        Explode(Location, HitNormal);
        ImpactedActor = None;

        bBounce = false;
    }
}

//==============
// Touching
// Overriden to get nails bouncing off of destructible meshes
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
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

defaultproperties
{
	MaxSpeed=4000.0
	Speed=4000.0

    Damage=50
	DamageRadius=0
	MyDamageType=class'KFDT_Piercing_NadeFragment'
	MomentumTransfer=1.f

	bSyncToOriginalLocation=True
	bSyncToThirdPersonMuzzleLocation=false
	bNoReplicationToInstigator=false
    bReplicateClientHitsAsFragments=true

    BouncesLeft=2
    DampingFactor=0.65
    RicochetEffects=KFImpactEffectInfo'WEP_Nail_Shotgun_ARCH.NailBulletImpacts'

	ProjFlightTemplate=ParticleSystem'WEP_1P_Nail_Shotgun_EMIT.FX_Nail_Shotgun_Tracer'
	ProjFlightTemplateZedTime=ParticleSystem'WEP_1P_Nail_Shotgun_EMIT.FX_Nail_Shotgun_Tracer_ZEDTime'
}


