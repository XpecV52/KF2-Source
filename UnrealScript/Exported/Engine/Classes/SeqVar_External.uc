/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqVar_External extends SequenceVariable
	within Sequence
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

/** */
var() class<SequenceVariable> ExpectedType;

/** Name of the variable link to create on the parent sequence */
var() string VariableLabel;

defaultproperties
{
   VariableLabel="Default Var"
   ObjName="External Variable"
   Name="Default__SeqVar_External"
   ObjectArchetype=SequenceVariable'Engine.Default__SequenceVariable'
}
