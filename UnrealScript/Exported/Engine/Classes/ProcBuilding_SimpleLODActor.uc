//=============================================================================
// Used as a simple, one-mesh LOD for a procedural building
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class ProcBuilding_SimpleLODActor extends StaticMeshActor
	native(ProcBuilding);

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__StaticMeshActor:StaticMeshComponent0'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      bUsePrecomputedShadows=True
      bDisableAllRigidBody=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      RBCollideWithChannels=(Visibility=True)
      bAcceptReflections=True
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Components(0)=StaticMeshComponent0
   CollisionType=COLLIDE_CustomDefault
   BlockRigidBody=False
   bCollideActors=False
   bBlockActors=False
   CollisionComponent=StaticMeshComponent0
   Name="Default__ProcBuilding_SimpleLODActor"
   ObjectArchetype=StaticMeshActor'Engine.Default__StaticMeshActor'
}
