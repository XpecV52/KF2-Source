/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * Event mapped to touch input.
 */
class SeqEvent_TouchInput extends SequenceEvent
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

/** Should the input be eaten by the event, or allowed to propagate to gameplay? */
var() bool bTrapInput;

/** -1 for any player, or an index of a specific player to restrict to */
var() int AllowedPlayerIndex;

/** -1 for any player, or an index of a specific player to restrict to */
var() int AllowedTouchIndex;

/** -1 for any player, or an index of a specific player to restrict to */
var() int AllowedTouchpadIndex;

defaultproperties
{
   bTrapInput=True
   AllowedPlayerIndex=-1
   MaxTriggerCount=0
   OutputLinks(0)=(LinkDesc="Pressed")
   OutputLinks(1)=(LinkDesc="Repeated")
   OutputLinks(2)=(LinkDesc="Released")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Touch X")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Touch Y")
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Touch Index")
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Touchpad Index")
   ObjName="Touch Input"
   ObjCategory="Input"
   Name="Default__SeqEvent_TouchInput"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
