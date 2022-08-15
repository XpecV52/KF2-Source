/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_AndGate extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Is this gate currently open? */
var transient bool bOpen;

/** Mirrors the InputLinks array, hold data whether a specific input has fired. */
var transient array<bool>			LinkedOutputFiredStatus;

/** Cached array of linked input ops for this gate, so we can track that they have all fired. */
var transient native array<pointer>	LinkedOutputs{FSeqOpOutputLink};

defaultproperties
{
   bAutoActivateOutputLinks=False
   ObjName="AND Gate"
   ObjCategory="Misc"
   Name="Default__SeqAct_AndGate"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
