//=============================================================================
// KFSeqEvent_ObjectiveStart
//=============================================================================
// Event that tells Kismet to start an objective
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFSeqEvent_ObjectiveStart extends SequenceEvent;

DefaultProperties
{
	ObjName="Start Objective Event"
	VariableLinks.Empty
	bPlayerOnly=false
	OutputLinks(0)=(LinkDesc="Start Objective Logic")
}
