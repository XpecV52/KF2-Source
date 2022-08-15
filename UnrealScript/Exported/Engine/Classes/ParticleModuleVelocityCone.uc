/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleVelocityCone extends ParticleModuleVelocityBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** The Min value represents the inner cone angle value and the Max value represents the outer cone angle value. */
var(Cone) rawdistributionfloat Angle;

/** The initial velocity of the particles. */
var(Cone) rawdistributionfloat Velocity;

/** The direction vector of the cone. */
var(Cone) vector Direction;

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
   Angle=(Distribution=DistributionAngle,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Velocity=(Distribution=DistributionVelocity,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Direction=(X=0.000000,Y=0.000000,Z=1.000000)
   bSpawnModule=True
   bSupported3DDrawMode=True
   Name="Default__ParticleModuleVelocityCone"
   ObjectArchetype=ParticleModuleVelocityBase'Engine.Default__ParticleModuleVelocityBase'
}
