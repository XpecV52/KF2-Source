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
    local bool IsInLobby;

    RefreshParty();
    if(Class'WorldInfo'.static.IsEOSBuild())
    {
        IsInLobby = bIsInParty;        
    }
    else
    {
        IsInLobby = (OnlineLobby != none) && OnlineLobby.IsInLobby();
    }
    if(IsInLobby)
    {
        SendMyOptions();
        SendSearching();
        UpdateInLobby(true);        
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

event SoloGameMenuOpened()
{
    OneSecondLoop();
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
        bIsLeader = OnlineLobby.GetMyId() == AdminId && AdminId != ZeroUniqueId;
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
                    if(Manager.StartMenu.GetStartMenuState() == 1)
                    {
                        SearchingMessage = UpdatingOptions;                        
                    }
                    else
                    {
                        if(Manager.StartMenu.GetStartMenuState() == 2)
                        {
                            SearchingMessage = CreatingGame;                            
                        }
                        else
                        {
                            SearchingMessage = InOtherMenu;
                        }
                    }
                }                
            }
            else
            {
                if(Manager.CurrentMenuIndex == 16)
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
    local GFxObject DataProvider;

    DataProvider = Outer.CreateArray();
    if(Manager.CurrentMenuIndex == 17)
    {
        return;
    }
    super.RefreshParty();
    if((OnlineLobby != none) && OnlineLobby.GetCurrentLobby(LobbyInfo))
    {
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
            bIsInParty = bInParty;
        }
        SlotIndex = 0;
        J0x1E4:

        if(SlotIndex < LobbyInfo.Members.Length)
        {
            DataProvider.SetElementObject(SlotIndex, RefreshSlot(SlotIndex, LobbyInfo.Members[SlotIndex].PlayerUID));
            ++ SlotIndex;
            goto J0x1E4;
        }        
    }
    else
    {
        PC = Outer.GetPC();
        DataProvider.SetElementObject(0, RefreshSlot(0, PC.PlayerReplicationInfo.UniqueId));
        LastLeaderID = ZeroUniqueId;
        bInParty = false || bInLobby;
        bIsInParty = bInParty;
        SetSearchingText("");
        if(PartyChatWidget != none)
        {
            PartyChatWidget.SetLobbyChatVisible(false);
        }
    }
    SetObject("squadInfo", DataProvider);
    UpdateSoloSquadText();
}

function HandleLeaderChange(UniqueNetId AdminId)
{
    Manager.HandleSteamLobbyLeaderTakeOver(AdminId);
    if(LastLeaderID != ZeroUniqueId)
    {
        if(Class'WorldInfo'.static.IsConsoleBuild(8))
        {
            Manager.DelayedOpenPopup(2, 0, PartHostLeftString, "", Class'KFCommon_LocalizedStrings'.default.OKString);
            if((OnlineLobby != none) && OnlineLobby.IsInLobby())
            {
                OnlineLobby.QuitLobby();
            }
            Manager.SetStartMenuState(0, true);            
        }
        else
        {
            Manager.DelayedOpenPopup(2, 0, PartHostLeftString, PartyLeaderChangedString, Class'KFCommon_LocalizedStrings'.default.OKString);
        }
    }
    LastLeaderID = AdminId;
}

