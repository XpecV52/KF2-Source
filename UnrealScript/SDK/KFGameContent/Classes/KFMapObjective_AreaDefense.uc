//=============================================================================
// KFMapObjective_AreaDefense
//=============================================================================
// Base class for all map objectives that require the players to hold a volume.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFMapObjective_AreaDefense extends Volume
	implements(KFInterface_MapObjective)
	abstract;

struct DoshHoldMaxReward
{
	var() int WaveMaxReward[11];
};

var() string LocalizationKey;
var() string DescriptionLocKey;
var() string LocalizationPackageName;
var() string RequirementsLocKey;
var() bool bIsMissionCriticalObjective;

/** Trader trail object being used */
var transient KFReplicatedShowPathActor TrailActor;

/** List of touching humans maintained by touch/untouch events */
var array<KFPawn_Human> TouchingHumans;
var array<KFPawn_Monster> TouchingZeds;

/** Per-player thresholds for amount of players needed in the volume */
var() const int PlayerThresholds[6];

/** Per-player count thresholds for amount of zeds allowed in volume */
var() const int ZedThresholds[6];

/** Texture to use for the volume icon */
var() Texture2D ObjectiveIcon;

/** Whether or not I'm active */
var repnotify bool bActive;

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

/** Max reward if users (theoretically) did the objective perfectly */
var() const DoshHoldMaxReward MaxRewards[3];

/** XP reward if user compeletes the objective. */
var() const DoshHoldMaxReward XPRewards[3];

/** Current reward amount */
var float CurrentRewardAmount;

/** If this is tied to an event, what season are we in? */
var() SeasonalEventIndex EventSeason;

/** Index if this is tied to a season */
var() int EventIndex;

/** Which game modes should this objective not support. */
var() array<class<KFGameInfo> > GameModeBlacklist;

/** Modify Spawn Rate based on how many players are alive. */
var() array<float> PerPlayerSpawnRateMod;

