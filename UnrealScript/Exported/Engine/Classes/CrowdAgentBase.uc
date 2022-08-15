/**
 * This is the base class for crowd agents.  Allows us to interact with it in the Engine module.
 * 
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class CrowdAgentBase extends Actor
	abstract
	native(AI)
    implements( Interface_NavigationHandle )
	dependson( CoverLink )
	ClassGroup(Crowd);


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

// Interface_navigationhandle stub - called when path edge is deleted that this controller is using
event NotifyPathChanged();

defaultproperties
{
   CollisionType=COLLIDE_CustomDefault
   Name="Default__CrowdAgentBase"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
