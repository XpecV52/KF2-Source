//=============================================================================
// KFMapObjective_RepairActors
//=============================================================================
// Objective type for the repair panels. Player must weld n number of actors in
// order to repair them. After one actor is repaired, another will break.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFMapObjective_RepairActors extends Actor
	implements(KFInterface_MapObjective)
	placeable;

var() string LocalizationKey;
var() string DescriptionLocKey;
var() string LocalizationPackageName;
var() bool bIsMissionCriticalObjective;

/** Is the current objective active or not. */
var bool bIsActive;

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

/** How many actors needs to be repaired for the objective to be completed. */
var int ActivationsRequired;

/** How many actors have been repaired. */
var int ActorsRepaired;

/** List of all the actors that must be repaired by the user. */
var() array<KFRepairableActor> RepairableActors;

/** List of Repairable Actors we haven't repaired yet. This will ensure we cycle through all actors before repeating. */
var array<KFRepairableActor> UnusedRepairableActors;

/** Reference to last actor repaired so we don't fix the same actor one after the other. */
var KFRepairableActor LastRepairedActor;

/** Current Actor that needs to be repaired. */
var repnotify KFRepairableActor CurrentActorToRepair;

/** Whether or not to use the trader trail to lead players to the objective */
var() bool bUseTrailToObjective;

/** Trader trail object being used */
var transient KFReplicatedShowPathActor TrailActor;

/** If this is tied to an event, what season are we in? */
var() SeasonalEventIndex EventSeason;

/** Index if this is tied to a season */
var() int EventIndex;

/** Which game modes should this objective not support. */
var() array<class<KFGameInfo> > GameModeBlacklist;

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

/** Win thresholds - Named to match the VO tracks*/
var float JustWinThreshold;
var float StandardWinThreshold;
var float GoodWinThreshold;

replication
{
	if(bNetInitial)
		ObjectiveIcon;

	if(bNetDirty)
		bIsActive, CurrentActorToRepair, ActorsRepaired, ActivationsRequired, LocalizationKey, DescriptionLocKey, LocalizationPackageName;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(CurrentActorToRepair))
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
	local int i, PlayerCount;
	local KFSeqEvent_MapObjectiveActivated ActivationEvent;
	local KFRepairableActor CurrActor;

	foreach RepairableActors(CurrActor)
	{
		CurrActor.OnRepairCompelete = OnActorRepaired;
	}

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (bUseTrailToObjective)
		{
			TrailActor = class'WorldInfo'.static.GetWorldInfo().Spawn(class'KFReplicatedShowPathActor', none);
			TrailActor.SetEmitterTemplate(ParticleSystem'FX_Gameplay_EMIT.FX_Objective_Weld_Trail');
		}
	}

	if (Role == ROLE_Authority)
	{
		PlayerCount = Clamp(KFGameInfo(WorldInfo.Game).GetLivingPlayerCount(), 1, 6) - 1;
		ActivationsRequired = ActivationsRequiredForPlayerCount[PlayerCount];

		ActorsRepaired = 0;
		bIsActive = true;

		if (ActivationDelay > 0.f)
		{
			SetTimer(ActivationDelay, false, 'ActivateNextRepairableActor');
		}
		else
		{
			ActivateNextRepairableActor();
		}

		PlaySoundBase(ActivationSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
	}

	for (i = 0; i < GeneratedEvents.Length; i++)
	{
		ActivationEvent = KFSeqEvent_MapObjectiveActivated(GeneratedEvents[i]);
		if (ActivationEvent != none)
		{
			ActivationEvent.NotifyActivation(self, self);
		}
	}
}

