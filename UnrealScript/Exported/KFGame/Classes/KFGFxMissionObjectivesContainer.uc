//=============================================================================
// KFGFxMissionObjectivesContainer
//=============================================================================
// This container has the collapsed and expanded holders for the objectives.
// The expanded will contain the weekly and special event containers. 
// instead of using a subwidget bind, we are going to use get child here.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 3/28/2017
//=============================================================================

class KFGFxMissionObjectivesContainer extends KFGFxObject_Container;

var KFGFxCollapsedObjectivesContainer CollapsedObjectiveContainer;

var KFGFxExpandedObjectivesContainer ExpandedObjectiveContainer;

var bool bInitialAutoExpandCheckComplete;
var bool bLastShowSpecialEvent;
var bool bLastShowWeekly;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
    
    //expanded on delay to ensure all widget are initialized
    GetPC().SetTimer( 0.25f, true, nameof(UpdateMissionObjectiveState), self );
}

function UpdateMissionObjectiveState()
{
    local KFPlayerController KFPC;
    local bool bShouldShow;
    local bool bShouldExpand;
    local int TargetPage;
    local bool bShowWeekly;
    local bool bShowSpecialEvent;

    KFPC = KFPlayerController(GetPC());

    bShouldExpand = false;
    TargetPage = INDEX_NONE;
    bShouldShow = false;

    bShowWeekly = KFPC != none && KFPC.isA('KFPlayerController_WeeklySurvival') || class'WorldInfo'.static.IsMenuLevel();
    bShowSpecialEvent = ShowShouldSpecialEvent();

    if(!bInitialAutoExpandCheckComplete || bShowWeekly != bLastShowWeekly)
    {
        if(bShowWeekly)
        {
            //auto expand to weekly1
            bShouldExpand = true;
            TargetPage = 0;
            bShouldShow = true;

            SetBool("expanded", true);
            ExpandedObjectiveContainer.SetInt("pageIndex", 0);

        }
        else //shows by default. 
        {
            UpdateWeeklyUIActive(false);
        }    
        bLastShowWeekly = bShowWeekly;
    }

    if(bShowSpecialEvent != bLastShowSpecialEvent || !bInitialAutoExpandCheckComplete )//on seasonal map and seasonal active
    {
        if(bShowSpecialEvent)
        {
            bShouldExpand = true;
            TargetPage = 1;
            bShouldShow = true;   
            ExpandedObjectiveContainer.SetInt("pageIndex", TargetPage);   
        }
        
        bLastShowSpecialEvent = bShowSpecialEvent;
        UpdateSpecialEventActive();
    }

    if(class'WorldInfo'.static.IsMenuLevel()) //main menu
    {
        bShouldShow = true;
        bShouldExpand = false;
    }
    
    if(!bInitialAutoExpandCheckComplete)
    {
        SetVisible(bShouldShow);
        SetBool("expanded", bShouldExpand);
        SetString("buttonPromptString", class'KFMission_LocalizedStrings'.default.ObjectivesString);
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
    setbool("seasonalEventActive" , ShowShouldSpecialEvent());
}

function bool ShowShouldSpecialEvent()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(GetPC());

    return class'KFGameEngine'.static.GetSeasonalEventId() != SEI_None 
            && class'KFGameEngine'.static.GetSeasonalEventId() != INDEX_NONE
            && ( KFPC.IsValidSpecialEventMap() || class'WorldInfo'.static.IsMenuLevel() );
}

function Refresh(optional bool bRepopulateCollapsed)
{
    if(ExpandedObjectiveContainer.Refresh())
    {
        CollapsedObjectiveContainer.PopulateData();
    }
}

/*function LocalizeMenu()
{
    local GFxObject TextObject;
    TextObject = CreateObject("Object");
    // Localize static text
    TextObject.SetString("home",StartMenu.FindGameString);  
    TextObject.SetString("multiplayer",MultiplayerString);  
    TextObject.SetString("serverBrowser",StartMenu.ServerBrowserString);    
    TextObject.SetString("solo",SoloString);    
    TextObject.SetString("tutorial",TutorialString);
    SetObject("localizedText", TextObject);
}*/

defaultproperties
{
   Name="Default__KFGFxMissionObjectivesContainer"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
