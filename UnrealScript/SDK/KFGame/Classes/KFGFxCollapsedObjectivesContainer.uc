//=============================================================================
// KFGFxCollapsedObjectivesContainer
//=============================================================================
// This will be a ticker to display basic info on quests
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 3/28/2017
//=============================================================================

class KFGFxCollapsedObjectivesContainer extends KFGFxObject_Container;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
    PopulateData();    
}

function PopulateData()
{
	local int ItemIndex,i;
	local GFxObject DataObject;
	local GFxObject DataProvider;
	local class<KFGFxSpecialeventObjectivesContainer> SpecialEventClass;
	local KFPlayerController KFPC; 

	KFPC = KFPlayerController(GetPC());
	DataProvider = CreateArray();
	ItemIndex = 0;

	//get weekly
	if( KFPC.isA('KFPlayerController_WeeklySurvival') ||  class'WorldInfo'.static.IsMenuLevel())
	{
		DataProvider.SetElementObject(ItemIndex, GetWeeklyDataObject());
		ItemIndex++;
	}

	//get special event
	SpecialEventClass = class'KFGfxMenu_StartGame'.static.GetSpecialEventClass(class'KFGameEngine'.static.GetSeasonalEventId());
	if(SpecialEventClass != none && SpecialEventClass != class'KFGFxSpecialeventObjectivesContainer')
	{
		for (i = 0; i < SpecialEventClass.default.SpecialEventObjectiveInfoList.length; i++)
		{
			DataObject = CreateObject("Object");
	        
	        DataObject.SetString("label", SpecialEventClass.default.SpecialEventObjectiveInfoList[i].TitleString);
	        DataObject.SetString("description", SpecialEventClass.default.SpecialEventObjectiveInfoList[i].DescriptionString);
	        
	        DataObject.SetString("iconPath", "img://"$SpecialEventClass.default.ObjectiveIconURLs[i]);

	        DataObject.SetBool("complete", KFPC.IsEventObjectiveComplete(i));
	        DataObject.SetBool("showProgres", false);
	        DataObject.SetFloat("progress", 0);
	        DataObject.SetString("textValue", "");   

	        DataProvider.SetElementObject(ItemIndex, DataObject); //add it to the array
	        ItemIndex++;
		}
	}

	SetObject("objectives", DataProvider);
}

function GFxObject GetWeeklyDataObject()
{
	local GFxObject DataObject;
	local KFWeeklyOutbreakInformation WeeklyInfo;
	local KFPlayerController KFPC;
	KFPC = KFPlayerController(GetPC());
	WeeklyInfo = class'KFMission_LocalizedStrings'.static.GetCurrentWeeklyOutbreakInfo();

	DataObject = CreateObject("Object");
	DataObject.SetString("label", WeeklyInfo.FriendlyName);
	DataObject.SetString("description", WeeklyInfo.DescriptionStrings[0]@"\n"@WeeklyInfo.DescriptionStrings[1]);
	DataObject.SetString("iconPath", "img://"$WeeklyInfo.IconPath);

	DataObject.SetBool("complete", KFPC.IsWeeklyEventComplete());
	DataObject.SetBool("showProgres", false);
	DataObject.SetFloat("progress", 0);
	DataObject.SetString("textValue", "");

	return DataObject;
}