//=============================================================================
// GameEngine: The game subsystem.
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class GameEngine extends Engine
	native(GameEngine)
	config(Engine)
	transient;

// URL structure.
struct transient native URL
{
	var		string			Protocol;	// Protocol, i.e. "unreal" or "http".
	var		string			Host;		// Optional hostname, i.e. "204.157.115.40" or "unreal.epicgames.com", blank if local.
	var		int				Port;		// Optional host port.
	var		string			Map;		// Map name, i.e. "SkyCity", default is "Index".
	var		array<string>	Op;			// Options.
	var		string			Portal;		// Portal to enter through, default is "".
//@HSL_BEGIN_XBOX - BWJ - 11/20/14 - Adding support for secure address (for use in XB1)
	var		string			SecureAddress;
//@HSL_END_XBOX
	var		int 			Valid;
structcpptext
{

	// Statics.
	static FString DefaultProtocol;
	static FString DefaultName;
	static FString DefaultMap;
	static FString DefaultLocalMap;
	static FString DefaultLocalOptions;
	static FString DefaultTransitionMap; // map used as in-between for seamless travel
	static FString DefaultHost;
	static FString DefaultPortal;
	static FString DefaultMapExt;
	static FString DefaultSaveExt;
	/** Additional map extension to look for when parsing urls for map loading */
	static FString AdditionalMapExt;
	static INT DefaultPort;
	/** port to listen for new client peer connections */
	static INT DefaultPeerPort;
	static UBOOL bDefaultsInitialized;

	// Constructors.
	FURL( const TCHAR* Filename=NULL );
	FURL( FURL* Base, const TCHAR* TextURL, ETravelType Type );
	static void StaticInit();
	static void StaticExit();

	/**
	 * Static: Removes any special URL characters from the specified string
	 *
	 * @param Str String to be filtered
	 */
	static void FilterURLString( FString& Str );

//@HSL_BEGIN_XBOX
	/**
	 * Static: Replaces any special URL characters with encoded versions
	 *
	 * @param Str String to be encoded
	 */
	static void EncodeURLString( FString& Str );

	/**
	 * Static: Replaces any encoded versions of special URL characters with their decoded versions
	 *
	 * @param Str String to be decoded
	 */
	static void DecodeURLString( FString& Str );
//@HSL_END_XBOX


	// Functions.
	UBOOL IsInternal() const;
	UBOOL IsLocalInternal() const;
	UBOOL HasOption( const TCHAR* Test ) const;
	const TCHAR* GetOption( const TCHAR* Match, const TCHAR* Default ) const;
	void LoadURLConfig( const TCHAR* Section, const TCHAR* Filename=NULL );
	void SaveURLConfig( const TCHAR* Section, const TCHAR* Item, const TCHAR* Filename=NULL ) const;
	void AddOption( const TCHAR* Str );
	void RemoveOption( const TCHAR* Key, const TCHAR* Section = NULL, const TCHAR* Filename = NULL);
	FString String( UBOOL FullyQualified=0 ) const;
	friend FArchive& operator<<( FArchive& Ar, FURL& U );
//@HSL_BEGIN_XBOX - BWJ - 11-20-14- Adding support for secure address (for use in XB1)
	UBOOL HasSecureAddress() const;
//@HSL_END_XBOX

	// Operators.
	UBOOL operator==( const FURL& Other ) const;
}
};

var			PendingLevel	GPendingLevel;


var string PendingLevelPlayerControllerClassName;





/** URL the last time we travelled */
var			URL				LastURL;

/** last server we connected to (for "reconnect" command) */
var URL LastRemoteURL;
var config	array<string>	ServerActors;

var			string			TravelURL;
var			byte			TravelType;


//@HSL_BEGIN - BWJ - 8-10-16 - Saved client URL for takeover (contains client options)
var			string			ClientOptionsForTakeoverURL;

var 		string 			TakeoverURL;
var globalconfig  bool      bUsedForTakeover;
var         bool            bAvailableForTakeover;
/** TRUE if this is a private server. Used for console */
var			bool			bPrivateServer;


/** set for one tick after completely loading and initializing a new world
 * (regardless of whether it's LoadMap() or seamless travel)
 */
var const transient bool bWorldWasLoadedThisTick;

/** check to see if we need to start a movie capture
 * (used on the first tick when we want to record a matinee)
 */
var const transient bool bCheckForMovieCapture;

/**
 * Triggers a call to PostLoadMap() the next Tick, turns off loading movie if LoadMap() has been called.
 */
var const transient bool bTriggerPostLoadMap;

/**
 * TRUE if the loading movie was started during LoadMap().
 */
