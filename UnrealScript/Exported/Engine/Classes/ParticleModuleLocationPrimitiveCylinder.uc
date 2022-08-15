//=============================================================================
// ParticleModuleLocationPrimitiveCylinder
// Location primitive spawning within a cylinder.
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class ParticleModuleLocationPrimitiveCylinder extends ParticleModuleLocationPrimitiveBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** If TRUE, get the particle velocity form the radial distance inside the primitive. */
var(Location) bool					RadialVelocity;
/** The radius of the cylinder. */
var(Location) rawdistributionfloat	StartRadius;
/** The height of the cylinder, centered about the location. */
var(Location) rawdistributionfloat	StartHeight;

enum CylinderHeightAxis
{
	PMLPC_HEIGHTAXIS_X,
	PMLPC_HEIGHTAXIS_Y,
	PMLPC_HEIGHTAXIS_Z
};

/** Determines particle particle system axis that should represent the height of the cylinder.
 *	Can be one of the following:
 *		PMLPC_HEIGHTAXIS_X		Orient the height along the particle system X-axis.
 *		PMLPC_HEIGHTAXIS_Y		Orient the height along the particle system Y-axis.
 *		PMLPC_HEIGHTAXIS_Z		Orient the height along the particle system Z-axis.
 */
var(Location) CylinderHeightAxis	HeightAxis;

/** If TRUE and the emitter is using world space, this will more acurately calculate particles' velocity. */
var(Location) private bool			bAdjustForWorldSpace;

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
   RadialVelocity=True
   StartRadius=(Distribution=DistributionStartRadius,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(50.000000,50.000000,50.000000,50.000000))
   StartHeight=(Distribution=DistributionStartHeight,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(50.000000,50.000000,50.000000,50.000000))
   HeightAxis=PMLPC_HEIGHTAXIS_Z
   VelocityScale=(Distribution=DistributionVelocityScale)
   StartLocation=(Distribution=DistributionStartLocation)
   bSupported3DDrawMode=True
   Name="Default__ParticleModuleLocationPrimitiveCylinder"
   ObjectArchetype=ParticleModuleLocationPrimitiveBase'Engine.Default__ParticleModuleLocationPrimitiveBase'
}
