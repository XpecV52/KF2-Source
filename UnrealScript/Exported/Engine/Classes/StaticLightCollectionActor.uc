/**
 * This is a special type of actor used as the container for a large number of LightComponents on the console.  This
 * actor is created only during the console cooking process so cannot be placed by designers in the editor.  It replaces
 * multiple normal static Light actors in content which has been cooked for the a console platform, becoming the owner for
 * those Light's LightComponent.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class StaticLightCollectionActor extends Light
	native(Light)
	config(Engine);

/**
 * Since the components array is only serialized during make, we need to store the components we contain in a separate array.
 */
var	const	array<LightComponent>	LightComponents;

/**
 * The maximum number of LightComponents that can be attached to this actor.  Once this number has been reached, a
 * new StaticLightCollectionActor will be created.
 */
var	config	int						MaxLightComponents;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   MaxLightComponents=100
   Begin Object Class=StaticMeshComponent Name=LightMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__Light:LightMeshComponent0'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bOverridePrecomputedShadowOcclusion=True
      Name="LightMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__Light:LightMeshComponent0'
   End Object
   LightMesh=LightMeshComponent0
   Begin Object Class=LensFlareComponent Name=LensFlareComponent0 Archetype=LensFlareComponent'Engine.Default__Light:LensFlareComponent0'
      NextTraceTime=0.0 // Ka v oh
      ReplacementPrimitive=None
      Name="LensFlareComponent0"
      ObjectArchetype=LensFlareComponent'Engine.Default__Light:LensFlareComponent0'
   End Object
   LensFlareComp=LensFlareComponent0
   BlockRigidBody=False
   CollisionComponent=LightMeshComponent0
   Name="Default__StaticLightCollectionActor"
   ObjectArchetype=Light'Engine.Default__Light'
}
