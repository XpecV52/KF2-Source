/*******************************************************************************
 * KFGFxMoviePlayer_Manager_Versus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxMoviePlayer_Manager_Versus extends KFGFxMoviePlayer_Manager
    config(UI);

function ClientRecieveNewTeam()
{
    if(bMenusOpen)
    {
        if((CurrentMenu != none) && CurrentMenu == GearMenu)
        {
            OpenMenu(0);
        }
        UpdateMenuBar();
    }
}

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    switch(WidgetName)
    {
        case 'MenuBarWidget':
            if(MenuBarWidget == none)
            {
                MenuBarWidget = KFGFxWidget_MenuBarVersus(Widget);
                MenuBarWidget.InitializeMenu(self);
                MenuBarWidget.InitializeCurrentMenu(0);
            }
            break;
        case 'PartyWidget':
            if(PartyWidget == none)
            {
                PartyWidget = KFGFxWidget_PartyInGame_Versus(Widget);
                if(GetPC().WorldInfo.GRI != none)
                {
                    PartyWidget.StartCountdown(KFGameReplicationInfo(GetPC().WorldInfo.GRI).RemainingTime, false);
                }
                PartyWidget.Manager = self;
                PartyWidget.InitializeWidget();
            }
            break;
        default:
            break;
    }
    return super.WidgetInitialized(WidgetName, WidgetPath, Widget);
}

defaultproperties
{
    InGamePartyWidgetClass=Class'KFGFxWidget_PartyInGame_Versus'
    WidgetPaths(0)="../UI_Widgets/MenuBarWidget_SWF.swf"
    WidgetPaths(1)="../UI_Widgets/ButtonPromptWidget_SWF.swf"
    WidgetPaths(2)="../UI_Widgets/VersusLobbyWidget_SWF.swf"
    WidgetBindings=/* Array type was not detected. */
}