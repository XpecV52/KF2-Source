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

// Status
simulated function ActivateObjective();
simulated function DeactivateObjective();
function bool CanActivateObjective();
simulated function float GetProgress();

// HUD
simulated function Vector GetIconLocation();
simulated function Texture2D GetIcon();

defaultproperties
{
   Name="Default__KFInterface_MapObjective"
   ObjectArchetype=Interface'Core.Default__Interface'
}
