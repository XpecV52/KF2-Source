//=============================================================================
// KFGFxSpecialEventObjectivesContainer
//=============================================================================
// This will be the parent container for the weekly and special event container
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 3/31/2017
//=============================================================================

class KFGFxSpecialEventObjectivesContainer extends KFGFxObject_Container;

var localized string CurrentSpecialEventString;
var localized string CurrentSpecialEventDescriptionString;

struct SSpecialEventObjectiveInfo
{
    var localized string TitleString;
    var localized string DescriptionString;
	var localized string TierEventRewardName;
};

var localized array<SSpecialEventObjectiveInfo> SpecialEventObjectiveInfoList;
var array<string>ObjectiveIconURLs;

var string AllCompleteRewardIconURL;
var localized string AllCompleteRewardDescriptionString;  

var array<string>ChanceDropIconURLs;
var localized array<string> ChanceDropDescriptionStrings;  

var string IconURL;

var array<ObjectiveProgress> ObjectiveStatusList;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
    
    LocalizeMenu(); 
    PopulateData();
    PopulateReward();
    PopulateChanceDrops();
}

function LocalizeMenu()
{
    local GFxObject TextObject;
    TextObject = CreateObject("Object");
    // Localize static text
    TextObject.SetString("title",			default.CurrentSpecialEventString);  
    TextObject.SetString("reward",			class'KFMission_LocalizedStrings'.default.RewardsString);    
    TextObject.SetString("granted", 		class'KFMission_LocalizedStrings'.default.GrantedSpecialEventString);  
    TextObject.SetString("chanceOfDrop",	class'KFMission_LocalizedStrings'.default.SpecialEventChanceDropString);  
    SetObject("localizedText", TextObject);
}


function bool PopulateData()
{
    local GFxObject DataObject;
    local GFxObject DataProvider; //array containing the data objects 
    local int i;

    if(HasObjectiveStatusChanged())
    {
        DataProvider = CreateArray();

        for (i = 0; i < SpecialEventObjectiveInfoList.length; i++)
        {
            DataObject = CreateObject("Object");
            
            DataObject.SetString("label", default.SpecialEventObjectiveInfoList[i].TitleString);
            DataObject.SetString("description", default.SpecialEventObjectiveInfoList[i].DescriptionString);
            DataObject.SetString("iconPath", "img://"$default.ObjectiveIconURLs[i]);
            DataObject.SetBool("complete", ObjectiveStatusList[i].bComplete);
			DataObject.SetInt("rewardValue", ObjectiveStatusList[i].NumericValue);
            DataObject.SetBool("showProgres", false);
            DataObject.SetFloat("progress", 0);
            DataObject.SetString("textValue", "");   

            DataProvider.SetElementObject(i, DataObject); //add it to the array
        }

        if(default.IconURL != "")
        {
            DataProvider.SetString("iconPath", "img://"$default.IconURL);
        }    
        
        SetObject("objectives", DataProvider);

        return true;
    }

    return false;
}

function bool HasObjectiveStatusChanged()
{
    local int i;
    local bool bHasChanged;
    local bool bTempStatus;
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetPC());

    if(SpecialEventObjectiveInfoList.length != ObjectiveStatusList.length)
    {
        ObjectiveStatusList.length = SpecialEventObjectiveInfoList.length;
        for (i = 0; i < SpecialEventObjectiveInfoList.length; i++)
        {
            ObjectiveStatusList[i].bComplete = KFPC.IsEventObjectiveComplete(i);
			ObjectiveStatusList[i].NumericValue = KFPC.GetSpecialEventRewardValue();
        }
        bHasChanged = true;
    }
    else
    {
        for (i = 0; i < SpecialEventObjectiveInfoList.length; i++)
        {
            bTempStatus = KFPC.IsEventObjectiveComplete(i);

            if(ObjectiveStatusList[i].bComplete != bTempStatus || ObjectiveStatusList[i].numericValue != KFPC.GetSpecialEventRewardValue())
            {
                bHasChanged = true;
                ObjectiveStatusList[i].bComplete = bTempStatus;
				ObjectiveStatusList[i].numericValue = KFPC.GetSpecialEventRewardValue();
            }
        }
    }

    return bHasChanged;
}

function PopulateReward()
{
    local GFxObject DataObject;
    
    DataObject = CreateObject("Object");
    DataObject.SetString("label", default.AllCompleteRewardDescriptionString);
    DataObject.SetString("iconPath", "img://"$default.AllCompleteRewardIconURL); //add reward icon here  

    SetObject("allCompleteReward", DataObject); //pass to SWF
}

function PopulateChanceDrops()
{
    local int i;
    local GFxObject DataObject;
    local GFxObject DataProvider; //array containing the data objects 

    DataProvider = CreateArray();
        
    for (i = 0; i <  ChanceDropDescriptionStrings.length; i++)
    {
        DataObject = CreateObject("Object");
        DataObject.SetString("label", ChanceDropDescriptionStrings[i]);
        DataObject.SetString("iconPath", "img://"$ChanceDropIconURLs[i]); //add reward icon here  

        DataProvider.SetElementObject(i, DataObject); //add it to the array
    }

    SetObject("chanceDrops", DataProvider); //pass to SWF
}

DefaultProperties
{
    ObjectiveIconURLs[0]="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    ObjectiveIconURLs[1]="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    ObjectiveIconURLs[2]="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    ObjectiveIconURLs[3]="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    ObjectiveIconURLs[4]="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    //defaults
    AllCompleteRewardIconURL="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    ChanceDropIconURLs[0]="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    ChanceDropIconURLs[1]="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
}