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

function SetWaveNum( int WaveNum, int WaveMax )
{
	local SeqVar_Int SeqInt;
	local SeqVar_Float SeqFloat;

	foreach LinkedVariables( class'SeqVar_Int', SeqInt, "Wave Number" )
	{
		SeqInt.IntValue = WaveNum;
	}

	foreach LinkedVariables( class'SeqVar_Int', SeqInt, "Wave Max" )
	{
		SeqInt.IntValue = WaveMax;
	}

	foreach LinkedVariables( class'SeqVar_Float', SeqFloat, "Wave Pct Complete" )
	{
		SeqFloat.FloatValue = 100.f * ( float(WaveNum) / float(WaveMax) );
	}
}

defaultproperties
{
   bPlayerOnly=False
   OutputLinks(0)=(LinkDesc="Normal Wave")
   OutputLinks(1)=(LinkDesc="Boss Wave")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Wave Number")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Wave Max",bWriteable=True)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Wave Pct Complete",bWriteable=True)
   ObjName="Wave Started Event"
   Name="Default__KFSeqEvent_WaveStart"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
