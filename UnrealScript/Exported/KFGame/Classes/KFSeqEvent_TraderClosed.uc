//=============================================================================
// KFSeqEvent_TraderClosed
//=============================================================================
// Event telling Kismet the trader closed
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFSeqEvent_TraderClosed extends SequenceEvent;

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
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Wave Number")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Wave Max",bWriteable=True)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Wave Pct Complete",bWriteable=True)
   ObjName="On Trader Closed Event"
   Name="Default__KFSeqEvent_TraderClosed"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
