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
#linenumber 15

enum EServerType
{
	ES_Maps,     //No custom settings, no mods, any map
	ES_Stock,    //No custom settings, no mods, Tripwire official maps
	ES_Custom,   //Approved custom settings, whitelisted mods, any map
	ES_Unranked, //Any settings, non-whitelisted mods, any map
	//ES_Listen,

};

enum EInProgess
{
	EIP_Allow_In_Progress,
	EIP_Not_Started,
	EIP_Create_New,
};

enum EServerPrivacy
{
	ESPr_Public,
	ESPr_FriendsOnly,
	ESPr_PasswordProtected
};

//Match making filters
var int ModeFilter;
var int DifficultyFilter; 
var int LengthFilter; 
var int ServerTypeFilter;
var int InProgressFilter;
var int PermissionsFilter;

var bool bModeFilterSet;
var bool bLengthFilterSet; 
var bool bServerTypeFilterSet;
var bool bInProgressFilterSet;
var bool bPermissionsFilterSet;
//End match making filters

var int InitialMapIndex; // The index of our current map upon initialization

var byte 	SavedSoloModeIndex; // Save the game mode after it's selected in the menu
var string 	SavedSoloMapString; // Temporarily save our last chosen map until we have map rotations set up
var byte 	SavedSoloDifficultyIndex; // Save the game difficulty after it's selected in the menu
var byte 	SavedSoloLengthIndex; // Save the game length after it's selected in the menu

var private byte   SavedModeIndex; // Save the game mode after it's selected in the menu
var private string SavedMapString; // Temporarily save our last chosen map until we have map rotations set up
var private byte   SavedDifficultyIndex; // Save the game difficulty after it's selected in the menu
var private byte   SavedLengthIndex; // Save the game length after it's selected in the menu
var private byte   SavedPrivacyIndex; // Save the privacy after it's selected in the menu
var private byte   SavedServerTypeIndex;
var private byte   SavedInProgressIndex;
var private byte   RegionIndex;

var config const bool bShowLengthNoPref;
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

var localized string StandardServerString;
var localized string UnrankedServerString;
var localized string CustomServerString;

var localized string AllowInProgressString;
var localized string NotStartedString;


var array<string> ServerTypeStrings;
var array<string> InProgessOptionStrings;

var localized array<string> GameTypes;

var string PreviousMapName;
var bool bIsSoloGame;

//==============================================================
// Buttons
//==============================================================
var GFxObject ServerTypeButton;
var GFxObject InProgressButton;
var GFxObject PrivacyButton;
var GFxObject LengthButton;
var GFxObject DifficultyButton;

//==============================================================
// Initialization
//==============================================================
function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );
	GetButtons();
	StartMenu = KFGFxMenu_StartGame( NewParentMenu );
	InitializeGameOptions();
	LocalizeArrays();
	SetOptions();
}

function GetButtons()
{
	ServerTypeButton = GetObject("serverTypeButton");
	InProgressButton = GetObject("inProgressButton");
	PrivacyButton = GetObject("privacyButton");
	LengthButton = GetObject("lengthButton");
	DifficultyButton = GetObject("difficultyButton");
}

function ClampSavedFiltersToMode()
{
	local int LengthIndexOffset;

	LengthIndexOffset = bShowLengthNoPref ? 1 : 0;

	SavedDifficultyIndex = Clamp(SavedDifficultyIndex, 0, class'KFGameInfo'.default.GameModes[SavedModeIndex].DifficultyLevels);
	if (SavedLengthIndex >= class'KFGameInfo'.default.GameModes[SavedModeIndex].Lengths + LengthIndexOffset)
	{
		SavedLengthIndex = 1;
	}
	UpdateButtonsEnabled();
}

function UpdateButtonsEnabled()
{
	if(bIsSoloGame)
	{
		LengthButton.SetBool("enabled", true);
		DifficultyButton.SetBool("enabled", true);
		
	}
	else
	{
		LengthButton.SetBool("enabled", SavedModeIndex != 1);
		DifficultyButton.SetBool("enabled", SavedModeIndex != 1);
	}
	
}

function SetHelpText(string TextValue)
{
	SetString("helpText", TextValue);	
}

