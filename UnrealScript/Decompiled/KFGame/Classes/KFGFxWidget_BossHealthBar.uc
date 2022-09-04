/*******************************************************************************
 * KFGFxWidget_BossHealthBar generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWidget_BossHealthBar extends GFxObject within GFxMoviePlayer;

struct SCompressedArmorInfo
{
    var float Percentage;
    var Texture2D IconTexture;

    structdefaultproperties
    {
        Percentage=0
        IconTexture=none
    }
};

var GFxObject bossNameTextField;
var KFInterface_MonsterBoss BossPawn;
var KFPawn_Scripted EscortPawn;
var float UpdateTickTime;
var float LastUpdateTime;
var array<int> BattlePhaseColors;
var KFPlayerController KFPC;
var bool bLastHideValue;
var byte LastState;
var string BossIconPath;
var string EscortIconPath;

function InitializeHUD()
{
    KFPC = KFPlayerController(Outer.GetPC());
    bossNameTextField = GetObject("bossnameText");
}

function TickHud(float DeltaTime)
{
    if(KFPC.bHideBossHealthBar != bLastHideValue)
    {
        bLastHideValue = KFPC.bHideBossHealthBar;
        if(KFPC.bHideBossHealthBar && EscortPawn == none)
        {
            SetVisible(false);            
        }
        else
        {
            if(NotEqual_InterfaceInterface(BossPawn, (none)) || EscortPawn != none)
            {
                SetVisible(true);
            }
        }
    }
    if(KFPC.bHideBossHealthBar && EscortPawn == none)
    {
        return;
    }
    if(NotEqual_InterfaceInterface(BossPawn, (none)))
    {
        if((KFPC != none) && (KFPC.WorldInfo.TimeSeconds - LastUpdateTime) > UpdateTickTime)
        {
            UpdateBossHealth();
        }
    }
    if(EscortPawn != none)
    {
        if((KFPC != none) && (KFPC.WorldInfo.TimeSeconds - LastUpdateTime) > UpdateTickTime)
        {
            UpdateEscortPawnHealth();
        }
    }
}

function SetEscortPawn(KFPawn_Scripted NewPawn)
{
    local string BossNameText;

    if(NewPawn == none)
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

    if(EqualEqual_InterfaceInterface(NewBoss, (none)))
    {
        return;
    }
    BossPawn = NewBoss;
    BossNameText = BossPawn.GetMonsterPawn().GetLocalizedName();
    if(BossPawn.GetMonsterPawn().IsHumanControlled())
    {
        BossNameText = ((BossNameText $ "(") $ string(BossPawn.GetMonsterPawn().Controller.PlayerReplicationInfo)) $ ")";
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

simulated function DeActivate()
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
    if(NotEqual_InterfaceInterface(BossPawn, (none)))
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
    if(NotEqual_InterfaceInterface(BossPawn, (none)))
    {
        SetString("iconPath", BossPawn.GetIconPath());
    }
}

simulated function SetEscortIcon()
{
    if(EscortPawn != none)
    {
        SetString("iconPath", EscortPawn.GetIconPath());
    }
}

function UpdateEscortPawnHealth()
{
    if(EscortPawn.CurrentState != LastState)
    {
        LastState = EscortPawn.CurrentState;
        UpdateEscortPawnStateColor(EscortPawn.ScriptedCharArch.States[EscortPawn.CurrentState].PawnHealthBarColor);
    }
    SetFloat("currentHealthPercentValue", EscortPawn.GetHealthPercent());
}

function UpdateEscortPawnStateColor(Color PawnColor)
{
    SetInt("currentBattlePhaseColor", ((PawnColor.R << 16) | (PawnColor.G << 8)) | PawnColor.B);
}

function UpdateBossHealth()
{
    SetFloat("currentHealthPercentValue", BossPawn.GetHealthPercent());
}

function UpdateBossBattlePhase(int BattlePhase)
{
    SetInt("currentBattlePhaseColor", BattlePhaseColors[Max(BattlePhase - 1, 0)]);
}

function UpdateBossShield(float NewShieldPercect)
{
    SetFloat("currentShieldPercecntValue", NewShieldPercect);
}

function UpdateArmorUI(const out SCompressedArmorInfo ArmorValues[3])
{
    local int I;
    local GFxObject DataProvider, DataObject;

    DataProvider = Outer.CreateArray();
    I = 0;
    J0x34:

    if(I < 3)
    {
        if(ArmorValues[I].IconTexture != none)
        {
            DataObject = Outer.CreateObject("Object");
            DataObject.SetFloat("armorPercent", ArmorValues[I].Percentage);
            if(ArmorValues[I].IconTexture != none)
            {
                DataObject.SetString("iconSource", "img://" $ PathName(ArmorValues[I].IconTexture));
            }
            DataProvider.SetElementObject(I, DataObject);
        }
        ++ I;
        goto J0x34;
    }
    SetObject("armorData", DataProvider);
}

function RemoveArmorUI()
{
    local GFxObject DataProvider;

    DataProvider = Outer.CreateArray();
    DataProvider.SetVisible(false);
    SetObject("armorData", DataProvider);
}

defaultproperties
{
    UpdateTickTime=0.1
    BattlePhaseColors(0)=47202
    BattlePhaseColors(1)=16756736
    BattlePhaseColors(2)=16736256
    BattlePhaseColors(3)=11343377
    BattlePhaseColors(4)=0
    LastState=255
}