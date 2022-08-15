/**
 * Computes doppler pitch shift
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SoundNodeDoppler extends SoundNode
	native( Sound )
	hidecategories( Object )
	editinlinenew;

/** Scales the magnitude of the pitch shift.  1.0 is normal. */
var(Doppler) float DopplerIntensity<ToolTip=How much to scale the doppler shift (1.0 is normal)>;

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
   DopplerIntensity=1.000000
   Name="Default__SoundNodeDoppler"
   ObjectArchetype=SoundNode'Engine.Default__SoundNode'
}
