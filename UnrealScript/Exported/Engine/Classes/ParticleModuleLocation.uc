/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleLocation extends ParticleModuleLocationBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** 
 *	The location the particle should be emitted.
 *	Relative in local space to the emitter by default.
 *	Relative in world space as a WorldOffset module or when the emitter's UseLocalSpace is off.
 *	Retrieved using the EmitterTime at the spawn of the particle.
 */
var(Location) rawdistributionvector	StartLocation;

/**
 *  When set to a non-zero value this will force the particles to only spawn on evenly distributed
 *  positions between the two points specified.
 */
var(Location) float DistributeOverNPoints;

/**
 *  When DistributeOverNPoints is set to a non-zero value, this specifies the ratio of particles spawned
 *  that should use the distribution.  (For example setting this to 1 will cause all the particles to
 *  be distributed evenly whereas .75 would cause 1/4 of the particles to be randomly placed).
 */
var(Location) float DistributeThreshold;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   StartLocation=(Distribution=DistributionStartLocation,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   bSpawnModule=True
   bSupported3DDrawMode=True
   Name="Default__ParticleModuleLocation"
   ObjectArchetype=ParticleModuleLocationBase'Engine.Default__ParticleModuleLocationBase'
}
