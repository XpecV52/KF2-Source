class InterpTrackHeadTracking extends InterpTrack
	native(Interpolation);

/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * 
 *	This track implements support for setting or toggling the visibility of the associated actor
 */

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)


/** HeadTracking actions */
enum EHeadTrackingAction
{
	/** Disable Head Tracking */
	EHTA_DisableHeadTracking,

	/** Enable Head Tracking */
	EHTA_EnableHeadTracking,
};

/** Information for one toggle in the track. */
struct native HeadTrackingKey
{
	var		float					Time;
	var()	EHeadTrackingAction	    Action;
};	

/** Array of keys . */
var	array<HeadTrackingKey>	HeadTrackingTrack;

/** SkelControlLookAt name in the AnimTree of the SkeletalMesh **/
var() array<name>  TrackControllerName;

/** Will pick up actor within this radius **/
var() float LookAtActorRadius;

/** Interp back to zero strength if limit surpassed */
var() bool	bDisableBeyondLimit;

/** How long can one person to look at one **/
var() float MaxLookAtTime;
/** At least this time to look at one **/
var() float MinLookAtTime;

/** Once entered the radius, how long do I really care to lok  ? This affects rating. It will give benefit to the person who just entered **/
var() float MaxInterestTime;

/** Quick check box for allowing it to look Pawn - due to Pawn not being listed in the Actor class **/
var(Target) bool bLookAtPawns;

/** Actor classes to look at as 0 index being the highest priority if you have anything specific **/
var(Target) array< class<Actor> >  ActorClassesToLookAt;

/** Target Bone Names, where to look at - priority from top to bottom, if not found, it will continue search **/
var(Target) array<name>     TargetBoneNames;

defaultproperties
{
   TrackControllerName(0)="HeadLook"
   TrackControllerName(1)="LeftEyeLook"
   TrackControllerName(2)="RightEyeLook"
   LookAtActorRadius=500.000000
   bLookAtPawns=True
   MaxLookAtTime=5.000000
   MinLookAtTime=3.000000
   MaxInterestTime=7.000000
   TargetBoneNames(0)="b_MF_Head"
   TargetBoneNames(1)="b_MF_Neck"
   TrackInstClass=Class'Engine.InterpTrackInstHeadTracking'
   TrackTitle="HeadTracking"
   Name="Default__InterpTrackHeadTracking"
   ObjectArchetype=InterpTrack'Engine.Default__InterpTrack'
}
