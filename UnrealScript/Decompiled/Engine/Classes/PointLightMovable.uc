/*******************************************************************************
 * PointLightMovable generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PointLightMovable extends PointLight
    native(Light)
    placeable
    hidecategories(Navigation)
    classgroup(Lights,PointLights);

defaultproperties
{
    begin object name=PointLightComponent0 class=PointLightComponent
        PreviewLightRadius=DrawLightRadiusComponent'Default__PointLightMovable.DrawLightRadius0'
        PreviewLightSourceRadius=DrawLightRadiusComponent'Default__PointLightMovable.DrawLightSourceRadius0'
        LightSprite=SpriteComponent'Default__PointLightMovable.Sprite'
        CastDynamicShadows=true
        UseDirectLightMap=false
        LightAffectsClassification=ELightAffectsClassification.LAC_DYNAMIC_AND_STATIC_AFFECTING
    object end
    // Reference: PointLightComponent'Default__PointLightMovable.PointLightComponent0'
    LightComponent=PointLightComponent0
    begin object name=LightMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__PointLightMovable.LightMeshComponent0'
    LightMesh=LightMeshComponent0
    begin object name=LensFlareComponent0 class=LensFlareComponent
        NextTraceTime=0.0 // Ka v oh
        ReplacementPrimitive=none
    object end
    // Reference: LensFlareComponent'Default__PointLightMovable.LensFlareComponent0'
    LensFlareComp=LensFlareComponent0
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.LightIcons.Light_Point_Moveable_DynamicsAndStatics'
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__PointLightMovable.Sprite'
    Components(0)=Sprite
    begin object name=DrawLightRadius0 class=DrawLightRadiusComponent
        ReplacementPrimitive=none
    object end
    // Reference: DrawLightRadiusComponent'Default__PointLightMovable.DrawLightRadius0'
    Components(1)=DrawLightRadius0
    begin object name=DrawLightSourceRadius0 class=DrawLightRadiusComponent
        ReplacementPrimitive=none
    object end
    // Reference: DrawLightRadiusComponent'Default__PointLightMovable.DrawLightSourceRadius0'
    Components(2)=DrawLightSourceRadius0
    begin object name=PointLightComponent0 class=PointLightComponent
        PreviewLightRadius=DrawLightRadiusComponent'Default__PointLightMovable.DrawLightRadius0'
        PreviewLightSourceRadius=DrawLightRadiusComponent'Default__PointLightMovable.DrawLightSourceRadius0'
        LightSprite=SpriteComponent'Default__PointLightMovable.Sprite'
        CastDynamicShadows=true
        UseDirectLightMap=false
        LightAffectsClassification=ELightAffectsClassification.LAC_DYNAMIC_AND_STATIC_AFFECTING
    object end
    // Reference: PointLightComponent'Default__PointLightMovable.PointLightComponent0'
    Components(3)=PointLightComponent0
    bHardAttach=true
    bMovable=true
    begin object name=LightMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__PointLightMovable.LightMeshComponent0'
    CollisionComponent=LightMeshComponent0
}