/*******************************************************************************
 * KFMapObjective_EscortPawns generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFMapObjective_EscortPawns extends KFMapObjective_ActorBase
    hidecategories(Navigation);

/** Scripted pawn spawners that will spawn the escorts related to this objective */
var() array<KFScriptedPawnSpawner> EscortPawnSpawners;
/** How many escorts need to be escorted successfully for the objective to be completed. */
var() int NumEscortsRequired;
var int NumEscortsAccomplished;
var int NumEscortsFinished;
var float Progress;
var repnotify transient Actor ActiveEscortActor;
var float CompletionPct;
/** Sound to play when escort is 100% done and in perfect health */
var() AkEvent ProgressSoundEvent100pctPerfect;
/** Sound to play when escort is 100% done */
var() AkEvent ProgressSoundEvent100pct;
/** Sound to play when escort is 100% done and in poor health */
var() AkEvent ProgressSoundEvent100pctPoor;
/** Sound to play when escort is 85% done and in perfect health */
var() AkEvent ProgressSoundEvent85pctPerfect;
/** Sound to play when escort is 85% done */
var() AkEvent ProgressSoundEvent85pct;
/** Sound to play when escort is 85% done and in poor health */
var() AkEvent ProgressSoundEvent85pctPoor;
/** Sound to play when escort is 50% done and in perfect health */
var() AkEvent ProgressSoundEvent50pctPerfect;
/** Sound to play when escort is 50% done */
var() AkEvent ProgressSoundEvent50pct;
/** Sound to play when escort is 50% done and in poor health */
var() AkEvent ProgressSoundEvent50pctPoor;
/** Sound to play when escort is 25% done and in perfect health */
var() AkEvent ProgressSoundEvent25pctPerfect;
/** Sound to play when escort is 25% done */
var() AkEvent ProgressSoundEvent25pct;
/** Sound to play when escort is 25% done and in poor health */
var() AkEvent ProgressSoundEvent25pctPoor;
/** Percentage of escort health considered to be "poor," used for the "poor" progress sound events */
var() float PoorHealthPctThreshold;
/** Sound to play when escort takes damage */
var() AkEvent EscortPawnTakeDamageEvent;
/** Cooldown period for the "take damage" sound event */
var() float EscortPawnTakeDamageEventCooldown;
/** Sound to play to remind players that escort is in critical condition */
var() AkEvent EscortPawnCriticalReminderEvent;
/** How frequently to remind players that escort is in critical condition */
var() float EscortPawnCriticalReminderEventInterval;
var repnotify int CompletionProgressIdx;
var repnotify int HealthProgressIdx;

replication
{
     if(bNetDirty)
        ActiveEscortActor, CompletionPct, 
        CompletionProgressIdx, HealthProgressIdx, 
        Progress;
}

simulated function ReplicatedEvent(name VarName)
{
    switch(VarName)
    {
        case 'ActiveEscortActor':
            UpdateTrailActor();
            break;
        case 'CompletionProgressIdx':
            TriggerCompletionPctProgress();
            break;
        case 'HealthProgressIdx':
            TriggerHealthPctProgress();
            break;
        default:
            super(Actor).ReplicatedEvent(VarName);
            break;
    }
}

function CheckCompletionPctProgress(float PrevCompletionPct, float CurrCompletionPct)
{
    local int PrevCompletionProgressIdx, GenEvtIdx, I;
    local KFSeqEvent_EscortPawnsCompletionPct GenEvt;

    PrevCompletionProgressIdx = CompletionProgressIdx;
    GenEvtIdx = 0;
    J0x1E:

    if(GenEvtIdx < GeneratedEvents.Length)
    {
        GenEvt = KFSeqEvent_EscortPawnsCompletionPct(GeneratedEvents[GenEvtIdx]);
        if(GenEvt != none)
        {
            I = 0;
            J0x76:

            if(I < GenEvt.ProgressThresholds.Length)
            {
                if((PrevCompletionPct < GenEvt.ProgressThresholds[I]) && CurrCompletionPct >= GenEvt.ProgressThresholds[I])
                {
                    CompletionProgressIdx = GenEvt.ProgressOutputStartIndex + I;
                    goto J0x155;
                }
                ++ I;
                goto J0x76;
            }
            J0x155:

            goto J0x166;
        }
        ++ GenEvtIdx;
        goto J0x1E;
    }
    J0x166:

    if(CompletionProgressIdx != PrevCompletionProgressIdx)
    {
        TriggerCompletionPctProgress();
    }
}

