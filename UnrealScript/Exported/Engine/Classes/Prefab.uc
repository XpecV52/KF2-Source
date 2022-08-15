/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class Prefab extends Object
	native(Prefab);

/** Version number of this prefab. */
var		const int						PrefabVersion;

/** Array of archetypes, one for each object in the prefab. */
var		const array<Object>				PrefabArchetypes;

/** Array of archetypes that used to be in this Prefab, but no longer are. */
var		const array<Object>				RemovedArchetypes;

/** The Kismet sequence that associated with this Prefab. */
var		const PrefabSequence			PrefabSequence;

/** Snapshot of Prefab used for thumbnail in the browser. */
var		editoronly const Texture2D		PrefabPreview;

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
   Name="Default__Prefab"
   ObjectArchetype=Object'Core.Default__Object'
}
