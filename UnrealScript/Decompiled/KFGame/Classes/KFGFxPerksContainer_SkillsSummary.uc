/*******************************************************************************
 * KFGFxPerksContainer_SkillsSummary generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxPerksContainer_SkillsSummary extends KFGFxPerksContainer within GFxMoviePlayer;

var KFGFxMenu_Perks PerkMenu;
var byte SelectedSkillsHolder[5];
var const localized string ConfigureString;
var const localized string SkillsString;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super(KFGFxObject_Container).Initialize(NewParentMenu);
    PerkMenu = KFGFxMenu_Perks(NewParentMenu);
    LocalizeContainer();
    ParentMenu.Manager.TimerHelper.SetTimer(0.1, false, 'DelayedRefresh', self);
}

function DelayedRefresh()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    UpdateSkills(KFPC.PerkList[KFPC.SavedPerkIndex].PerkClass, PerkMenu.SelectedSkillsHolder);
}

function LocalizeContainer()
{
    GetObject("configureButton").SetString("label", ConfigureString);
    GetObject("titleTextfield").SetString("text", SkillsString);
}

function UpdateSkills(class<KFPerk> PerkClass, const out byte SelectedSkills[5])
{
    local bool bShouldUnlock;
    local byte I, UnlockLevel, bTierUnlocked;
    local GFxObject DataProvider, TempObj;
    local string SkillName, IconPath;
    local int PerkSkillIndex;
    local array<PerkSkill> PerkSkillArr;
    local int UnlockedPerkLevel;
    local KFPlayerController KFPC;

    PerkSkillArr = PerkClass.default.PerkSkills;
    KFPC = KFPlayerController(Outer.GetPC());
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x8F:

    if(I < 5)
    {
        PerkSkillIndex = (I * 2) + (SelectedSkills[I] - 1);
        TempObj = Outer.CreateObject("Object");
        UnlockLevel = byte(5 + (5 * I));
        bShouldUnlock = SelectedSkills[I] > 0;
        if(bShouldUnlock)
        {
            SkillName = Localize(string(PerkClass.Name), PerkSkillArr[PerkSkillIndex].Name, "KFGame");
            IconPath = PerkSkillArr[PerkSkillIndex].IconPath;
            if(IconPath == "")
            {
                IconPath = PerkClass.static.GetPerkIconPath();
            }            
        }
        else
        {
            SkillName = LevelString @ string(UnlockLevel);
            IconPath = KFGFxMenu_Perks(ParentMenu).LockIconPath;
        }
        TempObj.SetBool("unlocked", bShouldUnlock);
        TempObj.SetString("Title", SkillName);
        TempObj.SetString("iconSource", "img://" $ IconPath);
        DataProvider.SetElementObject(I, TempObj);
        ++ I;
        goto J0x8F;
    }
    Class'KFPerk'.static.LoadTierUnlockFromConfig(PerkClass, bTierUnlocked, UnlockedPerkLevel);
    SetBool("bTierUnlocked", bool(bTierUnlocked) && KFPC.GetPerkLevelFromPerkList(PerkClass) >= UnlockedPerkLevel);
    SetObject("skillsData", DataProvider);
}

defaultproperties
{
    ConfigureString="CONFIGURE"
    SkillsString="SKILLS"
}