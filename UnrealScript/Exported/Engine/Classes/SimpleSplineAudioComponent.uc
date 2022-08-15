/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

/**
 *  Audio component used by AmbientSoundSimpleSpline. It finds position of sound source (virtual speaker) based on poredefined points list, and listener's position. 
 *  Moreover range of sound source along spline is considered while sound source position evaluation.
 */

class SimpleSplineAudioComponent extends SplineAudioComponent
	native
	collapsecategories
	hidecategories(Object,ActorComponent)
	dependson(SoundNodeAttenuation)
	editinlinenew;

struct native SplineSoundSlot
{
	var()	SoundNodeWave	Wave;
	var()	float			PitchScale;
	var()	float			VolumeScale;

	/** 
	 *  Indexes define range of sound sorce along spline.
	 */
	var()	int			    StartPoint;
	var()	int			    EndPoint;
	var()	float	        Weight;

	// To remember where the volumes are interpolating to and from
	var native const	    double			LastUpdateTime;
	var	native const	    float			SourceInteriorVolume;
	var	native const	    float			SourceInteriorLPF;
	var	native const	    float			CurrentInteriorVolume;
	var	native const	    float			CurrentInteriorLPF;
	

	structdefaultproperties
	{
		PitchScale=1.0
		VolumeScale=1.0
		StartPoint=-1
		EndPoint=-1
		Weight=1.0

		SourceInteriorVolume=1.0
		SourceInteriorLPF=1.0
		CurrentInteriorVolume=1.0
		CurrentInteriorLPF=1.0
	}

	structcpptext
	{
		FSplineSoundSlot()
		{
			Wave = NULL;
			PitchScale = 1.0f;
			VolumeScale = 1.0f;
			StartPoint = -1;
			EndPoint = -1;
			Weight = 1.0f;

			LastUpdateTime = 0.0;
			SourceInteriorVolume = 1.0f;
			SourceInteriorLPF = 1.0f;
			CurrentInteriorVolume = 1.0f;
			CurrentInteriorLPF = 1.0f;
		}
	}
};

/** The settings for attenuating with a low pass filter. */
var( LowPassFilter )	bool					bAttenuateWithLPF<ToolTip=Enable attenuation via low pass filter>;
var( LowPassFilter )	float					LPFRadiusMin<ToolTip=The range at which to start applying a low passfilter>;
var( LowPassFilter )	float					LPFRadiusMax<ToolTip=The range at which to apply the maximum amount of low pass filter>;

var( Attenuation )		float					dBAttenuationAtMax<ToolTip=The volume at maximum distance in deciBels>;

/** HACK, value is used only to edit OmniRadius */ 
var( Attenuation )		float					FlattenAttenuationRadius<ToolTip=At what distance to start blending the sound from as omnidirectional>;

/** What kind of attenuation model to use */
var( Attenuation )		SoundDistanceModel		DistanceAlgorithm<ToolTip=The type of volume versus distance algorithm to use>;

var( Attenuation )		float					RadiusMin<ToolTip=The range at which the sound starts attenuating>;
var( Attenuation )		float					RadiusMax<ToolTip=The range at which the sound has attenuated completely>;

var( Sounds ) init	    array<SplineSoundSlot>	SoundSlots<ToolTip=Sounds to play>;

/** A SoundNode needed for endless loop  */
var                     SoundNode	            NotifyBufferFinishedHook;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   LPFRadiusMin=3000.000000
   LPFRadiusMax=6000.000000
   dBAttenuationAtMax=-60.000000
   FlattenAttenuationRadius=800.000000
   RadiusMin=200.000000
   RadiusMax=1200.000000
   NotifyBufferFinishedHook=ForcedLoopSoundNode'Engine.Default__SimpleSplineAudioComponent:ForcedLoopSoundNode0'
   SoundCue=SoundCue'Engine.Default__SimpleSplineAudioComponent:SoundCue0'
   Name="Default__SimpleSplineAudioComponent"
   ObjectArchetype=SplineAudioComponent'Engine.Default__SplineAudioComponent'
}
