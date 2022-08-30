//=============================================================================
// KFSeqEvent_ExterminateWavePct
//=============================================================================
// Event telling Kismet that exterminate objective progress has been made
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFSeqEvent_ExterminateWavePct extends KFSeqEvent_ObjectiveProgress;

defaultproperties
{
   OutputLinkText="Wave Completion Percent"
   ObjName="Exterminate Wave Completion Pct"
   Name="Default__KFSeqEvent_ExterminateWavePct"
   ObjectArchetype=KFSeqEvent_ObjectiveProgress'KFGame.Default__KFSeqEvent_ObjectiveProgress'
}
