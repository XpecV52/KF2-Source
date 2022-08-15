/**
 * Copyright 1998-2012 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleFlexSpawn extends ParticleModuleSpawnBase
	native(Particle)
	editinlinenew
	hidecategories(Object)
	hidecategories(ParticleModuleSpawnBase);

	struct native FlexInstancePayload
	{
		var float LayerLeftOver;
		var int LayerIndex;
	};

	/** The number of particles to emit horizontally  */
	var(Spawn)	int DimX;

	/** The number of particles to emit vertically */
	var(Spawn)	int DimY;

	/** Velocity to emit particles with, note that this increases the required spawn rate */
	var(Velocity) float Velocity;

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
   DimX=4
   DimY=4
   bSpawnModule=True
   Name="Default__ParticleModuleFlexSpawn"
   ObjectArchetype=ParticleModuleSpawnBase'Engine.Default__ParticleModuleSpawnBase'
}
