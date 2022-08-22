/*******************************************************************************
 * LightComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class LightComponent extends ActorComponent
    abstract
    native(Light)
    noexport;

enum ELightAffectsClassification
{
    LAC_USER_SELECTED,
    LAC_DYNAMIC_AFFECTING,
    LAC_STATIC_AFFECTING,
    LAC_DYNAMIC_AND_STATIC_AFFECTING,
    LAC_MAX
};

enum ELightShadowMode
{
    LightShadow_Normal,
    LightShadow_Modulate,
    LightShadow_ModulateBetter,
    LightShadow_MAX
};

enum EShadowProjectionTechnique
{
    ShadowProjTech_Default,
    ShadowProjTech_PCF,
    ShadowProjTech_VSM,
    ShadowProjTech_BPCF_Low,
    ShadowProjTech_BPCF_Medium,
    ShadowProjTech_BPCF_High,
    ShadowProjTech_MAX
};

enum EShadowFilterQuality
{
    SFQ_Low,
    SFQ_Medium,
    SFQ_High,
    SFQ_MAX
};

struct LightingChannelContainer
{
    var bool bInitialized;
    var bool BSP;
    var bool Static;
    var bool Dynamic;
    var bool CompositeDynamic;
    var bool Skybox;
    var bool Unnamed_1;
    var bool Unnamed_2;
    var bool Unnamed_3;
    var bool Unnamed_4;
    var bool Unnamed_5;
    var bool Unnamed_6;
    var bool Cinematic_1;
    var bool Cinematic_2;
    var bool Cinematic_3;
    var bool Cinematic_4;
    var bool Cinematic_5;
    var bool Cinematic_6;
    var bool Cinematic_7;
    var bool Cinematic_8;
    var bool Cinematic_9;
    var bool Cinematic_10;
    var bool Gameplay_1;
    var bool Gameplay_2;
    var bool Gameplay_3;
    var bool Gameplay_4;
    var bool Crowd;
    /** Whether the lighting channel has been initialized. Used to determine whether UPrimitveComponent::Attach should set defaults. // Custom lighting channel implementation// User settable channels that are auto set and true for lights// User set channels. */
    var() bool Indoor;
    /** Whether the lighting channel has been initialized. Used to determine whether UPrimitveComponent::Attach should set defaults. // Custom lighting channel implementation// User settable channels that are auto set and true for lights// User set channels. */
    var() bool Outdoor;

    structdefaultproperties
    {
        bInitialized=false
        BSP=false
        Static=false
        Dynamic=false
        CompositeDynamic=false
        Skybox=false
        Unnamed_1=false
        Unnamed_2=false
        Unnamed_3=false
        Unnamed_4=false
        Unnamed_5=false
        Unnamed_6=false
        Cinematic_1=false
        Cinematic_2=false
        Cinematic_3=false
        Cinematic_4=false
        Cinematic_5=false
        Cinematic_6=false
        Cinematic_7=false
        Cinematic_8=false
        Cinematic_9=false
        Cinematic_10=false
        Gameplay_1=false
        Gameplay_2=false
        Gameplay_3=false
        Gameplay_4=false
        Crowd=false
        Indoor=false
        Outdoor=false
    }
};

var private noimport native const transient Pointer SceneInfo;
var native const transient Matrix WorldToLight;
var native const transient Matrix LightToWorld;
var duplicatetransient const Guid LightGuid;
var duplicatetransient const Guid LightmapGuid;
var() interp const float Brightness<UIMin=0.0|UIMax=20.0>;
var() interp const Color LightColor;
/** Used to control the contribution of NdotL Lambertian lighting factor. Primary use case if for fill lights that have DisableSpecular=True */
var() float Hardness<UIMin=0.0|UIMax=1.0|ClampMin=0.0|ClampMax=1.0>;
/**  
 *The light function to be applied to this light.
 * Note that only non-lightmapped lights (UseDirectLightMap=False) can have a light function.
 */
var() const export editinline LightFunction Function;
/** Is this light enabled? */
var() const bool bEnabled;
/** Whether the light should cast any shadows. */
var() const bool CastShadows;
/** Whether the light should cast shadows from static objects.  Also requires Cast Shadows to be set to True. */
var() const bool CastStaticShadows;
/**  
 *Whether the light should cast dynamic whole scene shadows from static objects.  Also requires Cast Shadows to be set to True.
 * This is usually used in combination with Cast Static Shadows set to True, and the primitives the light affects will either cast a
 * static shadow or a dynamic shadow based on the proximity of the camera to the light.
 */
