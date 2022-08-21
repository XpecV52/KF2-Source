/*******************************************************************************
 * Light generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Light extends Actor
    native(Light)
    notplaceable
    hidecategories(Navigation)
    classgroup(Lights);

enum ELightAnimationTechnique
{
    LightAnim_None,
    LightAnim_Flicker,
    LightAnim_Pulse,
    LightAnim_Strobe,
    LightAnim_ChaoticFlicker,
    LightAnim_InverseChaoticFlicker,
    LightAnim_MAX
};

var() const editconst export editinline LightComponent LightComponent;
/** The maximum brightness value for this light. Default is 1.0 */
var(LightAnimation) const float MaxBrightness<UIMin=0.0|ClampMin=0.0>;
/**  
 *The minimum brightness override value for this light. If 0, it uses the
 *       global value for the light animation type specified in WorldInfo.
 */
var(LightAnimation) const float MinBrightness<UIMin=0.0|ClampMin=0.0>;
/** Light animation type used by this light */
var(LightAnimation) Light.ELightAnimationTechnique AnimationType;
/** The rate at which the LightAnimation is played. Default is 1.0. Must be greater than 0 */
var(LightAnimation) float AnimationFrequency<UIMin=0.01|ClampMin=0.01|UIMax=20.0|ClampMax=20.0>;
/**  
 *Time offset into the LightAnimation. This is used to add variation so that
 *all the animations are not in perfect sync. default is 0.0.
 *Note: This value will not have any effect it is a multiple of the inverse of the AnimationFrequency.
 *Eg. If the AnimationFrequency is 0.5, AnimationTimeOffsets of 2, 4, 6 ... will have same effect at 0
 */
var(LightAnimation) float AnimationTimeOffset;
/** The static mesh represtation of the light fixture */
var(LightAnimation) export editinline StaticMeshComponent LightMesh;
var transient array<MaterialInstanceConstant> LightMeshMICs;
var transient array<MaterialInstanceConstant> BaseMeshMICs;
/** Lens flare component for the light */
var(LightAnimation) export editinline LensFlareComponent LensFlareComp;
var transient array<MaterialInstanceConstant> LensFlareMICs;
var transient float CurveOutputValue;
var repnotify bool bEnabled;

replication
{
     if(Role == ROLE_Authority)
        bEnabled;
}

// Export ULight::execIsVolumetricLightingSupported(FFrame&, void* const)
native static final function bool IsVolumetricLightingSupported();

// Export ULight::execAreLightFunctionsSupported(FFrame&, void* const)
native static final function bool AreLightFunctionsSupported();

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'bEnabled')
    {
        LightComponent.SetEnabled(bEnabled);
        LensFlareComp.SetIsActive(bEnabled);
        LensFlareComp.LastRenderTime = WorldInfo.TimeSeconds;        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
}

simulated function OnToggle(SeqAct_Toggle Action)
{
    if(!bStatic)
    {
        if(Action.InputLinks[0].bHasImpulse)
        {
            LightComponent.SetEnabled(true);
            LensFlareComp.SetIsActive(true);            
        }
        else
        {
            if(Action.InputLinks[1].bHasImpulse)
            {
                LightComponent.SetEnabled(false);
                LensFlareComp.SetIsActive(false);                
            }
            else
            {
                if(Action.InputLinks[2].bHasImpulse)
                {
                    LightComponent.SetEnabled(!LightComponent.bEnabled);
                    LensFlareComp.SetIsActive(LightComponent.bEnabled);
                }
            }
        }
        bEnabled = LightComponent.bEnabled;
        ForceNetRelevant();
        SetForcedInitialReplicatedProperty(BoolProperty'bEnabled', bEnabled == default.bEnabled);
        LensFlareComp.LastRenderTime = WorldInfo.TimeSeconds;
    }
}

// Export ULight::execHasVolumetricLightMesh(FFrame&, void* const)
native function bool HasVolumetricLightMesh();

