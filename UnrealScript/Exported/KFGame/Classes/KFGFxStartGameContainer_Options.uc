//=============================================================================
// KFGFxStartGameContainer_Options
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 11/15/2013
//=============================================================================

class KFGFxStartGameContainer_Options extends KFGFxObject_Container
	native(UI)
	config(UI);









const KFID_QuickWeaponSelect = 100;
const KFID_CurrentLayoutIndex = 101;
const KFID_ForceFeedbackEnabled = 103;
const KFID_SavedPerkIndex = 105;
const KFID_AllowBloodSplatterDecals = 106;
const KFID_GoreLevel = 107;
const KFID_StoredCharIndex = 111;
const KFID_MasterVolumeMultiplier = 112;
const KFID_DialogVolumeMultiplier = 113;
const KFID_MusicVolumeMultiplier = 114;
const KFID_SFXVolumeMultiplier = 115;
const KFID_GammaMultiplier = 117;
const KFID_MusicVocalsEnabled = 118;
const KFID_MinimalChatter = 119;
const KFID_ShowCrossHair = 121;
const KFID_FOVOptionsPercentageValue = 122;
const KFID_ShowKillTicker = 123;
const KFID_FriendlyHudScale = 125;
const KFID_FavoriteWeapons = 127;
const KFID_GearLoadouts = 128;
const KFID_SetGamma = 129;
const KFID_RequiresPushToTalk = 130;
const KFID_InvertController = 131;
const KFID_AutoTargetEnabled = 132;
const KFID_GamepadSensitivityScale = 133;
const KFID_ZoomedSensitivityScale = 134;
const KFID_GamepadZoomedSensitivityScale = 135;
const KFID_EnableMouseSmoothing = 136;
const KFID_MouseSensitivity = 138;
const KFID_TargetAdhesionEnabled = 139;
const KFID_TargetFrictionEnabled = 140;
const KFID_InvertMouse = 142;
const KFID_DEPRECATED_143 = 143;
const KFID_SavedSoloModeIndex = 144;
const KFID_SavedSoloMapString = 145;
const KFID_SavedSoloDifficultyIndex = 146;
const KFID_SavedSoloLengthIndex = 147;
const KFID_SavedModeIndex = 148;
const KFID_SavedMapString = 149;
const KFID_SavedDifficultyIndex = 150;
const KFID_SavedLengthIndex = 151;
const KFID_SavedPrivacyIndex = 152;
const KFID_SavedServerTypeIndex = 153;
const KFID_SavedInProgressIndex = 154;
const KFID_ControllerSoundEnabled = 155;
const KFID_MatchmakingRegion = 156;
const KFID_UseAltAimOnDuals = 157; 
const KFID_HideBossHealthBar = 158; 
const KFID_AntiMotionSickness = 159; 
const KFID_ShowWelderInInventory = 160; 
const KFID_AutoTurnOff = 161;			
const KFID_ReduceHightPitchSounds = 162; 
const KFID_ShowConsoleCrossHair = 163;
const KFID_VOIPVolumeMultiplier = 164;
const KFID_WeaponSkinAssociations = 165;
const KFID_SavedEmoteId = 166;
const KFID_DisableAutoUpgrade = 167;
const KFID_SafeFrameScale = 168;
const KFID_Native4kResolution = 169;
const KFID_HideRemoteHeadshotEffects = 170;
const KFID_SavedHeadshotID= 171;
const KFID_ToggleToRun=172;
const KFID_ClassicPlayerInfo=173;
const KFID_VOIPMicVolumeMultiplier = 174;
const KFID_GamepadDeadzoneScale = 175;
const KFID_GamepadAccelerationJumpScale = 176;
const KFID_HasTabbedToStore = 177;
#linenumber 15

enum EServerPrivacy
{
	ESPr_Public,
	ESPr_PasswordProtected
};

enum EGameMode
{
	EGameMode_Survival,
	EGameMode_Weekly,
	EGameMode_VsSurvival,
	EGameMode_Endless,
	EGameMode_Objective
};

//Match making filters
var int ModeFilter;
var int DifficultyFilter;
var int LengthFilter;
var int PermissionsFilter;

