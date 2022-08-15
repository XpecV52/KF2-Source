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
var const float DefaultGammaMult;
var config float MusicVolumeMultiplier;
var config float SFxVolumeMultiplier;
var config float GammaMultiplier;
var config bool bMusicVocalsEnabled;
var config bool bMinimalChatter;
var config bool bShowCrossHair;
var config bool bMuteOnLossOfFocus;
var config bool bEnableAdvDebugLines;
var config float FOVOptionsPercentageValue;
var transient delegate<HandshakeCompleteCallback> OnHandshakeComplete;
var KFGameEngine.EConnectionError LastConnectionError;
/** List of categories to filter */
var(Debug) config array<config name> AILogFilter;
var private transient KFDebugLines KFDebugLines;
var delegate<HandshakeCompleteCallback> __HandshakeCompleteCallback__Delegate;

// Export UKFGameEngine::execCheckSkipLobby(FFrame&, void* const)
native static function bool CheckSkipLobby();

// Export UKFGameEngine::execCheckSkipGammaCheck(FFrame&, void* const)
native static function bool CheckSkipGammaCheck();

// Export UKFGameEngine::execCheckNoAutoStart(FFrame&, void* const)
native static function bool CheckNoAutoStart();

// Export UKFGameEngine::execCheckNoMusic(FFrame&, void* const)
native static function bool CheckNoMusic();

// Export UKFGameEngine::execGetGameVersion(FFrame&, void* const)
native static function int GetGameVersion();

// Export UKFGameEngine::execGetDebugLines(FFrame&, void* const)
native static function KFDebugLines GetDebugLines();

// Export UKFGameEngine::execGetPlatform(FFrame&, void* const)
native static function KFGameEngine.SupportedPlatform GetPlatform();

// Export UKFGameEngine::execGetClassCountAndSize(FFrame&, void* const)
native static function GetClassCountAndSize(out int ClassCount, out float ClassSize, out float ResourceSize, Class LoadedClass);

// Export UKFGameEngine::execInitAudioOptions(FFrame&, void* const)
native static function InitAudioOptions();

// Export UKFGameEngine::execInitVideoOptions(FFrame&, void* const)
native static function InitVideoOptions();

// Export UKFGameEngine::execSetWWiseSFXVolume(FFrame&, void* const)
native static function SetWWiseSFXVolume(float Volume);

// Export UKFGameEngine::execSetWWiseMusicVolume(FFrame&, void* const)
native static function SetWWiseMusicVolume(float Volume);

// Export UKFGameEngine::execSetWWiseVoiceVolume(FFrame&, void* const)
native static function SetWWiseVoiceVolume(float Volume);

// Export UKFGameEngine::execSetWWiseMasterVolume(FFrame&, void* const)
native static function SetWWiseMasterVolume(float Volume);

// Export UKFGameEngine::execSetVoIPRecieveVolume(FFrame&, void* const)
native static function SetVoIPRecieveVolume(float Volume);

// Export UKFGameEngine::execGetVoIPVolumeRange(FFrame&, void* const)
native static function GetVoIPVolumeRange(out float MinVol, out float MaxVol, out float CurrentVol);

// Export UKFGameEngine::execPlayFullScreenMovie(FFrame&, void* const)
native static function PlayFullScreenMovie(string MovieName);

// Export UKFGameEngine::execSetGamma(FFrame&, void* const)
native static function SetGamma(float InGammaMultiplier);

// Export UKFGameEngine::execGetKFGameVersion(FFrame&, void* const)
native static function int GetKFGameVersion();

// Export UKFGameEngine::execGetAppID(FFrame&, void* const)
native static function int GetAppID();

static function Font GetKFCanvasFont()
{
    return default.KFCanvasFont;
}

static function float GetKFFontScale()
{
    return default.KFFontScale;
}

static function KFGameEngine.EConnectionError GetConnectionErrorForMessage(out string Message, out string Title)
{
    if(Message == (Localize("AccessControl", "NeedPassword", "Engine")))
    {
        return 3;
    }
    if(Message == (Localize("AccessControl", "WrongPassword", "Engine")))
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

function bool IsLockedServer()
{
    return bUsedForTakeover && !bAvailableForTakeover;
}

function UnlockServer()
{
    if(bUsedForTakeover)
    {
        bAvailableForTakeover = true;
    }
}

// Export UKFGameEngine::execKillPendingServerConnection(FFrame&, void* const)
native function KillPendingServerConnection();

defaultproperties
{
    KFCanvasFont=Font'UI_Canvas_Fonts.Font_General'
    KFFontScale=0.28
    DefaultGammaMult=0.68
    MusicVolumeMultiplier=35
    SFxVolumeMultiplier=100
    GammaMultiplier=0.68
    bMuteOnLossOfFocus=true
    FOVOptionsPercentageValue=1
}