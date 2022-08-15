//=============================================================================
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class FracturedStaticMeshActor_Spawnable extends FracturedStaticMeshActor;

defaultproperties
{
   Begin Object Class=FracturedStaticMeshComponent Name=FracturedStaticMeshComponent0 Archetype=FracturedStaticMeshComponent'Engine.Default__FracturedStaticMeshActor:FracturedStaticMeshComponent0'
      bUseDynamicIBWithHiddenFragments=True
      WireframeColor=(B=255,G=128,R=0,A=255)
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      Name="FracturedStaticMeshComponent0"
      ObjectArchetype=FracturedStaticMeshComponent'Engine.Default__FracturedStaticMeshActor:FracturedStaticMeshComponent0'
   End Object
   FracturedStaticMeshComponent=FracturedStaticMeshComponent0
   Begin Object Class=FracturedSkinnedMeshComponent Name=FracturedSkinnedComponent0 Archetype=FracturedSkinnedMeshComponent'Engine.Default__FracturedStaticMeshActor:FracturedSkinnedComponent0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__FracturedStaticMeshActor_Spawnable:LightEnvironment0'
      bDisableAllRigidBody=True
      Name="FracturedSkinnedComponent0"
      ObjectArchetype=FracturedSkinnedMeshComponent'Engine.Default__FracturedStaticMeshActor:FracturedSkinnedComponent0'
   End Object
   SkinnedComponent=FracturedSkinnedComponent0
   Components(0)=FracturedSkinnedComponent0
   Components(1)=FracturedStaticMeshComponent0
   bNoDelete=False
   CollisionComponent=FracturedStaticMeshComponent0
   Name="Default__FracturedStaticMeshActor_Spawnable"
   ObjectArchetype=FracturedStaticMeshActor'Engine.Default__FracturedStaticMeshActor'
}
