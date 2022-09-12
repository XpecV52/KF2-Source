/*******************************************************************************
 * KFGameEngine generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGameEngine extends GameEngine
    transient
    native
    config(Game);

enum SupportedPlatform
{
    PLATFORM_PC_DX11,
    PLATFORM_PC_DX10,
    PLATFORM_PC_MAX
};

enum SeasonalEventIndex
{
    SEI_None,
    SEI_Spring,
    SEI_Summer,
    SEI_Fall,
    SEI_Winter,
    SEI_MAX
};

enum EConnectionError
{
    CE_None,
    CE_Generic,
    CE_WrongPassword,
    CE_NeedPassword,
    CE_MAX
};

var int LastFocusedGameStateID;
var Font KFCanvasFont;
var float KFFontScale;
var bool bReadingPlayfabStoreData;
var bool bMusicVocalsEnabled;
var bool bMinimalChatter;
var config bool bShowWelderInInv;
var config bool bUseAltAimOnDual;
var config bool bAntiMotionSickness;
var private config bool bShowCrossHair;
var private bool bShowCrossHairConsole;
var config bool bMuteOnLossOfFocus;
var config bool bEnableNative4k;
var config bool bEnableAdvDebugLines;
var private const int SeasonalEventId;
var private const int LoadedSeasonalEventId;
var private int WeeklyEventIndex;
var init array<init Object> CachedRootPackages;
var float DefaultGammaMult;
var float MusicVolumeMultiplier;
var float SFxVolumeMultiplier;
var float DialogVolumeMultiplier;
var float MasterVolumeMultiplier;
var float PadVolumeMultiplier;
var float VOIPVolumeMultiplier;
var float VoipMicVolumeMultiplier;
var float GammaMultiplier;
var config float FOVOptionsPercentageValue;
var array<OnlineStatsRow> CachedStatRows;
var transient delegate<HandshakeCompleteCallback> OnHandshakeComplete;
var KFGameEngine.EConnectionError LastConnectionError;
var Engine.OnlineSubsystem.ELoginStatus LocalLoginStatus;
var string ConsoleGameSessionGuid;
var OnlineGameSettings GameSettingsForPendingInvite;
var string ReturnToIISConnectionErrorTitle;
var string ReturnToIISConnectionErrorMessage;
/** List of categories to filter */
var(Debug) config array<config name> AILogFilter;
var private transient KFDebugLines KFDebugLines;
var delegate<HandshakeCompleteCallback> __HandshakeCompleteCallback__Delegate;

// Export UKFGameEngine::execCacheToRoot(FFrame&, void* const)
native static function CacheToRoot(Object NewPackage);

// Export UKFGameEngine::execClearCachedRootPackages(FFrame&, void* const)
native static function ClearCachedRootPackages();

// Export UKFGameEngine::execCheckSkipLobby(FFrame&, void* const)
native static function bool CheckSkipLobby();

// Export UKFGameEngine::execCheckSkipGammaCheck(FFrame&, void* const)
native static function bool CheckSkipGammaCheck();

// Export UKFGameEngine::execCheckNoAutoStart(FFrame&, void* const)
native static function bool CheckNoAutoStart();

// Export UKFGameEngine::execCheckNoMusic(FFrame&, void* const)
native static function bool CheckNoMusic();

// Export UKFGameEngine::execCheckNoRandomStart(FFrame&, void* const)
native static function bool CheckNoRandomStart();

// Export UKFGameEngine::execGetClassCountAndSize(FFrame&, void* const)
native static function GetClassCountAndSize(out int ClassCount, out float ClassSize, out float ResourceSize, Class LoadedClass);

// Export UKFGameEngine::execGetDebugLines(FFrame&, void* const)
native static function KFDebugLines GetDebugLines();

// Export UKFGameEngine::execGetGameVersion(FFrame&, void* const)
native static function int GetGameVersion();

// Export UKFGameEngine::execGetKFGameVersion(FFrame&, void* const)
native static function int GetKFGameVersion();

// Export UKFGameEngine::execGetAppID(FFrame&, void* const)
native static function int GetAppID();

// Export UKFGameEngine::execGetPlatform(FFrame&, void* const)
native static function KFGameEngine.SupportedPlatform GetPlatform();