event PostBeginPlay()
{
    local int I;
    local MaterialInterface ParentMat;
    local MaterialInstanceConstant NewMIC;
    local float DummyValue;
    local bool bVolumetricLightMesh;

    if(WorldInfo.NetMode == NM_DedicatedServer)
    {
        SetTickIsDisabled(true);
        return;
    }
    if(!AreLightFunctionsSupported() && LightComponent.Function != none)
    {
        SetTickIsDisabled(true);
        LightComponent.SetEnabled(false);
        return;
    }
    if(LightMesh != none)
    {
        bVolumetricLightMesh = HasVolumetricLightMesh();
    }
    if(!bVolumetricLightMesh || IsVolumetricLightingSupported())
    {
        LightMeshMICs.Remove(0, LightMeshMICs.Length;
        if(LightMesh != none)
        {
            I = 0;
            J0x10A:

            if(I < LightMesh.GetNumElements())
            {
                ParentMat = LightMesh.GetMaterial(I);
                if((ParentMat != none) && ParentMat.GetScalarParameterValue(Class'TWMaterialExpressionLightBrightnessMultiplier'.default.ParameterName, DummyValue))
                {
                    NewMIC = LightMesh.CreateAndSetMaterialInstanceConstant(I);
                    LightMeshMICs.AddItem(NewMIC;
                }
                ++ I;
                goto J0x10A;
            }
        }        
    }
    else
    {
        if(bVolumetricLightMesh && !IsVolumetricLightingSupported())
        {
            if(LightMesh != none)
            {
                DetachComponent(LightMesh);
            }
        }
    }
    BaseMeshMICs.Remove(0, BaseMeshMICs.Length;
    if(BaseSkelComponent != none)
    {
        I = 0;
        J0x28C:

        if(I < BaseSkelComponent.GetNumElements())
        {
            ParentMat = BaseSkelComponent.GetMaterial(I);
            if((ParentMat != none) && ParentMat.GetScalarParameterValue(Class'TWMaterialExpressionLightBrightnessMultiplier'.default.ParameterName, DummyValue))
            {
                NewMIC = BaseSkelComponent.CreateAndSetMaterialInstanceConstant(I);
                BaseMeshMICs.AddItem(NewMIC;
            }
            ++ I;
            goto J0x28C;
        }
    }
    LensFlareMICs.Remove(0, LensFlareMICs.Length;
    if(LensFlareComp != none)
    {
        I = 0;
        J0x3CB:

        if(I < LensFlareComp.GetNumMaterials())
        {
            ParentMat = LensFlareComp.GetMaterial(I);
            if((ParentMat != none) && ParentMat.GetScalarParameterValue(Class'TWMaterialExpressionLightBrightnessMultiplier'.default.ParameterName, DummyValue))
            {
                NewMIC = LensFlareComp.CreateAndSetMaterialInstanceConstant(I);
                LensFlareMICs.AddItem(NewMIC;
            }
            ++ I;
            goto J0x3CB;
        }
    }
}

event TriggerFlickerEvent()
{
    TriggerEventClass(Class'TWSeqEvent_LightFlicker', self);
}

defaultproperties
{
    MaxBrightness=1
    AnimationFrequency=1
    begin object name=LightMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
        bAllowApproximateOcclusion=true
        bOverridePrecomputedShadowOcclusion=true
    object end
    // Reference: StaticMeshComponent'Default__Light.LightMeshComponent0'
    LightMesh=LightMeshComponent0
    begin object name=LensFlareComponent0 class=LensFlareComponent
        NextTraceTime=0.0 // Ka v oh
        ReplacementPrimitive=none
    object end
    // Reference: LensFlareComponent'Default__Light.LensFlareComponent0'
    LensFlareComp=LensFlareComponent0
    CurveOutputValue=-1
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.LightIcons.Light_Point_Stationary_Statics'
        SpriteCategoryName=Lighting
        ReplacementPrimitive=none
        HiddenGame=true
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
        Scale=0.25
    object end
    // Reference: SpriteComponent'Default__Light.Sprite'
    Components(0)=Sprite
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bNoDelete=true
    bRouteBeginPlayEvenIfStatic=false
    bMovable=false
    BlockRigidBody=true
    begin object name=LightMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
        bAllowApproximateOcclusion=true
        bOverridePrecomputedShadowOcclusion=true
    object end
    // Reference: StaticMeshComponent'Default__Light.LightMeshComponent0'
    CollisionComponent=LightMeshComponent0
    SupportedEvents(0)=class'TWSeqEvent_LightFlicker'
}