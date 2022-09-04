//=============================================================================
// KFProj_Bullet_Pistol_ChiappaRhinoShrapnel
//=============================================================================
// Bullet class for Desert Eagle pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_Pistol_ChiappaRhinoShrapnel extends KFProj_Bullet
    hidedropdown;

defaultproperties
{
   bSyncToThirdPersonMuzzleLocation=False
   bNoReplicationToInstigator=False
   bReplicateClientHitsAsFragments=True
   ProjFlightTemplate=ParticleSystem'WEP_ChiappaRhino_EMIT.FX_Tracer_ChiappaRhino_ZEDTime'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=18000.000000
   MaxSpeed=18000.000000
   Damage=80.000000
   MyDamageType=Class'kfgamecontent.KFDT_Piercing_ChiappaShrapnel'
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
   Name="Default__KFProj_Bullet_Pistol_ChiappaRhinoShrapnel"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}
