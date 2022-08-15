/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

/**
 * This class is responsible for exposing string settings as arrays to the ui
 */
class UIDataProvider_OnlinePlayerStorageArray extends UIDataProvider
	native(inherit)
	transient;

/** Holds the storage object that will be exposed to the UI */
var OnlinePlayerStorage PlayerStorage;

/** The settings id this provider is responsible for managing */
var int PlayerStorageId;

/**
 * string to use in list column headers for this setting; assigned from the ColumnHeaderText property for the corresponding
 * property or setting from the Settings object.
 */
var	const	string	ColumnHeaderText;

/** Cached set of possible values for this array */
var array<name> Values;

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
   Name="Default__UIDataProvider_OnlinePlayerStorageArray"
   ObjectArchetype=UIDataProvider'Engine.Default__UIDataProvider'
}
