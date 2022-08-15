/*******************************************************************************
 * Ladder generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Ladder extends NavigationPoint
    native
    placeable
    hidecategories(Navigation,Lighting,LightColor,Force);

var LadderVolume MyLadder;
var Ladder LadderList;

event bool SuggestMovePreparation(Pawn Other)
{
    if(MyLadder == none)
    {
        return false;
    }
    if(!MyLadder.InUse(Other))
    {
        MyLadder.PendingClimber = Other;
        return false;
    }
    Other.Controller.bPreparingMove = true;
    Other.Acceleration = vect(0, 0, 0);
    return true;
}

defaultproperties
{
    bSpecialMove=true
    bNotBased=true
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=80
        CollisionRadius=40
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__Ladder.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.S_Ladder'
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__Ladder.Sprite'
    GoodSprite=Sprite
    begin object name=Sprite2 class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__Ladder.Sprite2'
    BadSprite=Sprite2
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.S_Ladder'
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__Ladder.Sprite'
    Components(0)=Sprite
    begin object name=Sprite2 class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__Ladder.Sprite2'
    Components(1)=Sprite2
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__Ladder.Arrow'
    Components(2)=Arrow
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=80
        CollisionRadius=40
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__Ladder.CollisionCylinder'
    Components(3)=CollisionCylinder
    begin object name=PathRenderer class=PathRenderingComponent
        ReplacementPrimitive=none
    object end
    // Reference: PathRenderingComponent'Default__Ladder.PathRenderer'
    Components(4)=PathRenderer
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=80
        CollisionRadius=40
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__Ladder.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}