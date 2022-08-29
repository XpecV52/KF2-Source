//=============================================================================
// KFMapObjective_EscortPawns
//=============================================================================
// Objective type for escorting pawns. Pawns can be spawned in sequence or at
// the same time and need to be defended.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFMapObjective_EscortPawns extends Actor
	placeable
	implements(KFInterface_MapObjective);

var() string LocalizationKey;
var() string DescriptionLocKey;
var() string LocalizationPackageName;
var bool bIsActive;	
var() bool bIsMissionCriticalObjective;
var Texture2D DefaultIcon;

// Scripted pawn spawners that will spawn the escorts related to this objective
var() array<KFScriptedPawnSpawner> EscortPawnSpawners;
/** How many escorts need to be escorted successfully for the objective to be completed. */
var() int NumEscortsRequired;
var int NumEscortsAccomplished;
var int NumEscortsFinished;
var float Progress;
var repnotify transient Actor ActiveEscortActor;
var float CompletionPct;

/** Whether or not to use the trader trail to lead players to the objective */
var() bool bUseTrailToObjective;
/** Trader trail object being used */
var transient KFReplicatedShowPathActor TrailActor;
/** Texture to use for the actor icon */
var() Texture2D ObjectiveIcon;
/** Which game modes should this objective not support. */
var() array<class<KFGameInfo> > GameModeBlacklist;
/** Modify Spawn Rate based on how many players are alive. */
var() array<float> PerPlayerSpawnRateMod;

/** A sound to play when this objective is activated */
var() AkEvent ActivationSoundEvent;
/** A sound to play when the objective is failed */
var() AkEvent FailureSoundEvent;
// Sound to play when escort is 100% done and in perfect health
var() AkEvent ProgressSoundEvent100pctPerfect;
// Sound to play when escort is 100% done
var() AkEvent ProgressSoundEvent100pct;
// Sound to play when escort is 100% done and in poor health
var() AkEvent ProgressSoundEvent100pctPoor;
// Sound to play when escort is 85% done and in perfect health
var() AkEvent ProgressSoundEvent85pctPerfect;
// Sound to play when escort is 85% done
var() AkEvent ProgressSoundEvent85pct;
// Sound to play when escort is 85% done and in poor health
var() AkEvent ProgressSoundEvent85pctPoor;
// Sound to play when escort is 50% done and in perfect health
var() AkEvent ProgressSoundEvent50pctPerfect;
// Sound to play when escort is 50% done
var() AkEvent ProgressSoundEvent50pct;
// Sound to play when escort is 50% done and in poor health
var() AkEvent ProgressSoundEvent50pctPoor;
// Sound to play when escort is 25% done and in perfect health
var() AkEvent ProgressSoundEvent25pctPerfect;
// Sound to play when escort is 25% done
var() AkEvent ProgressSoundEvent25pct;
// Sound to play when escort is 25% done and in poor health
var() AkEvent ProgressSoundEvent25pctPoor;
// Percentage of escort health considered to be "poor," used for the "poor" progress sound events
var() float PoorHealthPctThreshold;

// Sound to play when escort takes damage
var() AkEvent EscortPawnTakeDamageEvent;
// Cooldown period for the "take damage" sound event
var() float EscortPawnTakeDamageEventCooldown;
// Sound to play to remind players that escort is in critical condition
var() AkEvent EscortPawnCriticalReminderEvent;
// How frequently to remind players that escort is in critical condition
var() float EscortPawnCriticalReminderEventInterval;

replication
{
	if (bNetDirty)
		bIsActive, Progress, ActiveEscortActor, CompletionPct;

	if (bNetInitial)
		ObjectiveIcon, bUseTrailToObjective, bIsMissionCriticalObjective, LocalizationKey, DescriptionLocKey, LocalizationPackageName;
}

simulated function ReplicatedEvent(name VarName)
{
	if (VarName == nameof(ActiveEscortActor))
	{
		UpdateTrailActor();
	}
	else
	{
		super.ReplicatedEvent(VarName);
	}
}

// Interface functions

