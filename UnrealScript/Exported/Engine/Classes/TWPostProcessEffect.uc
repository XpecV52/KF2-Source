/**
 * Copyright 2014 Tripwire Interactive.  All Rights Reserved.
 *
 * Tripwire's custom postprocess effect, which replaces the UberPostProcessEffect.
 */

class TWPostProcessEffect extends PostProcessEffect
	native
	dependson(PostProcessVolume);

/* ***********************************************************************
 * DEPTH OF FIELD
 * ***********************************************************************/

/** Distance to focal plane, computed in native code */
var const transient float DOF_FocalDistance;

/** Maximum focal distance, computed focal distances are clamped to this value */
var(DepthOfField) float DOF_MaxFocalDistance;


/** Camera aperture for foreground depth group - larger values give more blur */
var(DepthOfField) float DOF_FG_FocalAperture;
/** Distance for focal plane for foreground group (typically distance to in-focus iron sight */
var(DepthOfField) float DOF_FG_FocalDistance;

/** Interpolated depth of field strength */
var const transient float DOF_Strength;


/** New parameters */

var(DepthOfField) float DOF_SharpRadius;
var(DepthOfField) float DOF_FocalRadius;
var(DepthOfField) float DOF_MinBlurSize;
var(DepthOfField) float DOF_MaxNearBlurSize;
var(DepthOfField) float DOF_MaxFarBlurSize;
var(DepthOfField) float DOF_ExpFalloff;

var(DepthOfField) float DOF_FG_SharpRadius;
var(DepthOfField) float DOF_FG_FocalRadius;
var(DepthOfField) float DOF_FG_MinBlurSize;
var(DepthOfField) float DOF_FG_MaxNearBlurSize;
var(DepthOfField) float DOF_FG_ExpFalloff;


/* ***********************************************************************
 * MOTION BLUR
 * ***********************************************************************/

/** Flag to enable tile-max motion blur */
var const transient bool MB_TileMaxEnabled;


/* ***********************************************************************
 * BLOOM
 * ***********************************************************************/

/** Scales the final bloom color before applying to the scene */
var(Bloom) float Bloom_Intensity;

/** Width multiplier for the blur kernel.  Larger values equal width bloom. */
var(Bloom) float Bloom_Width;

/** During the bright-pass phase, the candidate color at each pixel is scaled by this
 *  value before applying the threshold. */
var(Bloom) float Bloom_Exposure;

/** Threshold value for determining which pixels contribute to bloom.  Pixel colors
 *  are scaled by Exposure before applying the threshold. */
var(Bloom) float Bloom_Threshold;

/** Multiplies against the bloom color. */
var(Bloom) color Bloom_Tint;

/** 
 * Scene color luminance must be less than this to receive bloom. 
 * This behaves like Photoshop's screen blend mode and prevents over-saturation from adding bloom to already bright areas.
 * The default value of 1 means that a pixel with a luminance of 1 won't receive any bloom, but a pixel with a luminance of .5 will receive half bloom.
 */
var(Bloom) float Bloom_ScreenBlendThreshold;


/* ***********************************************************************
 * COLOR GRADING
 * ***********************************************************************/

var(ColorGrading) vector SceneShadows<DisplayName=Shadows>;
/** */
var(ColorGrading) vector SceneHighLights<DisplayName=HighLights>;
/** */
var(ColorGrading) vector SceneMidTones<DisplayName=MidTones>;
/** */
var(ColorGrading) float  SceneDesaturation<DisplayName=Desaturation>;
/** */
var(ColorGrading) vector  SceneColorize<DisplayName=Colorize>;


/* ***********************************************************************
 * TONE MAPPING
 * ***********************************************************************/

/** Allows to specify the tone mapper function which maps HDR colors into the LDR color range. */
var(Tonemapper) ETonemapperType TonemapperType;

/**
 * This tonemapper property allows to specify the HDR brightness value that is mapping to the maximum LDR value. 
 * Brighter values will be mapped to white (good values are in the range 2 to 16). Only affects the "Customizable" 
 * tonemapper.
 */
var(Tonemapper) float TonemapperRange;

/**
 * This tonemapper property allows to adjust the mapping of the darker colors (tonemapper toe).
 * As the adjustment is independent per color channel it can introduce slight shifts color and saturation changes.
 * Only affects the "Customizable" tonemapper.
 * 0=linear .. 1=crushed darks (more filmic)
 */
var(Tonemapper) float TonemapperToeFactor<DisplayName=ToeFactor>;

/**
 * Scale the input for the tonemapper. Only used if a tonemapper is specified.
 * >=0, 0:black, 1(default), >1 brighter
 */
var(Tonemapper) float TonemapperScale;

/** Film-grain noise intensity */
var(Noise) float NoiseIntensity;


/* ***********************************************************************
 * ANTIALIASING
 * ***********************************************************************/

/** Only used if PostProcessAAType is MLAA */
var(AntiAliasing) float EdgeDetectionThreshold;
/** Allows to specify the postprocess antialiasing method (affects quality and performace). */
var(AntiAliasing) EPostProcessAAType PostProcessAAType;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   DOF_MaxFocalDistance=10000.000000
   DOF_FG_FocalAperture=5.000000
   DOF_FG_FocalDistance=50.000000
   DOF_SharpRadius=500.000000
   DOF_FocalRadius=1000.000000
   DOF_MinBlurSize=1.250000
   DOF_MaxNearBlurSize=4.000000
   DOF_MaxFarBlurSize=8.000000
   DOF_ExpFalloff=1.000000
   DOF_FG_SharpRadius=10.000000
   DOF_FG_FocalRadius=10.000000
   DOF_FG_MinBlurSize=1.000000
   DOF_FG_MaxNearBlurSize=2.000000
   DOF_FG_ExpFalloff=1.000000
   Bloom_Intensity=1.050000
   Bloom_Width=4.000000
   Bloom_Exposure=1.250000
   Bloom_Threshold=0.600000
   Bloom_Tint=(B=255,G=255,R=255,A=0)
   Bloom_ScreenBlendThreshold=10.000000
   SceneShadows=(X=0.000000,Y=0.000000,Z=-0.003000)
   SceneHighLights=(X=0.800000,Y=0.800000,Z=0.800000)
   SceneMidTones=(X=1.300000,Y=1.300000,Z=1.300000)
   SceneDesaturation=0.400000
   SceneColorize=(X=1.000000,Y=1.000000,Z=1.000000)
   TonemapperRange=8.000000
   TonemapperToeFactor=1.000000
   TonemapperScale=1.000000
   NoiseIntensity=1.000000
   EdgeDetectionThreshold=12.000000
   Name="Default__TWPostProcessEffect"
   ObjectArchetype=PostProcessEffect'Engine.Default__PostProcessEffect'
}
