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

var KFPawn_Monster BossPawn;
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

function SetBossPawn(KFPawn_Monster NewBossPawn)
{
    local string BossNameText;
    
    if(NewBossPawn == none)
    {
        return;
    }
    BossPawn = NewBossPawn;
    BossNameText = BossPawn.BossName;
    if(BossPawn.IsHumanControlled())
    {
         BossNameText = BossNameText$"("$BossPawn.Controller.PlayerReplicationInfo$")";
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
    SetFloat( "currentHealthPercentValue",float(BossPawn.Health) / float(BossPawn.HealthMax) );
}

function UpdateBossBattlePhase(int BattlePhase)
{
    SetInt( "currentBattlePhaseColor", BattlePhaseColors[BattlePhase-1] );
}

function UpdateBossShield(float NewShieldPercect)
{
    SetFloat( "currentShieldPercecntValue",NewShieldPercect);
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