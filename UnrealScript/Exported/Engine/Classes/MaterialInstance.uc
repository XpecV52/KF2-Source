/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialInstance extends MaterialInterface
	abstract
	native(Material);


/** Physical material to use for this graphics material. Used for sounds, effects etc.*/
var() PhysicalMaterial PhysMaterial;

var() const MaterialInterface Parent;

/** A 1 bit monochrome texture that represents a mask for what physical material should be used if the collided texel is black or white. */
var(PhysicalMaterialMask)	Texture2D	PhysMaterialMask;				
/** The UV channel to use for the PhysMaterialMask. */
var(PhysicalMaterialMask)	INT	PhysMaterialMaskUVChannel;
/** The physical material to use when a black pixel in the PhysMaterialMask texture is hit. */
var(PhysicalMaterialMask)	PhysicalMaterial BlackPhysicalMaterial;
/** The physical material to use when a white pixel in the PhysMaterialMask texture is hit. */
var(PhysicalMaterialMask)	PhysicalMaterial WhitePhysicalMaterial;

/** indicates whether the instance has static permutation resources (which are required when static parameters are present) */
var bool bHasStaticPermutationResource;

/** indicates whether the static permutation resource needs to be updated on PostEditChange() */
var native transient bool bStaticPermutationDirty;

/**
* The set of static parameters that this instance will be compiled with.
* This is indexed by EMaterialShaderPlatform.
* Only the first entry is ever used now that SM2 is no longer supported, 
* But the member is kept as an array to make adding future material platforms easier.  
* The second entry is to work around the script compile error from having an array with one element.
*/
var const native duplicatetransient pointer StaticParameters[2]{FStaticParameterSet};

/**
* The material resources for this instance.
* This is indexed by EMaterialShaderPlatform.
* Only the first entry is ever used now that SM2 is no longer supported, 
* But the member is kept as an array to make adding future material platforms easier.  
* The second entry is to work around the script compile error from having an array with one element.
*/
var const native duplicatetransient pointer StaticPermutationResources[2]{FMaterialResource};

/** Second resource is used when selected. */
var const native duplicatetransient pointer Resources[3]{class FMaterialInstanceResource};

var private const native bool ReentrantFlag;

/** Legacy texture references, now handled by FMaterial. */
var deprecated private const array<texture> ReferencedTextures;

var private const editoronly array<guid> ReferencedTextureGuids;

/** Unique ID for this material, used for caching during distributed lighting */
var private const Guid ParentLightingGuid;

/** This instance is dirty and needs to be flattened upon save or some other good time (like closing the MIC editor) */
var private const transient bool bNeedsMaterialFlattening;

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

// SetParent - Updates the parent.

native function SetParent(MaterialInterface NewParent);

// Set*ParameterValue - Updates the entry in ParameterValues for the named parameter, or adds a new entry.

native function SetVectorParameterValue(name ParameterName, const out LinearColor Value);
native function SetScalarParameterValue(name ParameterName, float Value);
native function SetScalarCurveParameterValue(name ParameterName, const out InterpCurveFloat Value);
native function SetTextureParameterValue(name ParameterName, Texture Value);

native function bool GetTextureParameterValue(name ParameterName, out Texture Value);

/**
* Sets the value of the given font parameter.
*
* @param	ParameterName	The name of the font parameter
* @param	OutFontValue	New font value to set for this MIC
* @param	OutFontPage		New font page value to set for this MIC
*/
native function SetFontParameterValue(name ParameterName, Font FontValue, int FontPage);

/** Removes all parameter values */
native function ClearParameterValues();

/**
 *	Returns if this MI is either in a map package or the transient package
 *	During gameplay, Set..Parameter should only be called on MIs where this is TRUE -
 *	otherwise you are modifying an MI within a content package, that will persist across level reload etc.
 */
native function bool IsInMapOrTransientPackage() const;

defaultproperties
{
   PhysMaterialMaskUVChannel=-1
   Name="Default__MaterialInstance"
   ObjectArchetype=MaterialInterface'Engine.Default__MaterialInterface'
}
