/*******************************************************************************
 * KFGFxWidget_MenuBarVersus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWidget_MenuBarVersus extends KFGFxWidget_MenuBar within GFxMoviePlayer;

function bool CanUseGearButton()
{
    if((((Outer.GetPC().Pawn != none) && !Manager.bAfterLobby) && Outer.GetPC().PlayerReplicationInfo.GetTeamNum() != 255) || Class'WorldInfo'.static.IsMenuLevel())
    {
        return true;
    }
    return false;
}
