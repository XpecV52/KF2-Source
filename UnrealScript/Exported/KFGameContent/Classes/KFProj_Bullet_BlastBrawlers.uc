//=============================================================================
// KFProj_Bullet_BlastBrawlers
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_BlastBrawlers extends KFProj_Bullet_Pellet
	hidedropdown;

defaultproperties
{
   ProjFlightTemplate=ParticleSystem'WEP_HRG_BlastBrawlers_EMIT.FX_BlastBrawlers_Tracer_Instant'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_HRG_BlastBrawlers_EMIT.FX_BlastBrawlers_Tracer_Instant'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_HRG_BlastBrawlers_ARCH.HRG_BlastBrawler_Projectile_Impacts'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bullet_BlastBrawlers"
   ObjectArchetype=KFProj_Bullet_Pellet'kfgamecontent.Default__KFProj_Bullet_Pellet'
}
