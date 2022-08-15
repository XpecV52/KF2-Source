/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * This class handles the registration, creation, and destruction of browser
 * panes. All of the browser panes are registered in an INI file so that they
 * can be late bound into the editor.
 *
 * @see UBrowserManager.h for the native definitions
 */
class BrowserManager extends Object
	native
	config(Editor);

/**
 * Struct containing the information needed to register a browser window
 */
struct native BrowserPaneInfo
{
	/**
	 * This is the browser pane id used for associating instantiated windows
	 * with their events, etc.
	 */
	var int PaneID;
	/**
	 * The name of the wxWindow to create for the browser pane.
	 * NOTE: This must be a subclass of WxDockableWindow
	 */
	var String WxWindowClassName;
	/**
	 * This is the friendly name used to find browsers by name instead of
	 * by id
	 */
	var String FriendlyName;
	/**
	 * True if the browser pane should be hidden at first-time startup
	 */
	var const bool bInitiallyHidden;
	/**
	 * Used to indicate that this pane is a clone of a "canonical" pane. This
	 * is used to allow the removal of a clone, but hiding of a "canonical"
	 * pane. This prevents the user from permanently deleting a pane from
	 * their configuration.
	 */
	var const int CloneOfPaneID;
	/**
	 * Number for this clone so that the description can indicate it (Log-1)
	 */
	var const int CloneNumber;
	/**
	 * This is a pointer to the window that has been created
	 */
	var const transient pointer WxBrowserPtr;
};

/**
 * Holds the list of browser panes to create/support
 */
var config array<BrowserPaneInfo> BrowserPanes;

/**
 * Whether the browser panes have been created or not
 */
var bool bHasCreatedPanes;
/**
 * Whether the browser panes have been restored to their state from last frame
 */
var bool bHasStateBeenRestored;

/**
 * Whether a browser window is being created/remove, or selection changing, interactively by the user.  We use
 * this state to prevent the Ctrl+Tab dialog from showing in some cases.
 */
var bool bIsBrowserLayoutChanging;

/**
 * The last selected browser pane
 */
var config int LastSelectedPaneID;

/**
 * Holds references to browser panes that were created
 */
var const transient pointer CreatedPanesPtr;

/**
 * This is the docking container instance
 */
var const transient pointer DockingContainerPtr;

/**
 * Holds the list of floating windows not docked in the docking container
 */
var const transient pointer FloatingWindowsArrayPtr;

/**
 * Holds the pointer to the frame window's menus that are to be changed as
 * browsers are created and removed.
 */
var const transient pointer BrowserMenuPtr;

defaultproperties
{
   BrowserPanes(0)=(WxWindowClassName="WxContentBrowserHost",FriendlyName="ContentBrowser",CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(1)=(PaneID=1,WxWindowClassName="WxActorBrowser",FriendlyName="ActorBrowser",CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(2)=(PaneID=2,WxWindowClassName="WxLevelBrowser",FriendlyName="LevelBrowser",CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(3)=(PaneID=3,WxWindowClassName="WxSceneManager",FriendlyName="SceneManager",CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(4)=(PaneID=4,WxWindowClassName="WxLayerBrowser",FriendlyName="LayerBrowser",CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(5)=(PaneID=5,WxWindowClassName="WxAttachmentEditor",FriendlyName="Attachments",bInitiallyHidden=True,CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(6)=(PaneID=6,WxWindowClassName="WxReferencedAssetsBrowser",FriendlyName="ReferencedAssetsBrowser",bInitiallyHidden=True,CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(7)=(PaneID=7,WxWindowClassName="WxGameStatsVisualizer",FriendlyName="GameStatsVisualizer",bInitiallyHidden=True,CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(8)=(PaneID=8,WxWindowClassName="WxPrimitiveStatsBrowser",FriendlyName="PrimitiveStats",bInitiallyHidden=True,CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(9)=(PaneID=9,WxWindowClassName="WxBuildingStatsBrowser",FriendlyName="BuildingStats",bInitiallyHidden=True,CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(10)=(PaneID=10,WxWindowClassName="WxTextureStatsBrowser",FriendlyName="TextureStats",bInitiallyHidden=True,CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(11)=(PaneID=11,WxWindowClassName="WxTaskBrowser",FriendlyName="TaskBrowser",bInitiallyHidden=True,CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(12)=(PaneID=12,WxWindowClassName="WxLogBrowser",FriendlyName="LogBrowser",bInitiallyHidden=True,CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(13)=(PaneID=13,WxWindowClassName="WxStartPageHost",FriendlyName="Documentation",CloneOfPaneID=-1,CloneNumber=-1)
   BrowserPanes(14)=(PaneID=14,WxWindowClassName="WxAkRadiusBrowser",FriendlyName="RadiusBrowser",CloneOfPaneID=-1,CloneNumber=-1)
   Name="Default__BrowserManager"
   ObjectArchetype=Object'Core.Default__Object'
}
