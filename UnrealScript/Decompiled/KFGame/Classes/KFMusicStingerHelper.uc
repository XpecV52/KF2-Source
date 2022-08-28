/*******************************************************************************
 * KFMusicStingerHelper generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFMusicStingerHelper extends Object;

var AkEvent RoundWonStinger;
var AkEvent RoundLostStinger;
var AkEvent MatchWonStinger;
var AkEvent MatchLostStinger;
var AkEvent WaveStartStinger;
var AkEvent WaveStartStingerWeekly;
var AkEvent WaveStartStingerSpecial;
var AkEvent WaveStartStingerBoss;
var AkEvent WaveCompletedStinger;
var AkEvent NewObjectiveStinger;
var AkEvent ObjectiveWonStinger;
var AkEvent SpecialEventObjectiveStinger;
var AkEvent DailyCompleteStinger;
var AkEvent ObjectiveLostStinger;
var AkEvent PlayerDiedStinger;
var AkEvent LevelUpStinger;
var AkEvent TierUnlockedStinger;
var AkEvent TeammateDeathStinger;
var AkEvent ZedKillHumanStinger;
var AkEvent ZedPlayerKilledStinger;
var AkEvent ZedPlayerSuicideStinger;
var AkEvent WeaponUpgradeStinger;
var AkEvent PerkPrestigeStinger;

static simulated function PlayWeaponUpgradeStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.WeaponUpgradeStinger);
}

static simulated function PlayPerkPrestigeStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.PerkPrestigeStinger);
}

static simulated function PlayTeammateDeathStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.TeammateDeathStinger);
}

static simulated function PlayZedKillHumanStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.ZedKillHumanStinger);
}

static simulated function PlayZedPlayerKilledStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.ZedPlayerKilledStinger);
}

static simulated function PlayZedPlayerSuicideStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.ZedPlayerSuicideStinger);
}

static simulated function PlayRoundWonStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.RoundWonStinger);
}

static simulated function PlayRoundLostStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.RoundLostStinger);
}

static simulated function PlayMatchWonStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.MatchWonStinger);
}

static simulated function PlayMatchLostStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.MatchLostStinger);
}

static simulated function PlayWaveStartStinger(PlayerController P, optional byte WaveStartType)
{
    local KFPlayerController KFPC;
    local AkEvent AkEventToPlay;

    WaveStartType = 0;
    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    switch(WaveStartType)
    {
        case 0:
            AkEventToPlay = default.WaveStartStinger;
            break;
        case 17:
            AkEventToPlay = default.WaveStartStingerWeekly;
            break;
        case 18:
            AkEventToPlay = default.WaveStartStingerSpecial;
            break;
        case 19:
            AkEventToPlay = default.WaveStartStingerBoss;
            break;
        default:
            AkEventToPlay = default.WaveStartStinger;
            break;
    }
    KFPC.StingerAkComponent.PlayEvent(AkEventToPlay);
}

static simulated function PlayWaveCompletedStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.WaveCompletedStinger);
}

static simulated function PlayDailyCompleteStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.DailyCompleteStinger);
}

static simulated function PlaySpecialEventObjectiveStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.SpecialEventObjectiveStinger);
}

static simulated function PlayObjectiveWonStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.ObjectiveWonStinger);
}

static simulated function PlayNewObjectiveStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.NewObjectiveStinger);
}

static simulated function PlayObjectiveLostStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    if(KFPC.StingerAkComponent.IsPlaying())
    {
        return;
    }
    KFPC.StingerAkComponent.PlayEvent(default.ObjectiveLostStinger);
}

static simulated function PlayLevelUpStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    if(KFPC.StingerAkComponent.IsPlaying())
    {
        return;
    }
    KFPC.StingerAkComponent.PlayEvent(default.LevelUpStinger);
}

static simulated function PlayTierUnlockedStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if(KFPC == none)
    {
        return;
    }
    if(KFPC.StingerAkComponent.IsPlaying())
    {
        return;
    }
    KFPC.StingerAkComponent.PlayEvent(default.TierUnlockedStinger);
}

static simulated function PlayPlayerDiedStinger(PlayerController P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P);
    if((KFPC == none) || Class'Engine'.static.IsEditor())
    {
        return;
    }
    KFPC.StingerAkComponent.StopEvents();
    KFPC.StingerAkComponent.PlayEvent(default.PlayerDiedStinger);
}

defaultproperties
{
    RoundWonStinger=AkEvent'WW_UI_Menu.Play_Round_Won'
    RoundLostStinger=AkEvent'WW_UI_Menu.Play_Round_Lost'
    MatchWonStinger=AkEvent'WW_MSTG_Global.Play_MSTG_BossKilled'
    MatchLostStinger=AkEvent'WW_MSTG_Global.Play_MSTG_TeamWipedOut'
    WaveStartStinger=AkEvent'WW_UI_Menu.Play_UI_Alert_Wave_Incoming'
    WaveStartStingerWeekly=AkEvent'WW_UI_Objectives.Play_UI_ObjectiveComplete'
    WaveStartStingerSpecial=AkEvent'WW_UI_Objectives.Play_UI_ObjectiveComplete'
    WaveStartStingerBoss=AkEvent'WW_UI_Menu.Play_Zed_Player_Killed'
    WaveCompletedStinger=AkEvent'WW_MSTG_Global.Play_MSTG_WaveComplete'
    NewObjectiveStinger=AkEvent'WW_UI_Objectives.Play_UI_ObjectiveNotify'
    ObjectiveWonStinger=AkEvent'WW_UI_Objectives.Play_UI_ObjectiveComplete'
    SpecialEventObjectiveStinger=AkEvent'WW_UI_Objectives.Play_UI_ObjectiveComplete'
    DailyCompleteStinger=AkEvent'WW_UI_Objectives.Play_UI_ObjectiveComplete'
    ObjectiveLostStinger=AkEvent'WW_UI_Objectives.Play_UI_Objective_Fail'
    PlayerDiedStinger=AkEvent'WW_MSTG_Global.Play_MSTG_PlayerDeath'
    LevelUpStinger=AkEvent'WW_MSTG_Global.Play_MSTG_LevelUp_XP'
    TierUnlockedStinger=AkEvent'WW_MSTG_Global.Play_MSTG_LevelUp_KeyXP'
    TeammateDeathStinger=AkEvent'WW_UI_Menu.Play_Teammate_Death'
    ZedKillHumanStinger=AkEvent'WW_UI_Menu.Play_Zed_Kill_Human'
    ZedPlayerKilledStinger=AkEvent'WW_UI_Menu.Play_Zed_Player_Killed'
    ZedPlayerSuicideStinger=AkEvent'WW_UI_Menu.Play_Zed_Player_Suicide'
    WeaponUpgradeStinger=AkEvent'WW_UI_Menu.Play_UI_Weapon_Upgrade'
    PerkPrestigeStinger=AkEvent'WW_UI_Menu.Play_UI_Prestige_Lvl_Reset'
}