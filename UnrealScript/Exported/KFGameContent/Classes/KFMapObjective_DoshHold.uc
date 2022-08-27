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
class KFMapObjective_DoshHold extends Volume
    implements(KFInterface_MapObjective)
    placeable;




































































































































































































































































































































































































































































































































































































































#linenumber 16

var string LocalizationKey;
var string DescriptionLocKey;
var string RequirementsLocKey;

/** List of touching humans maintained by touch/untouch events */
var array<KFPawn_Human> TouchingHumans;
var array<KFPawn_Monster> TouchingZeds;

/** Texture to use for the volume icon */
var() Texture2D ObjectiveIcon;

/** Whether or not I'm active */
var bool bActive;

/** Emitter to use to visually define the area the players should hold out.
    Note: This is going to be removed in favor of a static mesh setup at some
          point in the near future.
 */
var() array<Emitter> ZoneBoundariesEmitter;

/** Meshes used to define the outer boundary of the objective area. */
var() array<DynamicSMActor> ZoneBoundaryMeshes;

/** Splines used to define the boundary of the objective area. */
var() array<SplineLoftActor> ZoneBoundarySplines;

/** Name of the param that sets on/off state of danger colors of the mesh array */
var() name ZoneDangerMaterialParamName;

/** Whether or not the zone is in the danger state */
var() repnotify bool bDangerState;

/** Whether or not to use the trader trail to lead players to the zone */
var() bool bUseTrailToVolume;

/** Trader trail object being used */
var transient KFReplicatedShowPathActor TrailActor;

/** Timer before penalty check starts */
var() const float PenaltyStartupTimer;

struct DoshHoldMaxReward
{
	var() int WaveMaxReward[11];
};

/** Max reward if users (theoretically) did the objective perfectly */
var() const DoshHoldMaxReward MaxRewards[3];

/** XP reward if user compeletes the objective. */
var() const DoshHoldMaxReward XPRewards[3];

/** Current reward amount */
var float CurrentRewardAmount;

/** Timer length for checking the dosh penalty rule set */
var() const float DoshPenaltyCheckTimer;

/** Penalties for various states of the volume*/
var() const int NoHumansPenalty;
var() const int ZedsPenalty;

/** Per-player thresholds for amount of players needed in the volume before penalty stops ticking */
var() const int PlayerThresholds[6];

/** Per-player count thresholds for amount of zeds allowed in volume before penalty kicks in */
var() const int ZedThresholds[6];

/** If this is tied to an event, what season are we in? */
var() SeasonalEventIndex EventSeason;

/** Index if this is tied to a season */
var() int EventIndex;

/** Win thresholds - Named to match the VO tracks*/
var float JustWinThreshold;
var float StandardWinThreshold;
var float GoodWinThreshold;

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

replication
{
	if (bNetDirty)
		bActive;

    if (Role == ROLE_Authority)
        CurrentRewardAmount, bDangerState;
}

