//=============================================================================
// KFProj_NailShard
//=============================================================================
// Nail fragment projectie
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFProj_NailShard extends KFProj_Nail_Nailgun
	hidedropdown;

defaultproperties
{
   bSyncToThirdPersonMuzzleLocation=False
   bNoReplicationToInstigator=False
   bReplicateClientHitsAsFragments=True
   ProjFlightTemplate=ParticleSystem'WEP_Nailbomb_EMIT.FX_Nailbomb_Tracer'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_Nailbomb_EMIT.FX_Nailbomb_Tracer_ZEDTime'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_Nail_Nailgun:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_Nail_Nailgun:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=5000.000000
   MaxSpeed=5000.000000
   Damage=35.000000
   MyDamageType=Class'kfgamecontent.KFDT_Piercing_NailFragment'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_Nail_Nailgun:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_Nail_Nailgun:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_NailShard"
   ObjectArchetype=KFProj_Nail_Nailgun'kfgamecontent.Default__KFProj_Nail_Nailgun'
}
