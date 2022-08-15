/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * Depth of Field post process effect
 *
 */
class DOFEffect extends PostProcessEffect
	native
	abstract;

/** exponent to apply to blur amount after it has been normalized to [0,1] */
var(DepthOfField) float FalloffExponent;
/** affects the radius of the DepthOfField bohek / how blurry the scene gets */
var(DepthOfField) float BlurKernelSize;
/** [0,1] value for clamping how much blur to apply to items in front of the focus plane */
var(DepthOfField, BlurAmount) float MaxNearBlurAmount<DisplayName=MaxNear>;
/** [0,1] value for clamping how much blur to apply */
var(DepthOfField, BlurAmount) float MinBlurAmount<DisplayName=Min>;
/** [0,1] value for clamping how much blur to apply to items behind the focus plane */
var(DepthOfField, BlurAmount) float MaxFarBlurAmount<DisplayName=MaxFar>;

/** control how the focus point is determined */
var(DepthOfField) enum EFocusType
{
	// use distance from the view
	FOCUS_Distance,
	// use a world space point
	FOCUS_Position	
} FocusType;
/** inner focus radius */
var(DepthOfField) float FocusInnerRadius;
/** used when FOCUS_Distance is enabled */
var(DepthOfField) float FocusDistance;
/** used when FOCUS_Position is enabled */
var(DepthOfField) vector FocusPosition;

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
   FalloffExponent=2.000000
   BlurKernelSize=2.000000
   MaxNearBlurAmount=1.000000
   MaxFarBlurAmount=1.000000
   FocusInnerRadius=400.000000
   FocusDistance=800.000000
   Name="Default__DOFEffect"
   ObjectArchetype=PostProcessEffect'Engine.Default__PostProcessEffect'
}
