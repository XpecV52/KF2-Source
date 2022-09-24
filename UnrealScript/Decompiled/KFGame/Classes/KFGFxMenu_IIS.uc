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
var bool bClosed;
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
    local string LoginTextString;
    local GFxObject PressStartTxtField;
    local KFGameEngine KFEngine;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    PlayfabInter = Class'GameEngine'.static.GetPlayfabInterface();
    LoginTextString = ConsoleLocalize("PressButtonToStart");
    if(Class'WorldInfo'.static.IsConsoleBuild(9))
    {        
        LoginTextString @= ("<br>" $ (ConsoleLocalize("SwitchProfile")));
        PressStartTxtField = GetObject("textField");
        PressStartTxtField.SetBool("multiline", true);
    }
    SetString("loginText", LoginTextString);
    SetBool("showLoading", false);
    Class'Engine'.static.GetEngine().GameViewport.bAllowInputFromMultipleControllers = true;
    KFEngine = KFGameEngine(Class'Engine'.static.GetEngine());
    if(Class'WorldInfo'.static.IsConsoleBuild(9))
    {
        KFEngine.LocalLoginStatus = 0;
    }
    if(KFEngine.GameSettingsForPendingInvite != none)
    {
        Outer.GetPC().CachedInviteResult.GameSettings = KFEngine.GameSettingsForPendingInvite;
        OnlineSub.ManuallyActivateUser(KFEngine.GameSettingsForPendingInvite.OwningPlayerId);
        KFEngine.GameSettingsForPendingInvite = none;
        Outer.GetPC().OnGameInviteAccepted(Outer.GetPC().CachedInviteResult, 0);        
    }
    else
    {
        if(KFEngine.ReturnToIISConnectionErrorMessage != "")
        {
            Manager.DelayedOpenPopup(2, 0, KFEngine.ReturnToIISConnectionErrorTitle, KFEngine.ReturnToIISConnectionErrorMessage, Class'KFCommon_LocalizedStrings'.default.OKString);
            KFEngine.ReturnToIISConnectionErrorTitle = "";
            KFEngine.ReturnToIISConnectionErrorMessage = "";
        }
    }
}

event OnClose()
{
    local KFGameViewportClient GVC;

    bClosed = true;
    GVC = KFGameViewportClient(Outer.GetGameViewportClient());
    if(GVC != none)
    {
        GVC.bSeenIIS = true;
        GVC.bAllowInputFromMultipleControllers = false;
    }
    UnRegisterDelegates();
}

function UnRegisterDelegates()
{
    OnlineSub.PlayerInterface.ClearLoginCancelledDelegate(OnLoginCancelled);
    OnlineSub.PlayerInterface.ClearLoginStatusChangeDelegate(OnLoginStatusChanged, byte(Outer.GetLP().ControllerId));
    OnlineSub.PlayerInterface.ClearReadProfileSettingsCompleteDelegate(byte(Outer.GetLP().ControllerId), OnReadProfileSettingsComplete);
    OnlineSub.StatsInterface.ClearReadOnlineStatsCompleteDelegate(OnStatsRead);
}

event bool FilterButtonInput(int ControllerId, name ButtonName, Core.Object.EInputEvent InputEvent)
{
    if(bClosed)
    {
        WarnInternal("FilterButtonInput called after IIS menu has been closed!");
        return false;
    }
    if(((InputEvent == 0) && Manager != none) && Manager.CurrentPopup == none)
    {
        if(ButtonName == 'XboxTypeS_A')
        {
            OnlineSub.ActivateGamepad(ControllerId);
            if(ValidateActiveAccount(byte(Outer.GetLP().ControllerId)))
            {
                LoginToGame();
            }
            return true;            
        }
        else
        {
            if(Class'WorldInfo'.static.IsConsoleBuild(9) && ButtonName == 'XboxTypeS_Y')
            {
                if(!bLoggingIn && ValidateActiveAccount(byte(ControllerId)))
                {
                    OnlineSub.PlayerInterface.ShowLoginUI(byte(ControllerId));
                }
                return true;
            }
        }
    }
    return false;
}

