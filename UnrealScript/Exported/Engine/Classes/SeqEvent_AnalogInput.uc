/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * Event mapped to analog input.
 */
class SeqEvent_AnalogInput extends SequenceEvent
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Should the input be eaten by the event, or allowed to propagate to gameplay? */
var() bool bTrapInput;

/** -1 for any player, or an index of a specific player to restrict to */
var() int AllowedPlayerIndex;

/** The binding to listen to - this can be something like MouseX, XboxTypeS_LeftX, Tilt  - NOT aStrafe, aBaseX, etc */
var() array<name> InputNames;

defaultproperties
{
   bTrapInput=True
   AllowedPlayerIndex=-1
   MaxTriggerCount=0
   OutputLinks(0)=(LinkDesc="Output")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_String',LinkDesc="Input Name")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Float Value")
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Vector Value")
   ObjName="Analog Input"
   ObjCategory="Input"
   Name="Default__SeqEvent_AnalogInput"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
