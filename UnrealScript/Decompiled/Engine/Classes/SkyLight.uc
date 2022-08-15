/*******************************************************************************
 * SkyLight generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SkyLight extends Light
    native(Light)
    placeable
    hidecategories(Navigation)
    classgroup(Lights,SkyLights);

defaultproperties
{
    begin object name=SkyLightComponent0 class=SkyLightComponent
        UseDirectLightMap=true
        bCanAffectDynamicPrimitivesOutsideDynamicChannel=true
    object end
    // Reference: SkyLightComponent'Default__SkyLight.SkyLightComponent0'
    LightComponent=SkyLightComponent0
    begin object name=LightMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__SkyLight.LightMeshComponent0'
    LightMesh=LightMeshComponent0
    begin object name=LensFlareComponent0 class=LensFlareComponent
        NextTraceTime=0.0 // Ka v oh
        ReplacementPrimitive=none
    object end
    // Reference: LensFlareComponent'Default__SkyLight.LensFlareComponent0'
    LensFlareComp=LensFlareComponent0
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.LightIcons.Light_SkyLight'
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__SkyLight.Sprite'
    Components(0)=Sprite
    begin object name=LightMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__SkyLight.LightMeshComponent0'
    Components(1)=LightMeshComponent0
    begin object name=LensFlareComponent0 class=LensFlareComponent
        NextTraceTime=0.0 // Ka v oh
        ReplacementPrimitive=none
    object end
    // Reference: LensFlareComponent'Default__SkyLight.LensFlareComponent0'
    Components(2)=LensFlareComponent0
    begin object name=SkyLightComponent0 class=SkyLightComponent
        UseDirectLightMap=true
        bCanAffectDynamicPrimitivesOutsideDynamicChannel=true
    object end
    // Reference: SkyLightComponent'Default__SkyLight.SkyLightComponent0'
    Components(3)=SkyLightComponent0
    begin object name=LightMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__SkyLight.LightMeshComponent0'
    CollisionComponent=LightMeshComponent0
}