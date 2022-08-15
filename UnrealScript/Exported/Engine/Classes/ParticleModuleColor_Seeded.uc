/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleColor_Seeded extends ParticleModuleColor
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
   StartColor=(Distribution=DistributionStartColor)
   StartAlpha=(Distribution=DistributionStartAlpha)
   bSupportsRandomSeed=True
   bRequiresLoopingNotification=True
   Name="Default__ParticleModuleColor_Seeded"
   ObjectArchetype=ParticleModuleColor'Engine.Default__ParticleModuleColor'
}
