/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSize extends ParticleModuleSizeBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	The initial size that should be used for a particle.
 *	The value is retrieved using the EmitterTime during the spawn of a particle.
 *	It is added to the Size and BaseSize fields of the spawning particle.
 */
var(Size) rawdistributionvector	StartSize;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   StartSize=(Distribution=DistributionStartSize,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   bSpawnModule=True
   Name="Default__ParticleModuleSize"
   ObjectArchetype=ParticleModuleSizeBase'Engine.Default__ParticleModuleSizeBase'
}
