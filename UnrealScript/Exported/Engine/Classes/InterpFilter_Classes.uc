/** 
 * InterpFilter_Classes.uc: Filter class for filtering matinee groups.  
 * Used by the matinee editor to filter groups to specific classes of attached actors.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class InterpFilter_Classes extends InterpFilter
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

/** Which class to filter groups by. */
var editoronly class<Object>	ClassToFilterBy;

/** List of allowed track classes.  If empty, then all track classes will be included.  Only groups that
	contain at least one of these types of tracks will be displayed. */
var editoronly array< class<Object>	>	TrackClasses;

defaultproperties
{
   Name="Default__InterpFilter_Classes"
   ObjectArchetype=InterpFilter'Engine.Default__InterpFilter'
}
