//=============================================================================
// KFMapObjective_HoldVolume
//=============================================================================
// Objective type for the dosh hold objective.  While this is active, players
//      have to keep zeds out of an area in order to earn bonus dosh.  If no
//      players or any zed are in the volume, the wave end bonus ticks down.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================
class KFMapObjective_DoshHold extends KFMapObjective_AreaDefense
    placeable;































































































































































































































































































































































































































































































































































										  






































































#linenumber 15

/** Timer before penalty check starts */
var() const float PenaltyStartupTimer;

/** Timer length for checking the dosh penalty rule set */
var() const float DoshPenaltyCheckTimer;

/** Penalties for various states of the volume*/
var() const int NoHumansPenalty;
var() const int ZedsPenalty;

struct WaveLengthPctChances
{
	var() float PctChances[11];

	structdefaultproperties
	{
		PctChances[0]=1.f
		PctChances[1]=1.f
		PctChances[2]=1.f
		PctChances[3]=1.f
		PctChances[4]=1.f
		PctChances[5]=1.f
		PctChances[6]=1.f
		PctChances[7]=1.f
		PctChances[8]=1.f
		PctChances[9]=1.f
		PctChances[10]=1.f
	}
};

var() WaveLengthPctChances ActivatePctChances[3];


/** Sound event to play when objective is activated (overrides default trader dialog for this event) */
var() AkEvent ActivationSoundEventOverride;

/** A sound to play when the objective is fully complete (overrides default trader dialog for this event) */
var() AkEvent SuccessSoundEvent100pctOverride;

/** A sound to play when the objective is mostly complete (overrides default trader dialog for this event) */
var() AkEvent SuccessSoundEvent85pctOverride;

/** A sound to play when the objective is adequately complete (overrides default trader dialog for this event) */
var() AkEvent SuccessSoundEvent50pctOverride;

/** A sound to play when the objective is barely complete (overrides default trader dialog for this event) */
var() AkEvent SuccessSoundEvent25pctOverride;

/** A sound to play when the objective is failed (overrides default trader dialog for this event) */
var() AkEvent FailureSoundEventOverride;


/** Sound event to play when wave is 25% complete */
var() AkEvent WaveProgressSoundEvent25pct;

/** Sound event to play when wave is 50% complete */
var() AkEvent WaveProgressSoundEvent50pct;

/** Sound event to play when wave is 75% complete */
var() AkEvent WaveProgressSoundEvent75pct;

/** Sound event to play when wave is 90% complete */
var() AkEvent WaveProgressSoundEvent90pct;

/** Sound event to play to remind players about the objective */
var() AkEvent RemindPlayersSoundEvent;

/** How often to remind players about the objective if they aren't engaged in completing it */
var() float RemindPlayersTime;

var transient float PrevWaveProgress;
var transient bool bRemindPlayers;

//-----------------------------------------------------------------------------
// Volume
//-----------------------------------------------------------------------------
event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	local int PlayerCount;

    super.Touch(Other, OtherComp, HitLocation, HitNormal);

    if (KFPawn_Human(Other) != none && TouchingHumans.Find(Other) == INDEX_NONE)
    {
		PlayerCount = Clamp(KFGameInfo(WorldInfo.Game).GetLivingPlayerCount(), 1, 6) - 1;
		if (TouchingHumans.Length >= PlayerThresholds[PlayerCount] && IsTimerActive('StartPenaltyCheck'))
		{
			StartPenaltyCheck();
		}
    }
}

