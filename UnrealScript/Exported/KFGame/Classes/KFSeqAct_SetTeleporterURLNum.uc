//=============================================================================
// KFSeqAct_ShowPath
//=============================================================================
// Action that creates a trail path to any actor.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSeqAct_SetTeleporterURLNum extends SequenceAction;

defaultproperties
{
   HandlerName="OnSetURLNum"
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Value",MaxVars=1)
   ObjName="Set Teleporter URL Num"
   ObjCategory="Killing Floor"
   Name="Default__KFSeqAct_SetTeleporterURLNum"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
