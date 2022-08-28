//=============================================================================
// KFProj_Bullet_M99
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_M99 extends KFProj_Bullet
	hidedropdown;

defaultproperties
{
   ProjFlightTemplate=ParticleSystem'wep_railgun_emit.FX_Railgun_Projectile_01'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
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
   Name="Default__KFProj_Bullet_M99"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}
