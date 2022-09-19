//=============================================================================
// KFSeqCond_IsWeeklyEvent
//=============================================================================
// Condition to check if we are in an specified weekly event
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================
class KFSeqCond_IsWeeklyEvent extends SequenceCondition;

var() int WeeklyIndex;

function Activated()
{
   local KFGameReplicationInfo KFGRI;
   KFGRI = KFGameReplicationInfo(GetWorldInfo().GRI);

   if (KFGRI != none && KFGRI.bIsWeeklyMode && KFGRI.CurrentWeeklyIndex == WeeklyIndex)
   {
      OutputLinks[0].bHasImpulse = true;
   }
   else
   {
      OutputLinks[1].bHasImpulse = true;
   }
}

defaultproperties
{
   OutputLinks(0)=(LinkDesc="True")
   OutputLinks(1)=(LinkDesc="False")
   ObjName="IsWeeklyEvent"
   ObjColor=(B=255,G=0,R=255,A=255)
   Name="Default__KFSeqCond_IsWeeklyEvent"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