simulated event ReplicatedEvent(name VarName)
{
    if (VarName == 'bDangerState')
    {
        UpdateMeshArrayState();
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
}

simulated event PostBeginPlay()
{
    local int i, j, k;
    Super.PostBeginPlay();

    if (WorldInfo.NetMode != NM_DedicatedServer)
    {
        for (i = 0; i < ZoneBoundaryMeshes.Length; ++i)
        {
            if (ZoneBoundaryMeshes[i] != none)
            {
                ZoneBoundaryMeshes[i].StaticMeshComponent.SetHidden(true);
                j = 0;
                while(ZoneBoundaryMeshes[i].StaticMeshComponent.GetMaterial(j) != none)
                {
                    ZoneBoundaryMeshes[i].StaticMeshComponent.CreateAndSetMaterialInstanceConstant(j);
                    ++j;
                }
            }
        }

		for (i = 0; i < ZoneBoundarySplines.length; ++i)
		{
			if (ZoneBoundarySplines[i] != none)
			{
				for(j = 0; j < ZoneBoundarySplines[i].SplineMeshComps.length; ++j)
				{
					if(ZoneBoundarySplines[i].SplineMeshComps[j] != none)
					{
						ZoneBoundarySplines[i].SplineMeshComps[j].SetHidden(true);
						k = 0;
						while (ZoneBoundarySplines[i].SplineMeshComps[j].GetMaterial(k) != none)
						{
							ZoneBoundarySplines[i].SplineMeshComps[j].CreateAndSetMaterialInstanceConstant(k);
							++k;
						}
					}
				}
			}
		}
    }
}

//-----------------------------------------------------------------------------
// Volume
//-----------------------------------------------------------------------------
event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	local int PlayerCount;

    super.Touch(Other, OtherComp, HitLocation, HitNormal);

    if (KFPawn_Human(Other) != none && TouchingHumans.Find(Other) == INDEX_NONE)
    {
		TouchingHumans.AddItem(KFPawn_Human(Other));

		PlayerCount = Clamp(KFGameInfo(WorldInfo.Game).GetLivingPlayerCount(), 1, 6) - 1;
		if (TouchingHumans.Length >= PlayerThresholds[PlayerCount] && IsTimerActive('StartPenaltyCheck'))
		{
			StartPenaltyCheck();
		}
    }
    else if (IsValidZed(Other) && TouchingZeds.Find(Other) == INDEX_NONE)
    {
        TouchingZeds.AddItem(KFPawn_Monster(Other));
    }
}

event UnTouch(Actor Other)
{
    super.UnTouch(Other);

    if (TouchingHumans.Find(Other) != INDEX_NONE)
    {
        TouchingHumans.RemoveItem(Other);
    }
    else if (TouchingZeds.Find(Other) != INDEX_NONE)
    {
        TouchingZeds.RemoveItem(Other);
    }
}

//-----------------------------------------------------------------------------
// Status
//-----------------------------------------------------------------------------
simulated function UpdateMeshArrayState()
{
    local int i, j, k;

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		for (i = 0; i < ZoneBoundaryMeshes.Length; ++i)
		{
			j = 0;
			while (ZoneBoundaryMeshes[i].StaticMeshComponent.GetMaterial(j) != none)
			{
				MaterialInstance(ZoneBoundaryMeshes[i].StaticMeshComponent.GetMaterial(j)).SetScalarParameterValue(ZoneDangerMaterialParamName, bDangerState ? 1.f : 0.f);
				++j;
			}
		}

		for (i = 0; i < ZoneBoundarySplines.length; ++i)
		{
			if(ZoneBoundarySplines[i] != none)
			{
				for(j = 0; j < ZoneBoundarySplines[i].SplineMeshComps.length; ++j)
				{
					if(ZoneBoundarySplines[i].SplineMeshComps[j] != none)
					{
						k = 0;
						while (ZoneBoundarySplines[i].SplineMeshComps[j].GetMaterial(k) != none)
						{
							MaterialInstance(ZoneBoundarySplines[i].SplineMeshComps[j].GetMaterial(k)).SetScalarParameterValue(ZoneDangerMaterialParamName, bDangerState ? 1.f : 0.f);
							++k;
						}
					}
				}
			}
		}
	}
}

function bool IsValidZed(Actor PotentialZed)
{
    local KFPawn_Monster KFPM;

    KFPM = KFPawn_Monster(PotentialZed);
    if (KFPM == none)
    {
        return false;
    }

    if (KFPM.Health <= 0 || KFPM.IsHeadless())
    {
        return false;
    }

    return true;
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
	class'KFTraderDialogManager'.static.PlayGlobalDialog(57, WorldInfo, true);
}

