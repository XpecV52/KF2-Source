/*******************************************************************************
 * KFMapObjective_RepairActors generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFMapObjective_RepairActors extends Actor
    placeable
    hidecategories(Navigation)
    implements(KFInterface_MapObjective);

var() string LocalizationKey;
var() string DescriptionLocKey;
var() string LocalizationPackageName;
var() bool bIsMissionCriticalObjective;
var bool bIsActive;
/** Whether or not to use the trader trail to lead players to the objective */
var() bool bUseTrailToObjective;
/** How many actors needs to be repaired for the objective to be completed, per number of players */
var() const int ActivationsRequiredForPlayerCount[6];
/** A delay from the the start of an objective, so the player can't automatically repair the first actor */
var() float ActivationDelay;
/** A sound to play when this objective is activated */
var() AkEvent ActivationSoundEvent;
/** A sound to play when each repair actor is activated */
var() array<AkEvent> ActorActivationSoundEvents;
/** A sound to play when each repair actor is repaired */
var() array<AkEvent> ActorRepairedSoundEvents;
var int ActivationsRequired;
var int ActorsRepaired;
/** List of all the actors that must be repaired by the user. */
var() array<KFRepairableActor> RepairableActors;
var array<KFRepairableActor> UnusedRepairableActors;
var KFRepairableActor LastRepairedActor;
var repnotify KFRepairableActor CurrentActorToRepair;
var transient KFReplicatedShowPathActor TrailActor;
/** If this is tied to an event, what season are we in? */
var() KFGame.KFGameEngine.SeasonalEventIndex EventSeason;
/** Index if this is tied to a season */
var() int EventIndex;
/** Which game modes should this objective not support. */
var() array< class<KFGameInfo> > GameModeBlacklist;
/** Modify Spawn Rate based on how many players are alive. */
var() array<float> PerPlayerSpawnRateMod;
/** How long until the next repairable actor can be activated. */
var() float TimeUntilNextActivation;
/** Texture to use for the actor icon */
var() Texture2D ObjectiveIcon;
/** A sound to play when the objective is fully complete */
var() AkEvent SuccessSoundEvent100pct;
/** A sound to play when the objective is mostly complete */
var() AkEvent SuccessSoundEvent85pct;
/** A sound to play when the objective is adequately complete */
var() AkEvent SuccessSoundEvent50pct;
/** A sound to play when the objective is barely complete */
var() AkEvent SuccessSoundEvent25pct;
/** A sound to play when the objective is failed */
var() AkEvent FailureSoundEvent;
var float JustWinThreshold;
var float StandardWinThreshold;
var float GoodWinThreshold;

replication
{
     if(bNetInitial)
        ObjectiveIcon;

     if(bNetDirty)
        ActivationsRequired, ActorsRepaired, 
        CurrentActorToRepair, DescriptionLocKey, 
        LocalizationKey, LocalizationPackageName, 
        bIsActive;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'CurrentActorToRepair')
    {
        UpdateTrailActor();        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
}

simulated function ActivateObjective()
{
    local int I, PlayerCount;
    local KFSeqEvent_MapObjectiveActivated ActivationEvent;
    local KFRepairableActor CurrActor;

    foreach RepairableActors(CurrActor,)
    {
        CurrActor.__OnRepairCompelete__Delegate = OnActorRepaired;        
    }    
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(bUseTrailToObjective)
        {
            TrailActor = Class'WorldInfo'.static.GetWorldInfo().Spawn(Class'KFReplicatedShowPathActor', none);
            TrailActor.SetEmitterTemplate(ParticleSystem'FX_Objective_Weld_Trail');
        }
    }
    if(Role == ROLE_Authority)
    {
        PlayerCount = Clamp(KFGameInfo(WorldInfo.Game).GetLivingPlayerCount(), 1, 6) - 1;
        ActivationsRequired = ActivationsRequiredForPlayerCount[PlayerCount];
        ActorsRepaired = 0;
        bIsActive = true;
        if(ActivationDelay > 0)
        {
            SetTimer(ActivationDelay, false, 'ActivateNextRepairableActor');            
        }
        else
        {
            ActivateNextRepairableActor();
        }
        PlaySoundBase(ActivationSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
    }
    I = 0;
    J0x20C:

    if(I < GeneratedEvents.Length)
    {
        ActivationEvent = KFSeqEvent_MapObjectiveActivated(GeneratedEvents[I]);
        if(ActivationEvent != none)
        {
            ActivationEvent.NotifyActivation(self, self);
        }
        ++ I;
        goto J0x20C;
    }
}

