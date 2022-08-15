/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleEventGenerator extends ParticleModuleEventBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 */
struct native ParticleEvent_GenerateInfo
{
	/** The type of event. */
	var() EParticleEventType Type;
	/** How often to trigger the event (<= 1 means EVERY time). */
	var() int Frequency;
	/** Frequency range? (-1 indicates no - else [LowFreq..Frequency]. */
	var() int LowFreq;
	/** How often to trigger the event per particle (<= 1 means EVERY time) (collision only). */
	var() int ParticleFrequency;
	/** Only fire the first time (collision only). */
	var() bool FirstTimeOnly;
	/** Only fire the last time (collision only). */
	var() bool LastTimeOnly;
	/** Use the impact vector not the hit normal (collision only). */
	var() bool UseReflectedImpactVector;
	/** Should the event tag with a custom name? Leave blank for the default. */
	var() name CustomName;
	/** The events we want to fire off when this event has been generated */
	var() editinline array< ParticleModuleEventSendToGame > ParticleModuleEventsToSendToGame;

	structdefaultproperties
	{
		LowFreq=-1
	}
};

/**
 */
var(Events) export noclear	array<ParticleEvent_GenerateInfo> Events;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleEventGenerator"
   ObjectArchetype=ParticleModuleEventBase'Engine.Default__ParticleModuleEventBase'
}
