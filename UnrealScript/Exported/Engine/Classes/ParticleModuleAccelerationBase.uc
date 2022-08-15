/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleAccelerationBase extends ParticleModule
	native(Particle)
	editinlinenew
	hidecategories(Object)
	abstract;

/**
 *	If true, then treat the acceleration as world-space
 */
var(Acceleration) bool bAlwaysInWorldSpace;

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
   Name="Default__ParticleModuleAccelerationBase"
   ObjectArchetype=ParticleModule'Engine.Default__ParticleModule'
}