function SetModeMenus(GFxObject TextObject, int ModeIndex)
{
	local int DifficultyLevels, Lengths;
	local byte NewDifficultyIndex, NewLengthIndex;

	DifficultyLevels = class'KFGameInfo'.default.GameModes[ModeIndex].DifficultyLevels;
	Lengths = class'KFGameInfo'.default.GameModes[ModeIndex].Lengths;
	NewDifficultyIndex = Clamp(NewDifficultyIndex, 0, DifficultyLevels);
	NewLengthIndex = Clamp(NewLengthIndex, 0, Lengths);
	TextObject.SetObject("difficultyList",	CreateList(class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray(), bIsSoloGame ? SavedSoloDifficultyIndex 	: SavedDifficultyIndex, false, false, byte(DifficultyLevels)));
	TextObject.SetObject("lengthList", 		CreateList(class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray(), 	bIsSoloGame ? SavedSoloLengthIndex 		: SavedLengthIndex, 	bShowLengthNoPref, false, byte(Lengths)));
}

function InitializeGameOptions()
{
	local GFxObject TextObject;
	local array<string> SupportedGameModeStrings;
	local int i;
	local KFProfileSettings Profile;

	Profile = StartMenu.Manager.CachedProfile;

	SavedSoloModeIndex = Profile.GetProfileInt(KFID_SavedSoloModeIndex);
	SavedModeIndex = Profile.GetProfileInt(KFID_SavedModeIndex);
	
	if(StartMenu.Manager.CachedProfile.GetProfileSettingValue(KFID_SavedMapString, SavedMapString) == false)
	{
		SavedMapString = "";
	}
	
	if(StartMenu.Manager.CachedProfile.GetProfileSettingValue(KFID_SavedSoloMapString, SavedSoloMapString) == false)
	{
		SavedSoloMapString = "";
	}
    
    // Override any map selection history preferences if in PS4 Playgo Mode. We only support KF-EvacuationPoint on early install.
    if( class'KFGameEngine'.static.IsPlaygoModePS4() )
    {
        SavedMapString = "KF-EvacuationPoint";
        SavedSoloMapString = "KF-EvacuationPoint";
    }
	// Defaulting to biotics lab if not set
	else if( SavedSoloMapString == "" )
	{
		SavedSoloMapString = "KF-BioticsLab";
	}
    

	SavedSoloDifficultyIndex = Profile.GetProfileInt(KFID_SavedSoloDifficultyIndex);
	SavedSoloLengthIndex = Profile.GetProfileInt(KFID_SavedSoloLengthIndex);
	SavedLengthIndex = Profile.GetProfileInt(KFID_SavedLengthIndex);
	SavedInProgressIndex = Profile.GetProfileInt(KFID_SavedInProgressIndex);
	SavedServerTypeIndex = Profile.GetProfileInt(KFID_SavedServerTypeIndex);
	SavedPrivacyIndex = Profile.GetProfileInt(KFID_SavedPrivacyIndex);
	SavedModeIndex = Profile.GetProfileInt(KFID_SavedModeIndex);
	SavedDifficultyIndex = Profile.GetProfileInt(KFID_SavedDifficultyIndex);
	
	bIsSoloGame = GetBool("bIsSoloGame");
	
	InitialMapIndex = StartMenu.MapStringList.Find( bIsSoloGame ? SavedSoloMapString : SavedMapString );

	ClampSavedFiltersToMode();

	if(bIsSoloGame && InitialMapIndex == INDEX_NONE)
	{
		InitialMapIndex = 0;
	}

	TextObject = CreateObject("Object");

	// Localize static text
	TextObject.SetString("soloGameString",SoloGameString);
	TextObject.SetString("matchMakingString",StartMenu.MatchmakingString);
	TextObject.SetString("leaveMatchmakingString",LeaveMatchMakingString);
	TextObject.SetString("backString",BackString);
	TextObject.SetString("lauchGameString",LaunchGameString);
	TextObject.SetString("multiplayerLaunchString",MultiplayerLaunchString);
	TextObject.SetString("searchingString",CancelSearchingString);
	
	
	TextObject.SetString("mode", StartMenu.GameModeTitle);
	TextObject.SetString("map", class'WorldInfo'.static.IsConsoleBuild() ? ConsoleLocalize("MapPreference") : StartMenu.MapTitle);
	TextObject.SetString("difficulty",StartMenu.DifficultyTitle);
	TextObject.SetString("length",StartMenu.LengthTitle);
	TextObject.SetString("privacy",StartMenu.PermissionsTitle);

	if( class'WorldInfo'.static.IsConsoleBuild() )
	{
		TextObject.SetString("serverType",ConsoleLocalize( "MatchmakingRegionString" ));
		RegionIndex = class'WorldInfo'.static.IsE3Build() ? 0 : byte(class'GameEngine'.static.GetPlayfabInterface().GetIndexForCurrentRegion());
		TextObject.SetObject("serverTypeList",	CreateList( class'PlayfabInterface'.static.GetLocalizedRegionList(), RegionIndex, false));
	}
	else
	{
		TextObject.SetString("serverType",ServerTypeString);
		TextObject.SetObject("serverTypeList",	CreateList(ServerTypeStrings, SavedServerTypeIndex, bShowServerTypeNoPref));
	}

	TextObject.SetString("inProgress", InProgressString);
 	
	// Update the options lists
	SupportedGameModeStrings = class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray();

	// If we're in a solo game, filter out MP-only gametypes
	if( bIsSoloGame )
	{
		for( i = 0; i < SupportedGameModeStrings.Length; ++i )
		{
			if( !class'KFGameInfo'.static.IsGameModeSoloPlayAllowed(i) )
			{
				SupportedGameModeStrings.Remove(i, 1);
				i--;
			}
		}
	}
	// Since the Mode list can include "ANY" we need to just accept that the selected index could be the length of the supported modes.  Otherwise when "ANY" is selected we push the index to 1.
	// Also don't include the "ANY" option on Console since PlayGo doesn't support searching multiple game types.  HSL_BB
	TextObject.SetObject("modeList", 		CreateList(SupportedGameModeStrings, Min(bIsSoloGame ? SavedSoloModeIndex : SavedModeIndex , SupportedGameModeStrings.Length), false));	
	SetModeMenus(TextObject, Min(SavedModeIndex, SupportedGameModeStrings.Length));
    //TextObject.SetObject("lengthList", 		CreateList(class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray(), SavedLengthIndex, true));
	TextObject.SetObject("mapList",			CreateList(StartMenu.MapStringList, bIsSoloGame ? InitialMapIndex : InitialMapIndex+1, true, true));
	//TextObject.SetObject("difficultyList",	CreateList(class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray(), SavedDifficultyIndex, false));
	TextObject.SetObject("inProgressList",	CreateList(InProgessOptionStrings, SavedInProgressIndex, false));
	
	TextObject.SetObject("privacyList",		CreateList(class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray(class'WorldInfo'.static.IsConsoleBuild()), SavedPrivacyIndex, false));
	
	SetObject("localizedText", TextObject);
}

