/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_ConvertToString extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() bool bIncludeVarComment;
var() string VarSeparator;
var() int NumberOfInputs;

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

defaultproperties
{
   bIncludeVarComment=True
   VarSeparator=", "
   NumberOfInputs=1
   VariableLinks(0)=(LinkDesc="Inputs",bAllowAnyType=True)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_String',LinkDesc="Output",bWriteable=True)
   ObjName="Convert To String"
   ObjCategory="Misc"
   Name="Default__SeqAct_ConvertToString"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
