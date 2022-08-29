//=============================================================================
// KFMapObjective_ActivateTrigger
//=============================================================================
// Objective for Biodome for Airship. The player has to activate a trigger n
// times for the objective to be complete. Zeds in the volume will stop the
// trigger from being activated.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFMapObjective_ActivateTrigger extends KFMapObjective_AreaDefense
	placeable;

/** How many times the players have pulled the trigger. */
var int TriggerPulls;

/** How many times a trigger has to be pulled until the objective is complete, per number of players */
var() const int TriggerPullsRequiredForPlayerCount[6];

/** How many times a trigger has to be pulled until the objective is complete. */
var int TriggerPullsRequired;

/** Reference to the trigger that we may need to override. */
var() KFTrigger_ObjectiveLever ObjectiveLever;

/** A delay from the the start of an objective, so the player can't automatically pull the lever. */
var() float ActivationDelay;

/** A sound to play when this objective is activated */
var() AkEvent ActivationSoundEvent;

/** A sound to play when the trigger is ready to be triggered (e.g. after activation delay or trigger reset delay) */
var() array<AkEvent> TriggerReadySoundEvents;

/** A sound to play when the trigger is pulled */
var() array<AkEvent> TriggerPulledSoundEvents;

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

/** Sound event to play when players are engaged with too many zeds in the zone */
var() AkEvent TooManyZedsSoundEvent;

/** Sound event to play when too few players are in the zone */
var() AkEvent TooFewPlayersSoundEvent;

/** How often to remind players about the objective if they aren't engaged in completing it */
var() float RemindPlayersTime;

/** A sound to play when enough players are in the zone, few enough zeds are in the zone, and players are still not pulling the readied trigger */
var() array<AkEvent> TriggerReminderSoundEvents;

/** How often to remind players that the trigger is ready to be pulled */
var() float ReadyTriggerReminderTime;

var transient bool bObjectiveLeverActiveBefore;

replication
{
	if(bNetDirty)
		TriggerPulls, TriggerPullsRequired;
}

simulated event ReplicatedEvent(name VarName)
{
	local KFPlayerController KFPC;

	if (VarName == 'bActive')
	{
		KFPC = KFPlayerController(GetALocalPlayerController());
		if (KFPC != none && KFPC.MyGFxHUD != none)
		{
			KFPC.MyGFxHUD.WaveInfoWidget.ObjectiveContainer.SetActive(bActive);
		}
	}
	else
	{
		super.ReplicatedEvent(VarName);
	}
}

