/**
 * Removes trivial frames -- frames of tracks when position or orientation is constant
 * over the entire animation -- from the raw animation data.  If both position and rotation
 * go down to a single frame, the time is stripped out as well.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class AnimationCompressionAlgorithm_RemoveTrivialKeys extends AnimationCompressionAlgorithm
	native(Anim);

var()	float	MaxPosDiff;
var()	float	MaxAngleDiff;

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
   MaxPosDiff=0.000100
   MaxAngleDiff=0.000300
   Description="Remove Trivial Keys"
   Name="Default__AnimationCompressionAlgorithm_RemoveTrivialKeys"
   ObjectArchetype=AnimationCompressionAlgorithm'Engine.Default__AnimationCompressionAlgorithm'
}
