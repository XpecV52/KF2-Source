//=============================================================================
// KFAnimSeq_Tween
//=============================================================================
// Enables tweening functionality for the sequence node between alternate
// animations. Used by first person weapons to keep AnimTree simple.
// Includes support for camera animation notifies.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFAnimSeq_Tween extends AnimNodeSequence
	native(Anim);

/** Time, in seconds, the animations should take to tween together */
var() const	  float	TweenTime;

/** Time until current blend is completed */
var	transient float	BlendTimeToGo;

// the cached bone atoms represent the last frame of the last animation that was visible, for tweening
var transient array<BoneAtom> 	CachedPrevBoneAtoms; 
var transient array<byte>		CachedRequiredBones;

/** Used to determine if PlayAnim was called before SetAnim */
var transient bool bSetAnimWasCalled;

/** if TRUE, clear the CameraAnim reference at the end of each animation */
var bool	bUsesCameraAnimNotify;

/** 
 * if TRUE, do not blend when the Skeletal Mesh is not visible.
 * Optimization to save on blending time when meshes are not rendered.
 * Instant switch instead.
 */
var bool	bSkipBlendWhenNotRendered;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** @see AnimNodeSequence::SetAnim() */
native function SetAnim( name Sequence );

/** Sets how long one wants the animations to tween together. */
native function SetTweenTime( float NewTweenTime );

/** @see AnimNodeSequence::PlayAnim() */
native function PlayAnim(bool bLoop = false, float InRate = 1.0f, float StartTime = 0.0f);

defaultproperties
{
   TweenTime=0.100000
   bUsesCameraAnimNotify=True
   bSkipBlendWhenNotRendered=True
   Name="Default__KFAnimSeq_Tween"
   ObjectArchetype=AnimNodeSequence'Engine.Default__AnimNodeSequence'
}