var bool bModeFilterSet;
var bool bLengthFilterSet;
var bool bPermissionsFilterSet;
//End match making filters

var private byte   RegionIndex;

var bool bShowLengthNoPref;
var config const bool bShowServerTypeNoPref;

var KFGFxMenu_StartGame StartMenu;

var localized string BackString;
var localized string StartGameString;
var localized string LaunchGameString;
var localized string ServerTypeString;

var localized string InProgressString;
var localized string SoloGameString;
var localized string LeaveMatchMakingString;
var localized string MultiplayerLaunchString;
var localized string SearchingString;
var localized string CancelSearchingString;

var localized array<string> GameTypes;

var string PreviousMapName;
var bool bIsSoloGame;

var private array<string> SupportedGameModeStrings;

//==============================================================
// Buttons
//==============================================================
var GFxObject PrivacyButton;
var GFxObject LengthButton;
var GFxObject DifficultyButton;
var GfxObject MapButton;
var GFxObject RegionButton;

//==============================================================
// Initialization
//==============================================================
function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );
	GetButtons();
	StartMenu = KFGFxMenu_StartGame( NewParentMenu );
	InitializeGameOptions();
	SetOptions();
}

function GetButtons()
{
	PrivacyButton = GetObject("privacyButton");
	LengthButton = GetObject("lengthButton");
	DifficultyButton = GetObject("difficultyButton");
	MapButton = GetObject("mapButton");
	RegionButton = GetObject("regionButton");
}

function UpdateButtonsEnabled()
{
	local int AdjustedGameModeIndex;

	if (bIsSoloGame)
	{
		AdjustedGameModeIndex = ParentMenu.Manager.GetModeIndex(false);

		LengthButton.SetBool("enabled", class'KFGameInfo'.default.GameModes[AdjustedGameModeIndex].Lengths > 0);
		DifficultyButton.SetBool("enabled", class'KFGameInfo'.default.GameModes[AdjustedGameModeIndex].DifficultyLevels > 0);

	}
	else
	{
		LengthButton.SetBool("enabled", class'KFGameInfo'.default.GameModes[ParentMenu.Manager.GetModeIndex()].Lengths > 0);
		DifficultyButton.SetBool("enabled", class'KFGameInfo'.default.GameModes[ParentMenu.Manager.GetModeIndex()].DifficultyLevels > 0);
	}
}

function SetHelpText(string TextValue)
{
	SetString("helpText", TextValue);
}

function SetModeMenus(GFxObject TextObject, int ModeIndex, int LengthIndex)
{
	local int DifficultyLevels, Lengths;
	local byte NewDifficultyIndex, NewLengthIndex;

	DifficultyLevels = class'KFGameInfo'.default.GameModes[ModeIndex].DifficultyLevels;
	Lengths = class'KFGameInfo'.default.GameModes[ModeIndex].Lengths;
	NewDifficultyIndex = Clamp(NewDifficultyIndex, 0, DifficultyLevels);
	NewLengthIndex = Clamp(NewLengthIndex, 0, Lengths);
	TextObject.SetObject("difficultyList",	CreateList(class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray(), GetDifficultyIndex(), false, false, byte(DifficultyLevels)));
	TextObject.SetObject("lengthList", 		CreateList(class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray(), LengthIndex, bShowLengthNoPref, false, byte(Lengths)));
}

// convert the solo game mode index back into an index that matches the game mode enum
event int GetNormalizedGameModeIndex(int ModeIndex)
{
	if (bIsSoloGame)
	{
		// if before the indices are different (survival, weekly), just return the mode index
		if (ModeIndex < EGameMode_VsSurvival)
		{
			return ModeIndex;
		}
		else
		{
			// the input index doesn't account for vs survival missing, so need to bump up to account
			return ModeIndex + 1;
		}
	}

	return ModeIndex;
}

