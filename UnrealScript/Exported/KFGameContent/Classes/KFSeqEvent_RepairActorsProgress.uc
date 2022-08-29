//=============================================================================
// KFSeqEvent_RepairActorsProgress
//=============================================================================
// Event telling Kismet that repair actor objective progress has been made
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFSeqEvent_RepairActorsProgress extends KFSeqEvent_ObjectiveProgress;

defaultproperties
{
   OutputLinkText="Total Repair %"
   ObjName="Repair Actors Progress"
   Name="Default__KFSeqEvent_RepairActorsProgress"
   ObjectArchetype=KFSeqEvent_ObjectiveProgress'KFGame.Default__KFSeqEvent_ObjectiveProgress'
}
