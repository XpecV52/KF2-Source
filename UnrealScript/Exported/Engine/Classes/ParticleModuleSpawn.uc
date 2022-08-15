/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSpawn extends ParticleModuleSpawnBase
	native(Particle)
	editinlinenew
	hidecategories(Object)
	hidecategories(ParticleModuleSpawnBase);

/** The rate at which to spawn particles. */
var(Spawn)						rawdistributionfloat	Rate;

/** The scalar to apply to the rate. */
var(Spawn)						rawdistributionfloat	RateScale;

/** The method to utilize when burst-emitting particles. */
var(Burst)						EParticleBurstMethod	ParticleBurstMethod;

/** The array of burst entries. */
var(Burst)	export noclear		array<ParticleBurst>	BurstList;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   Rate=(Distribution=RequiredDistributionSpawnRate,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(20.000000,20.000000,20.000000,20.000000))
   RateScale=(Distribution=RequiredDistributionSpawnRateScale,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   LODDuplicate=False
   Name="Default__ParticleModuleSpawn"
   ObjectArchetype=ParticleModuleSpawnBase'Engine.Default__ParticleModuleSpawnBase'
}
