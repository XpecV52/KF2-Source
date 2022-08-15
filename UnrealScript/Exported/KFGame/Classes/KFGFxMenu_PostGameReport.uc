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
var localized string ItemDropTitleString;

var KFGFxPostGameContainer_PlayerStats 		PlayerStatsContainer;
var KFGFxPostGameContainer_MapVote 			MapVoteContainer;
var KFGFxPostGameContainer_TeamAwards 		TeamAwardsContainer;
var KFGFxPostGameContainer_PlayerXP			playerXPContainer;
var KFGFxHUD_ChatBoxWidget 					ChatBoxWidget;

var OnlineSubsystem OnlineSub;

var int LastNextMapTimeRemaining;

var array<KFPlayerReplicationInfo> CurrentPlayerList, TalkerPRIs;

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	local KFGameReplicationInfo KFGRI;

	super.InitializeMenu( InManager );

	KFGRI = KFGameReplicationInfo(GetPC().WorldInfo.GRI);

	if(KFGRI != none)
	{
		KFGRI.ProcessChanceDrop();
	}	
	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();

	OnlineSub.AddOnInventoryReadCompleteDelegate(SearchInventoryForNewItem);

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

	TextObject.SetString("dropTitle", 	ItemDropTitleString);

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

function SearchInventoryForNewItem()
{
	local int ItemIndex, InventoryIndex;
	local CurrentInventoryEntry TempInventoryDetailsHolder;
	local ItemProperties TempItemDetailsHolder;
	

	ItemIndex = INDEX_NONE;
	InventoryIndex = INDEX_NONE;

	//check inventory for item dropped
	if(OnlineSub == none)
	{
		return;
	}

	InventoryIndex = OnlineSub.CurrentInventory.Find('NewlyAdded', 1);

	if(InventoryIndex != INDEX_NONE)
	{
		TempInventoryDetailsHolder = OnlineSub.CurrentInventory[InventoryIndex];
	}

	ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', TempInventoryDetailsHolder.Definition);

	if(ItemIndex != INDEX_NONE)
	{
		TempItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];	
		OnItemRecieved(TempItemDetailsHolder.Name, "img://"$TempItemDetailsHolder.IconURL);
	}	
}


function OnItemRecieved(string ItemName, string IconPath)
{
	local GFxObject ItemObject;

	ItemObject = CreateObject("Object");

	ItemObject.SetString("itemName", ItemName);
	ItemObject.SetString("iconImage", IconPath);

	SetObject("itemDrop", ItemObject);
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
	if(OnlineSub != none)
	{
		OnlineSub.AddOnInventoryReadCompleteDelegate(SearchInventoryForNewItem);
	}
}

function OnClose()
{
	if(OnlineSub != none)
	{
		OnlineSub.ClearOnInventoryReadCompleteDelegate(SearchInventoryForNewItem);
	}
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
   MapVoteString="MAP VOTE"
   PlayerStatsString="PLAYER STATS"
   TeamAwardsString="AWARDS"
   PostGameReportString="POST GAME REPORT"
   NextMapString="Next map in:"
   WaveString="WAVE"
   XPString="XP"
   VictoryString="Victory"
   DefeatString="Defeat"
   ItemDropTitleString="NEW ITEM OBTAINED!"
   SubWidgetBindings(0)=(WidgetName="PlayerStatsContainer",WidgetClass=Class'KFGame.KFGFxPostGameContainer_PlayerStats')
   SubWidgetBindings(1)=(WidgetName="MapVoteContainer",WidgetClass=Class'KFGame.KFGFxPostGameContainer_MapVote')
   SubWidgetBindings(2)=(WidgetName="TeamAwardsContainer",WidgetClass=Class'KFGame.KFGFxPostGameContainer_TeamAwards')
   SubWidgetBindings(3)=(WidgetName="playerXPContainer",WidgetClass=Class'KFGame.KFGFxPostGameContainer_PlayerXP')
   SubWidgetBindings(4)=(WidgetName="ChatBoxWidget",WidgetClass=Class'KFGame.KFGFxHUD_ChatBoxWidget')
   Name="Default__KFGFxMenu_PostGameReport"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
