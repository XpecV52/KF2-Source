/*******************************************************************************
 * KFGFxWidget_MenuBar generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWidget_MenuBar extends KFGFxObject_Menu within GFxMoviePlayer;

var const localized array<localized string> MenuStrings;
var const localized string ExitString;
var const localized string CancelString;
var const localized string ServerBrowserString;
var const localized string MatchmakingString;
var const localized string SoloString;
var const localized string OverviewString;
var const localized array<localized string> TitleStrings;
var const localized array<localized string> DescriptionStrings;
var string LastHomeString;
var GFxObject InventoryButton;
var GFxObject StoreButton;
var int SaveCurrentMenuIndex;
var bool bCachedGameFullyInstalled;
var bool bAllowBumper;
var bool bGearButtonEnabled;

function InitializeCurrentMenu(byte CurrentMenuIndex)
{
    UpdateMenu(CurrentMenuIndex);
}

function CalloutButtonBumperPress(int Delta)
{
    if(bAllowBumper)
    {
        SetInt("calloutButtonBumperPress", Delta);
        bAllowBumper = false;
        Class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(0.1, false, 'UnblockBumper', self);
    }
}

function UnblockBumper()
{
    bAllowBumper = true;
}

function UpdateMenu(byte CurrentMenuIndex)
{
    local GFxObject DataProvider, TempObj;
    local byte I;

    DataProvider = Outer.CreateArray();
    GetObject("menuButtonBar").GetObject("dataProvider");
    I = 0;
    J0x74:

    if(I < MenuStrings.Length)
    {
        if(((I == (MenuStrings.Length - 1)) && Class'WorldInfo'.static.IsMenuLevel()) && Class'WorldInfo'.static.IsConsoleBuild(8))
        {
            goto J0x189;
        }
        TempObj = Outer.CreateObject("Object");
        HandleButtonSpecialCase(I, TempObj);
        DataProvider.SetElementObject(I, TempObj);
        ++ I;
        goto J0x74;
    }
    J0x189:

    SaveCurrentMenuIndex = CurrentMenuIndex;
    if((((InventoryButton != none) && StoreButton != none) && !Class'WorldInfo'.static.IsE3Build()) && Class'WorldInfo'.static.IsConsoleBuild())
    {
        CheckGameFullyInstalled();
    }
    DataProvider.SetInt("selectedIndex", CurrentMenuIndex);
    SetObject("dataObject", DataProvider);
}

function HandleButtonSpecialCase(byte ButtonIndex, out GFxObject GfxButton)
{
    GfxButton.SetInt("index", ButtonIndex);
    if(((ButtonIndex == 7) && Class'WorldInfo'.static.IsMenuLevel()) && Class'WorldInfo'.static.IsConsoleBuild(9))
    {
        GfxButton.SetString("label", ConsoleLocalize("LogoutTitle"));        
    }
    else
    {
        GfxButton.SetString("label", MenuStrings[ButtonIndex]);
    }
    switch(ButtonIndex)
    {
        case 3:
            GfxButton.SetBool("enabled", CanUseDoshVault());
            return;
        case 2:
            bGearButtonEnabled = CanUseGearButton(Outer.GetPC(), Manager);
            GfxButton.SetBool("enabled", bGearButtonEnabled);
            return;
        case 3:
            GfxButton.SetBool("enabled", Class'WorldInfo'.static.IsMenuLevel());
            break;
        case 0:
            GfxButton.SetString("label", GetHomeButtonName());
            GfxButton.SetBool("bPulsing", ShouldStartMenuPulse());
            break;
        case 4:
            GfxButton.SetBool("enabled", CanUseInventory());
            InventoryButton = GfxButton;
            return;
        case 5:
            if(Class'WorldInfo'.static.IsConsoleBuild(9))
            {
                GfxButton.SetString("label", ConsoleLocalize("StoreStringXB1", "KFGFxMenu_Store"));
            }
            GfxButton.SetBool("enabled", CanUseStore());
            StoreButton = GfxButton;
            return;
        default:
            break;
    }
    GfxButton.SetBool("enabled", true);
}

function UpdateInventoryButtonState()
{
    if(InventoryButton != none)
    {
        InventoryButton.SetBool("enabled", CanUseInventory());
    }
}

function UpdateGearButtonState()
{
    local bool bCanChangeGear;

    bCanChangeGear = CanUseGearButton(Outer.GetPC(), Manager);
    if(bCanChangeGear != bGearButtonEnabled)
    {
        SetGearMenuEnabled(bCanChangeGear);
        bGearButtonEnabled = bCanChangeGear;
    }
}

function SetGearMenuEnabled(bool bEnabled)
{
    ActionScriptVoid("setGearButtonEnabled");
}

function CheckGameFullyInstalled()
{
    if(!bCachedGameFullyInstalled)
    {
        if(Class'GameEngine'.static.IsGameFullyInstalled())
        {
            bCachedGameFullyInstalled = true;
            InventoryButton.SetBool("enabled", true);
            StoreButton.SetBool("enabled", true);
            UpdateMenu(byte(SaveCurrentMenuIndex));            
        }
        else
        {
            InventoryButton.SetBool("enabled", false);
            StoreButton.SetBool("enabled", false);
            Class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(1, false, 'CheckGameFullyInstalled', self);
        }
    }
}

function OpenQuitPopUp()
{
    local string TitleString, DescriptionString;

    TitleString = TitleStrings[Rand(TitleStrings.Length)];
    DescriptionString = DescriptionStrings[Rand(DescriptionStrings.Length)];
    if(Manager != none)
    {
        Manager.DelayedOpenPopup(0, 0, TitleString, DescriptionString, ExitString, Class'KFCommon_LocalizedStrings'.default.CancelString, OnQuitConfirm);
    }
}

function OnQuitConfirm()
{
    Outer.ConsoleCommand("quit");
}

function OpenLogoutPopup()
{
    if(Manager != none)
    {
        Manager.DelayedOpenPopup(0, 0, ConsoleLocalize("LogoutDialogTitle"), ConsoleLocalize("LogoutDialogMessage"), ConsoleLocalize("LogoutTitle"), Class'KFCommon_LocalizedStrings'.default.CancelString, OnLogoutConfirm);
    }
}

function OnLogoutConfirm()
{
    KFGameEngine(Class'Engine'.static.GetEngine()).PerformLogout();
}

function string GetHomeButtonName()
{
    local byte StartMenuState;

    if((Manager != none) && Manager.StartMenu != none)
    {
        if(Manager.CurrentMenuIndex == 16)
        {
            LastHomeString = ServerBrowserString;
            return LastHomeString;
        }
        StartMenuState = Manager.StartMenu.GetStartMenuState();
        if(Manager.CurrentMenuIndex == 0)
        {
            switch(StartMenuState)
            {
                case 0:
                    LastHomeString = MatchmakingString;
                    break;
                case 1:
                    LastHomeString = ServerBrowserString;
                    break;
                case 2:
                    LastHomeString = SoloString;
                    break;
                case 3:
                case 4:
                    LastHomeString = OverviewString;
                    break;
                default:
                    LastHomeString = MenuStrings[0];
                    break;
            }
        }
    }
    return LastHomeString;
}

function bool ShouldStartMenuPulse()
{
    if(((Manager != none) && Class'WorldInfo'.static.IsMenuLevel()) && OnlineLobby != none)
    {
        return (Manager.CurrentMenuIndex != 0) && OnlineLobby.IsInLobby();
    }
    return false;
}

static function bool CanUseGearButton(PlayerController PC, KFGFxMoviePlayer_Manager GfxManager)
{
    if((!GfxManager.bAfterLobby && !PC.PlayerReplicationInfo.bOnlySpectator) || Class'WorldInfo'.static.IsMenuLevel())
    {
        return true;
    }
    return false;
}

function bool CanUseInventory()
{
    if(Class'WorldInfo'.static.IsE3Build())
    {
        return false;
    }
    if(((Outer.GetPC().Pawn != none) && !Manager.bAfterLobby) || Class'WorldInfo'.static.IsMenuLevel())
    {
        return true;
    }
    return false;
}

function bool CanUseDoshVault()
{
    return Class'WorldInfo'.static.IsMenuLevel();
}

function bool CanUseStore()
{
    if(Class'WorldInfo'.static.IsE3Build())
    {
        return false;
    }
    if((Class'WorldInfo'.static.IsConsoleBuild() && Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetLoginStatus(byte(Outer.GetLP().ControllerId)) != 2) || !Class'GameEngine'.static.GetOnlineSubsystem().IsGameOwned())
    {
        return false;
    }
    return true;
}

defaultproperties
{
    MenuStrings(0)="HOME"
    MenuStrings(1)="PERKS"
    MenuStrings(2)="GEAR"
    MenuStrings(3)="VAULT"
    MenuStrings(4)="INVENTORY"
    MenuStrings(5)="STORE"
    MenuStrings(6)="OPTIONS"
    MenuStrings(7)="EXIT"
    ExitString="EXIT"
    CancelString="CANCEL"
    ServerBrowserString="SERVER BROWSER"
    MatchmakingString="MATCHMAKING"
    SoloString="SOLO"
    OverviewString="MATCH OVERVIEW"
    TitleStrings(0)="Abandoning the fight already?"
    TitleStrings(1)="Leaving so soon?"
    TitleStrings(2)="Tired of getting chewed on?"
    DescriptionStrings(0)="Fine, go on and run for your pathetic life. You wouldn't last five minutes on the Killing Floor."
    DescriptionStrings(1)="Each second you are away, another horde of freaks is born to feast on your friends. Are you just going to abandon them?"
    DescriptionStrings(2)="They're going to find you either way. They'll find you and they'll eat your heart, like a fleshy little snack."
    bAllowBumper=true
}