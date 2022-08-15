/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class AnimNode extends AnimObject
	native(Anim)
	hidecategories(Object)
	abstract;

/** Enumeration for slider types */
enum ESliderType
{
	ST_1D,
	ST_2D
};

/** Curve Key
 @CurveName	: Morph Target name to blend
 @Weight	: Weight of the Morph Target
**/
struct CurveKey
{
	var name	CurveName;
	var float	Weight;
};

/** This node is considered 'relevant' - that is, has >0 weight in the final blend. */
var	transient const bool				bRelevant;
/** set to TRUE when this node became relevant this round of updates. Will be set to false on the next tick. */
var transient const bool				bJustBecameRelevant;
/** If TRUE, this node will be ticked, even if bPauseAnims is TRUE on the SkelMeshComp. */
var(Performance) bool					bTickDuringPausedAnims;
/** This node is editor only and used for something like placement preview */
var const bool                          bEditorOnly;

/** Used to avoid ticking a node twice if it has multiple parents. */
var	transient const int					NodeTickTag;
/** Initialization tag, for deferred InitAnim. */
var transient const INT                 NodeInitTag;
/** Used to avoid a node triggerring event twice if it has multiple parents. */
var	transient const int					NodeEndEventTick;
/** Index in AnimTick Array. Serialized, because we serialize TickArrayIndex in UAnimTree. */
var const int                           TickArrayIndex;
/** Used to indicate whether the BoneAtom cache for this node is up-to-date or not. */
var transient const int					NodeCachedAtomsTag;

/** Total apparent weight this node has in the final blend of all animations. */
var	const float							NodeTotalWeight;

/** Array of Parent nodes, which in most cases only has 1 element. */
var duplicatetransient Array<AnimNodeBlendBase> ParentNodes;

/** This is the name used to find an AnimNode by name from a tree. */
var() name								NodeName;

/** Temporarily disable caching when calling Super::GetBoneAtoms so it's not done multiple times. */
var const transient bool bDisableCaching;
/** If a node is linked to more than once in the graph, this is a cache of the results, to avoid re-evaluating the results. */
var	transient array<BoneAtom>			CachedBoneAtoms;
/** Num Desired Bones used in CachedBoneAtoms. If we request something different, CachedBoneAtoms array is not going to be valid. */
var transient byte						CachedNumDesiredBones;
/** Cached root motion delta, to avoid recalculating (see above). */
var transient BoneAtom					CachedRootMotionDelta;
/** Cached bool indicating if node supplies root motion, to avoid recalculating (see above). */
var transient int						bCachedHasRootMotion;
/** Cached curve keys to avoid recalculating (see above). */
var transient array<CurveKey>			CachedCurveKeys;

/** used when iterating over nodes via GetNodes() and related functions to skip nodes that have already been processed */
var  transient int SearchTag;

/** Array of blended curve key for editor only **/
var(Morph)	editoronly editconst transient array<CurveKey>	LastUpdatedAnimMorphKeys;

/** Flags to control if Script Events should be called. Note that those will affect performance, so be careful! */
var() bool bCallScriptEventOnInit;
var() bool bCallScriptEventOnBecomeRelevant;
var() bool bCallScriptEventOnCeaseRelevant;

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

/** Called from InitAnim. Allows initialization of script-side properties of this node. */
event OnInit();
/** Get notification that this node has become relevant for the final blend. ie TotalWeight is now > 0 */
event OnBecomeRelevant();
/** Get notification that this node is no longer relevant for the final blend. ie TotalWeight is now == 0 */
event OnCeaseRelevant();

/**
 * Find an Animation Node in the Animation Tree whose NodeName matches InNodeName.
 * Will search this node and all below it.
 * Warning: The search is O(n^2), so for large AnimTrees, cache result.
 */
native final function AnimNode FindAnimNode(name InNodeName);

native function PlayAnim(bool bLoop = false, float Rate = 1.0f, float StartTime = 0.0f);
native function StopAnim();
// calls PlayAnim with the current settings
native function ReplayAnim();	

defaultproperties
{
   Name="Default__AnimNode"
   ObjectArchetype=AnimObject'Engine.Default__AnimObject'
}
