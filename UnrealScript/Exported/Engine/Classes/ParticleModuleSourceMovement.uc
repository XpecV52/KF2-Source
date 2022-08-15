/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSourceMovement extends ParticleModuleLocationBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** 
 *	The scale factor to apply to the source movement before adding to the particle location.
 *	The value is looked up using the particles RELATIVE time [0..1].
 */
var(SourceMovement) rawdistributionvector	SourceMovementScale;

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
   SourceMovementScale=(Distribution=DistributionSourceMovementScale,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   bFinalUpdateModule=True
   Name="Default__ParticleModuleSourceMovement"
   ObjectArchetype=ParticleModuleLocationBase'Engine.Default__ParticleModuleLocationBase'
}
