//=============================================================================
// KFSeqAct_DisableDoor
//=============================================================================
// Disables one or more KFDoorActors, meaning they can't be interacted
// with or damaged
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFSeqAct_DisableDoor extends SequenceAction;

event Activated()
{
	local SeqVar_Object ObjVar;
	local KFDoorActor Door;

	if (InputLinks[0].bHasImpulse)
	{
		foreach LinkedVariables(class'SeqVar_Object',ObjVar,"KFDoorActor(s)")
		{
			Door = KFDoorActor(ObjVar.GetObjectValue());
			Door.SetInteractive(false);
			Door.bIsDoorOpen = true;
			Door.UseDoor(none);
		}
	}
}

defaultproperties
{
   bCallHandler=False
   InputLinks(0)=(LinkDesc="Disable")
   VariableLinks(0)=(LinkDesc="KFDoorActor(s)",PropertyName=)
   ObjName="Disable Door"
   ObjCategory="Killing Floor"
   Name="Default__KFSeqAct_DisableDoor"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
