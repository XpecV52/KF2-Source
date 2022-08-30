/*******************************************************************************
 * KFGFxSpecialEventObjectivesContainer generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxSpecialEventObjectivesContainer extends KFGFxObject_Container within GFxMoviePlayer;

struct SSpecialEventObjectiveInfo
{
    var const localized string TitleString;
    var const localized string DescriptionString;
    var const localized string TierEventRewardName;

    structdefaultproperties
    {
        TitleString=""
        DescriptionString=""
        TierEventRewardName=""
    }
};

var const localized string CurrentSpecialEventString;
var const localized string CurrentSpecialEventDescriptionString;
var const localized array<localized SSpecialEventObjectiveInfo> SpecialEventObjectiveInfoList;
var array<string> ObjectiveIconURLs;
var string AllCompleteRewardIconURL;
var const localized string AllCompleteRewardDescriptionString;
var array<string> ChanceDropIconURLs;
var const localized array<localized string> ChanceDropDescriptionStrings;
var string IconURL;
var array<ObjectiveProgress> ObjectiveStatusList;
var array<bool> UsesProgressList;
var array<int> ObjectLastValue;
var KFPlayerController KFPC;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    KFPC = KFPlayerController(Outer.GetPC());
    LocalizeMenu();
    PopulateData();
    PopulateReward();
    PopulateChanceDrops();
}

function LocalizeMenu()
{
    local GFxObject TextObject;

    TextObject = Outer.CreateObject("Object");
    TextObject.SetString("title", default.CurrentSpecialEventString);
    TextObject.SetString("reward", Class'KFMission_LocalizedStrings'.default.RewardsString);
    TextObject.SetString("granted", Class'KFMission_LocalizedStrings'.default.GrantedSpecialEventString);
    TextObject.SetString("chanceOfDrop", Class'KFMission_LocalizedStrings'.default.SpecialEventChanceDropString);
    SetObject("localizedText", TextObject);
}

function bool PopulateData()
{
    local GFxObject DataObject, DataProvider;
    local int I, CurrentProgressValue, MaxProgressValue;
    local float ProgressCompletePercentage;

    if(HasObjectiveStatusChanged())
    {
        DataProvider = Outer.CreateArray();
        I = 0;
        J0x41:

        if(I < SpecialEventObjectiveInfoList.Length)
        {
            DataObject = Outer.CreateObject("Object");
            if(DataObject != none)
            {
                DataObject.SetString("label", default.SpecialEventObjectiveInfoList[I].TitleString);
                DataObject.SetString("description", default.SpecialEventObjectiveInfoList[I].DescriptionString);
                DataObject.SetString("iconPath", "img://" $ default.ObjectiveIconURLs[I]);
                DataObject.SetBool("complete", ObjectiveStatusList[I].bComplete);
                DataObject.SetInt("rewardValue", KFPC.GetSpecialEventRewardValue());
                DataObject.SetBool("showProgress", UsesProgressList[I]);
                if(UsesProgressList[I])
                {
                    GetObjectiveProgressValues(I, CurrentProgressValue, MaxProgressValue, ProgressCompletePercentage);
                    DataObject.SetFloat("progress", ProgressCompletePercentage);
                    DataObject.SetString("textValue", (string(CurrentProgressValue) $ "/") $ string(MaxProgressValue));
                }
                DataProvider.SetElementObject(I, DataObject);
            }
            ++ I;
            goto J0x41;
        }
        if(default.IconURL != "")
        {
            DataProvider.SetString("iconPath", "img://" $ default.IconURL);
        }
        SetObject("objectives", DataProvider);
        return true;
    }
    return false;
}

static function GetObjectiveProgressValues(int ObjectiveID, out int CurrentValue, out int MaxValue, out float PercentComplete)
{
    local KFPlayerController LocalKFPC;
    local int TempCurrentValue, TempMaxValue;

    LocalKFPC = KFPlayerController(Class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController());
    LocalKFPC.GetSeasonalEventStatInfo(ObjectiveID, TempCurrentValue, TempMaxValue);
    MaxValue = TempMaxValue;
    CurrentValue = Clamp(TempCurrentValue, 0, MaxValue);
    PercentComplete = ((MaxValue > 0) ? FClamp(float(CurrentValue) / float(MaxValue), 0, 1) : 0);
}

function bool HasObjectiveStatusChanged()
{
    local int I;
    local bool bHasChanged, bTempStatus;
    local int ProgressValue, MaxValue;
    local float PercentageValue;

    if(SpecialEventObjectiveInfoList.Length != ObjectiveStatusList.Length)
    {
        ObjectiveStatusList.Length = SpecialEventObjectiveInfoList.Length;
        I = 0;
        J0x39:

        if(I < SpecialEventObjectiveInfoList.Length)
        {
            GetObjectiveProgressValues(I, ProgressValue, MaxValue, PercentageValue);
            ObjectiveStatusList[I].bComplete = KFPC.IsEventObjectiveComplete(I);
            ObjectiveStatusList[I].NumericValue = ProgressValue;
            ++ I;
            goto J0x39;
        }
        bHasChanged = true;        
    }
    else
    {
        I = 0;
        J0x127:

        if(I < SpecialEventObjectiveInfoList.Length)
        {
            bTempStatus = KFPC.IsEventObjectiveComplete(I);
            GetObjectiveProgressValues(I, ProgressValue, MaxValue, PercentageValue);
            if((ObjectiveStatusList[I].bComplete != bTempStatus) || ObjectiveStatusList[I].NumericValue != ProgressValue)
            {
                bHasChanged = true;
                ObjectiveStatusList[I].bComplete = bTempStatus;
                ObjectiveStatusList[I].NumericValue = KFPC.GetSpecialEventRewardValue();
            }
            ++ I;
            goto J0x127;
        }
    }
    return bHasChanged;
}

function PopulateReward()
{
    local GFxObject DataObject;

    DataObject = Outer.CreateObject("Object");
    DataObject.SetString("label", default.AllCompleteRewardDescriptionString);
    DataObject.SetString("iconPath", "img://" $ default.AllCompleteRewardIconURL);
    SetObject("allCompleteReward", DataObject);
}

function PopulateChanceDrops()
{
    local int I;
    local GFxObject DataObject, DataProvider;

    DataProvider = Outer.CreateArray();
    I = 0;
    J0x34:

    if(I < ChanceDropDescriptionStrings.Length)
    {
        DataObject = Outer.CreateObject("Object");
        DataObject.SetString("label", ChanceDropDescriptionStrings[I]);
        DataObject.SetString("iconPath", "img://" $ ChanceDropIconURLs[I]);
        DataProvider.SetElementObject(I, DataObject);
        ++ I;
        goto J0x34;
    }
    SetObject("chanceDrops", DataProvider);
}

defaultproperties
{
    CurrentSpecialEventString="Temp Title"
    SpecialEventObjectiveInfoList(0)=(TitleString="Test 1",DescriptionString="Description 1",TierEventRewardName="")
    SpecialEventObjectiveInfoList(1)=(TitleString="Test 2",DescriptionString="Description 2",TierEventRewardName="")
    SpecialEventObjectiveInfoList(2)=(TitleString="Test 3",DescriptionString="Description 3",TierEventRewardName="")
    SpecialEventObjectiveInfoList(3)=(TitleString="Test 4",DescriptionString="Description 4",TierEventRewardName="")
    ObjectiveIconURLs(0)="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    ObjectiveIconURLs(1)="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    ObjectiveIconURLs(2)="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    ObjectiveIconURLs(3)="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    AllCompleteRewardIconURL="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    AllCompleteRewardDescriptionString="Item description for all complete"
    ChanceDropIconURLs(0)="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    ChanceDropIconURLs(1)="UI_PerkIcons_TEX.UI_PerkIcon_Berserker"
    ChanceDropDescriptionStrings(0)="Drop 1"
    ChanceDropDescriptionStrings(1)="Drop 2"
    UsesProgressList(0)=
/* Exception thrown while deserializing UsesProgressList
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    UsesProgressList(1)=
/* Exception thrown while deserializing UsesProgressList
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    UsesProgressList(2)=
/* Exception thrown while deserializing UsesProgressList
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    UsesProgressList(3)=
/* Exception thrown while deserializing UsesProgressList
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    UsesProgressList(4)=
/* Exception thrown while deserializing UsesProgressList
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
}