simulated function DeactivateObjective()
{
	local KFPlayerController KFPC;
	local KFPawn_Human KFPH;
	local KFRepairableActor CurrActor;
	local int i;
	local KFSeqEvent_MapObjectiveActivated ActivationEvent;

	if(Role == ROLE_Authority)
	{
		bIsActive = false;

		if (!HasFailedObjective())
		{
			foreach WorldInfo.AllPawns(class'KFPawn_Human', KFPH)
			{
				if (KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo) == none)
				{
					continue;
				}

				if (KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo).bOnlySpectator)
				{
					continue;
				}
				//these scale
				KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo).AddDosh(GetDoshReward());
				KFPlayerController(KFPH.Controller).ClientMapObjectiveCompleted(GetXPReward());

				if (KFPlayerController(KFPH.Controller) != none)
				{
					if (GetTotalProgress() >= 1.0f)
					{
						KFPlayerController(KFPH.Controller).FinishedSpecialEvent(EventSeason, EventIndex);

					}
				}
			}
		}
		else
		{
			LogInternal("objective failed");
		}

		PlayDeactivationDialog();

		ClearTimer(nameof(ActivateNextRepairableActor));
	}

	foreach RepairableActors(CurrActor)
	{
		CurrActor.Reset();
	}

	if(WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (TrailActor != none)
		{
			TrailActor.Destroy();
			TrailActor = none;
		}
	}

	for (i = 0; i < GeneratedEvents.Length; i++)
	{
		ActivationEvent = KFSeqEvent_MapObjectiveActivated(GeneratedEvents[i]);
		if (ActivationEvent != none)
		{
			ActivationEvent.NotifyDeactivation(self, self);
		}
	}

	KFPC = KFPlayerController(GetALocalPlayerController());
	if (KFPC != none && KFPC.MyGFxHUD != none)
	{
		KFPC.MyGFxHUD.WaveInfoWidget.ObjectiveContainer.SetFailState(HasFailedObjective());
	}
}

