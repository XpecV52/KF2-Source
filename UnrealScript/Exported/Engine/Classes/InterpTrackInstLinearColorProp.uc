/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstLinearColorProp extends InterpTrackInstProperty
	native(Interpolation);


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Pointer to color property in TrackObject. */
var	pointer		ColorProp; 

/** Saved value for restoring state when exiting Matinee. */
var	linearcolor		ResetColor;

defaultproperties
{
   ResetColor=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   Name="Default__InterpTrackInstLinearColorProp"
   ObjectArchetype=InterpTrackInstProperty'Engine.Default__InterpTrackInstProperty'
}
