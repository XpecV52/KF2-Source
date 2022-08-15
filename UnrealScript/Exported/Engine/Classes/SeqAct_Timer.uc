/**
 * Simple action that records the amount of time elapsed
 * between activating the first link "Start" and the second
 * link "Stop".
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_Timer extends SequenceAction
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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** World time at point of activation */
var transient float ActivationTime;

/** Amount of time this timer has been active */
var() float Time;

defaultproperties
{
   bLatentExecution=True
   InputLinks(0)=(LinkDesc="Start")
   InputLinks(1)=(LinkDesc="Stop")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Time",PropertyName="Time")
   ObjName="Timer"
   ObjCategory="Misc"
   Name="Default__SeqAct_Timer"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
