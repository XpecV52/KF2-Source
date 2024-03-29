//=============================================================================
// KFProj_Bullet_HRG_Energy
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_HRG_Energy extends KFProj_Bullet
	hidedropdown;

defaultproperties
{
   ProjFlightTemplateZedTime=ParticleSystem'WEP_HRG_Energy_EMIT.FX_Energy_Tracer_Instant'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_HRG_Energy_ARCH.Wep_HRG_Energy_Impact'
   Speed=15000.000000
   MaxSpeed=15000.000000
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
   Name="Default__KFProj_Bullet_HRG_Energy"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}
