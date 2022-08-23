//=============================================================================
// KFGFxHUD_WaveInfo
//=============================================================================
// HUD container that stores information about the current wave.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Alex Quick 5/28/2014
//=============================================================================

class KFGFxHUD_WaveInfo extends GFxObject;

/** Cached KFPlayerController */
var KFGameReplicationinfo 				KFGRI;
//
var int LastWaveMax;
//
var int LastZEDCount;
//
var int LastWave;
//
var int LastTraderTimeRemaining;

var localized string WaveString;
var localized string BossWaveString;
var localized string FinalWaveString;


function InitializeHUD()
{
	SetString("waveText", WaveString);
    SetString("bossText", BossWaveString); 
    SetString("finalText", FinalWaveString);
    UpdateWaveCount();
}

function TickHud(float DeltaTime)
{
    if(KFGRI == none)
    {
        KFGRI = KFGameReplicationInfo(GetPC().WorldInfo.GRI);
    }
    else
    {
        if(KFGRI.bTraderIsOpen)
        {
            UpdateTraderTimeRemaining();
        }
        else
        {
            UpdateZEDCount();
        }
    }
}


function UpdateWaveCount()
{
    local int CurrentWaveMax,CurrentWave;

    if( KFGRI == none )
    {
        KFGRI = KFGameReplicationInfo( GetPC().WorldInfo.GRI );
    }

    if( KFGRI == none )
    {
        return;
    }

    // Max # of waves.
    CurrentWaveMax = KFGRI.WaveMax-1;
    if(LastWaveMax != CurrentWaveMax)
    {
        SetInt("maxWaves" ,CurrentWaveMax);
        LastWaveMax = CurrentWaveMax;
    }

    // Current wave we're on.
    CurrentWave = KFGRI.WaveNum;
    if(CurrentWave != LastWave)
    {
        SetInt("currentWave" ,CurrentWave);
        LastWave = CurrentWave;
    }
}

function UpdateZEDCount()
{
    local int CurrentZEDCount;

    if( KFGRI == none )
    {
        return;
    }

    if(KFGRI.IsFinalWave())
    {
        SetInt("remainingZEDs" , INDEX_NONE);
        return;
    }

    // # of ZEDs left to kill in this wave.
    CurrentZEDCount = KFGRI.AIRemaining;
    if(LastZEDCount != CurrentZEDCount)
    {
        SetInt("remainingZEDs" ,CurrentZEDCount);
        LastZEDCount = CurrentZEDCount;
    }
}

function UpdateTraderTimeRemaining()
{
    local int CurrentTraderTimeRemaining;

    if( KFGRI == none )
    {
        return;
    }

    CurrentTraderTimeRemaining = KFGRI.GetTraderTimeRemaining();
    if(LastTraderTimeRemaining != CurrentTraderTimeRemaining)
    {
        SetInt("remainingTraderTime" ,CurrentTraderTimeRemaining);
        LastTraderTimeRemaining = CurrentTraderTimeRemaining;
    }
}


DefaultProperties
{
    LastTraderTimeRemaining=0
    LastZEDCount=0
}