// Export UKFGameEngine::execInitEventContent(FFrame&, void* const)
native static function InitEventContent();

// Export UKFGameEngine::execRefreshEventContent(FFrame&, void* const)
native static function RefreshEventContent();

// Export UKFGameEngine::execRefreshOnlineGameData(FFrame&, void* const)
native static function RefreshOnlineGameData(optional bool RefreshTimeEvent)
{
    RefreshTimeEvent = true;            
}

// Export UKFGameEngine::execApplyTweaks(FFrame&, void* const)
native static function ApplyTweaks(string MapName);

// Export UKFGameEngine::execIsLastRefreshTweakParamsSuccessful(FFrame&, void* const)
native static function bool IsLastRefreshTweakParamsSuccessful();

// Export UKFGameEngine::execIsSoloPlayDisabled(FFrame&, void* const)
native static function bool IsSoloPlayDisabled();

// Export UKFGameEngine::execIsFreeConsolePlayOver(FFrame&, void* const)
native static function bool IsFreeConsolePlayOver();

function ReadPFStoreData()
{
    bReadingPlayfabStoreData = true;
    GetPlayfabInterface().AddStoreDataReadCompleteDelegate(OnPlayfabStoreReadComplete);
    GetPlayfabInterface().ReadStoreData();
}

function OnPlayfabStoreReadComplete(bool bSuccessful)
{
    GetPlayfabInterface().ClearStoreDataReadCompleteDelegate(OnPlayfabStoreReadComplete);
    if(bSuccessful)
    {
        if(Class'WorldInfo'.static.IsConsoleBuild(9))
        {
            OnlineSubsystem.MarketplaceInterface.ResetAvailableProducts(byte(GamePlayers[0].ControllerId), 3);
            OnlineSubsystem.MarketplaceInterface.ResetAvailableProducts(byte(GamePlayers[0].ControllerId), 4);
            OnlineSubsystem.MarketplaceInterface.AddReadAvailableProductsCompleteDelegate(byte(GamePlayers[0].ControllerId), OnReadAvailableProductsComplete);
            OnlineSubsystem.MarketplaceInterface.ReadAvailableProducts(byte(GamePlayers[0].ControllerId), "", 1, 3);            
        }
        else
        {
            OnlineSubsystem.PlayerInterfaceEx.AddStoreDataReadCompleteDelegate(OnStoreDataRead);
            OnlineSubsystem.PlayerInterfaceEx.ReadStoreData();
        }
    }
}

function OnReadAvailableProductsComplete(Engine.OnlineSubsystem.EMediaItemType MediaType)
{
    LogInternal("Read products for store items of type" @ string(MediaType));
    if(MediaType == 3)
    {
        OnlineSubsystem.MarketplaceInterface.ReadAvailableProducts(byte(GamePlayers[0].ControllerId), "", 1, 4);        
    }
    else
    {
        OnlineSubsystem.MarketplaceInterface.ClearReadAvailableProductsCompleteDelegate(byte(GamePlayers[0].ControllerId), OnReadAvailableProductsComplete);
        OnlineSubsystem.MarketplaceInterface.AddReadAdditionalProductDetailsCompleteDelegate(byte(GamePlayers[0].ControllerId), OnReadAdditionalProductDetailsComplete);
        OnlineSubsystem.MarketplaceInterface.ReadAdditionalDetailsForProducts(byte(GamePlayers[0].ControllerId), 3);
    }
}

function OnReadAdditionalProductDetailsComplete(Engine.OnlineSubsystem.EMediaItemType MediaType)
{
    LogInternal("Additional info for products read complete for type" @ string(MediaType));
    if(MediaType == 3)
    {
        OnlineSubsystem.MarketplaceInterface.ReadAdditionalDetailsForProducts(byte(GamePlayers[0].ControllerId), 4);        
    }
    else
    {
        OnlineSubsystem.MarketplaceInterface.ClearReadAdditionalProductDetailsCompleteDelegate(byte(GamePlayers[0].ControllerId), OnReadAdditionalProductDetailsComplete);
        OnlineSubsystem.MarketplaceInterface.AddReadInventoryItemsCompleteDelegate(byte(GamePlayers[0].ControllerId), OnReadInventoryItemsComplete);
        OnlineSubsystem.MarketplaceInterface.ResetInventoryItems(byte(GamePlayers[0].ControllerId), 6);
        OnlineSubsystem.MarketplaceInterface.ReadInventoryItems(byte(GamePlayers[0].ControllerId), 6);
    }
}