simulated function int GetInitialMapIndex()
{
	local int InitialMapIndex;

	InitialMapIndex = StartMenu.MapStringList.Find(GetMapName());

	if (bIsSoloGame && InitialMapIndex == INDEX_NONE)
	{
		// if the game isn't fully installed, the only map available is evacuation point
		if (!class'GameEngine'.Static.IsGameFullyInstalled())
		{
			InitialMapIndex = StartMenu.MapStringList.Find("KF-EvacuationPoint");
		}
		else
		{
			// Biotics Lab doesn't support objective mode yet, so that needs a different default
			if (ParentMenu.Manager.GetModeIndex(false) == EGameMode_Objective)
			{
				InitialMapIndex = StartMenu.MapStringList.Find("KF-SteamFortress");
			}
			else
			{
				InitialMapIndex = StartMenu.MapStringList.Find("KF-BioticsLab");
			}
		}
		MapChanged(StartMenu.MapStringList[InitialMapIndex]);
	}

	return InitialMapIndex;
}

simulated function KFProfileSettings GetCachedProfile()
{
	return KFProfileSettings(class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(GetLP().ControllerId));
}

function InitializeGameOptions()
{
	local GFxObject TextObject;
	local int i, InitialMapIndex;
	local KFProfileSettings Profile;
	local array<string> PlayfabRegionList;
	local int StoredLengthIndex;

	Profile = GetCachedProfile();
	bIsSoloGame = GetBool("bIsSoloGame");
	StartMenu.GetMapList(StartMenu.MapStringList, ParentMenu.Manager.GetModeIndex(false), StartMenu.GetStartMenuState() == EMatchmaking);

	InitialMapIndex = GetInitialMapIndex();
	UpdateButtonsEnabled();

	// Update the options lists
	SupportedGameModeStrings = class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray();
	for (i = SupportedGameModeStrings.Length - 1; i >= 0; i--)
	{
		// If we're in a solo game, filter out MP-only gametypes
		// If the game isn't fully installed, filter out objective mode since it isn't supported by evacuation point
		// KFII-49468: also filter out Weekly mode
		if ((bIsSoloGame && !class'KFGameInfo'.static.IsGameModeSoloPlayAllowed(i)) 
		|| (!class'GameEngine'.Static.IsGameFullyInstalled() && i == EGameMode_Objective) 
		|| (!class'GameEngine'.Static.IsGameFullyInstalled() && i == EGameMode_Weekly)
		|| (!class'GameEngine'.Static.IsGameFullyInstalled() && i == EGameMode_Endless))
		{
			SupportedGameModeStrings.Remove(i, 1);
		}
	}

	TextObject = CreateObject("Object");
	
	StoredLengthIndex = GetLengthIndex();

	// Localize static text
	TextObject.SetString("soloGameString",SoloGameString);
	TextObject.SetString("matchMakingString",StartMenu.MatchmakingString);
	TextObject.SetString("createGameString", StartMenu.CreateMatchString);
	TextObject.SetString("leaveMatchmakingString",LeaveMatchMakingString);
	TextObject.SetString("backString",BackString);
	TextObject.SetString("lauchGameString",LaunchGameString);
	TextObject.SetString("multiplayerLaunchString",MultiplayerLaunchString);
	TextObject.SetString("searchingString",CancelSearchingString);
	TextObject.SetString("mode", StartMenu.GameModeTitle);
	TextObject.SetString("map", StartMenu.MapTitle);
	TextObject.SetString("difficulty",StartMenu.DifficultyTitle);
	TextObject.SetString("length",StartMenu.LengthTitle);
	TextObject.SetString("privacy",StartMenu.PermissionsTitle);
	TextObject.SetString("inProgress", InProgressString);
	// Since the Mode list can include "ANY" we need to just accept that the selected index could be the length of the supported modes.  Otherwise when "ANY" is selected we push the index to 1.
	// Also don't include the "ANY" option on Console since PlayGo doesn't support searching multiple game types.  HSL_BB
	TextObject.SetObject("modeList", 		CreateList(SupportedGameModeStrings, Min(ParentMenu.Manager.GetModeIndex() , SupportedGameModeStrings.Length), false));
	SetModeMenus(TextObject, Min(ParentMenu.Manager.GetModeIndex(), SupportedGameModeStrings.Length), StoredLengthIndex);
    TextObject.SetObject("lengthList", 		CreateList(class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray(), StoredLengthIndex, bShowLengthNoPref));
	TextObject.SetObject("mapList",			CreateList(StartMenu.MapStringList, bIsSoloGame ? InitialMapIndex : InitialMapIndex+1, true, true));
	TextObject.SetObject("difficultyList",	CreateList(class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray(), GetDifficultyIndex(), false));
	TextObject.SetObject("privacyList",		CreateList(class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray(class'WorldInfo'.static.IsConsoleBuild()), Profile.GetProfileInt(KFID_SavedPrivacyIndex), false));

	if (class'WorldInfo'.static.IsConsoleBuild())
	{
		TextObject.SetString("regionTitle", ConsoleLocalize("MatchmakingRegionString"));
		PlayfabRegionList = class'PlayfabInterface'.static.GetLocalizedRegionList();
		RegionIndex = class'WorldInfo'.static.IsE3Build() ? 0 : byte(class'GameEngine'.static.GetPlayfabInterface().GetIndexForCurrentRegion());
		TextObject.SetObject("regionListData", CreateList(PlayfabRegionList, RegionIndex, false));
		TextObject.SetObject("regionList", CreateList(PlayfabRegionList, class'GameEngine'.static.GetPlayfabInterface().GetIndexForCurrentRegion(), false));
	}

	SetObject("localizedText", TextObject);
}

