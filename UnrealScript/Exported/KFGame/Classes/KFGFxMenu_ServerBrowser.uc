//=============================================================================
// KFGFxMenu_ServerBrowser
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane 8/18/2014
//=============================================================================

class KFGFxMenu_ServerBrowser extends KFGFxObject_Menu;

var GFxObject ServerBrowserHeader;
var KFGFxServerBrowser_ServerList ServerListContainer;
var KFGFxServerBrowser_Filters FiltersContainer;
var KFGFxServerBrowser_ServerDetails ServerDetailsContainer;

var transient bool ApplyFilters;

var localized string FavoriteString;
var localized string NameString;
var localized string RefreshString;
var localized string ServerBrowserString;
var localized string RankedString;
var localized string UnrankedString;
var localized string DedicatedString;
var localized string VACSecureString;
var localized string InLobbyString;
var localized string InProgressString;
var localized string BackString;
var localized string ApplyString;
var localized string ResetString;
var localized string PingString;
var localized string LengthString;
var localized string DifficultyString;
var localized string MapString;
var localized string GameModeString;
var localized string FiltersString;
var localized string SearchString;
var localized string WaveString;
var localized string PlayersString;
var localized string ZedCountString;
var localized string GamesFoundString;
var localized string PasswordPromptString;
var localized string JoinString;
var localized string LeaveMenuString;
var localized string MultiplayerMenuString;

var localized array<string> PingOptionStrings;
var localized array<string> TabStrings;

var bool bLogServerBrowser;
var bool bUIComponentsInit;
var transient int WidgetsInited;

var transient bool bJoiningAsSpectator;

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu(InManager);
	LocalizeTabs();
	//ScriptTrace();
}

/** Ties the GFxClikWidget variables to the .swf containers and handles events */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
	//`log("WidgetInitialized:"@string(WidgetName)@string(WidgetPath)@Widget);
	switch ( WidgetName )
	{
		case ( 'serverBrowserHeader' ):
			if ( ServerBrowserHeader == none )
			{
			    ServerBrowserHeader = Widget;
			    ServerBrowserHeader.SetText(ServerBrowserString); //localize server browser header
				WidgetsInited++;
		    }
		break;
		case ( 'serverListContainer' ):
			if( ServerListContainer == none )
			{
				ServerListContainer = KFGFxServerBrowser_ServerList( Widget );
				ServerListContainer.Initialize( self );
				WidgetsInited++;
			}
			OnContainerOpen(WidgetPath, serverListContainer);
		break;
		case ( 'filtersContainer' ):
			if( FiltersContainer == none )
			{
				FiltersContainer = KFGFxServerBrowser_Filters( Widget );
				FiltersContainer.Initialize( self );
				WidgetsInited++;
			}
			OnContainerOpen(WidgetPath, filtersContainer);
		break;
		case ( 'serverDetailsContainer' ):
			if( ServerDetailsContainer == none )
			{
				ServerDetailsContainer = KFGFxServerBrowser_ServerDetails( Widget );
				ServerDetailsContainer.Initialize( self );
				WidgetsInited++;
			}
		break;	
	}
	if (WidgetsInited == SubWidgetBindings.Length)
	{
		bUIComponentsInit = true;
		ServerListContainer.OnViewActivated();
	}
	return true;
}

function OnContainerOpen( name WidgetPath, KFGFxObject_Container Widget )
{
	SetWidgetPathBinding( Widget, WidgetPath );
	//ScriptTrace();
}

function LocalizeTabs()
{
	local byte i;
	local GFxObject TabsArray;
	
	TabsArray = CreateArray();

	for ( i = 0; i < TAB_MAX; i++ )
	{
		TabsArray.SetElementString(i, TabStrings[i] );
    }

	SetObject("searchTabs", TabsArray);
}

function  CancelLeaveMenu()
{
	//do nothing for now
}

function  CancelGameSearch()
{
}

function GoToMultiplayerMenu()
{
	CloseMenu();
	if(Manager.StartMenu != none)
	{
		//Manager.StartMenu.OpenMultiplayerMenu();
	}
}

function ApproveServerBroswerLeave()
{
	if(OnlineLobby.IsInLobby())
	{
		OnlineLobby.QuitLobby();
	}

	if(Manager.StartMenu != none)
	{
		Manager.StartMenu.ShowOverview(false, false, true, false);
	}
	CloseMenu();
}

function HandleCloseRequest()
{
	if(OnlineLobby.IsInLobby() && !class'WorldInfo'.static.IsConsoleBuild())
	{
		Manager.DelayedOpenPopup(EConfirmation,EDPPID_Misc, Class'KFCommon_LocalizedStrings'.default.LeaveCurrentMenuString, LeaveMenuString,
		 MultiplayerMenuString, Class'KFCommon_LocalizedStrings'.default.CancelString, GoToMultiplayerMenu, CancelLeaveMenu,
		 Class'KFCommon_LocalizedStrings'.default.DisbandPartyString, ApproveServerBroswerLeave ); //middle button
	}
	else
	{
		CloseMenu();
	}
}

