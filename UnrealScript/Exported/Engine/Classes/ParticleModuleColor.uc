/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleColor extends ParticleModuleColorBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** Initial color for a particle as a function of Emitter time. */
var(Color) rawdistributionvector	StartColor;
/** Initial alpha for a particle as a function of Emitter time. */
var(Color) rawdistributionfloat		StartAlpha;
/** If TRUE, the alpha value will be clamped to the [0..1] range. */
var(Color) bool						bClampAlpha;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   StartColor=(Distribution=DistributionStartColor,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   StartAlpha=(Distribution=DistributionStartAlpha,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   bClampAlpha=True
   bSpawnModule=True
   bCurvesAsColor=True
   Name="Default__ParticleModuleColor"
   ObjectArchetype=ParticleModuleColorBase'Engine.Default__ParticleModuleColorBase'
}