function GFxObject CreateList( array<string> TextArray, byte SelectedIndex, bool bAddNoPrefString, optional bool bIsMapList, optional byte MaxLength)
{
	local int i;
	local int ArrayOffset;
	local GFxObject OptionList;
	local GFxObject DataProvider;
	local GFxObject ItemSlot;
	local string 	TempString;
	local byte ArrayLen;

	OptionList = CreateObject("Object");
	DataProvider = CreateArray();

	if (MaxLength > 0)
	{
		ArrayLen = Min(MaxLength, TextArray.length);
	}
	else
	{
		ArrayLen = TextArray.length;
	}

	ArrayOffset = 0;
    if( bAddNoPrefString && !GetBool("bIsSoloGame") )
    {
    	ItemSlot = CreateObject( "Object" );
		TempString = class'KFCommon_LocalizedStrings'.default.NoPreferenceString;
		ItemSlot.SetString("label", TempString );
		ItemSlot.SetString("imagePath", StartMenu.GetMapSource("Omlette Du Fromage"));//nonsense value to get back default image
		DataProvider.SetElementObject(ArrayOffset, ItemSlot);
		++ArrayOffset;
    }

	for ( i = 0; i < ArrayLen; ++i )
	{
		ItemSlot = CreateObject( "Object" );
		if(bIsMapList)
		{
			TempString = class'KFCommon_LocalizedStrings'.static.GetFriendlyMapName(TextArray[i]);
			ItemSlot.SetString("mapItemKey",TextArray[i]);
			ItemSlot.SetString("imagePath", StartMenu.GetMapSource(TextArray[i]));
		}
		else
		{
			TempString = TextArray[i];
		}


		ItemSlot.SetString("label", TempString );
		DataProvider.SetElementObject(i + ArrayOffset, ItemSlot);
    }

    OptionList.SetInt("selectedIndex", SelectedIndex);
	OptionList.SetObject("dataProvider", DataProvider);
	OptionList.ActionScriptVoid("invalidateData");

	return OptionList;
}

