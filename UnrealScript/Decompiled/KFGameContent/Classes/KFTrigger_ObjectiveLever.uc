/*******************************************************************************
 * KFTrigger_ObjectiveLever generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFTrigger_ObjectiveLever extends KFTrigger_MinigameButton
    hidecategories(Navigation);

var bool bFathersBlessing;
var KFMapObjective_ActivateTrigger OwningObjective;

simulated function bool ReadyToActivate()
{
    local bool bReadyToActivate;

    bReadyToActivate = super.ReadyToActivate();
    return bReadyToActivate && bFathersBlessing;
}

function ActivateGame()
{
    if((((OwningObjective != none) && ReadyToActivate()) && bActiveGame) && !bInProgress)
    {
        OwningObjective.OnTriggerActivated();
    }
    super.ActivateGame();
}

function AllowReactivation()
{
    super.AllowReactivation();
    if(OwningObjective != none)
    {
        OwningObjective.OnTriggerReactivated();
    }
}

defaultproperties
{
    bFathersBlessing=true
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFTrigger_ObjectiveLever.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFTrigger_ObjectiveLever.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFTrigger_ObjectiveLever.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFTrigger_ObjectiveLever.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}