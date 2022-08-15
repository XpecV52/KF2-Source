/**
 * Keyframe reduction algorithm that simply removes keys which are linear interpolations of surrounding keys.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class AnimationCompressionAlgorithm_RemoveLinearKeys extends AnimationCompressionAlgorithm
	native(Anim);

/** Maximum position difference to use when testing if an animation key may be removed. Lower values retain more keys, but yield less compression. */
var(LinearKeyRemoval)	float	MaxPosDiff;

/** Maximum angle difference to use when testing if an animation key may be removed. Lower values retain more keys, but yield less compression. */
var(LinearKeyRemoval)	float	MaxAngleDiff;

/** 
 * As keys are tested for removal, we monitor the effects all the way down to the end effectors. 
 * If their position changes by more than this amount as a result of removing a key, the key will be retained.
 * This value is used for all bones except the end-effectors parent.
 */
var(LinearKeyRemoval)	float	MaxEffectorDiff;

/** 
 * As keys are tested for removal, we monitor the effects all the way down to the end effectors. 
 * If their position changes by more than this amount as a result of removing a key, the key will be retained.
 * This value is used for the end-effectors parent, allowing tighter restrictions near the end of a skeletal chain.
 */
var(LinearKeyRemoval)	float	MinEffectorDiff;

/** 
 * Error threshold for End Effectors with Sockets attached to them.
 * Typically more important bone, where we want to be less aggressive with compression.
 */
var(LinearKeyRemoval)   float   EffectorDiffSocket;

/** 
 * A scale value which increases the likelihood that a bone will retain a key if it's parent also had a key at the same time position. 
 * Higher values can remove shaking artifacts from the animation, at the cost of compression.
 */
var(LinearKeyRemoval)	float	ParentKeyScale;

/** 
 * TRUE = As the animation is compressed, adjust animated nodes to compensate for compression error.
 * FALSE= Do not adjust animated nodes.
 */
var(LinearKeyRemoval)	bool	bRetarget;

/**
  * Controls whether the final filtering step will occur, or only the retargetting after bitwise compression.
  * If both this and bRetarget are false, then the linear compressor will do no better than the underlying bitwise compressor, extremely slowly.
  */
var(LinearKeyRemoval)	bool	bActuallyFilterLinearKeys;

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
   MaxPosDiff=0.001000
   MaxAngleDiff=0.000750
   MaxEffectorDiff=0.001000
   MinEffectorDiff=0.001000
   EffectorDiffSocket=0.001000
   ParentKeyScale=2.000000
   bRetarget=True
   bActuallyFilterLinearKeys=True
   Description="Remove Linear Keys"
   bNeedsSkeleton=True
   Name="Default__AnimationCompressionAlgorithm_RemoveLinearKeys"
   ObjectArchetype=AnimationCompressionAlgorithm'Engine.Default__AnimationCompressionAlgorithm'
}