/** Win thresholds - Named to match the VO tracks*/
var float JustWinThreshold;
var float StandardWinThreshold;
var float GoodWinThreshold;

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
				while (ZoneBoundaryMeshes[i].StaticMeshComponent.GetMaterial(j) != none)
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
				for (j = 0; j < ZoneBoundarySplines[i].SplineMeshComps.length; ++j)
				{
					if (ZoneBoundarySplines[i].SplineMeshComps[j] != none)
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
	super.Touch(Other, OtherComp, HitLocation, HitNormal);

	if (KFPawn_Human(Other) != none && TouchingHumans.Find(Other) == INDEX_NONE)
	{
		TouchingHumans.AddItem(KFPawn_Human(Other));
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
			if (ZoneBoundarySplines[i] != none)
			{
				for (j = 0; j < ZoneBoundarySplines[i].SplineMeshComps.length; ++j)
				{
					if (ZoneBoundarySplines[i].SplineMeshComps[j] != none)
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

simulated function ActivateObjective()
{
	local int i, j;
	local KFSeqEvent_MapObjectiveActivated ActivationEvent;

	if (Role == ROLE_Authority)
	{
		bActive = true;
		CurrentRewardAmount = GetMaxDoshReward();
	}

	for (i = 0; i < GeneratedEvents.Length; i++)
	{
		ActivationEvent = KFSeqEvent_MapObjectiveActivated(GeneratedEvents[i]);
		if (ActivationEvent != none)
		{
			ActivationEvent.NotifyActivation(self, self);
		}
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
			TrailActor = class'WorldInfo'.static.GetWorldInfo().Spawn(class'KFReplicatedShowPathActor', none);
			if (TrailActor != none)
			{
				TrailActor.SetEmitterTemplate(ParticleSystem'FX_Gameplay_EMIT.FX_Objective_Trail');
				TrailActor.SetPathTarget(self, self, VCT_NotInVolume);
			}
		}
    }
}

simulated function DeactivateObjective()
{
	local int i, j;
	local KFSeqEvent_MapObjectiveActivated ActivationEvent;

	if (Role == ROLE_Authority)
	{
		bActive = false;
	}

	for (i = 0; i < GeneratedEvents.Length; i++)
	{
		ActivationEvent = KFSeqEvent_MapObjectiveActivated(GeneratedEvents[i]);
		if (ActivationEvent != none)
		{
			ActivationEvent.NotifyDeactivation(self, self);
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
			if (ZoneBoundarySplines[i] != none)
			{
				for (j = 0; j < ZoneBoundarySplines[i].SplineMeshComps.length; ++j)
				{
					if (ZoneBoundarySplines[i].SplineMeshComps[j] != none)
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

	KFPlayerReplicationInfo(PlayerToReward.PlayerReplicationInfo).AddDosh(CurrentRewardAmount);

	if (KFPlayerController(PlayerToReward.Controller) != none)
	{
		KFPlayerController(PlayerToReward.Controller).FinishedSpecialEvent(EventSeason, EventIndex);
		KFPlayerController(PlayerToReward.Controller).ClientMapObjectiveCompleted(GetXPReward());
	}
}

simulated function bool IsActive()
{
	return bActive;
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

simulated function float GetProgress();

simulated function bool IsComplete()
{
	return GetProgress() >= 1.f;
}

simulated function float GetActivationPctChance()
{
	return 1.f;
}

function bool IsBonus()
{
	return true;
}

simulated function int GetPlayersInObjective()
{
	return 0;
}

simulated function float GetSpawnRateMod()
{
	local KFGameReplicationInfo KFGRI;
	local int NumPlayersAlive;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if (KFGRI != none)
	{
		NumPlayersAlive = Clamp(KFGRI.GetNumPlayersAlive(), 1, PerPlayerSpawnRateMod.length) - 1;
		return PerPlayerSpawnRateMod[NumPlayersAlive];
	}

	return 1.f;
}

simulated function bool HasFailedObjective();

//-----------------------------------------------------------------------------
// Rewards
//-----------------------------------------------------------------------------

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

	if (ArrayCount(default.MaxRewards) > 0 && ArrayCount(default.MaxRewards[0].WaveMaxReward) > 0)
	{
		return default.MaxRewards[0].WaveMaxReward[0];
	}

	return 0;
}

simulated function int GetVoshReward()
{
	local int MaxDoshReward;

	MaxDoshReward = GetMaxDoshReward();
	if (MaxDoshReward == 0)
	{
		return 0;
	}

	return GetMaxVoshReward() * float(GetDoshReward()) / float(MaxDoshReward);
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
	local int MaxDoshReward;

	MaxDoshReward = GetMaxDoshReward();
	if (MaxDoshReward == 0)
	{
		return 0;
	}

	return GetMaxXPReward() * float(GetDoshReward()) / float(MaxDoshReward);
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

	if (ArrayCount(default.XPRewards) > 0 && ArrayCount(default.XPRewards[0].WaveMaxReward) > 0)
	{
		return default.XPRewards[0].WaveMaxReward[0];
	}

	return 0;
}

//-----------------------------------------------------------------------------
// HUD
//-----------------------------------------------------------------------------
simulated function bool ShouldDrawIcon()
{
	return true;
}

simulated function Vector GetIconLocation()
{
	return Location;
}

simulated function Texture2D GetIcon()
{
	return ObjectiveIcon;
}

simulated function string GetLocalizedName()
{
	return Localize("Objectives", LocalizationKey, LocalizationPackageName);
}

simulated function string GetLocalizedDescription()
{
	return Localize("Objectives", DescriptionLocKey, LocalizationPackageName);
}

simulated function bool UsesMultipleActors()
{
	return false;
}

simulated function string GetLocalizedRequirements();

simulated function string GetActorCount();

simulated function bool GetIsMissionCritical()
{
	return bIsMissionCriticalObjective;
}

defaultproperties
{
	bStatic=false
	bAlwaysRelevant=true
	RemoteRole=ROLE_SimulatedProxy

	ZoneDangerMaterialParamName="Danger"

	//SupportedEvents.Empty
	SupportedEvents.Add(class'KFSeqEvent_MapObjectiveActivated')

	PerPlayerSpawnRateMod=(1.f, 1.f, 1.f, 1.f, 1.f, 1.f)

	EventSeason=SEI_None
	EventIndex=-1

	//These are basically range caps.  For example:
	//		Just win would be 0% - 25%
	//		Standard win would be 25% - 50%
	//		Good win would be 50% - 85%
	//		Perfect win then assumes everything above good win
	JustWinThreshold=0.25
	StandardWinThreshold=0.5
	GoodWinThreshold=0.85
	LocalizationPackageName="KFGame"
}
