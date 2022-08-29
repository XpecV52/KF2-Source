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
var KFPawn_Scripted EscortPawn;
var float UpdateTickTime;
var float LastUpdateTime;
var array <int>BattlePhaseColors;
var KFPlayerController KFPC;
var bool bLastHideValue;

var byte LastState;

var string BossIconPath;
var string EscortIconPath;

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
		// hide boss health bar shouldn't affect the escort pawn
        if(KFPC.bHideBossHealthBar && EscortPawn == none)
        {
            SetVisible(false);
        }
        else if(BossPawn != none || EscortPawn != none)
        {
            SetVisible(true);
        }
    }

	// hide boss health bar shouldn't affect the escort pawn
    if(KFPC.bHideBossHealthBar && EscortPawn == none)
    {
        return;
    }

    if(BossPawn != none)
    {
        if(KFPC != none &&
			KFPC.WorldInfo.TimeSeconds - LastUpdateTime > UpdateTickTime)
        {
            UpdateBossHealth();
        }
    }
	if (EscortPawn != none)
	{
		if (KFPC != none &&
			KFPC.WorldInfo.TimeSeconds - LastUpdateTime > UpdateTickTime)
		{
			UpdateEscortPawnHealth();
		}
	}
}

function SetEscortPawn(KFPawn_Scripted NewPawn)
{
	local string BossNameText;

	if (NewPawn == none)
	{
		return;
	}
	EscortPawn = NewPawn;
	BossNameText = EscortPawn.GetLocalizedName();
	
	SetBossName(BossNameText);
	UpdateEscortPawnHealth();
	SetVisible(true);
	SetEscortIcon();
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
	SetBossIcon();
}

simulated function Deactivate()
{
	EscortPawn = none;
	BossPawn = none;
	SetVisible(false);
}

function OnNamePlateHidden()
{
    if(KFPC.bHideBossHealthBar && EscortPawn == none)
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

simulated function SetBossIcon()
{
	if (BossPawn != none)
	{
		SetString("iconPath", BossPawn.GetIconPath());
	}
}

simulated function SetEscortIcon()
{
	if (EscortPawn != none)
	{
		SetString("iconPath", EscortPawn.GetIconPath());
	}
}

function UpdateEscortPawnHealth()
{
	if (EscortPawn.CurrentState != LastState)
	{
		LastState = EscortPawn.CurrentState;
		UpdateEscortPawnStateColor(EscortPawn.CurrentState);
	}
	SetFloat("currentHealthPercentValue", EscortPawn.GetHealthPercent());
}

function UpdateEscortPawnStateColor(int PawnState)
{
	SetInt("currentBattlePhaseColor", BattlePhaseColors[PawnState]);
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

defaultproperties
{
   UpdateTickTime=0.100000
   BattlePhaseColors(0)=47202
   BattlePhaseColors(1)=16756736
   BattlePhaseColors(2)=16736256
   BattlePhaseColors(3)=11343377
   BattlePhaseColors(4)=0
   LastState=255
   Name="Default__KFGFxWidget_BossHealthBar"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
