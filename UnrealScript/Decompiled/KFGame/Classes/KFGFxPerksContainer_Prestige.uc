/*******************************************************************************
 * KFGFxPerksContainer_Prestige generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxPerksContainer_Prestige extends KFGFxPerksContainer within GFxMoviePlayer;

var const localized string CurrentRankString;
var const localized string NextRankString;
var const localized string RewardString;
var const localized string PrestigeDescriptionString;
var const localized string PrestigeWarningString1;
var const localized string PrestigeWarningString2;
var const localized string PrestigeWarningString3;
var const localized string AtMaxPrestigeLevelString;
var const localized string NotHightenoughLevelString;
var GFxObject ConfirmPrestigeButton;
var KFPlayerController KFPC;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super(KFGFxObject_Container).Initialize(NewParentMenu);
    KFPC = KFPlayerController(Outer.GetPC());
    LocalizeText();
    ConfirmPrestigeButton = GetObject("confirmButton");
    SendPerkData();
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("prestige", Class'KFGFxMenu_Perks'.default.PrestigeString);
    LocalizedObject.SetString("currentRank", CurrentRankString);
    LocalizedObject.SetString("nextRank", NextRankString);
    LocalizedObject.SetString("rewards", RewardString);
    LocalizedObject.SetString("description", PrestigeDescriptionString);
    LocalizedObject.SetString("cancel", Class'KFCommon_LocalizedStrings'.default.CancelString);
    LocalizedObject.SetString("confirm", Class'KFCommon_LocalizedStrings'.default.ConfirmString);
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
    DataObject = Outer.CreateObject("Object");
    CurrentPerkDataObject = Outer.CreateObject("Object");
    NextPerkDataObject = Outer.CreateObject("Object");
    CurrentPerkDataObject.SetString("perkIcon", "img://" $ CurrentPerk.GetPerkIconPath());
    CurrentPerkDataObject.SetString("prestigeIcon", CurrentPerk.GetPrestigeIconPath(CurrentPrestigeLevel));
    DataObject.SetObject("currentRank", CurrentPerkDataObject);
    ConfirmPrestigeButton.SetBool("enabled", CurrentPrestigeLevel < 1);
    if(CurrentPrestigeLevel < 1)
    {
        NextPerkDataObject.SetString("perkIcon", "img://" $ CurrentPerk.GetPerkIconPath());
        NextPerkDataObject.SetString("prestigeIcon", CurrentPerk.GetPrestigeIconPath(byte(CurrentPrestigeLevel + 1)));
        DataObject.SetObject("nextRank", NextPerkDataObject);
        DataObject.SetString("rewardIcon", "img://" $ CurrentPerk.default.PrestigeRewardItemIconPaths[CurrentPrestigeLevel]);
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
    PrestigeDescriptionString="> Perk level will reset to 0. 
> Permanent +30% XP bonus modifier applied at end of game matches for this Perk. 
> Earn modified Perk icon, Vault Dosh, and a unique weapon skin for this Perk."
    PrestigeWarningString1="ACTION WILL RESET THIS PERK TO 0"
    PrestigeWarningString2="ONLY CONTINUE IF YOU ARE POSITIVELY SURE"
    PrestigeWarningString3="ONCE IT'S DONE, IT'S DONE"
    AtMaxPrestigeLevelString="Max perk prestige level achieved!"
    NotHightenoughLevelString="Perk not at max level.  User cannot prestige at this time."
}