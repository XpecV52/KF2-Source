/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class DirectionalLightComponent extends LightComponent
	native(Light)
	hidecategories(Object)
	dependson(EngineTypes)
	editinlinenew;

/**
 * Trace distance for static lighting. Objects further than TraceDistance away from an object won't be taken into
 * account for static shadowing applied to said object. This is used to work around floating point consistency
 * issues in the collision code with regard to very long traces. The old default was WORLD_MAX.
 */
var(AdvancedLighting)	float	TraceDistance;

/**
 * Radius of the whole scene dynamic shadow centered on the viewer, which replaces the precomputed shadows based on distance from the camera.
 * A Radius of 0 disables the dynamic shadow. This feature is currently only supported on dominant directional lights.
 */
 
 var(CascadedShadowMaps) interp float WholeSceneDynamicShadowRadius<UIMin=0.0 | UIMax=1000.0>;
 



/**
 * Number of cascades to split the view frustum into for the whole scene dynamic shadow.
 * More cascades result in better shadow resolution and allow WholeSceneDynamicShadowRadius to be further, but add rendering cost.
 */
 
var(CascadedShadowMaps) editconst const int NumWholeSceneDynamicShadowCascades;




/**
 * Exponent that is applied to the cascade transition distances as a fraction of WholeSceneDynamicShadowRadius.
 * An exponent of 1 means that cascade transitions will happen at a distance proportional to their resolution.
 * A value greater than 1 brings transitions closer to the camera.
 */
 
 var const float CascadeDistributionExponent;
 



/** The Lightmass settings for this object. */
var(Lightmass) LightmassDirectionalLightSettings	LightmassSettings <ScriptOrder=true>;

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

/** Called from matinee code when LightColor property changes. */
function OnUpdatePropertyLightColor()
{
	UpdateColorAndBrightness();
}

/** Called from matinee code when Brightness property changes. */
function OnUpdatePropertyBrightness()
{
	UpdateColorAndBrightness();
}

defaultproperties
{
   TraceDistance=100000.000000
   WholeSceneDynamicShadowRadius=750.000000
   NumWholeSceneDynamicShadowCascades=1
   CascadeDistributionExponent=4.000000
   LightmassSettings=(LightSourceAngle=3.000000,IndirectLightingScale=1.000000,IndirectLightingSaturation=1.000000,ShadowExponent=2.000000)
   bCastPerObjectShadows=True
   Name="Default__DirectionalLightComponent"
   ObjectArchetype=LightComponent'Engine.Default__LightComponent'
}
