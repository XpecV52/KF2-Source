//=============================================================================
// KFSeqEvent_WaveStart
//=============================================================================
// Event telling Kismet a new wave started
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFSeqEvent_WaveStart extends SequenceEvent;

DefaultProperties
{
	ObjName="Wave Started Event"
	VariableLinks.Empty
	bPlayerOnly=false
	OutputLinks(0)=(LinkDesc="Start wave Logic")
}
