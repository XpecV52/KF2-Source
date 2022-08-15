/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryFracturedStaticMesh extends ActorFactory
	config(Editor)
	native;

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

var()	FracturedStaticMesh		FracturedStaticMesh;
var()	vector			DrawScale3D;

defaultproperties
{
   DrawScale3D=(X=1.000000,Y=1.000000,Z=1.000000)
   MenuName="Add FracturedStaticMesh"
   MenuPriority=35
   NewActorClass=Class'Engine.FracturedStaticMeshActor'
   Name="Default__ActorFactoryFracturedStaticMesh"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
