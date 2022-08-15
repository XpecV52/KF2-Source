/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleSpawnPerUnit extends ParticleModuleSpawnBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

//=============================================================================
//	Properties
//=============================================================================
/** 
 *	The scalar to apply to the distance traveled.
 *	The value from SpawnPerUnit is divided by this value to give the actual
 *	number of particles per unit. 
 */
var(Spawn)	float						UnitScalar;
 
/** 
 *	The amount to spawn per meter distribution.
 *	The value is retrieved using the EmitterTime.
 */
var(Spawn)	rawdistributionfloat		SpawnPerUnit;

/**
 *	If TRUE, process the default spawn rate when not moving...
 *	When not moving, skip the default spawn rate.
 *	If FALSE, return the bProcessSpawnRate setting.
 */
var(Spawn)	bool						bIgnoreSpawnRateWhenMoving;

/**
 *	The tolerance for moving vs. not moving w.r.t. the bIgnoreSpawnRateWhenMoving flag.
 *	Ie, if (DistanceMoved < (UnitScalar x MovementTolerance)) then consider it not moving.
 */
var(Spawn)	float						MovementTolerance;

/**
 *	The maximum valid movement for a single frame.
 *	If 0.0, then the check is not performed.
 *	Currently, if the distance moved between frames is greater than this
 *	then NO particles will be spawned.
 *	This is primiarily intended to cover cases where the PSystem is 
 *	attached to teleporting objects.
 */
var(Spawn)	float						MaxFrameDistance;

/**
 *	If the distance (in units) moved in a single frame is less than this value, the 
 *	frame is ignored. 
 *	If the distance (in units) moved in a single frame is greater than or equal to 
 *	this value, then the distance is applied to the tracked total distance moved.
 */
var(Spawn)	float						MinFrameDistance;


/** If TRUE, ignore the X-component of the movement */
var(Spawn)	bool						bIgnoreMovementAlongX;
/** If TRUE, ignore the Y-component of the movement */
var(Spawn)	bool						bIgnoreMovementAlongY;
/** If TRUE, ignore the Z-component of the movement */
var(Spawn)	bool						bIgnoreMovementAlongZ;

//=============================================================================
//	C++
//=============================================================================
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

//=============================================================================
//	Default properties
//=============================================================================

defaultproperties
{
   UnitScalar=50.000000
   SpawnPerUnit=(Distribution=RequiredDistributionSpawnPerUnit,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   MovementTolerance=0.100000
   bSpawnModule=True
   Name="Default__ParticleModuleSpawnPerUnit"
   ObjectArchetype=ParticleModuleSpawnBase'Engine.Default__ParticleModuleSpawnBase'
}
