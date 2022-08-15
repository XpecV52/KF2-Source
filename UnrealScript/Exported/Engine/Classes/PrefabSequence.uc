/**
 * Sequence for a PrefabInstance.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class PrefabSequence extends Sequence
	native(inherit);

/**
 * the PrefabInstance actor that created this PrefabSequence.
 */
var		protected{protected}	PrefabInstance	OwnerPrefab;

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

/**
 * Accessor for setting the value of OwnerPrefab.
 *
 * @param	InOwner		the PrefabInstance that created this PrefabSequence.
 */
native final function SetOwnerPrefab( PrefabInstance InOwner );

/**
 * Wrapper for retrieving the current value of OwnerPrefab.
 *
 * @return	a reference to the PrefabInstance that created this PrefabSequence
 */
native final function PrefabInstance GetOwnerPrefab() const;

defaultproperties
{
   ObjName="PrefabSequence"
   bDeletable=False
   Name="Default__PrefabSequence"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
}
