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
    OnlineLobby = Outer.GetPC().OnlineSub.GetLobbyInterface();
}

function OneSecondLoop();

event bool OnAxisModified(int ControllerId, name Key, float Delta, float DeltaTime, bool bGamepad);

event OnTraderTimeStart();

event OnClose();

function OnLobbyStatusChanged(bool bIsInParty);

function ShowLeavePartyPopUp()
{
    if(Manager != none)
    {
        Manager.OpenPopup(0, LeavePartyTitleString, LeavePartyDescriptionString, LeaveString, Class'KFCommon_LocalizedStrings'.default.CancelString, ConfirmLeaveParty, CancelLeaveParty);
    }
}

function ConfirmLeaveParty()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    if(OnlineLobby != none)
    {
        if((KFPC != none) && KFPC.MyGFxManager != none)
        {
            if((KFPC.MyGFxManager.StartMenu != none) && !OnlineLobby.IsLobbyOwner())
            {
                KFPC.MyGFxManager.StartMenu.ShowOverview(false, false, true, false);
            }
            OnlineLobby.QuitLobby();
        }
    }
    if(!Class'WorldInfo'.static.IsMenuLevel())
    {
        Outer.ConsoleCommand("Disconnect");
    }
}

function CancelLeaveParty();

function Callback_ControllerCloseMenu()
{
    local KFPlayerReplicationInfo KFPRI;

    KFPRI = KFPlayerReplicationInfo(Outer.GetPC().PlayerReplicationInfo);
    if((Manager != none) && KFPRI != none)
    {
        if((!Class'WorldInfo'.static.IsMenuLevel() && KFPRI.WorldInfo.GRI.bMatchHasBegun) && Manager.bUsingGamepad)
        {
            Manager.CloseMenus();
        }
    }
}

function Callback_Quit()
{
    if(Manager != none)
    {
        Manager.MenuBarWidget.OpenQuitPopUp();
    }
}

function Callback_MenusFinishedClosing()
{
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

function Callback_ReadyClicked(bool bReady)
{
    local KFPlayerReplicationInfo KFPRI;

    KFPRI = KFPlayerReplicationInfo(Outer.GetPC().PlayerReplicationInfo);
    if(KFPRI != none)
    {
        KFPRI.SetPlayerReady(bReady);
        if(KFPRI.WorldInfo.GRI.bMatchHasBegun)
        {
            KFPlayerController(Outer.GetPC()).MyGFxManager.CloseMenus();
            Outer.GetPC().ServerRestartPlayer();            
        }
        else
        {
            if(Manager != none)
            {
                if(Manager.PartyWidget != none)
                {
                    Manager.PartyWidget.RefreshParty();
                }
                if((Manager.StartMenu != none) && bReady)
                {
                    Manager.StartMenu.OnPlayerReadiedUp();
                }
            }
        }
    }
}

function Callback_PlayerClicked(int SlotIndex);

function Callback_PerkChanged(int PerkIndex)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC != none)
    {
        KFPC.RequestPerkChange(byte(PerkIndex));
        KFPC.SetHaveUpdatePerk(true);
        if(KFPC.MyGFxManager != none)
        {
            if(KFPC.MyGFxManager.CurrentMenu == KFPC.MyGFxManager.PerksMenu)
            {
                KFPC.MyGFxManager.PerksMenu.UpdateLock();
            }
        }
    }
}

function Callback_ProfileOption(int OptionIndex, int SlotIndex)
{
    LogInternal("Callback_ProfileOption: " @ string(OptionIndex));
    if((Manager != none) && Manager.PartyWidget != none)
    {
        Manager.PartyWidget.ProfileOptionClicked(OptionIndex, SlotIndex);
    }
}

function Callback_CreateParty()
{
    if((OnlineLobby != none) && Manager.GetMultiplayerMenuActive())
    {
        OnlineLobby.MakeLobby(6, 2);
        OnlineLobby.ShowLobbyInviteInterface();
    }
}

function Callback_LeaveParty()
{
    ShowLeavePartyPopUp();
}

function Callback_InviteFriend()
{
    if(OnlineLobby != none)
    {
        OnlineLobby.ShowLobbyInviteInterface();
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
            Outer.GetPC().Say(Message);
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