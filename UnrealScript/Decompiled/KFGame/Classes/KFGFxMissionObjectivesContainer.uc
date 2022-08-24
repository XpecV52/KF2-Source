/*******************************************************************************
 * KFGFxMissionObjectivesContainer generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxMissionObjectivesContainer extends KFGFxObject_Container within GFxMoviePlayer;

var KFGFxCollapsedObjectivesContainer CollapsedObjectiveContainer;
var KFGFxExpandedObjectivesContainer ExpandedObjectiveContainer;
var bool bInitialAutoExpandCheckComplete;
var bool bLastShowSpecialEvent;
var bool bLastShowWeekly;
var KFPlayerController KFPC;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    KFPC = KFPlayerController(Outer.GetPC());
    KFPC.SetTimer(0.25, true, 'UpdateMissionObjectiveState', self);
}

function UpdateMissionObjectiveState()
{
    local bool bShouldShow, bShouldExpand;
    local int TargetPage;
    local bool bShowWeekly, bShowSpecialEvent;

    bShouldExpand = false;
    TargetPage = 0;
    bShouldShow = true;
    bShowWeekly = ((KFPC != none) && KFPC.IsA('KFPlayerController_WeeklySurvival')) || Class'WorldInfo'.static.IsMenuLevel();
    bShowSpecialEvent = ShowShouldSpecialEvent();
    if(!bInitialAutoExpandCheckComplete || bShowWeekly != bLastShowWeekly)
    {
        if(bShowWeekly)
        {
            bShouldExpand = true;
            TargetPage = 1;
            SetBool("expanded", true);            
        }
        else
        {
            UpdateWeeklyUIActive(false);
        }
        bLastShowWeekly = bShowWeekly;
    }
    if((bShowSpecialEvent != bLastShowSpecialEvent) || !bInitialAutoExpandCheckComplete)
    {
        if(bShowSpecialEvent)
        {
            bShouldExpand = true;
            TargetPage = 2;
        }
        bLastShowSpecialEvent = bShowSpecialEvent;
        UpdateSpecialEventActive();
    }
    if(Class'WorldInfo'.static.IsMenuLevel())
    {
        bShouldExpand = false;
        TargetPage = 0;
    }
    if(!bInitialAutoExpandCheckComplete)
    {
        ExpandedObjectiveContainer.SetInt("pageIndex", TargetPage);
        SetVisible(bShouldShow);
        SetBool("expanded", bShouldExpand);
        SetString("buttonPromptString", Class'KFMission_LocalizedStrings'.default.ObjectivesString);
    }
    bInitialAutoExpandCheckComplete = true;
    Refresh();
}

function UpdateWeeklyUIActive(bool bShow)
{
    SetBool("weeklyEventActive", bShow);
}

function UpdateSpecialEventActive()
{
    SetBool("seasonalEventActive", ShowShouldSpecialEvent());
}

function bool ShowShouldSpecialEvent()
{
    return ((Class'KFGameEngine'.static.GetSeasonalEventID() != 0) && Class'KFGameEngine'.static.GetSeasonalEventID() != -1) && KFPC.IsValidSpecialEventMap() || Class'WorldInfo'.static.IsMenuLevel();
}

function Refresh(optional bool bForceRefreshOfDaily)
{
    if(KFPC.MyGFxManager.bMenusOpen)
    {
        if(ExpandedObjectiveContainer.Refresh(bForceRefreshOfDaily))
        {
            CollapsedObjectiveContainer.PopulateData();
        }
    }
}
