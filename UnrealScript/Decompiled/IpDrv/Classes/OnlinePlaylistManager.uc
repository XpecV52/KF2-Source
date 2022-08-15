/*******************************************************************************
 * OnlinePlaylistManager generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class OnlinePlaylistManager extends Object
    native
    config(Playlist);

const PLAYER_MATCH = 0;
const RANKED_MATCH = 1;
const REC_MATCH = 2;
const PRIVATE_MATCH = 3;

struct native ConfiguredGameSetting
{
    var int GameSettingId;
    var string GameSettingsClassName;
    var string URL;
    var transient OnlineGameSettings GameSettings;

    structdefaultproperties
    {
        GameSettingId=0
        GameSettingsClassName=""
        URL=""
        GameSettings=none
    }
};

struct native InventorySwap
{
    var name Original;
    var string SwapTo;

    structdefaultproperties
    {
        Original=None
        SwapTo=""
    }
};

struct native Playlist
{
    var array<ConfiguredGameSetting> ConfiguredGames;
    var int PlaylistId;
    var int LoadBalanceId;
    var string LocalizationString;
    var array<int> ContentIds;
    var int TeamSize;
    var int TeamCount;
    var int MaxPartySize;
    var string Name;
    var string URL;
    var int MatchType;
    var bool bDisableDedicatedServerSearches;
    var array<name> MapCycle;
    var array<InventorySwap> InventorySwaps;

    structdefaultproperties
    {
        ConfiguredGames=none
        PlaylistId=0
        LoadBalanceId=0
        LocalizationString=""
        ContentIds=none
        TeamSize=0
        TeamCount=0
        MaxPartySize=0
        Name=""
        URL=""
        MatchType=0
        bDisableDedicatedServerSearches=false
        MapCycle=none
        InventorySwaps=none
    }
};

struct native PlaylistPopulation
{
    var int PlaylistId;
    var int WorldwideTotal;
    var int RegionTotal;

    structdefaultproperties
    {
        PlaylistId=0
        WorldwideTotal=0
        RegionTotal=0
    }
};

var private native const noexport Pointer VfTable_FTickableObject;
var config array<config Playlist> Playlists;
var array<string> PlaylistFileNames;
var config array<config name> DatastoresToRefresh;
var int DownloadCount;
var int SuccessfulCount;
var config int VersionNumber;
var config array<config PlaylistPopulation> PopulationData;
var int WorldwideTotalPlayers;
var int RegionTotalPlayers;
var transient OnlineTitleFileInterface TitleFileInterface;
var string PopulationFileName;
var transient float NextPlaylistPopulationUpdateTime;
var config float PlaylistPopulationUpdateInterval;
var config int MinPlaylistIdToReport;
var transient int CurrentPlaylistId;
var config name EventsInterfaceName;
var config int DataCenterId;
var string DataCenterFileName;
var transient float LastPlaylistDownloadTime;
var config float PlaylistRefreshInterval;
var delegate<OnReadPlaylistComplete> __OnReadPlaylistComplete__Delegate;
var delegate<OnPlaylistPopulationDataUpdated> __OnPlaylistPopulationDataUpdated__Delegate;

delegate OnReadPlaylistComplete(bool bWasSuccessful);

function DownloadPlaylist()
{
    local OnlineSubsystem OnlineSub;
    local int FileIndex;

    if(ShouldRefreshPlaylists())
    {
        Reset();
    }
    if(SuccessfulCount == 0)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        if((OnlineSub != none) && OnlineSub.Patcher != none)
        {
            OnlineSub.Patcher.AddReadFileDelegate(OnReadTitleFileComplete);
            DownloadCount = 0;
            SuccessfulCount = 0;
            if(PlaylistFileNames.Length == 0)
            {
                DetermineFilesToDownload();
            }
            FileIndex = 0;
            J0x104:

            if(FileIndex < PlaylistFileNames.Length)
            {
                OnlineSub.Patcher.AddFileToDownload(PlaylistFileNames[FileIndex]);
                ++ FileIndex;
                goto J0x104;
            }
            if(LastPlaylistDownloadTime == float(0))
            {
                if(Class'WorldInfo'.static.GetWorldInfo().NetMode != NM_DedicatedServer)
                {
                    ReadDataCenterId();
                }
                NextPlaylistPopulationUpdateTime = PlaylistPopulationUpdateInterval;
            }            
        }
        else
        {
            LogInternal("No online layer present, using defaults for playlist", 'DevMCP');
            FinalizePlaylistObjects();
            OnReadPlaylistComplete(true);
        }        
    }
    else
    {
        OnReadPlaylistComplete(SuccessfulCount == DownloadCount);
    }
}

// Export UOnlinePlaylistManager::execDetermineFilesToDownload(FFrame&, void* const)
native function DetermineFilesToDownload();

// Export UOnlinePlaylistManager::execShouldRefreshPlaylists(FFrame&, void* const)
native function bool ShouldRefreshPlaylists();

function OnReadTitleFileComplete(bool bWasSuccessful, string Filename)
{
    local OnlineSubsystem OnlineSub;
    local int FileIndex;

    FileIndex = 0;
    J0x0B:

    if(FileIndex < PlaylistFileNames.Length)
    {
        if(PlaylistFileNames[FileIndex] == Filename)
        {
            ++ DownloadCount;
            SuccessfulCount += int(bWasSuccessful);
            if(DownloadCount == PlaylistFileNames.Length)
            {
                if(SuccessfulCount != DownloadCount)
                {
                    LogInternal("PlaylistManager: not all files downloaded correctly, using defaults where applicable", 'DevMCP');
                }
                FinalizePlaylistObjects();
                OnReadPlaylistComplete(SuccessfulCount == DownloadCount);
                OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
                if((OnlineSub != none) && OnlineSub.Patcher != none)
                {
                    OnlineSub.Patcher.ClearReadFileDelegate(OnReadTitleFileComplete);
                }
            }
        }
        ++ FileIndex;
        goto J0x0B;
    }
}

// Export UOnlinePlaylistManager::execFinalizePlaylistObjects(FFrame&, void* const)
native function FinalizePlaylistObjects();

function OnlineGameSettings GetGameSettings(int PlaylistId, int GameSettingsId)
{
    local int PlaylistIndex, GameIndex;

    PlaylistIndex = Playlists.Find('PlaylistId', PlaylistId;
    if(PlaylistIndex != -1)
    {
        GameIndex = 0;
        J0x47:

        if(GameIndex < Playlists[PlaylistIndex].ConfiguredGames.Length)
        {
            if(Playlists[PlaylistIndex].ConfiguredGames[GameIndex].GameSettingId == GameSettingsId)
            {
                return Playlists[PlaylistIndex].ConfiguredGames[GameIndex].GameSettings;
            }
            ++ GameIndex;
            goto J0x47;
        }
    }
    return none;
}

function bool HasAnyGameSettings(int PlaylistId)
{
    local int PlaylistIndex, GameIndex;

    PlaylistIndex = Playlists.Find('PlaylistId', PlaylistId;
    if(PlaylistIndex != -1)
    {
        GameIndex = 0;
        J0x47:

        if(GameIndex < Playlists[PlaylistIndex].ConfiguredGames.Length)
        {
            if(Playlists[PlaylistIndex].ConfiguredGames[GameIndex].GameSettings != none)
            {
                return true;
            }
            ++ GameIndex;
            goto J0x47;
        }
    }
    return false;
}

function bool PlaylistSupportsDedicatedServers(int PlaylistId)
{
    local int PlaylistIndex;

    PlaylistIndex = Playlists.Find('PlaylistId', PlaylistId;
    if(PlaylistIndex != -1)
    {
        return !Playlists[PlaylistIndex].bDisableDedicatedServerSearches;
    }
    return false;
}

function GetTeamInfoFromPlaylist(int PlaylistId, out int TeamSize, out int TeamCount, out int MaxPartySize)
{
    local int PlaylistIndex;

    TeamSize = 0;
    TeamCount = 0;
    PlaylistIndex = Playlists.Find('PlaylistId', PlaylistId;
    if(PlaylistIndex != -1)
    {
        TeamSize = Playlists[PlaylistIndex].TeamSize;
        TeamCount = Playlists[PlaylistIndex].TeamCount;
        MaxPartySize = Playlists[PlaylistIndex].MaxPartySize;
        if(MaxPartySize == 0)
        {
            MaxPartySize = TeamSize;
        }
    }
}

function GetLoadBalanceIdFromPlaylist(int PlaylistId, out int LoadBalanceId)
{
    local int PlaylistIndex;

    LoadBalanceId = 0;
    PlaylistIndex = Playlists.Find('PlaylistId', PlaylistId;
    if(PlaylistIndex != -1)
    {
        LoadBalanceId = Playlists[PlaylistIndex].LoadBalanceId;
    }
}

function bool IsPlaylistArbitrated(int PlaylistId)
{
    local int PlaylistIndex;

    PlaylistIndex = Playlists.Find('PlaylistId', PlaylistId;
    if(PlaylistIndex != -1)
    {
        return Playlists[PlaylistIndex].MatchType == 1;
    }
    return false;
}

function int GetMatchType(int PlaylistId)
{
    local int PlaylistIndex;

    PlaylistIndex = Playlists.Find('PlaylistId', PlaylistId;
    if(PlaylistIndex != -1)
    {
        return Playlists[PlaylistIndex].MatchType;
    }
    return -1;
}

function string GetUrlFromPlaylist(int PlaylistId)
{
    local int PlaylistIndex;

    PlaylistIndex = Playlists.Find('PlaylistId', PlaylistId;
    if(PlaylistIndex != -1)
    {
        return Playlists[PlaylistIndex].URL;
    }
    return "";
}

function GetMapCycleFromPlaylist(int PlaylistId, out array<name> MapCycle)
{
    local int PlaylistIndex;

    PlaylistIndex = Playlists.Find('PlaylistId', PlaylistId;
    if(PlaylistIndex != -1)
    {
        if(Playlists[PlaylistIndex].MapCycle.Length > 0)
        {
            MapCycle = Playlists[PlaylistIndex].MapCycle;
        }
    }
}

function class<Inventory> GetInventorySwapFromPlaylist(int PlaylistId, class<Inventory> SourceInventory)
{
    local int PlaylistIndex, SwapIndex;

    PlaylistIndex = Playlists.Find('PlaylistId', PlaylistId;
    if(PlaylistIndex != -1)
    {
        SwapIndex = Playlists[PlaylistIndex].InventorySwaps.Find('Original', SourceInventory.Name;
        if(SwapIndex != -1)
        {
            return class<Inventory>(DynamicLoadObject(Playlists[PlaylistIndex].InventorySwaps[SwapIndex].SwapTo, Class'Class'));
        }
    }
    return SourceInventory;
}

function GetContentIdsFromPlaylist(int PlaylistId, out array<int> ContentIds)
{
    local int PlaylistIndex;

    PlaylistIndex = Playlists.Find('PlaylistId', PlaylistId;
    if(PlaylistIndex != -1)
    {
        ContentIds = Playlists[PlaylistIndex].ContentIds;
    }
}

function Reset()
{
    local OnlineSubsystem OnlineSub;

    DownloadCount = 0;
    SuccessfulCount = 0;
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if((OnlineSub != none) && OnlineSub.Patcher != none)
    {
        OnlineSub.Patcher.ClearCachedFiles();
    }
}

function ReadPlaylistPopulation()
{
    local OnlineSubsystem OnlineSub;

    if(EqualEqual_InterfaceInterface(TitleFileInterface, (none)))
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        if(OnlineSub != none)
        {
            TitleFileInterface = OnlineSub.TitleFileInterface;
        }
    }
    if(NotEqual_InterfaceInterface(TitleFileInterface, (none)))
    {
        TitleFileInterface.ClearDownloadedFile(PopulationFileName);
        TitleFileInterface.AddReadTitleFileCompleteDelegate(OnReadPlaylistPopulationComplete);
        TitleFileInterface.ReadTitleFile(PopulationFileName);        
    }
    else
    {
        WarnInternal("Cannot download playlist population due to missing TitleFileInterface object");
    }
}

function OnReadPlaylistPopulationComplete(bool bWasSuccessful, string Filename)
{
    local array<byte> FileData;

    if(Filename == PopulationFileName)
    {
        if(bWasSuccessful)
        {
            if(TitleFileInterface.GetTitleFileContents(Filename, FileData))
            {
                ParsePlaylistPopulationData(FileData);
            }            
        }
        else
        {
            LogInternal(("Failed to download the file (" $ Filename) $ ") from TitleFileInterface", 'DevMCP');
        }
        OnPlaylistPopulationDataUpdated();
    }
}

delegate OnPlaylistPopulationDataUpdated();

// Export UOnlinePlaylistManager::execParsePlaylistPopulationData(FFrame&, void* const)
native function ParsePlaylistPopulationData(const out array<byte> Data);

function GetPopulationInfoFromPlaylist(int PlaylistId, out int WorldwideTotal, out int RegionTotal)
{
    local int PlaylistIndex;

    WorldwideTotal = 0;
    RegionTotal = 0;
    PlaylistIndex = PopulationData.Find('PlaylistId', PlaylistId;
    if(PlaylistIndex != -1)
    {
        WorldwideTotal = PopulationData[PlaylistIndex].WorldwideTotal;
        RegionTotal = PopulationData[PlaylistIndex].RegionTotal;
    }
}

event SendPlaylistPopulationUpdate(int NumPlayers)
{
    local OnlineEventsInterface EventsInterface;
    local OnlineSubsystem OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if(OnlineSub != none)
    {
        EventsInterface = OnlineEventsInterface(OnlineSub.GetNamedInterface(EventsInterfaceName));
        if(NotEqual_InterfaceInterface(EventsInterface, (none)))
        {
            LogInternal((("Updating playlist population with PlaylistId=" $ string(CurrentPlaylistId)) $ " and NumPlayers=") $ string(NumPlayers), 'DevMCP');
            EventsInterface.UpdatePlaylistPopulation(CurrentPlaylistId, NumPlayers);
        }
    }
}

function ReadDataCenterId()
{
    local OnlineSubsystem OnlineSub;

    if(EqualEqual_InterfaceInterface(TitleFileInterface, (none)))
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        if(OnlineSub != none)
        {
            TitleFileInterface = OnlineSub.TitleFileInterface;
        }
    }
    if(NotEqual_InterfaceInterface(TitleFileInterface, (none)))
    {
        TitleFileInterface.AddReadTitleFileCompleteDelegate(OnReadDataCenterIdComplete);
        TitleFileInterface.ReadTitleFile(DataCenterFileName);        
    }
    else
    {
        WarnInternal("Cannot download datacenter id due to missing TitleFileInterface object");
    }
}

function OnReadDataCenterIdComplete(bool bWasSuccessful, string Filename)
{
    local array<byte> FileData;

    if(bWasSuccessful)
    {
        if(Filename == DataCenterFileName)
        {
            if(TitleFileInterface.GetTitleFileContents(Filename, FileData))
            {
                ParseDataCenterId(FileData);
            }
        }        
    }
    else
    {
        LogInternal(("Failed to download the file (" $ Filename) $ ") from TitleFileInterface", 'DevMCP');
    }
}

// Export UOnlinePlaylistManager::execParseDataCenterId(FFrame&, void* const)
native function ParseDataCenterId(const out array<byte> Data);

defaultproperties
{
    PopulationFileName="PlaylistPopulationData.ini"
    DataCenterFileName="DataCenter.Id"
}