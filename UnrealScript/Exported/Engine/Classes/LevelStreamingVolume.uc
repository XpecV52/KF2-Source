/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * Used to affect level streaming in the game and level visibility in the editor.
 */
class LevelStreamingVolume extends Volume
	native
	hidecategories(Advanced,Attachment,Collision,Volume)
	placeable;

struct CheckpointRecord
{
	var bool bDisabled;
};

/** Levels affected by this level streaming volume. */
var() noimport const editconst array<LevelStreaming> StreamingLevels;

/** If TRUE, this streaming volume should only be used for editor streaming level previs. */
var() bool						bEditorPreVisOnly;

/**
 * If TRUE, this streaming volume is ignored by the streaming volume code.  Used to either
 * disable a level streaming volume without disassociating it from the level, or to toggle
 * the control of a level's streaming between Kismet and volume streaming.
 */
var() bool						bDisabled;

/** Enum for different usage cases of level streaming volumes. */
enum EStreamingVolumeUsage
{
	SVB_Loading,
	SVB_LoadingAndVisibility,
	SVB_VisibilityBlockingOnLoad,
	SVB_BlockingOnLoad,
	SVB_LoadingNotVisible
};

/** Determines what this volume is used for, e.g. whether to control loading, loading and visibility or just visibilty (blocking on load) */
var() EStreamingVolumeUsage	StreamingUsage;

/** If TRUE, level will stream when closer than TestVolumeDistance to the volume. */
var()	bool	bTestDistanceToVolume;

/** If bTestDistanceToVolume is TRUE, level will stream in if closer than this to volume.  */
var()	float	TestVolumeDistance;



var deprecated EStreamingVolumeUsage	Usage;


/**
 * Kismet support for toggling bDisabled.
 */
simulated function OnToggle(SeqAct_Toggle action)
{
	if (action.InputLinks[0].bHasImpulse)
	{
		// "Turn On" -- mapped to enabling of volume streaming for this volume.
		bDisabled = FALSE;
	}
	else if (action.InputLinks[1].bHasImpulse)
	{
		// "Turn Off" -- mapped to disabling of volume streaming for this volume.
		bDisabled = TRUE;
	}
	else if (action.InputLinks[2].bHasImpulse)
	{
		// "Toggle"
		bDisabled = !bDisabled;
	}
}

function CreateCheckpointRecord(out CheckpointRecord Record)
{
	Record.bDisabled = bDisabled;
}

function ApplyCheckpointRecord(const out CheckpointRecord Record)
{
	bDisabled = Record.bDisabled;
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   StreamingUsage=SVB_LoadingAndVisibility
   BrushColor=(B=0,G=165,R=255,A=255)
   bColored=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   bCollideActors=False
   bForceAllowKismetModification=True
   CollisionComponent=BrushComponent0
   Name="Default__LevelStreamingVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
