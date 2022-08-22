/*******************************************************************************
 * KFGFxHUD_SpectatorInfo generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxHUD_SpectatorInfo extends GFxObject within GFxMoviePlayer;

var const localized string PrevPlayerString;
var const localized string NextPlayerString;
var const localized string ChangeCameraString;
var KFPlayerReplicationInfo SpectatedKFPRI;
var byte LastPerkLevel;
var class<KFPerk> LastPerkClass;

function InitializeHUD()
{
    LocalizeText();
}

function LocalizeText()
{
    local GFxObject TempObject;

    TempObject = Outer.CreateObject("Object");
    TempObject.SetString("prevPlayer", PrevPlayerString);
    TempObject.SetString("nextPlayer", NextPlayerString);
    TempObject.SetString("changeCamera", ChangeCameraString);
    SetObject("localizedText", TempObject);
}

function TickHud(float DeltaTime)
{
    UpdateSpectateeInfo();
}

function UpdateUsingGamepad(bool bIsUsingGamepad)
{
    SetBool("bUsingGamePad", bIsUsingGamepad);
}

function SetSpectatedKFPRI(KFPlayerReplicationInfo TempKFPRI)
{
    SpectatedKFPRI = TempKFPRI;
    UpdateSpectateeInfo(true);
}

function UpdateSpectateeInfo(optional bool bForceUpdate)
{
    local byte CurrentPerkLevel;

    if((((SpectatedKFPRI == none) || SpectatedKFPRI == Outer.GetPC().PlayerReplicationInfo) || Outer.GetPC().PlayerCamera.CameraStyle == 'Boss') || SpectatedKFPRI.CurrentPerkClass == none)
    {
        SetVisible(false);
        return;        
    }
    else
    {
        SetVisible(true);
    }
    CurrentPerkLevel = SpectatedKFPRI.GetActivePerkLevel();
    if(((LastPerkClass != SpectatedKFPRI.CurrentPerkClass) || LastPerkLevel != CurrentPerkLevel) || bForceUpdate)
    {
        LastPerkLevel = CurrentPerkLevel;
        LastPerkClass = SpectatedKFPRI.CurrentPerkClass;
        UpdatePlayerInfo();
    }
}

function UpdatePlayerInfo()
{
    local GFxObject TempObject;

    TempObject = Outer.CreateObject("Object");
    if(TempObject != none)
    {
        TempObject.SetString("playerName", SpectatedKFPRI.PlayerName);
        TempObject.SetString("playerPerk", (SpectatedKFPRI.CurrentPerkClass.default.LevelString @ string(SpectatedKFPRI.GetActivePerkLevel())) @ SpectatedKFPRI.CurrentPerkClass.default.PerkName);
        TempObject.SetString("iconPath", "img://" $ SpectatedKFPRI.CurrentPerkClass.static.GetPerkIconPath());
        SetObject("playerData", TempObject);
    }
}

defaultproperties
{
    PrevPlayerString="NEXT PLAYER"
    NextPlayerString="PREV PLAYER"
    ChangeCameraString="CHANGE CAMERA"
    LastPerkLevel=255
}