simulated function TriggerCompletionPctProgress()
{
    local int GenEvtIdx;
    local KFSeqEvent_EscortPawnsCompletionPct GenEvt;
    local array<int> ActivateIndices;

    ActivateIndices.AddItem(CompletionProgressIdx;
    GenEvtIdx = 0;
    J0x21:

    if(GenEvtIdx < GeneratedEvents.Length)
    {
        GenEvt = KFSeqEvent_EscortPawnsCompletionPct(GeneratedEvents[GenEvtIdx]);
        if(GenEvt != none)
        {
            GenEvt.Reset();
            GenEvt.CheckActivate(self, self,, ActivateIndices);
        }
        ++ GenEvtIdx;
        goto J0x21;
    }
}

function CheckHealthPctProgress(float PrevHealthPct, float CurrHealthPct)
{
    local int PrevHealthProgressIdx, GenEvtIdx, I;
    local KFSeqEvent_EscortPawnsHealthPct GenEvt;

    PrevHealthProgressIdx = HealthProgressIdx;
    GenEvtIdx = 0;
    J0x1E:

    if(GenEvtIdx < GeneratedEvents.Length)
    {
        GenEvt = KFSeqEvent_EscortPawnsHealthPct(GeneratedEvents[GenEvtIdx]);
        if(GenEvt != none)
        {
            if(GenEvt.bUseReverseProgress)
            {
                I = 0;
                J0x98:

                if(I < GenEvt.ProgressThresholds.Length)
                {
                    if((PrevHealthPct >= GenEvt.ProgressThresholds[I]) && CurrHealthPct < GenEvt.ProgressThresholds[I])
                    {
                        HealthProgressIdx = -(GenEvt.ProgressOutputStartIndex + I) + 1;
                        goto J0x17C;
                    }
                    ++ I;
                    goto J0x98;
                }
                J0x17C:
                
            }
            else
            {
                I = 0;
                J0x18A:

                if(I < GenEvt.ProgressThresholds.Length)
                {
                    if((PrevHealthPct < GenEvt.ProgressThresholds[I]) && CurrHealthPct >= GenEvt.ProgressThresholds[I])
                    {
                        HealthProgressIdx = (GenEvt.ProgressOutputStartIndex + I) + 1;
                        goto J0x26C;
                    }
                    ++ I;
                    goto J0x18A;
                }
            }
            J0x26C:

            if(HealthProgressIdx != PrevHealthProgressIdx)
            {
                TriggerHealthPctProgress();
                goto J0x29E;
            }
        }
        ++ GenEvtIdx;
        goto J0x1E;
    }
    J0x29E:

}

simulated function TriggerHealthPctProgress()
{
    local int GenEvtIdx;
    local KFSeqEvent_EscortPawnsHealthPct GenEvt;
    local array<int> ActivateIndices;

    ActivateIndices.AddItem(Max(HealthProgressIdx, -HealthProgressIdx) - 1;
    GenEvtIdx = 0;
    J0x31:

    if(GenEvtIdx < GeneratedEvents.Length)
    {
        GenEvt = KFSeqEvent_EscortPawnsHealthPct(GeneratedEvents[GenEvtIdx]);
        if(GenEvt != none)
        {
            if((GenEvt.bUseReverseProgress && HealthProgressIdx < 0) || !GenEvt.bUseReverseProgress && HealthProgressIdx > 0)
            {
                GenEvt.Reset();
                GenEvt.CheckActivate(self, self,, ActivateIndices);
            }
        }
        ++ GenEvtIdx;
        goto J0x31;
    }
}

simulated function ActivateObjective()
{
    local KFScriptedPawnSpawner EscortPawnStart;

    super.ActivateObjective();
    if(Role == ROLE_Authority)
    {
        bIsActive = true;
        NumEscortsAccomplished = 0;
        NumEscortsFinished = 0;
        foreach EscortPawnSpawners(EscortPawnStart,)
        {
            EscortPawnStart.__Delegate_OnPawnStartedRoute__Delegate = OnEscortStarted;
            EscortPawnStart.__Delegate_OnPawnReachedRouteMarker__Delegate = OnEscortReachedRouteMarker;
            EscortPawnStart.__Delegate_OnPawnReachedGoal__Delegate = OnEscortReachedGoal;
            EscortPawnStart.__Delegate_OnPawnEndedRoute__Delegate = OnEscortEndedRoute;
            if(EscortPawnStart.bReachedGoal)
            {
                EscortPawnStart.bReachedStart = false;
                EscortPawnStart.bReachedGoal = false;
                EscortPawnStart.RouteDistTraversed = 0;
            }
            if((EscortPawnStart.Pawn != none) && EscortPawnStart.bReachedStart)
            {
                OnEscortStarted(EscortPawnStart.Pawn);
            }            
        }        
    }
}

simulated function DeactivateObjective()
{
    local KFPawn_Human KFPH;

    super.DeactivateObjective();
    if(Role == ROLE_Authority)
    {
        bIsActive = false;
        if(NumEscortsAccomplished >= NumEscortsRequired)
        {
            foreach WorldInfo.AllPawns(Class'KFPawn_Human', KFPH)
            {
                GrantReward(KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo), KFPlayerController(KFPH.Controller));                
            }                        
        }
        else
        {
            if(FailureSoundEvent != none)
            {
                PlaySoundBase(FailureSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
            }
        }
    }
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(TrailActor != none)
        {
            TrailActor.Destroy();
            TrailActor = none;
        }
        if(ActiveEscortActor != none)
        {
            KFPawn_Scripted(ActiveEscortActor).RemoveEscortPawnOnHud();
        }
    }
}

simulated function bool IsActive()
{
    return bIsActive;
}

simulated function bool UsesProgress()
{
    return true;
}

simulated function bool IsBonus();

function bool CanActivateObjective()
{
    return !IsCurrentGameModeBlacklisted();
}

function bool IsCurrentGameModeBlacklisted()
{
    local class<KFGameInfo> CurrGameClass;

    foreach GameModeBlacklist(CurrGameClass,)
    {
        if(CurrGameClass == WorldInfo.GRI.GameClass)
        {            
            return true;
        }        
    }    
    return false;
}

simulated function float GetProgress()
{
    return FClamp(Progress, 0, 1);
}

simulated function bool IsComplete()
{
    return (GetProgress()) >= 1;
}

simulated function float GetActivationPctChance()
{
    return 1;
}

simulated function string GetProgressText()
{
    return string(int((GetProgress()) * float(100))) $ "%";
}

simulated function string GetLocalizedRequirements()
{
    return "";
}

simulated function GetLocalizedStatus(out string StatusMessage, out int bWarning, out int bNotification)
{
    local KFPawn_Scripted ActiveScriptedPawn;

    StatusMessage = "";
    if((GetProgress()) >= 1)
    {
        StatusMessage = Localize("Objectives", "KillRemainingZeds", LocalizationPackageName);
        bWarning = 0;
        bNotification = 0;
        return;
    }
    ActiveScriptedPawn = KFPawn_Scripted(ActiveEscortActor);
    if(ActiveScriptedPawn != none)
    {
        if(ActiveScriptedPawn.GetHealthPercent() <= 0.01)
        {
            StatusMessage = Localize("Objectives", "NeedsRepair", LocalizationPackageName);
            bWarning = 1;
            return;            
        }
        else
        {
            if(ActiveScriptedPawn.GetHealthPercent() <= 0.25)
            {
                StatusMessage = Localize("Objectives", "LowHealth", LocalizationPackageName);
                bWarning = 1;
                return;
            }
        }
        if(ActiveScriptedPawn.SpeedScalarForObstacles <= 0)
        {
            StatusMessage = Localize("Objectives", "Stopped", LocalizationPackageName);
            bWarning = 1;
            return;
        }
        if(ActiveScriptedPawn.IsBlockedByZed())
        {
            StatusMessage = Localize("Objectives", "Blocked", LocalizationPackageName);
            bWarning = 1;
            return;
        }
        if(ActiveScriptedPawn.WasAttackedRecently())
        {
            StatusMessage = Localize("Objectives", "BeingAttacked", LocalizationPackageName);
            bWarning = 1;
            return;
        }
    }
}

simulated function bool ShouldDrawIcon();

simulated function Vector GetIconLocation();

simulated function Texture2D GetIcon()
{
    if(ActiveEscortActor != none)
    {
        return KFPawn_Scripted(ActiveEscortActor).GetStateIconTexture();
    }
    return DefaultIcon;
}

function OnEscortStarted(KFPawn_Scripted StartedPawn)
{
    ActiveEscortActor = StartedPawn;
    StartedPawn.SetActive(true);
    UpdateTrailActor();
    StartedPawn.__Delegate_OnTakeDamage__Delegate = OnEscortTakeDamage;
    StartedPawn.__Delegate_OnHealDamage__Delegate = OnEscortHealDamage;
    StartedPawn.__Delegate_OnChangeState__Delegate = OnEscortChangeState;
    OnEscortChangeState(0, 0);
}

function OnEscortReachedRouteMarker(int MarkerIdx, SplineActor Marker, int SubIdx)
{
    local float PawnsProgress;
    local KFScriptedPawnSpawner EscortPawnSpawner;
    local float ActivePawnHealthPct;

    foreach EscortPawnSpawners(EscortPawnSpawner,)
    {
        PawnsProgress += (EscortPawnSpawner.GetProgress() / float(EscortPawnSpawners.Length));        
    }    
    ActivePawnHealthPct = float(KFPawn_Scripted(ActiveEscortActor).Health) / float(KFPawn_Scripted(ActiveEscortActor).HealthMax);
    CheckCompletionPctProgress(Progress, PawnsProgress);
    CompletionPct = ActivePawnHealthPct;
    if((Progress < 0.25) && PawnsProgress >= 0.25)
    {
        if((ActivePawnHealthPct > 0.99) && ProgressSoundEvent25pctPerfect != none)
        {
            PlaySoundBase(ProgressSoundEvent25pctPerfect, false, WorldInfo.NetMode == NM_DedicatedServer);            
        }
        else
        {
            if((ActivePawnHealthPct > PoorHealthPctThreshold) && ProgressSoundEvent25pct != none)
            {
                PlaySoundBase(ProgressSoundEvent25pct, false, WorldInfo.NetMode == NM_DedicatedServer);                
            }
            else
            {
                if(ProgressSoundEvent25pctPoor != none)
                {
                    PlaySoundBase(ProgressSoundEvent25pctPoor, false, WorldInfo.NetMode == NM_DedicatedServer);
                }
            }
        }        
    }
    else
    {
        if((Progress < 0.5) && PawnsProgress >= 0.5)
        {
            if((ActivePawnHealthPct > 0.99) && ProgressSoundEvent50pctPerfect != none)
            {
                PlaySoundBase(ProgressSoundEvent50pctPerfect, false, WorldInfo.NetMode == NM_DedicatedServer);                
            }
            else
            {
                if((ActivePawnHealthPct > PoorHealthPctThreshold) && ProgressSoundEvent50pct != none)
                {
                    PlaySoundBase(ProgressSoundEvent50pct, false, WorldInfo.NetMode == NM_DedicatedServer);                    
                }
                else
                {
                    if(ProgressSoundEvent50pctPoor != none)
                    {
                        PlaySoundBase(ProgressSoundEvent50pctPoor, false, WorldInfo.NetMode == NM_DedicatedServer);
                    }
                }
            }            
        }
        else
        {
            if((Progress < 0.85) && PawnsProgress >= 0.85)
            {
                if((ActivePawnHealthPct > 0.99) && ProgressSoundEvent85pctPerfect != none)
                {
                    PlaySoundBase(ProgressSoundEvent85pctPerfect, false, WorldInfo.NetMode == NM_DedicatedServer);                    
                }
                else
                {
                    if((ActivePawnHealthPct > PoorHealthPctThreshold) && ProgressSoundEvent85pct != none)
                    {
                        PlaySoundBase(ProgressSoundEvent85pct, false, WorldInfo.NetMode == NM_DedicatedServer);                        
                    }
                    else
                    {
                        if(ProgressSoundEvent85pctPoor != none)
                        {
                            PlaySoundBase(ProgressSoundEvent85pctPoor, false, WorldInfo.NetMode == NM_DedicatedServer);
                        }
                    }
                }                
            }
            else
            {
                if((Progress < 1) && PawnsProgress >= 1)
                {
                    if((ActivePawnHealthPct > 0.99) && ProgressSoundEvent100pctPerfect != none)
                    {
                        PlaySoundBase(ProgressSoundEvent100pctPerfect, false, WorldInfo.NetMode == NM_DedicatedServer);                        
                    }
                    else
                    {
                        if((ActivePawnHealthPct > PoorHealthPctThreshold) && ProgressSoundEvent100pct != none)
                        {
                            PlaySoundBase(ProgressSoundEvent100pct, false, WorldInfo.NetMode == NM_DedicatedServer);                            
                        }
                        else
                        {
                            if(ProgressSoundEvent100pctPoor != none)
                            {
                                PlaySoundBase(ProgressSoundEvent100pctPoor, false, WorldInfo.NetMode == NM_DedicatedServer);
                            }
                        }
                    }
                }
            }
        }
    }
    Progress = PawnsProgress;
}

function OnEscortReachedGoal()
{
    OnEscortEndedRoute(true);
}

function OnEscortEndedRoute(bool bSuccess)
{
    local KFGameReplicationInfo KFGRI;

    ++ NumEscortsFinished;
    if(bSuccess)
    {
        ++ NumEscortsAccomplished;
        TriggerObjectiveProgressEvent();
    }
    if(((NumEscortsAccomplished >= NumEscortsRequired) || NumEscortsFinished == EscortPawnSpawners.Length) || ((EscortPawnSpawners.Length - NumEscortsFinished) + NumEscortsAccomplished) < NumEscortsRequired)
    {
        KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
        if(KFGRI != none)
        {
            Progress = 1;
            KFGRI.DeactivateObjective();
        }
    }
    ActiveEscortActor = none;
    UpdateTrailActor();
    ClearTimer('Timer_EscortPawnTakeDamageEventCooldown');
    ClearTimer('Timer_EscortPawnCriticalReminderEventInterval');
}

function OnEscortTakeDamage(int Damage)
{
    local KFPawn_Scripted KFPS;
    local float PrevHealthPct, CurrHealthPct;

    if((EscortPawnTakeDamageEvent != none) && !IsTimerActive('Timer_EscortPawnTakeDamageEventCooldown'))
    {
        PlaySoundBase(EscortPawnTakeDamageEvent,, WorldInfo.NetMode == NM_DedicatedServer);
        SetTimer(EscortPawnTakeDamageEventCooldown, false, 'Timer_EscortPawnTakeDamageEventCooldown');
    }
    KFPS = KFPawn_Scripted(ActiveEscortActor);
    PrevHealthPct = float(KFPS.Health + Damage) / float(KFPS.HealthMax);
    CurrHealthPct = float(KFPS.Health) / float(KFPS.HealthMax);
    CheckHealthPctProgress(PrevHealthPct, CurrHealthPct);
}

function Timer_EscortPawnTakeDamageEventCooldown();

function OnEscortHealDamage(int HealAmount)
{
    local KFPawn_Scripted KFPS;
    local float PrevHealthPct, CurrHealthPct;

    KFPS = KFPawn_Scripted(ActiveEscortActor);
    PrevHealthPct = float(KFPS.Health - HealAmount) / float(KFPS.HealthMax);
    CurrHealthPct = float(KFPS.Health) / float(KFPS.HealthMax);
    CheckHealthPctProgress(PrevHealthPct, CurrHealthPct);
}

function OnEscortChangeState(int CurrState, int PrevState)
{
    if(KFPawn_Scripted(ActiveEscortActor).IsInCriticalCondition())
    {
        if((EscortPawnCriticalReminderEvent != none) && !IsTimerActive('Timer_EscortPawnCriticalReminderEventInterval'))
        {
            SetTimer(EscortPawnCriticalReminderEventInterval, true, 'Timer_EscortPawnCriticalReminderEventInterval');
        }        
    }
    else
    {
        ClearTimer('Timer_EscortPawnCriticalReminderEventInterval');
    }
}

function Timer_EscortPawnCriticalReminderEventInterval()
{
    PlaySoundBase(EscortPawnCriticalReminderEvent,, WorldInfo.NetMode == NM_DedicatedServer);
}

simulated function UpdateTrailActor()
{
    if(bUseTrailToObjective && WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(TrailActor == none)
        {
            TrailActor = Class'WorldInfo'.static.GetWorldInfo().Spawn(Class'KFReplicatedShowPathActor', none);
            TrailActor.SetEmitterTemplate(ParticleSystem'FX_Objective_White_Trail');
        }
        TrailActor.SetPathTarget(ActiveEscortActor);
    }
}

simulated function bool GetIsMissionCritical()
{
    return bIsMissionCriticalObjective;
}

defaultproperties
{
    PoorHealthPctThreshold=0.5
    CompletionProgressIdx=999
    HealthProgressIdx=999
    LocalizationKey="EscortPawnsObjective"
    NameShortLocKey="EscortPawnsObjective"
    DescriptionLocKey="EscortPawnsDescription"
    DescriptionShortLocKey="EscortPawnsDescriptionShort"
    LocalizationPackageName="KFGame"
    bIsMissionCriticalObjective=true
    DefaultIcon=Texture2D'Objectives_UI.UI_Objectives_ObjectiveMode'
    GameModeBlacklist=/* Array type was not detected. */
    PerPlayerSpawnRateMod=/* Array type was not detected. */
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
        HiddenGame=true
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
    object end
    // Reference: SpriteComponent'Default__KFMapObjective_EscortPawns.Sprite'
    Components(0)=Sprite
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bAlwaysRelevant=true
    SupportedEvents=/* Array type was not detected. */
}