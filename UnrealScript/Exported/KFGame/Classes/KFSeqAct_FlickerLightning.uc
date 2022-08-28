//=============================================================================
// KFSeqAct_FlickerLightning
//=============================================================================
// Action that starts animation on KFDominantDirectionalLightning
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFSeqAct_FlickerLightning extends SequenceAction;

event Activated()
{
	local SeqVar_Object ObjVar;
	local KFDominantDirectionalLightning Lightning;
	
	if (InputLinks[0].bHasImpulse)
	{
		// Grab our trader
		foreach LinkedVariables(class'SeqVar_Object', ObjVar, "KF Dominant Directional Lightning")
		{
			Lightning = KFDominantDirectionalLightning(ObjVar.GetObjectValue());
			break;
		}

		// Sanity
		if (Lightning == none)
		{
			return;
		}

		Lightning.TriggerAnimation();
	}
}

defaultproperties
{
   bCallHandler=False
   InputLinks(0)=(LinkDesc="Start")
   VariableLinks(0)=(LinkDesc="KF Dominant Directional Lightning",PropertyName=,MaxVars=1)
   ObjName="Flicker Lightning"
   ObjCategory="Killing Floor"
   Name="Default__KFSeqAct_FlickerLightning"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
