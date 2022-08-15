//=============================================================================
// KFSeqEvent_ObjectiveStart
//=============================================================================
// Event that tells Kismet to start an objective
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFSeqEvent_ObjectiveStart extends SequenceEvent;

defaultproperties
{
   bPlayerOnly=False
   OutputLinks(0)=(LinkDesc="Start Objective Logic")
   ObjName="Start Objective Event"
   Name="Default__KFSeqEvent_ObjectiveStart"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
