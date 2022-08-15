//=============================================================================
// KFWorkshopSteamworks
//=============================================================================
// Steam workshop downloading functionality for Killing Floor 2
//=============================================================================
// Killing Floor 2
// Copyright (C) 2013 Tripwire Interactive LLC
//  - Joshua Rowan 8/27/2014
//=============================================================================

class KFWorkshopSteamworks extends TWOnlineUGCInterface within OnlineSubsystemCommonImpl
	config(Engine)
	inherits(FTickableObject)
	native;

var config array<string> ServerSubscribedWorkshopItems;

var native array<UniqueNetId> CurrentDownloads;

var const native map{PublishedFileId_t, FString} WorkshopIDItemNames;

var const native map{FString, PublishedFileId_t} PackageWorkshopIDs;

var delegate<UGCDownloadProgressDelegate> ProgressDelegate;

var transient array<UniqueNetId> ServerSubscribedCopy;

var transient bool ServerFilesDirty;

var transient bool NeedsTicking;
var float TickInterval;
var transient float TickTime;

delegate UGCDownloadProgressDelegate(string ItemName, Float PercentComplete, int ItemsRemaining);

function SetUGCDownloadProgressDelegate(delegate<UGCDownloadProgressDelegate> InProgressDelegate)
{
	ProgressDelegate = InProgressDelegate;
	NeedsTicking = true;
}

function ClearUGCDownloadProgressDelegate()
{
	ProgressDelegate = none;
	NeedsTicking = false;

}

native function UniqueNetId GetUGCForPackage(string Package);

native function Initialize();

native function UpdateWorkshopFiles();

native function CheckAllItemsInstalled();

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   TickInterval=1.000000
   Name="Default__KFWorkshopSteamworks"
   ObjectArchetype=TWOnlineUGCInterface'Engine.Default__TWOnlineUGCInterface'
}