simulated function DeactivateObjective()
{
    local KFPlayerController KFPC;
    local KFPawn_Human KFPH;
    local KFRepairableActor CurrActor;
    local int I;
    local KFSeqEvent_MapObjectiveActivated ActivationEvent;

    if(Role == ROLE_Authority)
    {
        bIsActive = false;
        if(!HasFailedObjective())
        {
            foreach WorldInfo.AllPawns(Class'KFPawn_Human', KFPH)
            {
                if(KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo) == none)
                {
                    continue;                    
                }
                if(KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo).bOnlySpectator)
                {
                    continue;                    
                }
                KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo).AddDosh(GetDoshReward());
                KFPlayerController(KFPH.Controller).ClientMapObjectiveCompleted(float(GetXPReward()));
                if(KFPlayerController(KFPH.Controller) != none)
                {
                    if((GetTotalProgress()) >= 1)
                    {
                    }
                }                
            }                        
        }
        else
        {
            LogInternal("objective failed");
        }
        PlayDeactivationDialog();
        ClearTimer('ActivateNextRepairableActor');
    }
    foreach RepairableActors(CurrActor,)
    {
        CurrActor.Reset();        
    }    
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(TrailActor != none)
        {
            TrailActor.Destroy();
            TrailActor = none;
        }
    }
    I = 0;
    J0x282:

    if(I < GeneratedEvents.Length)
    {
        ActivationEvent = KFSeqEvent_MapObjectiveActivated(GeneratedEvents[I]);
        if(ActivationEvent != none)
        {
            ActivationEvent.NotifyDeactivation(self, self);
        }
        ++ I;
        goto J0x282;
    }
    KFPC = KFPlayerController(GetALocalPlayerController());
    if((KFPC != none) && KFPC.myGfxHUD != none)
    {
        KFPC.myGfxHUD.WaveInfoWidget.ObjectiveContainer.SetFailState(HasFailedObjective());
    }
}

function PlayDeactivationDialog()
{
    if((GetTotalProgress()) <= 0)
    {
        PlaySoundBase(FailureSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
        BroadcastLocalizedMessage(Class'KFLocalMessage_Priority', 6);        
    }
    else
    {
        if((GetTotalProgress()) <= JustWinThreshold)
        {
            PlaySoundBase(SuccessSoundEvent25pct, false, WorldInfo.NetMode == NM_DedicatedServer);            
        }
        else
        {
            if((GetTotalProgress()) <= StandardWinThreshold)
            {
                PlaySoundBase(SuccessSoundEvent50pct, false, WorldInfo.NetMode == NM_DedicatedServer);                
            }
            else
            {
                if((GetTotalProgress()) <= GoodWinThreshold)
                {
                    PlaySoundBase(SuccessSoundEvent85pct, false, WorldInfo.NetMode == NM_DedicatedServer);                    
                }
                else
                {
                    PlaySoundBase(SuccessSoundEvent100pct, false, WorldInfo.NetMode == NM_DedicatedServer);
                }
            }
        }
    }
}

function ActivateNextRepairableActor()
{
    if(Role == ROLE_Authority)
    {
        LastRepairedActor = CurrentActorToRepair;
        CurrentActorToRepair = ChooseNextActorToRepair();
        if(CurrentActorToRepair != none)
        {
            CurrentActorToRepair.PlayDestroyed();
        }
        if(ActorsRepaired < ActorActivationSoundEvents.Length)
        {
            PlaySoundBase(ActorActivationSoundEvents[ActorsRepaired], false, WorldInfo.NetMode == NM_DedicatedServer);
        }
    }
    UpdateTrailActor();
}

simulated function UpdateTrailActor()
{
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(TrailActor != none)
        {
            TrailActor.SetPathTarget(CurrentActorToRepair.RepairTrigger);
        }
    }
}