simulated function ActivateObjective()
{
    local int i, j;
	local int PlayerCount;

    if (Role == ROLE_Authority)
    {
        bActive = true;
        CurrentRewardAmount = GetMaxDoshReward();
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
    }

    if (WorldInfo.NetMode != NM_DedicatedServer)
    {
        for (i = 0; i < ZoneBoundariesEmitter.Length; ++i)
        {
            if (ZoneBoundariesEmitter[i] != none)
            {
                ZoneBoundariesEmitter[i].ParticleSystemComponent.ActivateSystem();
                ZoneBoundariesEmitter[i].bCurrentlyActive = true;
            }
        }

        for (i = 0; i < ZoneBoundaryMeshes.Length; ++i)
        {
            if (ZoneBoundaryMeshes[i] != none)
            {
                ZoneBoundaryMeshes[i].StaticMeshComponent.SetHidden(false);
            }
        }

		for (i = 0; i < ZoneBoundarySplines.length; ++i)
		{
			if (ZoneBoundarySplines[i] != none)
			{
				for(j = 0; j < ZoneBoundarySplines[i].SplineMeshComps.length; ++j)
				{
					if(ZoneBoundarySplines[i].SplineMeshComps[j] != none)
					{
						ZoneBoundarySplines[i].SplineMeshComps[j].SetHidden(false);
					}
				}
			}
		}

        UpdateMeshArrayState();

        if (bUseTrailToVolume)
        {
            TrailActor = class'WorldInfo'.static.GetWorldInfo().Spawn(class'KFReplicatedShowPathObjective', none);
            if (TrailActor != none)
            {
                TrailActor.SetPathTarget(self, self, VCT_NotInVolume);
            }
        }
    }
}

simulated function DeactivateObjective()
{
    local int i, j;
    local KFPawn_Human KFPH;
	local KFPlayerController KFPC;
	local array<KFPawn_Human> CachedHumans;
	local bool bOneHumanAlive;

    if (Role == ROLE_Authority)
    {
        bActive = false;
        ClearTimer('CheckBonusState');
		ClearTimer('StartPenaltyCheck');

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
					if (KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo) == none)
					{
						continue;
					}

					if (KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo).bOnlySpectator)
					{
						continue;
					}

					KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo).AddDosh(CurrentRewardAmount);

					if (KFPlayerController(KFPH.Controller) != none)
					{
						KFPlayerController(KFPH.Controller).FinishedSpecialEvent(EventSeason, EventIndex);
						KFPlayerController(KFPH.Controller).ClientMapObjectiveCompleted(GetXPReward());
					}
				}

			}
        }
		if (bOneHumanAlive)
		{
			PlayDeactivationDialog();
		}
    }

    if (WorldInfo.NetMode != NM_DedicatedServer)
    {
        for (i = 0; i < ZoneBoundariesEmitter.Length; ++i)
        {
            if (ZoneBoundariesEmitter[i] != none)
            {
                ZoneBoundariesEmitter[i].ParticleSystemComponent.DeactivateSystem();
                ZoneBoundariesEmitter[i].bCurrentlyActive = false;
            }
        }

        for (i = 0; i < ZoneBoundaryMeshes.Length; ++i)
        {
            if (ZoneBoundaryMeshes[i] != none)
            {
                ZoneBoundaryMeshes[i].StaticMeshComponent.SetHidden(true);
            }
        }

		for (i = 0; i < ZoneBoundarySplines.length; ++i)
		{
			if(ZoneBoundarySplines[i] != none)
			{
				for(j = 0; j < ZoneBoundarySplines[i].SplineMeshComps.length; ++j)
				{
					if(ZoneBoundarySplines[i].SplineMeshComps[j] != none)
					{
						ZoneBoundarySplines[i].SplineMeshComps[j].SetHidden(true);
					}
				}
			}
		}

        UpdateMeshArrayState();

        if (bUseTrailToVolume && TrailActor != none)
        {
            TrailActor.Destroy();
            TrailActor = none;
        }


    }
	KFPC = KFPlayerController(GetALocalPlayerController());
	if (KFPC != none && KFPC.MyGFxHUD != none)
	{
		KFPC.MyGFxHUD.WaveInfoWidget.ObjectiveContainer.SetFailState(CurrentRewardAmount <= 0);
	}
}

simulated function bool IsActive()
{
	return bActive;
}

