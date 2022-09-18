/*******************************************************************************
 * KFGFxWidget_BaseParty generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWidget_BaseParty extends KFGFxObject_Container within GFxMoviePlayer;

struct SMemberSlot
{
    var bool bIsReady;
    var bool bIsLeader;
    var string PerkLevel;
    var string PrestigeLevel;
    var class<KFPerk> PerkClass;
    var Texture2D Avatar;
    var UniqueNetId PlayerUID;
    var transient GFxObject MemberSlotObject;
    var PlayerReplicationInfo PRI;

    structdefaultproperties
    {
        bIsReady=false
        bIsLeader=false
        PerkLevel=""
        PrestigeLevel=""
        PerkClass=none
        Avatar=none
        PlayerUID=(Uid=none)
        MemberSlotObject=none
        PRI=none
    }
};

var const localized string ReadyString;
var const localized string LeaveString;
var const localized string DefaultPlayerName;
var const localized string SquadString;
var const localized string SoloString;
var const localized string CreatePartyString;
var const localized string WaitingString;
var const localized string DeployingString;
var const localized string PlayerReadyString;
var const localized string PartyLeaderString;
var const localized string SkipTraderString;
var const localized string MuteString;
var const localized string UnmuteString;
var const localized string AddFriendString;
var const localized string RemoveFriendString;
var const localized string ViewProfileString;
var const localized string VoteKickString;
var const localized string PartyLeaderSearchingForMatchString;
var const localized string PartyLeaderIsUpdatingMatchOptionsString;
var const localized string PartyLeaderInServerBrowserString;
var const localized string PartyLeaderInOtherMenuString;
var const localized string SearchingForGameString;
var const localized string CreatingGameString;
var const localized string PartHostLeftString;
var const localized string PartyLeaderChangedString;
var const localized string DownloadingString;
var const localized string RemainingString;
var const localized string MatchOverString;
var const localized string PauseGameString;
var const localized string ResumeGameString;
var OnlineSubsystem OnlineSub;
var TWOnlineLobby OnlineLobby;
var bool bInLobby;
var bool bReadyButtonVisible;
var bool bCreatePartyVisible;
var KFPlayerController KFPC;
var KFGFxHUD_ChatBoxWidget PartyChatWidget;
var const string PerkPrefix;
var const string SearchingPrefix;
var const string ServerBrowserOpen;
var const string SearchingForGame;
var const string CreatingGame;
var const string UpdatingOptions;
var const string InOtherMenu;
var const string ViewProfileKey;
var const string AddFriendKey;
var const string KickKey;
var const string MuteKey;
var int OccupiedSlots;
var UniqueNetId LastLeaderID;
var KFGFxMoviePlayer_Manager Manager;
var GFxObject ReadyButton;
var GFxObject LeaveButton;
var GFxObject CreatePartyButton;
var GFxObject SquadHeader;
var GFxObject Notification;
var GFxObject MatchStartContainer;
var GFxObject EndlessPauseButton;
var int PlayerSlots;
var const UniqueNetId ZeroUniqueId;
var SMemberSlot MemberSlots[12];

function InitializeWidget()
{
    local int SlotIndex;

    KFPC = KFPlayerController(Outer.GetPC());
    OnlineSub = KFPC.OnlineSub;
    if(OnlineSub != none)
    {
        OnlineLobby = OnlineSub.GetLobbyInterface();
    }
    SlotIndex = 0;
    J0x9D:

    if(SlotIndex < PlayerSlots)
    {
        InitializeMemberSlot(SlotIndex);
        ++ SlotIndex;
        goto J0x9D;
    }
    LeaveButton = GetObject("leaveButton");
    CreatePartyButton = GetObject("createPartyButton");
    SetBool("partyButtonVisible", bCreatePartyVisible);
    ReadyButton = GetObject("readyButton");
    SquadHeader = GetObject("squadHeader");
    MatchStartContainer = GetObject("matchStartContainer");
    EndlessPauseButton = GetObject("endlessPauseButton");
    InitNotificationUI();
    LocalizeText();
    UpdateInLobby(Manager.IsInLobby());
    RefreshParty();
    SetBool("matchOver", false);
    SetBool("endlessPauseButtonVisible", false);
}

function LocalizeText()
{
    local GFxObject TextObject;
    local KFGameReplicationInfo KFGRI;
    local WorldInfo TempWorldInfo;

    TextObject = Outer.CreateObject("Object");
    TextObject.SetString("readyString", ReadyString);
    TextObject.SetString("leaveString", LeaveString);
    TextObject.SetString("createPartyString", CreatePartyString);
    TextObject.SetString("deployingString", DeployingString);
    TextObject.SetString("waitingString", WaitingString);
    TextObject.SetString("selectPromptString", Localize("KFGFxWidget_ButtonPrompt", "ConfirmString", "KFGame"));
    TextObject.SetString("backPromptString", Localize("KFGFxWidget_ButtonPrompt", "CancelString", "KFGame"));
    TextObject.SetString("matchOver", MatchOverString);
    TempWorldInfo = Class'WorldInfo'.static.GetWorldInfo();
    if((TempWorldInfo != none) && TempWorldInfo.GRI != none)
    {
        KFGRI = KFGameReplicationInfo(TempWorldInfo.GRI);
        if(KFGRI != none)
        {
            SetString("endlessPauseString", ((KFGRI.bIsEndlessPaused) ? ResumeGameString : PauseGameString));
        }
    }
    SetObject("localizedText", TextObject);
}

function InitNotificationUI()
{
    Notification = GetObject("Notification");
}

function UpdateReadyButtonVisibility();

function ShowDownLoadNotification(string ItemName, float PercentComplete)
{
    local GFxObject NotificationInfoObject;

    if(Notification == none)
    {
        return;
    }
    NotificationInfoObject = Outer.CreateObject("Object");
    NotificationInfoObject.SetString("itemName", ItemName);
    NotificationInfoObject.SetFloat("percent", PercentComplete * float(100));
    NotificationInfoObject.SetInt("queue", 0);
    NotificationInfoObject.SetString("downLoading", DownloadingString);
    NotificationInfoObject.SetString("remaining", Class'KFCommon_LocalizedStrings'.default.CancelString @ "- F10");
    Notification.SetObject("notificationInfo", NotificationInfoObject);
}

function SetSearchingText(string Message);

function InitializeMemberSlot(int SlotIndex)
{
    MemberSlots[SlotIndex].MemberSlotObject = GetObject("squadMember" $ string(SlotIndex));
}

function bool isUserYourFriend(UniqueNetId PlayerID)
{
    return true;
}

function CreatePlayerOptions(UniqueNetId PlayerID, int SlotIndex)
{
    local PlayerController PC;
    local GFxObject DataProvider;
    local int OptionIndex;
    local string ProfileString;
    local array<KFPlayerReplicationInfo> PRIs;
    local KFGameReplicationInfo KFGRI;
    local WorldInfo TempWorldInfo;

    TempWorldInfo = Class'WorldInfo'.static.GetWorldInfo();
    if((TempWorldInfo != none) && TempWorldInfo.GRI != none)
    {
        KFGRI = KFGameReplicationInfo(TempWorldInfo.GRI);
        if(KFGRI != none)
        {
            KFGRI.GetKFPRIArray(PRIs);
        }
    }
    DataProvider = Outer.CreateArray();
    OptionIndex = 0;
    DataProvider.SetInt("index", SlotIndex);
    PC = Outer.GetPC();
    if(PlayerID != PC.PlayerReplicationInfo.UniqueId)
    {
        if(!PC.WorldInfo.IsMenuLevel())
        {
            AddStringOptionToList(MuteKey, OptionIndex, ((PC.IsPlayerMuted(PlayerID)) ? UnmuteString : MuteString), DataProvider);
            ++ OptionIndex;
            if(PRIs.Length > 2)
            {
                AddStringOptionToList(KickKey, OptionIndex, VoteKickString, DataProvider);
                ++ OptionIndex;
            }
        }
    }
    if(Class'WorldInfo'.static.IsConsoleBuild(8))
    {
        ProfileString = ConsoleLocalize("ViewProfileString", "KFGFxWidget_BaseParty");        
    }
    else
    {
        if(Class'WorldInfo'.static.IsConsoleBuild(9))
        {
            if(KFGameEngine(Class'Engine'.static.GetEngine()).LocalLoginStatus == 2)
            {
                ProfileString = ConsoleLocalize("ViewProfileStringXB1", "KFGFxWidget_BaseParty");
            }            
        }
        else
        {
            ProfileString = ViewProfileString;
        }
    }
    if(ProfileString != "")
    {
        if(((isPlayerFromSteam(PlayerID)) || Class'WorldInfo'.static.IsConsoleBuild(8)) || Class'WorldInfo'.static.IsConsoleBuild(9))
        {
            AddStringOptionToList(ViewProfileKey, OptionIndex, ProfileString, DataProvider);
        }
    }
    ++ OptionIndex;
    SetObject("listOptions", DataProvider);
}

function bool isPlayerFromSteam(UniqueNetId PlayerID)
{
    local PlayerReplicationInfo CurrentPRI;

    CurrentPRI = KFPC.GetPRIFromNetId(PlayerID);
    return !Class'WorldInfo'.static.IsEOSBuild() && CurrentPRI.PlayfabPlayerId == "";
}

function AddStringOptionToList(string OptionKey, int ItemIndex, string Option, out GFxObject DataProvider)
{
    local GFxObject StringOption;

    StringOption = Outer.CreateObject("Object");
    StringOption.SetString("optionKey", OptionKey);
    StringOption.SetString("label", Option);
    DataProvider.SetElementObject(ItemIndex, StringOption);
}

event SoloGameMenuOpened();

function UpdateInLobby(bool bIsInLobby)
{
    local bool bShouldShowCreateParty;

    if(bIsInLobby != bInLobby)
    {
        bInLobby = bIsInLobby;
        RefreshParty();
    }
    if(bInLobby)
    {
        if(Class'WorldInfo'.static.IsMenuLevel())
        {
            LeaveButton.SetVisible(true);            
        }
        else
        {
            LeaveButton.SetVisible(false);
        }        
    }
    else
    {
        LeaveButton.SetVisible(false);
    }
    if(Manager.StartMenu != none)
    {
        if(Outer.GetPC().WorldInfo.IsMenuLevel())
        {
            bShouldShowCreateParty = !bInLobby && Manager.StartMenu.GetStartMenuState() != 4;            
        }
        else
        {
            if(Class'WorldInfo'.static.IsConsoleBuild())
            {
                bShouldShowCreateParty = (Outer.GetPC().WorldInfo.NetMode != NM_Standalone) && !bInLobby;
            }
        }
        if(bCreatePartyVisible != bShouldShowCreateParty)
        {
            bCreatePartyVisible = bShouldShowCreateParty;
            SetBool("partyButtonVisible", bCreatePartyVisible);
        }
    }
    SetBool("bInParty", bIsInLobby);
}

function UpdateSoloSquadText()
{
    if(OccupiedSlots > 1)
    {
        SquadHeader.SetString("text", SquadString);        
    }
    else
    {
        SquadHeader.SetString("text", SoloString);
    }
}

function ProfileOptionClicked(string OptionKey, int SlotIndex)
{
    switch(OptionKey)
    {
        case AddFriendKey:
            AddFriend(SlotIndex);
            break;
        case MuteKey:
            ToggelMuteOnPlayer(SlotIndex);
            break;
        case KickKey:
            KickPlayer(SlotIndex);
            break;
        case ViewProfileKey:
            ViewProfile(SlotIndex);
            break;
        default:
            ViewProfile(SlotIndex);
            break;
    }
}

function bool IsPlayerAFriend(UniqueNetId PlayerID)
{
    local LocalPlayer LocPlayer;

    LocPlayer = LocalPlayer(Outer.GetPC().Player);
    if(LocPlayer == none)
    {
        return false;
    }
    if(OnlineSub == none)
    {
        return false;
    }
    return OnlineSub.IsFriend(byte(LocPlayer.ControllerId), PlayerID);
}

function ToggelMuteOnPlayer(int SlotIndex)
{
    RefreshParty();
}

function ViewProfile(int SlotIndex);

function AddFriend(int SlotIndex);

function RemoveFriend(int SlotIndex);

function KickPlayer(int SlotIndex);

function UpdateVOIP(PlayerReplicationInfo PRI, bool bIsTalking);

function RefreshParty()
{
    OccupiedSlots = 0;
    UpdateLock();
}

function OpenPlayerList(int SlotIndex)
{
    CreatePlayerOptions(MemberSlots[SlotIndex].PlayerUID, SlotIndex);
}

function SetReadyButtonVisibility(bool bVisible, optional bool bShowDeployTimer)
{
    bShowDeployTimer = true;
    SetBool("readyButtonVisible", bVisible);
    if(MatchStartContainer != none)
    {
        MatchStartContainer.SetVisible(bShowDeployTimer && bVisible);
    }
}

function bool ReceiveMessage(string Message, optional string MessageColor)
{
    local array<string> PlayerInfoStrings;

    ParseStringIntoArray(Message, PlayerInfoStrings, PerkPrefix, true);
    if(InStr(Message, PerkPrefix) != -1)
    {
        UpdatePerks(Repl(Message, PerkPrefix, ""));
        return false;
    }
    if(InStr(Message, SearchingPrefix) != -1)
    {
        UpdateSearching(Repl(Message, SearchingPrefix, ""));
        return false;
    }
    if(PartyChatWidget != none)
    {
        if(MessageColor != "")
        {
            PartyChatWidget.AddChatMessage(Message, MessageColor);            
        }
        else
        {
            PartyChatWidget.AddChatMessage(Message, Class'KFLocalMessage'.default.SayColor);
        }
    }
    return true;
}

function UpdateLock()
{
    local WorldInfo TempWorldInfo;
    local KFGameReplicationInfo KFGRI;
    local bool bLocked;

    TempWorldInfo = Class'WorldInfo'.static.GetWorldInfo();
    if((TempWorldInfo != none) && TempWorldInfo.GRI != none)
    {
        KFGRI = KFGameReplicationInfo(TempWorldInfo.GRI);
        if((KFGRI != none) && KFPC != none)
        {
            bLocked = KFGRI.CanChangePerks() && !KFPC.CanUpdatePerkInfo();
            SetBool("locked", bLocked);
        }
    }
}

function UpdatePerks(string Message);

function UpdateSearching(string Message);

function SendSearching();

function StartCountdown(int CountdownTime, bool bFinalCountdown)
{
    ActionScriptVoid("startCountdown");
}

function StopCountdown()
{
    ActionScriptVoid("stopCountdown");
}

defaultproperties
{
    ReadyString="READY UP"
    LeaveString="LEAVE PARTY"
    DefaultPlayerName="Player"
    SquadString="SQUAD"
    SoloString="SQUAD"
    CreatePartyString="CREATE PARTY"
    WaitingString="WAITING FOR PLAYER(S)"
    DeployingString="DEPLOYING IN "
    PlayerReadyString="[ READY ]"
    PartyLeaderString="Leader"
    SkipTraderString="SKIP TRADER"
    MuteString="Mute Player"
    UnmuteString="Unmute Player"
    AddFriendString="Add Friend"
    RemoveFriendString="Remove Friend"
    ViewProfileString="View Profile"
    VoteKickString="Kick Player"
    PartyLeaderSearchingForMatchString="is searching for a match..."
    PartyLeaderIsUpdatingMatchOptionsString="is setting match options..."
    PartyLeaderInServerBrowserString="is searching the server browser..."
    PartyLeaderInOtherMenuString="is in another menu..."
    SearchingForGameString="Searching for online game..."
    CreatingGameString="is creating a new game"
    PartHostLeftString="The party host has left"
    PartyLeaderChangedString="New Party Host Selected"
    DownloadingString="Downloading:"
    RemainingString="Remaining:"
    MatchOverString="MATCH OVER 
 Please stand by..."
    PauseGameString="PAUSE GAME"
    ResumeGameString="RESUME GAME"
    bReadyButtonVisible=true
    bCreatePartyVisible=true
    PerkPrefix="%&1&%"
    SearchingPrefix="%&2&%"
    ServerBrowserOpen="ServerBrowser"
    SearchingForGame="SearchingForGame"
    UpdatingOptions="UpdatingOptions"
    InOtherMenu="InOtherMenu"
    ViewProfileKey="ViewProfile"
    AddFriendKey="AddFriend"
    KickKey="Kick"
    MuteKey="Mute"
    PlayerSlots=6
}