simulated function ActivateObjective()
{
	local int PlayerCount;

	if (ObjectiveLever != none)
	{
		ObjectiveLever.OwningObjective = self;
	}
	
	super.ActivateObjective();

	if (Role == ROLE_Authority)
	{
		TriggerPulls = 0;

		PlayerCount = Clamp(KFGameInfo(WorldInfo.Game).GetLivingPlayerCount(), 1, 6) - 1;
		TriggerPullsRequired = TriggerPullsRequiredForPlayerCount[PlayerCount];

		`log(self @ "-" @ GetFuncName() @ "- ActivationDelay:" @ ActivationDelay);
		if (ObjectiveLever != none)
		{
			ObjectiveLever.bFathersBlessing = false;
		}

		bActive = false;
		if (ActivationDelay > 0.f)
		{
			SetTimer(ActivationDelay, false, 'ActivateTrigger');
		}
		else
		{
			ActivateTrigger();
		}

		CurrentRewardAmount = 0;
		bObjectiveLeverActiveBefore = false;

		// don't allow "too few players" reminder to be played right away
		SetTimer(RemindPlayersTime, false, nameof(Timer_TooFewPlayersReminderCooldown));

		PlaySoundBase(ActivationSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
	}

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		CheckTriggerActivation();
	}
}

simulated function DeactivateObjective()
{
	local KFPlayerController KFPC;
	local KFPawn_Human KFPH;

	super.DeactivateObjective();

	if (Role == ROLE_Authority)
	{
		ClearTimer('Timer_CheckObjective');

		if (ObjectiveLever != none)
		{
			// Lever should work as trap outside of objective.
			ObjectiveLever.bFathersBlessing = true;
		}

		if (CurrentRewardAmount > 0)
		{
			foreach WorldInfo.AllPawns(class'KFPawn_Human', KFPH)
			{
				GrantReward(KFPH);
			}
		}

		PlayDeactivationDialog();
	}

	KFPC = KFPlayerController(GetALocalPlayerController());
	if (KFPC != none && KFPC.MyGFxHUD != none)
	{
		KFPC.MyGFxHUD.WaveInfoWidget.ObjectiveContainer.SetFailState(CurrentRewardAmount <= 0);
	}
}

function PlayDeactivationDialog()
{
	if (CurrentRewardAmount <= 0)
	{
		PlaySoundBase(FailureSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
		BroadcastLocalizedMessage(class'KFLocalMessage_Priority', GMT_ObjectiveLost);
	}
	else
	{
		if (GetProgress() <= JustWinThreshold)
		{
			PlaySoundBase(SuccessSoundEvent25pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (GetProgress() <= StandardWinThreshold)
		{
			PlaySoundBase(SuccessSoundEvent50pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (GetProgress() <= GoodWinThreshold)
		{
			PlaySoundBase(SuccessSoundEvent85pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else
		{
			PlaySoundBase(SuccessSoundEvent100pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
	}
}

simulated function ActivateTrigger()
{
	local KFPlayerController KFPC;
	`log(self @ "-" @ GetFuncName());

	bActive = true;

	if (ObjectiveLever != none)
	{
		ObjectiveLever.bFathersBlessing = true;
	}

	SetTimer(0.25f, true, 'Timer_CheckObjective');

	//Show hud 
	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		if (KFPC != none && KFPC.MyGFxHUD != none)
		{
			KFPC.SetObjectiveUIActive(bActive);
		}
	}

	// don't allow "trigger ready" reminder to play right away
	SetTimer(ReadyTriggerReminderTime, false, nameof(Timer_TriggerReadyReminderCooldown));
}

//-----------------------------------------------------------------------------
// Volume
//-----------------------------------------------------------------------------
event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	local int PlayerCount;

	super.Touch(Other, OtherComp, HitLocation, HitNormal);

	PlayerCount = Clamp(KFGameInfo(WorldInfo.Game).GetLivingPlayerCount(), 1, 6) - 1;
	if (TouchingZeds.Length >= ZedThresholds[PlayerCount])
	{
		if (ObjectiveLever != none && bActive)
		{
			ObjectiveLever.bFathersBlessing = false;
			CheckTriggerActivation();
		}
	}
	else if (TouchingHumans.Length >= PlayerThresholds[PlayerCount])
	{
		if (ObjectiveLever != none && bActive)
		{
			ObjectiveLever.bFathersBlessing = true;
			CheckTriggerActivation();
		}
	}
}

event UnTouch(Actor Other)
{
	local int PlayerCount;

	super.UnTouch(Other);

	PlayerCount = Clamp(KFGameInfo(WorldInfo.Game).GetLivingPlayerCount(), 1, 6) - 1;
	if (TouchingHumans.Length < PlayerThresholds[PlayerCount])
	{
		if (ObjectiveLever != none && bActive)
		{
			ObjectiveLever.bFathersBlessing = false;
			CheckTriggerActivation();
		}
	}
	else if (TouchingZeds.Length < ZedThresholds[PlayerCount])
	{
		if (ObjectiveLever != none && bActive)
		{
			ObjectiveLever.bFathersBlessing = true;
			CheckTriggerActivation();
		}
	}
}

