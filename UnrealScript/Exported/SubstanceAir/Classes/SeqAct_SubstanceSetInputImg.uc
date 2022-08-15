//! @file SeqAct_SubstanceSetInputImg.uc
//! @author Antoine Gonzalez - Allegorithmic
//! @copyright Allegorithmic. All rights reserved.
//!
//! @brief Kismet sequence action to modify a Substance Air input

class SeqAct_SubstanceSetInputImg extends SequenceAction
	native(Sequence);

var() array<SubstanceAirGraphInstance>	GraphInstances;
var() Name								InputName;
var() Object							InputValue;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   InputLinks(0)=(LinkDesc="Set")
   ObjName="Set Input (Image)"
   ObjCategory="Substance"
   Name="Default__SeqAct_SubstanceSetInputImg"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
