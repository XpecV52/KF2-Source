class InterpTrackInstAnimControl extends InterpTrackInst
	native(Interpolation);
	
/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var	transient float			LastUpdatePosition;

var editoronly transient vector        InitPosition; 
var editoronly transient rotator       InitRotation;

defaultproperties
{
   Name="Default__InterpTrackInstAnimControl"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
