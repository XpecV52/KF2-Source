//=============================================================================
// KFSeqEvent_EscortPawnsCompletionPct
//=============================================================================
// Event telling Kismet that escort objective progress has been made
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFSeqEvent_EscortPawnsCompletionPct extends KFSeqEvent_ObjectiveProgress;

defaultproperties
{
   OutputLinkText="Completion Percent"
   ObjName="Escort Completion Pct"
   Name="Default__KFSeqEvent_EscortPawnsCompletionPct"
   ObjectArchetype=KFSeqEvent_ObjectiveProgress'KFGame.Default__KFSeqEvent_ObjectiveProgress'
}
