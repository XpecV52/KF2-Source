//=============================================================================
// KFMapObjective_AreaDefense
//=============================================================================
// Base class for all map objectives that require the players to hold a volume.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFMapObjective_AreaDefense extends KFMapObjective_VolumeBase
	abstract;

/** List of touching humans maintained by touch/untouch events */
var array<KFPawn_Human> TouchingHumans;
var array<KFPawn_Monster> TouchingZeds;

/** Per-player thresholds for amount of players needed in the volume */
var() const int PlayerThresholds[6];

/** Per-player count thresholds for amount of zeds allowed in volume */
var() const int ZedThresholds[6];

/** Whether or not the zone is in the danger state */
var() repnotify bool bDangerState;
var	  repnotify bool bTooFewPlayers;
var	  repnotify bool bTooManyZeds;

/** Current reward amount */
var float CurrentRewardAmount;

/** Win thresholds - Named to match the VO tracks*/
var float JustWinThreshold;
var float StandardWinThreshold;
var float GoodWinThreshold;

replication
{
    if (Role == ROLE_Authority)
        CurrentRewardAmount, bDangerState, bTooFewPlayers, bTooManyZeds;
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
	super.ActivateObjective();

	if (Role == ROLE_Authority)
	{
		bActive = true;
		CurrentRewardAmount = GetMaxDoshReward();
	}

	if (WorldInfo.NetMode != NM_DedicatedServer)
    {
        UpdateMeshArrayState();

		if (bUseTrailToVolume)
		{
			TrailActor = class'WorldInfo'.static.GetWorldInfo().Spawn(class'KFReplicatedShowPathActor', none);
			if (TrailActor != none)
			{
				TrailActor.SetEmitterTemplate(ParticleSystem'FX_Gameplay_EMIT.FX_Objective_White_Trail');
				TrailActor.SetPathTarget(self, self, VCT_NotInVolume);
			}
		}
    }
}

simulated function DeactivateObjective()
{
	super.DeactivateObjective();

	if (Role == ROLE_Authority)
	{
		bActive = false;
	}

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		UpdateMeshArrayState();

		if (bUseTrailToVolume && TrailActor != none)
		{
			TrailActor.Destroy();
			TrailActor = none;
		}
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
	return false;
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

simulated function bool IsBonus()
{
	return true;
}

simulated function int GetPlayersInObjective()
{
	return 0;
}

//-----------------------------------------------------------------------------
// Rewards
//-----------------------------------------------------------------------------
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

simulated function string GetLocalizedRequirements();

simulated function GetLocalizedStatus(out string statusMessage, out int bWarning, out int bNotification)
{
	statusMessage = "";

	if (GetProgress() >= 1.f)
	{
		statusMessage = Localize("Objectives", "KillRemainingZeds", LocalizationPackageName);
		bWarning = 0;
		bNotification = 0;
		return;
	}

	if (bTooFewPlayers)
	{
		statusMessage = Localize("Objectives", "TooFewPlayers", LocalizationPackageName);
		bWarning = 1;
		return;
	}
	else if (bTooManyZeds)
	{
		statusMessage = Localize("Objectives", "TooManyZeds", LocalizationPackageName);
		bWarning = 1;
		return;
	}
}

simulated function string GetProgressText();

simulated function bool GetIsMissionCritical()
{
	return bIsMissionCriticalObjective;
}

defaultproperties
{
   JustWinThreshold=0.250000
   StandardWinThreshold=0.500000
   GoodWinThreshold=0.850000
   LocalizationPackageName="KFGame"
   PerPlayerSpawnRateMod(0)=1.000000
   PerPlayerSpawnRateMod(1)=1.000000
   PerPlayerSpawnRateMod(2)=1.000000
   PerPlayerSpawnRateMod(3)=1.000000
   PerPlayerSpawnRateMod(4)=1.000000
   PerPlayerSpawnRateMod(5)=1.000000
   ZoneDangerMaterialParamName="Danger"
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'KFGame.Default__KFMapObjective_VolumeBase:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'KFGame.Default__KFMapObjective_VolumeBase:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   RemoteRole=ROLE_SimulatedProxy
   bStatic=False
   bAlwaysRelevant=True
   CollisionComponent=BrushComponent0
   Name="Default__KFMapObjective_AreaDefense"
   ObjectArchetype=KFMapObjective_VolumeBase'KFGame.Default__KFMapObjective_VolumeBase'
}
