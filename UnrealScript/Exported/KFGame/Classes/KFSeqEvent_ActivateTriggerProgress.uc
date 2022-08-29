//=============================================================================
// KFSeqEvent_ActivateTriggerProgress
//=============================================================================
// Events telling Kismet of various progress that has occurred during
// an ActivateTrigger objective
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSeqEvent_ActivateTriggerProgress extends KFSeqEvent_ObjectiveProgress;

enum EActivateTriggerProgressEvent
{
	EActivateTriggerProgressEvent_TriggerPulled,
	EActivateTriggerProgressEvent_TriggerReady,
	EActivateTriggerProgressEvent_ZoneEnabled,
	EActivateTriggerProgressEvent_ZoneDisabled,
	EActivateTriggerProgressEvent_MAX,
};

defaultproperties
{
   ProgressOutputStartIndex=4
   OutputLinks(0)=(LinkDesc="Trigger Pulled")
   OutputLinks(1)=(LinkDesc="Trigger Ready")
   OutputLinks(2)=(LinkDesc="Zone Enabled")
   OutputLinks(3)=(LinkDesc="Zone Disabled")
   ObjName="Activate Trigger Progress"
   Name="Default__KFSeqEvent_ActivateTriggerProgress"
   ObjectArchetype=KFSeqEvent_ObjectiveProgress'KFGame.Default__KFSeqEvent_ObjectiveProgress'
}
