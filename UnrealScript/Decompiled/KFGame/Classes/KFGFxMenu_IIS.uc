/*******************************************************************************
 * KFGFxMenu_IIS generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxMenu_IIS extends KFGFxObject_Menu within GFxMoviePlayer
    native(UI);

var delegate<OnAutoLoginComplete> AutoLoginCompleteDelegate;
var bool bLoggingIn;
var bool bForceConnectionAtLogin;
var OnlineSubsystem OnlineSub;
var PlayfabInterface PlayfabInter;
var delegate<OnAutoLoginComplete> __OnAutoLoginComplete__Delegate;

delegate OnAutoLoginComplete();

event AttemptAutoLogin(optional delegate<OnAutoLoginComplete> del)
{
    del = None;
    AutoLoginCompleteDelegate = del;
    LoginToGame();
}

function OnOpen()
{
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    PlayfabInter = Class'GameEngine'.static.GetPlayfabInterface();
    SetString("loginText", ConsoleLocalize("PressButtonToStart"));
    SetBool("showLoading", false);
}

event OnClose()
{
    local KFGameViewportClient GVC;

    GVC = KFGameViewportClient(Outer.GetGameViewportClient());
    if(GVC != none)
    {
        GVC.bSeenIIS = true;
    }
    UnRegisterDelegates();
}

function UnRegisterDelegates();

event bool FilterButtonInput(int ControllerId, name ButtonName, Core.Object.EInputEvent InputEvent)
{
    if((((ButtonName == 'XboxTypeS_A') && InputEvent == 0) && Manager != none) && Manager.CurrentPopup == none)
    {
        LoginToGame();
        return true;
    }
    return false;
}

function LoginToGame()
{
    if(Class'WorldInfo'.static.IsConsoleBuild() && Class'WorldInfo'.static.IsE3Build())
    {
        OnlineSub.PlayerInterface.Login(0, "E3 Demo Player", "", true);
    }
    if(bLoggingIn)
    {
        WarnInternal("Ignoring login while one is already occurring");
        return;
    }
    bLoggingIn = true;
    SetString("loginText", ConsoleLocalize("LoggingIn"));
    SetBool("showLoading", true);
    KFPlayerController(Outer.GetPC()).StartLogin(OnLoginToGameComplete, AutoLoginCompleteDelegate != none);
}

function OnLoginToGameComplete()
{
    local KFPlayerController PC;

    PC = KFPlayerController(Outer.GetPC());
    PC.ResetPerkStatsLoaded();
    PC.ClientInitializePerks();
    Manager.PartyWidget.RefreshParty();
    Manager.OpenMenu(0);
    bLoggingIn = false;
    if(AutoLoginCompleteDelegate != none)
    {
        OnAutoLoginComplete();
        AutoLoginCompleteDelegate = None;
    }
}

function NotifyLoginFailed()
{
    bLoggingIn = false;
    SetBool("showLoading", false);
}
