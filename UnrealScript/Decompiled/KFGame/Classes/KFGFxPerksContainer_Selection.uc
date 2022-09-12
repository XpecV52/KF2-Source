/*******************************************************************************
 * KFGFxPerksContainer_Selection generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxPerksContainer_Selection extends KFGFxPerksContainer within GFxMoviePlayer;

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

var const localized string HeaderTitle;
var const localized string EndOfWaveString;
var const localized string ChangesAppliedOnCloseString;
var const localized string OncePerWaveString;
var array<PerkData> PerksData;
var KFGFxMenu_Perks PerksMenu;
var KFGameReplicationInfo KFGRI;
var KFPlayerReplicationInfo KFPRI;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    KFPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
    PerksMenu = KFGFxMenu_Perks(NewParentMenu);
    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    super(KFGFxObject_Container).Initialize(NewParentMenu);
    LocalizeText();
    if(KFPC != none)
    {
        UpdatePerkSelection(KFPC.SavedPerkIndex);
    }
    SetPerkListEnabled(!KFPRI.bReadyToPlay);
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("header", HeaderTitle);
    LocalizedObject.SetString("oncePerkWave", OncePerWaveString);
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
            TempObj.SetBool("bPerkAllowed", true);
            DataProvider.SetElementObject(I, TempObj);
            ++ I;
            goto J0x75;
        }
        SetObject("perkData", DataProvider);
        SetInt("SelectedIndex", SelectedPerkIndex);
        SetInt("ActiveIndex", SelectedPerkIndex);
        UpdatePendingPerkInfo(SelectedPerkIndex);
    }
}

function SetPerkListEnabled(bool bValue)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    SetBool("perkListEnabled", bValue || KFPC.MyGFxManager.bAfterLobby);
}

function UpdatePendingPerkInfo(byte SelectedPerkIndex)
{
    local string PerkName;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    if((KFPC != none) && KFGRI != none)
    {
        if(!Class'WorldInfo'.static.IsMenuLevel())
        {
            if((!KFPC.CanUpdatePerkInfo() && !KFGRI.CanChangePerks()) || ((KFGRI.CanChangePerks() && PerksMenu.bModifiedPerk) && KFPC.PlayerReplicationInfo.bReadyToPlay) && KFPC.WorldInfo.GRI.bMatchHasBegun)
            {
                PerkName = KFPC.PerkList[SelectedPerkIndex].PerkClass.default.PerkName;                
            }
            else
            {
                PerkName = "";
            }
        }
        if(KFGRI.CanChangePerks() && KFPC.CanUpdatePerkInfo())
        {
            SetPendingPerkChanges(PerkName, "img://" $ KFPC.PerkList[SelectedPerkIndex].PerkClass.static.GetPerkIconPath(), ChangesAppliedOnCloseString);            
        }
        else
        {
            SetPendingPerkChanges(PerkName, "img://" $ KFPC.PerkList[SelectedPerkIndex].PerkClass.static.GetPerkIconPath(), EndOfWaveString);
        }
    }
}

function SetPendingPerkChanges(string PerkClassName, string PerkIconPath, string Message)
{
    ActionScriptVoid("setPendingPerkChanges");
}

function SavePerk(int PerkId)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC != none)
    {
        KFPC.RequestPerkChange(byte(PerkId));
        if(KFPC.CanUpdatePerkInfo())
        {
            KFPC.SetHaveUpdatePerk(true);
        }
    }
}

defaultproperties
{
    HeaderTitle="SELECT PERK"
    EndOfWaveString="Perk changes will be applied at end of the wave!"
    ChangesAppliedOnCloseString="Perk changes will be applied when this menu is closed."
    OncePerWaveString="Perk changes can only be done once per wave!"
}