//=============================================================================
// RigidBodyBase: The base class of all rigid bodies.
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class RigidBodyBase extends Actor
	ClassGroup(Physics)
	native
	abstract;

defaultproperties
{
   Name="Default__RigidBodyBase"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
