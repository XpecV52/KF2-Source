//=============================================================================
// KFSeqEvent_TraderOpened
//=============================================================================
// Event telling Kismet the trader opened
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFSeqEvent_TraderOpened extends SequenceEvent;

DefaultProperties
{
	ObjName="On Trader Opened Event"
	VariableLinks.Empty
	bPlayerOnly=false
	OutputLinks(0)=(LinkDesc="Start Objective Logic")
}
