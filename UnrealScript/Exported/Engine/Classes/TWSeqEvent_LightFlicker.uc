//=============================================================================
// TWSeqEvent_LightFlicker
//=============================================================================
// Custom event activated from light actor animation (LightAnim_Flicker only)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class TWSeqEvent_LightFlicker extends SequenceEvent;

defaultproperties
{
   ReTriggerDelay=0.200000
   bPlayerOnly=False
   bClientSideOnly=True
   ObjName="Light Flicker"
   ObjCategory="KF"
   Name="Default__TWSeqEvent_LightFlicker"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