function bool ValidateActiveAccount(byte ControllerId)
{
    local UniqueNetId NewUniqueId, ZeroId;

    if(Class'WorldInfo'.static.IsConsoleBuild(9))
    {
        if(ControllerId != Outer.GetLP().ControllerId)
        {
            Outer.GetLP().ControllerId = ControllerId;
        }
        OnlineSub.PlayerInterface.GetUniquePlayerId(ControllerId, NewUniqueId);
        if(NewUniqueId == ZeroId)
        {
            ShowLoginUI();
            return false;
        }
    }
    return true;
}

function ShowLoginUI()
{
    OnlineSub.PlayerInterface.AddLoginCancelledDelegate(OnLoginCancelled);
    OnlineSub.PlayerInterface.AddLoginStatusChangeDelegate(OnLoginStatusChanged, byte(Outer.GetLP().ControllerId));
    OnlineSub.PlayerInterface.ShowLoginUI(byte(Outer.GetLP().ControllerId));
}

function OnLoginCancelled()
{
    OnlineSub.PlayerInterface.ClearLoginCancelledDelegate(OnLoginCancelled);
    OnlineSub.PlayerInterface.ClearLoginStatusChangeDelegate(OnLoginStatusChanged, byte(Outer.GetLP().ControllerId));
    Manager.DelayedOpenPopup(0, 0, ConsoleLocalize("NotSignedInTitle"), ConsoleLocalize("PlayOffline"), Class'KFCommon_LocalizedStrings'.default.OKString, Class'KFCommon_LocalizedStrings'.default.CancelString, OnConfirmPlayOffline, ShowLoginUI);
}

function OnConfirmPlayOffline()
{
    local UIDataStore_OnlinePlayerData PlayerDataDS;
    local OnlineProfileSettings ProfileSettings;

    PlayerDataDS = UIDataStore_OnlinePlayerData(Class'UIInteraction'.static.GetDataStoreClient().FindDataStore('OnlinePlayerData', Outer.GetLP()));
    ProfileSettings = OnlineProfileSettings(PlayerDataDS.ProfileProvider.Profile);
    ProfileSettings.SetToDefaults();
    ProfileSettings.ExpandExtraFromProfileSettings();
    OnlineSub.SetCachedProfile(ProfileSettings);
    KFPlayerController(Outer.GetPC()).vect(6.162971E-33, NaN, -2.100694E-18);
    0
    @NULL    
    assert((@NULL != (true != )) != KFGameEngine(Class'Engine'.static.GetEngine()).LocalLoginStatus = 1);
}

function OnLoginStatusChanged(Engine.OnlineSubsystem.ELoginStatus NewStatus, UniqueNetId NewId)
{
    OnlineSub.PlayerInterface.ClearLoginCancelledDelegate(OnLoginCancelled);
    OnlineSub.PlayerInterface.ClearLoginStatusChangeDelegate(OnLoginStatusChanged, byte(Outer.GetLP().ControllerId));
    if(NewStatus == 2)
    {
        LoginToGame();
    }
}

function LoginToGame()
{
    local UIDataStore_OnlinePlayerData PlayerDataDS;
    local string LoggingInText;
    local UniqueNetId ZeroId;

    if(bLoggingIn)
    {
        WarnInternal("Ignoring login while one is already occurring");
        return;
    }
    bLoggingIn = true;
    LoggingInText = ConsoleLocalize("LoggingIn");
    if(Class'WorldInfo'.static.IsConsoleBuild(9) && Outer.GetLP().GetUniqueNetId() != ZeroId)
    {
        LoggingInText = (Outer.GetLP().GetNickname() $ "<br>") $ LoggingInText;
    }
    SetString("loginText", LoggingInText);
    SetBool("showLoading", true);
    if(Class'WorldInfo'.static.IsConsoleBuild(9))
    {
        OnlineSub.PlayerInterface.Logout(byte(Outer.GetLP().ControllerId));
        if(PlayfabInter != none)
        {
            PlayfabInter.Logout();
        }
        PlayerDataDS = UIDataStore_OnlinePlayerData(Class'UIInteraction'.static.GetDataStoreClient().FindDataStore('OnlinePlayerData', Outer.GetLP()));
        OnlineSub.PlayerInterface.AddReadProfileSettingsCompleteDelegate(byte(Outer.GetLP().ControllerId), OnReadProfileSettingsComplete);
        OnlineSub.PlayerInterface.ReadProfileSettings(byte(Outer.GetLP().ControllerId), OnlineProfileSettings(PlayerDataDS.ProfileProvider.Profile));        
    }
    else
    {
        KFPlayerController(Outer.GetPC()).StartLogin(OnLoginToGameComplete, AutoLoginCompleteDelegate != none);
    }
}

