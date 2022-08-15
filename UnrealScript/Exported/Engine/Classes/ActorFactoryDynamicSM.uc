/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryDynamicSM extends ActorFactory
	config(Editor)
	native
	abstract;

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

var()	StaticMesh		StaticMesh;
var()	vector			DrawScale3D;

/**
 *	For encroachers, don't do the overlap check when they move. You will not get touch events for this actor moving, but it is much faster.
 *	So if you want touch events from volumes or triggers you need to set this to be FALSE.
 *	This is an optimisation for large numbers of PHYS_RigidBody actors for example.
 *	@see Actor.uc bNoEncroachCheck
 */
var()	bool			bNoEncroachCheck;
var()	bool			bNotifyRigidBodyCollision;
var()	ECollisionType		CollisionType;
var()   bool            bBlockRigidBody;

/** Try and use physics hardware for this spawned object. */
var()	bool			bUseCompartment;

/** If false, primitive does not cast dynamic shadows. */
var()	bool			bCastDynamicShadow;

defaultproperties
{
   DrawScale3D=(X=1.000000,Y=1.000000,Z=1.000000)
   bCastDynamicShadow=True
   CollisionType=COLLIDE_NoCollision
   Name="Default__ActorFactoryDynamicSM"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
