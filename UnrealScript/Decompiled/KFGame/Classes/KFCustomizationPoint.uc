/*******************************************************************************
 * KFCustomizationPoint generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFCustomizationPoint extends NavigationPoint
    hidecategories(Navigation,Lighting,LightColor,Force);

event PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    if(KFGameInfo(WorldInfo.Game) != none)
    {
        KFGameInfo(WorldInfo.Game).CustomizationPointsInitialized();
    }
}

defaultproperties
{
    bAllowPathConnections=false
    bNoAutoConnect=true
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=86
        CollisionRadius=36
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFCustomizationPoint.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.S_Pawn'
        SpriteCategoryName=PlayerStart
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFCustomizationPoint.Sprite'
    GoodSprite=Sprite
    begin object name=Sprite2 class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFCustomizationPoint.Sprite2'
    BadSprite=Sprite2
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.S_Pawn'
        SpriteCategoryName=PlayerStart
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFCustomizationPoint.Sprite'
    Components(0)=Sprite
    begin object name=Sprite2 class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFCustomizationPoint.Sprite2'
    Components(1)=Sprite2
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFCustomizationPoint.Arrow'
    Components(2)=Arrow
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=86
        CollisionRadius=36
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFCustomizationPoint.CollisionCylinder'
    Components(3)=CollisionCylinder
    begin object name=PathRenderer class=PathRenderingComponent
        ReplacementPrimitive=none
    object end
    // Reference: PathRenderingComponent'Default__KFCustomizationPoint.PathRenderer'
    Components(4)=PathRenderer
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=86
        CollisionRadius=36
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFCustomizationPoint.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}