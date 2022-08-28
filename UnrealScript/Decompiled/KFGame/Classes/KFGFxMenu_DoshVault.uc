/*******************************************************************************
 * KFGFxMenu_DoshVault generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxMenu_DoshVault extends KFGFxObject_Menu within GFxMoviePlayer;

var name PopUpCrateEventName;
var name PileDisappearEventName;
var name DoshVaultSoundThemeName;
var const localized string YourDoshString;
var const localized string NextRewardString;
var const localized string DoshVaultString;
var const localized string YourCratesString;
var const localized string OpenCratesString;
var const localized string CrateUnlockedString;
var const localized string DelayedCrateString;
var bool bSeenAllDoshAnimation;
var bool bPausedForCrate;
var int ItemId;
var OnlineSubsystem OnlineSub;
var ItemProperties RewardItemDetailsHolder;
var KFPlayerController KFPC;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    super.InitializeMenu(InManager);
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    InitialRewardItem();
    LocalizeContainer();
    UpdatePlayerCrateCount();
    KFPC = KFPlayerController(Outer.GetPC());
    InitStart();
}

function InitStart()
{
    local KFGameInfo_Entry KFEntry;

    if(Class'WorldInfo'.static.IsMenuLevel())
    {
        KFEntry = KFGameInfo_Entry(Outer.GetPC().WorldInfo.Game);
        KFEntry.InitVault();
        if(KFPC.GetLastSeenDoshCount() == KFPC.GetTotalDoshCount())
        {
            DelayedInit();            
        }
        else
        {
            SetVisible(false);
        }
    }
}

function DelayedInit()
{
    UpdatePlayerDoshMeter();
    SetVisible(true);
}

function OnOpen()
{
    super.OnOpen();
    bPausedForCrate = false;
    bSeenAllDoshAnimation = false;
    if(Class'WorldInfo'.static.IsMenuLevel())
    {
        Manager.ManagerObject.SetBool("backgroundVisible", false);
    }
    KFPC.CheckHasViewedDoshVault();
    if(KFPC.GetTotalDoshCount() == KFPC.GetLastSeenDoshCount())
    {
        KFPC.TriggerGlobalEventClass(Class'KFSeqEvent_DoshVault', KFPC, 1);        
    }
    else
    {
        KFPC.TriggerGlobalEventClass(Class'KFSeqEvent_DoshVault', KFPC, 0);
    }
    KFPC.VerifyDoshVaultCrates();
    if(!bSeenAllDoshAnimation)
    {
        InitializeMenu(Manager);
    }
}

function OnClose()
{
    if(Class'WorldInfo'.static.IsMenuLevel())
    {
        Manager.ManagerObject.SetBool("backgroundVisible", true);
    }
    AbortSquence();
}

function AbortSquence()
{
    KFPC.TriggerGlobalEventClass(Class'KFSeqEvent_DoshVault', KFPC, 5);
    KFPC.ResetCustomizationCamera();
    KFPC.ClearTimer('DelayedInit');
    bPausedForCrate = false;
}

function LocalizeContainer()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("yourDosh", YourDoshString);
    LocalizedObject.SetString("nextReward", NextRewardString);
    LocalizedObject.SetString("nextUnlock", GetNextUnlockName());
    LocalizedObject.SetString("titleString", DoshVaultString);
    LocalizedObject.SetString("yourCrates", YourCratesString);
    LocalizedObject.SetString("openCrate", OpenCratesString);
    LocalizedObject.SetString("crateUnlocked", CrateUnlockedString);
    LocalizedObject.SetString("iconLocation", "img://" $ (GetCrateIcon()));
    LocalizedObject.SetString("crateDelayed", DelayedCrateString);
    SetObject("localizedText", LocalizedObject);
}

function InitialRewardItem()
{
    local int ItemIndex;

    ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', ItemId;
    if(ItemIndex != -1)
    {
        RewardItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
    }
}

function UpdatePlayerDoshMeter()
{
    local int CurrentTier;

    CurrentTier = int(float(KFPC.GetLastSeenDoshCount()) / KFPC.GetDoshVaultTierValue());
    SendDoshInfo(KFPC.GetLastSeenDoshCount(), KFPC.GetTotalDoshCount(), int(KFPC.GetDoshVaultTierValue() * float(CurrentTier)), int(KFPC.GetDoshVaultTierValue()), GetCrateCount());
}

function int GetCrateCount()
{
    local int CrateCount, I;

    if(OnlineSub == none)
    {
        return -1;
    }
    I = 0;
    J0x20:

    if(I < OnlineSub.CurrentInventory.Length)
    {
        if(OnlineSub.CurrentInventory[I].Definition == ItemId)
        {
            ++ CrateCount;
        }
        ++ I;
        goto J0x20;
    }
    return CrateCount;
}

function UpdatePlayerCrateCount()
{
    SetInt("storedCratesValue", GetCrateCount());
}

function string GetCrateIcon()
{
    return RewardItemDetailsHolder.IconURL;
}

function string GetNextUnlockName()
{
    return RewardItemDetailsHolder.Name;
}

function SendDoshInfo(int OldDosh, int NewDosh, int TierBase, int TierLength, int CrateNum)
{
    local GFxObject DataObject;

    if((OldDosh == -1) || NewDosh == -1)
    {
        Manager.DelayedOpenPopup(2, 0, Class'KFCommon_LocalizedStrings'.default.NoticeString, Class'KFCommon_LocalizedStrings'.default.FailedToReachInventoryServerString, Class'KFCommon_LocalizedStrings'.default.OKString);
        LogInternal("something isn't right.  Connection issue may be present.  To prevent angry Reddit mobs, just don't animate");
        bSeenAllDoshAnimation = true;
        return;
    }
    if(NewDosh < OldDosh)
    {
        NewDosh = OldDosh;
    }
    if(OldDosh == NewDosh)
    {
        LogInternal("no new Vosh!");
        bSeenAllDoshAnimation = true;
    }
    DataObject = Outer.CreateObject("Object");
    DataObject.SetInt("oldDosh", OldDosh);
    DataObject.SetInt("newDosh", NewDosh);
    DataObject.SetInt("tierBase", TierBase);
    DataObject.SetInt("tierLength", TierLength);
    DataObject.SetInt("crateNum", CrateNum);
    SetObject("doshData", DataObject);
}

function bool CanCloseVaultMenu()
{
    return bSeenAllDoshAnimation;
}

function Callback_UpdateDosh(int NewValue)
{
    local KFGameInfo_Entry KFGIE;

    KFGIE = KFGameInfo_Entry(Outer.GetPC().WorldInfo.Game);
    if(KFGIE != none)
    {
        KFGIE.UpdateDoshPiles(NewValue);
        if(bPausedForCrate)
        {
            KFPC.TriggerGlobalEventClass(Class'KFSeqEvent_DoshVault', KFPC, 4);
            bPausedForCrate = false;
        }
    }
}

function Callback_FinalAnimationComplete()
{
    local KFGameInfo_Entry KFGIE;

    KFGIE = KFGameInfo_Entry(Outer.GetPC().WorldInfo.Game);
    if(KFGIE != none)
    {
        KFGIE.FinalAnimationPlayed(KFPC);
    }
    KFPC.TriggerGlobalEventClass(Class'KFSeqEvent_DoshVault', KFPC, 2);
    if(KFPC != none)
    {
        KFPC.MarkDoshVaultSeen();
    }
    bSeenAllDoshAnimation = true;
}

function Callback_DoshAnimationComplete()
{
    Manager.PlaySoundFromTheme(PopUpCrateEventName, DoshVaultSoundThemeName);
    KFPC.CheckUnlockDoshVaultReward();
    KFPC.TriggerGlobalEventClass(Class'KFSeqEvent_DoshVault', KFPC, 3);
    bPausedForCrate = true;
}

function Callback_AnimationBegin();

function Callback_OpenCrateClicked()
{
    Manager.SelectIDOnOpen = ItemId;
    Manager.OpenMenu(4);
}

defaultproperties
{
    PopUpCrateEventName=PopUpCrate
    PileDisappearEventName=DoshPileOut
    DoshVaultSoundThemeName=SoundTheme_DoshVault
    YourDoshString="Your Dosh"
    NextRewardString="Next Reward"
    DoshVaultString="DOSH VAULT"
    YourCratesString="Your Crates:"
    OpenCratesString="OPEN CRATE(S)"
    CrateUnlockedString="CRATE UNLOCKED!"
    DelayedCrateString="* Dosh Vault Crate granting may be delayed until next game restart"
    ItemId=5313
}