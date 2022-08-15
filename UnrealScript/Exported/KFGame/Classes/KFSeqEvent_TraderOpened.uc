//=============================================================================
// KFSeqEvent_TraderOpened
//=============================================================================
// Event telling Kismet the trader opened
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFSeqEvent_TraderOpened extends SequenceEvent;

defaultproperties
{
   bPlayerOnly=False
   OutputLinks(0)=(LinkDesc="Start Objective Logic")
   ObjName="On Trader Opened Event"
   Name="Default__KFSeqEvent_TraderOpened"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