function OnReadInventoryItemsComplete(Engine.OnlineSubsystem.EMediaItemType MediaType)
{
    LogInternal("Inventory items read for" @ string(MediaType));
    OnlineSubsystem.MarketplaceInterface.ClearReadInventoryItemsCompleteDelegate(byte(GamePlayers[0].ControllerId), OnReadInventoryItemsComplete);
    OnStoreDataRead(true);
}

function OnStoreDataRead(bool bSuccessful)
{
    OnlineSubsystem.PlayerInterfaceEx.ClearStoreDataReadCompleteDelegate(OnStoreDataRead);
    GetPlayfabInterface().AddInventoryReadCompleteDelegate(OnPlayfabInventoryReadComplete);
    GetPlayfabInterface().ReadInventory();
}

function OnPlayfabInventoryReadComplete(bool bSuccessful)
{
    bReadingPlayfabStoreData = false;
    GetPlayfabInterface().ClearInventoryReadCompleteDelegate(OnPlayfabInventoryReadComplete);
    OnlineSubsystem.ClearNewlyAdded();
}

function OnLinkStatusChange(bool bIsConnected)
{
    OnConnectionStatusChanged(((bIsConnected) ? 1 : 2));
}

function OnConnectionStatusChanged(Engine.OnlineSubsystem.EOnlineServerConnectionStatus ConnectionStatus)
{
    local KFGameViewportClient GVC;

    if((GamePlayers[0].Actor != none) && KFPlayerController(GamePlayers[0].Actor) != none)
    {
        KFPlayerController(GamePlayers[0].Actor).HandleConnectionStatusChange(ConnectionStatus);        
    }
    else
    {
        GetOnlineSubsystem().GameInterface.DestroyOnlineGame('Game');
        GVC = KFGameViewportClient(Class'GameEngine'.static.GetEngine().GameViewport);
        GVC.bNeedDisconnectMessage = true;        
        GVC.ConsoleCommand("open KFMainMenu");
    }
}

function OnLoginChange(byte LocalUserNum)
{
    local OnlinePlayerInterface PlayerInterface;

    PlayerInterface = GetOnlineSubsystem().PlayerInterface;
    if(Class'WorldInfo'.static.IsConsoleBuild(9) && KFGameViewportClient(GameViewport).bSeenIIS || (KFPlayerController(GamePlayers[0].Actor) != none) && KFPlayerController(GamePlayers[0].Actor).HasActiveUserEstablished())
    {
        if((LocalUserNum == GamePlayers[0].ControllerId) && PlayerInterface.GetLoginStatus(LocalUserNum) != 2)
        {
            KickBackToIIS("LoggedOutTitle", "LoggedOutMessage");            
        }
        else
        {
            if((LocalLoginStatus == 1) && PlayerInterface.GetLoginStatus(LocalUserNum) == 2)
            {
                KickBackToIIS("LoggedInTitle", "LoggedOutMessage");
            }
        }
    }
}

function OnLoginStatusChanged(Engine.OnlineSubsystem.ELoginStatus NewStatus, UniqueNetId NewId)
{
    local KFGameViewportClient GVC;
    local UniqueNetId ZeroId, LocalPlayerId;

    LocalPlayerId = GamePlayers[0].GetUniqueNetId();
    if(LocalPlayerId == NewId && NewId != ZeroId)
    {
        if((GamePlayers[0].Actor != none) && KFPlayerController(GamePlayers[0].Actor) != none)
        {
            KFPlayerController(GamePlayers[0].Actor).HandleLoginStatusChange(NewStatus == 2);            
        }
        else
        {
            if(NewStatus == 0)
            {
                GetOnlineSubsystem().GameInterface.DestroyOnlineGame('Game');
                GVC = KFGameViewportClient(GameViewport);
                GVC.bNeedSignoutMessage = true;                
                GVC.ConsoleCommand("open KFMainMenu");
            }
        }
    }
}

function KickBackToIIS(string ErrorTitleKey, string ErrorMessageKey)
{
    ReturnToIISConnectionErrorTitle = Localize("Notifications", ErrorTitleKey, "KFGameConsole");
    ReturnToIISConnectionErrorMessage = Localize("Notifications", ErrorMessageKey, "KFGameConsole");
    PerformLogout();
}

