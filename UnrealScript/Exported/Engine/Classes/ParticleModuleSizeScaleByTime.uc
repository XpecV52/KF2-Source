/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSizeScaleByTime extends ParticleModuleSizeBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	The amount the size should be scaled before being used as the size of the particle. 
 *	The value is retrieved using the ABSOLUTE lifetime of the particle during its update.
 */
var()					rawdistributionvector	SizeScaleByTime;
/** If TRUE, scale the X-component of the size. */
var()					bool					bEnableX;
/** If TRUE, scale the Y-component of the size. */
var()					bool					bEnableY;
/** If TRUE, scale the Z-component of the size. */
var()					bool					bEnableZ;

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
   SizeScaleByTime=(Distribution=DistributionSizeScaleByTime,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   bEnableX=True
   bEnableY=True
   bEnableZ=True
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleSizeScaleByTime"
   ObjectArchetype=ParticleModuleSizeBase'Engine.Default__ParticleModuleSizeBase'
}