public function OnLobbyStatusChanged(bool bIsInParty)
{
	SetAllowSpectate(!bIsInParty);
}

public function SetAllowSpectate(bool bAllowSpectate)
{
	SetBool("bAllowSpectate", bAllowSpectate);
}

function CloseMenu()
{
	CancelGameSearch();
	Manager.SetStartMenuState(Manager.GetStartMenuState());
	SetBool("confirmServerBrowserClose", true);
	Manager.OpenMenu(UI_Start);	
}

/*********************************************************************************************
 * @name	AS3 CALLBACKS
 ********************************************************************************************* */

function Callback_CloseServerBrowser()
{
	CloseMenu();
	//HandleCloseRequest();
}

function Callback_RefreshServer()
{
	ServerListContainer.OnRefeshClick();
}

function CallBack_FiltersApplied()
{
	if (bLogServerBrowser) LogInternal("filters applied, refreshing server list");
	//apply filters here
	FiltersContainer.ApplyFilters();
	//refresh once they are applied
	ServerListContainer.OnRefeshClick();	
}

//check box filter
function Callback_FilterChanged(int FilterKey, bool Selected)
{
	if (bLogServerBrowser) LogInternal("FILTER CHANGED: " @FilterKey @ Selected);
	FiltersContainer.SetBoolByEFilter_Key( EFilter_Key(FilterKey), Selected);
}

function Callback_SortList(int ButtonIndex, int SortOrder)
{
	ServerListContainer.SortServerResultsRequest(ButtonIndex+1, SortOrder);
}

//filters from drop downs
function Callback_ModeFilter(int FilterIndex)
{
	if (bLogServerBrowser) LogInternal("MODE" @ FilterIndex);
	FiltersContainer.ModeChanged(FilterIndex);
}

function Callback_LengthFilter(int FilterIndex)
{
	if (bLogServerBrowser) LogInternal("Length" @ FilterIndex);	
	FiltersContainer.LengthChanged(FilterIndex);
}

function Callback_DifficultyFilter(int FilterIndex)
{
	if (bLogServerBrowser) LogInternal("Difficulty" @ FilterIndex);
	FiltersContainer.DifficultyChanged(FilterIndex);
}

function Callback_MapFilter(int FilterIndex)
{
	if (bLogServerBrowser) LogInternal("Map" @ FilterIndex);
	FiltersContainer.MapChanged(FilterIndex);
}

function Callback_PingFilter(int FilterIndex)
{
	if (bLogServerBrowser) LogInternal("Ping" @ FilterIndex);
	FiltersContainer.PingChanged(FilterIndex);
}

function CallBack_SearchTabChanged(int TabIndex)
{
	if (bLogServerBrowser) LogInternal("SEARCH TAB CHANGED: " @TabIndex);
	ApplyFilters = true;
	switch (TabIndex)
	{
	case 1:
		ServerListContainer.ChangeSearchType(SMT_Favorites);
		break;
	case 2:
		ServerListContainer.ChangeSearchType(SMT_Friends);
		break;
	case 3:
		ServerListContainer.ChangeSearchType(SMT_History);
		break;
	case 4:
		ApplyFilters = false;
		ServerListContainer.ChangeSearchType(SMT_LAN);
		break;
	case 0:
	default:
		ServerListContainer.ChangeSearchType(SMT_Internet);
		break;

	}
	/*if (ApplyFilters)
	{
		`log("Enable filter button here");
	}
	else
	{
		`log("Disable filter button here");
	}*/
}

function CallBack_ServerFavorited(bool bFavorite)
{
	local bool success;

	if (bLogServerBrowser) LogInternal("CallBack_ServerFavorited: " @bFavorite);
	//We want to try to reverse the current state of the button
	success = ServerListContainer.SetSelectedServerFavorited(!bFavorite);
	if (bFavorite)
	{
		//if it was favorited and we tried to unfavorite it, failure probably means it wasn't actually
		//favorited in the first place, so toggle the button to off without caring about success
		ServerDetailsContainer.SetFavoriteButtonActive(false);
	}
	else if (success)
	{
		//we were trying to favorite it, so only set the button if it succeeds
		ServerDetailsContainer.SetFavoriteButtonActive(true);
	}
}

function CallBack_ServerRefesh()
{
	if (bLogServerBrowser) LogInternal("CallBack_ServerRefesh: ");
	ServerListContainer.OnRefreshServerDetails();
}

function CallBack_ServerJoinGameWithPassword(string Password)
{
	if (bLogServerBrowser) LogInternal("CallBack_ServerJoinGameWithPassword" @Password);
	ServerListContainer.JoinServer(ServerListContainer.SelectedServerIndex, Password);
}


function CallBack_ServerJoinGame()
{
	if (bLogServerBrowser) LogInternal("CallBack_ServerJoinGame");
	bJoiningAsSpectator = false;
	//@TODO: Correct the way we are checking for private servers
	if( ServerListContainer.GetServerDetails(ServerListContainer.SelectedServerIndex).bRequiresPassword )
	{
		ShowPasswordPopUp();
	}
	else
	{
		ServerListContainer.JoinServer(ServerListContainer.SelectedServerIndex);
	}
}

