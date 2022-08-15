/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class DOFBloomMotionBlurEffect extends DOFAndBloomEffect
	native;

/** Maximum blur velocity amount. This is a clamp on the amount of blur. */
var(MotionBlur) float MaxVelocity;

/** This is a scale that could be considered as the "sensitivity" of the blur. */
var(MotionBlur) float MotionBlurAmount;

/** Whether everything (static/dynamic objects) should motion blur or not. If disabled, only moving objects may blur. */
var(MotionBlur) bool FullMotionBlur;

/** Threshhold for when to turn off motion blur when the camera rotates swiftly during a single frame (in degrees). */
var(MotionBlur) float CameraRotationThreshold;

/** Threshhold for when to turn off motion blur when the camera translates swiftly during a single frame (in world units). */
var(MotionBlur) float CameraTranslationThreshold;

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
   MaxVelocity=1.000000
   MotionBlurAmount=0.500000
   FullMotionBlur=True
   CameraRotationThreshold=90.000000
   CameraTranslationThreshold=10000.000000
   bShowInEditor=False
   Name="Default__DOFBloomMotionBlurEffect"
   ObjectArchetype=DOFAndBloomEffect'Engine.Default__DOFAndBloomEffect'
}
