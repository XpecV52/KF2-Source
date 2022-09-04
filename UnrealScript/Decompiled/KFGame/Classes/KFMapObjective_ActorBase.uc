/*******************************************************************************
 * KFMapObjective_ActorBase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFMapObjective_ActorBase extends Actor
    abstract
    placeable
    hidecategories(Navigation)
    implements(KFInterface_MapObjective);

/** ============================================================================= Common objective variables============================================================================= */
var() string LocalizationKey;
var() string NameShortLocKey;
var() string DescriptionLocKey;
var() string DescriptionShortLocKey;
var() string LocalizationPackageName;
var() string RequirementsLocKey;
var() bool bIsMissionCriticalObjective;
var bool bIsActive;
/** Whether or not to use the trader trail to lead players to the objective */
var() bool bUseTrailToObjective;
var Texture2D DefaultIcon;
var transient KFReplicatedShowPathActor TrailActor;
var() Texture2D ObjectiveIcon;
var() array< class<KFGameInfo> > GameModeBlacklist;
var() array<float> PerPlayerSpawnRateMod;
var() AkEvent ActivationSoundEvent;
var() AkEvent FailureSoundEvent;
var const Color ObjectiveIconColor;
/** Max reward if users (theoretically) did the objective perfectly */
var() const array<int> DoshRewards;
var const array<int> XPRewards;
var const array<float> DoshDifficultyScalars;
var const array<float> XPDifficultyScalars;
/** Modifies the Dosh value gained for killing zeds while this objective is active */
var() const float DoshValueModifier;

replication
{
     if(bNetInitial)
        bUseTrailToObjective;

     if(bNetDirty)
        bIsActive;
}

