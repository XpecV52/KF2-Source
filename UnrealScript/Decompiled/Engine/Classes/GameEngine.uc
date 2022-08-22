/*******************************************************************************
 * GameEngine generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GameEngine extends Engine
    transient
    native(GameEngine)
    config(Engine);

enum EFullyLoadPackageType
{
    FULLYLOAD_Map,
    FULLYLOAD_Game_PreLoadClass,
    FULLYLOAD_Game_PostLoadClass,
    FULLYLOAD_Always,
    FULLYLOAD_Mutator,
    FULLYLOAD_MAX
};

struct native transient URL
{
    var init string Protocol;
    var init string Host;
    var init int Port;
    var init string Map;
    var init array<string> Op;
    var init string Portal;
    var init int Valid;

    structdefaultproperties
    {
        Protocol=""
        Host=""
        Port=0
        Map=""
        Op=none
        Portal=""
        Valid=0
    }
};

struct native transient BenchmarkSample
{
    var init float AppTime;
    var init float RenderThreadTime;
    var init float GameThreadTime;
    var init float GPUFrameTime;
    var init float FrameTime;

    structdefaultproperties
    {
        AppTime=0
        RenderThreadTime=0
        GameThreadTime=0
        GPUFrameTime=0
        FrameTime=0
    }
};

struct native LevelStreamingStatus
{
    var name PackageName;
    var bool bShouldBeLoaded;
    var bool bShouldBeVisible;

    structdefaultproperties
    {
        PackageName=None
        bShouldBeLoaded=false
        bShouldBeVisible=false
    }
};

struct native FullyLoadedPackagesInfo
{
    var GameEngine.EFullyLoadPackageType FullyLoadType;
    var string Tag;
    var array<name> PackagesToLoad;
    var array<Object> LoadedObjects;

    structdefaultproperties
    {
        FullyLoadType=EFullyLoadPackageType.FULLYLOAD_Map
        Tag=""
        PackagesToLoad=none
        LoadedObjects=none
    }
};

struct native NamedNetDriver
{
    var name NetDriverName;
    var native const Pointer NetDriver;

    structdefaultproperties
    {
        NetDriverName=None
    }
};

struct native AnimTag
{
    var string Tag;
    var array<string> Contains;

    structdefaultproperties
    {
        Tag=""
        Contains=none
    }
};

var PendingLevel GPendingLevel;
var string PendingLevelPlayerControllerClassName;
var URL LastURL;
var URL LastRemoteURL;
var config array<config string> ServerActors;
var string TravelURL;
var byte TravelType;
var string ClientOptionsForTakeoverURL;
var string TakeoverURL;
var globalconfig bool bUsedForTakeover;
var bool bAvailableForTakeover;
var bool bPrivateServer;
var const transient bool bWorldWasLoadedThisTick;
var const transient bool bCheckForMovieCapture;
var const transient bool bTriggerPostLoadMap;
var const transient bool bStartedLoadMapMovie;
var bool bSaveBenchmarkGraphs;
var const bool bShouldCommitPendingMapChange;
var config bool bClearAnimSetLinkupCachesOnLoadMap;
var config bool bEnableSecondaryDisplay;
var config bool bEnableSecondaryViewport;
var const transient OnlineSubsystem OnlineSubsystem;
var const transient PlayfabInterface PlayfabInterfaceInst;
var const transient GamePadLightbarSubsystem GamePadLightbarSubsystem;
var const transient DownloadableContentEnumerator DLCEnumerator;
var string DownloadableContentEnumeratorClassName;
var const transient DownloadableContentManager DLCManager;
var array<BenchmarkSample> BenchmarkSamples;
var string DownloadableContentManagerClassName;
var const array<name> LevelsToLoadForPendingMapChange;
var const array<Level> LoadedLevelsForPendingMapChange;
var const string PendingMapChangeFailureDescription;
var config float MaxDeltaTime;
var string SecondaryViewportClientClassName;
var init array<init ScriptViewportClient> SecondaryViewportClients;
var init array<init Pointer> SecondaryViewportFrames;
var const config array<config string> IgnoredUsesGUIDPackages;
var const array<LevelStreamingStatus> PendingLevelStreamingStatusUpdates;
var const array<ObjectReferencer> ObjectReferencers;
var array<FullyLoadedPackagesInfo> PackagesToFullyLoad;
var const transient array<NamedNetDriver> NamedNetDrivers;
var config array<config AnimTag> AnimTags;

// Export UGameEngine::execCreateNamedNetDriver(FFrame&, void* const)
native final function bool CreateNamedNetDriver(name NetDriverName);

// Export UGameEngine::execDestroyNamedNetDriver(FFrame&, void* const)
native final function DestroyNamedNetDriver(name NetDriverName);

// Export UGameEngine::execGetOnlineSubsystem(FFrame&, void* const)
native static final function OnlineSubsystem GetOnlineSubsystem();

// Export UGameEngine::execGetPlayfabInterface(FFrame&, void* const)
native static final function PlayfabInterface GetPlayfabInterface();

// Export UGameEngine::execGetDLCEnumerator(FFrame&, void* const)
native static final function DownloadableContentEnumerator GetDLCEnumerator();

// Export UGameEngine::execGetDLCManager(FFrame&, void* const)
native static final function DownloadableContentManager GetDLCManager();

// Export UGameEngine::execHasSecondaryScreenActive(FFrame&, void* const)
native static final function bool HasSecondaryScreenActive();

// Export UGameEngine::execTakeoverServer(FFrame&, void* const)
native function TakeoverServer(string InHostStr, string InUrlStr);

// Export UGameEngine::execGetWebAdminPort(FFrame&, void* const)
native static function int GetWebAdminPort();

// Export UGameEngine::execDisableServerTakeover(FFrame&, void* const)
native final function DisableServerTakeover();

defaultproperties
{
    LastURL=(Protocol="",Host="",Port=0,Map="",Op=none,Portal="",Valid=1)
    LastRemoteURL=(Protocol="",Host="",Port=0,Map="",Op=none,Portal="",Valid=1)
    ServerActors(0)="IpDrv.WebServer"
    bUsedForTakeover=true
}