simulated function ActivateObjective()
{
	local KFScriptedPawnSpawner EscortPawnStart;

	if (Role == ROLE_Authority)
	{
		bIsActive = true;
		NumEscortsAccomplished = 0;
		NumEscortsFinished = 0;

		// set delegates to help keep track of objective progress
		foreach EscortPawnSpawners(EscortPawnStart)
		{
			EscortPawnStart.Delegate_OnPawnStartedRoute = OnEscortStarted;
			EscortPawnStart.Delegate_OnPawnReachedRouteMarker = OnEscortReachedRouteMarker;
			EscortPawnStart.Delegate_OnPawnReachedGoal = OnEscortReachedGoal;
			EscortPawnStart.Delegate_OnPawnEndedRoute = OnEscortEndedRoute;

			// make sure to set up any scripted pawns that were spawned before the objective started
			if (EscortPawnStart.Pawn != none && EscortPawnStart.bReachedStart)
			{
				OnEscortStarted(EscortPawnStart.Pawn);
			}
		}

		if (ActivationSoundEvent != none)
		{
			PlaySoundBase(ActivationSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
	}
}

simulated function DeactivateObjective()
{
	local KFPawn_Human KFPH;

	if (Role == ROLE_Authority)
	{
		bIsActive = false;

		if (NumEscortsAccomplished >= NumEscortsRequired)
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
				
				KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo).AddDosh(GetDoshReward());
				KFPlayerController(KFPH.Controller).ClientMapObjectiveCompleted(GetXPReward());
			}
		}
		else
		{
			if (FailureSoundEvent != none)
			{
				PlaySoundBase(FailureSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
			}
		}
	}

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (TrailActor != none)
		{
			TrailActor.Destroy();
			TrailActor = none;
		}

		if (ActiveEscortActor != none)
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

simulated function int GetDoshReward()
{
	local int MaxDosh;

	MaxDosh = GetMaxDoshReward();
	if (MaxDosh == 0)
	{
		return MaxDosh;
	}

	return int(MaxDosh * GetProgress());
}

simulated function int GetMaxDoshReward()
{
	return 400;
}

simulated function int GetVoshReward()
{
	local int MaxDosh;

	MaxDosh = GetMaxVoshReward();
	if (MaxDosh == 0)
	{
		return MaxDosh;
	}

	return int(MaxDosh * GetProgress());
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

	return int(MaxXP * GetProgress());
}

simulated function int GetMaxXPReward()
{
	return 330;
}

simulated function bool IsBonus();

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

simulated function float GetProgress()
{
	return Progress;
}

simulated function bool IsComplete()
{
	return GetProgress() >= 1.f;
}

simulated function bool HasFailedObjective();

simulated function float GetActivationPctChance()
{
	return 1.f;
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

simulated function bool UsesMultipleActors()
{
	return false;
}

simulated function string GetActorCount();

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

simulated function bool ShouldDrawIcon(){}

simulated function Vector GetIconLocation(){}

simulated function Texture2D GetIcon()
{
	if (ActiveEscortActor != none)
	{
		return KFPawn_Scripted(ActiveEscortActor).GetStateIconTexture();
	}
	return DefaultIcon;
}

// Non-interface functions

function OnEscortStarted(KFPawn_Scripted StartedPawn)
{
	ActiveEscortActor = StartedPawn;
	StartedPawn.SetActive(true);
	UpdateTrailActor();

	StartedPawn.Delegate_OnTakeDamage = OnEscortTakeDamage;
	StartedPawn.Delegate_OnChangeState = OnEscortChangeState;

	OnEscortChangeState(0, 0);
}

function OnEscortReachedRouteMarker(int MarkerIdx, SplineActor Marker, int SubIdx)
{
	local float PawnsProgress;
	local KFScriptedPawnSpawner EscortPawnSpawner;
	local float ActivePawnHealthPct;

	foreach EscortPawnSpawners(EscortPawnSpawner)
	{
		PawnsProgress += EscortPawnSpawner.GetProgress() / float(EscortPawnSpawners.Length);
	}

	ActivePawnHealthPct = float(KFPawn_Scripted(ActiveEscortActor).Health) / float(KFPawn_Scripted(ActiveEscortActor).HealthMax);
	CompletionPct = ActivePawnHealthPct;

	if (Progress < 0.25 && PawnsProgress >= 0.25)
	{
		if (ActivePawnHealthPct > 0.99 && ProgressSoundEvent25pctPerfect != none)
		{
			PlaySoundBase(ProgressSoundEvent25pctPerfect, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (ActivePawnHealthPct > PoorHealthPctThreshold && ProgressSoundEvent25pct != none)
		{
			PlaySoundBase(ProgressSoundEvent25pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (ProgressSoundEvent25pctPoor != none)
		{
			PlaySoundBase(ProgressSoundEvent25pctPoor, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
	}
	else if (Progress < 0.5 && PawnsProgress >= 0.5)
	{
		if (ActivePawnHealthPct > 0.99 && ProgressSoundEvent50pctPerfect != none)
		{
			PlaySoundBase(ProgressSoundEvent50pctPerfect, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (ActivePawnHealthPct > PoorHealthPctThreshold && ProgressSoundEvent50pct != none)
		{
			PlaySoundBase(ProgressSoundEvent50pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (ProgressSoundEvent50pctPoor != none)
		{
			PlaySoundBase(ProgressSoundEvent50pctPoor, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
	}
	else if (Progress < 0.85 && PawnsProgress >= 0.85)
	{
		if (ActivePawnHealthPct > 0.99 && ProgressSoundEvent85pctPerfect != none)
		{
			PlaySoundBase(ProgressSoundEvent85pctPerfect, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (ActivePawnHealthPct > PoorHealthPctThreshold && ProgressSoundEvent85pct != none)
		{
			PlaySoundBase(ProgressSoundEvent85pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (ProgressSoundEvent85pctPoor != none)
		{
			PlaySoundBase(ProgressSoundEvent85pctPoor, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
	}
	else if (Progress < 1.0 && PawnsProgress >= 1.0)
	{
		if (ActivePawnHealthPct > 0.99 && ProgressSoundEvent100pctPerfect != none)
		{
			PlaySoundBase(ProgressSoundEvent100pctPerfect, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (ActivePawnHealthPct > PoorHealthPctThreshold && ProgressSoundEvent100pct != none)
		{
			PlaySoundBase(ProgressSoundEvent100pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (ProgressSoundEvent100pctPoor != none)
		{
			PlaySoundBase(ProgressSoundEvent100pctPoor, false, WorldInfo.NetMode == NM_DedicatedServer);
		}

		CompletionPct = ActivePawnHealthPct;
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

	++NumEscortsFinished;

	if (bSuccess)
	{
		++NumEscortsAccomplished;
	}
	
	if ((NumEscortsAccomplished >= NumEscortsRequired) ||
		(NumEscortsFinished == EscortPawnSpawners.Length) ||
		(((EscortPawnSpawners.Length - NumEscortsFinished) + NumEscortsAccomplished) < NumEscortsRequired))
	{
		KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
		if (KFGRI != none)
		{
			KFGRI.DeactivateObjective();
		}
	}

	ActiveEscortActor = none;
	UpdateTrailActor();

	ClearTimer(nameof(Timer_EscortPawnTakeDamageEventCooldown));
	ClearTimer(nameof(Timer_EscortPawnCriticalReminderEventInterval));
}

function OnEscortTakeDamage()
{
	if (EscortPawnTakeDamageEvent != none && !IsTimerActive(nameof(Timer_EscortPawnTakeDamageEventCooldown)))
	{
		PlaySoundBase(EscortPawnTakeDamageEvent,, WorldInfo.NetMode == NM_DedicatedServer);
		SetTimer(EscortPawnTakeDamageEventCooldown, false, nameof(Timer_EscortPawnTakeDamageEventCooldown));
	}
}

function Timer_EscortPawnTakeDamageEventCooldown()
{
	// this function is just here to allow us to set a timer, which we check the activity of
}

function OnEscortChangeState(int CurrState, int PrevState)
{
	if (KFPawn_Scripted(ActiveEscortActor).IsInCriticalCondition())
	{
		if (EscortPawnCriticalReminderEvent != none && !IsTimerActive(nameof(Timer_EscortPawnCriticalReminderEventInterval)))
		{
			SetTimer(EscortPawnCriticalReminderEventInterval, true, nameof(Timer_EscortPawnCriticalReminderEventInterval));
		}
	}
	else
	{
		ClearTimer(nameof(Timer_EscortPawnCriticalReminderEventInterval));
	}
}

function Timer_EscortPawnCriticalReminderEventInterval()
{
	PlaySoundBase(EscortPawnCriticalReminderEvent,, WorldInfo.NetMode == NM_DedicatedServer);
}

simulated function UpdateTrailActor()
{
	if (bUseTrailToObjective && WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (TrailActor == none)
		{
			TrailActor = class'WorldInfo'.static.GetWorldInfo().Spawn(class'KFReplicatedShowPathActor', none);
			TrailActor.SetEmitterTemplate(ParticleSystem'FX_Gameplay_EMIT.FX_Objective_Cart_Trail');
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
   LocalizationKey="EscortPawnsObjective"
   DescriptionLocKey="EscortPawnsDescription"
   LocalizationPackageName="KFGame"
   bIsMissionCriticalObjective=True
   DefaultIcon=Texture2D'Objectives_UI.UI_Objectives_Xmas_UI_CartObjective'
   GameModeBlacklist(0)=Class'kfgamecontent.KFGameInfo_Endless'
   GameModeBlacklist(1)=Class'kfgamecontent.KFGameInfo_WeeklySurvival'
   PerPlayerSpawnRateMod(0)=1.000000
   PerPlayerSpawnRateMod(1)=1.000000
   PerPlayerSpawnRateMod(2)=1.000000
   PerPlayerSpawnRateMod(3)=1.000000
   PerPlayerSpawnRateMod(4)=1.000000
   PerPlayerSpawnRateMod(5)=1.000000
   PoorHealthPctThreshold=0.500000
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
   Name="Default__KFMapObjective_EscortPawns"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
