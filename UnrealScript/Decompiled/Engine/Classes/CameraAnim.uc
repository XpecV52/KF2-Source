/*******************************************************************************
 * CameraAnim generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class CameraAnim extends Object
    native(Camera);

var InterpGroupCamera CameraInterpGroup;
var editoronly transient InterpGroup PreviewInterpGroup;
var const float AnimLength;
var const Box BoundingBox;
var const PostProcessSettings BasePPSettings;
var const float BasePPSettingsAlpha;
var const float BaseFOV;

defaultproperties
{
    AnimLength=3
    BasePPSettings=(bOverride_EnableBloom=false,bOverride_EnableDOF=false,bOverride_EnableMotionBlur=false,bOverride_EnableSceneEffect=false,bOverride_AllowAmbientOcclusion=false,bOverride_OverrideRimShaderColor=false,bOverride_Bloom_Scale=false,bOverride_Bloom_Threshold=false,bOverride_Bloom_Tint=false,bOverride_Bloom_ScreenBlendThreshold=false,bOverride_Bloom_InterpolationDuration=false,bOverride_DOF_FalloffExponent=false,bOverride_DOF_BlurKernelSize=false,bOverride_DOF_BlurBloomKernelSize=false,bOverride_DOF_MaxNearBlurAmount=false,bOverride_DOF_MinBlurAmount=false,bOverride_DOF_MaxFarBlurAmount=false,bOverride_DOF_FocusType=false,bOverride_DOF_FocusInnerRadius=false,bOverride_DOF_FocusDistance=false,bOverride_DOF_FocusPosition=false,bOverride_DOF_InterpolationDuration=false,bOverride_DOF_BokehTexture=false,bOverride_MotionBlur_MaxVelocity=false,bOverride_MotionBlur_Amount=false,bOverride_MotionBlur_FullMotionBlur=false,bOverride_MotionBlur_CameraRotationThreshold=false,bOverride_MotionBlur_CameraTranslationThreshold=false,bOverride_MotionBlur_InterpolationDuration=false,bOverride_Scene_Desaturation=false,bOverride_Scene_Colorize=false,bOverride_Scene_TonemapperScale=false,bOverride_Scene_ImageGrainScale=false,bOverride_Scene_HighLights=false,bOverride_Scene_MidTones=false,bOverride_Scene_Shadows=false,bOverride_Scene_InterpolationDuration=false,bOverride_Scene_ColorGradingLUT=false,bOverride_RimShader_Color=false,bOverride_RimShader_InterpolationDuration=false,bOverride_MobileColorGrading=false,bEnableBloom=true,bEnableDOF=false,bEnableMotionBlur=true,bEnableSceneEffect=true,bAllowAmbientOcclusion=true,bOverrideRimShaderColor=false,TripwireSettings=(DOF_FocalDistance=1000,DOF_SharpRadius=800,DOF_FocalRadius=1200,DOF_MinBlurSize=0,DOF_MaxNearBlurSize=0,DOF_MaxFarBlurSize=0,DOF_ExpFalloff=1,DOF_FG_SharpRadius=75,DOF_FG_FocalRadius=150,DOF_FG_MinBlurSize=0,DOF_FG_MaxNearBlurSize=0,DOF_FG_ExpFalloff=1,Bloom_Intensity=1.05,Bloom_Width=4,Bloom_Exposure=1.25,Bloom_Threshold=0.6,Bloom_InterpolationDuration=1,NoiseIntensity=1,DOF_Strength=0,DOF_MaxFocalDistance=10000,MB_TileMaxEnabled=true,bForceGameplayDOF=false,bForceGameplayBloom=false,bForceGameplayImageGrain=false,bForceGameplayTranslucencyTint=false,bEnableScreenSpaceReflections=true,bBlurEnabled=false,BlurStrength=0),LegacySettings=(Bloom_Scale=1,Bloom_Threshold=1,Bloom_InterpolationDuration=1,DOF_BlurBloomKernelSize=16,DOF_FalloffExponent=4,DOF_BlurKernelSize=16,DOF_MaxNearBlurAmount=1,DOF_MinBlurAmount=0,DOF_MaxFarBlurAmount=1,DOF_FocusType=EFocusType.FOCUS_Distance,DOF_FocusInnerRadius=2000,DOF_FocusDistance=0,DOF_FocusPosition=(X=0,Y=0,Z=0),DOF_InterpolationDuration=1,DOF_BokehTexture=none,MotionBlur_MaxVelocity=1,MotionBlur_Amount=0.5,MotionBlur_FullMotionBlur=true,MotionBlur_CameraRotationThreshold=45,MotionBlur_CameraTranslationThreshold=10000,MotionBlur_InterpolationDuration=1,RimShader_Color=(R=0.47044,G=0.585973,B=0.827726,A=1),RimShader_InterpolationDuration=1,Scene_ImageGrainScale=0,MobileColorGrading=(TransitionTime=1,Blend=0,Desaturation=0,HighLights=(R=0.7,G=0.7,B=0.7,A=1),MidTones=(R=0,G=0,B=0,A=1),Shadows=(R=0,G=0,B=0,A=1)),MobilePostProcess=(bOverride_Mobile_BlurAmount=false,bOverride_Mobile_TransitionTime=false,bOverride_Mobile_Bloom_Scale=false,bOverride_Mobile_Bloom_Threshold=false,bOverride_Mobile_Bloom_Tint=false,bOverride_Mobile_DOF_Distance=false,bOverride_Mobile_DOF_MinRange=false,bOverride_Mobile_DOF_MaxRange=false,bOverride_Mobile_DOF_FarBlurFactor=false,Mobile_BlurAmount=16,Mobile_TransitionTime=1,Mobile_Bloom_Scale=0.5,Mobile_Bloom_Threshold=0.75,Mobile_Bloom_Tint=(R=1,G=1,B=1,A=1),Mobile_DOF_Distance=1500,Mobile_DOF_MinRange=600,Mobile_DOF_MaxRange=1200,Mobile_DOF_FarBlurFactor=1)),Bloom_Tint=(B=255,G=255,R=255,A=0),Bloom_ScreenBlendThreshold=10,Scene_Desaturation=0,Scene_Colorize=(X=1,Y=1,Z=1),Scene_TonemapperScale=1,Scene_HighLights=(X=1,Y=1,Z=1),Scene_MidTones=(X=1,Y=1,Z=1),Scene_Shadows=(X=0,Y=0,Z=0),Scene_InterpolationDuration=0,ColorGrading_LookupTable=none,ColorGradingLUT=(LUTTextures=none,LUTWeights=none))
    BasePPSettingsAlpha=1
    BaseFOV=90
}