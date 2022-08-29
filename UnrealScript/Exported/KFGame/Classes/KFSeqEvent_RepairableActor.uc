//=============================================================================
// KFSeqEvent_RepairableActor
//=============================================================================
// Events telling Kismet of various happenings to a KFRepairableActor
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSeqEvent_RepairableActor extends SequenceEvent;

enum ERepairableActorEvent
{
	ERepairableActorEvent_Activated,
	ERepairableActorEvent_Repaired
};

defaultproperties
{
   MaxTriggerCount=0
   bPlayerOnly=False
   OutputLinks(0)=(LinkDesc="Activated")
   OutputLinks(1)=(LinkDesc="Repaired")
   ObjName="Repairable Actor Events"
   ObjCategory="KF"
   Name="Default__KFSeqEvent_RepairableActor"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
