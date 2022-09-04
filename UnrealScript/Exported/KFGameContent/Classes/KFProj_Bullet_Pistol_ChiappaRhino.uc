//=============================================================================
// KFProj_Bullet_Pistol_ChiappaRhino
//=============================================================================
// Bullet class for Desert Eagle pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_Pistol_ChiappaRhino extends KFProj_Bullet
    hidedropdown;

defaultproperties
{
   bSpawnShrapnel=True
   ProjFlightTemplate=ParticleSystem'FX_Projectile_EMIT.FX_Tracer_9MM_ZEDTime'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   NumSpawnedShrapnel=3
   ShrapnelClass=Class'kfgamecontent.KFProj_Bullet_Pistol_ChiappaRhinoShrapnel'
   ShrapnelSpreadWidthEnvironment=0.500000
   ShrapnelSpreadHeightEnvironment=0.500000
   ShrapnelSpreadWidthZed=0.500000
   ShrapnelSpreadHeightZed=0.500000
   ShrapnelSpawnSoundEvent=AkEvent'WW_WEP_ChiappaRhinos.Play_WEP_ChiappaRhinos_Bullet_Fragmentation'
   ShrapnelSpawnVFX=ParticleSystem'WEP_ChiappaRhino_EMIT.FX_ChiappaRhino_Shrapnel_Hit'
   Speed=18000.000000
   MaxSpeed=18000.000000
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
   Name="Default__KFProj_Bullet_Pistol_ChiappaRhino"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}
