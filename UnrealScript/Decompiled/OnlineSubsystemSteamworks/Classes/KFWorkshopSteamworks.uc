/*******************************************************************************
 * KFWorkshopSteamworks generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWorkshopSteamworks extends TWOnlineUGCInterface within OnlineSubsystemCommonImpl
    native
    config(Engine);

var private native const noexport Pointer VfTable_FTickableObject;
var config array<config string> ServerSubscribedWorkshopItems;
var native array<UniqueNetId> CurrentDownloads;
var native const map<0, 0> WorkshopIDItemNames;
var native const map<0, 0> PackageWorkshopIDs;
var native const map<0, 0> InstallTimestamps;
var delegate<UGCDownloadProgressDelegate> ProgressDelegate;
var transient array<UniqueNetId> ServerSubscribedCopy;
var transient bool ServerFilesDirty;
var transient bool NeedsTicking;
var float TickInterval;
var transient float TickTime;
var native transient Pointer WorkshopDownloader;
var delegate<UGCDownloadProgressDelegate> __UGCDownloadProgressDelegate__Delegate;

delegate UGCDownloadProgressDelegate(string ItemName, float PercentComplete, int ItemsRemaining);

function SetUGCDownloadProgressDelegate(delegate<UGCDownloadProgressDelegate> InProgressDelegate)
{
    ProgressDelegate = InProgressDelegate;
    NeedsTicking = true;
}

function ClearUGCDownloadProgressDelegate()
{
    ProgressDelegate = None;
    NeedsTicking = false;
}

// Export UKFWorkshopSteamworks::execGetUGCForPackage(FFrame&, void* const)
native function UniqueNetId GetUGCForPackage(string Package);

// Export UKFWorkshopSteamworks::execInitialize(FFrame&, void* const)
native function Initialize();

// Export UKFWorkshopSteamworks::execUpdateWorkshopFiles(FFrame&, void* const)
native function UpdateWorkshopFiles();

// Export UKFWorkshopSteamworks::execInstallAllItems(FFrame&, void* const)
native function InstallAllItems();

defaultproperties
{
    TickInterval=1
}