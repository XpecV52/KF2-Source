/**
 * This is a special type of actor used as the container for a large number of StaticMeshComponents on the console.  This
 * actor is created only during the console cooking process so cannot be placed by designers in the editor.  It replaces
 * multiple normal StaticMeshActors in content which has been cooked for the a console platform, becoming the owner for
 * those StaticMeshActors' StaticMeshComponent.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class StaticMeshCollectionActor extends StaticMeshActorBase
	native
	config(Engine);

/**
 * Since the components array is only serialized during make, we need to store the components we contain in a separate array.
 */
var	const	array<StaticMeshComponent>	StaticMeshComponents;

/**
 * The maximum number of StaticMeshComponents that can be attached to this actor.  Once this number has been reached, a
 * new StaticMeshCollectionActor will be created.
 */
var	config	int							MaxStaticMeshComponents;

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
   MaxStaticMeshComponents=100
   Name="Default__StaticMeshCollectionActor"
   ObjectArchetype=StaticMeshActorBase'Engine.Default__StaticMeshActorBase'
}
