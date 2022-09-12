/*******************************************************************************
 * KFGFxObject_Menu generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxObject_Menu extends GFxObject within GFxMoviePlayer
    native(UI);

var KFGFxMoviePlayer_Manager Manager;
var TWOnlineLobby OnlineLobby;
var const localized string LeavePartyTitleString;
var const localized string LeavePartyDescriptionString;
var const localized string LeaveString;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    Manager = InManager;
    InitOnlineLobby();
    Outer.GetPC().PlayerInput.ResetInput();
}

function OnOpen();

function InitOnlineLobby()
{
    if(Outer.GetPC().OnlineSub != none)
    {
        OnlineLobby = Outer.GetPC().OnlineSub.GetLobbyInterface();
    }
}

function OnR3Pressed()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC != none)
    {
        KFPC.RequestSwitchTeam();
    }
}

function OnInputTypeChanged(bool bGamepad);

function OneSecondLoop();

event bool OnAxisModified(int ControllerId, name Key, float Delta, float DeltaTime, bool bGamepad);

event OnTraderTimeStart();

function OnRoundOver();

event OnClose();

function OnLobbyStatusChanged(bool bIsInParty);

function ShowLeavePartyPopUp()
{
    if(Manager != none)
    {
        Manager.DelayedOpenPopup(0, 0, LeavePartyTitleString, LeavePartyDescriptionString, LeaveString, Class'KFCommon_LocalizedStrings'.default.CancelString, ConfirmLeaveParty, CancelLeaveParty);
    }
}

function ConfirmLeaveParty()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    if(OnlineLobby != none)
    {
        OnlineLobby.QuitLobby();
        if((KFPC != none) && KFPC.MyGFxManager != none)
        {
            if(KFPC.MyGFxManager.MenuBarWidget != none)
            {
                KFPC.MyGFxManager.MenuBarWidget.UpdateMenu(KFPC.MyGFxManager.CurrentMenuIndex);
            }
            if((KFPC.MyGFxManager.StartMenu != none) && !OnlineLobby.IsLobbyOwner())
            {
                KFPC.MyGFxManager.StartMenu.OnPartyLeave();
            }
        }
    }
    if(!Class'WorldInfo'.static.IsMenuLevel())
    {
        Outer.ConsoleCommand("Disconnect");
    }
    if(Class'WorldInfo'.static.IsEOSBuild() && Manager != none)
    {
        Manager.OnLobbyStatusChanged(false);
    }
}

function CancelLeaveParty();

function string ConsoleLocalize(string Key, optional string SectionName)
{
    return Localize(((SectionName != "") ? SectionName : string(self.Class.Name)), Key, "KFGameConsole");
}

function Callback_ControllerCloseMenu()
{
    local KFPlayerReplicationInfo KFPRI;

    KFPRI = KFPlayerReplicationInfo(Outer.GetPC().PlayerReplicationInfo);
    LogInternal((((((((((("(" $ string(Name)) $ ") KFGFxObject_Menu::") $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ "KFPRI:'") $ string(KFPRI)) $ "'") @ "Manager:'") $ string(Manager)) $ "'");
    if((Manager != none) && KFPRI != none)
    {
        if(!Class'WorldInfo'.static.IsMenuLevel() && Manager.bUsingGamepad)
        {
            if(KFPRI.bReadyToPlay || KFPRI.bOnlySpectator)
            {
                if(KFPRI.WorldInfo.GRI.bMatchHasBegun)
                {
                    Manager.CloseMenus();                    
                }
                else
                {
                    if(Manager.bAfterLobby && ((Manager.CurrentMenu != none) && Manager.PostGameMenu != none) && Manager.CurrentMenu != Manager.PostGameMenu)
                    {
                        Manager.ToggleMenus();
                    }
                }
            }
        }
    }
}

function Callback_Quit()
{
    if(Manager != none)
    {
        if(Class'WorldInfo'.static.IsConsoleBuild(9))
        {
            Manager.MenuBarWidget.OpenLogoutPopup();            
        }
        else
        {
            Manager.MenuBarWidget.OpenQuitPopUp();
        }
    }
}

function Callback_MenusFinishedClosing()
{
    LogInternal(((((((("(" $ string(Name)) $ ") KFGFxObject_Menu::") $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ "Manager.bMenusOpen:'") $ string(Manager.bMenusOpen)) $ "'");
    if((Manager != none) && Manager.bMenusOpen)
    {
        Manager.MenusFinishedClosing();
    }
}

function Callback_MenuBarTabChanged(int NewMenuIndex)
{
    if(Manager != none)
    {
        Manager.OpenMenu(byte(NewMenuIndex));
    }
}

function Callback_RequestTeamSwitch()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC != none)
    {
        KFPC.RequestSwitchTeam();
    }
}

function Callback_ReadyClicked(bool bReady)
{
    local KFPlayerReplicationInfo KFPRI;
    local KFGameReplicationInfo KFGRI;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    KFPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
    KFGRI = KFGameReplicationInfo(KFPRI.WorldInfo.GRI);
    if(KFPRI != none)
    {
        if(KFGRI.bMatchHasBegun)
        {
            if(KFGRI.bTraderIsOpen && KFPRI.bHasSpawnedIn)
            {
                if(KFPC.MyGFxManager.bMenusOpen && KFPC.MyGFxManager.CurrentMenu != KFPC.MyGFxManager.TraderMenu)
                {
                    KFPRI.RequestSkiptTrader(KFPRI);
                    KFPC.MyGFxManager.CloseMenus();
                    if((Manager != none) && Manager.PartyWidget != none)
                    {
                        Manager.PartyWidget.SetReadyButtonVisibility(false);
                    }
                }                
            }
            else
            {
                KFPRI.SetPlayerReady(bReady);
                KFPlayerController(Outer.GetPC()).MyGFxManager.CloseMenus();
                Outer.GetPC().ServerRestartPlayer();
            }            
        }
        else
        {
            if(Manager != none)
            {
                KFPRI.SetPlayerReady(bReady);
                if(Manager.PartyWidget != none)
                {
                    Manager.PartyWidget.RefreshParty();
                }
                if((Manager.StartMenu != none) && bReady)
                {
                    Manager.StartMenu.OnPlayerReadiedUp();
                }
                if(Manager.PerksMenu != none)
                {
                    Manager.PerksMenu.SelectionContainer.SetPerkListEnabled(!bReady);
                }
            }
        }
    }
}

function Callback_PlayerClicked(int SlotIndex);

function ConfirmCreateParty()
{
    local OnlineSubsystem OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if(OnlineLobby != none)
    {
        if(((OnlineSub != none) && !OnlineSub.IsGameOwned()) && Class'WorldInfo'.static.IsConsoleBuild(8))
        {
            if(OnlineSub.CanCheckFreeTrialState() && !OnlineSub.IsFreeTrialPeriodActive())
            {
                Manager.HandleFreeTrialError(2);
                return;
            }
            if(!OnlineSub.CanCheckFreeTrialState())
            {
                Manager.HandleFreeTrialError(1);
                return;
            }
        }
        if(Class'WorldInfo'.static.IsConsoleBuild())
        {
            OnlineLobby.MakeLobby(6, 2);
            OnlineLobby.ShowLobbyInviteInterface(Localize("Notifications", "InviteMessage", "KFGameConsole"));            
        }
        else
        {
            OnlineLobby.MakeLobby(6, 1);
            showFriendsListPopup();
        }
    }
}

function showFriendsListPopup()
{
    Manager.DelayedOpenPopup(5, 5, Class'KFCommon_LocalizedStrings'.default.FriendsListPopupTitleString, "", Class'KFCommon_LocalizedStrings'.default.ReturnString);
}

function Callback_PerkChanged(int PerkIndex)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC != none)
    {
        KFPC.RequestPerkChange(byte(PerkIndex));
        if(KFPC.CanUpdatePerkInfo())
        {
            KFPC.SetHaveUpdatePerk(true);
        }
        if(KFPC.MyGFxManager != none)
        {
            if(KFPC.MyGFxManager.CurrentMenu == KFPC.MyGFxManager.PerksMenu)
            {
                KFPC.MyGFxManager.PerksMenu.UpdateLock();
            }
        }
    }
}

function Callback_ProfileOption(string OptionKey, int SlotIndex)
{
    if((Manager != none) && Manager.PartyWidget != none)
    {
        LogInternal("OptionKey- " @ OptionKey, 'DevGFxUI');
        Manager.PartyWidget.ProfileOptionClicked(OptionKey, SlotIndex);
    }
}

function Callback_CreateParty()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        KFPC.StartLogin(ConfirmCreateParty, true);        
    }
    else
    {
        if(Class'WorldInfo'.static.IsEOSBuild() && Manager != none)
        {
            Manager.OnLobbyStatusChanged(true);
        }
        ConfirmCreateParty();
    }
}

function Callback_LeaveParty()
{
    ShowLeavePartyPopUp();
}

function Callback_OpenPlayerList(int SlotIndex)
{
    if(Manager != none)
    {
        if(Manager.PartyWidget != none)
        {
            Manager.PartyWidget.OpenPlayerList(SlotIndex);
        }
    }
}

function Callback_InviteFriend()
{
    local OnlineSubsystem OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        if((((OnlineSub != none) && !OnlineSub.IsGameOwned()) && !OnlineSub.IsFreeTrialPeriodActive()) && Class'WorldInfo'.static.IsConsoleBuild(8))
        {
            Class'KFGFxMoviePlayer_Manager'.static.DisplayFreeTrialOverPopUp();
            return;
        }
        if(Class'WorldInfo'.static.IsMenuLevel())
        {
            OnlineLobby.ShowLobbyInviteInterface(Localize("Notifications", "InviteMessage", "KFGameConsole"));            
        }
        else
        {
            OnlineSub.PlayerInterfaceEx.ShowInviteUI(byte(Manager.GetLP().ControllerId), "");
        }        
    }
    else
    {
        if(OnlineLobby != none)
        {
            OnlineLobby.MakeLobby(6, 1);
            showFriendsListPopup();
        }
    }
}

function PlayOpenAnimation();

function PlayCloseAnimation(float AnimationRate)
{
    ActionScriptVoid("closeMenu");
}

function Callback_BroadcastChatMessage(string Message)
{
    local PlayerReplicationInfo PRI;
    local string ChatMessage;

    PRI = Outer.GetPC().PlayerReplicationInfo;
    if(Message != "")
    {
        if(Class'WorldInfo'.static.IsMenuLevel())
        {
            ChatMessage = (PRI.PlayerName $ ": ") $ Message;
            if(OnlineLobby != none)
            {
                OnlineLobby.LobbyMessage(ChatMessage);
            }            
        }
        else
        {
            if(Manager.bAfterLobby)
            {
                Outer.GetPC().TeamSay(Message);                
            }
            else
            {
                Outer.GetPC().Say(Message);
            }
        }
    }
}

function Callback_ChatFocusIn()
{
    Manager.ClearFocusIgnoreKeys();
}

function Callback_ChatFocusOut()
{
    Manager.UpdateDynamicIgnoreKeys();
}

event bool FilterButtonInput(int ControllerId, name ButtonName, Core.Object.EInputEvent InputEvent);

function SetControlScheme(bool bUseGamePad)
{
    ActionScriptVoid("setGamepadInput");
}

function Callback_MouseMoved()
{
    SetControlScheme(false);
}

defaultproperties
{
    LeavePartyTitleString="LEAVING PARTY"
    LeavePartyDescriptionString="Are you sure you want to leave this online party?"
    LeaveString="LEAVE"
}