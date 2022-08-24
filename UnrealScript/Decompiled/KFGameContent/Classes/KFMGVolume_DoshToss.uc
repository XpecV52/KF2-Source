/*******************************************************************************
 * KFMGVolume_DoshToss generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFMGVolume_DoshToss extends Volume
    hidecategories(Navigation,Object,Movement,Display);

event Touch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
{
    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    if((Role == ROLE_Authority) && KFDroppedPickup(Other) != none)
    {
        KFDroppedPickup(Other).DisableAuthorityRBSim();
    }
}

defaultproperties
{
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__KFMGVolume_DoshToss.BrushComponent0'
    BrushComponent=BrushComponent0
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__KFMGVolume_DoshToss.BrushComponent0'
    Components(0)=BrushComponent0
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__KFMGVolume_DoshToss.BrushComponent0'
    CollisionComponent=BrushComponent0
}