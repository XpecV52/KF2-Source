//=============================================================================
// KFSeqEvent_CollectActorsProgress
//=============================================================================
// Event telling Kismet that collect actor objective progress has been made
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFSeqEvent_CollectActorsProgress extends KFSeqEvent_ObjectiveProgress;

defaultproperties
{
   OutputLinkText="Total Collection %"
   ObjName="Collect Actors Progress"
   Name="Default__KFSeqEvent_CollectActorsProgress"
   ObjectArchetype=KFSeqEvent_ObjectiveProgress'KFGame.Default__KFSeqEvent_ObjectiveProgress'
}
