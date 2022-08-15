/**
 * Serves as the interface between a UIScene and scene owners.  Provides scenes with all
 * data necessary for operation and routes rendering to the scenes.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class UISceneClient extends UIRoot
	native(UserInterface)
	abstract
	inherits(FExec)
	transient;

/** the viewport to use for rendering scenes */
var const transient	native					pointer				RenderViewport{FViewport};

/**
 * the location of the mouse
 *
 * @fixme splitscreen
 */
var const transient							IntPoint			MousePosition;

/**
 * Manager all persistent global data stores.  Set by the object that creates the scene client.
 */
var	const transient							DataStoreClient		DataStoreManager;

/**
 * Stores the 3D projection matrix being used to render the UI.
 */
var	const transient							matrix				CanvasToScreen;
var	const transient							matrix				InvCanvasToScreen;


/** Post process chain to be applied when rendering UI Scenes */
var transient								PostProcessChain	UIScenePostProcess;
/** if TRUE then post processing is enabled using the UIScenePostProcess */
var transient								bool				bEnablePostProcess;

/**
 * Used to limit which scenes should be considered when determining whether the UI should be considered "active"
 * Represented in C++ as enums values.
 */
const	SCENEFILTER_None				=0x00000000;
/** Include the transient scene */
const	SCENEFILTER_IncludeTransient	=0x00000001;
/** Consider only scenes which can process input */
const	SCENEFILTER_InputProcessorOnly	=0x00000002;
/** Consider only scenes which require the game to be paused */
const	SCENEFILTER_PausersOnly			=0x00000004;
/** Consider only scenes which support 3D primitives rendering */
const	SCENEFILTER_PrimitiveUsersOnly	=0x00000008;
/** Only consider scenes which render full-screen */
const	SCENEFILTER_UsesPostProcessing	=0x00000010;
/** Include only those scenes which can receive focus (i.e. bNeverFocus=false) */
const	SCENEFILTER_ReceivesFocus		=0x00000020;
/** Any scene */
const	SCENEFILTER_Any					=0xFFFFFFFF;


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

/**
 * Returns true if there is an unhidden fullscreen UI active
 *
 * @param	Flags	a bitmask of values which alter the result of this method;  the bits are derived from the ESceneFilterTypes
 *					enum (which is native-only); script callers must pass these values literally
 *
 * @return TRUE if the UI is currently active
 */
native final noexportheader function bool IsUIActive( optional int Flags=SCENEFILTER_Any ) const;


/**
 * Loads the skin package containing the skin with the specified tag, and sets that skin as the currently active skin.
 * @todo
 */
//native final function SetActiveSkin( Name SkinTag );

/**
 * Returns the current canvas to screen projection matrix.
 *
 * @param	Widget	if specified, the returned matrix will include the widget's tranformation matrix as well.
 *
 * @return	a matrix which can be used to project 2D pixel coordines into 3D screen coordinates. ??
 */
native final function matrix GetCanvasToScreen() const;

/**
 * Returns the inverse of the local to world screen projection matrix.
 *
 * @param	Widget	if specified, the returned matrix will include the widget's tranformation matrix as well.
 *
 * @return	a matrix which can be used to transform normalized device coordinates (i.e. origin at center of screen) into
 *			into 0,0 based pixel coordinates. ??
 */
native final function matrix GetInverseCanvasToScreen() const;

/**
 * Called when the scene client is first initialized.
 */
event InitializeSceneClient();

defaultproperties
{
   Name="Default__UISceneClient"
   ObjectArchetype=UIRoot'Engine.Default__UIRoot'
}