function GFxObject RefreshSlot(int SlotIndex, UniqueNetId PlayerUID)
{
    local string PlayerName, ReadablePlayerName;
    local UniqueNetId AdminId;
    local bool bIsLeader, bIsMyPlayer;
    local PlayerController PC;
    local GFxObject PlayerInfoObject, PerkIconObject;
    local KFPerk CurrentPerk;
    local string AvatarPath;
    local KFPlayerReplicationInfo KFPRI;

    PlayerInfoObject = Outer.CreateObject("Object");
    PC = Outer.GetPC();
    if(OnlineLobby != none)
    {
        OnlineLobby.GetLobbyAdmin(OnlineLobby.GetCurrentLobbyId(), AdminId);
    }
    bIsLeader = PlayerUID == AdminId && PlayerUID != ZeroUniqueId;
    PlayerInfoObject.SetBool("bLeader", bIsLeader);
    bIsMyPlayer = (OnlineLobby != none) && OnlineLobby.GetMyId() == PlayerUID;
    PlayerInfoObject.SetBool("myPlayer", bIsMyPlayer);
    if(bIsMyPlayer)
    {
        CurrentPerk = KFPC.GetPerk();
        if(CurrentPerk != none)
        {
            KFPRI = KFPlayerReplicationInfo(Outer.GetPC().PlayerReplicationInfo);
            MemberSlots[SlotIndex].PerkClass = KFPRI.CurrentPerkClass;
            PlayerInfoObject.SetString("perkLevel", string(CurrentPerk.GetLevel()) @ CurrentPerk.PerkName);
            PerkIconObject = Outer.CreateObject("Object");
            PerkIconObject.SetString("perkIcon", "img://" $ MemberSlots[SlotIndex].PerkClass.static.GetPerkIconPath());
            PerkIconObject.SetString("prestigeIcon", MemberSlots[SlotIndex].PerkClass.static.GetPrestigeIconPath(KFPRI.GetActivePerkPrestigeLevel()));
            PlayerInfoObject.SetObject("perkImageSource", PerkIconObject);
        }        
    }
    else
    {
        PlayerInfoObject.SetBool("muted", PC.IsPlayerMuted(PlayerUID));
        if(MemberSlots[SlotIndex].PerkClass != none)
        {
            PlayerInfoObject.SetString("perkLevel", MemberSlots[SlotIndex].PerkLevel @ MemberSlots[SlotIndex].PerkClass.default.PerkName);
            PerkIconObject = Outer.CreateObject("Object");
            PerkIconObject.SetString("perkIcon", "img://" $ MemberSlots[SlotIndex].PerkClass.static.GetPerkIconPath());
            PerkIconObject.SetString("prestigeIcon", MemberSlots[SlotIndex].PerkClass.static.GetPrestigeIconPath(byte(MemberSlots[SlotIndex].PrestigeLevel)));
            PlayerInfoObject.SetObject("perkImageSource", PerkIconObject);
        }
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
    PlayerInfoObject.SetString("playerName", PlayerName);
    if(Class'WorldInfo'.static.IsConsoleBuild(8))
    {
        AvatarPath = KFPC.GetPS4Avatar(PlayerName);        
    }
    else
    {
        AvatarPath = KFPC.GetSteamAvatar(PlayerUID);
    }
    if(AvatarPath != "")
    {
        PlayerInfoObject.SetString("profileImageSource", "img://" $ AvatarPath);
    }
    MemberSlots[SlotIndex].PlayerUID = PlayerUID;
    return PlayerInfoObject;
}

function UpdatePerks(string Message)
{
    local array<string> PlayerInfoStrings;
    local UniqueNetId PlayerID;
    local string PerkLevel, PrestigeLevel;
    local ActiveLobbyInfo LobbyInfo;
    local int I, PerkIndex;

    ParseStringIntoArray(Message, PlayerInfoStrings, "/", true);
    Class'OnlineSubsystem'.static.StringToUniqueNetId(PlayerInfoStrings[0], PlayerID);
    PerkIndex = int(PlayerInfoStrings[1]);
    PerkLevel = PlayerInfoStrings[2];
    PrestigeLevel = PlayerInfoStrings[3];
    if(OnlineLobby == none)
    {
        return;
    }
    if(OnlineLobby.GetCurrentLobby(LobbyInfo))
    {
        I = 0;
        J0xDD:

        if(I < LobbyInfo.Members.Length)
        {
            UpdatePerkInfoForPlayerID(PlayerID, KFPC.PerkList[PerkIndex].PerkClass, PerkLevel, PrestigeLevel);
            ++ I;
            goto J0xDD;
        }
    }
}

function UpdatePerkInfoForPlayerID(UniqueNetId PlayerID, class<KFPerk> PerkClass, string PerkLevel, string PrestigeLevel)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < PlayerSlots)
    {
        if(MemberSlots[I].PlayerUID == PlayerID)
        {
            MemberSlots[I].PerkLevel = PerkLevel;
            MemberSlots[I].PerkClass = PerkClass;
            MemberSlots[I].PrestigeLevel = PrestigeLevel;
            return;
        }
        ++ I;
        goto J0x0B;
    }
}

function PrintoutDebugMemberSlotInfo()
{
    local string PlayerName;
    local int I;

    I = 0;
    J0x0B:

    if(I < PlayerSlots)
    {
        if(MemberSlots[I].PerkClass != none)
        {
            if(OnlineLobby != none)
            {
                PlayerName = OnlineLobby.GetFriendNickname(MemberSlots[I].PlayerUID);                
            }
            else
            {
                LogInternal("no online lobby.");
            }
            LogInternal((((("$$ Printing INFO FOR: " @ PlayerName) @ "Slot index") @ string(MemberSlots[I].PerkClass)) @ MemberSlots[I].PerkLevel) @ MemberSlots[I].PrestigeLevel);
        }
        ++ I;
        goto J0x0B;
    }
    LogInternal("###end printing out debug info");
}

function UpdateSearching(string Message)
{
    local string SearchingText, PartyLeaderName;
    local UniqueNetId AdminId;

    if(Message == "")
    {
        SetSearchingText("");
        return;
    }
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
        case CreatingGame:
            Manager.ChangeOverviewState(false);
            SearchingText = CreatingGameString;
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
    super.ToggelMuteOnPlayer(SlotIndex);
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
    if(Outer.GetPC().WorldInfo.IsConsoleBuild(8))
    {
        if(LobbyInfo.Members.Length > SlotIndex)
        {
            OnlineSub.PlayerInterfaceEx.ShowGamerCardUIByUsername(byte(Outer.GetLP().ControllerId), OnlineLobby.GetFriendNickname(LobbyInfo.Members[SlotIndex].PlayerUID));            
        }
        else
        {
            OnlineSub.PlayerInterfaceEx.ShowGamerCardUIByUsername(byte(Outer.GetLP().ControllerId), OnlineSub.PlayerInterface.GetPlayerNickname(byte(Outer.GetLP().ControllerId)));
        }        
    }
    else
    {
        OnlineSub.PlayerInterfaceEx.ShowGamerCardUI(byte(Outer.GetLP().ControllerId), MemberSlots[SlotIndex].PlayerUID);
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
    local string CurrentLevel, PrestigeLevel, PerkMessage, UIDStrings;
    local UniqueNetId MyUniqueId;

    CurrentPerk = KFPC.GetPerk();
    PerkIndex = KFPC.GetPerkIndexFromClass(CurrentPerk.Class);
    CurrentLevel = string(KFPC.GetLevel());
    PrestigeLevel = string(KFPC.GetPerkPrestigeLevelFromPerkList(CurrentPerk.Class));
    MyUniqueId = OnlineLobby.GetMyId();
    UIDStrings = Class'OnlineSubsystem'.static.UniqueNetIdToString(MyUniqueId);
    PerkMessage = ((((((PerkPrefix $ UIDStrings) $ "/") $ string(PerkIndex)) $ "/") $ CurrentLevel) $ "/") $ PrestigeLevel;
    if(OnlineLobby != none)
    {
        OnlineLobby.LobbyMessage(PerkMessage);
    }
}