function  ShowPasswordPopUp()
{
	Manager.DelayedOpenPopup(EInputPrompt,EDPPID_Misc, PasswordPromptString, "", JoinString, Class'KFCommon_LocalizedStrings'.Default.CancelString, OnAttemptPassword, OnCancelPassword);
}

function  OnAttemptPassword()
{
	local KFGFxPopup_InputPrompt InputPopUp;
	local string PasswordString;

	InputPopUp =  KFGFxPopup_InputPrompt(Manager.CurrentPopUp);

	if( InputPopUp != none )
	{
		PasswordString = InputPopUp.PlayerInputString;
		ServerListContainer.JoinServer(ServerListContainer.SelectedServerIndex, PasswordString, bJoiningAsSpectator);
		bJoiningAsSpectator = false;
	}
}

function  OnCancelPassword()
{
	bJoiningAsSpectator = false;
}

function OnOpen()
{
	if( Manager != none )
	{
		Manager.SetStartMenuState(EServerBrowser);

		SetAllowSpectate(!Manager.IsInLobby());
	}
	if(ServerListContainer != none && bUIComponentsInit)
	{
		ServerListContainer.OnRefeshClick();
	}
}

event OnClose()
{
	ServerListContainer.OnClose();
}

function CallBack_ServerSpectateGame()
{
	if (bLogServerBrowser) LogInternal("CallBack_ServerSpectateGame");
	if( ServerListContainer.GetServerDetails(ServerListContainer.SelectedServerIndex).bRequiresPassword )
	{
		bJoiningAsSpectator = true;
		ShowPasswordPopUp();
	}
	else
	{
		ServerListContainer.JoinServer(ServerListContainer.SelectedServerIndex, "", true);
	}
}

function CallBack_ServerDetailsClicked()
{
}

function CallBack_ServerSelected(int ServerIndex)
{
	if (bLogServerBrowser) LogInternal("CallBack_ServerSelected" @ServerIndex);
	ServerListContainer.SelectedServerIndex = ServerIndex;
	ServerDetailsContainer.SetDetails(ServerListContainer.GetServerDetails(ServerIndex));
	ServerDetailsContainer.SetFavoriteButtonActive(ServerListContainer.IsSelectedServerFavorited(ServerIndex));
	ServerListContainer.OnServerSelected(ServerIndex);
}

function Callback_ResetFilters()
{
	FiltersContainer.ResetFilters();
}

function OneSecondLoop()
{
	local KFOnlineGameSearch LatestGameSearch;

	LatestGameSearch = KFOnlineGameSearch(ServerListContainer.SearchDataStore.GetActiveGameSearch());
	if(LatestGameSearch == none)
	{
		return;
	}
	if ( LatestGameSearch.SortIfChanged() )
	{
		ServerListContainer.UpdateListDataProvider();
	}
}

defaultproperties
{
   FavoriteString="FAVORITE"
   NameString="NAME"
   RefreshString="REFRESH"
   ServerBrowserString="SERVER BROWSER"
   RankedString="STATS ENABLED"
   UnrankedString="STATS DISABLED"
   DedicatedString="DEDICATED"
   VACSecureString="VAC SECURE"
   InLobbyString="IN LOBBY"
   InProgressString="IN PROGRESS"
   BackString="BACK"
   ApplyString="APPLY"
   ResetString="RESET"
   PingString="PING"
   LengthString="LENGTH"
   DifficultyString="DIFFICULTY"
   MapString="MAP"
   GameModeString="MODE"
   FiltersString="FILTERS"
   SearchString="SEARCH"
   WaveString="WAVE"
   PlayersString="PLAYERS"
   ZedCountString="ZED COUNT"
   GamesFoundString="GAMES FOUND:"
   PasswordPromptString="ENTER PASSWORD"
   JoinString="JOIN"
   LeaveMenuString="Leaving this menu will disband your party. Go to Matchmaking instead?"
   MultiplayerMenuString="MATCHMAKING"
   PingOptionStrings(0)="< 50 MS"
   PingOptionStrings(1)="< 100 MS"
   PingOptionStrings(2)="< 150 MS"
   PingOptionStrings(3)="< 200 MS"
   TabStrings(0)="BROWSE"
   TabStrings(1)="FAVORITES"
   TabStrings(2)="PUBLIC FRIENDS"
   TabStrings(3)="HISTORY"
   TabStrings(4)="LAN"
   SubWidgetBindings(0)=(WidgetName="ServerBrowserHeader",WidgetClass=Class'GFxUI.GFxObject')
   SubWidgetBindings(1)=(WidgetName="ServerListContainer",WidgetClass=Class'KFGame.KFGFxServerBrowser_ServerList')
   SubWidgetBindings(2)=(WidgetName="FiltersContainer",WidgetClass=Class'KFGame.KFGFxServerBrowser_Filters')
   SubWidgetBindings(3)=(WidgetName="ServerDetailsContainer",WidgetClass=Class'KFGame.KFGFxServerBrowser_ServerDetails')
   Name="Default__KFGFxMenu_ServerBrowser"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
