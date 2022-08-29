//=============================================================================
// KFSeqEvent_PlayerDied
//=============================================================================
// Event telling Kismet a playercontroller controlled pawn died
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFSeqEvent_PlayerDied extends SequenceEvent;

defaultproperties
{
   MaxTriggerCount=0
   bPlayerOnly=False
   OutputLinks(0)=(LinkDesc="Player Died")
   OutputLinks(1)=(LinkDesc="Last Player Died")
   ObjName="Player Died"
   ObjCategory="KF"
   Name="Default__KFSeqEvent_PlayerDied"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
