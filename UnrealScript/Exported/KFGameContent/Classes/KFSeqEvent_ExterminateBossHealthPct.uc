//=============================================================================
// KFSeqEvent_ExterminateBossHealthPct
//=============================================================================
// Event telling Kismet that exterminate objective boss progress has been made
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFSeqEvent_ExterminateBossHealthPct extends KFSeqEvent_ObjectiveProgress;

defaultproperties
{
   bUseReverseProgress=True
   OutputLinkText="Boss Health Percent"
   ObjName="Exterminate Boss Health Pct"
   Name="Default__KFSeqEvent_ExterminateBossHealthPct"
   ObjectArchetype=KFSeqEvent_ObjectiveProgress'KFGame.Default__KFSeqEvent_ObjectiveProgress'
}
