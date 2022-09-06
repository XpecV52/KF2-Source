//=============================================================================
// KFProj_Bullet_HRGTeslauncher
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_HRGTeslauncher extends KFProj_Bullet_AssaultRifle;

defaultproperties
{
   ProjFlightTemplate=ParticleSystem'WEP_Microwave_Assault_EMIT.FX_Microwave_Rifle_Projectile'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_Bullet_AssaultRifle:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_Bullet_AssaultRifle:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_Microwave_Assault_ARCH.Microwave_Assault_bullet_impact'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_Bullet_AssaultRifle:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_Bullet_AssaultRifle:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bullet_HRGTeslauncher"
   ObjectArchetype=KFProj_Bullet_AssaultRifle'kfgamecontent.Default__KFProj_Bullet_AssaultRifle'
}
