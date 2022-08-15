/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InstancedFoliageActor extends Actor
	native(Foliage)
	hidecategories(Object);

var	const native Map_Mirror FoliageMeshes{TMap<class UStaticMesh*, struct FFoliageMeshInfo>};

/** The static mesh type that will be used to show the widget */
var const transient StaticMesh SelectedMesh;

/* Used during gameplay to simplify RTGC */
var const transient array<InstancedStaticMeshComponent> InstancedStaticMeshComponents;

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
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   CollisionType=COLLIDE_CustomDefault
   bStatic=True
   bCollideActors=True
   bBlockActors=True
   Name="Default__InstancedFoliageActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
