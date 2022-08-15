/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleParameterDynamic_Seeded extends ParticleModuleParameterDynamic
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
   DynamicParams(0)=(ParamValue=(Distribution=DistributionParam1))
   DynamicParams(1)=(ParamValue=(Distribution=DistributionParam2))
   DynamicParams(2)=(ParamValue=(Distribution=DistributionParam3))
   DynamicParams(3)=(ParamValue=(Distribution=DistributionParam4))
   bSupportsRandomSeed=True
   bRequiresLoopingNotification=True
   Name="Default__ParticleModuleParameterDynamic_Seeded"
   ObjectArchetype=ParticleModuleParameterDynamic'Engine.Default__ParticleModuleParameterDynamic'
}
