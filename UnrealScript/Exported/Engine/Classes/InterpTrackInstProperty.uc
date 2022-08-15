/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstProperty extends InterpTrackInst
	native(Interpolation);

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


/** Function to call after updating the value of the color property. */
var function	PropertyUpdateCallback;

/** Pointer to the UObject instance that is the outer of the color property we are interpolating on, this is used to process the property update callback. */
var object		PropertyOuterObjectInst;

defaultproperties
{
   Name="Default__InterpTrackInstProperty"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
