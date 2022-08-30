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

`include(KFProfileSettings.uci)

enum EServerPrivacy
{
	ESPr_Public,
	ESPr_PasswordProtected
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

var int InitialMapIndex; // The index of our current map upon initialization

var byte   SavedModeIndex; // Save the game mode after it's selected in the menu
var private string SavedMapString; // Temporarily save our last chosen map until we have map rotations set up
var private byte   SavedDifficultyIndex; // Save the game difficulty after it's selected in the menu
var private byte   SavedLengthIndex; // Save the game length after it's selected in the menu
var private byte   SavedPrivacyIndex; // Save the privacy after it's selected in the menu

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
	local int AdjustedGameModeIndex;

	if (bIsSoloGame)
	{
		AdjustedGameModeIndex = StartMenu.Manager.CachedProfile.GetProfileInt(KFID_SavedModeIndex);

		LengthButton.SetBool("enabled", class'KFGameInfo'.default.GameModes[AdjustedGameModeIndex].Lengths > 0);
		DifficultyButton.SetBool("enabled", class'KFGameInfo'.default.GameModes[AdjustedGameModeIndex].DifficultyLevels > 0);

	}
	else
	{
		LengthButton.SetBool("enabled", class'KFGameInfo'.default.GameModes[SavedModeIndex].Lengths > 0);
		DifficultyButton.SetBool("enabled", class'KFGameInfo'.default.GameModes[SavedModeIndex].DifficultyLevels > 0);
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
	TextObject.SetObject("difficultyList",	CreateList(class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray(), SavedDifficultyIndex, false, false, byte(DifficultyLevels)));
	TextObject.SetObject("lengthList", 		CreateList(class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray(), 	SavedLengthIndex, 	bShowLengthNoPref, false, byte(Lengths)));
}

// convert the solo game mode index back into an index that matches the game mode enum
event int GetNormalizedGameModeIndex(int ModeIndex)
{
	if (bIsSoloGame)
	{
		// if before the indices are different (survival, weekly), just return the mode index
		if (ModeIndex < 2)
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

function InitializeGameOptions()
{
	local GFxObject TextObject;
	local int i;
	local KFProfileSettings Profile;
	local array<string> PlayfabRegionList;
	local int OBJECTIVE_MODE_INDEX;
	OBJECTIVE_MODE_INDEX = 4;
	Profile = StartMenu.Manager.CachedProfile;

	bIsSoloGame = GetBool("bIsSoloGame");

	// find the normalized, saved index
	SavedModeIndex = Profile.GetProfileInt(KFID_SavedModeIndex);
	
	// find the index, adjusted for the fact that solo game modes are missing vs survival
	SavedModeIndex = GetModeIndex();

	StartMenu.GetMapList(StartMenu.MapStringList, Profile.GetProfileInt(KFID_SavedModeIndex), StartMenu.GetStartMenuState() == EMatchmaking);

	if(StartMenu.Manager.CachedProfile.GetProfileSettingValue(KFID_SavedMapString, SavedMapString) == false)
	{
		SavedMapString = "";
	}

    // Override any map selection history preferences if in PS4 Playgo Mode. We only support KF-EvacuationPoint on early install.
    if( !class'GameEngine'.Static.IsGameFullyInstalled() )
    {
        SavedMapString = "KF-EvacuationPoint";
    }

	SavedLengthIndex = Profile.GetProfileInt(KFID_SavedLengthIndex);
	if (!bShowLengthNoPref)
	{
		SavedLengthIndex = Clamp(SavedLengthIndex, 0, 2);
	}
	SavedPrivacyIndex = Profile.GetProfileInt(KFID_SavedPrivacyIndex);
	SavedDifficultyIndex = Profile.GetProfileInt(KFID_SavedDifficultyIndex);

	InitialMapIndex = StartMenu.MapStringList.Find( SavedMapString );

	if(bIsSoloGame && InitialMapIndex == INDEX_NONE)
	{
		// if the game isn't fully installed, the only map available is evacuation point
		if (!class'GameEngine'.Static.IsGameFullyInstalled())
		{
			InitialMapIndex = StartMenu.MapStringList.Find("KF-EvacuationPoint");
		}
		else
		{
			// Biotics Lab doesn't support objective mode yet, so that needs a different default
			if (Profile.GetProfileInt(KFID_SavedModeIndex) == OBJECTIVE_MODE_INDEX)
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

	ClampSavedFiltersToMode();

	TextObject = CreateObject("Object");

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

	if( class'WorldInfo'.static.IsConsoleBuild() )
	{
		TextObject.SetString("regionTitle",ConsoleLocalize( "MatchmakingRegionString" ));
		PlayfabRegionList = class'PlayfabInterface'.static.GetLocalizedRegionList();
		RegionIndex = class'WorldInfo'.static.IsE3Build() ? 0 : byte(class'GameEngine'.static.GetPlayfabInterface().GetIndexForCurrentRegion());
		TextObject.SetObject("regionListData",	CreateList( PlayfabRegionList, RegionIndex, false));
		
	}

	TextObject.SetString("inProgress", InProgressString);

	// Update the options lists
	SupportedGameModeStrings = class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray();

	
	for( i = SupportedGameModeStrings.Length - 1; i >= 0 ; i-- )
	{
		// If we're in a solo game, filter out MP-only gametypes
		// If the game isn't fully installed, filter out objective mode since it isn't supported by evacuation point
		if( (bIsSoloGame && !class'KFGameInfo'.static.IsGameModeSoloPlayAllowed(i)) || (!class'GameEngine'.Static.IsGameFullyInstalled() && i == OBJECTIVE_MODE_INDEX))
		{
			SupportedGameModeStrings.Remove(i, 1);
		}
	}
	// Since the Mode list can include "ANY" we need to just accept that the selected index could be the length of the supported modes.  Otherwise when "ANY" is selected we push the index to 1.
	// Also don't include the "ANY" option on Console since PlayGo doesn't support searching multiple game types.  HSL_BB
	TextObject.SetObject("modeList", 		CreateList(SupportedGameModeStrings, Min(SavedModeIndex , SupportedGameModeStrings.Length), false));
	SetModeMenus(TextObject, Min(SavedModeIndex, SupportedGameModeStrings.Length));
    TextObject.SetObject("lengthList", 		CreateList(class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray(), SavedLengthIndex, bShowLengthNoPref));
	TextObject.SetObject("mapList",			CreateList(StartMenu.MapStringList, bIsSoloGame ? InitialMapIndex : InitialMapIndex+1, true, true));
	TextObject.SetObject("difficultyList",	CreateList(class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray(), SavedDifficultyIndex, false));

	TextObject.SetObject("privacyList",		CreateList(class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray(class'WorldInfo'.static.IsConsoleBuild()), SavedPrivacyIndex, false));

	if (class'WorldInfo'.static.IsConsoleBuild())
	{
		PlayfabRegionList = class'PlayfabInterface'.static.GetLocalizedRegionList();
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
	PrivacyChanged(SavedPrivacyIndex);
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
	// convert back to the normal game mode enum
	SavedModeIndex = GetNormalizedGameModeIndex(Index);

	// save off this index, which matches the normal game mode enum
	StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(KFID_SavedModeIndex, SavedModeIndex);

	InitializeGameOptions();
	SaveConfig();
}

function LengthChanged( int Index )
{
	SavedLengthIndex = Index;
	StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(KFID_SavedLengthIndex, SavedLengthIndex);
	SaveConfig();
}

// Save the game difficulty after it's selected in the menu
function DifficultyChanged( int Index )
{
	SavedDifficultyIndex = Index;
	StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(KFID_SavedDifficultyIndex, SavedDifficultyIndex);
	SaveConfig();
}

function MapChanged( string MapName, optional bool bSave = true)
{
	SavedMapString = MapName;
	StartMenu.Manager.CachedProfile.SetProfileSettingValue(KFID_SavedMapString, SavedMapString);

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
		if(bSetText)
		{
			PrivacyButton.SetString("infoString", class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray(GetPC().WorldInfo.IsConsoleBuild())[SavedPrivacyIndex]);
		}

		StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(KFID_SavedPrivacyIndex, SavedPrivacyIndex);
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

	ModeFilter 				= SavedModeIndex;
	bModeFilterSet 			= ModeFilter < class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray().length;
	DifficultyFilter 		= SavedDifficultyIndex;
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
	PermissionsFilter = bPermissionsFilterSet ? SavedPrivacyIndex : byte(0);	
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
		return GetAdjustedGameModeIndex(SavedModeIndex);
	}
	else
	{
		return SavedModeIndex;
	}
}

function int GetDifficultyIndex()
{
	return SavedDifficultyIndex;
}

function int GetLengthIndex(optional int DefaultLength = -1)
{
	local int NewLengthIndex;
	if ( bShowLengthNoPref && DefaultLength < 0 )
	{
		NewLengthIndex = HandleNoPref(SavedLengthIndex, bShowLengthNoPref);
	}
	else
	{
		//If a DefaultLength was passed in, we use it instead of returning the sentinel
		//that means "Any"
		NewLengthIndex = Clamp(SavedLengthIndex, 0, 2);
	}
	return NewLengthIndex;
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
	return SavedMapString;
}

//Convert from the offset in the list to the Steam privacy flag for a lobby
event ELobbyVisibility GetPartyPrivacy()
{
	switch (SavedPrivacyIndex)
	{
		case 0:
			return LV_Public;
		case 1:
			return  class'WorldInfo'.static.IsConsoleBuild() ? LV_Friends : LV_Private;
	}
}

//Convert from the solo game mode types (that don't include the Vs mode) and the multiplayer types where it is index 2
event int GetAdjustedGameModeIndex(int ModeIndex)
{
	// if before the indices are different (survival, weekly), just return the mode index
	if (ModeIndex < 2)
	{
		return ModeIndex;
	}
	else
	{
		// otherwise (vs, endless, objective)
		// if going multiplayer -> solo, need to subtract to account for the removal of the Vs mode
		// if going solo -> multiplayer, need to add to account for a new mode (Vs) being added to the middle of the list
		return bIsSoloGame ? ModeIndex - 1 : ModeIndex + 1;
	}
}

// Checks to see if the filter matches the game settings
native function bool DoesFilterMatchGameSettings( const KFOnlineGameSettings InGameSettings );

DefaultProperties
{
	RegionIndex=255
}