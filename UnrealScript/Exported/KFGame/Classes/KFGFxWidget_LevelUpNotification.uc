//=============================================================================
// KFGFxWidget_LevelUpNotification
//=============================================================================
// HUD Widget that displays when a user levels up
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 09/10/2014
//=============================================================================

class KFGFxWidget_LevelUpNotification extends GFxObject;

var localized string LevelUpString;
var localized string TierUnlockedString;
var localized string ObjectiveCompleteString;

function InitializeHUD()
{
	
}

function SetLocalizedText()
{
	local GFxObject tempObj;
	tempObj = CreateObject("Object");
	tempObj.SetString("levelUpString", LevelUpString);
	tempObj.SetString("tierUnlockedString", TierUnlockedString);
	SetObject("localizeText", tempObj);
}

//Called from KFPlayerController::ClientFinishedSpecialEvent
function FinishedSpecialEvent(int EventIndex, int ObjectiveIndex)
{
	local class<KFGFxSpecialeventObjectivesContainer> SpecialEventClass;

	//get the correctObjectives container
	SpecialEventClass = class'KFGFxMenu_StartGame'.static.GetSpecialEventClass(EventIndex);
	//get the objective info
	ShowObjectiveCompleteNotification(SpecialEventClass.default.SpecialEventObjectiveInfoList[ObjectiveIndex].TitleString, SpecialEventClass.default.SpecialEventObjectiveInfoList[ObjectiveIndex].DescriptionString, "img://"$SpecialEventClass.default.ObjectiveIconURLs[ObjectiveIndex]);
}

function ShowLevelUpNotification(Class<KFPerk> PerkClass, byte PerkLevel, bool bTierUnlocked)
{
	ShowAchievementNotification(LevelUpString, PerkClass.default.PerkName, TierUnlockedString, "img://"$PerkClass.static.GetPerkIconPath(), bTierUnlocked, PerkLevel);
}


function ShowObjectiveCompleteNotification(string ObjectiveName, string ObjectiveDescription, string ImagePath)
{
	ShowAchievementNotification(ObjectiveCompleteString, ObjectiveName, " ", ImagePath, true, INDEX_NONE);
}

function ShowAchievementNotification(string TitleString, string MainString, string SecondaryString, string ImagePath, bool bShowSecondary, optional int NumericValue = -1)
{
	local GFxObject tempObj;

	tempObj = CreateObject("Object");

	tempObj.SetString("titleString", TitleString);
	tempObj.SetString("mainString", MainString);
	tempObj.SetString("secondaryString", SecondaryString);
	tempObj.SetInt("newValue", NumericValue);
	tempObj.SetString("iconPath", ImagePath);
	tempObj.Setbool("bShowSecondary", bShowSecondary);

	SetObject("showAchievementPopUp", tempObj);
}

defaultproperties
{
   LevelUpString="LEVEL UP"
   TierUnlockedString="NEW SKILLS UNLOCKED"
   ObjectiveCompleteString="OBJECTIVE COMPLETE"
   Name="Default__KFGFxWidget_LevelUpNotification"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
