/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleMeshRotationRate extends ParticleModuleRotationRateBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	Initial rotation rate, in rotations per second.
 *	The value is retrieved using the EmitterTime.
 */
var(Rotation) rawdistributionvector	StartRotationRate;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   StartRotationRate=(Distribution=DistributionStartRotationRate,Op=2,LookupTableNumElements=2,LookupTableChunkSize=6,LookupTable=(0.000000,360.000000,0.000000,0.000000,0.000000,360.000000,360.000000,360.000000,0.000000,0.000000,0.000000,360.000000,360.000000,360.000000))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleMeshRotationRate"
   ObjectArchetype=ParticleModuleRotationRateBase'Engine.Default__ParticleModuleRotationRateBase'
}
