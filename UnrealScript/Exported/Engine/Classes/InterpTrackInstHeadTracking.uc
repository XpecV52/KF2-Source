/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstHeadTracking extends InterpTrackInst
	dependson(HeadTrackingComponent)
	native(Interpolation);

var()	EHeadTrackingAction	Action;

/** Actor to look at information **/
// struct native ActorToLookAt
// {
// 	var     Actor   Actor;
// 	var     float   Rating;
// 	var     float   EnteredTime;
// 	var     float   LastKnownDistance;
// 	var     float   StartTimeBeingLookedAt;
// 	var     bool    CurrentlyBeingLookedAt;
// };

/** Array of actor information **/
var const transient native map{class AActor*,struct FActorToLookAt* } CurrentActorMap;
/** SkeletalMeshComponent who owns this **/
var transient SkeletalMeshComponent Mesh;
/** Look at control **/
var transient array<SkelControlLookAt>     TrackControls;

/** 
 *	Position we were in last time we evaluated.
 *	During UpdateTrack, events between this time and the current time will be processed.
 */
var		float				LastUpdatePosition; 

// (cpptext)
// (cpptext)
// (cpptext)
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
   Name="Default__InterpTrackInstHeadTracking"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
