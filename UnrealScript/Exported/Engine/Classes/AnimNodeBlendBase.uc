/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class AnimNodeBlendBase extends AnimNode
	native(Anim)
	hidecategories(Object)
	abstract;

/** Link to a child AnimNode. */
struct native AnimBlendChild
{
	/** Name of link. */
	var()					Name		Name;
	/** Child AnimNode. */
	var	editinline export	AnimNode	Anim;
	/** Weight with which this child will be blended in. Sum of all weights in the Children array must be 1.0 */
	var						float		Weight;
	/** Weight used for blending. See AnimBlendType. */
	var const transient		float		BlendWeight;
	/**
	 * Whether this child's skeleton should be mirrored.
	 * Do not use this lightly, mirroring is rather expensive.
	 * So minimize the number of times mirroring is done in the tree.
	 */
	var						bool		bMirrorSkeleton;
	/** Is Children Additive Animation. */
	var						bool		bIsAdditive;
	/** For editor use. */
	var	editoronly			int			DrawY;
};

/** Array of children AnimNodes. These will be blended together and the results returned by GetBoneAtoms. */
var	editfixedsize editinline export	array<AnimBlendChild>		Children;

/** Whether children connectors (ie elements of the Children array) may be added/removed. */
var						bool						bFixNumChildren;
/** Type of animation blending. Affects how the weight interpolates. */
var()	AlphaBlendType	BlendType;

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

native function PlayAnim(bool bLoop = false, float Rate = 1.0f, float StartTime = 0.0f);
native function StopAnim();
// calls PlayAnim with the current settings
native function ReplayAnim();

defaultproperties
{
   Name="Default__AnimNodeBlendBase"
   ObjectArchetype=AnimNode'Engine.Default__AnimNode'
}
