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

var byte InitialMapIndex; // The index of our current map upon initialization

var config byte 	SavedSoloModeIndex; // Save the game mode after it's selected in the menu
var config string 	SavedSoloMapString; // Temporarily save our last chosen map until we have map rotations set up
var config byte 	SavedSoloDifficultyIndex; // Save the game difficulty after it's selected in the menu
var config byte 	SavedSoloLengthIndex; // Save the game length after it's selected in the menu

var config byte 	SavedModeIndex; // Save the game mode after it's selected in the menu
var config string 	SavedMapString; // Temporarily save our last chosen map until we have map rotations set up
var config byte 	SavedDifficultyIndex; // Save the game difficulty after it's selected in the menu
var config byte 	SavedLengthIndex; // Save the game length after it's selected in the menu
var config byte 	SavedPrivacyIndex; // Save the privacy after it's selected in the menu
var config byte 	SavedServerTypeIndex;
var config byte 	SavedInProgressIndex;

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
// Initialization
//==============================================================
function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );
	ClampSavedFiltersToMode();
	StartMenu = KFGFxMenu_StartGame( NewParentMenu );
	InitializeGameOptions();
	LocalizeArrays();
	SetOptions();
}

function ClampSavedFiltersToMode()
{
	SavedDifficultyIndex = Clamp(SavedDifficultyIndex, 0, class'KFGameInfo'.default.GameModes[SavedModeIndex].DifficultyLevels);
	if (SavedLengthIndex >= class'KFGameInfo'.default.GameModes[SavedModeIndex].Lengths)
	{
		SavedLengthIndex = 0;
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
	TextObject.SetObject("difficultyList",	CreateList(class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray(), bIsSoloGame ? SavedSoloDifficultyIndex 	: SavedDifficultyIndex, false, 	false, byte(DifficultyLevels)));
	TextObject.SetObject("lengthList", 		CreateList(class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray(), 	bIsSoloGame ? SavedSoloLengthIndex 		: SavedLengthIndex, 	true, 	false, byte(Lengths)));
}

function InitializeGameOptions()
{
	local GFxObject TextObject;
	local array<string> SupportedGameModeStrings;
	local int i;

	bIsSoloGame = GetBool("bIsSoloGame");
	
	InitialMapIndex = StartMenu.MapStringList.Find( bIsSoloGame ? SavedSoloMapString : SavedMapString );
    // If the map was not found in the map list, set it to the no preference option
	if (InitialMapIndex == 255 || InitialMapIndex  == INDEX_NONE)
	{
		if(bIsSoloGame)
		{
			InitialMapIndex = 0;
		}
		else
		{
			InitialMapIndex = StartMenu.MapStringList.length;
		}
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
	TextObject.SetString("map",StartMenu.MapTitle);
	TextObject.SetString("difficulty",StartMenu.DifficultyTitle);
	TextObject.SetString("length",StartMenu.LengthTitle);
	TextObject.SetString("privacy",StartMenu.PermissionsTitle);
	TextObject.SetString("serverType",ServerTypeString);
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
	// Since the Mode list can include "ANY" we need to just accept that the selected index could be the length of the supported modes.  Otherwise when "ANY" is selected we push the index to 1.  HSL_BB
	TextObject.SetObject("modeList", 		CreateList(SupportedGameModeStrings, Min(bIsSoloGame ? SavedSoloModeIndex : SavedModeIndex , SupportedGameModeStrings.Length), true));	
	SetModeMenus(TextObject, Min(SavedModeIndex, SupportedGameModeStrings.Length));
    //TextObject.SetObject("lengthList", 		CreateList(class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray(), SavedLengthIndex, true));
	TextObject.SetObject("mapList",			CreateList(StartMenu.MapStringList, InitialMapIndex, true, true));
	//TextObject.SetObject("difficultyList",	CreateList(class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray(), SavedDifficultyIndex, false));
	TextObject.SetObject("serverTypeList",	CreateList(ServerTypeStrings, SavedServerTypeIndex, true));
	TextObject.SetObject("inProgressList",	CreateList(InProgessOptionStrings, SavedInProgressIndex, false));
	TextObject.SetObject("privacyList",		CreateList(class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray(), SavedPrivacyIndex, false));

	SetInt("currentSelectedMapIndex", InitialMapIndex);
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
}
					
function GFxObject CreateList( array<string> TextArray, byte SelectedIndex, bool bAddNoPrefString, optional bool bIsMapList, optional byte MaxLength)
{
	local byte i;
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

	for ( i = 0; i < ArrayLen; i++ )
	{
		ItemSlot = CreateObject( "Object" );
		TempString = (bIsMapList) ? StartMenu.GetFriendlyMapName(TextArray[i]) : TextArray[i];
		ItemSlot.SetString("label", TempString );
		DataProvider.SetElementObject(i, ItemSlot);
    }

    if( bAddNoPrefString && !GetBool("bIsSoloGame") )
    {
    	ItemSlot = CreateObject( "Object" );
		TempString = class'KFCommon_LocalizedStrings'.default.NoPreferenceString;
		ItemSlot.SetString("label", TempString );
		DataProvider.SetElementObject(i, ItemSlot);
    }

    OptionList.SetInt("selectedIndex", SelectedIndex);
	OptionList.SetObject("dataProvider", DataProvider);
	OptionList.ActionScriptVoid("invalidateData");

	return OptionList;
}

// Set the game options based on our stored information
function SetOptions()
{
	if ( (SavedMapString == "" || InitialMapIndex >= StartMenu.MapStringList.length) && !bIsSoloGame)
	{
	    // If you've never selected a map before, set it to empty, meaning "Any"
		MapChanged("", false);
	}
	else
	{
		// Set our selected map to the one we have saved in our config file
		if(InitialMapIndex == 255)
		{
			InitialMapIndex = 0;
		}
		MapChanged( StartMenu.MapStringList[InitialMapIndex], false);
	}

	InProgressChanged(SavedInProgressIndex);
	PrivacyChanged(SavedPrivacyIndex);
}

function SetSearching(bool bSearching)
{
	SetBool("bSearchingForGame", bSearching);
	InProgressChanged(SavedInProgressIndex);
	PrivacyChanged(SavedPrivacyIndex);
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
	}
	else
	{
		SavedModeIndex = Index;
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
	}
	else
	{
		SavedLengthIndex = Index;
	}
	
	SaveConfig();
}

// Save the game difficulty after it's selected in the menu
function DifficultyChanged( int Index )
{
	if(bIsSoloGame)
	{
		SavedSoloDifficultyIndex = Index;
	}
	else
	{
		SavedDifficultyIndex = Index;
	}
	
	SaveConfig();
}

function MapChanged( string MapName, optional bool bSave = true)
{
	if(bIsSoloGame)
	{
		SavedSoloMapString = MapName;
	}
	else
	{
		SavedMapString = MapName;
	}	

	UpdateMapSource(MapName);
	if(bSave)
	{
		SaveConfig();
	}
}

function UpdateMapSource(string MapName)
{
	if(PreviousMapName == "" || PreviousMapName != MapName)
	{
		SetString("mapSource", StartMenu.GetMapSource(MapName));	
		PreviousMapName = MapName;
	}
}

function PrivacyChanged( int Index )
{
	SavedPrivacyIndex = Index;
	SaveConfig();
	SetBool("bPublicGame", GetPartyPrivacy() == LV_Public || GetPartyPrivacy() == LV_Friends);
}

function ServerTypeChanged( int Index )
{
	SavedServerTypeIndex = Index;
	SaveConfig();
}

function InProgressChanged( int Index )
{
	SavedInProgressIndex = Index;
	SaveConfig();
	SetBool("bAllowGameInProgress", SavedInProgressIndex == EIP_Allow_In_Progress );
}

function UpdateFilters()
{
	local GFxObject DataObject;

	DataObject = GetObject("options");

	ModeFilter 				= DataObject.GetInt("mode");
	bModeFilterSet 			= ModeFilter < class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray().length;
	DifficultyFilter 		= DataObject.GetInt("difficulty");
	if (DifficultyFilter >= class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray().length)
	{
		DifficultyFilter = 0;
	}
	LengthFilter 			= DataObject.GetInt("length");
	bLengthFilterSet 		= LengthFilter < class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray().length;
	ServerTypeFilter 		= DataObject.GetInt("serverType");
	bServerTypeFilterSet 	= LengthFilter < ServerTypeStrings.length;
	InProgressFilter 		= DataObject.GetInt("inProgress");
	bInProgressFilterSet   	= SavedInProgressIndex == EIP_Allow_In_Progress;
	PermissionsFilter 		= DataObject.GetInt("permissions");
	bPermissionsFilterSet 	= GetPartyPrivacy() != LV_Public;
}

function int GetGameLength()
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

function bool GetAllowInProgress()
{
	return bInProgressFilterSet;
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

function int GetLengthIndex()
{
	if(bIsSoloGame)
	{
		return SavedSoloLengthIndex;
	}
	else
	{
		return SavedLengthIndex;
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

//@TODO:  When we support different types of servers, make this do something useful
function bool GetServerType()
{
	return true;
}

//Convert from the offset in the list to the Steam privacy flag for a lobby
function ELobbyVisibility GetPartyPrivacy()
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

function bool GetServerTypeListen()
{
	//return SavedServerTypeIndex == E_Listen;
	return false;
}

DefaultProperties
{
}