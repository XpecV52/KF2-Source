/**
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */


/** contains game-specific map data, attached to the WorldInfo */
class MapInfo extends Object
	native
	abstract
	editinlinenew;

`if(`__TW_)
/** The default lighting channel to use for dynamically spawned actors.
	NOTE - This is in the engine class because it is accessed by engine 
	code inside of UnShadowmap.cpp
 */
var bool bDefaultPawnsToOutdoor;	
`endif

cpptext
{
#if WITH_EDITOR
	virtual void CheckForErrors() {}
#endif
}

