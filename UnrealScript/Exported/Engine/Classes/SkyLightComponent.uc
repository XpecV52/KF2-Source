/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SkyLightComponent extends LightComponent
	native(Light)
	hidecategories(Object)
	editinlinenew;

/** The brightness for the lower hemisphere of the sky light. */
var() const float LowerBrightness;

/** The color of the lower hemisphere of the sky light. */
var() const color LowerColor;

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
   LowerColor=(B=255,G=255,R=255,A=0)
   CastShadows=False
   Name="Default__SkyLightComponent"
   ObjectArchetype=LightComponent'Engine.Default__LightComponent'
}