var const transient bool bStartedLoadMapMovie;

/** The singleton online interface for all game code to use */
var const transient OnlineSubsystem OnlineSubsystem;

//@HSL_BEGIN - BWJ - 4-5-16 - Playfab support
var const transient PlayfabInterface PlayfabInterfaceInst;
//@HSL_END

//@zombie_ps4_begin - Adding a gamepad light system
var const transient GamePadLightbarSubSystem GamePadLightBarSubsystem;
//@zombie_ps4_end
/** The singleton interface that enumerates available DLC */
var const transient DownloadableContentEnumerator DLCEnumerator;


var string DownloadableContentEnumeratorClassName;





/** The singleton interface that manages the installation and removal of DLC */
var const transient DownloadableContentManager DLCManager;


	var bool bSaveBenchmarkGraphs;
	struct native transient BenchmarkSample
	{
		var float AppTime, RenderThreadTime, GameThreadTime, GPUFrameTime, FrameTime;
	};
	
	var array<BenchmarkSample> BenchmarkSamples;



var string DownloadableContentManagerClassName;





/**
 * Array of package/ level names that need to be loaded for the pending map change. First level in that array is
 * going to be made a fake persistent one by using ULevelStreamingPersistent.
 */
var const	array<name>		LevelsToLoadForPendingMapChange;
/** Array of already loaded levels. The ordering is arbitrary and depends on what is already loaded and such.	*/
var	const	array<level>	LoadedLevelsForPendingMapChange;
/** Human readable error string for any failure during a map change request. Empty if there were no failures.	*/
var const	string			PendingMapChangeFailureDescription;
/** If TRUE, commit map change the next frame.																	*/
var const	bool			bShouldCommitPendingMapChange;
/** Maximium delta time the engine uses to populate GDeltaTime. If 0, unbound.									*/
var config	float			MaxDeltaTime;
/**
 *	If true - clear all AnimSet LinkupCaches during map load.
 *	You need to do this is the set of skeletal meshes that you are playing anims on is not bounded.
 */
var config	bool			bClearAnimSetLinkupCachesOnLoadMap;

/** If true, and the platform allows it, the game engine will utilize a secondary screen */
var config bool		bEnableSecondaryDisplay;
/** 
 *	If true, the game engine will create a secondary viewport on init 
 *	Dependent on bEnabledSecondaryDisplay being enabled.
 *	If false, and bEnableSecondaryDisplay is true, the secondary screen will just copy the first.
 */
var config bool		bEnableSecondaryViewport;


var string	SecondaryViewportClientClassName;





/** Secondary viewport clients inside of secondary windows (not for split screen) */
var init array<ScriptViewportClient>	SecondaryViewportClients;

/** Array parallel to SecondaryViewportClients - these are the frames that render the SecondaryViewport clients */
var init array<pointer>		SecondaryViewportFrames{FViewportFrame};

//@HSL_MOD_BEGIN - amiller 4/11/2016 - Adding support to ignore specific packages for Using Handshake
/** An Array of config package names to ignore GUID mismatch errors during connection handshake*/
var const config array<string>	IgnoredUsesGUIDPackages;
//@HSL_MOD_END

/** level streaming updates that should be applied immediately after committing the map change */
struct native LevelStreamingStatus
{
	var name PackageName;
	var bool bShouldBeLoaded, bShouldBeVisible;

	structcpptext
	{
		/** Constructors */
		FLevelStreamingStatus(FName InPackageName, UBOOL bInShouldBeLoaded, UBOOL bInShouldBeVisible)
		: PackageName(InPackageName), bShouldBeLoaded(bInShouldBeLoaded), bShouldBeVisible(bInShouldBeVisible)
		{}
		FLevelStreamingStatus()
		{}
    		FLevelStreamingStatus(EEventParm)
		{
			appMemzero(this, sizeof(FLevelStreamingStatus));
		}
	}
};
var const array<LevelStreamingStatus> PendingLevelStreamingStatusUpdates;

/** Handles to object references; used by the engine to e.g. the prevent objects from being garbage collected.	*/
var const	array<ObjectReferencer>	ObjectReferencers;

enum EFullyLoadPackageType
{
	/** Load the packages when the map in Tag is loaded */
	FULLYLOAD_Map,
	/** Load the packages before the game class in Tag is loaded. The Game name MUST be specified in the URL (game=Package.GameName). Useful for loading packages needed to load the game type (a DLC game type, for instance) */
	FULLYLOAD_Game_PreLoadClass,
	/** Load the packages after the game class in Tag is loaded. Will work no matter how game is specified in UWorld::SetGameInfo. Useful for modifying shipping gametypes by loading more packages (mutators, for instance) */
	FULLYLOAD_Game_PostLoadClass,
	/** Fully load the package as long as the DLC is loaded */
	FULLYLOAD_Always,
	/** Load the package for a mutator that is active */
	FULLYLOAD_Mutator,
};

