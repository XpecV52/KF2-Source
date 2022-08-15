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
   RicochetEffects=KFImpactEffectInfo'WEP_Nail_Shotgun_ARCH.NailBulletImpacts'
   bSyncToThirdPersonMuzzleLocation=False
   bNoReplicationToInstigator=False
   bReplicateClientHitsAsFragments=True
   ProjFlightTemplate=ParticleSystem'WEP_1P_Nail_Shotgun_EMIT.FX_Nail_Shotgun_Tracer'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_1P_Nail_Shotgun_EMIT.FX_Nail_Shotgun_Tracer_ZEDTime'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_RicochetBullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_RicochetBullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=4000.000000
   MaxSpeed=4000.000000
   Damage=50.000000
   MyDamageType=Class'KFGameContent.KFDT_Piercing_NadeFragment'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_RicochetBullet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_RicochetBullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_GrenadeShard"
   ObjectArchetype=KFProj_RicochetBullet'KFGame.Default__KFProj_RicochetBullet'
}
