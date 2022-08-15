/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleWorldAttractor extends ParticleModuleWorldForcesBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** When TRUE the attraction force is particle life relative, when FALSE it is emitter life relative. */
var() bool bParticleLifeRelative;

/** Scales the attraction forces for this particular emitter. */
var() rawdistributionfloat AttractorInfluence;

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
   AttractorInfluence=(Distribution=DistributionInfluence,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   bUpdateModule=True
   Name="Default__ParticleModuleWorldAttractor"
   ObjectArchetype=ParticleModuleWorldForcesBase'Engine.Default__ParticleModuleWorldForcesBase'
}
