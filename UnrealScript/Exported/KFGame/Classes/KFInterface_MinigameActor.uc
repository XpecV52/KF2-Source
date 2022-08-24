//=============================================================================
// KFInterface_MinigameActor
//=============================================================================
// Interface for any code-facing minigame actors.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

interface KFInterface_MinigameActor;

function bool CanBeActivated(KFTrigger_MinigameButton ActivationSource);
function Activated(KFTrigger_MinigameButton ActivationSource);
function Deactivated();
simulated event bool CanPlayAkEvent(Actor inOwner, name BoneName);

defaultproperties
{
   Name="Default__KFInterface_MinigameActor"
   ObjectArchetype=Interface'Core.Default__Interface'
}
