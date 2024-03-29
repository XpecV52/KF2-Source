/**
 * Interface for actors that can Speak
 * 
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
interface Interface_Speaker
	native;

/** Very simple for now. */
simulated event Speak(SoundCue Cue);

defaultproperties
{
   Name="Default__Interface_Speaker"
   ObjectArchetype=Interface'Core.Default__Interface'
}
