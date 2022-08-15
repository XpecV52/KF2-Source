/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSubUVMovie extends ParticleModuleSubUV
	native(Particle)
	editinlinenew
	hidecategories(Object)
	hidecategories(SubUV);

/**
 *	If TRUE, use the emitter time to look up the frame rate.
 *	If FALSE (default), use the particle relative time.
 */
var(Flipbook)	bool					bUseEmitterTime;

/**
 *	The frame rate the SubUV images should be 'flipped' thru at.
 
 */
var(Flipbook)	rawdistributionfloat	FrameRate;

/**
 *	The starting image index for the SubUV (1 = the first frame).
 *	Assumes order of Left->Right, Top->Bottom
 *	If greater than the last frame, it will clamp to the last one.
 *	If 0, then randomly selects a starting frame.
 */
var(Flipbook)	int						StartingFrame;

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
   FrameRate=(Distribution=DistributionFrameRate,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(30.000000,30.000000,30.000000,30.000000))
   StartingFrame=1
   SubImageIndex=(Distribution=DistributionSubImage)
   Name="Default__ParticleModuleSubUVMovie"
   ObjectArchetype=ParticleModuleSubUV'Engine.Default__ParticleModuleSubUV'
}
