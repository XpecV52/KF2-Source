/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstBoolProp extends InterpTrackInstProperty
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
// (cpptext)
// (cpptext)
// (cpptext)

/** Pointer to boolean property in TrackObject. */
var	pointer		BoolProp; 

/** Mask that indicates which bit the boolean property actually uses of the value pointed to by BoolProp. */
var int			BitMask;

/** Saved value for restoring state when exiting Matinee. */
var	bool		ResetBool;

defaultproperties
{
   Name="Default__InterpTrackInstBoolProp"
   ObjectArchetype=InterpTrackInstProperty'Engine.Default__InterpTrackInstProperty'
}
