/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class UnrealEdEngine extends EditorEngine
	native
	config(Engine)
	noexport
	transient;

var const noexport	pointer NotifyVtbl;

/** Global instance of the editor options class. */
var const UnrealEdOptions  EditorOptionsInst;

/**
 * Manager responsible for creating and configuring browser windows
 */
var const BrowserManager BrowserManager;

/**
 * Manager responsible for configuring and rendering thumbnails
 */
var const ThumbnailManager ThumbnailManager;

/**
 * Holds the name of the browser manager class to instantiate
 */
var config string BrowserManagerClassName;

/**
 * Holds the name of the class to instantiate
 */
var config string ThumbnailManagerClassName;

/** The current autosave number, appended to the autosave map name, wraps after 10 */
var const config int			AutoSaveIndex;
/** The number of 10-sec intervals that have passed since last autosave. */
var const float					AutosaveCount;
/** Pause ticking of the autosave counter? */
var const bool					bAutosaveCountPaused;

/** If we are currently autosaving */
var const bool					bIsAutoSaving;

/** A buffer for implementing material expression copy/paste. */
var const Material				MaterialCopyPasteBuffer;

/** A buffer for implementing matinee track/group copy/paste. */
var const array<Object>			MatineeCopyPasteBuffer;

/** A buffer for implementing sound cue nodes copy/paste. */
var const SoundCue				SoundCueCopyPasteBuffer;

/** Used for copy/pasting sockets between skeletal meshes. */
struct native SkelSocketCopyInfo
{
	var name		SocketName;
	var name		BoneName;
	var vector		RelativeLocation;
	var rotator		RelativeRotation;
	var vector		RelativeScale;
};

/** A buffer for implementing socket copy/paste. */
var const native array<SkelSocketCopyInfo>		SkelSocketPasteBuffer;

/** Global list of instanced animation compression algorithms. */
var array<AnimationCompressionAlgorithm>	AnimationCompressionAlgorithms;

/** Array of packages to be fully loaded at Editor startup. */
var config array<string> PackagesToBeFullyLoadedAtStartup;

/** class names of Kismet objects to hide in the menus (i.e. because they aren't applicable for this game) */
var config array<name> HiddenKismetClassNames;

/** Names of 'approved' ProcBuilding Ruleset collections */
var config array<string> ApprovedPBRulesetCollections;

/** Used during asset renaming/duplication to specify class-specific package/group targets. */
struct native ClassMoveInfo
{
	/** The type of asset this MoveInfo applies to. */
	var config string ClassName;
	/** The target package info which assets of this type are moved/duplicated. */
	var config string PackageName;
	/** The target group info which assets of this type are moved/duplicated. */
	var config string GroupName;
	/** If TRUE, this info is applied when moving/duplicating assets. */
	var config bool bActive;
};

/** Used during asset renaming/duplication to specify class-specific package/group targets. */
var config array<ClassMoveInfo>	ClassRelocationInfo;

/** Current target for LOD parenting operations (actors will use this as the replacement) */
var actor CurrentLODParentActor;

enum EPackageNotifyState
{
	// The user has been prompted with the balloon taskbar message
	NS_BalloonPrompted, 
	// The user responded to the balloon task bar message and got the modal prompt to checkout dialog and responded to it
	NS_DialogPrompted, 
	// The package has been marked dirty and is pending a balloon prompt 
	NS_PendingPrompt,
};

enum EEngineVerWarningState
{
	// The user needs to be warned about the package
	VWS_PendingWarn,
	// The user has been warned about the package
	VWS_Warned,
	// Warning for the package unnecessary
	VWS_WarningUnnecessary,
};

/** If we have packages that are pending and we should notify the user that they need to be checkedout */
var bool bNeedToPromptForCheckout;

/** Whether the user needs to be prompted about a package being saved with an engine version newer than the current one or not */
var bool bNeedWarningForPkgEngineVer;

/** A mapping of packages to their checkout notify state.  This map only contains dirty packages.  Once packages become clean again, they are removed from the map.*/
var native map{UPackage*, byte} PackageToNotifyState;

/** Map to track which packages have been checked for engine version when modified */
var native map{FString, byte} PackagesCheckedForEngineVersion;

/** Array of sorted, localized editor sprite categories */
var array<string> SortedSpriteCategories;

/** Mapping of unlocalized sprite category names to their matching indices in the sorted sprite categories array */
var native map{FName, int} UnlocalizedCategoryToIndexMap;

defaultproperties
{
   NotifyVtbl=
   PackagesToBeFullyLoadedAtStartup(0)="EditorMaterials"
   PackagesToBeFullyLoadedAtStartup(1)="EditorMeshes"
   PackagesToBeFullyLoadedAtStartup(2)="EditorResources"
   PackagesToBeFullyLoadedAtStartup(3)="EngineMaterials"
   PackagesToBeFullyLoadedAtStartup(4)="EngineFonts"
   PackagesToBeFullyLoadedAtStartup(5)="EngineResources"
   PackagesToBeFullyLoadedAtStartup(6)="Engine_MI_Shaders"
   PackagesToBeFullyLoadedAtStartup(7)="MapTemplateIndex"
   GridSizes(0)=1.000000
   GridSizes(1)=2.000000
   GridSizes(2)=4.000000
   GridSizes(3)=8.000000
   GridSizes(4)=16.000000
   GridSizes(5)=32.000000
   GridSizes(6)=80.000000
   GridSizes(7)=160.000000
   GridSizes(8)=320.000000
   GridSizes(9)=640.000000
   GridSizes(10)=1280.000000
   HeightMapExportClassName=
   PlayInEditorWidth=3840
   PlayInEditorHeight=2160
   Name="Default__UnrealEdEngine"
   ObjectArchetype=EditorEngine'UnrealEd.Default__EditorEngine'
}
