//=============================================================================
// ParticleModuleLocationEmitterDirect
//
// A location module that uses particles from another emitters particles as
// position for its particles.
//
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class ParticleModuleLocationEmitterDirect extends ParticleModuleLocationBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

//=============================================================================
// Variables
//=============================================================================
// LocationEmitter

/** The name of the emitter to use as a source for the location of the particles. */
var(Location) export		noclear	name			EmitterName;

//=============================================================================
// C++ functions
//=============================================================================
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

//=============================================================================
// Default properties
//=============================================================================

defaultproperties
{
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleLocationEmitterDirect"
   ObjectArchetype=ParticleModuleLocationBase'Engine.Default__ParticleModuleLocationBase'
}
