//=============================================================================
// KFProj_RicochetBullet
//=============================================================================
// Class for projectiles that can ricochet off the environment
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFProj_RicochetBullet extends KFProj_Bullet
	abstract;

var int                 BouncesLeft;
var float               DampingFactor;
var KFImpactEffectInfo  RicochetEffects;

/** return true if projectile actually bounced / was allowed to bounce */
simulated function bool Bounce( vector HitNormal, Actor BouncedOff )
{
    if( BouncesLeft > 0 )
    {
        Velocity = DampingFactor * (Velocity - 2.0*HitNormal*(Velocity dot HitNormal));
        BouncesLeft = BouncesLeft - 1;

        if( WorldInfo.NetMode != NM_DedicatedServer )
        {
            // do the impact effects
            KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(Location, Instigator, HitNormal, RicochetEffects, true );
        }

        // also done from ProcessDestructibleTouchOnBounce. update LastBounced to solve problem with bouncing rapidly between world/non-world geometry
        LastBounced.Actor = BouncedOff;
        LastBounced.Time = WorldInfo.TimeSeconds;

        return true;
    }

    return false;
}

defaultproperties
{
   BouncesLeft=2
   DampingFactor=0.650000
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   bBounce=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_RicochetBullet"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}