simulated function Timer_CheckObjective()
{
	local int i, PlayerCount;

	for (i = 0; i < TouchingZeds.length; i++)
	{
		if (!IsValidZed(TouchingZeds[i]))
		{
			TouchingZeds.Remove(i, 1);
		}
	}

	PlayerCount = Clamp(KFGameInfo(WorldInfo.Game).GetLivingPlayerCount(), 1, 6) - 1;
	if (bActive && TouchingZeds.length < ZedThresholds[PlayerCount] && ObjectiveLever != none)
	{
		ObjectiveLever.bFathersBlessing = true;
		CheckTriggerActivation();
	}

	if (Role == ROLE_Authority)
	{
		if(ObjectiveLever != none && ObjectiveLever.bAllowActivation && !bObjectiveLeverActiveBefore)
		{
			if (TriggerReadySoundEvents.Length > TriggerPulls)
			{
				PlaySoundBase(TriggerReadySoundEvents[TriggerPulls],false,WorldInfo.NetMode == NM_DedicatedServer);
			}
		}

		bObjectiveLeverActiveBefore = ObjectiveLever.bAllowActivation;

		if (bActive)
		{
			PlayerCount = Clamp(KFGameInfo(WorldInfo.Game).GetLivingPlayerCount(), 1, 6) - 1;
			if (TouchingHumans.Length < PlayerThresholds[PlayerCount])
			{
				if (TooFewPlayersSoundEvent != none && !IsTimerActive(nameof(Timer_TooFewPlayersReminderCooldown)))
				{
					PlaySoundBase(TooFewPlayersSoundEvent,, WorldInfo.NetMode == NM_DedicatedServer);
					SetTimer(RemindPlayersTime, false, nameof(Timer_TooFewPlayersReminderCooldown));
				}
			}
			
			if (TouchingZeds.Length > ZedThresholds[PlayerCount])
			{
				if (TooManyZedsSoundEvent != none && !IsTimerActive(nameof(Timer_TooManyZedsReminderCooldown)))
				{
					PlaySoundBase(TooManyZedsSoundEvent,, WorldInfo.NetMode == NM_DedicatedServer);
					SetTimer(RemindPlayersTime, false, nameof(Timer_TooManyZedsReminderCooldown));
				}
			}
			
			if (ObjectiveLever != none && ObjectiveLever.bAllowActivation)
			{
				if (TriggerPulls < TriggerReminderSoundEvents.Length && TriggerReminderSoundEvents[TriggerPulls] != none && !IsTimerActive(nameof(Timer_TriggerReadyReminderCooldown)))
				{
					PlaySoundBase(TriggerReminderSoundEvents[TriggerPulls],, WorldInfo.NetMode == NM_DedicatedServer);
					SetTimer(ReadyTriggerReminderTime, false, nameof(Timer_TriggerReadyReminderCooldown));
				}
			}
		}
	}
}

// These timer functions don't definitions, they just need to exist for SetTimer
simulated function Timer_TooFewPlayersReminderCooldown();
simulated function Timer_TooManyZedsReminderCooldown();
simulated function Timer_TriggerReadyReminderCooldown();

simulated function OnTriggerActivated()
{
	local KFGameReplicationInfo KFGRI;

	if (!bActive)
	{
		return;
	}

	TriggerPulls++;

	if (Role == ROLE_Authority)
	{
		CurrentRewardAmount = GetMaxDoshReward() * GetProgress();
		if (TriggerPulls <= TriggerPulledSoundEvents.Length)
		{
			PlaySoundBase(TriggerPulledSoundEvents[TriggerPulls-1],, WorldInfo.NetMode == NM_DedicatedServer);
		}
	}

	if (GetProgress() >= 1.f)
	{
		KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
		if (KFGRI != none)
		{
			KFGRI.DeactivateObjective();
		}
	}
}

simulated function OnTriggerReactivated()
{
	CheckTriggerActivation();
}

