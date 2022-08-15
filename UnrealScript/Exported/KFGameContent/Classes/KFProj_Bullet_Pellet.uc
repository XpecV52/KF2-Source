//=============================================================================
// KFProj_Bullet_Pellet
//=============================================================================
// Shotgun pellet class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_Pellet extends KFProj_Bullet
	hidedropdown;

defaultproperties
{
   ProjFlightTemplate=ParticleSystem'WEP_1P_MB500_EMIT.FX_MB500_Tracer'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_1P_MB500_EMIT.FX_MB500_Tracer_ZEDTime'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=7000.000000
   MaxSpeed=7000.000000
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
   Name="Default__KFProj_Bullet_Pellet"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}
