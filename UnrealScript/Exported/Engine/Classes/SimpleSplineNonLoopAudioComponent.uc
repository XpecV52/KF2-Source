/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class SimpleSplineNonLoopAudioComponent extends SimpleSplineAudioComponent
	native
	collapsecategories
	hidecategories(Object,ActorComponent)
	dependson(SoundNodeAttenuation)
	editinlinenew;

var( Randomized )		float					DelayMin<ToolTip=The lower bound of the delay in seconds>;
var( Randomized )		float					DelayMax<ToolTip=The upper bound of the delay in seconds>;

var( Randomized )		float					PitchMin<ToolTip=The lower bound of pitch (1.0 is no change)>;
var( Randomized )		float					PitchMax<ToolTip=The upper bound of pitch (1.0 is no change)>;

var( Randomized )		float					VolumeMin<ToolTip=The lower bound of volume (1.0 is no change)>;
var( Randomized )		float					VolumeMax<ToolTip=The upper bound of volume (1.0 is no change)>;

var                     int                     CurrentSlotIndex;
var                     float                   UsedVolumeModulation;
var                     float                   UsedPitchModulation;
var                     float                   NextSoundTime;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   PitchMin=1.000000
   PitchMax=1.000000
   VolumeMin=1.000000
   VolumeMax=1.000000
   CurrentSlotIndex=-1
   UsedVolumeModulation=1.000000
   UsedPitchModulation=1.000000
   NotifyBufferFinishedHook=ForcedLoopSoundNode'Engine.Default__SimpleSplineNonLoopAudioComponent:ForcedLoopSoundNode0'
   SoundCue=SoundCue'Engine.Default__SimpleSplineNonLoopAudioComponent:SoundCue0'
   Name="Default__SimpleSplineNonLoopAudioComponent"
   ObjectArchetype=SimpleSplineAudioComponent'Engine.Default__SimpleSplineAudioComponent'
}
