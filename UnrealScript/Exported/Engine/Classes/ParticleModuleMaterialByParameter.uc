/**
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class ParticleModuleMaterialByParameter extends ParticleModuleMaterialBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 * For Sprite and SubUV emitters only the first entry in these arrays will be valid.  
 * For Mesh emitters the code will try to match the order of the materials to the ones in the mesh material arrays.
 * 
 * @see UParticleModuleMaterialByParameter::Update
 **/
var() array<name> MaterialParameters;
/** The default materials to use when the MaterialParameter is not found. */
var() editfixedsize array<MaterialInterface> DefaultMaterials;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   bUpdateModule=True
   Name="Default__ParticleModuleMaterialByParameter"
   ObjectArchetype=ParticleModuleMaterialBase'Engine.Default__ParticleModuleMaterialBase'
}
