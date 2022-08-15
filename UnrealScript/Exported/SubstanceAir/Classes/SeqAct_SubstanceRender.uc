//! @file SeqAct_SubstanceRender.uc
//! @author Antoine Gonzalez - Allegorithmic
//! @copyright Allegorithmic. All rights reserved.
//!
//! @brief Kismet sequence action to modify a Substance Air input

class SeqAct_SubstanceRender extends SequenceAction
	native(Sequence);

var() bool								bSynchronousRendering;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   InputLinks(0)=(LinkDesc="Set")
   ObjName="Substance Render"
   ObjCategory="Substance"
   Name="Default__SeqAct_SubstanceRender"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
