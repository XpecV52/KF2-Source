/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleRotation extends ParticleModuleRotationBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	Initial rotation of the particle (1 = 360 degrees).
 *	The value is retrieved using the EmitterTime.
 */
var(Rotation) rawdistributionfloat	StartRotation;

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
   StartRotation=(Distribution=DistributionStartRotation,Op=2,LookupTableNumElements=2,LookupTableChunkSize=2,LookupTable=(0.000000,1.000000,0.000000,1.000000,0.000000,1.000000))
   bSpawnModule=True
   Name="Default__ParticleModuleRotation"
   ObjectArchetype=ParticleModuleRotationBase'Engine.Default__ParticleModuleRotationBase'
}
