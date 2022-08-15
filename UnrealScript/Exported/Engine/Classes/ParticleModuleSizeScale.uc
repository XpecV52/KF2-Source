/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSizeScale extends ParticleModuleSizeBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	The amount the BaseSize should be scaled before being used as the size of the particle. 
 *	The value is retrieved using the RelativeTime of the particle during its update.
 *	NOTE: this module overrides any size adjustments made prior to this module in that frame.
 */
var()					rawdistributionvector	SizeScale;
/** Ignored */
var()					bool					EnableX;
/** Ignored */
var()					bool					EnableY;
/** Ignored */
var()					bool					EnableZ;

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
   SizeScale=(Distribution=DistributionSizeScale,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   EnableX=True
   EnableY=True
   EnableZ=True
   bUpdateModule=True
   Name="Default__ParticleModuleSizeScale"
   ObjectArchetype=ParticleModuleSizeBase'Engine.Default__ParticleModuleSizeBase'
}
