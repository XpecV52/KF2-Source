//=============================================================================
// KFAnimNotify_ZedVoiceSound
//=============================================================================
// Notify class for zed voice sounds, which need to be played differently if the
// zed has no mouth/head.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class KFAnimNotify_ZedVoiceAkEvent extends AnimNotify_AkEvent
	native(Anim);

/** Alternate event to play in the case that the zed has no mouth/head */
var() AkEvent					MouthlessAkEvent; 

/** Will cause MouthlessAkEvent to be played when the "play" button is pressed in the editor */
var() transient editoronly bool bTestMouthlessAkEvent;

/** Will attempt to play through the dialog/chatter manager, obeying dialog rules such as priority and cooldown */
var() bool						bTreatAsDialog;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   BoneName="head"
   Name="Default__KFAnimNotify_ZedVoiceAkEvent"
   ObjectArchetype=AnimNotify_AkEvent'Engine.Default__AnimNotify_AkEvent'
}
