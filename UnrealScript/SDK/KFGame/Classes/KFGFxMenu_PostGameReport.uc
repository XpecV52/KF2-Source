//=============================================================================
// KFGFxMenu_PostGameReport
//=============================================================================
// This menu is used to show the player's options for leaving the game.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  Zane Gholson -  05/19/2015
//=============================================================================

class KFGFxMenu_PostGameReport extends KFGFxObject_Menu;

var localized string MapVoteString;
var localized string PlayerStatsString;
var localized string TeamAwardsString;
var localized string PostGameReportString;
var localized string NextMapString;
var localized string WaveString;
var localized string XPString;
var localized string VictoryString;
var localized string DefeatString;

var KFGFxPostGameContainer_PlayerStats 		PlayerStatsContainer;
var KFGFxPostGameContainer_MapVote 			MapVoteContainer;
var KFGFxPostGameContainer_TeamAwards 		TeamAwardsContainer;
var KFGFxPostGameContainer_PlayerXP			playerXPContainer;
var KFGFxHUD_ChatBoxWidget 					ChatBoxWidget;

var int LastNextMapTimeRemaining;

var array<KFPlayerReplicationInfo> CurrentPlayerList, TalkerPRIs;

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu( InManager );
	LocalizeText();
	SetPlayerInfo();
	SetSumarryInfo();
	InitPlayerList();
}

function OneSecondLoop()
{
	UpdateNextMapTime();
}

function LocalizeText()
{
	local GFxObject TextObject;
	local WorldInfo WI;

    WI = class'WorldInfo'.static.GetWorldInfo();

	TextObject = CreateObject("Object");

	TextObject.SetString("nextMap", 	NextMapString);
	TextObject.SetString("mapVote", 	MapVoteString);
	TextObject.SetString("playerStats", PlayerStatsString);
	TextObject.SetString("xp", 			XPString);
	TextObject.SetString("teamAwards", 	TeamAwardsString);

	if(WI != none &&  WI.NetMode != NM_Standalone )
    {
        if(WI.GRI != none)
        {
            TextObject.SetString("serverName", WI.GRI.ServerName);    
        }
        TextObject.SetString("serverIP", WI.GetAddressURL());
    }

	SetObject("localizedText", TextObject);
}

function SetSumarryInfo()
{
    local string GameDifficultyString;
    local string GameTypeString;
    local string CurrentMapName;
    local KFGameReplicationInfo KFGRI;
	local GFxObject TextObject;
	TextObject = CreateObject("Object");

	//Get match info
	CurrentMapName = GetPC().WorldInfo.GetMapName();	

	GameTypeString = class'KFCommon_LocalizedStrings'.static.GetGameModeString(0);

	if(GetPC().WorldInfo.GRI != none)
	{
		KFGRI = KFGameReplicationInfo(GetPC().WorldInfo.GRI);

		GameDifficultyString =  class'KFCommon_LocalizedStrings'.static.GetDifficultyString(KFGRI.GameDifficulty);
		GameTypeString =   class'KFCommon_LocalizedStrings'.static.GetGameModeString(0);

    	TextObject.SetString("mapName", CurrentMapName);
		TextObject.SetString("typeDifficulty", GameTypeString @"-" @GameDifficultyString);
		TextObject.SetString("waveTime", WaveString @KFGRI.WaveNum $"/" $(KFGRI.WaveMax - 1) @"-" @FormatTime(KFGRI.ElapsedTime));
		TextObject.SetString("winLost", KFGRI.bMatchVictory ? VictoryString : DefeatString);
	}
	//end get match info

	SetObject("gameSummary", TextObject);
}

function SetPlayerInfo()
{
	local GFxObject TextObject;
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetPC());

	TextObject = CreateObject("Object");

	TextObject.SetString("playerName", KFPC.PlayerReplicationInfo.PlayerName);
	TextObject.SetString("perkIcon", "img://"$KFPC.CurrentPerk.GetPerkIconPath());
	TextObject.SetString("perkName", KFPC.CurrentPerk.default.PerkName);
	TextObject.SetInt("perkLevel", KFPC.GetLevel());

	SetObject("playerInfo", TextObject);
}

function InitPlayerList()
{
	local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(GetPC().Worldinfo.GRI);
    if(KFGRI != none)
    {
        KFGRI.GetKFPRIArray(CurrentPlayerList);
    }
    SendVoipData();
}

function SendVoipData()
{
    local int i;
	local GFxObject DataProvider, TempObj;
	
	DataProvider = CreateArray();

	for ( i = 0; i < CurrentPlayerList.length; i++ )
	{
		TempObj = CreateObject( "Object" );
		TempObj.SetString( "label", CurrentPlayerList[i].PlayerName );
		TempObj.SetBool("bTalking", (TalkerPRIs.Find(CurrentPlayerList[i]) != INDEX_NONE));
		DataProvider.SetElementObject( i, TempObj );
	}

	SetObject( "playerList", DataProvider );
}

