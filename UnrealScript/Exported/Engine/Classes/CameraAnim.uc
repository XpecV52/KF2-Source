/**
 *	CameraAnim: defines a pre-packaged animation to be played on a camera.
 * 	Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class CameraAnim extends Object
	notplaceable
	native(Camera);

/** The InterpGroup that holds our actual interpolation data. */
var InterpGroupCamera	    CameraInterpGroup;
/** This is to preview and they only exists in editor */
var editoronly transient InterpGroup	PreviewInterpGroup;

/** Length, in seconds. */
var const float		AnimLength;

/** AABB in local space. */
var const box		BoundingBox;

/** The "base" postprocess settings to use, to support non-animating settings. */
var const PostProcessSettings	BasePPSettings;
var const float					BasePPSettingsAlpha;

/** The */
var const float		BaseFOV;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   AnimLength=3.000000
   BasePPSettings=(bEnableBloom=True,bEnableMotionBlur=True,bEnableSceneEffect=True,bAllowAmbientOcclusion=True,TripwireSettings=(DOF_FocalDistance=1000.000000,DOF_SharpRadius=800.000000,DOF_FocalRadius=1200.000000,DOF_ExpFalloff=1.000000,DOF_FG_SharpRadius=75.000000,DOF_FG_FocalRadius=150.000000,DOF_FG_ExpFalloff=1.000000,Bloom_Intensity=1.050000,Bloom_Width=4.000000,Bloom_Exposure=1.250000,Bloom_Threshold=0.600000,Bloom_InterpolationDuration=1.000000,NoiseIntensity=1.000000,MB_TileMaxEnabled=True,bEnableScreenSpaceReflections=True),LegacySettings=(Bloom_Scale=1.000000,Bloom_Threshold=1.000000,Bloom_InterpolationDuration=1.000000,DOF_BlurBloomKernelSize=16.000000,DOF_FalloffExponent=4.000000,DOF_BlurKernelSize=16.000000,DOF_MaxNearBlurAmount=1.000000,DOF_MaxFarBlurAmount=1.000000,DOF_FocusInnerRadius=2000.000000,DOF_InterpolationDuration=1.000000,MotionBlur_MaxVelocity=1.000000,MotionBlur_Amount=0.500000,MotionBlur_FullMotionBlur=True,MotionBlur_CameraRotationThreshold=45.000000,MotionBlur_CameraTranslationThreshold=10000.000000,MotionBlur_InterpolationDuration=1.000000,RimShader_Color=(R=0.470440,G=0.585973,B=0.827726,A=1.000000),RimShader_InterpolationDuration=1.000000,MobileColorGrading=(TransitionTime=1.000000,HighLights=(R=0.700000,G=0.700000,B=0.700000,A=1.000000),MidTones=(R=0.000000,G=0.000000,B=0.000000,A=1.000000),Shadows=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)),MobilePostProcess=(Mobile_BlurAmount=16.000000,Mobile_TransitionTime=1.000000,Mobile_Bloom_Scale=0.500000,Mobile_Bloom_Threshold=0.750000,Mobile_Bloom_Tint=(R=1.000000,G=1.000000,B=1.000000,A=1.000000),Mobile_DOF_Distance=1500.000000,Mobile_DOF_MinRange=600.000000,Mobile_DOF_MaxRange=1200.000000,Mobile_DOF_FarBlurFactor=1.000000)),Bloom_Tint=(B=255,G=255,R=255,A=0),Bloom_ScreenBlendThreshold=10.000000,Scene_Colorize=(X=1.000000,Y=1.000000,Z=1.000000),Scene_TonemapperScale=1.000000,Scene_HighLights=(X=1.000000,Y=1.000000,Z=1.000000),Scene_MidTones=(X=1.000000,Y=1.000000,Z=1.000000))
   BasePPSettingsAlpha=1.000000
   BaseFOV=90.000000
   Name="Default__CameraAnim"
   ObjectArchetype=Object'Core.Default__Object'
}