var() bool CastDynamicShadows<DisplayName=Cast Whole Scene Dynamic Shadows>;
var bool ForceCastDynamicShadows;
/** Whether the light should cast shadows from objects with composite lighting (i.e. an enabled light environment). */
var() bool bCastCompositeShadow;
/** If bCastCompositeShadow=TRUE, whether the light should affect the composite shadow direction. */
var() bool bAffectCompositeShadowDirection;
/**  
 *If enabled and the light casts modulated shadows, this will cause self-shadowing of shadows rendered from this light to use normal shadow blending.
 * This is useful to get better quality self shadowing while still having a shadow on the lightmapped environment.
 * When enabled it incurs most of the rendering overhead of both approaches combined.
 */
var() bool bNonModulatedSelfShadowing;
/** Whether the light should cast shadows only from a dynamic object onto itself. */
var() interp bool bSelfShadowOnly;
/** Whether to allow preshadows (the static environment casting dynamic shadows on dynamic objects) from this light. */
var() bool bAllowPreShadow<DisplayName=Allow Per Object PreShadow>;
var const bool bForceDynamicLight;
var const bool UseDirectLightMap;
var const bool bHasLightEverBeenBuiltIntoLightMap;
var const bool bCanAffectDynamicPrimitivesOutsideDynamicChannel;
/** Whether to render light shafts from this light.  Only non-static lights can render light shafts (toggleable, movable or dominant types). */
var(LightShafts) bool bRenderLightShafts;
/** Whether to replace this light's analytical specular with image based specular on materials that support it. */
var(ImageReflection) bool bUseImageReflectionSpecular<bShowOnlyWhenTrue=bShowD3D11Properties>;
var protected const bool bPrecomputedLightingIsValid;
var protected const bool bExplicitlyAssignedLight;
var bool bAllowCompositingIntoDLE;
/**  
 *Whether the light should cast dynamic per object shadows from dynamic objects that have Allow Per Object Shadows set to True.
 * This must be set to true if you want the light to cast character shadows (which are per object). Also requires Cast Shadow to be set to True.
 */
var() bool bCastPerObjectShadows<DisplayName=Cast Per Object Dynamic Shadows>;
/** If set, the auto light channel generation will not modify the light channel for this light */
var() const bool bOverrideAutoLightingChannels;
/**  
 *Disable specular component of the light for diffuse only lighting.
 * This can be used to simulate fill lighting
 */
var() bool bDisableSpecular;
var transient bool bOverrideLightAnimTick;
var bool bUpdateOwnerRenderTime;
var const export editinline LightEnvironmentComponent LightEnvironment;
/** Lighting channels controlling light/ primitive interaction. Only allows interaction if at least one channel is shared */
var() const LightingChannelContainer LightingChannels;
/**  
 *This is the classification of this light.  This is used for placing a light for an explicit
 * purpose.  Basically you can now have "type" information with lights and understand the
 * intent of why a light was placed.  This is very useful for content people getting maps
 * from others and understanding why there is a dynamic affect light in the middle of the world
 * with a radius of 32k!  And also useful for being able to do searches such as the following:
 * show me all lights which effect dynamic objects.  Now show me the set of lights which are
 * not explicitly set as Dynamic Affecting lights.
 */
var() const editconst LightComponent.ELightAffectsClassification LightAffectsClassification;
/** The type of shadowing to apply for the light. */
var() LightComponent.ELightShadowMode LightShadowMode;
/** The color to modulate with pixels that receive a dynamic shadow from this light (if it casts modulated shadows). */
var() LinearColor ModShadowColor;
var float ModShadowFadeoutTime;
var float ModShadowFadeoutExponent;
var duplicatetransient native const int LightListIndex;
var LightComponent.EShadowProjectionTechnique ShadowProjectionTechnique;
/** The quality of filtering to use for dynamic shadows cast by the light. */
var() LightComponent.EShadowFilterQuality ShadowFilterQuality;
/**  
 *Override for min dimensions (in texels) allowed for rendering shadow subject depths.
 * This also controls shadow fading, once the shadow resolution reaches MinShadowResolution it will be faded out completely.
 * A value of 0 defaults to MinShadowResolution in SystemSettings.
 */
var() int MinShadowResolution;
/**  
 *Override for max square dimensions (in texels) allowed for rendering shadow subject depths.
 * A value of 0 defaults to MaxShadowResolution in SystemSettings.
 */
var() int MaxShadowResolution;
/**  
 *Resolution in texels below which shadows begin to be faded out.
 * Once the shadow resolution reaches MinShadowResolution it will be faded out completely.
 * A value of 0 defaults to ShadowFadeResolution in SystemSettings.
 */
var() int ShadowFadeResolution;
/** Everything closer to the camera than this distance will occlude light shafts for directional lights. */
var(LightShafts) float OcclusionDepthRange;
/**  
 *Scales additive color near the light source.  A value of 0 will result in no additive term.
 * If BloomScale is 0 and OcclusionMaskDarkness is 1, light shafts will effectively be disabled.
 */
