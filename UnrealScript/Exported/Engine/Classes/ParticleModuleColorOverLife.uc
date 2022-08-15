/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleColorOverLife extends ParticleModuleColorBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** The color to apply to the particle, as a function of the particle RelativeTime. */
var(Color)					rawdistributionvector	ColorOverLife;
/** The alpha to apply to the particle, as a function of the particle RelativeTime. */
var(Color)					rawdistributionfloat	AlphaOverLife;
/** If TRUE, the alpha value will be clamped to the [0..1] range. */
var(Color)					bool					bClampAlpha;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   ColorOverLife=(Distribution=DistributionColorOverLife,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   AlphaOverLife=(Distribution=DistributionAlphaOverLife,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   bClampAlpha=True
   bSpawnModule=True
   bUpdateModule=True
   bCurvesAsColor=True
   Name="Default__ParticleModuleColorOverLife"
   ObjectArchetype=ParticleModuleColorBase'Engine.Default__ParticleModuleColorBase'
}
