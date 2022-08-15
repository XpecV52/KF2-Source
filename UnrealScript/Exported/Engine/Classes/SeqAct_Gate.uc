/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_Gate extends SequenceAction
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

/** Is this gate currently open? */
var() bool bOpen<autocomment=true>;

/** Auto close after this many activations */
var() int AutoCloseCount;

/** Current threshold for closing the gate (increments to keep pace with ActivateCount)  */
var int CurrentCloseCount;

defaultproperties
{
   bOpen=True
   bAutoActivateOutputLinks=False
   InputLinks(1)=(LinkDesc="Open")
   InputLinks(2)=(LinkDesc="Close")
   InputLinks(3)=(LinkDesc="Toggle")
   ObjName="Gate"
   ObjCategory="Misc"
   bSuppressAutoComment=False
   Name="Default__SeqAct_Gate"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
