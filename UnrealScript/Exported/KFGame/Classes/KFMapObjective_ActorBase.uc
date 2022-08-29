//=============================================================================
// KFMapObjective_ActorBase
//=============================================================================
// Parent class for all actor-based objectives
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFMapObjective_ActorBase extends Actor
	implements(KFInterface_MapObjective)
	placeable
	abstract;

//=============================================================================
// Common objective variables
//=============================================================================















var() string LocalizationKey;
var() string DescriptionLocKey;
var() string LocalizationPackageName;
var() string RequirementsLocKey;
var() bool bIsMissionCriticalObjective;
var Texture2D DefaultIcon;

 
var transient KFReplicatedShowPathActor TrailActor;
 
var() Texture2D ObjectiveIcon;
 
var() array<class<KFGameInfo> > GameModeBlacklist;
 
var() array<float> PerPlayerSpawnRateMod;

 
var() AkEvent ActivationSoundEvent;
 
var() AkEvent FailureSoundEvent;

replication
{
	if (bNetInitial)
		ObjectiveIcon, bIsMissionCriticalObjective, LocalizationKey, DescriptionLocKey, LocalizationPackageName;
}#linenumber 18

//=============================================================================
// KFMapObjective_ActorBase variables
//=============================================================================

var bool bIsActive;

/** Whether or not to use the trader trail to lead players to the objective */
var() bool bUseTrailToObjective;

/** Max reward if users (theoretically) did the objective perfectly */
var() const array<int> DoshRewards;

/** XP reward if user compeletes the objective. */
var const array<int> XPRewards;

/** Multipliers for the Max XP/Dosh Amount given at the end of an objective*/
var const array<float> DoshDifficultyScalars;
var const array<float> XPDifficultyScalars;

/** Modifies the Dosh value gained for killing zeds while this objective is active*/
var() const float DoshValueModifier;

replication
{
	if (bNetInitial)
		bUseTrailToObjective;

	if (bNetDirty)
		bIsActive;
}

//=============================================================================
// KFInterface_MapObjective functions
//=============================================================================

// Status
simulated function ActivateObjective()
{
	local KFSeqEvent_MapObjectiveActivated ActivationEvent;
	local int i;

	bIsActive = true;

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
	local KFSeqEvent_MapObjectiveActivated ActivationEvent;
	local int i;

	bIsActive = false;

	for (i = 0; i < GeneratedEvents.Length; i++)
	{
		ActivationEvent = KFSeqEvent_MapObjectiveActivated(GeneratedEvents[i]);
		if (ActivationEvent != none)
		{
			ActivationEvent.NotifyDeactivation(self, self);
		}
	}
}

simulated function GrantReward(KFPawn_Human PlayerToReward)
{
	if (KFPlayerReplicationInfo(PlayerToReward.PlayerReplicationInfo) == none)
	{
		return;
	}

	if (KFPlayerReplicationInfo(PlayerToReward.PlayerReplicationInfo).bOnlySpectator)
	{
		return;
	}

	KFPlayerReplicationInfo(PlayerToReward.PlayerReplicationInfo).AddDosh(GetDoshReward());

	if (KFPlayerController(PlayerToReward.Controller) != none)
	{
		// @todo: hook up seasonal event here if/when desired
		KFPlayerController(PlayerToReward.Controller).ClientMapObjectiveCompleted(GetXPReward());
	}
}

simulated function int GetMaxXPReward()
{
	local KFGameReplicationInfo KFGRI;
	local int ArrayEnd;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if (KFGRI != none)
	{
		// Since we're using a static array for rewards, we need to know the true end of the array.
		ArrayEnd = Clamp(KFGRI.WaveMax - 2, 0, XPRewards.Length - 1);
		return XPRewards[Clamp(KFGRI.WaveNum - 1, 0, ArrayEnd)] * XPDifficultyScalars[KFGRI.GameDifficulty];
	}

	if (XPRewards.Length > 0)
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
	if (KFGRI != none)
	{
		// Since we're using a static array for rewards, we need to know the true end of the array.
		ArrayEnd = Clamp(KFGRI.WaveMax - 2, 0, DoshRewards.Length - 1);
		return DoshRewards[Clamp(KFGRI.WaveNum - 1, 0, ArrayEnd)] * DoshDifficultyScalars[KFGRI.GameDifficulty];
	}

	if (DoshRewards.Length > 0)
	{
		return DoshRewards[0];
	}

	return 0;
}