var(LightShafts) interp float BloomScale;
/** Scene color luminance must be larger than this to create bloom in light shafts. */
var(LightShafts) float BloomThreshold;
/**  
 *Scene color luminance must be less than this to receive bloom from light shafts.
 * This behaves like Photoshop's screen blend mode and prevents over-saturation from adding bloom to already bright areas.
 * The default value of 1 means that a pixel with a luminance of 1 won't receive any bloom, but a pixel with a luminance of .5 will receive half bloom.
 */
var(LightShafts) float BloomScreenBlendThreshold;
/** Multiplies against scene color to create the bloom color. */
var(LightShafts) interp Color BloomTint;
/** 100 is maximum blur length, 0 is no blur. */
var(LightShafts) float RadialBlurPercent;
/**  
 *Controls how dark the occlusion masking is, a value of .5 would mean that an occlusion of 0 only darkens underlying color by half.
 * A value of 1 results in no darkening term.  If BloomScale is 0 and OcclusionMaskDarkness is 1, light shafts will effectively be disabled.
 */
var(LightShafts) interp float OcclusionMaskDarkness;
/** Scales the contribution of the reflection specular highlight. */
var(ImageReflection) float ReflectionSpecularBrightness<bShowOnlyWhenTrue=bShowD3D11Properties>;
/** Max draw distance beyond which the light will be culled */
var() const float MaxDrawDistance;
var float MaxBrightness<UIMin=0.0|ClampMin=0.0>;
var float MinBrightness<UIMin=0.0|ClampMin=0.0>;
var byte AnimationType;
var float AnimationFrequency<UIMin=0.01|ClampMin=0.01|UIMax=20.0|ClampMax=20.0>;
var float AnimationTimeOffset;
var transient int LightAnimFrameCount;
var transient float LastRenderTime;

// Export ULightComponent::execSetEnabled(FFrame&, void* const)
native final function SetEnabled(bool bSetEnabled);

// Export ULightComponent::execSetLightProperties(FFrame&, void* const)
native final function SetLightProperties(optional float NewBrightness, optional Color NewLightColor, optional LightFunction NewLightFunction)
{
    NewBrightness = Brightness;
    NewLightColor = LightColor;
    NewLightFunction = Function;                    
}

// Export ULightComponent::execGetOrigin(FFrame&, void* const)
native final function Vector GetOrigin();

// Export ULightComponent::execGetDirection(FFrame&, void* const)
native final function Vector GetDirection();

// Export ULightComponent::execUpdateColorAndBrightness(FFrame&, void* const)
native final function UpdateColorAndBrightness();

// Export ULightComponent::execUpdateLightShaftParameters(FFrame&, void* const)
native final function UpdateLightShaftParameters();

function OnUpdatePropertyBloomScale()
{
    UpdateLightShaftParameters();
}

function OnUpdatePropertyBloomTint()
{
    UpdateLightShaftParameters();
}

function OnUpdatePropertyOcclusionMaskDarkness()
{
    UpdateLightShaftParameters();
}

function OnUpdatePropertyBrightness()
{
    UpdateColorAndBrightness();
}

function OnUpdatePropertyLightColor()
{
    UpdateColorAndBrightness();
}

defaultproperties
{
    Brightness=1
    LightColor=(B=255,G=255,R=255,A=0)
    Hardness=1
    bEnabled=true
    CastShadows=true
    CastStaticShadows=true
    CastDynamicShadows=true
    bCastCompositeShadow=true
    bAffectCompositeShadowDirection=true
    bPrecomputedLightingIsValid=true
    bAllowCompositingIntoDLE=true
    LightingChannels=(bInitialized=true,BSP=false,Static=false,Dynamic=false,CompositeDynamic=false,Skybox=false,Unnamed_1=false,Unnamed_2=false,Unnamed_3=false,Unnamed_4=false,Unnamed_5=false,Unnamed_6=false,Cinematic_1=false,Cinematic_2=false,Cinematic_3=false,Cinematic_4=false,Cinematic_5=false,Cinematic_6=false,Cinematic_7=false,Cinematic_8=false,Cinematic_9=false,Cinematic_10=false,Gameplay_1=false,Gameplay_2=false,Gameplay_3=false,Gameplay_4=false,Crowd=false,Indoor=true,Outdoor=false)
    ModShadowColor=(R=0,G=0,B=0,A=1)
    ModShadowFadeoutExponent=3
    OcclusionDepthRange=20000
    BloomScale=2
    BloomScreenBlendThreshold=1
    BloomTint=(B=255,G=255,R=255,A=0)
    RadialBlurPercent=100
    OcclusionMaskDarkness=0.3
    ReflectionSpecularBrightness=0.2
}