function CheckBonusState()
{
    local int i;
    local int PlayerCount;

    bDangerState = false;
    PlayerCount = Clamp(KFGameInfo(WorldInfo.Game).GetLivingPlayerCount(), 1, 6) - 1;
    if (TouchingHumans.Length < PlayerThresholds[PlayerCount])
    {
        bDangerState = true;
        CurrentRewardAmount -= NoHumansPenalty;

		if(bRemindPlayers)
		{
			if (RemindPlayersSoundEvent != none)
			{
				PlaySoundBase(RemindPlayersSoundEvent,, WorldInfo.NetMode == NM_DedicatedServer);
				SetTimer(RemindPlayersTime, false, 'Timer_AllowRemindPlayers');
			}
			bRemindPlayers = false;
		}
    }
    else if (TouchingZeds.Length > 0)
    {
        //Remove dead zeds
        for (i = TouchingZeds.Length - 1; i >= 0; --i)
        {
            if (!IsValidZed(TouchingZeds[i]))
            {
                TouchingZeds.Remove(i, 1);
            }
        }

        //Recheck
        if (TouchingZeds.Length > ZedThresholds[PlayerCount])
        {
            bDangerState = true;
            CurrentRewardAmount -= ZedsPenalty;
        }
    }

	if (CurrentRewardAmount <= 0)
	{
		if (KFGameInfo_Survival(WorldInfo.Game) != none)
		{
			KFGameInfo_Survival(WorldInfo.Game).ObjectiveFailed();
		}
	}

	CurrentRewardAmount = FMax(CurrentRewardAmount, 0);

    UpdateMeshArrayState();
}

simulated function Timer_AllowRemindPlayers()
{
	bRemindPlayers = true;
}

function StartPenaltyCheck()
{
    ClearTimer('StartPenaltyCheck');
	if(bActive)
	{
		SetTimer(DoshPenaltyCheckTimer, true, 'CheckBonusState');
	}
}

function ActivationVO()
{
	if (ActivationSoundEventOverride != none)
	{
		PlaySoundBase(ActivationSoundEventOverride, false, WorldInfo.NetMode == NM_DedicatedServer);
	}
	else
	{
		class'KFTraderDialogManager'.static.PlayGlobalDialog(57, WorldInfo, true);
	}
}

simulated function ActivateObjective()
{
	local int PlayerCount;

	super.ActivateObjective();

    if (Role == ROLE_Authority)
    {
		PlayerCount = Clamp(KFGameInfo(WorldInfo.Game).GetLivingPlayerCount(), 1, 6) - 1;
        if (TouchingHumans.Length >= PlayerThresholds[PlayerCount])
        {
            StartPenaltyCheck();
        }
        else
        {
            SetTimer(PenaltyStartupTimer, false, 'StartPenaltyCheck');
        }

		//Because we're tired of dealing with bugs in the VO system in smart ways, delay by a frame
		//		to avoid first tick replication not having a controller.
		SetTimer(0.01f, false, 'ActivationVO');

		SetTimer(1.f, true, 'Timer_CheckWaveProgress');
		PrevWaveProgress = 0;
		bRemindPlayers = true;
    }
}

