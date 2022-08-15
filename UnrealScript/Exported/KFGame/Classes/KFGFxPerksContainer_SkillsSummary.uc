//=============================================================================
// KFGFxPerksContainer_Skills
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 12/11/2013
//=============================================================================

class KFGFxPerksContainer_SkillsSummary extends KFGFxPerksContainer
	DependsOn(KFPerk) DependsOn(KFGFxMenu_Perks);

var KFGFxMenu_Perks PerkMenu;
var byte SelectedSkillsHolder[5];
var localized string ConfigureString, SkillsString;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );
	PerkMenu = KFGFxMenu_Perks(NewParentMenu);
	LocalizeContainer();
	ParentMenu.Manager.TimerHelper.SetTimer(0.1f, false,'DelayedRefresh', self);
}

function DelayedRefresh()
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetPC());
	UpdateSkills(  KFPC.PerkList[KFPC.SavedPerkIndex].PerkClass, PerkMenu.SelectedSkillsHolder);
}

function  LocalizeContainer()
{
	GetObject("configureButton").SetString("label", ConfigureString);
	GetObject("titleTextfield").SetString("text", SkillsString);
}

function UpdateSkills( class<KFPerk> PerkClass, const out byte SelectedSkills[5] )
{
	local bool bShouldUnlock;
	local byte i, UnlockLevel, bTierUnlocked;
	local GFxObject DataProvider,TempObj;
	local string SkillName;
	local string   IconPath;
	local int PerkSkillIndex;
	local array<PerkSkill> PerkSkillArr;
	local int UnlockedPerkLevel;
	local KFPlayerController KFPC;

	PerkSkillArr = PerkClass.default.PerkSkills;
	KFPC = KFPlayerController(GetPC());
	
	DataProvider = CreateArray();

    for ( i = 0; i < 5; i++ )
	{
		PerkSkillIndex = (i * 2) + (SelectedSkills[i]-1);
		TempObj = CreateObject( "Object" );
		UnlockLevel = class'KFPerk'.const.RANK_1_LEVEL + (class'KFPerk'.const.UNLOCK_INTERVAL * i);
		bShouldUnlock = SelectedSkills[i] > 0;
		if(bShouldUnlock)
		{
			SkillName = Localize(String(PerkClass.Name), PerkSkillArr[PerkSkillIndex].Name, "KFGame");;	
			IconPath = PerkSkillArr[PerkSkillIndex].IconPath;
			if(IconPath == "")
			{
				IconPath = PerkClass.static.GetPerkIconPath();
			}
		}
		else
		{
			SkillName = LevelString@ UnlockLevel;
			IconPath = KFGFxMenu_Perks(ParentMenu).LockIconPath;
		}
		TempObj.SetBool("unlocked", bShouldUnlock);
		TempObj.SetString("Title", SkillName);
		TempObj.SetString("iconSource", "img://"$IconPath);

		DataProvider.SetElementObject( i, TempObj );
	}
	class'KFPerk'.static.LoadTierUnlockFromConfig(PerkClass, bTierUnlocked, UnlockedPerkLevel);
	SetBool("bTierUnlocked" , bool(bTierUnlocked) && KFPC.GetPerkLevelFromPerkList( PerkClass ) >= UnlockedPerkLevel   );
	SetObject("skillsData", DataProvider);
}

defaultproperties
{
   ConfigureString="CONFIGURE"
   SkillsString="SKILLS"
   Name="Default__KFGFxPerksContainer_SkillsSummary"
   ObjectArchetype=KFGFxPerksContainer'KFGame.Default__KFGFxPerksContainer'
}
