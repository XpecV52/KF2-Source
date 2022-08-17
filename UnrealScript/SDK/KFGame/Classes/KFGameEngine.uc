//=============================================================================
// KFGameEngine
//=============================================================================
// KF specific engine class needs
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFGameEngine extends GameEngine
	config(Game)
	native;

/** Supported platforms for KF2 */
enum SupportedPlatform
{
	PLATFORM_PC_DX11,
	PLATFORM_PC_DX10
};

/** The game state we were in (paused, in game, etc.) when we lost focus */
var int LastFocusedGameStateID;

/** The font to use for drawing canvas text in KF */
var Font KFCanvasFont;
/** The universal scale for KFCanvasFont */
var float KFFontScale;

/************************************************************************************
 * @name		User Options
 ***********************************************************************************/

// @todo Find a way to reset a options section
var const float DefaultGammaMult;

var config float MusicVolumeMultiplier, SFxVolumeMultiplier, DialogVolumeMultiplier, MasterVolumeMultiplier;
var config float GammaMultiplier;	// a value between 0-1 that scales the gamma to a value between .5 and 3

var config bool  bMusicVocalsEnabled;
var config bool  bMinimalChatter;
var config float FOVOptionsPercentageValue;
var config bool  bShowKillTicker;

var private config bool bShowCrossHair;
/** Crossair for console builds (default on).  No config since it won't save */
var private bool 		bShowCrossHairConsole;

/** Whether to mute the game if focus is lost. */
var config bool bMuteOnLossOfFocus;

/************************************************************************************
 * @name		Connection
 ***********************************************************************************/

// A callback for when a new connection handshake is complete
var transient delegate<HandshakeCompleteCallback> OnHandshakeComplete;

// Different connection errors that can occur during the join process
enum EConnectionError
{
	CE_None,                        // Default value, represents no error

	CE_Generic,                     // General unspecified connection error

	// These will all occur BEFORE a travel, via the GameInfo and AccessControl PreLogin functions
	CE_WrongPassword,               // Connection denied because the password is incorrect
	CE_NeedPassword,                // Connection denied because no password was specified

};

/** The last error we got attempting to connect */
var EConnectionError LastConnectionError;

/************************************************************************************
 * @name		Debugging
 ***********************************************************************************/

/** List of categories to filter */
var(Debug) config array<Name> AILogFilter;

/** A manager for drawing semi-persistent debug lines/spheres/text with optional owners, etc. */
var transient private KFDebugLines	KFDebugLines;
/** Set to true to enable usage of KFDebugLines (see KFDebugLines.uc) */
var config bool	bEnableAdvDebugLines;

cpptext
{
	// UEngine interface.
	void Init();
	void FinishDestroy();
	UBOOL Exec( const TCHAR* Cmd, FOutputDevice& Ar=*GLog );
	virtual UBOOL LoadMap( const FURL& URL, class UPendingLevel* Pending, FString& Error );
	virtual void SetProgress( EProgressMessageType MessageType, const FString& Title, const FString& Message );
	virtual UBOOL Browse(FURL URL, FString& Error);

	/**
	 * Pauses / unpauses the game-play when focus of the game's window gets lost / gained.
	 * @param EnablePause TRUE to pause; FALSE to unpause the game
	 */
	virtual void OnLostFocusPause( UBOOL EnablePause );

	/** Initializes default resolution */
	void InitializeResolution(INT CompatLevel);

	virtual void PerformBetweenMapTasks();
}

native static function bool CheckSkipLobby(); // If -skiplobby is added to the command line, return true
native static function bool CheckSkipGammaCheck(); // If -NoGammaStartup is added to the command line, return true
native static function bool CheckNoAutoStart(); // If -NoAutoStart is added to the command line, return true
native static function bool CheckNoMusic(); // If -NoMusic is added to the command line or PIE, return true

//Gets the game version for use on Steam
native static function int GetGameVersion();

/** Returns the debug lines object, will create one if none exists */
native static function KFDebugLines GetDebugLines(); // Accessor for KFDebugLines, if enabled

//////////////////////////////
// Platform
//////////////////////////////
native static function SupportedPlatform GetPlatform(); 

//////////////////////////////
// Debug
//////////////////////////////
/** Gets debug information for the number of loaded classes and their resource size*/
native static function GetClassCountAndSize( out int ClassCount, out float ClassSize, out float ResourceSize, class LoadedClass );

//////////////////////////////
// Options
//////////////////////////////
native static function InitAudioOptions();
native static function InitVideoOptions();

native static function SetWWiseSFXVolume( float Volume );
native static function SetWWiseMusicVolume( float Volume );
native static function SetWWiseVoiceVolume( float Volume );
native static function SetWWiseMasterVolume( float Volume );
native static function SetVoIPRecieveVolume( float Volume );
native static function GetVoIPVolumeRange(out float MinVol, out float MaxVol, out float CurrentVol);
native static function PlayFullScreenMovie(string MovieName);

