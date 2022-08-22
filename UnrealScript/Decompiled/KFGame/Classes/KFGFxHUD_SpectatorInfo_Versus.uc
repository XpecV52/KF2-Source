/*******************************************************************************
 * KFGFxHUD_SpectatorInfo_Versus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxHUD_SpectatorInfo_Versus extends KFGFxHUD_SpectatorInfo within GFxMoviePlayer;

function UpdateSpectateeInfo(optional bool bForceUpdate)
{
    local byte CurrentPerkLevel;

    if(((SpectatedKFPRI == none) || SpectatedKFPRI == Outer.GetPC().PlayerReplicationInfo) || Outer.GetPC().PlayerCamera.CameraStyle == 'Boss')
    {
        SetVisible(false);
        return;
    }
    if(SpectatedKFPRI.GetTeamNum() != 255)
    {
        CurrentPerkLevel = SpectatedKFPRI.GetActivePerkLevel();
        if(((LastPerkClass != SpectatedKFPRI.CurrentPerkClass) || LastPerkLevel != CurrentPerkLevel) || bForceUpdate)
        {
            LastPerkLevel = CurrentPerkLevel;
            LastPerkClass = SpectatedKFPRI.CurrentPerkClass;
        }        
    }
    else
    {
        LastPerkLevel = 255;
        LastPerkClass = none;
    }
    UpdatePlayerInfo();
}

function UpdatePlayerInfo()
{
    local GFxObject TempObject;

    TempObject = Outer.CreateObject("Object");
    TempObject.SetString("playerName", SpectatedKFPRI.PlayerName);
    if(SpectatedKFPRI.GetTeamNum() == 255)
    {
        TempObject.SetString("playerPerk", Class'KFCommon_LocalizedStrings'.default.ZedString);
        TempObject.SetString("iconPath", "img://" $ PathName(Class'KFGFxWidget_PartyInGame_Versus'.default.ZedIConTexture));        
    }
    else
    {
        TempObject.SetString("playerPerk", (SpectatedKFPRI.CurrentPerkClass.default.LevelString @ string(SpectatedKFPRI.GetActivePerkLevel())) @ SpectatedKFPRI.CurrentPerkClass.default.PerkName);
        TempObject.SetString("iconPath", "img://" $ SpectatedKFPRI.CurrentPerkClass.static.GetPerkIconPath());
    }
    SetObject("playerData", TempObject);
}
