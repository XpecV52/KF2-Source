//=============================================================================
// KFTrigger_ObjectiveLever
//=============================================================================
// Minigame button that is used by map objective. This lever both needs the
// approval of the trigger and the objective in order to be activated.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFTrigger_ObjectiveLever extends KFTrigger_MinigameButton
	config(Game);

/** If the owning Map Objective says we can be activated or not. */
var bool bFathersBlessing;

/** Reference to owning map objective. */
var KFMapObjective_ActivateTrigger OwningObjective;

simulated function bool ReadyToActivate()
{
	local bool bReadyToActivate;

	bReadyToActivate = super.ReadyToActivate();
	return bReadyToActivate && bFathersBlessing;
}

function ActivateGame()
{
	if (OwningObjective != none && ReadyToActivate() && bActiveGame && !bInProgress)
	{
		OwningObjective.OnTriggerActivated();
	}

	super.ActivateGame();
}

function AllowReactivation()
{
	super.AllowReactivation();

	if (OwningObjective != none)
	{
		OwningObjective.OnTriggerReactivated();
	}
}

defaultproperties
{
	bFathersBlessing=true
}
