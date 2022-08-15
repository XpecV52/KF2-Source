/**
 *	Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *	AnimNotify for having a Trails emitter spawn based on an animation.
 */
class AnimNotify_Trails extends AnimNotify
	native(Anim);

/** The Particle system to play */
var(Trails) ParticleSystem PSTemplate;

/** The Skeletal Mesh to sample the data from */
var(Trails) editoronly editconst SkeletalMesh SampledSkeletalMesh;

/** If this effect should be considered extreme content */
var(Trails) bool bIsExtremeContent;

/** The first edge socket - with the second edge defines the edges of the trail */
var(Trails) name FirstEdgeSocketName;

/**
 *	The control point socket - controls the UV tiling as well as
 *	tapering the two edges to this point.
 */
var(Trails) name ControlPointSocketName;

/** The second edge socket - with the first edge defines the edges of the trail */
var(Trails) name SecondEdgeSocketName;

/** If TRUE, the particle system will play in the viewer as well as in game */
var() editoronly bool bPreview;

/** If TRUE, this will preview with listed PS and ignore AnimNotify_FX_Preview section in ini for pawn specific data */
var() editoronly bool bPreviewForceExplicit;

/** If Owner is hidden, skip particle effect */
var() bool bSkipIfOwnerIsHidden;

/** Locally store 'start' time to determine when regenerating the curve data is required. */
var float LastStartTime;

/** The end time (will auto-adjust Duration setting, and vice-versa) */
var float EndTime;

/** The timestep at which to sample the animation for trail points */
var deprecated float SampleTimeStep;

struct native TrailSocketSamplePoint
{
	/** Position of the socket relative to the root-bone at the sample point */
	var vector Position;
	/** Velocity of the socket at the sample point */
	var vector Velocity;
};

struct native TrailSamplePoint
{
	/** The time value at this sample point, relative to the starting time. */
	var float RelativeTime;
	/** The sample for the first edge */
	var TrailSocketSamplePoint	FirstEdgeSample;
	/** The sample for the control point */
	var TrailSocketSamplePoint	ControlPointSample;
	/** The sample for the second edge */
	var TrailSocketSamplePoint	SecondEdgeSample;
};

var deprecated array<TrailSamplePoint> TrailSampleData;

var bool bResampleRequired;

/** The frame rate (FPS) to sample the animation at for trail points */
var(Trails) float SamplesPerSecond;

struct native TrailSample
{
	/** The time value at this sample point, relative to the starting time. */
	var float RelativeTime;
	/** The sample for the first edge */
	var vector FirstEdgeSample;
	/** The sample for the control point */
	var vector ControlPointSample;
	/** The sample for the second edge */
	var vector SecondEdgeSample;
};

/** The sampled data for the trail */
var array<TrailSample> TrailSampledData;

/** Used by the event functions... */
var transient float CurrentTime;
var transient float TimeStep;
var transient AnimNodeSequence AnimNodeSeq;

/**
 *	Called from NotifyTick or NotifyEnd, this function will return the 
 *	number of steps to take for a notify call given the index of the 
 *	last sample that was processed.
 *
 *	@param	InLastTrailIndex	The index of the last sample that was processed.
 *
 *	@return	INT					The number of steps to take for the notify.
 */
function native int GetNumSteps(int InLastTrailIndex) const;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   bSkipIfOwnerIsHidden=True
   FirstEdgeSocketName="EndControl"
   ControlPointSocketName="MidControl"
   SecondEdgeSocketName="StartControl"
   SamplesPerSecond=60.000000
   NotifyColor=(B=255,G=64,R=255,A=255)
   Name="Default__AnimNotify_Trails"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
