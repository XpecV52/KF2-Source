/*******************************************************************************
 * KFPlayerStart generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPlayerStart extends PlayerStart
    hidecategories(Navigation,Lighting,LightColor,Force,Collision);

defaultproperties
{
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=86
        CollisionRadius=36
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPlayerStart.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPlayerStart.Sprite'
    GoodSprite=Sprite
    begin object name=Sprite2 class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPlayerStart.Sprite2'
    BadSprite=Sprite2
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPlayerStart.Sprite'
    Components(0)=Sprite
    begin object name=Sprite2 class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPlayerStart.Sprite2'
    Components(1)=Sprite2
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPlayerStart.Arrow'
    Components(2)=Arrow
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=86
        CollisionRadius=36
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPlayerStart.CollisionCylinder'
    Components(3)=CollisionCylinder
    begin object name=PathRenderer class=PathRenderingComponent
        ReplacementPrimitive=none
    object end
    // Reference: PathRenderingComponent'Default__KFPlayerStart.PathRenderer'
    Components(4)=PathRenderer
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=86
        CollisionRadius=36
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPlayerStart.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}