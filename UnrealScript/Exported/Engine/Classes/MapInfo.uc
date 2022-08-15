/**
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */


/** contains game-specific map data, attached to the WorldInfo */
class MapInfo extends Object
	native
	abstract
	editinlinenew;


/** The default lighting channel to use for dynamically spawned actors.
	NOTE - This is in the engine class because it is accessed by engine 
	code inside of UnShadowmap.cpp
 */
var bool bDefaultPawnsToOutdoor;	


// NVCHANGE_BEGIN: RLS - PhysX Triangle Collision
/** Enable automatic triangle collision. */
var(Flex)		bool						bUseFlexTriangleCollision;

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

// NVCHANGE_END: RLS - PhysX Triangle Collision

defaultproperties
{
   bUseFlexTriangleCollision=True
   Name="Default__MapInfo"
   ObjectArchetype=Object'Core.Default__Object'
}