function PlayDeactivationDialog()
{
	if (GetTotalProgress() <= 0.0f)
	{
		PlaySoundBase(FailureSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
		BroadcastLocalizedMessage(class'KFLocalMessage_Priority', GMT_ObjectiveLost);
	}
	else
	{
		if (GetTotalProgress() <= JustWinThreshold)
		{
			PlaySoundBase(SuccessSoundEvent25pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (GetTotalProgress() <= StandardWinThreshold)
		{
			PlaySoundBase(SuccessSoundEvent50pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (GetTotalProgress() <= GoodWinThreshold)
		{
			PlaySoundBase(SuccessSoundEvent85pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else
		{
			PlaySoundBase(SuccessSoundEvent100pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
	}
}

function ActivateNextRepairableActor()
{
	if(Role == ROLE_Authority)
	{
		LastRepairedActor = CurrentActorToRepair;
		CurrentActorToRepair = ChooseNextActorToRepair();
		if (CurrentActorToRepair != none)
		{
			CurrentActorToRepair.PlayDestroyed();
		}

		if (ActorsRepaired < ActorActivationSoundEvents.Length)
		{
			PlaySoundBase(ActorActivationSoundEvents[ActorsRepaired], false, WorldInfo.NetMode == NM_DedicatedServer);
		}
	}

	UpdateTrailActor();
}

simulated function UpdateTrailActor()
{
	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (TrailActor != none)
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

	if (RepairableActors.length == 0)
	{
		return none;
	}

	if (UnusedRepairableActors.length == 0)
	{
		UnusedRepairableActors = RepairableActors;
	}

	ValidActors = UnusedRepairableActors;
	if(ValidActors.length > 1)
	{
		ValidActors.RemoveItem(LastRepairedActor);
	}

	ChosenActorIndex = RandRange(0, ValidActors.length - 1);
	ChosenActor = ValidActors[ChosenActorIndex];
	UnusedRepairableActors.Remove(ChosenActorIndex, 1);

	return ChosenActor;
}

function OnActorRepaired(KFRepairableActor RepairedActor)
{
	local KFGameReplicationInfo KFGRI;

	if (!bIsActive)
	{
		return;
	}

	if (Role == ROLE_Authority)
	{
		if (ActorsRepaired < ActorRepairedSoundEvents.Length)
		{
			PlaySoundBase(ActorRepairedSoundEvents[ActorsRepaired], false, WorldInfo.NetMode == NM_DedicatedServer);
		}
	}

	ActorsRepaired++;
	if (GetTotalProgress() >= 1.f)
	{
		KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
		if (KFGRI != none)
		{
			KFGRI.DeactivateObjective();
		}
	}
	else
	{
		if (TimeUntilNextActivation > 0.f)
		{
			SetTimer(TimeUntilNextActivation, false, nameof(ActivateNextRepairableActor));
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

	foreach GameModeBlacklist(CurrGameClass)
	{
		if (CurrGameClass == WorldInfo.GRI.GameClass)
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
	if (CurrentActorToRepair != none)
	{
		return FClamp(float(CurrentActorToRepair.WeldIntegrity) / float(CurrentActorToRepair.MaxWeldIntegrity), 0.f, 1.f);
	}

	return 0.f;
}

simulated function bool IsComplete()
{
	return GetProgress() >= 1.f;
}

simulated function float GetTotalProgress()
{
	if (ActivationsRequired == 0)
	{
		return 0.f;
	}

	return float(ActorsRepaired) / float(ActivationsRequired);
}

simulated function float GetActivationPctChance()
{
	return 1.f;
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
	if (CurrentActorToRepair != none)
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
	if (MaxDosh == 0)
	{
		return MaxDosh;
	}

	return int(MaxDosh * GetTotalProgress());
}

simulated function int GetMaxDoshReward()
{
	return 300;
}

simulated function int GetVoshReward()
{
	local int MaxDosh;

	MaxDosh = GetMaxVoshReward();
	if (MaxDosh == 0)
	{
		return MaxDosh;
	}

	return int(MaxDosh * GetTotalProgress());
}

simulated function int GetMaxVoshReward()
{
	return 2000;
}

simulated function int GetXPReward()
{
	local int MaxXP;

	MaxXP = GetMaxXPReward();
	if (MaxXP == 0)
	{
		return MaxXP;
	}

	return int(MaxXP * GetTotalProgress());
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
		NumPlayersAlive = Clamp(KFGRI.GetNumPlayersAlive(), 1, PerPlayerSpawnRateMod.length) - 1;
		return PerPlayerSpawnRateMod[NumPlayersAlive];
	}

	return 1.f;
}

simulated function bool HasFailedObjective()
{
	return GetLivingPlayerCount() <= 0;
}

simulated function int GetLivingPlayerCount()
{
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if (KFGRI != none)
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
	if (!bIsActive)
	{
		return "";
	}

	return ActorsRepaired $ "/" $ ActivationsRequired;
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
   bUseTrailToObjective=True
   ActivationsRequired=6
   GameModeBlacklist(0)=Class'kfgamecontent.KFGameInfo_Endless'
   GameModeBlacklist(1)=Class'kfgamecontent.KFGameInfo_WeeklySurvival'
   PerPlayerSpawnRateMod(0)=1.000000
   PerPlayerSpawnRateMod(1)=1.000000
   PerPlayerSpawnRateMod(2)=1.000000
   PerPlayerSpawnRateMod(3)=1.000000
   PerPlayerSpawnRateMod(4)=1.000000
   PerPlayerSpawnRateMod(5)=1.000000
   TimeUntilNextActivation=5.000000
   ObjectiveIcon=Texture2D'Objectives_UI.UI_Objectives_Xmas_DefendObj'
   JustWinThreshold=0.250000
   StandardWinThreshold=0.500000
   GoodWinThreshold=0.850000
   Begin Object Class=SpriteComponent Name=Sprite
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   RemoteRole=ROLE_SimulatedProxy
   bAlwaysRelevant=True
   SupportedEvents(0)=Class'KFGame.KFSeqEvent_MapObjectiveActivated'
   Name="Default__KFMapObjective_RepairActors"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
