//=============================================================================
// KFSeqEvent_PawnTeleported
//=============================================================================
// Event triggered when a pawn has used a Teleporter actor
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//  - Matt 'Squirrlz' Farber
//=============================================================================
class KFSeqEvent_PawnTeleported extends SequenceEvent;

defaultproperties
{
   MaxTriggerCount=0
   bPlayerOnly=False
   ObjName="Pawn Used Teleporter"
   Name="Default__KFSeqEvent_PawnTeleported"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
