/**
 * UISceneClient used when playing a game.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class GameUISceneClient extends UISceneClient
	within UIInteraction
	native(UIPrivate)
	config(UI);

/** Cached DeltaTime value from the last Tick() call */
var	const	transient							float				LatestDeltaTime;

/** The time (in seconds) that the last "key down" event was recieved from a key that can trigger double-click events */
var	const	transient							double				DoubleClickStartTime;

/**
 * The location of the mouse the last time a key press was received.  Used to determine when to simulate a double-click
 * event.
 */
var const	transient							IntPoint			DoubleClickStartPosition;

/**
 * map of controllerID to list of keys which were pressed when the UI began processing input
 * used to ignore the initial "release" key event from keys which were already pressed when the UI began processing input.
 */
var	const	transient	native					Map_Mirror			InitialPressedKeys{TMap<INT,TArray<FName> >};

/**
 * Indicates that the input processing status of the UI has potentially changed; causes UpdateInputProcessingStatus to be called
 * in the next Tick().
 */
var	const	transient							bool				bUpdateInputProcessingStatus;

/**
 * Indicates that the viewport size being used by one or more scenes is out of date; triggers a call to NotifyViewportResized during the
 * next tick.
 */
var			transient							bool				bUpdateSceneViewportSizes;

/** Controls whether debug input commands are accepted */
var			config								bool				bEnableDebugInput;
/** Controls whether debug information about the scene is rendered */
var			config								bool				bRenderDebugInfo;

/**
 * Controls whether the UI system should prevent the game from recieving input whenever it's active.  For games with
 * interactive menus that remain on-screen during gameplay, you'll want to change this value to FALSE.
 */
var	const	config								bool				bCaptureUnprocessedInput;

/** The list of navigation aliases to check input support for */
var const transient array<name> NavAliases;

/** The list of axis input keys to check input support for */
var const transient array<name> AxisInputKeys;

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

/* == Delegates == */

/* == Natives == */
/**
 * @return	the current netmode, or NM_MAX if there is no valid world
 */
native static final function WorldInfo.ENetMode GetCurrentNetMode();

/**
 * Triggers a call to UpdateInputProcessingStatus on the next Tick().
 */
native final function RequestInputProcessingUpdate();

/**
 * Callback which allows the UI to prevent unpausing if scenes which require pausing are still active.
 * @see PlayerController.SetPause
 */
native final function bool CanUnpauseInternalUI();

/* == Events == */

/**
 * Wrapper for pausing the game.
 *
 * @param	bDesiredPauseState	TRUE indicates that the game should be paused.
 * @param	PlayerIndex			the index [into Engine GamePlayers array] for the player that should be used for pausing the game; can
 *								affect whether the game is actually paused or not (i.e. if the player is an admin in a multi-player match,
 *								for example).
 */
event PauseGame( bool bDesiredPauseState, optional int PlayerIndex=0 )
{
	local PlayerController PlayerOwner;

	if ( GamePlayers.Length > 0 )
	{
		PlayerIndex = Clamp(PlayerIndex, 0, GamePlayers.Length - 1);
		PlayerOwner = GamePlayers[PlayerIndex].Actor;
		if ( PlayerOwner != None )
		{
			PlayerOwner.SetPause(bDesiredPauseState, CanUnpauseInternalUI);
		}
	}
}

/**
 * Called when the local player is about to travel to a new URL.  This callback should be used to perform any preparation
 * tasks, such as updating status text and such.  All cleanup should be done from NotifyGameSessionEnded, as that function
 * will be called in some cases where NotifyClientTravel is not.
 *
 * @param	TravellingPlayer	the player that received the call to ClientTravel
 * @param	TravelURL			a string containing the mapname (or IP address) to travel to, along with option key/value pairs
 * @param	TravelType			indicates whether the player will clear previously added URL options or not.
 * @param	bIsSeamlessTravel	indicates whether seamless travelling will be used.
 */
function NotifyClientTravel( PlayerController TravellingPlayer, string TravelURL, ETravelType TravelType, bool bIsSeamlessTravel );

/**
 * Called when the current map is being unloaded.  Cleans up any references which would prevent garbage collection.
 */
function NotifyGameSessionEnded();

/**
 * Called when a new player has been added to the list of active players (i.e. split-screen join)
 *
 * @param	PlayerIndex		the index [into the GamePlayers array] where the player was inserted
 * @param	AddedPlayer		the player that was added
 */
function NotifyPlayerAdded( int PlayerIndex, LocalPlayer AddedPlayer )
{
	if ( IsUIActive(SCENEFILTER_InputProcessorOnly) )
	{
		RequestInputProcessingUpdate();
	}
}

/**
 * Called when a player has been removed from the list of active players (i.e. split-screen players)
 *
 * @param	PlayerIndex		the index [into the GamePlayers array] where the player was located
 * @param	RemovedPlayer	the player that was removed
 */
function NotifyPlayerRemoved( int PlayerIndex, LocalPlayer RemovedPlayer )
{
	if ( IsUIActive(SCENEFILTER_InputProcessorOnly) )
	{
		RequestInputProcessingUpdate();
	}
}

/**
 * Helper function to deduce the PlayerIndex of a Player
 * 
 * @param P - The LocalPlayer for whom you wish to deduce their PlayerIndex
 * 
 * @return Returns the index into the GamePlayers array that references this Player. If it cannot find the player, it returns 0.
 */
function int FindLocalPlayerIndex(Player P)
{
	local Engine Engine;
	local int i;

	Engine = class'Engine'.static.GetEngine();
	for (i = 0; i < Engine.GamePlayers.length; i++)
	{
		if (Engine.GamePlayers[i] == P)
		{
			return i;
		}
	}
	return 0;
}

defaultproperties
{
   bEnableDebugInput=True
   bCaptureUnprocessedInput=True
   Name="Default__GameUISceneClient"
   ObjectArchetype=UISceneClient'Engine.Default__UISceneClient'
}
