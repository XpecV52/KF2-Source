/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class FogVolumeDensityComponent extends ActorComponent
	native(FogVolume)
	hidecategories(Object)
	abstract
	editinlinenew;

/** Fog Material to use on the AutomaticComponent.  This will not be used on FogVolumeActors, they will use their existing materials. */
var() MaterialInterface FogMaterial;

var MaterialInterface DefaultFogVolumeMaterial;

/** True if the fog is enabled. */
var()	const	bool	bEnabled;

/** 
 * Controls whether the fog volume affects intersecting translucency.  
 * If FALSE, the fog volume will sort normally with translucency and not fog intersecting translucent objects.
 */
var()   bool	bAffectsTranslucency;

/** 
 * Controls whether the fog volume affects opaque pixels, or just intersecting translucency.  
 */
var()   bool	bOnlyAffectsTranslucency;

/** 
 * Sets the 'EmissiveColor' Vector Parameter of FogMaterial.
 * This will have no effect if FogMaterial has been overridden with a material that does not have a 'EmissiveColor' parameter.  
 */
var()	interp	LinearColor	SimpleLightColor;

/** 
 * Color used to approximate fog material color on transparency. 
 * Important: Set this color to match the overall color of the fog material, otherwise transparency will not be fogged correctly.
 */
var()	interp	LinearColor	ApproxFogLightColor;

/** Distance from the camera that the fog should start, in world units. */
var()	interp	float	StartDistance;

/** 
 * MaxDistance can be tweaked to be as low as it can go without making the fog noticeably less opaque, 
 * And that will greatly improve the anti aliasing effect on opaque geometry in the foreground. 
 */
var()	float	MaxDistance;

/** 
 * Optional array of actors that will define the shape of the fog volume. 
 * These actors will not be moved along with the fog volume, and they can be selected directly.
 */
var()	array<Actor>	FogVolumeActors;

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

/**
 * Changes the enabled state of the height fog component.
 * @param bSetEnabled - The new value for bEnabled.
 */
final native function SetEnabled(bool bSetEnabled);

defaultproperties
{
   DefaultFogVolumeMaterial=Material'EngineMaterials.FogVolumeMaterial'
   bEnabled=True
   bAffectsTranslucency=True
   SimpleLightColor=(R=0.500000,G=0.500000,B=0.700000,A=1.000000)
   ApproxFogLightColor=(R=0.500000,G=0.500000,B=0.700000,A=1.000000)
   MaxDistance=65535.000000
   Name="Default__FogVolumeDensityComponent"
   ObjectArchetype=ActorComponent'Engine.Default__ActorComponent'
}
