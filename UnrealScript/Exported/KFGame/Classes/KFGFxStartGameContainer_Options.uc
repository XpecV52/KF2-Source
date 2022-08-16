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
	config(UI);

enum EInProgess
{
	E_Allow_In_Progress,
	E_Not_Started,
};

enum EServerType
{
	E_Standard,
	E_Custom,
	E_Unranked,
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

var config byte SavedModeIndex; // Save the game mode after it's selected in the menu
var config string SavedMapString; // Temporarily save our last chosen map until we have map rotations set up
var config byte SavedDifficultyIndex; // Save the game difficulty after it's selected in the menu
var config byte SavedLengthIndex; // Save the game length after it's selected in the menu
var config byte SavedPrivacyIndex; // Save the privacy after it's selected in the menu
var config byte SavedServerTypeIndex;
var config byte SavedInProgressIndex;

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
	if(SavedDifficultyIndex >= class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray().length)
	{
		SavedDifficultyIndex = 0;
	}
	StartMenu = KFGFxMenu_StartGame( NewParentMenu );
	InitializeGameOptions();
	LocalizeArrays();
	SetOptions();
}

function InitializeGameOptions()
{
	local GFxObject TextObject;
	bIsSoloGame = GetBool("bIsSoloGame");
	InitialMapIndex = StartMenu.MapStringList.Find( SavedMapString );
    // If the map was not found in the map list, set it to the no preference option
	if (InitialMapIndex == 255)
	{
		InitialMapIndex = StartMenu.MapStringList.length;
	}

	TextObject = CreateObject("Object");

	// Localize static text
	TextObject.SetString("soloGameString",SoloGameString);
	TextObject.SetString("matchMakingString",StartMenu.MatchmakingString);
	TextObject.SetString("leaveMatchmakingString",LeaveMatchMakingString);
	TextObject.SetString("backString",BackString);
	TextObject.SetString("lauchGameString",LaunchGameString);
	TextObject.SetString("multiplayerLaunchString",MultiplayerLaunchString);
	TextObject.SetString("searchingString",SearchingString);
	
	
	TextObject.SetString("mode", StartMenu.GameModeTitle);
	TextObject.SetString("map",StartMenu.MapTitle);
	TextObject.SetString("difficulty",StartMenu.DifficultyTitle);
	TextObject.SetString("length",StartMenu.LengthTitle);
	TextObject.SetString("privacy",StartMenu.PermissionsTitle);
	TextObject.SetString("serverType",ServerTypeString);
	TextObject.SetString("inProgress", InProgressString);

	if(bIsSoloGame)
	{
		//Adjust the saved index for all filters to not be on ANY
		AdjustSavedIndexesForSoloGame();
	}
 	
	// Update the options lists
	TextObject.SetObject("modeList", 		CreateList(class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray(), SavedModeIndex, true));
    TextObject.SetObject("lengthList", 		CreateList(class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray(), SavedLengthIndex, true));
	TextObject.SetObject("mapList",			CreateList(StartMenu.MapStringList, InitialMapIndex, true, true));
	TextObject.SetObject("difficultyList",	CreateList(class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray(), SavedDifficultyIndex, false));
	TextObject.SetObject("serverTypeList",	CreateList(ServerTypeStrings, SavedServerTypeIndex, true));
	TextObject.SetObject("inProgressList",	CreateList(InProgessOptionStrings, SavedInProgressIndex, false));
	TextObject.SetObject("privacyList",		CreateList(class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray(), SavedPrivacyIndex, false));

	SetInt("currentSelectedMapIndex", InitialMapIndex);
	SetObject("localizedText", TextObject);
}

function LocalizeArrays()
{
	ServerTypeStrings[E_Standard]=Localize("KFGFxStartGameContainer_Options", "StandardServerString","KFGame");
	//ServerTypeStrings[E_Unranked]=Localize("KFGFxStartGameContainer_Options", "UnrankedServerString","KFGame");
	ServerTypeStrings[E_Custom]=Localize("KFGFxStartGameContainer_Options", "CustomServerString","KFGame");

	InProgessOptionStrings[E_Allow_In_Progress]=Localize("KFGFxStartGameContainer_Options", "AllowInProgressString","KFGame");
	InProgessOptionStrings[E_Not_Started]=Localize("KFGFxStartGameContainer_Options", "NotStartedString","KFGame");
}

function AdjustSavedIndexesForSoloGame()
{
	if( SavedModeIndex 			>= class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray().Length )	{SavedModeIndex = 0;}
	if( SavedLengthIndex 		>= class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray().Length )		{SavedLengthIndex = 0;}
	if( InitialMapIndex 		>= StartMenu.MapStringList.Length )												{InitialMapIndex = 0;}
	if( SavedDifficultyIndex 	>= class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray().Length )	{SavedDifficultyIndex = 0;}
}

					
function GFxObject CreateList( array<string> TextArray, byte SelectedIndex, bool bAddNoPrefString, optional bool bIsMapList)
{
	local byte i;
	local GFxObject OptionList;
	local GFxObject DataProvider;
	local GFxObject ItemSlot;
	local string 	TempString;
	OptionList = CreateObject("Object");	
	DataProvider = CreateArray();

	for ( i = 0; i < TextArray.length; i++ )
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
}

//==============================================================
// Modified Game Option Functions
//==============================================================
function ModeChanged( int Index )
{
	SavedModeIndex = Index;
	SaveConfig();
}

function LengthChanged( int Index )
{
	SavedLengthIndex = Index;
	SaveConfig();
}

// Save the game difficulty after it's selected in the menu
function DifficultyChanged( int Index )
{
	SavedDifficultyIndex = Index;
	SaveConfig();
}

function MapChanged( string MapName, optional bool bSave = true)
{
	SavedMapString = MapName;

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
	SetBool("bAllowGameInProgress", SavedInProgressIndex == E_Allow_In_Progress );
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
	bInProgressFilterSet   	= SavedInProgressIndex == E_Allow_In_Progress;
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
	return SavedMapString;
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

function GetServerTypeBools(out int bCustom, out int bRanked)
{
	bCustom = 0;
	bRanked = 1;
	switch (SavedServerTypeIndex)
	{
		case 1:
			bCustom = 1;
			break;
		default:
			break;
	}
	return;
}

defaultproperties
{
   BackString="BACK"
   StartGameString="START GAME"
   LaunchGameString="LAUNCH GAME"
   ServerTypeString="SERVER TYPE"
   InProgressString="GAME PROGRESS"
   SoloGameString="SOLO GAME"
   LeaveMatchMakingString="LEAVE MATCHMAKING"
   MultiplayerLaunchString="PLAY ONLINE NOW"
   SearchingString="CANCEL SEARCH"
   StandardServerString="Standard"
   UnrankedServerString="Unranked"
   CustomServerString="Custom"
   AllowInProgressString="Allow In Progress Games"
   NotStartedString="Only New Games"
   Name="Default__KFGFxStartGameContainer_Options"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
