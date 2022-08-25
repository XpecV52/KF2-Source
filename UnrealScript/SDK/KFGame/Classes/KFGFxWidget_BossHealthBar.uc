//=============================================================================
// KFGFxWidget_BossHealthBar
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 04/28/2016
//=============================================================================

class KFGFxWidget_BossHealthBar extends GFxObject;

var GFxObject bossNameTextField;

var KFInterface_MonsterBoss BossPawn;
var float UpdateTickTime;
var float LastUpdateTime;
var array <int>BattlePhaseColors;
var KFPlayerController KFPC;
var bool bLastHideValue;

struct SCompressedArmorInfo
{
	var float Percentage;
	var Texture2D IconTexture;
};

function InitializeHUD()
{
    KFPC = KFPlayerController(GetPC());
    bossNameTextField = GetObject("bossnameText");
}

function TickHud(float DeltaTime)
{
    if(KFPC.bHideBossHealthBar != bLastHideValue)
    {
        bLastHideValue = KFPC.bHideBossHealthBar;
        if(KFPC.bHideBossHealthBar)
        {
            SetVisible(false);
        }
        else if(BossPawn != none)
        {
            SetVisible(true);
        }
    }
    if(KFPC.bHideBossHealthBar)
    {
        return;
    }
    if(BossPawn != none)
    {
        if(GetPC() != none &&
        GetPC().WorldInfo.TimeSeconds - LastUpdateTime > UpdateTickTime)
        {
            UpdateBossHealth();
        }
    }
}

function SetBossPawn(KFInterface_MonsterBoss NewBoss)
{
    local string BossNameText;

    if(NewBoss == none)
    {
        return;
    }
    BossPawn = NewBoss;
    BossNameText = BossPawn.GetMonsterPawn().static.GetLocalizedName();
    if(BossPawn.GetMonsterPawn().IsHumanControlled())
    {
         BossNameText = BossNameText $ "(" $ BossPawn.GetMonsterPawn().Controller.PlayerReplicationInfo $ ")";
    }

    SetBossName(BossNameText);
    if(KFPC.bHideBossHealthBar)
    {
        return;
    }
    UpdateBossHealth();
	UpdateBossBattlePhase(1);
}

function OnNamePlateHidden()
{
    if(KFPC.bHideBossHealthBar)
    {
        return;
    }

    if(BossPawn != none)
    {
        SetVisible(true);
    }
	else
	{
		SetVisible(false);
	}
}

function SetBossName(string BossName)
{
    if(bossNameTextField != none)
    {
        bossNameTextField.SetText(BossName);
    }
}

function UpdateBossHealth()
{
    SetFloat( "currentHealthPercentValue", BossPawn.GetHealthPercent() );
}

function UpdateBossBattlePhase(int BattlePhase)
{
    SetInt( "currentBattlePhaseColor", BattlePhaseColors[Max(BattlePhase - 1, 0)] );
}

function UpdateBossShield(float NewShieldPercect)
{
    SetFloat( "currentShieldPercecntValue",NewShieldPercect);
}

function UpdateArmorUI(const out SCompressedArmorInfo ArmorValues[3])
{
	local int i;
	local GFxObject DataProvider, DataObject;

	DataProvider = CreateArray();

	for (i = 0; i < 3; i++)
	{
		DataObject = CreateObject("Object");
		DataObject.SetFloat("armorPercent", ArmorValues[i].Percentage);
		if (ArmorValues[i].IconTexture != none)
		{
			DataObject.SetString("iconSource", "img://"$PathName(ArmorValues[i].IconTexture));
		}
		DataProvider.SetElementObject(i, DataObject);
	}

	SetObject("armorData", DataProvider);
}

function RemoveArmorUI()
{
	local GFxObject DataProvider;
	DataProvider = CreateArray();
	DataProvider.SetVisible(false);
	SetObject("armorData", DataProvider);
}

DefaultProperties
{
    UpdateTickTime=0.1f
    BattlePhaseColors.Add(0x00B862);//green
    BattlePhaseColors.Add(0xFFB000);//yellow
    BattlePhaseColors.Add(0xFF6000);//orange
    BattlePhaseColors.Add(0xAD1611);//red
    BattlePhaseColors.Add(0x000000);//dead
}