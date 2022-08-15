/**
 * SeqAct_WaitForLevelsVisible
 *
 * Kismet action exposing associating/ dissociating of levels.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_WaitForLevelsVisible extends SeqAct_Latent
	native(Sequence);

/** Names of levels to wait for visibility. */
var() array<Name> LevelNames;

/** If TRUE engine will request blocking load if level is in process of being loaded. */
var() bool bShouldBlockOnLoad;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** checks if the required levels are visible and returns the result; if levels need to be loaded and bShouldBlockOnLoad, sets the WorldInfo flag to block */
native final function bool CheckLevelsVisible();

event Activated()
{
	local PlayerController PC;

	foreach GetWorldInfo().AllControllers(class'PlayerController', PC)
	{
		if (NetConnection(PC.Player) != None && ChildConnection(PC.Player) == None)
		{
			PC.ClientWaitForLevelsVisible(self);
		}
	}
}

defaultproperties
{
   bShouldBlockOnLoad=True
   InputLinks(0)=(LinkDesc="Wait")
   ObjName="Wait for Levels to be visible"
   ObjCategory="Level"
   Name="Default__SeqAct_WaitForLevelsVisible"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
