//=============================================================================
// KFInterface_MapObjective
//=============================================================================
// Interface common to any type of map objective.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

interface KFInterface_MapObjective;

enum EObjectiveType
{
	EObj_Default,
	EObj_SYG,
	EObj_Weld,
	EObj_Trigger,
};

// Status
simulated function ActivateObjective();
simulated function DeactivateObjective();
simulated function bool IsActive();
simulated function bool UsesProgress();
simulated function int GetDoshReward();
simulated function int GetMaxDoshReward();
simulated function int GetVoshReward();
simulated function int GetMaxVoshReward();
simulated function int GetXPReward();
simulated function int GetMaxXPReward();
simulated function bool IsBonus();
function string GetLocalizedName();
function bool CanActivateObjective();
simulated function float GetProgress();
simulated function bool HasFailedObjective();
simulated function float GetActivationPctChance();
simulated function float GetSpawnRateMod();

simulated function bool UsesMultipleActors();
simulated function string GetActorCount();;

simulated function string GetLocalizedDescription();
simulated function string GetLocalizedRequirements();

// HUD
simulated function bool ShouldDrawIcon();
simulated function Vector GetIconLocation();
simulated function Texture2D GetIcon();

defaultproperties
{
   Name="Default__KFInterface_MapObjective"
   ObjectArchetype=Interface'Core.Default__Interface'
}
