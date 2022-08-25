//=============================================================================
// KFGFxTraderContainer_GameInfo
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 8/14/2014
//=============================================================================

class KFGFxTraderContainer_GameInfo extends KFGFxObject_Container;

var localized string TimeLeftString, WaveString, BossWaveString;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );

	UpdateGameInfo();
}

function UpdateGameInfo()
{
	local KFGameReplicationInfo KFGRI;
	local string FinalWaveString;

	KFGRI = KFGameReplicationInfo( GetPC().WorldInfo.GRI );
	if ( KFGRI != none )
	{
		if (KFGRI.IsBossWave())
		{
			// The last wave is always for the boss
			FinalWaveString = BossWaveString;
		}
		else
		{
			// Show the upcoming wave number for every wave except the boss wave
			if (KFGRI.default.bEndlessMode)
			{
				// Show wave number, since there is no max
				FinalWaveString = WaveString @ (KFGRI.WaveNum);
			}
			else
			{
				// Show the upcoming wave number for every wave except the boss wave
				FinalWaveString = WaveString @ (KFGRI.WaveNum) $"/"$(KFGRI.WaveMax - 1);
			}
		}

		SetString("waveValue", FinalWaveString);
		SetString("timeLabel", TimeLeftString);
	}
	UpdateTraderTimer();
}

function UpdateTraderTimer()
{
	local KFGameReplicationInfo KFGRI;
	local int CurrentTime;

	KFGRI = KFGameReplicationInfo( GetPC().WorldInfo.GRI );
	if ( KFGRI != none)
	{
		CurrentTime =  KFGRI.GetTraderTimeRemaining();
		SetInt("timeValue", CurrentTime);
	}
}

function SetDosh(int DoshValue)
{
 	SetInt("dosh", DoshValue);
}

function SetCurrentWeight(int TotalBlocks, int MaxBlocks)
{
	SetString("currentWeight", TotalBlocks $"/" $MaxBlocks);
}

defaultproperties
{
   TimeLeftString="TIME LEFT"
   WaveString="WAVE"
   BossWaveString="BOSS"
   Name="Default__KFGFxTraderContainer_GameInfo"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