function PerformLogout()
{
    local UIDataStore_OnlinePlayerData PlayerDataDS;

    OnlineSubsystem.PlayerInterface.Logout(byte(GamePlayers[0].ControllerId));
    if(PlayfabInterfaceInst != none)
    {
        PlayfabInterfaceInst.Logout();
    }
    OnlineSubsystem.PlayerInterface.Logout(byte(GamePlayers[0].ControllerId));
    PlayerDataDS = UIDataStore_OnlinePlayerData(Class'UIInteraction'.static.GetDataStoreClient().FindDataStore('OnlinePlayerData', GamePlayers[0]));
    PlayerDataDS.ProfileProvider.Profile.AsyncState = 0;
    KFGameViewportClient(GameViewport).bSeenIIS = false;
    OnlineSubsystem.GameInterface.DestroyOnlineGame('Game');
    if((GamePlayers[0].Actor != none) && KFPlayerController(GamePlayers[0].Actor) != none)
    {
        KFPlayerController(GamePlayers[0].Actor).PerformLogout();        
    }
    else
    {        
        GameViewport.ConsoleCommand("open KFMainMenu");
    }
}

function RegisterOnlineDelegates()
{
    local int I;

    OnlineSubsystem.SystemInterface.AddConnectionStatusChangeDelegate(OnConnectionStatusChanged);
    I = 0;
    J0x51:

    if(I < 24)
    {
        OnlineSubsystem.PlayerInterface.AddLoginStatusChangeDelegate(OnLoginStatusChanged, byte(I));
        ++ I;
        goto J0x51;
    }
    OnlineSubsystem.PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
}

function ClearOnlineDelegates()
{
    local int I;

    OnlineSubsystem.SystemInterface.ClearConnectionStatusChangeDelegate(OnConnectionStatusChanged);
    I = 0;
    J0x51:

    if(I < 24)
    {
        OnlineSubsystem.PlayerInterface.ClearLoginStatusChangeDelegate(OnLoginStatusChanged, byte(I));
        ++ I;
        goto J0x51;
    }
    OnlineSubsystem.PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
}

// Export UKFGameEngine::execGetSeasonalEventID(FFrame&, void* const)
native static function int GetSeasonalEventID();

// Export UKFGameEngine::execGetWeeklyEventIndex(FFrame&, void* const)
native static function int GetWeeklyEventIndex();

// Export UKFGameEngine::execIsSalesEventActive(FFrame&, void* const)
native static function bool IsSalesEventActive();

// Export UKFGameEngine::execIsSalesEventChecked(FFrame&, void* const)
native static function bool IsSalesEventChecked();

// Export UKFGameEngine::execInitAudioOptions(FFrame&, void* const)
native static function InitAudioOptions();

// Export UKFGameEngine::execInitGamma(FFrame&, void* const)
native static function InitGamma();

// Export UKFGameEngine::execSetWWiseSFXVolume(FFrame&, void* const)
native static function SetWWiseSFXVolume(float Volume);

// Export UKFGameEngine::execSetWWiseMusicVolume(FFrame&, void* const)
native static function SetWWiseMusicVolume(float Volume);

// Export UKFGameEngine::execSetWWiseVoiceVolume(FFrame&, void* const)
native static function SetWWiseVoiceVolume(float Volume);

// Export UKFGameEngine::execSetWWiseMasterVolume(FFrame&, void* const)
native static function SetWWiseMasterVolume(float Volume);

// Export UKFGameEngine::execSetWWisePADVolume(FFrame&, void* const)
native static function SetWWisePADVolume(float Volume);

// Export UKFGameEngine::execSetVoIPRecieveVolume(FFrame&, void* const)
native static function SetVoIPRecieveVolume(float Volume);

// Export UKFGameEngine::execSetVoIPMicRecieveVolume(FFrame&, void* const)
native static function SetVoIPMicRecieveVolume(float Volume);

// Export UKFGameEngine::execGetVoIPVolumeRange(FFrame&, void* const)
native static function GetVoIPVolumeRange(out float MinVol, out float MaxVol, out float CurrentVol);

// Export UKFGameEngine::execPlayFullScreenMovie(FFrame&, void* const)
native static function PlayFullScreenMovie(string MovieName);