function KFRepairableActor ChooseNextActorToRepair()
{
    local int ChosenActorIndex;
    local KFRepairableActor ChosenActor;
    local array<KFRepairableActor> ValidActors;

    if(RepairableActors.Length == 0)
    {
        return none;
    }
    if(UnusedRepairableActors.Length == 0)
    {
        UnusedRepairableActors = RepairableActors;
    }
    ValidActors = UnusedRepairableActors;
    if(ValidActors.Length > 1)
    {
        ValidActors.RemoveItem(LastRepairedActor;
    }
    ChosenActorIndex = int(RandRange(0, float(ValidActors.Length - 1)));
    ChosenActor = ValidActors[ChosenActorIndex];
    UnusedRepairableActors.Remove(ChosenActorIndex, 1;
    return ChosenActor;
}

function OnActorRepaired(KFRepairableActor RepairedActor)
{
    local KFGameReplicationInfo KFGRI;

    if(!bIsActive)
    {
        return;
    }
    if(Role == ROLE_Authority)
    {
        if(ActorsRepaired < ActorRepairedSoundEvents.Length)
        {
            PlaySoundBase(ActorRepairedSoundEvents[ActorsRepaired], false, WorldInfo.NetMode == NM_DedicatedServer);
        }
    }
    ++ ActorsRepaired;
    if((GetTotalProgress()) >= 1)
    {
        KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
        if(KFGRI != none)
        {
            KFGRI.DeactivateObjective();
        }        
    }
    else
    {
        if(TimeUntilNextActivation > 0)
        {
            SetTimer(TimeUntilNextActivation, false, 'ActivateNextRepairableActor');
            CurrentActorToRepair = none;
            UpdateTrailActor();            
        }
        else
        {
            ActivateNextRepairableActor();
        }
    }
}

simulated function bool IsActive()
{
    return bIsActive;
}

simulated function bool IsBonus()
{
    return true;
}

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

simulated function bool UsesProgress()
{
    return true;
}

simulated function float GetProgress()
{
    if(CurrentActorToRepair != none)
    {
        return FClamp(float(CurrentActorToRepair.WeldIntegrity) / float(CurrentActorToRepair.MaxWeldIntegrity), 0, 1);
    }
    return 0;
}

simulated function bool IsComplete()
{
    return (GetProgress()) >= 1;
}

simulated function float GetTotalProgress()
{
    if(ActivationsRequired == 0)
    {
        return 0;
    }
    return float(ActorsRepaired) / float(ActivationsRequired);
}

simulated function float GetActivationPctChance()
{
    return 1;
}

simulated function string GetLocalizedDescription()
{
    return Localize("Objectives", DescriptionLocKey, LocalizationPackageName);
}

simulated function string GetLocalizedRequirements()
{
    return "";
}

simulated function string GetLocalizedName()
{
    return Localize("Objectives", LocalizationKey, LocalizationPackageName);
}

simulated function bool ShouldDrawIcon()
{
    return CurrentActorToRepair != none;
}

simulated function Vector GetIconLocation()
{
    if(CurrentActorToRepair != none)
    {
        return CurrentActorToRepair.Location + CurrentActorToRepair.IconLocationOffset;
    }
    return Location;
}

simulated function Texture2D GetIcon()
{
    return ObjectiveIcon;
}

simulated function int GetDoshReward()
{
    local int MaxDosh;

    MaxDosh = GetMaxDoshReward();
    if(MaxDosh == 0)
    {
        return MaxDosh;
    }
    return int(float(MaxDosh) * (GetTotalProgress()));
}

simulated function int GetMaxDoshReward()
{
    return 300;
}

simulated function int GetVoshReward()
{
    local int MaxDosh;

    MaxDosh = GetMaxVoshReward();
    if(MaxDosh == 0)
    {
        return MaxDosh;
    }
    return int(float(MaxDosh) * (GetTotalProgress()));
}

simulated function int GetMaxVoshReward()
{
    return 2000;
}

simulated function int GetXPReward()
{
    local int MaxXP;

    MaxXP = GetMaxXPReward();
    if(MaxXP == 0)
    {
        return MaxXP;
    }
    return int(float(MaxXP) * (GetTotalProgress()));
}

simulated function int GetMaxXPReward()
{
    return 330;
}

simulated function float GetSpawnRateMod()
{
    local KFGameReplicationInfo KFGRI;
    local int NumPlayersAlive;

    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if(KFGRI != none)
    {
        NumPlayersAlive = Clamp(KFGRI.GetNumPlayersAlive(), 1, PerPlayerSpawnRateMod.Length) - 1;
        return PerPlayerSpawnRateMod[NumPlayersAlive];
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

simulated function bool UsesMultipleActors()
{
    return true;
}

simulated function string GetActorCount()
{
    if(!bIsActive)
    {
        return "";
    }
    return (string(ActorsRepaired) $ "/") $ string(ActivationsRequired);
}

simulated function bool GetIsMissionCritical()
{
    return bIsMissionCriticalObjective;
}

defaultproperties
{
    LocalizationKey="RepairObjective"
    DescriptionLocKey="UseWelderToRepair"
    LocalizationPackageName="KFGame"
    bUseTrailToObjective=true
    ActivationsRequired=6
    GameModeBlacklist(0)=class'KFGameInfo_Endless'
    GameModeBlacklist(1)=class'KFGameInfo_WeeklySurvival'
    PerPlayerSpawnRateMod(0)=1
    PerPlayerSpawnRateMod(1)=1
    PerPlayerSpawnRateMod(2)=1
    PerPlayerSpawnRateMod(3)=1
    PerPlayerSpawnRateMod(4)=1
    PerPlayerSpawnRateMod(5)=1
    TimeUntilNextActivation=5
    ObjectiveIcon=Texture2D'Objectives_UI.UI_Objectives_Xmas_DefendObj'
    JustWinThreshold=0.25
    StandardWinThreshold=0.5
    GoodWinThreshold=0.85
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
        HiddenGame=true
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
    object end
    // Reference: SpriteComponent'Default__KFMapObjective_RepairActors.Sprite'
    Components(0)=Sprite
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bAlwaysRelevant=true
    SupportedEvents=/* Array type was not detected. */
}