/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleMeshRotationRateOverLife extends ParticleModuleRotationRateBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	The rotation rate desired.
 *	The value is retrieved using the RelativeTime of the particle.
 */
var(Rotation) rawdistributionvector	RotRate;

/**
 *	If TRUE, scale the current rotation rate by the value retrieved.
 *	Otherwise, set the rotation rate to the value retrieved.
 */
var(Rotation) bool					bScaleRotRate;

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
   RotRate=(Distribution=DistributionRotRate,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleMeshRotationRateOverLife"
   ObjectArchetype=ParticleModuleRotationRateBase'Engine.Default__ParticleModuleRotationRateBase'
}
