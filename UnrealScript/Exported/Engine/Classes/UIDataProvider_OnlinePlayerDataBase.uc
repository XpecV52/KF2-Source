/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

/**
 * This class is responsible for retrieving the friends list from the online
 * subsystem and populating the UI with that data.
 */
class UIDataProvider_OnlinePlayerDataBase extends UIDataProvider
	native(inherit)
	transient
	abstract;

/** Holds the player that this provider is getting friends for */
var int PlayerControllerId;

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

/**
 * Binds the player to this provider
 *
 * @param InPlayer the player that is being bound to the provider
 */
event OnRegister(LocalPlayer InPlayer)
{
	if (InPlayer != None)
	{
		PlayerControllerId = InPlayer.ControllerId;
	}
}

/**
 * Tells the provider that the player is no longer valid
 */
event OnUnregister()
{
	PlayerControllerId = -1;
}

defaultproperties
{
   PlayerControllerId=-1
   Name="Default__UIDataProvider_OnlinePlayerDataBase"
   ObjectArchetype=UIDataProvider'Engine.Default__UIDataProvider'
}