function OnReadProfileSettingsComplete(byte LocalUserNum, bool bWasSuccessful)
{
    LogInternal((("Profile settings read for" @ string(LocalUserNum)) @ "with success") @ string(bWasSuccessful));
    OnlineSub.PlayerInterface.ClearReadProfileSettingsCompleteDelegate(byte(Outer.GetLP().ControllerId), OnReadProfileSettingsComplete);
    KFPlayerController(Outer.GetPC()).OnReadProfileSettingsComplete(LocalUserNum, bWasSuccessful);
    KFPlayerController(Outer.GetPC()).SetStatsReadOwningPlayerId(Outer.GetLP().GetUniqueNetId());
    KFPlayerController(Outer.GetPC()).StartLogin(OnLoginToGameComplete, AutoLoginCompleteDelegate != none);
}

function OnLoginToGameComplete()
{
    if((OnlineSub.PlayerInterface.GetLoginStatus(byte(Outer.GetLP().ControllerId)) != 2) && Class'WorldInfo'.static.IsConsoleBuild(9))
    {
        return;
    }
    KFGameEngine(Class'Engine'.static.GetEngine()).LocalLoginStatus = 2;
    OnlineSub.StatsInterface.AddReadOnlineStatsCompleteDelegate(OnStatsRead);
    KFPlayerController(Outer.GetPC()).ReadStats();
}

function OnStatsRead(bool bWasSuccessful)
{
    LogInternal("stats read with success" @ string(bWasSuccessful));
    OnlineSub.StatsInterface.ClearReadOnlineStatsCompleteDelegate(OnStatsRead);
    ProceedToMainMenu();
    if(AutoLoginCompleteDelegate != none)
    {
        OnAutoLoginComplete();
        AutoLoginCompleteDelegate = None;
    }
}

function ProceedToMainMenu()
{
    local KFPlayerController PC;

    PC = KFPlayerController(Outer.GetPC());
    PC.ResetPerkStatsLoaded();
    PC.ClientInitializePerks();
    Manager.PartyWidget.RefreshParty();
    Manager.OpenMenu(0);
    bLoggingIn = false;
    Class'KFGameEngine'.static.InitEventContent();
    if(Manager != none)
    {
        Manager.UpdateBackgroundMovie();
        if(Manager.StartMenu.MissionObjectiveContainer != none)
        {
            Manager.StartMenu.MissionObjectiveContainer.UpdateMissionObjectiveState();
        }
        PC.UpdateSeasonalState();
    }
    Class'Engine'.static.GetEngine().GameViewport.bAllowInputFromMultipleControllers = false;
    if(Class'WorldInfo'.static.IsConsoleBuild(9))
    {
        if(!Manager.CachedProfile.HasSafeFrameSet())
        {
            Manager.OpenScreenSizeMovie();            
        }
        else
        {
            if(!Manager.bSetGamma && !Class'KFGameEngine'.static.CheckSkipGammaCheck())
            {
                PC.SetTimer(0.01, false, 'DelayedOpenGammaPopup', self);
            }
        }
    }
    if((Class'WorldInfo'.static.IsConsoleBuild(9) && !OnlineSub.SystemInterface.IsControllerConnected(Outer.GetLP().ControllerId)) && !Class'Engine'.static.GetEngine().GameViewport.bNeedsNewGamepadPairingForNewProfile)
    {
        PC.SetTimer(0.01, false, 'ShowControllerDisconnectedDialog');
    }
    PC.CheckPrivilegesForMultiplayer();
}

function DelayedOpenGammaPopup()
{
    Manager.ManagerObject.SetBool("bStartUpGamma", true);
    Manager.DelayedOpenPopup(1, 4, "", Class'KFGFxOptionsMenu_Graphics'.default.AdjustGammaDescription, Class'KFGFxOptionsMenu_Graphics'.default.ResetGammaString, Class'KFGFxOptionsMenu_Graphics'.default.SetGammaString);
}

function NotifyLoginFailed()
{
    if((OnlineSub.PlayerInterface.GetLoginStatus(byte(Outer.GetLP().ControllerId)) != 2) && Class'WorldInfo'.static.IsConsoleBuild(9))
    {
        return;
    }
    ProceedToMainMenu();
}
