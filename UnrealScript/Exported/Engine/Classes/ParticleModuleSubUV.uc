/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSubUV extends ParticleModuleSubUVBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	The index of the sub-image that should be used for the particle.
 *	The value is retrieved using the RelativeTime of the particles.
 */
var(SubUV) rawdistributionfloat	SubImageIndex;

/** 
 *	If TRUE, use *real* time when updating the image index.
 *	The movie will update regardless of the slomo settings of the game.
 */
var(RealTime)	bool				bUseRealTime;

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
   SubImageIndex=(Distribution=DistributionSubImage,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleSubUV"
   ObjectArchetype=ParticleModuleSubUVBase'Engine.Default__ParticleModuleSubUVBase'
}
