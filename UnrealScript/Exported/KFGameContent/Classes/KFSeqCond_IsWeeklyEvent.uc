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
   local KFGameInfo KFGI;
   KFGI = KFGameInfo(GetWorldInfo().Game);

   if (KFGI != none)
   {
      if (KFGI.MyKFGRI != none && KFGI.MyKFGRI.bIsWeeklyMode && class'KFGameEngine'.static.GetWeeklyEventIndexMod() == WeeklyIndex)
      {
         OutputLinks[0].bHasImpulse = true;
         OutputLinks[0].bHasImpulse = false;
      }
      else
      {
         OutputLinks[0].bHasImpulse = false;
         OutputLinks[0].bHasImpulse = true;
      }
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
