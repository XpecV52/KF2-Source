/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SubtractInt extends SeqAct_SetSequenceVariable
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

var() int ValueA;
var() int ValueB;
var float FloatResult;
var int IntResult;

defaultproperties
{
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="A",PropertyName="ValueA")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="B",PropertyName="ValueB")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="IntResult",PropertyName="IntResult",bWriteable=True)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="FloatResult",PropertyName="FloatResult",bWriteable=True)
   ObjName="Subtract Int"
   ObjCategory="Math"
   Name="Default__SeqAct_SubtractInt"
   ObjectArchetype=SeqAct_SetSequenceVariable'Engine.Default__SeqAct_SetSequenceVariable'
}
