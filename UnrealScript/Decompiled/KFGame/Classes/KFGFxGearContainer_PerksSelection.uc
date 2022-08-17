/*******************************************************************************
 * KFGFxGearContainer_PerksSelection generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxGearContainer_PerksSelection extends KFGFxObject_Container within GFxMoviePlayer;

struct PerkData
{
    var string PerkTitle;
    var int PerkLevel;
    var int PerkPercent;

    structdefaultproperties
    {
        PerkTitle=""
        PerkLevel=0
        PerkPercent=0
    }
};

var array<PerkData> PerksData;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    super.Initialize(NewParentMenu);
    LocalizeText();
    if(KFPC != none)
    {
        UpdatePerkSelection(0);
    }
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("back", Class'KFCommon_LocalizedStrings'.default.BackString);
    SetObject("localizedText", LocalizedObject);
}

function UpdatePerkSelection(byte SelectedPerkIndex)
{
    local int I;
    local GFxObject DataProvider, TempObj;
    local KFPlayerController KFPC;
    local class<KFPerk> PerkClass;
    local byte bTierUnlocked;
    local int UnlockedPerkLevel;

    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC != none)
    {
        DataProvider = Outer.CreateArray();
        I = 0;
        J0x75:

        if(I < KFPC.PerkList.Length)
        {
            PerkClass = KFPC.PerkList[I].PerkClass;
            Class'KFPerk'.static.LoadTierUnlockFromConfig(PerkClass, bTierUnlocked, UnlockedPerkLevel);
            TempObj = Outer.CreateObject("Object");
            TempObj.SetInt("PerkLevel", KFPC.PerkList[I].PerkLevel);
            TempObj.SetString("Title", PerkClass.default.PerkName);
            TempObj.SetString("iconSource", "img://" $ PerkClass.static.GetPerkIconPath());
            TempObj.SetBool("bTierUnlocked", bool(bTierUnlocked) && KFPC.PerkList[I].PerkLevel >= UnlockedPerkLevel);
            DataProvider.SetElementObject(I, TempObj);
            ++ I;
            goto J0x75;
        }
        SetObject("perkData", DataProvider);
        SetInt("SelectedIndex", SelectedPerkIndex);
    }
}