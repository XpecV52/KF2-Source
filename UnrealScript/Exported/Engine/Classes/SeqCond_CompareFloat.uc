/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqCond_CompareFloat extends SequenceCondition
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

var() float ValueA;

var() float ValueB;

defaultproperties
{
   OutputLinks(0)=(LinkDesc="A <= B")
   OutputLinks(1)=(LinkDesc="A > B")
   OutputLinks(2)=(LinkDesc="A == B")
   OutputLinks(3)=(LinkDesc="A < B")
   OutputLinks(4)=(LinkDesc="A >= B")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="A",PropertyName="ValueA")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="B",PropertyName="ValueB")
   ObjName="Compare Float"
   ObjCategory="Comparison"
   Name="Default__SeqCond_CompareFloat"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
