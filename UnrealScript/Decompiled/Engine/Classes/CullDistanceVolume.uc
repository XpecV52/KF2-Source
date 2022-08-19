/*******************************************************************************
 * CullDistanceVolume generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class CullDistanceVolume extends Volume
    native
    placeable
    hidecategories(Navigation,Object,Movement,Display,Advanced,Attachment,Collision,Volume);

struct native CullDistanceSizePair
{
    /** Size to associate with cull distance. */
    var() float Size;
    /** Cull distance associated with size. */
    var() float CullDistance;

    structdefaultproperties
    {
        Size=0
        CullDistance=0
    }
};

/**  
 *Array of size and cull distance pairs. The code will calculate the sphere diameter of a primitive's BB and look for a best
 * fit in this array to determine which cull distance to use.
 */
var() array<CullDistanceSizePair> CullDistances;
/** Whether the volume is currently enabled or not. */
var() bool bEnabled;

defaultproperties
{
    CullDistances(0)=(Size=0,CullDistance=0)
    CullDistances(1)=(Size=10000,CullDistance=0)
    bEnabled=true
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
        CollideActors=false
        BlockNonZeroExtent=false
    object end
    // Reference: BrushComponent'Default__CullDistanceVolume.BrushComponent0'
    BrushComponent=BrushComponent0
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
        CollideActors=false
        BlockNonZeroExtent=false
    object end
    // Reference: BrushComponent'Default__CullDistanceVolume.BrushComponent0'
    Components(0)=BrushComponent0
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    bCollideActors=false
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
        CollideActors=false
        BlockNonZeroExtent=false
    object end
    // Reference: BrushComponent'Default__CullDistanceVolume.BrushComponent0'
    CollisionComponent=BrushComponent0
    SupportedEvents=none
}