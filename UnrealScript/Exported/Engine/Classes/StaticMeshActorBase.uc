/**
 * Base class for static actors which contain StaticMeshComponents.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class StaticMeshActorBase extends Actor
	ClassGroup(StaticMeshes)
	native
	abstract;

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
   bWorldGeometry=True
   bRouteBeginPlayEvenIfStatic=False
   bGameRelevant=True
   bMovable=False
   bCollideActors=True
   bBlockActors=True
   bEdShouldSnap=True
   Name="Default__StaticMeshActorBase"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
