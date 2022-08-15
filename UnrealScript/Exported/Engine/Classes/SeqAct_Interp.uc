/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_Interp extends SeqAct_Latent
	dependson(EngineBaseTypes)
	config(Engine)
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
 * Helper type for storing actors' World-space locations/rotations.
 */
struct native export SavedTransform
{
	var vector	Location;
	var rotator	Rotation;
};

/** Helper struct for storing the camera world-position for each camera cut in the cinematic. */
struct native CameraCutInfo
{
	var vector	Location;
	var float	Timestamp;
};

/** A map from actors to their pre-Matinee world-space positions/orientations.  Includes actors attached to Matinee-affected actors. */
var private const transient noimport native map{AActor*,FSavedTransform} SavedActorTransforms;

/** A map from actors to their pre-Matinee visibility state */
var private const transient noimport native map{AActor*,BYTE} SavedActorVisibilities;

/** Time multiplier for playback. */
var()	float					PlayRate;

/** Time position in sequence - starts at 0.0 */
var		float					Position;

/** Time position to always start at if bForceStartPos is set to TRUE. */
var()	float					ForceStartPosition;

/** If sequence is currently playing. */
var		bool					bIsPlaying;

/** Sequence is initialised, but ticking will not increment its current position. */
var		bool					bPaused;

/** Indicates whether this SeqAct_Interp is currently open in the Matinee tool. */
var		transient bool			bIsBeingEdited;

/**
 *	If sequence should pop back to beginning when finished.
 *	Note, if true, will never get Completed/Reversed events - sequence must be explicitly Stopped.
 */
var()	bool					bLooping;

/** If true, sequence will rewind itself back to the start each time the Play input is activated. */
var()	bool					bRewindOnPlay;

/**
 *	If true, when rewinding this interpolation, reset the 'initial positions' of any RelateToInitial movements to the current location.
 *	This allows the next loop of movement to proceed from the current locations.
 */
var()	bool					bNoResetOnRewind;

/**
 *	Only used if bRewindOnPlay if true. Defines what should happen if the Play input is activated while currently playing.
 *	If true, hitting Play while currently playing will pop the position back to the start and begin playback over again.
 *	If false, hitting Play while currently playing will do nothing.
 */
var()	bool					bRewindIfAlreadyPlaying;

/** If sequence playback should be reversed. */
var		bool					bReversePlayback;

/** Whether this action should be initialised and moved to the 'path building time' when building paths. */
var()	bool					bInterpForPathBuilding;

/** Lets you force the sequence to always start at ForceStartPosition */
var()	bool					bForceStartPos;

/** If true, disables the realtime radio effect */
var()	bool					bDisableRadioFilter;

/** Indicates that this interpolation does not affect gameplay. This means that:
 * -it is not replicated via MatineeActor
 * -it is not ticked if no affected Actors are visible
 * -on dedicated servers, it is completely ignored
 */
var() bool bClientSideOnly;

/** if bClientSideOnly is true, whether this matinee should be completely skipped if none of the affected Actors are visible */
var() bool bSkipUpdateIfNotVisible;

/** Lets you skip the matinee with the CANCELMATINEE exec command. Triggers all events to the end along the way. */
var()	bool					bIsSkippable;

/** Cover linked to this matinee that should be updated once path building time has been played */
var() array<CoverLink>			LinkedCover;

/** Actual track data. Can be shared between SeqAct_Interps. */
var		export InterpData		InterpData;

/** Instance data for interp groups. One for each variable/group combination. */
var		array<InterpGroupInst>	GroupInst;

/** on a net server, actor spawned to handle replicating relevant data to the client */
var const class<MatineeActor> ReplicatedActorClass;
var const transient MatineeActor ReplicatedActor;

/** Preferred local viewport number (when split screen is active) the director track should associate with, or zero for 'all'. */
var() int PreferredSplitScreenNum;

/** Cached value that indicates whether or not gore was enabled when the sequence was started */
var transient bool bShouldShowGore;

/** Contains the camera world-position for each camera cut in the cinematic. */
var transient array<CameraCutInfo> CameraCuts;

/** last time TermInterp() was called on this action. Only updated in game */
var float TerminationTime;

/** 
 * Rendering overrides of this matinee, which will be used if the matinee has a director track.
 * Cinematics add a bunch of rendering cost with their lighting and shadowing, so we need to disable some features to make room for that.
 */
var() globalconfig RenderingPerformanceOverrides RenderingOverrides;

/** Constant camera anim to add to matinee, set to 1 (future we could have more) */
var(ConstantCameraAnim) byte ConstantCameraAnim;
var(ConstantCameraAnim) float ConstantCameraAnimRate;

/** sets the position of the interpolation
 * @note if the interpolation is not currently active, this function doesn't send any Kismet or UnrealScript events
 * @param NewPosition the new position to set the interpolation to
 * @param bJump if true, teleport to the new position (don't trigger any events between the old and new positions, etc)
 */
native final function SetPosition(float NewPosition, optional bool bJump = false);

/** stops playback at current position */
native final function Stop();

/** adds the passed in PlayerController to all running Director tracks so that its camera is controlled
 * all PCs that are available at playback start time are hooked up automatically, but this needs to be called to hook up
 * any that are created during playback (player joining a network game during a cinematic, for example)
 * @param PC the PlayerController to add
 */
native final function AddPlayerToDirectorTracks(PlayerController PC);

function Reset()
{
	SetPosition(0.0, false);
	// stop if currently playing
	if (bActive)
	{
		InputLinks[2].bHasImpulse = true;
	}
}

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

defaultproperties
{
   PlayRate=1.000000
   ReplicatedActorClass=Class'Engine.MatineeActor'
   RenderingOverrides=(bAllowTemporalAA=True,bAllowLightShafts=True)
   ConstantCameraAnimRate=4.000000
   InputLinks(0)=(LinkDesc="Play")
   InputLinks(1)=(LinkDesc="Reverse")
   InputLinks(2)=(LinkDesc="Stop")
   InputLinks(3)=(LinkDesc="Pause")
   InputLinks(4)=(LinkDesc="Change Dir")
   OutputLinks(0)=(LinkDesc="Completed")
   OutputLinks(1)=(LinkDesc="Reversed")
   VariableLinks(0)=(ExpectedType=Class'Engine.InterpData',LinkDesc="Data",PropertyName=,MaxVars=1)
   ObjName="Matinee"
   Name="Default__SeqAct_Interp"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
