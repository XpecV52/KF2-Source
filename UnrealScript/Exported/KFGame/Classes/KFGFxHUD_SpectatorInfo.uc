//=============================================================================
// KFGFxHUD_SpectatorInfo
//=============================================================================
// HUD container that stores information about the viewTarget's pawn while in
// spectator mode 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Alex Quick 5/15/2014
//=============================================================================

class KFGFxHUD_SpectatorInfo extends GFxObject;

var localized string PrevPlayerString;
var localized string NextPlayerString;
var localized string ChangeCameraString;

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
	TempObject = CreateObject("Object");

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

function SetSpectatedKFPRI( KFPlayerReplicationInfo TempKFPRI )
{
    SpectatedKFPRI = TempKFPRI;
    UpdateSpectateeInfo(true);
}

function UpdateSpectateeInfo(optional bool bForceUpdate)
{
    local byte CurrentPerkLevel;
    if( SpectatedKFPRI == none || SpectatedKFPRI == GetPC().PlayerReplicationInfo || GetPC().PlayerCamera.CameraStyle == 'Boss' || SpectatedKFPRI.CurrentPerkClass == none)
    {
        SetVisible(false);  
        return;
    }
    else
    {
        SetVisible(true);
    }

    CurrentPerkLevel = SpectatedKFPRI.GetActivePerkLevel();

    // Update the perk class.
    if( ( LastPerkClass != SpectatedKFPRI.CurrentPerkClass ) || ( LastPerkLevel != CurrentPerkLevel ) || bForceUpdate )
	{
        LastPerkLevel = CurrentPerkLevel;
        LastPerkClass = SpectatedKFPRI.CurrentPerkClass;
        UpdatePlayerInfo();
	}
}

function UpdatePlayerInfo()
{
	local GFxObject TempObject;

	TempObject = CreateObject("Object");
    if( TempObject != none )
    {
        TempObject.SetString("playerName", SpectatedKFPRI.PlayerName);
        TempObject.SetString("playerPerk", SpectatedKFPRI.CurrentPerkClass.default.LevelString @SpectatedKFPRI.GetActivePerkLevel() @SpectatedKFPRI.CurrentPerkClass.default.PerkName );
        TempObject.SetString("iconPath", "img://" $SpectatedKFPRI.CurrentPerkClass.static.GetPerkIconPath());
        SetObject("playerData", TempObject);
    }
}

defaultproperties
{
   PrevPlayerString="NEXT PLAYER"
   NextPlayerString="PREV PLAYER"
   ChangeCameraString="CHANGE CAMERA"
   LastPerkLevel=255
   Name="Default__KFGFxHUD_SpectatorInfo"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
