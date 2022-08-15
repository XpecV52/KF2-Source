/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 * When you attach this class, make sure you don't have any other HeadTrackingComponent 
 * That will create conflict. It will warn if it already has headtrackingcomponent
 */
class HeadTrackingComponent extends ActorComponent
	native(Anim);

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

/** Once entered the radius, how long do I really care to look  ? This affects rating. It will give benefit to the person who just entered **/
var() float MaxInterestTime;

/** Actor classes to look at as 0 index being the highest priority if you have anything specific **/
var(Target) array< class<Actor> >  ActorClassesToLookAt;

/** Target Bone Names, where to look at - priority from top to bottom, if not found, it will continue search **/
var(Target) array<name>     TargetBoneNames;

/** Actor to look at information **/
struct native ActorToLookAt
{
	var     Actor   Actor;
	var     float   Rating;
	var     float   EnteredTime;
	var     float   LastKnownDistance;
	var     float   StartTimeBeingLookedAt;
	var     bool    CurrentlyBeingLookedAt;
};

/** Array of actor information **/
var private const transient native map{class AActor*,struct FActorToLookAt* } CurrentActorMap;

/** SkeletalMeshComponent who owns this **/
var SkeletalMeshComponent SkeletalMeshComp;

/** Look at control **/
var private transient array<SkelControlLookAt>	TrackControls;

/** Cached value for where mesh location/rotation is at this tick **/
var private transient vector				RootMeshLocation;
var private transient rotator				RootMeshRotation;
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   TrackControllerName(0)="HeadLook"
   TrackControllerName(1)="LeftEyeLook"
   TrackControllerName(2)="RightEyeLook"
   LookAtActorRadius=500.000000
   MaxLookAtTime=5.000000
   MinLookAtTime=3.000000
   MaxInterestTime=7.000000
   TargetBoneNames(0)="b_MF_Head"
   TargetBoneNames(1)="b_MF_Neck"
   Name="Default__HeadTrackingComponent"
   ObjectArchetype=ActorComponent'Engine.Default__ActorComponent'
}
