/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * Depth of Field post process effect
 *
 */
class DOFAndBloomEffect extends DOFEffect
	native;

/** A scale applied to blooming colors. */
var(Bloom) float BloomScale;

/** Any component of a pixel's color must be larger than this to contribute bloom. */
var(Bloom) float BloomThreshold;

/** Multiplies against the bloom color. */
var(Bloom) color BloomTint;

/** 
 * Scene color luminance must be less than this to receive bloom. 
 * This behaves like Photoshop's screen blend mode and prevents over-saturation from adding bloom to already bright areas.
 * The default value of 1 means that a pixel with a luminance of 1 won't receive any bloom, but a pixel with a luminance of .5 will receive half bloom.
 */
var(Bloom) float BloomScreenBlendThreshold;

/** A multiplier applied to all reads of scene color. */
var deprecated float SceneMultiplier;

/** the radius of the bloom effect 0..64 */
var(Bloom) float BlurBloomKernelSize;

var deprecated bool bEnableReferenceDOF;


/** Scales the final bloom color before applying to the scene */
var(HQ_Bloom) float BloomIntensity;

/** Width multiplier for the blur kernel.  Larger values equal width bloom. */
var(HQ_Bloom) float BloomWidth;

/** During the bright-pass phase, the candidate color at each pixel is scaled by this
 *  value before applying the threshold. */
var(HQ_Bloom) float Exposure;

/** Threshold value for determining which pixels contribute to bloom.  Pixel colors
 *  are scaled by Exposure before applying the threshold. */
var(HQ_Bloom) float BloomThreshold2;


/**
 * Allows to specify the depth of field type. Choose depending on performance and quality needs.
 * "SimpleDOF" blurs the out of focus content and recombines that with the unblurred scene (fast, almost constant speed).
 * "ReferenceDOF" makes use of dynamic branching in the pixel shader and features circular Bokeh shape effects (slow for big Kernel Size).
`if(`__TW_POSTPROCESS_)
 * "VariableWidthDOF" uses a summed area table for constant-time variable-width blur.
`endif
 * "BokehDOF" allows to specify a Bokeh texture and a bigger radius (requires D3D11, slow when using a lot of out of focus content)
 */
var(DepthOfField) enum EDOFType
{
	DOFType_SimpleDOF<DisplayName=SimpleDOF>, 
	DOFType_ReferenceDOF<DisplayName=ReferenceDOF>, 
	DOFType_BokehDOF<DisplayName=BokehDOF>, 

	DOFType_VariableWidthDOF<DisplayName=VariableWidthDOF>, 

} DepthOfFieldType;

/**
 * Allows to specify the quality of the chose Depth of Field Type.
 * This meaning depends heavily on the current implementation and that might change.
 * If performance is important the lowest acceptable quality should be used.
 */
var(DepthOfField) enum EDOFQuality
{
	DOFQuality_Low<DisplayName=Low>, 
	DOFQuality_Medium<DisplayName=Medium>, 
	DOFQuality_High<DisplayName=High>, 
} DepthOfFieldQuality;

/** only used if BokehDOF is enabled */
var(DepthOfField) Texture2D BokehTexture;

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
   BloomScale=1.000000
   BloomThreshold=1.000000
   BloomTint=(B=255,G=255,R=255,A=0)
   BloomScreenBlendThreshold=10.000000
   BlurBloomKernelSize=16.000000
   BloomIntensity=1.050000
   BloomWidth=4.000000
   Exposure=1.250000
   BloomThreshold2=0.600000
   BlurKernelSize=16.000000
   Name="Default__DOFAndBloomEffect"
   ObjectArchetype=DOFEffect'Engine.Default__DOFEffect'
}
