/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * This class encapsulates a common interface to extract multiple animation data and blend it.
 */

class AnimNodeSequenceBlendBase extends AnimNodeSequence
	native(Anim)
	abstract;

/**
 * Structure regrouping all we need to extract an animation.
 */
struct native AnimInfo
{
	/** Animation Name */
	var	const				Name			AnimSeqName;
	
	/** 
	 * Pointer to actual AnimSequence. 
	 * Found from SkeletalMeshComponent using AnimSeqName when you call SetAnim. 
	 */
	var	transient const		AnimSequence	AnimSeq;

	/** 
	 * Bone -> Track mapping info for this player node. 
	 * Index into the LinkupCache array in the AnimSet. 
	 * Found from AnimSet when you call SetAnim. 
	 */
	var	transient const		int				AnimLinkupIndex;
};


/**
 * Structure to define animation blending.
 */
struct native AnimBlendInfo
{
	/** Name of animation sequence*/
	var()	Name			AnimName;

	/** Animation info */
	var		AnimInfo		AnimInfo;

	/** Weight i the blend */
	var		transient float	Weight;
};

/** Array of animations to blend */
var(Animations)	editfixedsize editinline export Array<AnimBlendInfo>	Anims;

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
   Anims(0)=
   Anims(1)=()
   Name="Default__AnimNodeSequenceBlendBase"
   ObjectArchetype=AnimNodeSequence'Engine.Default__AnimNodeSequence'
}
