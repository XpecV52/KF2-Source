/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class AnimNotify_Rumble extends AnimNotify
	native(Anim);


/** A predefined WaveForm **/
var() class<WaveFormBase> PredefinedWaveForm<AllowAbstract>;


/** The waveform to play **/
var() editinline ForceFeedbackWaveform WaveForm;

/** If set the player must be based on this actor for the wave to be played */
var() bool								bCheckForBasedPlayer;

/** If non-zero the effect will happen if the player is with in this radius of the playing actor */
var() float								EffectRadius;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__AnimNotify_Rumble"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
