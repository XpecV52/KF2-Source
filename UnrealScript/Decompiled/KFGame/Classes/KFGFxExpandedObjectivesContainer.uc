/*******************************************************************************
 * KFGFxExpandedObjectivesContainer generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxExpandedObjectivesContainer extends KFGFxObject_Container within GFxMoviePlayer;

var KFGFxSpecialEventObjectivesContainer SpecialEventsContainer;
var KFGFxWeeklyObjectivesContainer WeeklyEventContainer;
var KFGFxDailyObjectivesContainer DailyObjectiveContainer;
var KFGFxMenu_StartGame StartMenu;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    StartMenu = KFGFxMenu_StartGame(NewParentMenu);
    LocalizeMenu();
    StartMenu.MissionObjectiveContainer.UpdateSpecialEventActive();
}

function bool Refresh(optional bool bForceRefreshOfDaily)
{
    if((SpecialEventsContainer != none) && WeeklyEventContainer != none)
    {
        return (SpecialEventsContainer.PopulateData() || WeeklyEventContainer.PopulateData()) || DailyObjectiveContainer.PopulateData(bForceRefreshOfDaily);
    }
    return false;
}

function FullRefresh()
{
    if(SpecialEventsContainer != none)
    {
        SpecialEventsContainer.Initialize(StartMenu);
    }
    if(WeeklyEventContainer != none)
    {
        WeeklyEventContainer.Initialize(StartMenu);
    }
    if(DailyObjectiveContainer != none)
    {
        DailyObjectiveContainer.Initialize(StartMenu);
    }
}

function LocalizeMenu()
{
    local GFxObject TextObject;

    TextObject = Outer.CreateObject("Object");
    TextObject.SetString("specialEvent", Class'KFMission_LocalizedStrings'.default.SeasonalString);
    TextObject.SetString("daily", Class'KFMission_LocalizedStrings'.default.DailyObjectiveString);
    TextObject.SetString("weekly", Class'KFMission_LocalizedStrings'.default.ShortWeeklyString);
    SetObject("localizedText", TextObject);
}
