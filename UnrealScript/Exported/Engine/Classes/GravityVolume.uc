/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class GravityVolume extends PhysicsVolume
	native
	placeable;

/**
 *	Simple PhysicsVolume that modifies the gravity inside it.
 */

/** Gravity along Z axis applied to objects inside this volume. */
var()	float	GravityZ;
/** Scaling GravityZ and being used different function (GetGravityZHuman) to retrieve GravityZ */
var()	float	ScaleGravityHuman;
/** Scaling GravityZ and being used different function (GetGravityZMonster) to retrieve GravityZ */
var()	float	ScaleGravityMonster;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   GravityZ=-520.000000
   ScaleGravityHuman=1.000000
   ScaleGravityMonster=1.000000
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionComponent=BrushComponent0
   Name="Default__GravityVolume"
   ObjectArchetype=PhysicsVolume'Engine.Default__PhysicsVolume'
}