// Export UKFGameEngine::execIsFullScreenMoviePlaying(FFrame&, void* const)
native static function bool IsFullScreenMoviePlaying();

// Export UKFGameEngine::execSetGamma(FFrame&, void* const)
native static function SetGamma(float InGammaMultiplier);

// Export UKFGameEngine::execSetNative4k(FFrame&, void* const)
native static function SetNative4k(bool InEnableNative4k);

// Export UKFGameEngine::execSwitchNative4k(FFrame&, void* const)
native static function SwitchNative4k();

static function KFGameEngine.EConnectionError GetConnectionErrorForMessage(out string Message, out string Title)
{
    if(Message == "<Strings:Engine.AccessControl.NeedPassword>")
    {
        return 3;
    }
    if(Message == "<Strings:Engine.AccessControl.WrongPassword>")
    {
        return 2;
    }
    return 1;
}

function SetLastConnectionError(string Message, string Title)
{
    if(LastConnectionError == 0)
    {
        LastConnectionError = GetConnectionErrorForMessage(Message, Title);
    }
}

delegate bool HandshakeCompleteCallback(bool bSuccess, string Error, out int SuppressPasswordRetry);

event bool CheckHandshakeComplete(Engine.PlayerController.EProgressMessageType MessageType, string Title, out int SuppressPasswordRetry, out int Cleanup)
{
    local bool SuppressPopup;

    SuppressPopup = false;
    Cleanup = 0;
    if(OnHandshakeComplete != none)
    {
        switch(MessageType)
        {
            case 4:
            case 5:
            case 6:
            case 7:
                Cleanup = 1;
                SuppressPopup = HandshakeCompleteCallback(false, Title, SuppressPasswordRetry);
                break;
            case 1:
                if(Title == "HandshakeDone")
                {
                    SuppressPopup = HandshakeCompleteCallback(true, Title, SuppressPasswordRetry);
                }
                break;
            default:
                break;
        }
    }
    else
    {
        return SuppressPopup;
    }
}

// Export UKFGameEngine::execCancelPendingLevel(FFrame&, void* const)
native static function CancelPendingLevel();

function bool IsLockedServer()
{
    return bUsedForTakeover && !bAvailableForTakeover;
}

function UnlockServer()
{
    local UniqueNetId NullId;

    if(Class'WorldInfo'.static.GetWorldInfo().NetMode == NM_DedicatedServer)
    {
    }
    if(bUsedForTakeover)
    {
        LogInternal("***The server is now unlocked and available for takeover!");
        ConsoleGameSessionGuid = "";
        KFGameReplicationInfo(Class'WorldInfo'.static.GetWorldInfo().GRI).ConsoleGameSessionHost = NullId;
        bAvailableForTakeover = true;
        bPrivateServer = false;
    }
}

// Export UKFGameEngine::execKillPendingServerConnection(FFrame&, void* const)
native function KillPendingServerConnection();

// Export UKFGameEngine::execFastTrace_PhysX(FFrame&, void* const)
native static function bool FastTrace_PhysX(Vector TraceEnd, Vector TraceStart);

static function Font GetKFCanvasFont()
{
    return default.KFCanvasFont;
}

static function float GetKFFontScale()
{
    return default.KFFontScale;
}

static function bool IsCrosshairEnabled()
{
    return default.bShowCrossHair;
}

static function SetCrosshairEnabled(bool bEnable)
{
    default.bShowCrossHair = bEnable;
    if(!Class'WorldInfo'.static.IsConsoleBuild())
    {
        StaticSaveConfig();
    }
}

defaultproperties
{
    KFCanvasFont=Font'UI_Canvas_Fonts.Font_Main'
    KFFontScale=0.65
    bMuteOnLossOfFocus=true
    SeasonalEventId=-1
    LoadedSeasonalEventId=-1
    WeeklyEventIndex=-1
    DefaultGammaMult=0.68
    MusicVolumeMultiplier=50
    SFxVolumeMultiplier=50
    DialogVolumeMultiplier=50
    MasterVolumeMultiplier=50
    FOVOptionsPercentageValue=1
    LocalLoginStatus=ELoginStatus.LS_LoggedIn
    bDisableAILogging=true
    SafeFrameScale=1
}