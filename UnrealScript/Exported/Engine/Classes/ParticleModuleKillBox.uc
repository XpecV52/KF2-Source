/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleKillBox extends ParticleModuleKillBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** The lower left corner of the box. */
var(Kill)		rawdistributionvector	LowerLeftCorner;

/** The upper right corner of the box. */
var(Kill)		rawdistributionvector	UpperRightCorner;

/** If TRUE, the box coordinates are in world space./ */
var(Kill)		bool					bAbsolute;

/**
 *	If TRUE, particles INSIDE the box will be killed. 
 *	If FALSE (the default), particles OUTSIDE the box will be killed.
 */
var(Kill)		bool					bKillInside;

/** If TRUE, the box will always be axis aligned and non-scalable. */
var(Kill)		bool					bAxisAlignedAndFixedSize;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   LowerLeftCorner=(Distribution=DistributionLowerLeftCorner,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   UpperRightCorner=(Distribution=DistributionUpperRightCorner,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   bAxisAlignedAndFixedSize=True
   bUpdateModule=True
   bSupported3DDrawMode=True
   Name="Default__ParticleModuleKillBox"
   ObjectArchetype=ParticleModuleKillBase'Engine.Default__ParticleModuleKillBase'
}
