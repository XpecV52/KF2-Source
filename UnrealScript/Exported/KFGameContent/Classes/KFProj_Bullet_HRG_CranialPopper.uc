//=============================================================================
// KFProj_Bullet_HRG_CranialPopper
//=============================================================================
// Bullet class for the HRG CranialPopper
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_HRG_CranialPopper extends KFProj_Bullet
    hidedropdown;

defaultproperties
{
   ProjFlightTemplate=ParticleSystem'WEP_HRG_CranialPopper_EMIT.FX_CranialPopper_Projectile'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_HRG_CranialPopper_ARCH.Bleeder_bullet_impact'
   Speed=30000.000000
   MaxSpeed=30000.000000
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
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bullet_HRG_CranialPopper"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}