function VOIPEventTriggered(PlayerReplicationInfo TalkerPRI, bool bIsTalking)
{
	local KFPlayerReplicationInfo KFPRI;
	KFPRI = KFPlayerReplicationInfo(TalkerPRI);
	
	if ( KFPRI == none )
	{
		return;
	}

	if ( !bIsTalking )
	{
		TalkerPRIs.RemoveItem(KFPRI);
	}
	else
	{
		if(TalkerPRIs.Find(KFPRI) != INDEX_NONE)
		{
			TalkerPRIs.RemoveItem(KFPRI);
		}
		if(!GetPC().IsPlayerMuted(KFPRI.UniqueId))
		{
			TalkerPRIs.AddItem(KFPRI);
		}
	}
	SendVoipData();
}

function UpdateNextMapTime()
{
	local int CurrentNextMapTimeRemaining;
	local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(GetPC().WorldInfo.GRI);

    CurrentNextMapTimeRemaining = KFGRI.GetTraderTimeRemaining();
    if(LastNextMapTimeRemaining != CurrentNextMapTimeRemaining)
    {
        SetInt("remainingTime" ,CurrentNextMapTimeRemaining);
        LastNextMapTimeRemaining = CurrentNextMapTimeRemaining;
    }
}

function  string FormatTime(int TimeInSeconds)
{
	local string TimeString;
	local int Minutes;
	

	Minutes = TimeInSeconds / 60;
	TimeInSeconds -= Minutes * 60;

	TimeString = String(Minutes) $ ":";

	if( TimeInSeconds >= 10 )
	{
		TimeString = TimeString $ String(TimeInSeconds);
	}	
	else
	{
		TimeString = TimeString $ "0" $ String(TimeInSeconds);
	}

	return TimeString;
}

function OnOpen()
{
	
}

/** Ties the GFxClikWidget variables to the .swf components and handles events */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    switch (WidgetName)
    {
        case 'playerStatsContainer':
            if(PlayerStatsContainer == none)
            {
                PlayerStatsContainer = KFGFxPostGameContainer_PlayerStats(Widget);
                PlayerStatsContainer.PlayerStatsString = PlayerStatsString;
                PlayerStatsContainer.Initialize( self );
            }
        break;   
     
        case 'mapVoteContainer':
			if(MapVoteContainer == none)
            {
                MapVoteContainer = KFGFxPostGameContainer_MapVote(Widget);
                MapVoteContainer.MapVoteString = MapVoteString;
                MapVoteContainer.Initialize( self );
            }
        break;

        case 'teamAwardsContainer':
        	if(teamAwardsContainer == none)
            {
                teamAwardsContainer = KFGFxPostGameContainer_TeamAwards(Widget);
                teamAwardsContainer.Initialize( self );
            }
            break;
       case 'playerXPContainer':
	    	if(playerXPContainer == none)
	        {
	            playerXPContainer = KFGFxPostGameContainer_PlayerXP(Widget);
	            playerXPContainer.Initialize( self );
	        }
            
        break;

        case 'chatBoxWidget':
        	if(ChatBoxWidget == none)
            {
                ChatBoxWidget = KFGFxHUD_ChatBoxWidget(Widget);
                ChatBoxWidget.SetLobbyChatVisible(true);
                
            }
        break;
    }
      
    return true;
}


function ReceiveMessage(string Message, optional string MessageColor)
{
	// Send to chat box		
	if( ChatBoxWidget != none )
	{
		if(MessageColor != "")
		{
			ChatBoxWidget.AddChatMessage(message, MessageColor);	
		}
		else
		{
			ChatBoxWidget.AddChatMessage(message, class 'KFLocalMessage'.default.SayColor);
		}
	}
}

function RecieveTopMaps(const out TopVotes VoteObject)
{
	//Store them for the persistent display of top maps

	//send them to map vote container
	if(MapVoteContainer != none)
	{
		MapVoteContainer.RecieveTopMaps( VoteObject );
	}
}

function StartCountdown(int CountdownTime, bool bFinalCountdown)
{
	ActionScriptVoid("startCountdown");
}

function Callback_BroadcastChatMessage(string Message)
{
	super.Callback_BroadcastChatMessage(Message);
}

function Callback_MapVote(int MapVoteIndex, bool bDoubleClick)
{
	local KFPlayerReplicationInfo KFPRI;

	KFPRI = KFPlayerReplicationInfo(GetPC().PlayerReplicationInfo);

	KFPRI.CastMapVote(MapVoteIndex, bDoubleClick);
}


defaultproperties
{
	SubWidgetBindings.Add((WidgetName="playerStatsContainer",WidgetClass=class'KFGFxPostGameContainer_PlayerStats'))
	SubWidgetBindings.Add((WidgetName="mapVoteContainer",WidgetClass=class'KFGFxPostGameContainer_MapVote'))
	SubWidgetBindings.Add((WidgetName="teamAwardsContainer",WidgetClass=class'KFGFxPostGameContainer_TeamAwards'))
	SubWidgetBindings.Add((WidgetName="playerXPContainer",WidgetClass=class'KFGFxPostGameContainer_PlayerXP'))
	SubWidgetBindings.Add((WidgetName="chatBoxWidget",WidgetClass=class'KFGFxHUD_ChatBoxWidget'))
}