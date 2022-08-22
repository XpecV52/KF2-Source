/*******************************************************************************
 * KFGFxMenu_ServerBrowser generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxMenu_ServerBrowser extends KFGFxObject_Menu within GFxMoviePlayer;

var GFxObject ServerBrowserHeader;
var KFGFxServerBrowser_ServerList ServerListContainer;
var KFGFxServerBrowser_Filters FiltersContainer;
var KFGFxServerBrowser_ServerDetails ServerDetailsContainer;
var transient bool ApplyFilters;
var bool bLogServerBrowser;
var bool bUIComponentsInit;
var transient bool bJoiningAsSpectator;
var const localized string FavoriteString;
var const localized string NameString;
var const localized string RefreshString;
var const localized string ServerBrowserString;
var const localized string RankedString;
var const localized string UnrankedString;
var const localized string DedicatedString;
var const localized string VACSecureString;
var const localized string InLobbyString;
var const localized string InProgressString;
var const localized string BackString;
var const localized string ApplyString;
var const localized string ResetString;
var const localized string PingString;
var const localized string LengthString;
var const localized string DifficultyString;
var const localized string MapString;
var const localized string GameModeString;
var const localized string FiltersString;
var const localized string SearchString;
var const localized string WaveString;
var const localized string PlayersString;
var const localized string ZedCountString;
var const localized string GamesFoundString;
var const localized string PasswordPromptString;
var const localized string JoinString;
var const localized string LeaveMenuString;
var const localized string MultiplayerMenuString;
var const localized array<localized string> PingOptionStrings;
var const localized array<localized string> TabStrings;
var transient int WidgetsInited;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    super.InitializeMenu(InManager);
    LocalizeTabs();
}

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    switch(WidgetName)
    {
        case 'ServerBrowserHeader':
            if(ServerBrowserHeader == none)
            {
                ServerBrowserHeader = Widget;
                ServerBrowserHeader.SetText(ServerBrowserString);
                ++ WidgetsInited;
            }
            break;
        case 'ServerListContainer':
            if(ServerListContainer == none)
            {
                ServerListContainer = KFGFxServerBrowser_ServerList(Widget);
                ServerListContainer.Initialize(self);
                ++ WidgetsInited;
            }
            OnContainerOpen(WidgetPath, ServerListContainer);
            break;
        case 'FiltersContainer':
            if(FiltersContainer == none)
            {
                FiltersContainer = KFGFxServerBrowser_Filters(Widget);
                FiltersContainer.Initialize(self);
                ++ WidgetsInited;
            }
            OnContainerOpen(WidgetPath, FiltersContainer);
            break;
        case 'ServerDetailsContainer':
            if(ServerDetailsContainer == none)
            {
                ServerDetailsContainer = KFGFxServerBrowser_ServerDetails(Widget);
                ServerDetailsContainer.Initialize(self);
                ++ WidgetsInited;
            }
            break;
        default:
            break;
    }
    if(WidgetsInited == SubWidgetBindings.Length)
    {
        bUIComponentsInit = true;
        ServerListContainer.OnViewActivated();
    }
    return true;
}

function OnContainerOpen(name WidgetPath, KFGFxObject_Container Widget)
{
    Outer.SetWidgetPathBinding(Widget, WidgetPath);
}

function LocalizeTabs()
{
    local byte I;
    local GFxObject TabsArray;

    TabsArray = Outer.CreateArray();
    I = 0;
    J0x35:

    if(I < 5)
    {
        TabsArray.SetElementString(I, TabStrings[I]);
        ++ I;
        goto J0x35;
    }
    SetObject("searchTabs", TabsArray);
}

function CancelLeaveMenu();

function CancelGameSearch();

function GoToMultiplayerMenu()
{
    CloseMenu();
    if(Manager.StartMenu != none)
    {
        Manager.StartMenu.OpenMultiplayerMenu();
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
    if(OnlineLobby.IsInLobby() && !Class'WorldInfo'.static.IsConsoleBuild())
    {
        Manager.OpenPopup(0, Class'KFCommon_LocalizedStrings'.default.LeaveCurrentMenuString, LeaveMenuString, MultiplayerMenuString, Class'KFCommon_LocalizedStrings'.default.CancelString, GoToMultiplayerMenu, CancelLeaveMenu, Class'KFCommon_LocalizedStrings'.default.DisbandPartyString, ApproveServerBroswerLeave);        
    }
    else
    {
        CloseMenu();
    }
}

function OnLobbyStatusChanged(bool bIsInParty)
{
    SetAllowSpectate(!bIsInParty);
}

function SetAllowSpectate(bool bAllowSpectate)
{
    SetBool("bAllowSpectate", bAllowSpectate);
}

function CloseMenu()
{
    CancelGameSearch();
    Manager.SetStartMenuState(Manager.GetStartMenuState());
    SetBool("confirmServerBrowserClose", true);
    Manager.OpenMenu(0);
}

function Callback_CloseServerBrowser()
{
    HandleCloseRequest();
}

function Callback_RefreshServer()
{
    ServerListContainer.OnRefeshClick();
}

function CallBack_FiltersApplied()
{
    if(bLogServerBrowser)
    {
        LogInternal("filters applied, refreshing server list");
    }
    FiltersContainer.ApplyFilters();
    ServerListContainer.OnRefeshClick();
}

function Callback_FilterChanged(int FilterKey, bool Selected)
{
    if(bLogServerBrowser)
    {
        LogInternal(("FILTER CHANGED: " @ string(FilterKey)) @ string(Selected));
    }
    FiltersContainer.SetBoolByEFilter_Key(byte(FilterKey), Selected);
}

function Callback_SortList(int ButtonIndex, int SortOrder)
{
    ServerListContainer.SortServerResultsRequest(ButtonIndex + 1, SortOrder);
}

function Callback_ModeFilter(int FilterIndex)
{
    if(bLogServerBrowser)
    {
        LogInternal("MODE" @ string(FilterIndex));
    }
    FiltersContainer.ModeChanged(FilterIndex);
}

function Callback_LengthFilter(int FilterIndex)
{
    if(bLogServerBrowser)
    {
        LogInternal("Length" @ string(FilterIndex));
    }
    FiltersContainer.LengthChanged(FilterIndex);
}

function Callback_DifficultyFilter(int FilterIndex)
{
    if(bLogServerBrowser)
    {
        LogInternal("Difficulty" @ string(FilterIndex));
    }
    FiltersContainer.DifficultyChanged(FilterIndex);
}

function Callback_MapFilter(int FilterIndex)
{
    if(bLogServerBrowser)
    {
        LogInternal("Map" @ string(FilterIndex));
    }
    FiltersContainer.MapChanged(FilterIndex);
}

function Callback_PingFilter(int FilterIndex)
{
    if(bLogServerBrowser)
    {
        LogInternal("Ping" @ string(FilterIndex));
    }
    FiltersContainer.PingChanged(FilterIndex);
}

function CallBack_SearchTabChanged(int TabIndex)
{
    if(bLogServerBrowser)
    {
        LogInternal("SEARCH TAB CHANGED: " @ string(TabIndex));
    }
    ApplyFilters = true;
    switch(TabIndex)
    {
        case 1:
            ServerListContainer.ChangeSearchType(3);
            break;
        case 2:
            ServerListContainer.ChangeSearchType(4);
            break;
        case 3:
            ServerListContainer.ChangeSearchType(5);
            break;
        case 4:
            ApplyFilters = false;
            ServerListContainer.ChangeSearchType(1);
            break;
        case 0:
        default:
            ServerListContainer.ChangeSearchType(2);
            break;
            break;
    }
}

function CallBack_ServerFavorited(bool bFavorite)
{
    local bool Success;

    if(bLogServerBrowser)
    {
        LogInternal("CallBack_ServerFavorited: " @ string(bFavorite));
    }
    Success = ServerListContainer.SetSelectedServerFavorited(!bFavorite);
    if(bFavorite)
    {
        ServerDetailsContainer.SetFavoriteButtonActive(false);        
    }
    else
    {
        if(Success)
        {
            ServerDetailsContainer.SetFavoriteButtonActive(true);
        }
    }
}

function CallBack_ServerRefesh()
{
    if(bLogServerBrowser)
    {
        LogInternal("CallBack_ServerRefesh: ");
    }
    ServerListContainer.OnRefreshServerDetails();
}

function CallBack_ServerJoinGameWithPassword(string Password)
{
    if(bLogServerBrowser)
    {
        LogInternal("CallBack_ServerJoinGameWithPassword" @ Password);
    }
    ServerListContainer.JoinServer(ServerListContainer.SelectedServerIndex, Password);
}

function CallBack_ServerJoinGame()
{
    if(bLogServerBrowser)
    {
        LogInternal("CallBack_ServerJoinGame");
    }
    bJoiningAsSpectator = false;
    if(ServerListContainer.GetServerDetails(ServerListContainer.SelectedServerIndex).bRequiresPassword)
    {
        ShowPasswordPopUp();        
    }
    else
    {
        ServerListContainer.JoinServer(ServerListContainer.SelectedServerIndex);
    }
}

function ShowPasswordPopUp()
{
    Manager.OpenPopup(4, PasswordPromptString, "", JoinString, Class'KFCommon_LocalizedStrings'.default.CancelString, OnAttemptPassword, OnCancelPassword);
}

function OnAttemptPassword()
{
    local KFGFxPopup_InputPrompt InputPopUp;
    local string PasswordString;

    InputPopUp = KFGFxPopup_InputPrompt(Manager.CurrentPopup);
    if(InputPopUp != none)
    {
        PasswordString = InputPopUp.PlayerInputString;
        ServerListContainer.JoinServer(ServerListContainer.SelectedServerIndex, PasswordString, bJoiningAsSpectator);
        bJoiningAsSpectator = false;
    }
}

function OnCancelPassword()
{
    bJoiningAsSpectator = false;
}

function OnOpen()
{
    if(Manager != none)
    {
        Manager.SetStartMenuState(1);
        SetAllowSpectate(!Manager.IsInLobby());
    }
    if((ServerListContainer != none) && bUIComponentsInit)
    {
        ServerListContainer.OnRefeshClick();
    }
    Class'GameEngine'.static.GetOnlineSubsystem().SetSharedPassword("");
}

event OnClose()
{
    ServerListContainer.OnClose();
}

function CallBack_ServerSpectateGame()
{
    if(bLogServerBrowser)
    {
        LogInternal("CallBack_ServerSpectateGame");
    }
    if(ServerListContainer.GetServerDetails(ServerListContainer.SelectedServerIndex).bRequiresPassword)
    {
        bJoiningAsSpectator = true;
        ShowPasswordPopUp();        
    }
    else
    {
        ServerListContainer.JoinServer(ServerListContainer.SelectedServerIndex, "", true);
    }
}

function CallBack_ServerDetailsClicked();

function CallBack_ServerSelected(int ServerIndex)
{
    if(bLogServerBrowser)
    {
        LogInternal("CallBack_ServerSelected" @ string(ServerIndex));
    }
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
    if(LatestGameSearch.SortIfChanged())
    {
        ServerListContainer.UpdateListDataProvider();
    }
}

defaultproperties
{
    ApplyFilters=true
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
    TabStrings(2)="FRIENDS"
    TabStrings(3)="HISTORY"
    TabStrings(4)="LAN"
    SubWidgetBindings=/* Array type was not detected. */
}