/*******************************************************************************
 * KFGFxWeeklyObjectivesContainer generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWeeklyObjectivesContainer extends KFGFxObject_Container within GFxMoviePlayer;

var bool bInitialDataPopulated;
var bool bLastWeeklyComplete;
var KFPlayerController KFPC;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC != none)
    {
        LocalizeMenu();
        PopulateData();
    }
}

function bool PopulateData()
{
    local GFxObject DataObject;
    local KFWeeklyOutbreakInformation WeeklyInfo;
    local bool bWeeklyComplete;

    bWeeklyComplete = KFPC.IsWeeklyEventComplete();
    if((bWeeklyComplete != bLastWeeklyComplete) || !bInitialDataPopulated)
    {
        WeeklyInfo = Class'KFMission_LocalizedStrings'.static.GetCurrentWeeklyOutbreakInfo();
        DataObject = Outer.CreateObject("Object");
        if(WeeklyInfo == none)
        {
            return false;
        }
        DataObject.SetString("label", WeeklyInfo.FriendlyName);
        if((WeeklyInfo != none) && WeeklyInfo.ModifierDescriptions.Length > 0)
        {
            DataObject.SetString("description", (WeeklyInfo.DescriptionStrings[0] @ "
") @ WeeklyInfo.DescriptionStrings[1]);
        }
        DataObject.SetString("iconPath", "img://" $ WeeklyInfo.IconPath);
        DataObject.SetBool("complete", bWeeklyComplete);
        DataObject.SetBool("showProgres", false);
        DataObject.SetFloat("progress", 0);
        DataObject.SetString("textValue", "");
        SetObject("weeklyObjectiveData", DataObject);
        PopulateModifiers();
        PopulateRewards();
        bLastWeeklyComplete = bWeeklyComplete;
        bInitialDataPopulated = true;
        return true;
    }
    return false;
}

function PopulateModifiers()
{
    local int I;
    local GFxObject DataObject, DataProvider;
    local KFWeeklyOutbreakInformation WeeklyInfo;

    DataProvider = Outer.CreateArray();
    WeeklyInfo = Class'KFMission_LocalizedStrings'.static.GetCurrentWeeklyOutbreakInfo();
    I = 0;
    J0x5D:

    if(I < WeeklyInfo.ModifierDescriptions.Length)
    {
        DataObject = Outer.CreateObject("Object");
        DataObject.SetString("label", "");
        if((WeeklyInfo != none) && WeeklyInfo.ModifierDescriptions.Length > 0)
        {
            DataObject.SetString("description", WeeklyInfo.ModifierDescriptions[I]);
        }
        DataProvider.SetElementObject(I, DataObject);
        ++ I;
        goto J0x5D;
    }
    SetObject("modifiers", DataProvider);
}

function PopulateRewards()
{
    local int I, ItemCount;
    local GFxObject DataProvider;
    local KFWeeklyOutbreakInformation WeeklyInfo;
    local GFxObject GfxRewardItem;

    ItemCount = 0;
    DataProvider = Outer.CreateArray();
    WeeklyInfo = Class'KFMission_LocalizedStrings'.static.GetCurrentWeeklyOutbreakInfo();
    WeeklyInfo.RewardIDs = Class'KFOnlineStatsWrite'.static.GetWeeklyOutbreakRewards();
    I = 0;
    J0xA7:

    if(I < WeeklyInfo.RewardIDs.Length)
    {
        GfxRewardItem = CreateRewardItem(WeeklyInfo, WeeklyInfo.RewardIDs[I]);
        if(GfxRewardItem != none)
        {
            DataProvider.SetElementObject(ItemCount, GfxRewardItem);
            ++ ItemCount;
        }
        ++ I;
        goto J0xA7;
    }
    SetObject("rewards", DataProvider);
    UpdateDoshVaultRewardValue();
}

function UpdateDoshVaultRewardValue()
{
    SetInt("vaultDoshReward", Class'KFOnlineStatsWrite'.static.GetWeeklyEventReward());
}

function GFxObject CreateRewardItem(KFWeeklyOutbreakInformation WeeklyInfo, int ItemId)
{
    local GFxObject DataObject;
    local int ItemIndex;
    local ItemProperties RewardItem;
    local OnlineSubsystem OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if(OnlineSub == none)
    {
        return none;
    }
    ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', ItemId;
    if(ItemIndex == -1)
    {
        LogInternal("ItemID not found: " @ string(ItemId));
        return none;
    }
    RewardItem = OnlineSub.ItemPropertiesList[ItemIndex];
    DataObject = Outer.CreateObject("Object");
    DataObject.SetString("label", RewardItem.Name);
    DataObject.SetString("iconPath", "img://" $ RewardItem.IconURL);
    return DataObject;
}

function LocalizeMenu()
{
    local GFxObject TextObject;
    local KFWeeklyOutbreakInformation WeeklyInfo;

    WeeklyInfo = Class'KFMission_LocalizedStrings'.static.GetCurrentWeeklyOutbreakInfo();
    TextObject = Outer.CreateObject("Object");
    TextObject.SetString("currentModifier", Class'KFMission_LocalizedStrings'.default.CurrentWeeklySettingsString);
    TextObject.SetString("reward", Class'KFMission_LocalizedStrings'.default.RewardsString);
    TextObject.SetString("granted", Class'KFMission_LocalizedStrings'.default.GrantedWeeklyString);
    TextObject.SetString("weekly", Class'KFMission_LocalizedStrings'.default.WeeklyString);
    TextObject.SetString("overview", Class'KFMission_LocalizedStrings'.default.WeeklyOverview);
    TextObject.SetString("vaultDosh", Class'KFMission_LocalizedStrings'.default.VaultDoshString);
    if((WeeklyInfo != none) && WeeklyInfo.ModifierDescriptions.Length > 0)
    {
        TextObject.SetString("description", WeeklyInfo.ModifierDescriptions[0]);
    }
    SetObject("localizedText", TextObject);
}
