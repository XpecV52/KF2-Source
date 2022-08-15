//=============================================================================
// KFGameStatsUploader
//=============================================================================
// Processes logs before handing them over to TWOnlineEventsInterface
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Jonathan Howard 140709
//=============================================================================

class KFGameStatsUploader extends GameplayEventsReader
	native(Analytics)
	config(GameStats);

/* References to handlers for event processing */
var KFGameStateObject KFGameState;
var KFGameplayEventsHandlerOnline StatsHandler;
var KFGameStatsAggregatorOnline AggregateHandler;

var string AggregatorClassName;
var bool bLogAnalytics;

/** Index of file in use */
var int StatsFileIndex;
/** Name of file (from originating GameEventsWriter) */
var string FileToUpload;
/** Header for events file after filtering */
var GameplayEventsHeader PayloadHeader;
/** The byte stream for the payload */
var init array<byte> DataPayload;
/** FArchive pointer to the payload */
var const native pointer MemoryArchive{FArchive};

var config bool		bKeepAnalyticsFile;
var config bool		bKeepGameStatsFile;

var config float 	MinMatchDuration;
var config int		MinNumberPlayers;

var config bool		bUploadDedicatedServer;
var config bool		bUploadListenServer;
var config bool		bUploadOfflineGame;

var config bool 	bUploadPerformanceEvents;

/*
 * Implementation
 */
/**
 * Initialize the stats handler for upload the data to the backend
 * @param  Writer the GameEventsWriter that wrote the original file
 */
function Init(KFGameplayEventsWriter Writer)
{
	//`bLogAnalytics = KFGameInfo(class'WorldInfo'.static.GetWorldInfo().gmae).bLogAnalytics;

	if (bLogAnalytics) LogInternal("KFGameStatsUploader: Uploading using class:"@Name,'Analytics');
	if (bLogAnalytics) LogInternal("KFGameStatsUploader: Aggregating using class:"@AggregatorClassName,'Analytics');

	if (AggregatorClassName != "")
	{
		KFGameState 		= new(self) class'KFGameStateObject';
		StatsHandler 		= new(None) class'KFGameplayEventsHandlerOnline';
		AggregateHandler 	= new(None, AggregatorClassName) class'KFGameStatsAggregatorOnline';

		StatsHandler.KFGameState = KFGameState;

		FileToUpload = Writer.GetFilename();
		LogInternal("File to upload:"@FileToUpload);
		StatsFileIndex = Writer.StatsFileIndex;
		Flush(); // Seems to be some Xbox 360 I/O magic
	}
}

//TODO: Determine if this is relevant to other platforms. (PS4/XBone?)
/* More Xbox magic */
native function Flush();
native function bool IsFinishedFlushing();

native function UploadGameplayStats(TWOnlineEventsInterface OnlineInterface);
native protected function SerializePayloadHeader();
native protected function SerializePayloadFooter();

defaultproperties
{
   AggregatorClassName="KFGame.KFGameStatsAggregatorOnline"
   bUploadDedicatedServer=True
   bUploadListenServer=True
   bUploadOfflineGame=True
   bUploadPerformanceEvents=True
   MinMatchDuration=20.000000
   MinNumberPlayers=1
   Name="Default__KFGameStatsUploader"
   ObjectArchetype=GameplayEventsReader'Engine.Default__GameplayEventsReader'
}