simulated function PlayActivationSoundEvent()
{
    if(Role == ROLE_Authority)
    {
        if(ActivationSoundEvent != none)
        {
            PlaySoundBase(ActivationSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
        }
    }
}

simulated function ActivateObjective()
{
    local KFSeqEvent_MapObjectiveActivated ActivationEvent;
    local int I;

    bIsActive = true;
    I = 0;
    J0x17:

    if(I < GeneratedEvents.Length)
    {
        ActivationEvent = KFSeqEvent_MapObjectiveActivated(GeneratedEvents[I]);
        if(ActivationEvent != none)
        {
            ActivationEvent.NotifyActivation(self, self);
        }
        ++ I;
        goto J0x17;
    }
    SetTimer(1, false, 'PlayActivationSoundEvent');
}

simulated function DeactivateObjective()
{
    local KFSeqEvent_MapObjectiveActivated ActivationEvent;
    local int I;

    bIsActive = false;
    I = 0;
    J0x17:

    if(I < GeneratedEvents.Length)
    {
        ActivationEvent = KFSeqEvent_MapObjectiveActivated(GeneratedEvents[I]);
        if(ActivationEvent != none)
        {
            ActivationEvent.NotifyDeactivation(self, self);
        }
        ++ I;
        goto J0x17;
    }
}

simulated function GrantReward(KFPlayerReplicationInfo KFPRI, KFPlayerController KFPC)
{
    if(KFPRI == none)
    {
        return;
    }
    if(KFPRI.bOnlySpectator)
    {
        return;
    }
    KFPRI.AddDosh(GetDoshReward());
    if(KFPC != none)
    {
        KFPC.ClientMapObjectiveCompleted(float(GetXPReward()));
    }
}

simulated function int GetMaxXPReward()
{
    local KFGameReplicationInfo KFGRI;
    local int ArrayEnd;

    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if(KFGRI != none)
    {
        ArrayEnd = Clamp(KFGRI.WaveMax - 2, 0, XPRewards.Length - 1);
        return int(float(XPRewards[Clamp(KFGRI.WaveNum - 1, 0, ArrayEnd)]) * XPDifficultyScalars[KFGRI.GameDifficulty]);
    }
    if(XPRewards.Length > 0)
    {
        return XPRewards[0];
    }
    return 0;
}

simulated function int GetMaxDoshReward()
{
    local KFGameReplicationInfo KFGRI;
    local int ArrayEnd;

    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if(KFGRI != none)
    {
        ArrayEnd = Clamp(KFGRI.WaveMax - 2, 0, DoshRewards.Length - 1);
        return int(float(DoshRewards[Clamp(KFGRI.WaveNum - 1, 0, ArrayEnd)]) * DoshDifficultyScalars[KFGRI.GameDifficulty]);
    }
    if(DoshRewards.Length > 0)
    {
        return DoshRewards[0];
    }
    return 0;
}

simulated function int GetMaxVoshReward()
{
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if(KFGRI != none)
    {
        return Class'KFOnlineStatsWrite'.static.GetMapObjectiveVoshReward(KFGRI.GameDifficulty, KFGRI.WaveNum);
    }
    return 0;
}

simulated function int GetDoshReward()
{
    return GetMaxDoshReward();
}

simulated function int GetVoshReward()
{
    local int MaxVosh;

    MaxVosh = GetMaxVoshReward();
    if(MaxVosh == 0)
    {
        return MaxVosh;
    }
    return int(float(MaxVosh) * (GetProgress()));
}

simulated function int GetXPReward()
{
    local int MaxXP;

    MaxXP = GetMaxXPReward();
    if(MaxXP == 0)
    {
        return MaxXP;
    }
    return int(float(MaxXP) * (GetProgress()));
}

simulated function string GetLocalizedName()
{
    if(LocalizationKey != "")
    {
        return Localize("Objectives", LocalizationKey, LocalizationPackageName);
    }
    return "";
}

simulated function string GetLocalizedShortName()
{
    if(NameShortLocKey != "")
    {
        return Localize("Objectives", NameShortLocKey, LocalizationPackageName);
    }
    return "";
}

simulated function string GetLocalizedDescription()
{
    if(DescriptionLocKey != "")
    {
        return Localize("Objectives", DescriptionLocKey, LocalizationPackageName);
    }
    return "";
}

simulated function string GetLocalizedShortDescription()
{
    if(DescriptionShortLocKey != "")
    {
        return Localize("Objectives", DescriptionShortLocKey, LocalizationPackageName);
    }
    return "";
}

simulated function GetLocalizedStatus(out string StatusMessage, out int bWarning, out int bNotification)
{
    StatusMessage = "";
    if((GetProgress()) >= 1)
    {
        StatusMessage = Localize("Objectives", "KillRemainingZeds", LocalizationPackageName);
        bWarning = 0;
        bNotification = 0;
    }
}

simulated function float GetSpawnRateMod()
{
    local KFGameReplicationInfo KFGRI;
    local int NumPlayersAlive;

    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if(KFGRI != none)
    {
        NumPlayersAlive = Clamp(KFGRI.GetNumPlayersAlive(), 1, PerPlayerSpawnRateMod.Length) - 1;
        if((NumPlayersAlive >= 0) && NumPlayersAlive < PerPlayerSpawnRateMod.Length)
        {
            return PerPlayerSpawnRateMod[NumPlayersAlive];
        }
    }
    return 1;
}

simulated function bool HasFailedObjective()
{
    return (GetLivingPlayerCount()) <= 0;
}

simulated function int GetLivingPlayerCount()
{
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if(KFGRI != none)
    {
        return KFGRI.GetNumPlayersAlive();
    }
    return 0;
}

simulated function bool IsActive()
{
    return bIsActive;
}

simulated function bool UsesProgress();

simulated function bool IsBonus();

function bool CanActivateObjective();

simulated function float GetProgress();

simulated function bool IsComplete();

simulated function float GetActivationPctChance();

simulated function string GetProgressText();

simulated function bool GetProgressTextIsDosh()
{
    return false;
}

simulated function string GetLocalizedRequirements();

simulated function bool GetIsMissionCritical();

simulated function float GetDoshValueModifier()
{
    return DoshValueModifier;
}

function NotifyZedKilled(Controller Killer, Pawn KilledPawn, bool bIsBoss);

simulated function NotifyObjectiveSelected();

simulated function bool ShouldDrawIcon();

simulated function Vector GetIconLocation();

simulated function DrawHUD(KFHUDBase HUD, Canvas DrawCanvas);

simulated function bool HasObjectiveDrawDistance()
{
    return true;
}

simulated function bool ShouldShowObjectiveHUD()
{
    return true;
}

simulated function bool ShouldShowObjectiveContainer()
{
    return true;
}

simulated function Texture2D GetIcon()
{
    return ObjectiveIcon;
}

simulated function Color GetIconColor()
{
    return ObjectiveIconColor;
}

simulated function TriggerObjectiveProgressEvent(optional int EventType, optional float ProgressMade)
{
    local int I, J;
    local array<int> OutputLinksToActivate;
    local KFSeqEvent_ObjectiveProgress ProgressEvent;

    EventType = -1;
    ProgressMade = -1;
    if(EventType >= 0)
    {
        OutputLinksToActivate.AddItem(EventType;
    }
    I = 0;
    J0x42:

    if(I < GeneratedEvents.Length)
    {
        ProgressEvent = KFSeqEvent_ObjectiveProgress(GeneratedEvents[I]);
        if(ProgressEvent != none)
        {
            if(ProgressMade >= 0)
            {
                J = 0;
                J0xAD:

                if(J < ProgressEvent.ProgressThresholds.Length)
                {
                    if(ProgressEvent.ProgressThresholds[J] == ProgressMade)
                    {
                        OutputLinksToActivate.AddItem(ProgressEvent.ProgressOutputStartIndex + J;
                        goto J0x157;
                    }
                    ++ J;
                    goto J0xAD;
                }
            }
            J0x157:

            ProgressEvent.Reset();
            ProgressEvent.CheckActivate(self, self,, OutputLinksToActivate);
        }
        ++ I;
        goto J0x42;
    }
}

defaultproperties
{
    ObjectiveIcon=Texture2D'Objectives_UI.UI_Objectives_ObjectiveMode'
    ObjectiveIconColor=(B=255,G=70,R=185,A=255)
    DoshRewards(0)=200
    DoshRewards(1)=250
    DoshRewards(2)=300
    DoshRewards(3)=350
    DoshRewards(4)=400
    DoshRewards(5)=450
    DoshRewards(6)=500
    DoshRewards(7)=500
    DoshRewards(8)=500
    DoshRewards(9)=500
    DoshRewards(10)=500
    XPRewards(0)=100
    XPRewards(1)=100
    XPRewards(2)=150
    XPRewards(3)=150
    XPRewards(4)=200
    XPRewards(5)=200
    XPRewards(6)=250
    XPRewards(7)=250
    XPRewards(8)=300
    XPRewards(9)=300
    XPRewards(10)=300
    DoshDifficultyScalars(0)=1.2
    DoshDifficultyScalars(1)=1
    DoshDifficultyScalars(2)=1
    DoshDifficultyScalars(3)=0.9
    XPDifficultyScalars(0)=1
    XPDifficultyScalars(1)=1.3
    XPDifficultyScalars(2)=1.75
    XPDifficultyScalars(3)=2
    DoshValueModifier=0.5
    bNoDelete=true
    bSkipActorPropertyReplication=true
    SupportedEvents=/* Array type was not detected. */
}