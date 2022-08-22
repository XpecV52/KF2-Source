/*******************************************************************************
 * KFGFxWidget_PartyMainMenu generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWidget_PartyMainMenu extends KFGFxWidget_BaseParty within GFxMoviePlayer;

var bool bIsInParty;
var int prevMemberCount;

function OneSecondLoop()
{
    local ActiveLobbyInfo LobbyInfo;

    RefreshParty();
    if((OnlineLobby != none) && OnlineLobby.IsInLobby())
    {
        SendMyOptions();
        SendSearching();
        UpdateInLobby(true);
        OnlineLobby.GetCurrentLobby(LobbyInfo);
        if((prevMemberCount != LobbyInfo.Members.Length) && LobbyInfo.Members.Length > 6)
        {
            Manager.OpenPopup(2, Localize("Notifications", "PartySizeTitle", "KFGameConsole"), Localize("Notifications", "PartySizeMessage", "KFGameConsole"), Class'KFCommon_LocalizedStrings'.default.OKString);
        }
        prevMemberCount = LobbyInfo.Members.Length;        
    }
    else
    {
        if(((Class'WorldInfo'.static.IsConsoleBuild() && prevMemberCount != 0) && Manager != none) && Manager.StartMenu != none)
        {
            Manager.StartMenu.ShowOverview(false, false, true, false);
        }
        prevMemberCount = 0;
        UpdateInLobby(false);
    }
}

function InitializeWidget()
{
    super.InitializeWidget();
    SetReadyButtonVisibility(false);
}

function SendSearching()
{
    local string SearchingTextString, SearchingMessage;
    local UniqueNetId AdminId;
    local bool bIsLeader;

    if(Manager == none)
    {
        return;
    }
    if((OnlineLobby != none) && OnlineLobby.IsInLobby())
    {
        OnlineLobby.GetLobbyAdmin(OnlineLobby.GetCurrentLobbyId(), AdminId);
        bIsLeader = OnlineLobby.GetMyId() == AdminId;
        if(bIsLeader)
        {
            if(Manager.CurrentMenuIndex == 0)
            {
                if(Manager.bSearchingForGame)
                {
                    SearchingTextString = SearchingForGameString;
                    SetSearchingText(SearchingTextString);
                    SearchingMessage = SearchingForGame;                    
                }
                else
                {
                    if(Manager.StartMenu.GetStartMenuState() == 0)
                    {
                        SearchingMessage = UpdatingOptions;                        
                    }
                    else
                    {
                        SearchingMessage = InOtherMenu;
                    }
                }                
            }
            else
            {
                if(Manager.CurrentMenuIndex == 15)
                {
                    SearchingMessage = ServerBrowserOpen;                    
                }
                else
                {
                    SearchingMessage = InOtherMenu;
                }
            }
            OnlineLobby.LobbyMessage(SearchingPrefix $ SearchingMessage);
        }        
    }
    else
    {
        if(Manager.bSearchingForGame)
        {
            SearchingTextString = SearchingForGameString;
            SetSearchingText(SearchingTextString);            
        }
        else
        {
            SetSearchingText(SearchingTextString);
        }
    }
}

function SetSearchingText(string Message)
{
    SetString("searchingText", Message);
}

function RefreshParty()
{
    local ActiveLobbyInfo LobbyInfo;
    local UniqueNetId AdminId;
    local int SlotIndex;
    local bool bInParty;
    local PlayerController PC;
    local string PlayerName, ReadablePlayerName;

    super.RefreshParty();
    if((OnlineLobby != none) && OnlineLobby.GetCurrentLobby(LobbyInfo))
    {
        if(Class'WorldInfo'.static.IsConsoleBuild())
        {
            InitializePerk();
        }
        OnlineLobby.GetLobbyAdmin(OnlineLobby.GetCurrentLobbyId(), AdminId);
        if(PartyChatWidget != none)
        {
            PartyChatWidget.SetLobbyChatVisible(LobbyInfo.Members.Length > 1);
        }
        if(AdminId != LastLeaderID)
        {
            HandleLeaderChange(AdminId);
        }
        OccupiedSlots = LobbyInfo.Members.Length;
        bInParty = (OccupiedSlots > 1) || bInLobby;
        if(bIsInParty != bInParty)
        {
            EmptySlot(0);
            bIsInParty = bInParty;
        }
        SlotIndex = 0;
        J0x1CA:

        if(SlotIndex < PlayerSlots)
        {
            if(SlotIndex < LobbyInfo.Members.Length)
            {
                RefreshSlot(SlotIndex, LobbyInfo.Members[SlotIndex].PlayerUID);                
            }
            else
            {
                if(MemberSlots[SlotIndex].bIsSlotTaken)
                {
                    EmptySlot(SlotIndex);
                }
            }
            ++ SlotIndex;
            goto J0x1CA;
        }        
    }
    else
    {
        PC = Outer.GetPC();
        InitializePerk();
        RefreshSlot(0, PC.PlayerReplicationInfo.UniqueId);
        bInParty = false || bInLobby;
        bIsInParty = bInParty;
        SetSearchingText("");
        ReadablePlayerName = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetPlayerNickname(0);
        if(OnlineLobby != none)
        {
            PlayerName = OnlineLobby.GetFriendNickname(PC.PlayerReplicationInfo.UniqueId);
        }
        UpdatePlayerName(0, ((PlayerName != "") ? PlayerName : ((ReadablePlayerName == DefaultPlayerName) ? DefaultPlayerName $ "0" : ReadablePlayerName)));
        MemberSlots[0].PRI = PC.PlayerReplicationInfo;
        MemberSlots[0].PlayerUID = PC.PlayerReplicationInfo.UniqueId;
        if(PartyChatWidget != none)
        {
            PartyChatWidget.SetLobbyChatVisible(false);
        }
        SlotIndex = 1;
        J0x538:

        if(SlotIndex < PlayerSlots)
        {
            if(MemberSlots[SlotIndex].bIsSlotTaken)
            {
                EmptySlot(SlotIndex);
            }
            ++ SlotIndex;
            goto J0x538;
        }
    }
    UpdateSoloSquadText();
}

function HandleLeaderChange(UniqueNetId AdminId)
{
    local string HostName;

    if(OnlineLobby != none)
    {
        HostName = OnlineLobby.GetFriendNickname(AdminId);
    }
    HostName = OnlineLobby.GetFriendNickname(AdminId);
    Manager.HandleSteamLobbyLeaderTakeOver(AdminId);
    if(LastLeaderID != ZeroUniqueId)
    {
        Manager.OpenPopup(2, PartHostLeftString, HostName @ PartyLeaderChangedString, Class'KFCommon_LocalizedStrings'.default.OKString);
    }
    LastLeaderID = AdminId;
}

function RefreshSlot(int SlotIndex, UniqueNetId PlayerUID)
{
    local string PlayerName, ReadablePlayerName;
    local UniqueNetId AdminId;
    local bool bIsLeader, bIsMyPlayer, bUpdateSlot;
    local PlayerController PC;

    PC = Outer.GetPC();
    if(OnlineLobby != none)
    {
        OnlineLobby.GetLobbyAdmin(OnlineLobby.GetCurrentLobbyId(), AdminId);
    }
    bIsLeader = PlayerUID == AdminId;
    if(!MemberSlots[SlotIndex].bIsSlotTaken)
    {
        MemberSlots[SlotIndex].bIsSlotTaken = true;
        bUpdateSlot = true;
    }
    if(MemberSlots[SlotIndex].bIsLeader != bIsLeader)
    {
        MemberSlots[SlotIndex].bIsLeader = bIsLeader;
        bUpdateSlot = true;
    }
    if(MemberSlots[SlotIndex].PlayerUID != PlayerUID)
    {
        MemberSlots[SlotIndex].PlayerUID = PlayerUID;
        bIsMyPlayer = PC.PlayerReplicationInfo.UniqueId == PlayerUID;
        bUpdateSlot = true;
    }
    if(OnlineLobby != none)
    {
        PlayerName = OnlineLobby.GetFriendNickname(PlayerUID);
    }
    if(PlayerName == "")
    {
        ReadablePlayerName = PC.PlayerReplicationInfo.GetHumanReadableName();
        PlayerName = ((ReadablePlayerName == DefaultPlayerName) ? DefaultPlayerName $ string(SlotIndex) : ReadablePlayerName);
    }
    UpdatePlayerName(SlotIndex, PlayerName);
    if(bUpdateSlot)
    {
        SlotChanged(SlotIndex, true, bIsMyPlayer, bIsLeader);
        CreatePlayerOptions(PlayerUID, SlotIndex);
    }
    if(Class'WorldInfo'.static.IsConsoleBuild(8))
    {
        MemberSlots[SlotIndex].MemberSlotObject.SetString("profileImageSource", KFPC.GetPS4Avatar(PlayerName));        
    }
    else
    {
        MemberSlots[SlotIndex].MemberSlotObject.SetString("profileImageSource", KFPC.GetSteamAvatar(PlayerUID));
    }
}

function InitializePerk()
{
    local KFPerk CurrentPerk;
    local string PerkIconPath;
    local class<KFPerk> PerkClass;
    local byte PerkLevel;

    CurrentPerk = KFPC.GetPerk();
    if(CurrentPerk != none)
    {
        PerkClass = KFPlayerReplicationInfo(Outer.GetPC().PlayerReplicationInfo).CurrentPerkClass;
        PerkLevel = CurrentPerk.GetLevel();
        if((PerkClass != MemberSlots[0].PerkClass) || PerkLevel != MemberSlots[0].PerkLevel)
        {
            MemberSlots[0].PerkClass = PerkClass;
            PerkIconPath = "img://" $ CurrentPerk.GetPerkIconPath();
            UpdatePerk(0, CurrentPerk.PerkName, string(PerkLevel), PerkIconPath);
        }
    }
}

function UpdatePerks(string Message)
{
    local array<string> PlayerInfoStrings;
    local UniqueNetId PlayerID;
    local string PerkName, IconPath, PerkLevel;
    local ActiveLobbyInfo LobbyInfo;
    local byte I;
    local int PerkIndex;

    ParseStringIntoArray(Message, PlayerInfoStrings, "/", true);
    Class'OnlineSubsystem'.static.StringToUniqueNetId(PlayerInfoStrings[0], PlayerID);
    PerkIndex = int(PlayerInfoStrings[1]);
    PerkName = KFPC.PerkList[PerkIndex].PerkClass.default.PerkName;
    IconPath = "img://" $ KFPC.PerkList[PerkIndex].PerkClass.static.GetPerkIconPath();
    PerkLevel = PlayerInfoStrings[2];
    if(OnlineLobby == none)
    {
        return;
    }
    if(OnlineLobby.GetCurrentLobby(LobbyInfo))
    {
        I = 0;
        J0x187:

        if(I < LobbyInfo.Members.Length)
        {
            if(LobbyInfo.Members[I].PlayerUID == PlayerID)
            {
                UpdatePlayerName(I, OnlineLobby.GetFriendNickname(PlayerID));
                UpdatePerk(I, PerkName, PerkLevel, IconPath);
            }
            ++ I;
            goto J0x187;
        }
    }
}

function UpdateSearching(string Message)
{
    local string SearchingText, PartyLeaderName;
    local UniqueNetId AdminId;

    if(OnlineLobby != none)
    {
        OnlineLobby.GetLobbyAdmin(OnlineLobby.GetCurrentLobbyId(), AdminId);
        PartyLeaderName = OnlineLobby.GetFriendNickname(AdminId);
    }
    switch(Message)
    {
        case InOtherMenu:
            SearchingText = PartyLeaderInOtherMenuString;
            break;
        case ServerBrowserOpen:
            Manager.ChangeOverviewState(true);
            SearchingText = PartyLeaderInServerBrowserString;
            break;
        case SearchingForGame:
            SearchingText = PartyLeaderSearchingForMatchString;
            break;
        case UpdatingOptions:
            Manager.ChangeOverviewState(false);
            SearchingText = PartyLeaderIsUpdatingMatchOptionsString;
            break;
        case InOtherMenu:
            SearchingText = PartyLeaderInOtherMenuString;
            break;
        default:
            break;
    }
    SetSearchingText(PartyLeaderName @ SearchingText);
}

function ToggelMuteOnPlayer(int SlotIndex)
{
    local ActiveLobbyInfo LobbyInfo;

    if(OnlineLobby != none)
    {
        OnlineLobby.GetCurrentLobby(LobbyInfo);
        if(LobbyInfo.Members.Length > SlotIndex)
        {
            LogInternal("CALL MUTE FOR PLAYER: " @ OnlineLobby.GetFriendNickname(LobbyInfo.Members[SlotIndex].PlayerUID));
        }
    }
}

function ViewProfile(int SlotIndex)
{
    local ActiveLobbyInfo LobbyInfo;

    if(OnlineLobby != none)
    {
        OnlineLobby.GetCurrentLobby(LobbyInfo);
        if(LobbyInfo.Members.Length > SlotIndex)
        {
            LogInternal("View PLAYER profile: " @ OnlineLobby.GetFriendNickname(LobbyInfo.Members[SlotIndex].PlayerUID));
        }
    }
    if(MemberSlots[SlotIndex].bIsSlotTaken)
    {
        if(Outer.GetPC().WorldInfo.IsConsoleBuild(8))
        {
            OnlineSub.PlayerInterfaceEx.ShowGamerCardUIByUsername(byte(Outer.GetLP().ControllerId), OnlineLobby.GetFriendNickname(LobbyInfo.Members[SlotIndex].PlayerUID));            
        }
        else
        {
            OnlineSub.PlayerInterfaceEx.ShowGamerCardUI(byte(Outer.GetLP().ControllerId), MemberSlots[SlotIndex].PRI.UniqueId);
        }
    }
}

function AddFriend(int SlotIndex)
{
    local ActiveLobbyInfo LobbyInfo;
    local LocalPlayer LocPlayer;

    LocPlayer = LocalPlayer(Outer.GetPC().Player);
    if(OnlineLobby != none)
    {
        OnlineLobby.GetCurrentLobby(LobbyInfo);
        if(LobbyInfo.Members.Length > SlotIndex)
        {
            if(OnlineSub.IsFriend(byte(LocPlayer.ControllerId), LobbyInfo.Members[SlotIndex].PlayerUID))
            {
                if(!OnlineSub.RemoveFriend(byte(LocPlayer.ControllerId), LobbyInfo.Members[SlotIndex].PlayerUID))
                {
                    LogInternal("Failed to remove friend!");
                }                
            }
            else
            {
                if(!OnlineSub.AddFriend(byte(LocPlayer.ControllerId), LobbyInfo.Members[SlotIndex].PlayerUID))
                {
                    LogInternal("Failed to add friend!");
                }
            }
        }
    }
}

function SendMyOptions()
{
    local KFPerk CurrentPerk;
    local int PerkIndex;
    local string CurrentLevel, PerkMessage, UIDStrings;
    local UniqueNetId MyUniqueId;

    CurrentPerk = KFPC.GetPerk();
    PerkIndex = KFPC.GetPerkIndexFromClass(CurrentPerk.Class);
    CurrentLevel = string(KFPC.GetLevel());
    MyUniqueId = OnlineLobby.GetMyId();
    UIDStrings = Class'OnlineSubsystem'.static.UniqueNetIdToString(MyUniqueId);
    PerkMessage = ((((PerkPrefix $ UIDStrings) $ "/") $ string(PerkIndex)) $ "/") $ CurrentLevel;
    if(OnlineLobby != none)
    {
        OnlineLobby.LobbyMessage(PerkMessage);
    }
}
