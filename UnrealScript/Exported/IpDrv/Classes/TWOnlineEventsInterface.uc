//=============================================================================
// KFGameStatsUploader
//=============================================================================
// Sends game logs to our backend hosted at AWS
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Jonathan Howard 140717
//=============================================================================

class TWOnlineEventsInterface extends MCPBase
	native
	config(GameStats)
	implements(OnlineEventsInterface);

/**
 * The type of uploading we can do
 */
enum KFEventUploadType
{
	KFU_StatsFile,
	KFU_EventStreaming
};

/** Holds the configuration and instance data for event uploading */
var string KFGameplaySessionID;
struct native KFStatsUploadConfig
{
	/** The type of upload this config is for */
	var const KFEventUploadType UploadType;
	/** The URL to send the data to */
	var const string UploadUrl;
	/** The amount of time to wait before erroring out */
	var const float TimeOut;
	/** Whether to compress the data with LZ4 before sending or not */
	var const bool bUseCompression;
};

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var string URLMap;

var native const array<pointer> KFStatsPostObjects{struct FMCPEventPoster};

/*
 * Config variables
 */
var const config KFStatsUploadConfig EventUploadConfig;


/**
 * Sends the profile data to the server for statistics aggregation
 *
 * @param UniqueId the unique id for the player
 * @param PlayerNick the player's nick name
 * @param ProfileSettings the profile object that is being sent
 * @param PlayerStorage the player storage object that is being sent
 *
 * @return true if the async task was started successfully, false otherwise
 */
function bool UploadPlayerData(UniqueNetId UniqueId,string PlayerNick,OnlineProfileSettings ProfileSettings,OnlinePlayerStorage PlayerStorage)
{
}

/**
 * Sends gameplay event data to MCP
 *
 * @param UniqueId the player that is sending the stats
 * @param Payload the stats data to upload
 *
 * @return true if the async send started ok, false otherwise
 */
private native function bool UploadFinalPayload(const out array<byte> Payload);
function bool UploadGameplayEventsData(UniqueNetId UniqueId,const out array<byte> Payload)
{
	return UploadFinalPayload(Payload);
}

/**
 * Sends the network backend the playlist population for this host
 *
 * @param PlaylistId the playlist we are updating the population for
 * @param NumPlayers the number of players on this host in this playlist
 *
 * @return true if the async send started ok, false otherwise
 */
function bool UpdatePlaylistPopulation(int PlaylistId,int NumPlayers)
{
}

defaultproperties
{
   EventUploadConfig=(UploadUrl="http://tw-analytics-collector-testing.s3.amazonaws.com/",TimeOut=120.000000)
   Name="Default__TWOnlineEventsInterface"
   ObjectArchetype=MCPBase'IpDrv.Default__MCPBase'
}