function LocalizeArrays()
{
	ServerTypeStrings[ES_Stock]=Localize("KFGFxStartGameContainer_Options", "StandardServerString","KFGame");
	ServerTypeStrings[ES_Custom]=Localize("KFGFxStartGameContainer_Options", "CustomServerString","KFGame");
	ServerTypeStrings[ES_Unranked]=Localize("KFGFxStartGameContainer_Options", "UnrankedServerString","KFGame");
	ServerTypeStrings[ES_Maps]=Localize("KFGFxStartGameContainer_Options", "AnyMapServerString","KFGame");


	InProgessOptionStrings[EIP_Allow_In_Progress]=Localize("KFGFxStartGameContainer_Options", "AllowInProgressString","KFGame");
	InProgessOptionStrings[EIP_Not_Started]=Localize("KFGFxStartGameContainer_Options", "NotStartedString","KFGame");
	// BWJ - No create game option for console
	if( !class'WorldInfo'.static.IsConsoleBuild() )
	{
		InProgessOptionStrings[EIP_Create_New]=Localize("KFGFxStartGameContainer_Options", "CreateNewGameString","KFGame");
	}
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
function SetOptions()
{
	InProgressChanged(SavedInProgressIndex);
	PrivacyChanged(SavedPrivacyIndex);
}

function SetSearching(bool bSearching)
{
	SetBool("bSearchingForGame", bSearching);
	InProgressChanged(SavedInProgressIndex);
	PrivacyChanged(SavedPrivacyIndex);
	if(!bSearching)
	{
		CheckAndUpdateBasedOnPrivacy();
		UpdateButtonsEnabled();
	}
	else
	{
		serverTypeButton.SetBool("enabled", false);
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

//==============================================================
// Modified Game Option Functions
//==============================================================
function ModeChanged( int Index )
{
	if(bIsSoloGame)
	{
		SavedSoloModeIndex = Index;
		StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(KFID_SavedSoloModeIndex, SavedSoloModeIndex);
	}
	else
	{
		SavedModeIndex = Index;
		StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(KFID_SavedModeIndex, SavedModeIndex);
	}
	
	ClampSavedFiltersToMode();
	InitializeGameOptions();
	SaveConfig();
}

function LengthChanged( int Index )
{
	if(bIsSoloGame)
	{
		SavedSoloLengthIndex = Index;
		StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(KFID_SavedSoloLengthIndex, SavedSoloLengthIndex);
	}
	else
	{
		SavedLengthIndex = Index;
		StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(KFID_SavedLengthIndex, SavedLengthIndex);
	}
	
	SaveConfig();
}

// Save the game difficulty after it's selected in the menu
function DifficultyChanged( int Index )
{
	if(bIsSoloGame)
	{
		SavedSoloDifficultyIndex = Index;
		StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(KFID_SavedSoloDifficultyIndex, SavedSoloDifficultyIndex);
	}
	else
	{
		SavedDifficultyIndex = Index;
		StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(KFID_SavedDifficultyIndex, SavedDifficultyIndex);
	}
	
	SaveConfig();
}

function MapChanged( string MapName, optional bool bSave = true)
{
	if(bIsSoloGame)
	{
		SavedSoloMapString = MapName;
		StartMenu.Manager.CachedProfile.SetProfileSettingValue(KFID_SavedSoloMapString, SavedSoloMapString);
	}
	else
	{
		SavedMapString = MapName;
		StartMenu.Manager.CachedProfile.SetProfileSettingValue(KFID_SavedMapString, SavedMapString);
	}	

	if(bSave)
	{
		SaveConfig();
	}
}

function PrivacyChanged( int Index, optional bool bSetText )
{
	if(Index != SavedPrivacyIndex)
	{
		SavedPrivacyIndex = Index;
		SaveConfig();
		CheckAndUpdateBasedOnPrivacy();
		if(bSetText)
		{
			PrivacyButton.SetString("infoString", class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray(GetPC().WorldInfo.IsConsoleBuild())[SavedInProgressIndex]);
		}
		//SetBool("bPublicGame", GetPartyPrivacy() == LV_Public || GetPartyPrivacy() == LV_Friends );
	}	
}

function CheckAndUpdateBasedOnPrivacy()
{
	if(GetPartyPrivacy() == LV_Public)
	{
		InProgressChanged(EIP_Allow_In_Progress, true);
		//allow anything for game progress
		ServerTypeButton.SetBool("enabled", true);
		InProgressButton.SetBool("enabled", true);
	}
	else
	{
		// Create New option doesn't exist for console
		if( !class'WorldInfo'.static.IsConsoleBuild() )
		{
			//set progress to Create Game
			InProgressChanged(EIP_Create_New, true);
		}

		InProgressButton.SetBool("enabled", false);
	}
}

function ServerTypeChanged( int Index, optional bool bSetText )
{
	LogInternal("Server Type changed to"@Index);
	ScriptTrace();

	if( class'WorldInfo'.static.IsConsoleBuild() )
	{
		RegionIndex = Index;
		class'GameEngine'.static.GetPlayfabInterface().SetIndexForCurrentRegion( RegionIndex );

		/// This is now done in the selection above.
		//StartMenu.Manager.CachedProfile.SetProfileSettingValue(KFID_MatchmakingRegion, class'GameEngine'.static.GetPlayfabInterface().CurrRegionName);
	}
	else
	{
		SavedServerTypeIndex = Index;
		StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(KFID_SavedServerTypeIndex, SavedServerTypeIndex);
		SaveConfig();
		if(bSetText)
		{
			ServerTypeButton.SetString("infoString", ServerTypeStrings[SavedServerTypeIndex]);
		}
	}
}

function InProgressChanged( int Index, optional bool bSetText )
{
	SavedInProgressIndex = Index;
	StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(KFID_SavedInProgressIndex, SavedInProgressIndex);
	SaveConfig();
	if(SavedInProgressIndex == EIP_Create_New)
	{
		ServerTypeChanged(ES_Stock, true);
		ServerTypeButton.SetBool("enabled", false);
	}
	else
	{
		ServerTypeButton.SetBool("enabled", true);
	}
	if(bSetText)
	{
		InProgressButton.SetString("infoString", InProgessOptionStrings[SavedInProgressIndex]);
	}
	//SetBool("bAllowGameInProgress", SavedInProgressIndex == EIP_Allow_In_Progress );
}

function UpdateFilters()
{
	local GFxObject DataObject;

	DataObject = GetObject("options");

	ModeFilter 				= bIsSoloGame ? SavedSoloModeIndex : SavedModeIndex;
	bModeFilterSet 			= ModeFilter < class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray().length;
	DifficultyFilter 		= bIsSoloGame ? SavedSoloDifficultyIndex : SavedDifficultyIndex;
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
	ServerTypeFilter 		= SavedServerTypeIndex;
	bServerTypeFilterSet 	= LengthFilter < ServerTypeStrings.length;
	InProgressFilter 		= SavedInProgressIndex;
	bInProgressFilterSet   	= SavedInProgressIndex == EIP_Allow_In_Progress;
	PermissionsFilter 		= SavedPrivacyIndex;
	bPermissionsFilterSet 	= GetPartyPrivacy() != LV_Public;
}

event int GetGameLength()
{
	if (!bLengthFilterSet)
	{
		return -1;
	}
	switch (LengthFilter)
	{
	case 0:
		return 4;
	case 1:
		return 7;
	case 2:
		return 10;
	default:
		return -1;
	}
}

function bool GetMakeNewServer()
{
	return SavedInProgressIndex == EIP_Create_New;
}

function bool GetAllowInProgress()
{
	return bInProgressFilterSet;
}

private function int HandleNoPref(int Index, bool bShowNoPref)
{
	if (bShowNoPref)
	{
		if (Index == 0)
		{
			return 127;
		}
		else
		{
			return Index - 1;
		}
	}
	else
	{
		return Index;
	}
}

function int GetModeIndex()
{
	if(bIsSoloGame)
	{
		return SavedSoloModeIndex;
	}
	else
	{
		return SavedModeIndex;
	}	
}

function int GetDifficultyIndex()
{
	if(bIsSoloGame)
	{
		return SavedSoloDifficultyIndex;
	}
	else
	{
		return SavedDifficultyIndex;
	}		
}

function int GetLengthIndex(optional int DefaultLength = -1)
{
	if(bIsSoloGame)
	{
		return SavedSoloLengthIndex;
	}
	else
	{
		if ( bShowLengthNoPref && SavedLengthIndex == 0 && DefaultLength >= 0 )
		{
			//If a DefaultLength was passed in, we use it instead of returning the sentinel
			//that means "Any"
			return DefaultLength;
		}
		return HandleNoPref(SavedLengthIndex, bShowLengthNoPref);
	}		
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
	return SavedPrivacyIndex;
}

function string GetMapName()
{
	if(bIsSoloGame)
	{
		return SavedSoloMapString;
	}
	else
	{
		return SavedMapString;
	}
}

//Convert from the offset in the list to the Steam privacy flag for a lobby
event ELobbyVisibility GetPartyPrivacy()
{
	switch (SavedPrivacyIndex)
	{
		case 0:
			return LV_Public;
		case 1:
			return LV_Friends;
		case 2:
		default:
			return LV_Private;
	}
}

function byte GetServerTypeIndex()
{
	return HandleNoPref(SavedServerTypeIndex, bShowServerTypeNoPref);
}


// Checks to see if the filter matches the game settings
native function bool DoesFilterMatchGameSettings( const KFOnlineGameSettings InGameSettings );

defaultproperties
{
   bShowLengthNoPref=True
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
   StandardServerString="Ranked - Stock"
   UnrankedServerString="Unranked"
   CustomServerString="Ranked - Custom"
   AllowInProgressString="Allow In Progress Games"
   NotStartedString="Not Started"
   Name="Default__KFGFxStartGameContainer_Options"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
