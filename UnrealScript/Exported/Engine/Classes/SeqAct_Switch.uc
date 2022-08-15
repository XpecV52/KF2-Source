/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_Switch extends SequenceAction
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

/** Total number of links to expose */
var() int LinkCount;

/** Number to increment attached variables upon activation */
var() int IncrementAmount;

/** Loop index back to beginning to cycle */
var() bool bLooping;

/** List of links to activate */
var() array<int> Indices;

/** Automatically disable an output once its activated? */
var() bool bAutoDisableLinks;

defaultproperties
{
   LinkCount=1
   IncrementAmount=1
   Indices(0)=1
   OutputLinks(0)=(LinkDesc="Link 1")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Index",PropertyName="Indices")
   ObjName="Switch"
   ObjCategory="Switch"
   Name="Default__SeqAct_Switch"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
