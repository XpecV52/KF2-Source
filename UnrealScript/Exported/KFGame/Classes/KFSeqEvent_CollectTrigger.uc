//=============================================================================
// KFSeqEvent_CollectTrigger
//=============================================================================
// Events telling Kismet of various progress that has occurred during
// an ActivateTrigger objective
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSeqEvent_CollectTrigger extends SequenceEvent;

enum ECollectTriggerEvent
{
	ECollectTriggerEvent_Activated,
	ECollectTriggerEvent_ObjectDropped,
	ECollectTriggerEvent_ObjectPickedUp,
	ECollectTriggerEvent_ObjectDelivered
};

defaultproperties
{
   MaxTriggerCount=0
   bPlayerOnly=False
   OutputLinks(0)=(LinkDesc="Activated")
   OutputLinks(1)=(LinkDesc="Object Dropped")
   OutputLinks(2)=(LinkDesc="Object Picked Up")
   OutputLinks(3)=(LinkDesc="Object Delivered")
   ObjName="Collect Trigger Event"
   ObjCategory="KF"
   Name="Default__KFSeqEvent_CollectTrigger"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
