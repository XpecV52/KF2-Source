/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class CullDistanceVolume extends Volume
	native
	hidecategories(Advanced,Attachment,Collision,Volume)
	placeable;

/**
 * Helper structure containing size and cull distance pair.
 */
struct native CullDistanceSizePair
{
	/** Size to associate with cull distance. */
	var() float Size;
	/** Cull distance associated with size. */
	var() float CullDistance;
};

/**
 * Array of size and cull distance pairs. The code will calculate the sphere diameter of a primitive's BB and look for a best
 * fit in this array to determine which cull distance to use.
 */
var() array<CullDistanceSizePair> CullDistances;

/**
 * Whether the volume is currently enabled or not.
 */
var() bool bEnabled;

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
   CullDistances(1)=(Size=10000.000000)
   bEnabled=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_NoCollision
   bCollideActors=False
   CollisionComponent=BrushComponent0
   Name="Default__CullDistanceVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