/** Struct to help hold information about packages needing to be fully-loaded for DLC, etc */
struct native FullyLoadedPackagesInfo
{
	/** When to load these packages */
	var EFullyLoadPackageType FullyLoadType;

	/** When this map or gametype is loaded, the packages in the following array will be loaded and added to root, then removed from root when map is unloaded */
	var string Tag;

	/** The list of packages that will be fully loaded when the above Map is loaded */
	var array<name> PackagesToLoad;

	/** List of objects that were loaded, for faster cleanup */
	var array<object> LoadedObjects;
};

/** A list of tag/array pairs that is used at LoadMap time to fully load packages that may be needed for the map/game with DLC, but we can't use DynamicLoadObject to load from the packages */
var array<FullyLoadedPackagesInfo> PackagesToFullyLoad;

/** Struct to hold a UNetDriver and an assoicated name */
struct native NamedNetDriver
{
	/** The name associated with the driver */
	var name NetDriverName;

	/** A pointer to a UNetDriver */
	var const native pointer NetDriver{class UNetDriver};
};

/** A list of named UNetDrivers */
var const transient array<NamedNetDriver> NamedNetDrivers;

/** Temporary Animation Tagging Information: until we integrate Content Tagging
  * This is configurable information in Engine
  * Tag: Name of Tag
  * Contains: Contains text
  * Priority is index of array
  */
struct native AnimTag
{
	var string 	Tag; // This is Tag name
	var array<string> Contains; // This is contains strings, i.e. _cvr_ or _cover_ for Tag name Cover
};

/**
 * Animation tag for stat system: This is temporary until we can add content tag to animation
 * Currently it auto tags based on "contains" - Check DefaultEngine.ini for modification
 */
var config array<AnimTag> AnimTags;	

//@HSL_BEGIN_XBOX
/** True if trial mode is active */
var const transient bool bTrialActive;
//@HSL_END_XBOX

/**
 * Creates a UNetDriver and associates a name with it.
 *
 * @param NetDriverName The name to associate with the driver.
 *
 * @return True if the driver was created successfully, false if there was an error.
 */
native final function bool CreateNamedNetDriver(name NetDriverName);

/**
 * Destroys a UNetDriver based on its name.
 *
 * @param NetDriverName The name associated with the driver to destroy.
 */
native final function DestroyNamedNetDriver(name NetDriverName);

/** Returns the global online subsytem pointer. This will be null for PIE */
native static final noexport function OnlineSubsystem GetOnlineSubsystem();

//@HSL_BEGIN - BWJ - 4-5-16 - Playfab support
native static final function PlayfabInterface GetPlayfabInterface();
//@HSL_END

/** Returns the DLC enumerator object pointer. This will be null for PIE */
native static final noexport function DownloadableContentEnumerator GetDLCEnumerator();

/** Returns the DLC manager object pointer. This will be null for PIE */
native static final noexport function DownloadableContentManager GetDLCManager();

/** Returns whether this game engine has any secondary screens attached */
native static final noexport function bool HasSecondaryScreenActive();


native function TakeoverServer( string InHostStr, string InUrlStr );
native static function int GetWebAdminPort();
native final function DisableServerTakeover();


//@HSL_BEGIN_XBOX
/** Encodes special URL characters in a string */
native static final noexport function EncodeURLString(out string Str);

/** Decodes special URL characters in a string */
native static final noexport function DecodeURLString(out string Str);
//@HSL_END_XBOX


//@HSL_BEGIN
/** Retrieves percentage of installation finished for streaming install */
native static final function float GetPercentageOfStreamingInstallComplete();
/** Checks to see if streaming install has finished */
native static final function bool IsGameFullyInstalled();
/** Checks to see if some particular chunks have finished installing */
native static final function bool AreChunksInstalled(const out array<int> ChunksToCheck);
/** Gets the install progress of some particular chunks */
native static final function float GetChunksInstallProgress(const out array<int> ChunksToCheck);
/** Gets the install progress of a particular chunk */
native static final function float GetChunkInstallProgress(int ChunkToCheck);
//@HSL_END

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

defaultproperties
{
   LastURL=(Valid=1)
   LastRemoteURL=(Valid=1)
   ServerActors(0)="IpDrv.WebServer"
   bUsedForTakeover=True
   Name="Default__GameEngine"
   ObjectArchetype=Engine'Engine.Default__Engine'
}
