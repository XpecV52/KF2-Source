//=============================================================================
// KFWaterMeshActor
//=============================================================================
// A custom StaticMeshActor with bWorldGeometry == FALSE, so that
// we can use touch events for pass through hit effects
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFWaterMeshActor extends StaticMeshActor;

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__StaticMeshActor:StaticMeshComponent0'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      bUsePrecomputedShadows=True
      BlockActors=False
      BlockNonZeroExtent=False
      BlockRigidBody=False
      bBlockFootPlacement=False
      RBCollideWithChannels=(Visibility=True)
      bAcceptReflections=True
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Components(0)=StaticMeshComponent0
   CollisionType=COLLIDE_TouchWeapons
   bWorldGeometry=False
   BlockRigidBody=False
   bBlockActors=False
   bProjTarget=True
   CollisionComponent=StaticMeshComponent0
   Name="Default__KFWaterMeshActor"
   ObjectArchetype=StaticMeshActor'Engine.Default__StaticMeshActor'
}
