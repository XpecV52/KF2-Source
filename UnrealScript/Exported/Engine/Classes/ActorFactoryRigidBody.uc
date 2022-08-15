/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryRigidBody extends ActorFactoryDynamicSM
	config(Editor)
	collapsecategories
	hidecategories(Object)
	native;

/** Should spawned Actor start simulating as soon as its created, or be 'asleep' until hit. */
var()	bool	bStartAwake;

/** Sets the bDamageAppliesImpulse flag on the new Actor. */
var()	bool	bDamageAppliesImpulse;

/** Indicates if the initial velocity settings below should be considered in the world space or local space of the spawn target actor. */
var()	bool	bLocalSpaceInitialVelocity;

/** Velocity that new rigid bodies will have when created. In the ref frame of the spawn target actor.  */
var()	vector	InitialVelocity;

/**
 *	If valid, Velocity added to InitialVelocity when creating actor.
 *	This is here in addition to InitialVelocity to maintain backwards compatibility.
 */
var()	DistributionVector	AdditionalVelocity;

/**
 *	If valid, Angular Velocity given to newly spawned Actor.
 */
var()	DistributionVector	InitialAngularVelocity;

/** Allows setting the RBChannel flag on the spawned rigid body's StaticMeshComponent. */
var()	ERBCollisionChannel		RBChannel;


/** Enable 'Stay upright' torque, that tries to keep Z axis of KActor pointing along world Z */
var()	bool		bEnableStayUprightSpring;

/** Torque applied to try and keep KActor horizontal. */
var()	float		StayUprightTorqueFactor;

/** Max torque that can be applied to try and keep KActor horizontal */
var()	float		StayUprightMaxTorque;

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
   bStartAwake=True
   bDamageAppliesImpulse=True
   RBChannel=RBCC_GameplayPhysics
   StayUprightTorqueFactor=1000.000000
   StayUprightMaxTorque=1500.000000
   bNoEncroachCheck=True
   bBlockRigidBody=True
   CollisionType=COLLIDE_BlockAll
   GameplayActorClass=Class'Engine.KActorSpawnable'
   MenuName="Add RigidBody"
   MenuPriority=15
   NewActorClass=Class'Engine.KActor'
   Name="Default__ActorFactoryRigidBody"
   ObjectArchetype=ActorFactoryDynamicSM'Engine.Default__ActorFactoryDynamicSM'
}
