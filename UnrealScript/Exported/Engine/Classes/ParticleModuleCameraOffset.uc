/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleCameraOffset extends ParticleModuleCameraBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** 
 *	The camera-relative offset to apply to sprite location
 */
var(Camera)	rawdistributionfloat	CameraOffset;

/** If TRUE, the offset will only be processed at spawn time */
var(Camera) bool					bSpawnTimeOnly;

/**
 *	The update method for the offset
 */
enum EParticleCameraOffsetUpdateMethod
{
	EPCOUM_DirectSet,
	EPCOUM_Additive,
	EPCOUM_Scalar
};

/**
 *	How to update the offset for this module.
 *    DirectSet - Set the value directly (overwrite any previous setting)
 *    Additive  - Add the offset of this module to the existing offset
 *    Scalar    - Scale the existing offset by the value of this module
 */
var(Camera) EParticleCameraOffsetUpdateMethod	UpdateMethod;

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
   CameraOffset=(Distribution=DistributionCameraOffset,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleCameraOffset"
   ObjectArchetype=ParticleModuleCameraBase'Engine.Default__ParticleModuleCameraBase'
}
