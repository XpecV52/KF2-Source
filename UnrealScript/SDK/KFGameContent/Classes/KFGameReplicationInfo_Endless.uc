//=============================================================================
// KFGameReplicationInfo_Endless
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFGameReplicationInfo_Endless extends KFGameReplicationInfo;

// What wave will a boss fight happen.
const BOSS_WAVE = 5;

var int CurrentWeeklyMode;
var int CurrentSpecialMode;

replication
{
	if (bNetDirty)
		CurrentSpecialMode, CurrentWeeklyMode;
}

simulated function bool IsFinalWave()
{
	return false;
}

simulated function bool IsBossWave()
{
	return WaveNum > 0 && WaveNum % BOSS_WAVE == 0;
}

simulated function bool IsBossWaveNext()
{
	return WaveNum > 0 && (WaveNum + 1) % BOSS_WAVE == 0;
}

simulated function bool IsSpecialWave(out int ModIndex)
{
	ModIndex = CurrentSpecialMode;
	return CurrentSpecialMode != INDEX_NONE;
}

simulated function bool IsWeeklyWave(out int ModIndex)
{
	if (CurrentWeeklyMode != INDEX_NONE)
	{
		ModIndex = class'KFOutbreakEvent_Endless'.static.GetOutbreakId(CurrentWeeklyMode);
	}
	return CurrentWeeklyMode != INDEX_NONE;
}

simulated function WaveStarted()
{
	local int ModeIndex;
	if(IsSpecialWave(ModeIndex) || IsWeeklyWave(ModeIndex))
	{
		class'KFTraderDialogManager'.static.BroadcastEndlessSpecialWaveDialog(ModeIndex, WorldInfo);
	}
	else
	{
		class'KFTraderDialogManager'.static.BroadcastEndlessStartWaveDialog(WaveNum, WorldInfo);
	}
}

DefaultProperties
{
	bEndlessMode=True
	CurrentWeeklyMode=INDEX_NONE
	CurrentSpecialMode=INDEX_NONE
}
