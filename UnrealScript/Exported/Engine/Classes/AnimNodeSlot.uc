/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * Slot for Matinee controlled Animation Trees.
 * Each slot will be able to blend a defined number of channels (AnimNodeSequence connections).
 */

class AnimNodeSlot extends AnimNodeBlendBase
	native(Anim)
	hidecategories(Object);

/** True, when we're playing a custom animation */
var const bool		bIsPlayingCustomAnim;
/** save blend out time when playing a one shot animation. */
var const FLOAT		PendingBlendOutTime;
/** Child index playing a custom animation */
var const INT		CustomChildIndex;
/** Child currently active, being blended to */
var const INT		TargetChildIndex;
/** Array of target weights for each child. Size must be the same as the Children array. */
var	Array<FLOAT>	TargetWeight;
/** How long before current blend is complete (ie. target child reaches 100%) */
var	const FLOAT		BlendTimeToGo;

/** 
 * If TRUE (default), then forward the AnimEnd notification when we start blending out the animation.
 * This usually improves transitions and blends, as we can start playing new animations as soon as this one
 * starts blending out, as opposed to waiting until it is fully blended out.
 * Setting this to FALSE, will trigger the standard behavior of triggering AnimEnd notifies when the animation is really done playing.
 */
var()	bool	bEarlyAnimEndNotify;

/** 
 * if TRUE, do not blend when the Skeletal Mesh is not visible.
 * Optimization to save on blending time when meshes are not rendered.
 * Instant switch instead.
 */
var() bool	bSkipBlendWhenNotRendered;

/** If TRUE, Additive Animations override the source input.
 *  If FALSE, Additive Animations are added to source input. (DEFAULT)
 */
var() bool  bAdditiveAnimationsOverrideSource;

/** TRUE	if current it's used by Matinee, InterpTrackAnimControl
 *	FALSE	if not
 */
var const transient bool		bIsBeingUsedByInterpGroup;

/** allow bPauseAnims to be supported for this node type if we want */
var() bool  bDontAddToAlwaysTickArray;


/** Prevent notifies from being triggered by anim blend children */
var bool bNoNotifies;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Play a custom animation.
 * Supports many features, including blending in and out.
 *
 * @param	AnimName		Name of animation to play.
 * @param	Rate			Rate animation should be played at.
 * @param	BlendInTime		Blend duration to play anim.
 * @param	BlendOutTime	Time before animation ends (in seconds) to blend out.
 *							-1.f means no blend out. 
 *							0.f = instant switch, no blend. 
 *							otherwise it's starting to blend out at AnimDuration - BlendOutTime seconds.
 * @param	bLooping		Should the anim loop? (and play forever until told to stop)
 * @param	bOverride		play same animation over again only if bOverride is set to true.
 * @param	StartTime		When to start the anim (e.g. start at 2 seconds into the anim)
 * @param	EndTime		    When to end the anim (e.g. end at 4 second into the anim)
 *
 * @return	PlayBack length of animation.
 */
final native function float PlayCustomAnim
(
	name	AnimName,
	float	Rate,
	optional	float	BlendInTime,
	optional	float	BlendOutTime,
	optional	bool	bLooping,
	optional	bool	bOverride,
	optional	float	StartTime,
	optional	float	EndTime
);


/**
 * Play a custom animation.
 * Supports many features, including blending in and out.
 *
 * @param	AnimName		Name of animation to play.
 * @param	Duration		duration in seconds the animation should be played.
 * @param	BlendInTime		Blend duration to play anim.
 * @param	BlendOutTime	Time before animation ends (in seconds) to blend out.
 *							-1.f means no blend out. 
 *							0.f = instant switch, no blend. 
 *							otherwise it's starting to blend out at AnimDuration - BlendOutTime seconds.
 * @param	bLooping		Should the anim loop? (and play forever until told to stop)
 * @param	bOverride		play same animation over again only if bOverride is set to true.
 * @return TRUE if animation is playing, FALSE if couldn't play it.
 */
final native function bool PlayCustomAnimByDuration
(
	name	AnimName,
	float	Duration,
	optional	float	BlendInTime,
	optional	float	BlendOutTime,
	optional	bool	bLooping,
	optional	bool	bOverride = TRUE
);

/** Returns the Name of the currently played animation or '' otherwise. */
final native function Name GetPlayedAnimation();

/** 
 * Stop playing a custom animation. 
 * Used for blending out of a looping custom animation.
 */
final native function StopCustomAnim(float BlendOutTime);

/**
 * Call this function to remove nodes from the AnimAlwaysTickArray so bPauseAnims will work, 
 * sets or clears the bDontAddToAlwaysTickArray 
 */
final native function SetAllowPauseAnims(bool bSet);

/**
 * Switch currently played animation to another one.
 */
final native function SetCustomAnim(Name AnimName);


/** Set bCauseActorAnimEnd flag */
final native function SetActorAnimEndNotification(bool bNewStatus);


/** Set NotifyWeightThreshold to prevent triggering notifies */
final native function SetNotifyWeightThreshold(float Threshold);


/** 
 * Returns AnimNodeSequence currently selected for playing animations.
 * Note that calling PlayCustomAnim *may* change which node plays the animation.
 * (Depending on the blend in time, and how many nodes are available, to provide smooth transitions.
 */
final native function AnimNodeSequence GetCustomAnimNodeSeq();


/**
 * Set custom animation root bone options.
 */
final native function SetRootBoneAxisOption
(
 optional ERootBoneAxis AxisX = RBA_Default,
 optional ERootBoneAxis AxisY = RBA_Default,
 optional ERootBoneAxis AxisZ = RBA_Default
 );

/**
 * Set custom animation root rotation options.
 */
final native function SetRootBoneRotationOption
(
	optional ERootRotationOption AxisX = RRO_Default,
	optional ERootRotationOption AxisY = RRO_Default,
	optional ERootRotationOption AxisZ = RRO_Default
);

/* Advance time regarding child weights */
final native function TickChildWeights(FLOAT DeltaSeconds);

defaultproperties
{
   bEarlyAnimEndNotify=True
   TargetWeight(0)=1.000000
   Children(0)=(Name="Source",Weight=1.000000)
   Children(1)=(Name="Channel 01")
   NodeName="SlotName"
   Name="Default__AnimNodeSlot"
   ObjectArchetype=AnimNodeBlendBase'Engine.Default__AnimNodeBlendBase'
}
