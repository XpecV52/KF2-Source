/*******************************************************************************
 * PortalVolume generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PortalVolume extends Volume
    native
    placeable
    hidecategories(Navigation,Object,Movement,Display,Advanced,Attachment,Collision,Volume);

var array<PortalTeleporter> Portals;

defaultproperties
{
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
        CollideActors=false
        BlockNonZeroExtent=false
    object end
    // Reference: BrushComponent'Default__PortalVolume.BrushComponent0'
    BrushComponent=BrushComponent0
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
        CollideActors=false
        BlockNonZeroExtent=false
    object end
    // Reference: BrushComponent'Default__PortalVolume.BrushComponent0'
    Components(0)=BrushComponent0
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    bCollideActors=false
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
        CollideActors=false
        BlockNonZeroExtent=false
    object end
    // Reference: BrushComponent'Default__PortalVolume.BrushComponent0'
    CollisionComponent=BrushComponent0
    SupportedEvents(0)=class'SeqEvent_Touch'
}