// Set the game options based on our stored information
function SetOptions( optional bool bMenuOpening )
{
	local array<string> PlayfabRegionList;

	if( class'WorldInfo'.static.IsConsoleBuild() )
	{
		if( bMenuOpening && !bIsSoloGame )
		{
			// For first time users on XB1, we need to detect best fit region and notify the user
			if (class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Durango) && class'GameEngine'.static.GetPlayfabInterface().CurrRegionName == "")
			{
				class'GameEngine'.static.GetOnlineSubsystem().StartRegionPingAndSelectDefaultRegion(none);

				// Notify the user as well
				ParentMenu.Manager.DelayedOpenPopup(ENotification, EDPPID_Misc,
					Localize("Notifications", "NewRegionTitle", "KFGameConsole"),
					Localize("Notifications", "NewRegionMessage", "KFGameConsole"),
					class'KFCommon_LocalizedStrings'.default.OKString);

				RegionIndex = class'GameEngine'.static.GetPlayfabInterface().GetIndexForCurrentRegion();
				class'GameEngine'.static.GetPlayfabInterface().SetIndexForCurrentRegion(RegionIndex);
				PlayfabRegionList = class'PlayfabInterface'.static.GetLocalizedRegionList();

				RegionButton.SetString("infoString", PlayfabRegionList[RegionIndex]); //just in case we are using region
			}
		}
	}
}

function SetSearching(bool bSearching)
{
	SetBool("bSearchingForGame", bSearching);
	PrivacyChanged(GetCachedProfile().GetProfileInt(KFID_SavedPrivacyIndex));
	if(!bSearching)
	{
		UpdateButtonsEnabled();
	}

	if(bSearching)
	{
		SetHelpText(SearchingString);
	}
	else
	{
		SetHelpText("");
	}

}

event bool GetMakeNewServer()
{
	return StartMenu.bAttemptingServerCreate;
}

//==============================================================
// Modified Game Option Functions
//==============================================================
function ModeChanged( int Index )
{
	local int NormalizedModeIndex;

	// convert back to the normal game mode enum
	NormalizedModeIndex = GetNormalizedGameModeIndex(Index);

	// save off this index, which matches the normal game mode enum
	GetCachedProfile().SetProfileSettingValueInt(KFID_SavedModeIndex, NormalizedModeIndex);

	InitializeGameOptions();
	SaveConfig();
}

function LengthChanged( int Index )
{
	GetCachedProfile().SetProfileSettingValueInt(KFID_SavedLengthIndex, Index);
	SaveConfig();
}

// Save the game difficulty after it's selected in the menu
function DifficultyChanged( int Index )
{
	GetCachedProfile().SetProfileSettingValueInt(KFID_SavedDifficultyIndex, Index);
	SaveConfig();
}

function MapChanged( string MapName, optional bool bSave = true)
{
	GetCachedProfile().SetProfileSettingValue(KFID_SavedMapString, MapName);

	if(bSave)
	{
		SaveConfig();
	}
}

function PrivacyChanged( int Index, optional bool bSetText )
{
	if(Index != GetCachedProfile().GetProfileInt(KFID_SavedPrivacyIndex))
	{
		SaveConfig();
		if(bSetText)
		{
			PrivacyButton.SetString("infoString", class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray(GetPC().WorldInfo.IsConsoleBuild())[Index]);
		}

		GetCachedProfile().SetProfileSettingValueInt(KFID_SavedPrivacyIndex, Index);
	}
}

function SetRegionIndex(int InRegionIndex, optional bool bSetText)
{
	local array<String> PlayfabRegionList;
	if (!class'WorldInfo'.static.IsConsoleBuild())
	{
		return;
	}
	if (RegionIndex != InRegionIndex)
	{
		RegionIndex = InRegionIndex;
		class'GameEngine'.static.GetPlayfabInterface().SetIndexForCurrentRegion(RegionIndex);
		if (bSetText)
		{
			PlayfabRegionList = class'PlayfabInterface'.static.GetLocalizedRegionList();

			RegionButton.SetString("infoString", PlayfabRegionList[RegionIndex]); //just in case we are using region
		}
	}
}

function UpdateFilters()
{
	local GFxObject DataObject;

	DataObject = GetObject("options");

	ModeFilter 				= ParentMenu.Manager.GetModeIndex();
	bModeFilterSet 			= ModeFilter < class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray().length;
	DifficultyFilter 		= GetDifficultyIndex();
	if (DifficultyFilter >= class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray().length)
	{
		DifficultyFilter = 0;
	}
	if (bShowLengthNoPref)
	{
		LengthFilter 			= DataObject.GetInt("length") - 1;
		bLengthFilterSet 		= LengthFilter >= 0 && LengthFilter < class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray().length;
	}
	else
	{
		LengthFilter 			= DataObject.GetInt("length");
		bLengthFilterSet 		= LengthFilter < class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray().length;
	}

	bPermissionsFilterSet 	= GetPartyPrivacy() != LV_Public && GetMakeNewServer();
	PermissionsFilter = bPermissionsFilterSet ? byte(GetCachedProfile().GetProfileInt(KFID_SavedPrivacyIndex)) : byte(0);
}