function PlayDeactivationDialog()
{
    if (CurrentRewardAmount <= 0)
    {
        class'KFTraderDialogManager'.static.PlayGlobalDialog(60, WorldInfo, true);
		BroadcastLocalizedMessage(class'KFLocalMessage_Priority', GMT_ObjectiveLost);
    }
    else
    {
		if (GetProgress() < JustWinThreshold)
		{
			class'KFTraderDialogManager'.static.PlayGlobalDialog(111, WorldInfo, true);
		}
		else if (GetProgress() < StandardWinThreshold)
		{
			class'KFTraderDialogManager'.static.PlayGlobalDialog(58, WorldInfo, true);
		}
		else if (GetProgress() < GoodWinThreshold)
		{
			class'KFTraderDialogManager'.static.PlayGlobalDialog(112, WorldInfo, true);
		}
		else
		{
			class'KFTraderDialogManager'.static.PlayGlobalDialog(113, WorldInfo, true);
		}
    }
}

function bool CanActivateObjective()
{
	return true;
}

simulated function bool UsesProgress()
{
    return true;
}

simulated function float GetProgress()
{
    return CurrentRewardAmount / float(GetMaxDoshReward());
}

//-----------------------------------------------------------------------------
// HUD
//-----------------------------------------------------------------------------
simulated function Vector GetIconLocation()
{
    return Location;
}

simulated function Texture2D GetIcon()
{
    return ObjectiveIcon;
}

function bool IsBonus()
{
	return true;
}

simulated function string GetLocalizedName()
{
	return Localize("Objectives", default.LocalizationKey, "KFGame");
}

simulated function int GetDoshReward()
{
	return CurrentRewardAmount;
}

simulated function int GetMaxDoshReward()
{
	local KFGameReplicationInfo KFGRI;
	local int ArrayEnd;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if (KFGRI != none)
	{
		// Since we're using a static array for rewards, we need to know the true end of the array.
		ArrayEnd = Clamp(KFGRI.WaveMax - 2, 0, ArrayCount(default.MaxRewards[KFGRI.GameLength].WaveMaxReward) - 1);
		return default.MaxRewards[KFGRI.GameLength].WaveMaxReward[Clamp(KFGRI.WaveNum - 1, 0, ArrayEnd)];
	}

	return default.MaxRewards[0].WaveMaxReward[0];
}

simulated function int GetPlayersInObjective()
{
	return 0;
}

simulated function string GetLocalizedDescription()
{
	return Localize("Objectives", default.DescriptionLocKey, "KFGame");
}

simulated function string GetLocalizedRequirements()
{
	local int PlayerCount;

	PlayerCount = Clamp(KFGameReplicationInfo(WorldInfo.GRI).GetNumPlayers(), 1, 6) - 1;

	return Localize("Objectives", default.RequirementsLocKey, "KFGame") @PlayerThresholds[PlayerCount];
}


simulated function int GetVoshReward()
{
	return GetMaxVoshReward() * float(GetDoshReward()) / float(GetMaxDoshReward());
}

simulated function int GetMaxVoshReward()
{
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if (KFGRI != none)
	{
		return class'KFOnlineStatsWrite'.static.GetMapObjectiveVoshReward(KFGRI.GameLength, KFGRI.WaveNum);
	}

	return 0;
}

simulated function int GetXPReward()
{
	return GetMaxXPReward() * float(GetDoshReward()) / float(GetMaxDoshReward());
}

simulated function int GetMaxXPReward()
{
	local KFGameReplicationInfo KFGRI;
	local int ArrayEnd;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if (KFGRI != none)
	{
		// Since we're using a static array for rewards, we need to know the true end of the array.
		ArrayEnd = Clamp(KFGRI.WaveMax - 2, 0, ArrayCount(default.XPRewards[KFGRI.GameLength].WaveMaxReward) - 1);
		return default.XPRewards[KFGRI.GameLength].WaveMaxReward[Clamp(KFGRI.WaveNum - 1, 0, ArrayEnd)];
	}

	return default.XPRewards[0].WaveMaxReward[0];
}

