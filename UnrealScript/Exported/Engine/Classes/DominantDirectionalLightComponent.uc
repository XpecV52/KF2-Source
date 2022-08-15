/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class DominantDirectionalLightComponent extends DirectionalLightComponent
	native(Light)
	hidecategories(Object)
	dependson(EngineTypes)
	editinlinenew;

var private {private} const DominantShadowInfo DominantLightShadowInfo;
/** Array of depths to the furthest shadow casting geometry in each shadowmap cell, quantized to a WORD and stored relative to LightSpaceImportanceBounds.Min.Z. */
var private {private} const native Array_Mirror DominantLightShadowMap{TArrayNoInit<WORD>};

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
   Name="Default__DominantDirectionalLightComponent"
   ObjectArchetype=DirectionalLightComponent'Engine.Default__DirectionalLightComponent'
}
