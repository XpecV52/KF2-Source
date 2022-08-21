/*******************************************************************************
 * KFTraderDialogManager generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFTraderDialogManager extends Actor
    notplaceable
    hidecategories(Navigation);

struct TraderDialogCoolDownInfo
{
    var int EventID;
    var int Priority;
    var float EndTime;

    structdefaultproperties
    {
        EventID=0
        Priority=0
        EndTime=0
    }
};

var bool bEnabled;
var transient array<TraderDialogCoolDownInfo> CoolDowns;
var transient class<KFTraderVoiceGroupBase> TraderVoiceGroupClass;
var transient TraderDialogEventInfo ActiveEventInfo;
var float FewZedsDeadPct;
var float ManyZedsDeadPct;
var float FarFromTraderDistance;
var float NeedHealPct;
var float TeammateNeedsHealPct;
var int ShareDoshAmount;
var int LowDoshAmount;
var float WaveClearDialogDelay;
var int DelayedWaveClearEventID;

simulated function EndOfDialogTimer()
{
    local TraderDialogCoolDownInfo CoolDownInfo;

    CoolDownInfo.EventID = ActiveEventInfo.EventID;
    CoolDownInfo.Priority = ActiveEventInfo.Priority;
    CoolDownInfo.EndTime = WorldInfo.TimeSeconds + ActiveEventInfo.Cooldown;
    CoolDowns.AddItem(CoolDownInfo;
    ActiveEventInfo.AudioCue = none;
}

simulated function bool DialogIsCoolingDown(int EventID)
{
    local int CoolDownIndex;

    CoolDownIndex = CoolDowns.Find('EventID', EventID;
    if(CoolDownIndex == -1)
    {
        return false;
    }
    if(CoolDowns[CoolDownIndex].EndTime <= WorldInfo.TimeSeconds)
    {
        CoolDowns.Remove(CoolDownIndex, 1;
        return false;
    }
    return true;
}

simulated function PlayDialog(int EventID, Controller C)
{
    local KFPawn_Human KFPH;

    if(WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    if(!C.IsLocalController())
    {
        return;
    }
    if(!bEnabled || TraderVoiceGroupClass == none)
    {
        return;
    }
    if((EventID < 0) || EventID >= 154)
    {
        return;
    }
    if(C == none)
    {
        return;
    }
    if((C.Pawn == none) || !C.Pawn.IsAliveAndWell())
    {
        return;
    }
    if(ActiveEventInfo.AudioCue != none)
    {
        return;
    }
    if(DialogIsCoolingDown(EventID))
    {
        return;
    }
    KFPH = KFPawn_Human(C.Pawn);
    if(KFPH != none)
    {
        ActiveEventInfo = TraderVoiceGroupClass.default.DialogEvents[EventID];
        KFPH.PlayTraderDialog(ActiveEventInfo.AudioCue);
        SetTimer(ActiveEventInfo.AudioCue.Duration, false, 'EndOfDialogTimer');
    }
}

static function PlayGlobalDialog(int EventID, WorldInfo WI)
{
    local Controller C;
    local KFPlayerController KFPC;

    foreach WI.AllControllers(Class'Controller', C)
    {
        if(C.bIsPlayer)
        {
            KFPC = KFPlayerController(C);
            if(KFPC == none)
            {
                continue;                
            }
            if(KFPC.IsLocalController())
            {
                KFPC.PlayTraderDialog(EventID);
                continue;
            }
            KFPC.ClientPlayTraderDialog(EventID);
        }        
    }    
}

static function PlayGlobalWaveProgressDialog(int ZedsRemaining, int ZedsTotal, WorldInfo WI)
{
    local float ZedDeadPct, PrevZedDeadPct;

    if(ZedsTotal == 0)
    {
        return;
    }
    ZedDeadPct = 1 - (float(ZedsRemaining) / float(ZedsTotal));
    PrevZedDeadPct = 1 - (float(ZedsRemaining + 1) / float(ZedsTotal));
    if((PrevZedDeadPct < default.ManyZedsDeadPct) && ZedDeadPct >= default.ManyZedsDeadPct)
    {
        PlayGlobalDialog(1, WI);        
    }
    else
    {
        if((PrevZedDeadPct < default.FewZedsDeadPct) && ZedDeadPct >= default.FewZedsDeadPct)
        {
            PlayGlobalDialog(0, WI);
        }
    }
}

simulated function PlayOpenTraderDialog(int WaveNum, int WaveMax, Controller C)
{
    if(WaveNum == (WaveMax - 1))
    {
        PlayDialog(9, C);        
    }
    else
    {
        PlayDialog(2, C);
    }
}

static function PlayApproachTraderDialog(Controller C)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(C);
    if(KFPC == none)
    {
        return;
    }
    if(KFPC.IsLocalController())
    {
        KFPC.PlayTraderDialog(4);        
    }
    else
    {
        KFPC.ClientPlayTraderDialog(4);
    }
}

simulated function PlayCloseTraderDialog(Controller C)
{
    PlayDialog(3, C);
}

simulated function AddRandomOption(int OptionID, out byte NumOptions, out int BestOptionID)
{
    local TraderDialogEventInfo NewOptionEventInfo, BestOptionEventInfo;

    if((OptionID < 0) || TraderVoiceGroupClass == none)
    {
        return;
    }
    if(BestOptionID >= 0)
    {
        NewOptionEventInfo = TraderVoiceGroupClass.default.DialogEvents[OptionID];
        BestOptionEventInfo = TraderVoiceGroupClass.default.DialogEvents[BestOptionID];
        if(NewOptionEventInfo.Priority < BestOptionEventInfo.Priority)
        {
            NumOptions = 0;            
        }
        else
        {
            if(NewOptionEventInfo.Priority > BestOptionEventInfo.Priority)
            {
                return;
            }
        }
    }
    ++ NumOptions;
    if(FRand() <= (1 / float(NumOptions)))
    {
        BestOptionID = OptionID;
    }
}

simulated function PlayTraderTickDialog(int RemainingTime, Controller C, WorldInfo WI)
{
    local Pawn P;
    local KFPawn_Human KFPH, Teammate;
    local KFGameReplicationInfo KFGRI;
    local KFPlayerController KFPC;
    local int BestOptionID;
    local byte NumOptions;

    if(!default.bEnabled)
    {
        return;
    }
    if(RemainingTime == 30)
    {
        PlayDialog(7, C);
        return;
    }
    if(RemainingTime == 10)
    {
        PlayDialog(8, C);
        return;
    }
    KFPC = KFPlayerController(C);
    if(KFPC == none)
    {
        return;
    }
    if(KFPC.bClientTraderMenuOpen)
    {
        return;
    }
    KFPH = KFPawn_Human(C.Pawn);
    if(KFPH == none)
    {
        return;
    }
    BestOptionID = -1;
    if(KFPH.GetHealthPercentage() < default.NeedHealPct)
    {
        AddRandomOption(15, NumOptions, BestOptionID);
    }
    KFGRI = KFGameReplicationInfo(WI.GRI);
    if((KFGRI != none) && KFGRI.OpenedTrader != none)
    {
        if(VSize(KFGRI.OpenedTrader.Location - KFPH.Location) >= default.FarFromTraderDistance)
        {
            AddRandomOption(10, NumOptions, BestOptionID);
        }
    }
    P = WI.PawnList;
    J0x25B:

    if(P != none)
    {
        if(KFPH == P)
        {            
        }
        else
        {
            if(P.GetTeamNum() != 0)
            {                
            }
            else
            {
                if(!P.IsAliveAndWell())
                {                    
                }
                else
                {
                    Teammate = KFPawn_Human(P);
                    if(Teammate == none)
                    {                        
                    }
                    else
                    {
                        if(Teammate.GetHealthPercentage() < default.TeammateNeedsHealPct)
                        {
                            AddRandomOption(16, NumOptions, BestOptionID);
                            goto J0x37F;
                        }
                    }
                }
            }
        }
        P = P.NextPawn;
        goto J0x25B;
    }
    J0x37F:

    PlayDialog(BestOptionID, C);
}

simulated function PlayBeginTraderTimeDialog(KFPlayerController KFPC)
{
    if(!default.bEnabled)
    {
        return;
    }
    if(KFPC.PWRI.bDiedDuringWave)
    {
        PlayPlayerDiedLastWaveDialog(KFPC);        
    }
    else
    {
        PlayPlayerSurvivedLastWaveDialog(KFPC);
    }
}

simulated function PlayPlayerDiedLastWaveDialog(KFPlayerController KFPC)
{
    local int BestOptionID;
    local byte NumOptions;

    BestOptionID = -1;
    if(KFPC.PWRI.ClassKilledByLastWave != none)
    {
        AddRandomOption(KFPC.PWRI.ClassKilledByLastWave.static.GetTraderAdviceID(), NumOptions, BestOptionID);
    }
    if(KFPC.MatchStats.DeathStreak >= 3)
    {
        AddRandomOption(24, NumOptions, BestOptionID);        
    }
    else
    {
        AddRandomOption(20, NumOptions, BestOptionID);
    }
    PlayWaveClearDialog(BestOptionID, KFPC);
}

simulated function PlayPlayerSurvivedLastWaveDialog(KFPlayerController KFPC)
{
    local int BestOptionID;
    local byte NumOptions;
    local KFPawn_Human KFPH;

    BestOptionID = -1;
    KFPH = KFPawn_Human(KFPC.Pawn);
    if(KFPC.MatchStats.GetHealGivenInWave() >= 200)
    {
        AddRandomOption(18, NumOptions, BestOptionID);
    }
    if(KFPC.MatchStats.SurvivedStreak >= 3)
    {
        AddRandomOption(23, NumOptions, BestOptionID);
    }
    if(KFPC.MatchStats.GetDamageTakenInWave() == 0)
    {
        AddRandomOption(26, NumOptions, BestOptionID);        
    }
    else
    {
        if(KFPC.MatchStats.GetDamageTakenInWave() < (KFPH.HealthMax / 2))
        {
            AddRandomOption(28, NumOptions, BestOptionID);
        }
    }
    if(KFPC.MatchStats.GetDamageTakenInWave() >= 300)
    {
        AddRandomOption(29, NumOptions, BestOptionID);
    }
    if((KFPC.MatchStats.GetDamageTakenInWave() >= 100) && KFPC.MatchStats.GetHealReceivedInWave() >= 100)
    {
        AddRandomOption(30, NumOptions, BestOptionID);
    }
    if(KFPC.PWRI.bKilledFleshpoundLastWave)
    {
        AddRandomOption(32, NumOptions, BestOptionID);
    }
    if(KFPC.PWRI.bKilledScrakeLastWave)
    {
        AddRandomOption(33, NumOptions, BestOptionID);
    }
    if(KFPH.PlayerReplicationInfo.Score < float(default.LowDoshAmount))
    {
        AddRandomOption(34, NumOptions, BestOptionID);
    }
    if(!IsSoloHumanPlayer())
    {
        if(KFPC.PWRI.bKilledMostZeds)
        {
            AddRandomOption(21, NumOptions, BestOptionID);
        }
        if(KFPC.PWRI.bEarnedMostDosh)
        {
            AddRandomOption(31, NumOptions, BestOptionID);
        }
        if(KFPC.PWRI.bBestTeammate)
        {
            AddRandomOption(22, NumOptions, BestOptionID);
        }
        if(KFPH.PlayerReplicationInfo.Score >= float(default.ShareDoshAmount))
        {
            AddRandomOption(17, NumOptions, BestOptionID);
        }
        if(KFPC.PWRI.bAllSurvivedLastWave)
        {
            AddRandomOption(25, NumOptions, BestOptionID);            
        }
        else
        {
            if(KFPC.PWRI.bSomeSurvivedLastWave)
            {
                AddRandomOption(27, NumOptions, BestOptionID);                
            }
            else
            {
                if(KFPC.PWRI.bOneSurvivedLastWave)
                {
                    AddRandomOption(19, NumOptions, BestOptionID);
                }
            }
        }
    }
    PlayWaveClearDialog(BestOptionID, KFPC);
}

function bool IsSoloHumanPlayer()
{
    local int I, NumHumans;
    local PlayerReplicationInfo PRI;

    if(WorldInfo.NetMode == NM_Standalone)
    {
        return true;
    }
    I = 0;
    J0x36:

    if((I < WorldInfo.GRI.PRIArray.Length) && NumHumans < 2)
    {
        PRI = WorldInfo.GRI.PRIArray[I];
        if(((PRI != none) && !PRI.bOnlySpectator) && PRI.GetTeamNum() == 0)
        {
            ++ NumHumans;
        }
        ++ I;
        goto J0x36;
    }
    return NumHumans == 1;
}

simulated function PlayWaveClearDialog(int EventID, Controller C)
{
    if((C != none) && C.IsLocalController())
    {
        DelayedWaveClearEventID = EventID;
        SetTimer(WaveClearDialogDelay, false, 'WaveClearDialogTimer');
    }
}

simulated function WaveClearDialogTimer()
{
    PlayDialog(DelayedWaveClearEventID, WorldInfo.GetALocalPlayerController());
}

simulated function PlayOpenTraderMenuDialog(KFPlayerController KFPC)
{
    local KFPawn_Human KFPH;
    local float ArmorPct, AmmoMax, AmmoPct;
    local int BestOptionID;
    local byte NumOptions;

    BestOptionID = -1;
    KFPH = KFPawn_Human(KFPC.Pawn);
    if(KFPH != none)
    {
        ArmorPct = float(KFPH.Armor) / float(KFPH.MaxArmor);
        if(ArmorPct <= 0)
        {
            AddRandomOption(11, NumOptions, BestOptionID);            
        }
        else
        {
            if(ArmorPct < 0.3)
            {
                AddRandomOption(12, NumOptions, BestOptionID);
            }
        }
        AmmoMax = float(KFPH.MyKFWeapon.GetMaxAmmoAmount(0));
        if(AmmoMax > float(0))
        {
            AmmoPct = KFPH.MyKFWeapon.GetAmmoPercentage(0);
            if(AmmoPct < 0.3)
            {
                AddRandomOption(13, NumOptions, BestOptionID);
            }
        }
        if(!KFPH.MyKFWeapon.HasAmmo(4))
        {
            AddRandomOption(14, NumOptions, BestOptionID);
        }
    }
    PlayDialog(BestOptionID, KFPC);
}

simulated function PlayObjectiveDialog(Controller C, int ObjDialogID)
{
    PlayDialog(ObjDialogID, C);
}

simulated function PlaySelectItemDialog(Controller C, bool bTooExpensive, bool bTooHeavy)
{
    local int BestOptionID;
    local byte NumOptions;

    BestOptionID = -1;
    if(bTooExpensive)
    {
        AddRandomOption(5, NumOptions, BestOptionID);
    }
    if(bTooHeavy)
    {
        AddRandomOption(6, NumOptions, BestOptionID);
    }
    PlayDialog(BestOptionID, C);
}

defaultproperties
{
    bEnabled=true
    FewZedsDeadPct=0.2
    ManyZedsDeadPct=0.8
    FarFromTraderDistance=50000
    NeedHealPct=0.5
    TeammateNeedsHealPct=0.5
    ShareDoshAmount=2000
    LowDoshAmount=200
    WaveClearDialogDelay=7
    CollisionType=ECollisionType.COLLIDE_CustomDefault
}