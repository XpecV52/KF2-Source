/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSizeMultiplyLife extends ParticleModuleSizeBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	The scale factor for the size that should be used for a particle.
 *	The value is retrieved using the RelativeTime of the particle during its update.
 */
var(Size)					rawdistributionvector	LifeMultiplier;
/** 
 *	If true, the X-component of the scale factor will be applied to the particle size X-component.
 *	If false, the X-component is left unaltered.
 */
var(Size)					bool					MultiplyX;
/** 
 *	If true, the Y-component of the scale factor will be applied to the particle size Y-component.
 *	If false, the Y-component is left unaltered.
 */
var(Size)					bool					MultiplyY;
/** 
 *	If true, the Z-component of the scale factor will be applied to the particle size Z-component.
 *	If false, the Z-component is left unaltered.
 */
var(Size)					bool					MultiplyZ;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   LifeMultiplier=(Distribution=DistributionLifeMultiplier,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   MultiplyX=True
   MultiplyY=True
   MultiplyZ=True
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleSizeMultiplyLife"
   ObjectArchetype=ParticleModuleSizeBase'Engine.Default__ParticleModuleSizeBase'
}
