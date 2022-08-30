//=============================================================================
// KFSeqEvent_HoldZoneProgress
//=============================================================================
// Event telling Kismet that hold zone objective progress has been made
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFSeqEvent_HoldZoneProgress extends KFSeqEvent_ObjectiveProgress;

enum EHoldZoneProgressEvent
{
	EHoldZoneProgressEvent_ZoneDisabled,
	EHoldZoneProgressEvent_ZoneEnabled
};

defaultproperties
{
   OutputLinkText="Progress Pct"
   ProgressOutputStartIndex=2
   OutputLinks(0)=(LinkDesc="Zone Disabled")
   OutputLinks(1)=(LinkDesc="Zone Enabled")
   ObjName="Hold Zone Progress"
   Name="Default__KFSeqEvent_HoldZoneProgress"
   ObjectArchetype=KFSeqEvent_ObjectiveProgress'KFGame.Default__KFSeqEvent_ObjectiveProgress'
}