simulated function CheckTriggerActivation()
{
	bDangerState = false;
	if (ObjectiveLever != none)
	{
		bDangerState = !ObjectiveLever.bFathersBlessing;
		UpdateMeshArrayState();
		ObjectiveLever.BroadcastInteractionMessages();
	}
}

simulated function float GetProgress()
{
	if (TriggerPullsRequired == 0)
	{
		return 0;
	}

	return float(TriggerPulls) / float(TriggerPullsRequired);
}

simulated function bool IsComplete()
{
	return GetProgress() >= 1.f;
}

simulated function string GetLocalizedRequirements()
{
	return Localize("Objectives", default.RequirementsLocKey, "KFGame") @ TriggerPullsRequired;
}

simulated function bool HasFailedObjective()
{
	return false;
}

simulated function bool UsesMultipleActors()
{
	return true;
}

simulated function string GetActorCount()
{
	if (!bActive)
	{
		return "";
	}

	return TriggerPulls $ "/" $ TriggerPullsRequired;
}

defaultproperties
{
	DescriptionLocKey="DescriptionActivateTrigger"
	RequirementsLocKey="RequiredActivateTrigger"
	LocalizationKey="ActivateTrigger"

	GameModeBlacklist.Add(class'KFGameInfo_Endless')
	GameModeBlacklist.Add(class'KFGameInfo_WeeklySurvival')

	TriggerPullsRequired=6

	ActivationDelay=5.f

	PlayerThresholds[0]=1
	PlayerThresholds[1]=1
	PlayerThresholds[2]=2
	PlayerThresholds[3]=2
	PlayerThresholds[4]=3
	PlayerThresholds[5]=3

	ZedThresholds[0]=6
	ZedThresholds[1]=5
	ZedThresholds[2]=4
	ZedThresholds[3]=3
	ZedThresholds[4]=2
	ZedThresholds[5]=1

	// Short Match
	MaxRewards[0]={(
		WaveMaxReward[0]=0,
		WaveMaxReward[1]=200,
		WaveMaxReward[2]=350,
		WaveMaxReward[3]=500
	)},

	// Normal Match
	MaxRewards[1]={(
		WaveMaxReward[0]=0,
		WaveMaxReward[1]=200,
		WaveMaxReward[2]=250,
		WaveMaxReward[3]=300,
		WaveMaxReward[4]=350,
		WaveMaxReward[5]=400,
		WaveMaxReward[6]=500
	)},

	// Long Match
	MaxRewards[2]={(
		WaveMaxReward[0]=0,
		WaveMaxReward[1]=200,
		WaveMaxReward[2]=250,
		WaveMaxReward[3]=300,
		WaveMaxReward[4]=350,
		WaveMaxReward[5]=400,
		WaveMaxReward[6]=450,
		WaveMaxReward[7]=500,
		WaveMaxReward[8]=500,
		WaveMaxReward[9]=500,
		WaveMaxReward[10]=500
	)}

	// Short Match
	XPRewards[0]={(
		WaveMaxReward[0]=0,
		WaveMaxReward[1]=150,
		WaveMaxReward[2]=200,
		WaveMaxReward[3]=300
	)},

	// Normal Match
	XPRewards[1]={(
		WaveMaxReward[0]=0,
		WaveMaxReward[1]=150,
		WaveMaxReward[2]=150,
		WaveMaxReward[3]=200,
		WaveMaxReward[4]=200,
		WaveMaxReward[5]=300,
		WaveMaxReward[6]=300
	)},

	// Long Match
	XPRewards[2]={(
		WaveMaxReward[0]=0,
		WaveMaxReward[1]=100,
		WaveMaxReward[2]=150,
		WaveMaxReward[3]=150,
		WaveMaxReward[4]=200,
		WaveMaxReward[5]=200,
		WaveMaxReward[6]=250,
		WaveMaxReward[7]=250,
		WaveMaxReward[8]=300,
		WaveMaxReward[9]=300,
		WaveMaxReward[10]=300
	)}

	RemindPlayersTime=30.f
}
