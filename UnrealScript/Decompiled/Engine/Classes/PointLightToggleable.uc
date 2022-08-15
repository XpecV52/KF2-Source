/*******************************************************************************
 * PointLightToggleable generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PointLightToggleable extends PointLight
    native(Light)
    placeable
    hidecategories(Navigation)
    classgroup(Lights,PointLights);

struct CheckpointRecord
{
    var bool bEnabled;

    structdefaultproperties
    {
        bEnabled=false
    }
};

function bool ShouldSaveForCheckpoint()
{
    return RemoteRole != ROLE_None;
}

function CreateCheckpointRecord(out CheckpointRecord Record)
{
    Record.bEnabled = bEnabled;
}

function ApplyCheckpointRecord(const out CheckpointRecord Record)
{
    bEnabled = Record.bEnabled;
    LightComponent.SetEnabled(bEnabled);
    ForceNetRelevant();
}

defaultproperties
{
    begin object name=PointLightComponent0 class=PointLightComponent
        PreviewLightRadius=DrawLightRadiusComponent'Default__PointLightToggleable.DrawLightRadius0'
        LightmassSettings=(IndirectLightingScale=0)
        PreviewLightSourceRadius=DrawLightRadiusComponent'Default__PointLightToggleable.DrawLightSourceRadius0'
        LightSprite=SpriteComponent'Default__PointLightToggleable.Sprite'
        UseDirectLightMap=false
    object end
    // Reference: PointLightComponent'Default__PointLightToggleable.PointLightComponent0'
    LightComponent=PointLightComponent0
    begin object name=LightMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__PointLightToggleable.LightMeshComponent0'
    LightMesh=LightMeshComponent0
    begin object name=LensFlareComponent0 class=LensFlareComponent
        NextTraceTime=0.0 // Ka v oh
        ReplacementPrimitive=none
    object end
    // Reference: LensFlareComponent'Default__PointLightToggleable.LensFlareComponent0'
    LensFlareComp=LensFlareComponent0
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.LightIcons.Light_Point_Toggleable_Statics'
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__PointLightToggleable.Sprite'
    Components(0)=Sprite
    begin object name=LightMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__PointLightToggleable.LightMeshComponent0'
    Components(1)=LightMeshComponent0
    begin object name=LensFlareComponent0 class=LensFlareComponent
        NextTraceTime=0.0 // Ka v oh
        ReplacementPrimitive=none
    object end
    // Reference: LensFlareComponent'Default__PointLightToggleable.LensFlareComponent0'
    Components(2)=LensFlareComponent0
    begin object name=DrawLightRadius0 class=DrawLightRadiusComponent
        ReplacementPrimitive=none
    object end
    // Reference: DrawLightRadiusComponent'Default__PointLightToggleable.DrawLightRadius0'
    Components(3)=DrawLightRadius0
    begin object name=DrawLightSourceRadius0 class=DrawLightRadiusComponent
        ReplacementPrimitive=none
    object end
    // Reference: DrawLightRadiusComponent'Default__PointLightToggleable.DrawLightSourceRadius0'
    Components(4)=DrawLightSourceRadius0
    begin object name=PointLightComponent0 class=PointLightComponent
        PreviewLightRadius=DrawLightRadiusComponent'Default__PointLightToggleable.DrawLightRadius0'
        LightmassSettings=(IndirectLightingScale=0)
        PreviewLightSourceRadius=DrawLightRadiusComponent'Default__PointLightToggleable.DrawLightSourceRadius0'
        LightSprite=SpriteComponent'Default__PointLightToggleable.Sprite'
        UseDirectLightMap=false
    object end
    // Reference: PointLightComponent'Default__PointLightToggleable.PointLightComponent0'
    Components(5)=PointLightComponent0
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bHardAttach=true
    begin object name=LightMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__PointLightToggleable.LightMeshComponent0'
    CollisionComponent=LightMeshComponent0
}