simulated function int GetMaxVoshReward()
{
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if (KFGRI != none)
	{
		return class'KFOnlineStatsWrite'.static.GetMapObjectiveVoshReward(KFGRI.GameDifficulty, KFGRI.WaveNum);
	}

	return 0;
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

simulated function int GetVoshReward()
{
	local int MaxVosh;

	MaxVosh = GetMaxVoshReward();
	if (MaxVosh == 0)
	{
		return MaxVosh;
	}

	return int(MaxVosh * GetProgress());
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

simulated function string GetLocalizedName()
{
	return Localize("Objectives", LocalizationKey, LocalizationPackageName);
}

simulated function string GetLocalizedDescription()
{
	return Localize("Objectives", DescriptionLocKey, LocalizationPackageName);
}

simulated function float GetSpawnRateMod()
{
	local KFGameReplicationInfo KFGRI;
	local int NumPlayersAlive;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if (KFGRI != none)
	{
		NumPlayersAlive = Clamp(KFGRI.GetNumPlayersAlive(), 1, PerPlayerSpawnRateMod.length) - 1;
		if (NumPlayersAlive >= 0 && NumPlayersAlive < PerPlayerSpawnRateMod.Length)
		{
			return PerPlayerSpawnRateMod[NumPlayersAlive];
		}
	}

	return 1.f;
}

simulated function bool IsActive() { return bIsActive; }
simulated function bool UsesProgress();
simulated function bool IsBonus();
function bool CanActivateObjective();
simulated function float GetProgress();
simulated function bool IsComplete();
simulated function bool HasFailedObjective();
simulated function float GetActivationPctChance();
simulated function bool UsesMultipleActors();
simulated function string GetActorCount();
simulated function string GetLocalizedRequirements();
simulated function bool GetIsMissionCritical();
simulated function float GetDoshValueModifier() { return DoshValueModifier; }

// HUD
simulated function bool ShouldDrawIcon();
simulated function Vector GetIconLocation();
simulated function DrawHUD(KFHUDBase hud, Canvas drawCanvas);
simulated function bool HasObjectiveDrawDistance() { return true; }
simulated function bool ShouldShowObjectiveHUD() { return true; }
simulated function bool ShouldShowObjectiveContainer() { return true; }
simulated function Texture2D GetIcon()
{
	return ObjectiveIcon;
}

// Kismet
simulated function TriggerObjectiveProgressEvent(optional int EventType = -1, optional float ProgressMade = -1.f)
{
	local int i, j;
	local array<int> OutputLinksToActivate;
	local KFSeqEvent_ObjectiveProgress ProgressEvent;

	if (EventType >= 0)
	{
		OutputLinksToActivate.AddItem(EventType);
	}

	for (i = 0; i < GeneratedEvents.Length; i++)
	{
		ProgressEvent = KFSeqEvent_ObjectiveProgress(GeneratedEvents[i]);
		if (ProgressEvent != none)
		{
			if (ProgressMade >= 0.0f)
			{
				for (j = 0; j < ProgressEvent.ProgressThresholds.Length; j++)
				{
					if (ProgressEvent.ProgressThresholds[j] == ProgressMade)
					{
						OutputLinksToActivate.AddItem(ProgressEvent.ProgressOutputStartIndex + j);
						break;
					}
				}
			}

			ProgressEvent.Reset();
			ProgressEvent.CheckActivate(self, self, , OutputLinksToActivate);
		}
	}
}

defaultproperties
{
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
   DoshDifficultyScalars(0)=1.200000
   DoshDifficultyScalars(1)=1.000000
   DoshDifficultyScalars(2)=1.000000
   DoshDifficultyScalars(3)=0.900000
   XPDifficultyScalars(0)=1.000000
   XPDifficultyScalars(1)=1.300000
   XPDifficultyScalars(2)=1.750000
   XPDifficultyScalars(3)=2.000000
   DoshValueModifier=1.000000
   bNoDelete=True
   bSkipActorPropertyReplication=True
   SupportedEvents(6)=Class'KFGame.KFSeqEvent_MapObjectiveActivated'
   Name="Default__KFMapObjective_ActorBase"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
