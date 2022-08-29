//=============================================================================
// KFSeqEvent_EscortPawnsHealthPct
//=============================================================================
// Event telling Kismet that escort objective health progress has been made
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFSeqEvent_EscortPawnsHealthPct extends KFSeqEvent_ObjectiveProgress;

defaultproperties
{
   bUseReverseProgress=True
   OutputLinkText="Health Percent"
   ObjName="Escort Health Pct"
   Name="Default__KFSeqEvent_EscortPawnsHealthPct"
   ObjectArchetype=KFSeqEvent_ObjectiveProgress'KFGame.Default__KFSeqEvent_ObjectiveProgress'
}
