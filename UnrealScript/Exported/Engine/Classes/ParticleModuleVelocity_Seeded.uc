/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleVelocity_Seeded extends ParticleModuleVelocity
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** The random seed(s) to use for looking up values in StartLocation */
var(RandomSeed) ParticleRandomSeedInfo		RandomSeedInfo;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   RandomSeedInfo=(bResetSeedOnEmitterLooping=True)
   StartVelocity=(Distribution=DistributionStartVelocity)
   StartVelocityRadial=(Distribution=DistributionStartVelocityRadial)
   bSupportsRandomSeed=True
   bRequiresLoopingNotification=True
   Name="Default__ParticleModuleVelocity_Seeded"
   ObjectArchetype=ParticleModuleVelocity'Engine.Default__ParticleModuleVelocity'
}
