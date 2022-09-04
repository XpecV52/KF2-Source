//=============================================================================
// KFProj_Nail_HRGNailgun
//=============================================================================
// Nail class for the the HRG Nailgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFProj_Nail_HRGNailgun extends KFProj_Nail_Nailgun
	hidedropdown;

defaultproperties
{
   BouncesLeft=1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_Nail_Nailgun:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_Nail_Nailgun:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=22500.000000
   MaxSpeed=22500.000000
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
   LifeSpan=2.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Nail_HRGNailgun"
   ObjectArchetype=KFProj_Nail_Nailgun'kfgamecontent.Default__KFProj_Nail_Nailgun'
}
