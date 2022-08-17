/*******************************************************************************
 * DominantDirectionalLightMovable generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DominantDirectionalLightMovable extends DominantDirectionalLight
    native(Light)
    placeable
    hidecategories(Navigation)
    classgroup(Lights,DirectionalLights);

defaultproperties
{
    LightComponent=DominantDirectionalLightComponent'Default__DominantDirectionalLightMovable.DominantDirectionalLightComponent0'
    begin object name=LightMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__DominantDirectionalLightMovable.LightMeshComponent0'
    LightMesh=LightMeshComponent0
    begin object name=LensFlareComponent0 class=LensFlareComponent
        NextTraceTime=0.0 // Ka v oh
        ReplacementPrimitive=none
    object end
    // Reference: LensFlareComponent'Default__DominantDirectionalLightMovable.LensFlareComponent0'
    LensFlareComp=LensFlareComponent0
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__DominantDirectionalLightMovable.Sprite'
    Components(0)=Sprite
    begin object name=ArrowComponent0 class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__DominantDirectionalLightMovable.ArrowComponent0'
    Components(1)=ArrowComponent0
    Components(2)=DominantDirectionalLightComponent'Default__DominantDirectionalLightMovable.DominantDirectionalLightComponent0'
    Physics=EPhysics.PHYS_Interpolating
    bMovable=true
    BlockRigidBody=false
    begin object name=LightMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__DominantDirectionalLightMovable.LightMeshComponent0'
    CollisionComponent=LightMeshComponent0
}