/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleVelocity extends ParticleModuleVelocityBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** 
 *	The velocity to apply to a particle when it is spawned.
 *	Value is retrieved using the EmitterTime of the emitter.
 */
var(Velocity) rawdistributionvector	StartVelocity;
/** 
 *	The velocity to apply to a particle along its radial direction.
 *	Direction is determined by subtracting the location of the emitter from the particle location at spawn.
 *	Value is retrieved using the EmitterTime of the emitter.
 */
var(Velocity) rawdistributionfloat	StartVelocityRadial;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   StartVelocity=(Distribution=DistributionStartVelocity,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   StartVelocityRadial=(Distribution=DistributionStartVelocityRadial,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   bSpawnModule=True
   Name="Default__ParticleModuleVelocity"
   ObjectArchetype=ParticleModuleVelocityBase'Engine.Default__ParticleModuleVelocityBase'
}
