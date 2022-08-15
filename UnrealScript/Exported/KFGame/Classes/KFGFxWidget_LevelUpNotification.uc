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

function InitializeHUD()
{
	SetLocalizedText();
}

function SetLocalizedText()
{
	local GFxObject tempObj;
	tempObj = CreateObject("Object");
	tempObj.SetString("levelUpString", LevelUpString);
	tempObj.SetString("tierUnlockedString", TierUnlockedString);
	SetObject("localizeText", tempObj);
}

function ShowLevelUpNotification(Class<KFPerk> PerkClass, byte PerkLevel, bool bTierUnlocked)
{
	SendLevelUpNotificationToAS3(PerkClass.default.PerkName, PerkLevel,  "img://"$PerkClass.static.GetPerkIconPath(), bTierUnlocked);
}

function SendLevelUpNotificationToAS3(string PerkName, int PerkLevel, string iconPath, bool TierUnlocked)
{
	ActionScriptVoid("showLevelUp");
}

defaultproperties
{
   LevelUpString="LEVEL UP"
   TierUnlockedString="NEW SKILLS UNLOCKED"
   Name="Default__KFGFxWidget_LevelUpNotification"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
