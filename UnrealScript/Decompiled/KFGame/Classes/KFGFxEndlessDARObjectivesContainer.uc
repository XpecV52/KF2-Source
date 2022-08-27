/*******************************************************************************
 * KFGFxEndlessDARObjectivesContainer generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxEndlessDARObjectivesContainer extends KFGFxSpecialEventObjectivesContainer within GFxMoviePlayer;

var array<string> EndlessRewardIconPaths;
var array<int> WaveTierValues;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    SetBool("isTieredEvent", true);
    super.Initialize(NewParentMenu);
}

function LocalizeMenu()
{
    local GFxObject TextObject;

    TextObject = Outer.CreateObject("Object");
    TextObject.SetString("title", default.CurrentSpecialEventString);
    TextObject.SetString("description", default.CurrentSpecialEventDescriptionString);
    TextObject.SetString("reward", "");
    TextObject.SetString("granted", "");
    TextObject.SetString("chanceOfDrop", "");
    SetObject("localizedText", TextObject);
}

function bool PopulateData()
{
    local GFxObject DataObject, DataProvider;
    local int I;

    if(HasObjectiveStatusChanged())
    {
        DataProvider = Outer.CreateArray();
        I = 0;
        J0x41:

        if(I < SpecialEventObjectiveInfoList.Length)
        {
            DataObject = Outer.CreateObject("Object");
            DataObject.SetString("label", default.SpecialEventObjectiveInfoList[I].TitleString);
            DataObject.SetString("description", default.SpecialEventObjectiveInfoList[I].DescriptionString);
            DataObject.SetString("rewardName", default.SpecialEventObjectiveInfoList[I].TierEventRewardName);
            DataObject.SetString("rewardPath", "img://" $ default.EndlessRewardIconPaths[I]);
            DataObject.SetString("iconPath", "img://" $ default.ObjectiveIconURLs[I]);
            DataObject.SetBool("complete", ObjectiveStatusList[I].bComplete);
            DataObject.SetInt("rewardValue", ObjectiveStatusList[I].NumericValue);
            DataObject.SetBool("showProgres", false);
            DataObject.SetFloat("progress", 0);
            DataObject.SetString("textValue", "");
            DataObject.SetInt("waveNum", default.WaveTierValues[I]);
            DataObject.SetInt("tierNum", I);
            DataProvider.SetElementObject(I, DataObject);
            ++ I;
            goto J0x41;
        }
        SetObject("objectives", DataProvider);
        return true;
    }
    return false;
}

function PopulateChanceDrops();

function PopulateReward();

defaultproperties
{
    EndlessRewardIconPaths(0)="Spring_UI.UI_Objectives_Spring_DAR01"
    EndlessRewardIconPaths(1)="Spring_UI.UI_Objectives_Spring_DAR02"
    EndlessRewardIconPaths(2)="Spring_UI.UI_Objectives_Spring_DAR03"
    EndlessRewardIconPaths(3)="Spring_UI.UI_Objectives_Spring_DAR04"
    EndlessRewardIconPaths(4)="Spring_UI.UI_Objectives_Spring_DAR05"
    WaveTierValues(0)=5
    WaveTierValues(1)=10
    WaveTierValues(2)=15
    WaveTierValues(3)=20
    WaveTierValues(4)=25
    CurrentSpecialEventString="D.A.R.ing Endless Challenges"
    CurrentSpecialEventDescriptionString="Beat the waves to earn legenD.A.R.y rewards!"
    SpecialEventObjectiveInfoList(0)=(TitleString="Endless Test Dummy",DescriptionString="Complete Endless Wave 5",TierEventRewardName="Classic D.A.R.")
    SpecialEventObjectiveInfoList(1)=(TitleString="Endless Drone",DescriptionString="Complete Endless Wave 10",TierEventRewardName="Loader D.A.R.")
    SpecialEventObjectiveInfoList(2)=(TitleString="Endless Sentry",DescriptionString="Complete Endless Wave 15",TierEventRewardName="Skully D.A.R.")
    SpecialEventObjectiveInfoList(3)=(TitleString="Endless War Machine",DescriptionString="Complete Endless Wave 20",TierEventRewardName="Bloody D.A.R.")
    SpecialEventObjectiveInfoList(4)=(TitleString="Endless Optimus D.A.R.",DescriptionString="Complete Endless Wave 25",TierEventRewardName="Golden D.A.R.")
    ObjectiveIconURLs(0)="Spring_UI.UI_Objectives_Spring_DAR01"
    ObjectiveIconURLs(1)="Spring_UI.UI_Objectives_Spring_DAR02"
    ObjectiveIconURLs(2)="Spring_UI.UI_Objectives_Spring_DAR03"
    ObjectiveIconURLs(3)="Spring_UI.UI_Objectives_Spring_DAR04"
    ObjectiveIconURLs(4)="Spring_UI.UI_Objectives_Spring_DAR05"
    AllCompleteRewardIconURL="CHR_Pajama_Item_TEX.Uniform_PajamaObjective"
    ChanceDropIconURLs(0)="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket"
    ChanceDropIconURLs(1)="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket_Golden"
    IconURL="Xmas_UI.KF2_KrampusChristmas_UILogo_Small"
}