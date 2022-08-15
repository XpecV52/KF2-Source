/**
 *	ParticleModuleTrailSource
 *
 *	This module implements a single source for a Trail emitter.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class ParticleModuleTrailSource extends ParticleModuleTrailBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

enum ETrail2SourceMethod
{
	/** Default	- use the emitter position. 
	 *	This is the fallback for when other modes can't be resolved.
	 */
	PET2SRCM_Default,
	/** Particle	- use the particles from a given emitter in the system.		
	 *	The name of the emitter should be set in SourceName.
	 */
	PET2SRCM_Particle,
	/** Actor		- use the actor as the source.
	 *	The name of the actor should be set in SourceName.
	 */
	PET2SRCM_Actor
};

/** The source method for the trail. */
var(Source)					ETrail2SourceMethod				SourceMethod;

/** The name of the source - either the emitter or Actor. */
var(Source)					name							SourceName;

/** The strength of the tangent from the source point for each Trail. */
var(Source)					rawdistributionfloat			SourceStrength;

/** Whether to lock the source to the life of the particle. */
var(Source)					bool							bLockSourceStength;

/**
 *	SourceOffsetCount
 *	The number of source offsets that can be expected to be found on the instance.
 *	These must be named
 *		TrailSourceOffset#
 */
var(Source)					INT								SourceOffsetCount;

/** 
 *	Default offsets from the source(s). 
 *	If there are < SourceOffsetCount slots, the grabbing of values will simply wrap.
 */
var(Source) editfixedsize	array<vector>					SourceOffsetDefaults;

/**	Particle selection method, when using the SourceMethod of Particle. */
var(Source)					EParticleSourceSelectionMethod	SelectionMethod;

/**	Interhit particle rotation - only valid for SourceMethod of PET2SRCM_Particle. */
var(Source)					bool							bInheritRotation;

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
   SelectionMethod=EPSSM_Sequential
   SourceStrength=(Distribution=DistributionSourceStrength,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(100.000000,100.000000,100.000000,100.000000))
   Name="Default__ParticleModuleTrailSource"
   ObjectArchetype=ParticleModuleTrailBase'Engine.Default__ParticleModuleTrailBase'
}
