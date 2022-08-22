//=============================================================================
// KFCommon_LocalizedStrings
//=============================================================================
// This class is made to hold common localized strings so that they are not 
// duplicated across mutiple classes
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 8/27/2014
//=============================================================================

class KFCommon_LocalizedStrings extends Object;

var localized array<string> DifficultyStrings;
var localized array<string> LengthStrings;
var localized array<string> ServerTypeStrings;
var localized array<string> PermissionStrings;
var localized array<string> ConsolePermissionStrings;
var localized array<string> ModeStrings;

var localized string TeamSwappedString;
var localized string NoPreferenceString;
var localized string OKString;
var localized string ConfirmString;
var localized string CancelString;
var localized string BackString;
var localized string PerkUpdateNoticeString;
var localized string NoticeString;
var localized string AcceptString;
var localized string DeclineString;

var localized string YesString;
var localized string NoString;

var localized string DisbandPartyString;
var localized string LeaveCurrentMenuString;
var localized string ZedString;
var localized string HumanString;
var localized string SpectatorString;

var localized string UnableToSwitchTeamString;
var localized string NoSwitchReasonString;

var localized string TeamString;
var localized string AllString;
var localized string LoadingString;

var localized string AutoTradeCompleteString;
var localized string AutoFillCompleteString;
var localized string WeaponUpgradeComepleteString;
var localized string SecondaryWeaponPurchasedString;
var localized string NoItemsPurchasedString;

var localized string SetTakeoverServerPasswordTitle;

static function array<string> GetDifficultyStringsArray()
{
	return default.DifficultyStrings;
}

static function string GetDifficultyString( float GameDifficulty )
{
	local byte DifficultyIndex;

	DifficultyIndex = class'KFGameDifficultyInfo'.static.GetDifficultyIndex(GameDifficulty);
	if( 0 < default.DifficultyStrings.length && DifficultyIndex < default.DifficultyStrings.length )
	{
		return default.DifficultyStrings[DifficultyIndex];
	}

	return default.NoPreferenceString;
}

static function array<string> GetLengthStringsArray()
{
	return default.LengthStrings;
}

static function string GetLengthString( float LengthIndex )
{
	if( 0 < default.LengthStrings.length && LengthIndex < default.LengthStrings.length )
	{
		return default.LengthStrings[LengthIndex];
	}
 	return default.NoPreferenceString;
}

static function string GetServerTypeString( float ServerTypeIndex )
{
	if( 0 < default.ServerTypeStrings.length && ServerTypeIndex < default.ServerTypeStrings.length )
	{
		return default.ServerTypeStrings[ServerTypeIndex];
	}
 	return default.NoPreferenceString;
}

static function string GetPermissionString( float PermissionIndex )
{
	if( 0 < default.PermissionStrings.length && PermissionIndex < default.PermissionStrings.length )
	{
		return default.PermissionStrings[PermissionIndex];
	}
 	return default.NoPreferenceString;
}

static function array<string> GetPermissionStringsArray(bool bConsoleBuild)
{
	if(bConsoleBuild)
	{
		return default.ConsolePermissionStrings;
	}
	else
	{
		return default.PermissionStrings;
	}
	
}

static function array<string> GetGameModeStringsArray()
{
	return default.ModeStrings;
}

static function string GetGameModeString( int GameModeIndex )
{
	if(GameModeIndex == INDEX_NONE)
	{
		return default.NoPreferenceString;
	}
	
	if( 0 < default.ModeStrings.length && GameModeIndex < default.ModeStrings.length )
	{
		return default.ModeStrings[GameModeIndex];
	}
 	return default.NoPreferenceString;
}



static function string GetFriendlyMapName(string MapName)
{
	local KFMapSummary MapData;

	MapData = class'KFUIDataStore_GameResource'.static.GetMapSummaryFromMapName(MapName);

	if ( MapData != none && MapData.DisplayName != "")
	{
		return MapData.DisplayName;
	}
	else
	{
     	return MapName;
	}
}