simulated function Timer_CheckWaveProgress()
{
	local KFGameReplicationInfo KFGRI;
	local float WaveProgress;

	KFGRI = KFGameReplicationInfo(WorldInfo.Game.GameReplicationInfo);
	if (KFGRI != none)
	{
		WaveProgress = 1.f - (float(KFGRI.AIRemaining) / float(KFGRI.WaveTotalAICount));

		if (PrevWaveProgress < 0.25 && WaveProgress >= 0.25)
		{
			PlaySoundBase(WaveProgressSoundEvent25pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (PrevWaveProgress < 0.5 && WaveProgress >= 0.5)
		{
			PlaySoundBase(WaveProgressSoundEvent50pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (PrevWaveProgress < 0.75 && WaveProgress >= 0.75)
		{
			PlaySoundBase(WaveProgressSoundEvent75pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else if (PrevWaveProgress < 0.9 && WaveProgress >= 0.9)
		{
			PlaySoundBase(WaveProgressSoundEvent90pct, false, WorldInfo.NetMode == NM_DedicatedServer);
		}

		PrevWaveProgress = WaveProgress;
	}
}

simulated function DeactivateObjective()
{
    local KFPawn_Human KFPH;
	local KFPlayerController KFPC;
	local array<KFPawn_Human> CachedHumans;
	local bool bOneHumanAlive;

	super.DeactivateObjective();

    if (Role == ROLE_Authority)
    {
        ClearTimer('CheckBonusState');
		ClearTimer('StartPenaltyCheck');
		ClearTimer('Timer_AllowRemindPlayers');
		ClearTimer('Timer_CheckWaveProgress');

		bOneHumanAlive = false;

		foreach WorldInfo.AllPawns(class'KFPawn_Human', KFPH)
		{
			if (KFPH.IsAliveAndWell())
			{
				bOneHumanAlive = true;
			}

			CachedHumans.AddItem(KFPH);
		}

        //Reward players if any dosh still remains
        if (CurrentRewardAmount > 0)
        {
			// Only reward players if they survived the round.
			if(bOneHumanAlive)
			{
				foreach CachedHumans(KFPH)
				{
					GrantReward(KFPH);
				}
			}
        }
		if (bOneHumanAlive)
		{
			PlayDeactivationDialog();
		}
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
		if (FailureSoundEventOverride != none)
		{
			PlaySoundBase(FailureSoundEventOverride, false, WorldInfo.NetMode == NM_DedicatedServer);
		}
		else
		{
			class'KFTraderDialogManager'.static.PlayGlobalDialog(60, WorldInfo, true);
		}
		BroadcastLocalizedMessage(class'KFLocalMessage_Priority', GMT_ObjectiveLost);
	}
	else
	{
		if (GetProgress() <= JustWinThreshold)
		{
			if (SuccessSoundEvent25pctOverride != none)
			{
				PlaySoundBase(SuccessSoundEvent25pctOverride, false, WorldInfo.NetMode == NM_DedicatedServer);
			}
			else
			{
				class'KFTraderDialogManager'.static.PlayGlobalDialog(111, WorldInfo, true);
			}
		}
		else if (GetProgress() <= StandardWinThreshold)
		{
			if (SuccessSoundEvent50pctOverride != none)
			{
				PlaySoundBase(SuccessSoundEvent50pctOverride, false, WorldInfo.NetMode == NM_DedicatedServer);
			}
			else
			{
				class'KFTraderDialogManager'.static.PlayGlobalDialog(58, WorldInfo, true);
			}
		}
		else if (GetProgress() <= GoodWinThreshold)
		{
			if (SuccessSoundEvent85pctOverride != none)
			{
				PlaySoundBase(SuccessSoundEvent85pctOverride, false, WorldInfo.NetMode == NM_DedicatedServer);
			}
			else
			{
				class'KFTraderDialogManager'.static.PlayGlobalDialog(112, WorldInfo, true);
			}
		}
		else
		{
			if (SuccessSoundEvent100pctOverride != none)
			{
				PlaySoundBase(SuccessSoundEvent100pctOverride, false, WorldInfo.NetMode == NM_DedicatedServer);
			}
			else
			{
				class'KFTraderDialogManager'.static.PlayGlobalDialog(113, WorldInfo, true);
			}
		}
	}
}

simulated function float GetProgress()
{
	local int MaxDoshReward;

	MaxDoshReward = GetMaxDoshReward();
	if (MaxDoshReward == 0)
	{
		return 0;
	}

    return CurrentRewardAmount / float(MaxDoshReward);
}

simulated function float GetActivationPctChance()
{
	local KFGameReplicationInfo KFGRI;
	local int ArrayEnd;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if (KFGRI != none)
	{
		// Since we're using a static array for rewards, we need to know the true end of the array.
		ArrayEnd = Clamp(KFGRI.WaveMax - 2, 0, ArrayCount(ActivatePctChances[KFGRI.GameLength].PctChances) - 1);
		return ActivatePctChances[KFGRI.GameLength].PctChances[Clamp(KFGRI.WaveNum - 1, 0, ArrayEnd)];
	}

	return 1.f;
}

simulated function string GetLocalizedRequirements()
{
	local int PlayerCount;

	PlayerCount = Clamp(KFGameReplicationInfo(WorldInfo.GRI).GetNumPlayers(), 1, 6) - 1;

	return Localize("Objectives", default.RequirementsLocKey, "KFGame") @ PlayerThresholds[PlayerCount];
}

simulated function bool HasFailedObjective()
{
	return GetProgress() <= 0.f;
}

defaultproperties
{
   PenaltyStartupTimer=20.000000
   DoshPenaltyCheckTimer=1.000000
   NoHumansPenalty=5
   ZedsPenalty=1
   ActivatePctChances(0)=(PctChances[1]=0.350000,PctChances[2]=0.350000,PctChances[3]=0.350000,PctChances[4]=1.000000,PctChances[5]=1.000000,PctChances[6]=1.000000,PctChances[7]=1.000000,PctChances[8]=1.000000,PctChances[9]=1.000000,PctChances[10]=1.000000)
   ActivatePctChances(1)=(PctChances[1]=0.350000,PctChances[2]=0.350000,PctChances[3]=0.350000,PctChances[4]=0.350000,PctChances[5]=0.350000,PctChances[6]=0.350000,PctChances[7]=1.000000,PctChances[8]=1.000000,PctChances[9]=1.000000,PctChances[10]=1.000000)
   ActivatePctChances(2)=(PctChances[1]=0.350000,PctChances[2]=0.350000,PctChances[3]=0.350000,PctChances[4]=0.350000,PctChances[5]=0.350000,PctChances[6]=0.350000,PctChances[7]=0.350000,PctChances[8]=0.350000,PctChances[9]=0.350000,PctChances[10]=0.350000)
   RemindPlayersTime=30.000000
   LocalizationKey="DoshHold"
   DescriptionLocKey="DescriptionDoshHold"
   RequirementsLocKey="RequiredDoshHold"
   PlayerThresholds(0)=1
   PlayerThresholds(1)=1
   PlayerThresholds(2)=2
   PlayerThresholds(3)=2
   PlayerThresholds(4)=3
   PlayerThresholds(5)=3
   ZedThresholds(0)=6
   ZedThresholds(1)=5
   ZedThresholds(2)=4
   ZedThresholds(3)=3
   ZedThresholds(4)=2
   ZedThresholds(5)=1
   ObjectiveIcon=Texture2D'Objectives_UI.UI_Objectives_Xmas_DefendObj'
   MaxRewards(0)=(WaveMaxReward[1]=200,WaveMaxReward[2]=350,WaveMaxReward[3]=500)
   MaxRewards(1)=(WaveMaxReward[1]=200,WaveMaxReward[2]=250,WaveMaxReward[3]=300,WaveMaxReward[4]=350,WaveMaxReward[5]=400,WaveMaxReward[6]=500)
   MaxRewards(2)=(WaveMaxReward[1]=200,WaveMaxReward[2]=250,WaveMaxReward[3]=300,WaveMaxReward[4]=350,WaveMaxReward[5]=400,WaveMaxReward[6]=450,WaveMaxReward[7]=500,WaveMaxReward[8]=500,WaveMaxReward[9]=500,WaveMaxReward[10]=500)
   XPRewards(0)=(WaveMaxReward[1]=150,WaveMaxReward[2]=200,WaveMaxReward[3]=300)
   XPRewards(1)=(WaveMaxReward[1]=150,WaveMaxReward[2]=150,WaveMaxReward[3]=200,WaveMaxReward[4]=200,WaveMaxReward[5]=300,WaveMaxReward[6]=300)
   XPRewards(2)=(WaveMaxReward[1]=100,WaveMaxReward[2]=150,WaveMaxReward[3]=150,WaveMaxReward[4]=200,WaveMaxReward[5]=200,WaveMaxReward[6]=250,WaveMaxReward[7]=250,WaveMaxReward[8]=300,WaveMaxReward[9]=300,WaveMaxReward[10]=300)
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'kfgamecontent.Default__KFMapObjective_AreaDefense:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'kfgamecontent.Default__KFMapObjective_AreaDefense:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionComponent=BrushComponent0
   Name="Default__KFMapObjective_DoshHold"
   ObjectArchetype=KFMapObjective_AreaDefense'kfgamecontent.Default__KFMapObjective_AreaDefense'
}
