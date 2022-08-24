/*******************************************************************************
 * KFGFxMenu_Perks generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxMenu_Perks extends KFGFxObject_Menu within GFxMoviePlayer;

const KFID_QuickWeaponSelect = 100;
const KFID_CurrentLayoutIndex = 101;
const KFID_ForceFeedbackEnabled = 103;
const KFID_SavedPerkIndex = 105;
const KFID_AllowBloodSplatterDecals = 106;
const KFID_GoreLevel = 107;
const KFID_StoredCharIndex = 111;
const KFID_MasterVolumeMultiplier = 112;
const KFID_DialogVolumeMultiplier = 113;
const KFID_MusicVolumeMultiplier = 114;
const KFID_SFXVolumeMultiplier = 115;
const KFID_GammaMultiplier = 117;
const KFID_MusicVocalsEnabled = 118;
const KFID_MinimalChatter = 119;
const KFID_ShowCrossHair = 121;
const KFID_FOVOptionsPercentageValue = 122;
const KFID_ShowKillTicker = 123;
const KFID_FriendlyHudScale = 125;
const KFID_FavoriteWeapons = 127;
const KFID_GearLoadouts = 128;
const KFID_SetGamma = 129;
const KFID_RequiresPushToTalk = 130;
const KFID_InvertController = 131;
const KFID_AutoTargetEnabled = 132;
const KFID_GamepadSensitivityScale = 133;
const KFID_ZoomedSensitivityScale = 134;
const KFID_GamepadZoomedSensitivityScale = 135;
const KFID_EnableMouseSmoothing = 136;
const KFID_MouseSensitivity = 138;
const KFID_TargetAdhesionEnabled = 139;
const KFID_TargetFrictionEnabled = 140;
const KFID_InvertMouse = 142;
const KFID_DEPRECATED_143 = 143;
const KFID_SavedSoloModeIndex = 144;
const KFID_SavedSoloMapString = 145;
const KFID_SavedSoloDifficultyIndex = 146;
const KFID_SavedSoloLengthIndex = 147;
const KFID_SavedModeIndex = 148;
const KFID_SavedMapString = 149;
const KFID_SavedDifficultyIndex = 150;
const KFID_SavedLengthIndex = 151;
const KFID_SavedPrivacyIndex = 152;
const KFID_SavedServerTypeIndex = 153;
const KFID_SavedInProgressIndex = 154;
const KFID_ControllerSoundEnabled = 155;
const KFID_MatchmakingRegion = 156;
const KFID_UseAltAimOnDuals = 157;
const KFID_HideBossHealthBar = 158;
const KFID_AntiMotionSickness = 159;
const KFID_ShowWelderInInventory = 160;
const KFID_AutoTurnOff = 161;
const KFID_ReduceHightPitchSounds = 162;
const KFID_ShowConsoleCrossHair = 163;
const KFID_VOIPVolumeMultiplier = 164;
const KFID_WeaponSkinAssociations = 165;
const KFID_SavedEmoteId = 166;
const KFID_DisableAutoUpgrade = 167;
const KFID_SafeFrameScale = 168;

var KFGFxPerksContainer_Selection SelectionContainer;
var KFGFxPerksContainer_Header HeaderContainer;
var KFGFxPerksContainer_Details DetailsContainer;
var KFGFxPerksContainer_Skills SkillsContainer;
var KFGFxPerksContainer_SkillsSummary SkillsSummaryContainer;
var KFPlayerController KFPC;
var const string LockIconPath;
var byte LastPerkIndex;
var byte LastPerkLevel;
var byte SelectedSkillsHolder[5];
var class<KFPerk> PreviousPerk;
var const localized string TierUnlockedText;
var const localized string TierUnlockedSecondaryText;
var KFPlayerReplicationInfo MyKFPRI;
var bool bModifiedSkills;
var bool bModifiedPerk;
var bool bChangesMadeDuringLobby;
var name PerkLevelupSound;

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    local class<KFPerk> PerkClass;

    PerkClass = KFPC.PerkList[KFPC.SavedPerkIndex].PerkClass;
    switch(WidgetName)
    {
        case 'HeaderContainer':
            if(HeaderContainer == none)
            {
                HeaderContainer = KFGFxPerksContainer_Header(Widget);
                HeaderContainer.Initialize(self);
            }
            break;
        case 'SelectionContainer':
            if(SelectionContainer == none)
            {
                SelectionContainer = KFGFxPerksContainer_Selection(Widget);
                SelectionContainer.Initialize(self);
            }
            break;
        case 'DetailsContainer':
            if(DetailsContainer == none)
            {
                DetailsContainer = KFGFxPerksContainer_Details(Widget);
                DetailsContainer.Initialize(self);
                DetailsContainer.UpdateDetails(PerkClass);
                DetailsContainer.UpdatePassives(PerkClass);
            }
            break;
        case 'SkillsContainer':
            if(SkillsContainer == none)
            {
                SkillsContainer = KFGFxPerksContainer_Skills(Widget);
                SkillsContainer.Initialize(self);
                SkillsContainer.UpdateSkills(PerkClass, SelectedSkillsHolder);
            }
        case 'NextRankContainer':
            break;
        case 'SelectedPerkSummaryContainer':
            if(SkillsSummaryContainer == none)
            {
                SkillsSummaryContainer = KFGFxPerksContainer_SkillsSummary(Widget);
                SkillsSummaryContainer.Initialize(self);
                SkillsSummaryContainer.UpdateSkills(PerkClass, SelectedSkillsHolder);
            }
            break;
        default:
            break;
    }
    return true;
}

function OnOpen()
{
    if(KFPC == none)
    {
        KFPC = KFPlayerController(Outer.GetPC());
    }
    LastPerkIndex = KFPC.SavedPerkIndex;
    MyKFPRI = KFPlayerReplicationInfo(Outer.GetPC().PlayerReplicationInfo);
    UpdateSkillsHolder(KFPC.PerkList[KFPC.SavedPerkIndex].PerkClass);
    UpdateContainers(KFPC.PerkList[KFPC.SavedPerkIndex].PerkClass);
    UpdateLock();
    CheckTiersForPopup();
    if(SelectionContainer != none)
    {
        SelectionContainer.SetPerkListEnabled(!KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo).bReadyToPlay);
    }
    ActionScriptVoid("updatePrompts");
}

function CheckTiersForPopup()
{
    local array<string> UnlockedPerkNames;
    local byte bTierUnlocked;
    local string SecondaryPopupText;
    local byte I;
    local class<KFPerk> PerkClass;
    local int UnlockedPerkLevel;

    I = 0;
    J0x0C:

    if(I < KFPC.PerkList.Length)
    {
        PerkClass = KFPC.PerkList[I].PerkClass;
        Class'KFPerk'.static.LoadTierUnlockFromConfig(PerkClass, bTierUnlocked, UnlockedPerkLevel);
        if(bool(bTierUnlocked) && KFPC.PerkList[I].PerkLevel >= UnlockedPerkLevel)
        {
            UnlockedPerkNames.AddItem(PerkClass.default.PerkName;
        }
        ++ I;
        goto J0x0C;
    }
    if(UnlockedPerkNames.Length > 0)
    {
        I = 0;
        J0x16E:

        if(I < UnlockedPerkNames.Length)
        {
            if(I > 0)
            {
                SecondaryPopupText = (SecondaryPopupText $ ",") @ UnlockedPerkNames[I];                
            }
            else
            {
                SecondaryPopupText = TierUnlockedSecondaryText @ UnlockedPerkNames[I];
            }
            ++ I;
            goto J0x16E;
        }
        KFPC.MyGFxManager.DelayedOpenPopup(2, 0, TierUnlockedText, SecondaryPopupText, Class'KFCommon_LocalizedStrings'.default.OKString,, Outer.,, Outer.,,, Outer.,, PerkLevelupSound);
    }
}

event OnClose()
{
    local bool bShouldUpdatePerk;

    if(KFPC != none)
    {
        if(bModifiedPerk || bModifiedSkills)
        {
            bShouldUpdatePerk = bModifiedPerk && LastPerkIndex != KFPC.SavedPerkIndex;
            SavePerkData();
            if((!bChangesMadeDuringLobby && bShouldUpdatePerk || bModifiedSkills) && KFPC.CanUpdatePerkInfo())
            {
                KFPC.NotifyPerkUpdated();
            }
            if(bShouldUpdatePerk)
            {
                SelectionContainer.SavePerk(LastPerkIndex);
                Manager.CachedProfile.SetProfileSettingValueInt(105, LastPerkIndex);
            }
            bModifiedPerk = false;
            bModifiedSkills = false;
        }
    }
    Manager.CachedProfile.Save(byte(Outer.GetLP().ControllerId));
    super.OnClose();
}

event OnTraderTimeStart()
{
    UpdateLock();
}

function OnRoundOver()
{
    UpdateLock();
}

function bool IsMatchStarted()
{
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    return (KFGRI != none) && KFGRI.bMatchHasBegun;
}

function PerkChanged(byte NewPerkIndex, bool bClickedIndex)
{
    if(KFPC != none)
    {
        UpdateSkillsHolder(KFPC.PerkList[NewPerkIndex].PerkClass);
        bChangesMadeDuringLobby = !IsMatchStarted();
        if(bClickedIndex)
        {
            LastPerkIndex = NewPerkIndex;
            bModifiedPerk = true;
            if((KFPC.Pawn == none) || !KFPC.Pawn.IsAliveAndWell())
            {
                SavePerkData();
                SelectionContainer.SavePerk(NewPerkIndex);
                Manager.CachedProfile.SetProfileSettingValueInt(105, NewPerkIndex);
            }
        }
        UpdateContainers(KFPC.PerkList[NewPerkIndex].PerkClass, bClickedIndex);
    }
}

function OneSecondLoop()
{
    if(KFPC != none)
    {
        if((PreviousPerk == KFPC.PerkList[KFPC.SavedPerkIndex].PerkClass) && LastPerkLevel != KFPC.PerkList[KFPC.SavedPerkIndex].PerkLevel)
        {
            UpdateContainers(KFPC.PerkList[KFPC.SavedPerkIndex].PerkClass);
            PreviousPerk = KFPC.PerkList[KFPC.SavedPerkIndex].PerkClass;
            LastPerkLevel = KFPC.PerkList[KFPC.SavedPerkIndex].PerkLevel;
            return;
        }
    }
}

function UpdateLock()
{
    local WorldInfo TempWorldInfo;
    local KFGameReplicationInfo KFGRI;

    TempWorldInfo = Class'WorldInfo'.static.GetWorldInfo();
    if((TempWorldInfo != none) && TempWorldInfo.GRI != none)
    {
        KFGRI = KFGameReplicationInfo(TempWorldInfo.GRI);
        if((KFGRI != none) && KFPC != none)
        {
            SetBool("locked", KFGRI.CanChangePerks() && KFPC.WasPerkUpdatedThisRound());
        }
    }
}

function UpdateContainers(class<KFPerk> PerkClass, optional bool bClickedIndex)
{
    bClickedIndex = true;
    if(KFPC != none)
    {
        if(HeaderContainer != none)
        {
            HeaderContainer.UpdatePerkHeader(PerkClass);
        }
        if(DetailsContainer != none)
        {
            DetailsContainer.UpdateDetails(PerkClass);
            DetailsContainer.UpdatePassives(PerkClass);
        }
        if((SelectionContainer != none) && bClickedIndex)
        {
            SelectionContainer.UpdatePerkSelection(LastPerkIndex);
        }
        UpdateSkillsUI(PerkClass);
    }
}

function UpdateSkillsUI(class<KFPerk> PerkClass)
{
    if(SkillsContainer != none)
    {
        SkillsContainer.UpdateSkills(PerkClass, SelectedSkillsHolder);
    }
    if(SkillsSummaryContainer != none)
    {
        SkillsSummaryContainer.UpdateSkills(PerkClass, SelectedSkillsHolder);
    }
}

function UpdateSkillsHolder(class<KFPerk> PerkClass)
{
    local int PerkBuild;

    if(KFPC == none)
    {
        KFPC = KFPlayerController(Outer.GetPC());
    }
    PerkBuild = KFPC.GetPerkBuildByPerkClass(PerkClass);
    KFPC.GetPerk().GetUnpackedSkillsArray(PerkClass, PerkBuild, SelectedSkillsHolder);
}

function SavePerkData()
{
    if(KFPC != none)
    {
        if(bModifiedSkills)
        {
            KFPC.CurrentPerk.UpdatePerkBuild(SelectedSkillsHolder, KFPC.PerkList[LastPerkIndex].PerkClass);
            if(!KFPC.CanUpdatePerkInfo())
            {
                KFPC.NotifyPendingPerkChanges();
            }
            bModifiedSkills = false;
        }
        KFPC.ClientWriteAndFlushStats();
    }
}

function Callback_ReadyClicked(bool bReady)
{
    SavePerkData();
    super.Callback_ReadyClicked(bReady);
}

function Callback_PerkSelected(byte NewPerkIndex, bool bClickedIndex)
{
    PerkChanged(NewPerkIndex, bClickedIndex);
    if(bClickedIndex)
    {
    }
}

function Callback_SkillSelected(byte TierIndex, byte SkillIndex)
{
    if(KFPC != none)
    {
        bModifiedSkills = true;
        bChangesMadeDuringLobby = !IsMatchStarted();
        SelectedSkillsHolder[TierIndex] = SkillIndex;
        UpdateSkillsUI(KFPC.PerkList[LastPerkIndex].PerkClass);
        SavePerkData();
    }
}

function Callback_SkillSelectionOpened()
{
    if(SkillsContainer != none)
    {
        SkillsContainer.UpdateTierUnlockState(KFPC.PerkList[LastPerkIndex].PerkClass);
    }
}

defaultproperties
{
    LockIconPath="ui_perktalent_tex.UI_PerkTalent_Locked"
    LastPerkIndex=255
    LastPerkLevel=255
    TierUnlockedText="New Tier Unlocked!"
    TierUnlockedSecondaryText="You have unlocked a new tier for the following perks:"
    PerkLevelupSound=LevelUp_Popup
    SubWidgetBindings=/* Array type was not detected. */
}