/**
 * Sets the current gamma value.
 *
 * @param New Gamma Value, must be between 0.0 and 1.0
 */
native static function SetGamma(float InGammaMultiplier);

/**
 * @brief Gets the current game version
 * 
 * @return GameVersion as int
 */
native static function int GetKFGameVersion();

/**
 * @brief Gets the current game Steam AppID
 * 
 * @return Steam AppID as int
 */
native static function int GetAppID();

/* TODO: Using LoadPackageAsync

* Calling "LoadPackageAsync" will load the entirety of a package (ex. all of KFGameContent), however all unused classes will be garbage collected shortly after
* Create separate arrays of loaded and pending load classes for weapons, characters and possibly zeds
* By storing a loaded class in an array, it will not get garbage collected and we will not need to reload a package for a class that we already have
* To access this class, search through the array and spawn it whereever it is needed

* Gears of War 3 uses LoadPackageAsync only when they are using SeekFreeLoading, otherwise classes will be DLO'd immediately
* Gears of War 3 uses a different cooking method to read from smaller cooked packages that can be loaded asynchronously without having to load something like "GearGame"
* Gears of War 3 has an object class that exists specifically for holding loaded classes of a certain package (ex. class GearMPCharacterStore)
*/

/** Get the canvas font used for KF */
static function Font GetKFCanvasFont()
{
	return default.KFCanvasFont;
}

/** Get the universal scalar for the KFCanvasFont */
static function float GetKFFontScale()
{
	return default.KFFontScale;
}

/** Get value of crosshair option */
static function bool IsCrosshairEnabled()
{
	if ( Class'WorldInfo'.Static.IsConsoleBuild() )
	{
		return default.bShowCrossHairConsole;
	}
	else
	{
		return default.bShowCrossHair;
	}
}

/** Set value of crosshair option */
static function SetCrosshairEnabled(bool bEnable)
{
	if ( Class'WorldInfo'.Static.IsConsoleBuild() )
	{
		default.bShowCrossHair = bEnable;
		//Class'KFGameEngine'.static.StaticSaveConfig();
	}
	else
	{
		default.bShowCrossHair = bEnable;
		StaticSaveConfig();
	}
}

/**
 * Helper function that will return an enum value representative of the actual error that occurred
 * We have to do this by comparing the localized connection error message to what we know exists in the localization files
 *
 * @param Message the localized connection error message
 *
 * @return The EConnectionError representing the actual error that occurred
 */
static function EConnectionError GetConnectionErrorForMessage(out string Message, out string Title)
{
	if(Message == "<Strings:Engine.AccessControl.NeedPassword>") {
		return CE_NeedPassword;
	}

	if(Message == "<Strings:Engine.AccessControl.WrongPassword>") {
		return CE_WrongPassword;
	}

	return CE_Generic;
}

function SetLastConnectionError(string Message, string Title)
{
	if(LastConnectionError == CE_None) {
		// Let's try to determine what exactly happened here ... and unfortunately we only have these localized strings to do it
		LastConnectionError = GetConnectionErrorForMessage(Message, Title);
	}
}

delegate bool HandshakeCompleteCallback(bool bSuccess, string Error, out int SuppressPasswordRetry);

event bool CheckHandshakeComplete(EProgressMessageType MessageType, string Title, out int SuppressPasswordRetry, out int Cleanup)
{
	local bool SuppressPopup;

	SuppressPopup = false;
	Cleanup = 0;

	if (OnHandshakeComplete != None)
	{
		switch(MessageType)
		{
		case PMT_ConnectionFailure:
		case PMT_PeerConnectionFailure:
		case PMT_PeerHostMigrationFailure:
		case PMT_SocketFailure:
			Cleanup = 1;
			SuppressPopup = OnHandshakeComplete(false, Title, SuppressPasswordRetry);
			break;
		case PMT_Information:
			if (Title == "HandshakeDone") //This string is set in UnPenLev.cpp UNetPendingLevel::NotifyControlMessage
			{
				SuppressPopup = OnHandshakeComplete(true, Title, SuppressPasswordRetry);
			}
			break;
		}
	}
	return SuppressPopup;
}

function bool IsLockedServer()
{
	return bUsedForTakeover && !bAvailableForTakeover;
}

function UnlockServer()
{
	if (bUsedForTakeover)
	{
		bAvailableForTakeover = true;
	}
}

native function KillPendingServerConnection();

DefaultProperties
{
	DefaultGammaMult=.68
	KFCanvasFont=Font'UI_Canvas_Fonts.Font_General'
	KFFontScale=0.28f

	bShowCrossHairConsole=true
}
