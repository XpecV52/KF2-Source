/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * Event mapped to button/key input.
 */
class SeqEvent_Input extends SequenceEvent
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

/** Should the input be eaten by the event, or allowed to propagate to gameplay? */
var() bool bTrapInput;

/** -1 for any player, or an index of a specific player to restrict to */
var() int AllowedPlayerIndex;

/** The binding to listen to - this can be something like SpaceBar, XboxTypeS_A, Fire, or GBA_Jump */
var() array<name> InputNames;

defaultproperties
{
   bTrapInput=True
   AllowedPlayerIndex=-1
   MaxTriggerCount=0
   ReTriggerDelay=0.010000
   OutputLinks(0)=(LinkDesc="Pressed")
   OutputLinks(1)=(LinkDesc="Repeated")
   OutputLinks(2)=(LinkDesc="Released")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_String',LinkDesc="Input Name")
   ObjName="Key/Button Pressed"
   ObjCategory="Input"
   Name="Default__SeqEvent_Input"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
