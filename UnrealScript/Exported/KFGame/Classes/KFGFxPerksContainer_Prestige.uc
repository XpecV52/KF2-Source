//=============================================================================
// KFGFxPerksContainer_Prestige
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//  - Zane Gholson 3/7/2018
//=============================================================================

class KFGFxPerksContainer_Prestige extends KFGFxPerksContainer;


var localized string CurrentRankString;
var localized string NextRankString;
var localized string RewardString;
var localized string PrestigeDescriptionString;
var localized string PrestigeWarningString1;
var localized string PrestigeWarningString2;
var localized string PrestigeWarningString3;
var localized string AtMaxPrestigeLevelString;
var localized string NotHightenoughLevelString;

var GFxObject ConfirmPrestigeButton;

var KFPlayerController KFPC;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
	super.Initialize(NewParentMenu);

	KFPC = KFPlayerController(GetPC());

	LocalizeText();
	ConfirmPrestigeButton = GetObject("confirmButton");
	SendPerkData();
}

function LocalizeText()
{
	local GFxObject LocalizedObject;

	LocalizedObject = CreateObject("Object");

	LocalizedObject.SetString("prestige", class'KFGFxMenu_Perks'.default.PrestigeString);
	LocalizedObject.SetString("currentRank", CurrentRankString);
	LocalizedObject.SetString("nextRank", NextRankString);
	LocalizedObject.SetString("rewards", RewardString);
	LocalizedObject.SetString("description", PrestigeDescriptionString);
	LocalizedObject.SetString("cancel", class'KFCommon_LocalizedStrings'.default.CancelString);
	LocalizedObject.SetString("confirm", class'KFCommon_LocalizedStrings'.default.ConfirmString);
	LocalizedObject.SetString("warning1", PrestigeWarningString1);
	LocalizedObject.SetString("warning2", PrestigeWarningString2);
	LocalizedObject.SetString("warning3", PrestigeWarningString3);
	LocalizedObject.SetString("atMaxRank", AtMaxPrestigeLevelString);

	SetObject("localizedText", LocalizedObject);
}


function SendPerkData()
{
	local KFPerk CurrentPerk;

	local GFxObject DataObject, CurrentPerkDataObject, NextPerkDataObject;
	local byte CurrentPrestigeLevel;

	CurrentPerk = KFPC.CurrentPerk;
	CurrentPrestigeLevel = KFPC.GetPerkPrestigeLevelFromPerkList(CurrentPerk.Class);

	DataObject = CreateObject("Object");
	CurrentPerkDataObject = CreateObject("Object");
	NextPerkDataObject = CreateObject("Object");
	
	//current perk
	CurrentPerkDataObject.SetString("perkIcon", "img://"$CurrentPerk.GetPerkIconPath());
	CurrentPerkDataObject.SetString("prestigeIcon", CurrentPerk.GetPrestigeIconPath(CurrentPrestigeLevel));
	DataObject.SetObject("currentRank", CurrentPerkDataObject);

	ConfirmPrestigeButton.SetBool("enabled", CurrentPrestigeLevel < 1);

	//next rank
	if (CurrentPrestigeLevel < 1)
	{
		NextPerkDataObject.SetString("perkIcon", "img://"$CurrentPerk.GetPerkIconPath());
		NextPerkDataObject.SetString("prestigeIcon", CurrentPerk.GetPrestigeIconPath(CurrentPrestigeLevel + 1));
		DataObject.SetObject("nextRank", NextPerkDataObject);

		//reward for prestige
		DataObject.SetString("rewardIcon", "img://"$CurrentPerk.default.PrestigeRewardItemIconPaths[CurrentPrestigeLevel]);
		
	}		

	DataObject.SetInt("doshVaultValue", KFPC.GetPreStigeValueDoshRewardValue());

	DataObject.SetBool("bAtPrestigeMaxLevel", CurrentPrestigeLevel >= 1);
	
	SetObject("perkData", DataObject);
}

defaultproperties
{
   CurrentRankString="CURRENT RANK"
   NextRankString="NEXT RANK"
   RewardString="PRESTIGE REWARDS"
   PrestigeDescriptionString="> Perk level will reset to 0. \n> Permanent +30% XP bonus modifier applied at end of game matches for this Perk. \n> Earn modified Perk icon, Vault Dosh, and a unique weapon skin for this Perk."
   PrestigeWarningString1="ACTION WILL RESET THIS PERK TO 0"
   PrestigeWarningString2="ONLY CONTINUE IF YOU ARE POSITIVELY SURE"
   PrestigeWarningString3="ONCE IT'S DONE, IT'S DONE"
   AtMaxPrestigeLevelString="Max perk prestige level achieved!"
   NotHightenoughLevelString="Perk not at max level.  User cannot prestige at this time."
   Name="Default__KFGFxPerksContainer_Prestige"
   ObjectArchetype=KFGFxPerksContainer'KFGame.Default__KFGFxPerksContainer'
}