simulated function float GetActivationPctChance()
{
	local KFGameReplicationInfo KFGRI;
	local int ArrayEnd;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if (KFGRI != none)
	{
		// Since we're using a static array for rewards, we need to know the true end of the array.
		ArrayEnd = Clamp(KFGRI.WaveMax - 2, 0, ArrayCount(default.ActivatePctChances[KFGRI.GameLength].PctChances) - 1);
		return default.ActivatePctChances[KFGRI.GameLength].PctChances[Clamp(KFGRI.WaveNum - 1, 0, ArrayEnd)];
	}

	return 1.f;
}

defaultproperties
{
   LocalizationKey="DoshHold"
   DescriptionLocKey="DescriptionDoshHold"
   RequirementsLocKey="RequiredDoshHold"
   ObjectiveIcon=Texture2D'Objectives_UI.UI_Objectives_Xmas_DefendObj'
   ZoneDangerMaterialParamName="Danger"
   PenaltyStartupTimer=20.000000
   MaxRewards(0)=(WaveMaxReward[1]=200,WaveMaxReward[2]=350,WaveMaxReward[3]=500)
   MaxRewards(1)=(WaveMaxReward[1]=200,WaveMaxReward[2]=250,WaveMaxReward[3]=300,WaveMaxReward[4]=350,WaveMaxReward[5]=400,WaveMaxReward[6]=500)
   MaxRewards(2)=(WaveMaxReward[1]=200,WaveMaxReward[2]=250,WaveMaxReward[3]=300,WaveMaxReward[4]=350,WaveMaxReward[5]=400,WaveMaxReward[6]=450,WaveMaxReward[7]=500,WaveMaxReward[8]=500,WaveMaxReward[9]=500,WaveMaxReward[10]=500)
   XPRewards(0)=(WaveMaxReward[1]=150,WaveMaxReward[2]=200,WaveMaxReward[3]=300)
   XPRewards(1)=(WaveMaxReward[1]=150,WaveMaxReward[2]=150,WaveMaxReward[3]=200,WaveMaxReward[4]=200,WaveMaxReward[5]=300,WaveMaxReward[6]=300)
   XPRewards(2)=(WaveMaxReward[1]=100,WaveMaxReward[2]=150,WaveMaxReward[3]=150,WaveMaxReward[4]=200,WaveMaxReward[5]=200,WaveMaxReward[6]=250,WaveMaxReward[7]=250,WaveMaxReward[8]=300,WaveMaxReward[9]=300,WaveMaxReward[10]=300)
   DoshPenaltyCheckTimer=1.000000
   NoHumansPenalty=5
   ZedsPenalty=1
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
   EventIndex=-1
   JustWinThreshold=0.250000
   StandardWinThreshold=0.500000
   GoodWinThreshold=0.850000
   ActivatePctChances(0)=(PctChances[1]=0.350000,PctChances[2]=0.350000,PctChances[3]=0.350000,PctChances[4]=1.000000,PctChances[5]=1.000000,PctChances[6]=1.000000,PctChances[7]=1.000000,PctChances[8]=1.000000,PctChances[9]=1.000000,PctChances[10]=1.000000)
   ActivatePctChances(1)=(PctChances[1]=0.350000,PctChances[2]=0.350000,PctChances[3]=0.350000,PctChances[4]=0.350000,PctChances[5]=0.350000,PctChances[6]=0.350000,PctChances[7]=1.000000,PctChances[8]=1.000000,PctChances[9]=1.000000,PctChances[10]=1.000000)
   ActivatePctChances(2)=(PctChances[1]=0.350000,PctChances[2]=0.350000,PctChances[3]=0.350000,PctChances[4]=0.350000,PctChances[5]=0.350000,PctChances[6]=0.350000,PctChances[7]=0.350000,PctChances[8]=0.350000,PctChances[9]=0.350000,PctChances[10]=0.350000)
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   RemoteRole=ROLE_SimulatedProxy
   bStatic=False
   bAlwaysRelevant=True
   CollisionComponent=BrushComponent0
   Name="Default__KFMapObjective_DoshHold"
   ObjectArchetype=Volume'Engine.Default__Volume'
}