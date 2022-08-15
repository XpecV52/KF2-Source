//=============================================================================
// Copyright 1998-2012 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class FlexActor extends InterpActor
	native
	placeable;

defaultproperties
{
   Begin Object Class=FlexComponent Name=FlexComponent0
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__FlexActor:MyLightEnvironment'
      BlockRigidBody=False
      Name="FlexComponent0"
      ObjectArchetype=FlexComponent'Engine.Default__FlexComponent'
   End Object
   StaticMeshComponent=FlexComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__InterpActor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__InterpActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=FlexComponent0
   CollisionType=COLLIDE_CustomDefault
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__InterpActor:StaticMeshComponent0'
      WireframeColor=(B=255,G=0,R=255,A=255)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__FlexActor:MyLightEnvironment'
      BlockRigidBody=False
      RBCollideWithChannels=(Default=True,BlockingVolume=True)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__InterpActor:StaticMeshComponent0'
   End Object
   CollisionComponent=StaticMeshComponent0
   Name="Default__FlexActor"
   ObjectArchetype=InterpActor'Engine.Default__InterpActor'
}
