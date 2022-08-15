/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleCollisionActor extends ParticleModuleCollision
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	List of actor parameter names (set on the placed instance) that this particle emitter should collide against
 */
var(Actors) array<name>	ActorsToCollideWith;

/**
 *	If TRUE, then collide with any pawns as well
 */
var(Actors) bool bCheckPawnCollisions;

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
   DampingFactor=(Distribution=DistributionDampingFactor)
   DampingFactorRotation=(Distribution=DistributionDampingFactorRotation)
   MaxCollisions=(Distribution=DistributionMaxCollisions)
   ParticleMass=(Distribution=DistributionParticleMass)
   DelayAmount=(Distribution=DistributionDelayAmount)
   Name="Default__ParticleModuleCollisionActor"
   ObjectArchetype=ParticleModuleCollision'Engine.Default__ParticleModuleCollision'
}
