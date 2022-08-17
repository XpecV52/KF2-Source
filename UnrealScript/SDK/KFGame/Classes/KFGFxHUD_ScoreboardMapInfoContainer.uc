//=============================================================================
// KFGFxHUD_ScoreboardMapInfoContainer
//=============================================================================
// Stores and displays the current round information.  This includes time, map
// difficulty and wave.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 9/26/2014
//=============================================================================


class KFGFxHUD_ScoreboardMapInfoContainer extends GFxObject;

// Cached value - Elapsed match time as of the last scoreboard tick update.
var Protected int LastMatchTime;
var localized string WaveString;
var localized string FinalString;

var int CurrentGameDifficulty;
var string GameTypeString;
var bool bLocalized; 

function InitializeHUD()
{
	UpdateWaveCount();
}

function LocalizeText()
{
	local string CurrentMapName;
    local GFxObject LocalizedObject;
    local string MatchInfoString;
    local string GameDifficultyString;

	CurrentMapName = GetPC().WorldInfo.GetMapName();	

	GameTypeString = class'KFCommon_LocalizedStrings'.static.GetGameModeString(0);

	if(GetPC().WorldInfo.GRI != none)
	{
		CurrentGameDifficulty = KFGameReplicationInfo(GetPC().WorldInfo.GRI).GameDifficulty;

		GameDifficultyString =  class'KFCommon_LocalizedStrings'.static.GetDifficultyString(CurrentGameDifficulty);
		GameTypeString =   class'KFCommon_LocalizedStrings'.static.GetGameModeString(0);
    	MatchInfoString = GameTypeString @"-" @GameDifficultyString;
	}

	

	LocalizedObject = CreateObject( "Object" );

	LocalizedObject.SetString("waveText", WaveString);
	LocalizedObject.SetString("mapText", GetFriendlyMapName(CurrentMapName));
	LocalizedObject.SetString("matchInfo", MatchInfoString);
	
	SetObject("localizeText", LocalizedObject);

	bLocalized = true;
}

function string GetFriendlyMapName(string MapName)
{
	local KFMapSummary MapData;

	MapData = class'KFUIDataStore_GameResource'.static.GetMapSummaryFromMapName(MapName);

	if ( MapData != none && MapData.DisplayName != "")
	{
		return MapData.DisplayName;
	}
	else
	{
     	return MapName;
	}
}

// Elapsed time, difficulty, map name.
function UpdateMatchInfo()
{
	local KFGameReplicationInfo KFGRI;
	local int CurrentMatchTime;	
	

    KFGRI = KFGameReplicationInfo(GetPC().WorldInfo.GRI);
    if(KFGRI != none)
    {
    	if(!bLocalized)
    	{
    		LocalizeText();
    	}

        CurrentmatchTime = KFGRI.ElapsedTime;
        if(CurrentMatchTime != LastMatchTime)
        {
            // Send match time to actionscript
            SetInt("timeValue" ,CurrentMatchTime);
            LastMatchTime = CurrentMatchTime;
        }
    }
}

function UpdateWaveCount()
{
	local int CurrentWaveNum;
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(GetPC().WorldInfo.GRI);

	if(KFGRI == none)
	{
		return;
	}

	CurrentWaveNum = KFGRI.WaveNum;
    if(CurrentWaveNum == KFGRI.WaveMax-1)
    {
	    	SetString("waveNumber", FinalString);
    		
    }
    else
    {
    	SetString("waveNumber" ,CurrentWaveNum $"/" $(KFGRI.WaveMax-1));    	
    }
}

defaultProperties
{
	bLocalized=false
}