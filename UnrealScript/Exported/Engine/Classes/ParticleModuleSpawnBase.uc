/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSpawnBase extends ParticleModule
	native(Particle)
	editinlinenew
	hidecategories(Object)
	abstract;

/** 
 *	If TRUE, the SpawnRate of the SpawnModule of the emitter will be processed.
 *	If mutliple Spawn modules are 'stacked' in an emitter, if ANY of them 
 *	have this set to FALSE, it will not process the SpawnModule SpawnRate.
 */
var(Spawn)	bool				bProcessSpawnRate;

/** 
 *	If TRUE, the BurstList of the SpawnModule of the emitter will be processed.
 *	If mutliple Spawn modules are 'stacked' in an emitter, if ANY of them 
 *	have this set to FALSE, it will not process the SpawnModule BurstList.
 */
var(Burst)	bool				bProcessBurstList;

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
   bProcessSpawnRate=True
   bProcessBurstList=True
   Name="Default__ParticleModuleSpawnBase"
   ObjectArchetype=ParticleModule'Engine.Default__ParticleModule'
}
