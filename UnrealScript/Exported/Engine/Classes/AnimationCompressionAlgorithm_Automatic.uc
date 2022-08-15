/**
 * Animation compression algorithm that is just a shell for trying the range of other compression schemes and pikcing the
 * smallest result within a configurable error threshold.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class AnimationCompressionAlgorithm_Automatic extends AnimationCompressionAlgorithm
	hidecategories(AnimationCompressionAlgorithm)
	native(Anim);

/** Maximum amount of error that a compression technique can introduce in an end effector */
var() float	MaxEndEffectorError;

var() bool bTryFixedBitwiseCompression;
var() bool bTryPerTrackBitwiseCompression;
var() bool bTryLinearKeyRemovalCompression;
var() bool bTryIntervalKeyRemoval;

var() bool bRunCurrentDefaultCompressor;

var() bool bAutoReplaceIfExistingErrorTooGreat;
var() bool bRaiseMaxErrorToExisting;

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
   MaxEndEffectorError=1.000000
   bTryFixedBitwiseCompression=True
   bTryPerTrackBitwiseCompression=True
   bTryLinearKeyRemovalCompression=True
   bTryIntervalKeyRemoval=True
   Description="Automatic"
   Name="Default__AnimationCompressionAlgorithm_Automatic"
   ObjectArchetype=AnimationCompressionAlgorithm'Engine.Default__AnimationCompressionAlgorithm'
}
