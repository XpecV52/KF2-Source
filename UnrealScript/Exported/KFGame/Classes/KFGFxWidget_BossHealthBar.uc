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
    SetInt( "currentBattlePhaseColor", BattlePhaseColors[BattlePhase-1] );
}

function UpdateBossShield(float NewShieldPercect)
{
    SetFloat( "currentShieldPercecntValue",NewShieldPercect);
}

defaultproperties
{
   UpdateTickTime=0.100000
   BattlePhaseColors(0)=47202
   BattlePhaseColors(1)=16756736
   BattlePhaseColors(2)=16736256
   BattlePhaseColors(3)=11343377
   BattlePhaseColors(4)=0
   Name="Default__KFGFxWidget_BossHealthBar"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
