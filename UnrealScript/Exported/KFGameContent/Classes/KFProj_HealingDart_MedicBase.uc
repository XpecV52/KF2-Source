//=============================================================================
// KFProj_HealingDart_MedicBase
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFProj_HealingDart_MedicBase extends KFProj_HealingDart;

defaultproperties
{
   ProjFlightTemplate=ParticleSystem'FX_Projectile_EMIT.FX_Medic_dart_01'
   ProjFlightTemplateZedTime=ParticleSystem'FX_Projectile_EMIT.FX_Medic_dart_01'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Loop'
   AmbientSoundStopEvent=AkEvent'WW_WEP_SA_MedicDart.Stop_WEP_SA_Medic_Dart_Loop'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_HealingDart:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_HealingDart:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_HealingDart:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_HealingDart:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_HealingDart_MedicBase"
   ObjectArchetype=KFProj_HealingDart'KFGame.Default__KFProj_HealingDart'
}
