/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleMeshRotation extends ParticleModuleRotationBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	Initial rotation in ROTATIONS PER SECOND (1 = 360 degrees).
 *	The value is retrieved using the EmitterTime.
 */
var(Rotation)	rawdistributionvector	StartRotation;

/** If TRUE, apply the parents rotation as well. */
var(Rotation)	bool					bInheritParent;

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
   StartRotation=(Distribution=DistributionStartRotation,Op=2,LookupTableNumElements=2,LookupTableChunkSize=6,LookupTable=(0.000000,1.000000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000))
   bSpawnModule=True
   Name="Default__ParticleModuleMeshRotation"
   ObjectArchetype=ParticleModuleRotationBase'Engine.Default__ParticleModuleRotationBase'
}