event int GetGameLength()
{
	if (!bLengthFilterSet)
	{
		return -1;
	}
	switch (LengthFilter)
	{
	case GL_Short:
		return 4;
	case GL_Normal:
		return 7;
	case GL_Long:
		return 10;
	default:
		return -1;
	}
}

function int GetDifficultyIndex()
{
	local int SavedDifficultyIndex, SavedModeIndex;

	SavedDifficultyIndex = GetCachedProfile().GetProfileInt(KFID_SavedDifficultyIndex);
	SavedModeIndex = GetCachedProfile().GetProfileInt(KFID_SavedModeIndex);
	return Clamp(SavedDifficultyIndex, 0, class'KFGameInfo'.default.GameModes[SavedModeIndex].DifficultyLevels);
}

function int GetLengthIndex()
{
	local int SavedLengthIndex, LengthIndexOffset;

	SavedLengthIndex = GetCachedProfile().GetProfileInt(KFID_SavedLengthIndex);

	if (!bShowLengthNoPref)
	{
		SavedLengthIndex = Clamp(SavedLengthIndex, GL_Short, GL_Long);	
		LengthIndexOffset = 0;
		if (SavedLengthIndex >= class'KFGameInfo'.default.GameModes[ParentMenu.Manager.GetModeIndex()].Lengths + LengthIndexOffset)
		{
			SavedLengthIndex = 1;
		}
	}
	else
	{		
		SavedLengthIndex = Clamp(SavedLengthIndex, GL_Short, GL_Long + 1);
		return SavedLengthIndex;
	}

	return SavedLengthIndex;
}

function int GetDifficulty()
{
	if (DifficultyFilter >= class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray().length)
	{
		DifficultyFilter = 0;
	}
	return DifficultyFilter;
}

function int GetPrivacyIndex()
{
	return GetCachedProfile().GetProfileInt(KFID_SavedPrivacyIndex);
}

function string GetMapName()
{
	local string SavedMapString;

	if (GetCachedProfile().GetProfileSettingValue(KFID_SavedMapString, SavedMapString) == false)
	{
		SavedMapString = "";
	}

	// Override any map selection history preferences if in PS4 Playgo Mode. We only support KF-EvacuationPoint on early install.
	if (!class'GameEngine'.Static.IsGameFullyInstalled())
	{
		SavedMapString = "KF-EvacuationPoint";
	}

	return SavedMapString;
}

//Convert from the offset in the list to the Steam privacy flag for a lobby
event ELobbyVisibility GetPartyPrivacy()
{
	switch (GetCachedProfile().GetProfileInt(KFID_SavedPrivacyIndex))
	{
		case 0:
			return LV_Public;
		case 1:
			return  class'WorldInfo'.static.IsConsoleBuild() ? LV_Friends : LV_Private;
	}
}

// Checks to see if the filter matches the game settings
native function bool DoesFilterMatchGameSettings( const KFOnlineGameSettings InGameSettings );

defaultproperties
{
   RegionIndex=255
   BackString="BACK"
   StartGameString="LAUNCH GAME"
   LaunchGameString="LAUNCH GAME"
   ServerTypeString="SERVER TYPE"
   InProgressString="GAME PROGRESS"
   SoloGameString="SOLO GAME"
   LeaveMatchMakingString="LEAVE MATCHMAKING"
   MultiplayerLaunchString="PLAY ONLINE NOW"
   SearchingString="SEARCHING FOR ONLINE GAME...PLEASE WAIT"
   CancelSearchingString="CANCEL SEARCH"
   Name="Default__KFGFxStartGameContainer_Options"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
