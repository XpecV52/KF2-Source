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

var localized string FreeConsolePlayOverString;
var localized string BuyGameString;
var localized string CustomString;

var localized string CancelConnectionString;

var localized array<string> WeaponTypeStrings;
var localized array<string> RarityStrings;


var localized string MixerGaveAmmoString;
var localized string MixerGaveArmorString;
var localized string MixerGaveDoshString;
var localized string MixerGaveGrenadeString;
var localized string MixerGaveHealthString;
var localized string MixerZedTimeString;
var localized string MixerRageZedsString;
var localized string MixerPukeString;
var localized string MixerSpawnedFPString;

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

defaultproperties
{
   DifficultyStrings(0)="Normal"
   DifficultyStrings(1)="Hard"
   DifficultyStrings(2)="Suicidal"
   DifficultyStrings(3)="Hell on Earth"
   LengthStrings(0)="Short (4 Waves)"
   LengthStrings(1)="Medium (7 Waves)"
   LengthStrings(2)="Long (10 Waves)"
   ServerTypeStrings(0)="Ranked"
   ServerTypeStrings(1)="Ranked - Stock"
   ServerTypeStrings(2)="Ranked - Custom"
   ServerTypeStrings(3)="Unranked"
   PermissionStrings(0)="Public"
   PermissionStrings(1)="Friends only"
   PermissionStrings(2)="Private-Password"
   ConsolePermissionStrings(0)="Public"
   ConsolePermissionStrings(1)="Invite Only"
   ModeStrings(0)="Survival"
   ModeStrings(1)="Weekly"
   ModeStrings(2)="VS Survival"
   TeamSwappedString="You have been team swapped"
   NoPreferenceString="ANY"
   OKString="OK"
   ConfirmString="CONFIRM"
   CancelString="CANCEL"
   BackString="BACK"
   PerkUpdateNoticeString="Perk may be updated once per wave!"
   NoticeString="NOTICE!"
   AcceptString="Accept"
   DeclineString="Decline"
   YesString="YES"
   NoString="NO"
   DisbandPartyString="DISBAND PARTY"
   LeaveCurrentMenuString="Leave current menu?"
   ZedString="ZED"
   HumanString="SURVIVOR"
   SpectatorString="SPECTATOR"
   UnableToSwitchTeamString="Unable to Switch Teams"
   NoSwitchReasonString="Switching teams would upset team balance"
   TeamString="TEAM"
   AllString="ALL"
   LoadingString="Loading..."
   AutoTradeCompleteString="Auto Trade Complete: "
   AutoFillCompleteString="Autofilled Supplies"
   WeaponUpgradeComepleteString="Weapon Upgraded"
   SecondaryWeaponPurchasedString="Secondary Weapon Purchased"
   NoItemsPurchasedString="No Items Purchased"
   SetTakeoverServerPasswordTitle="Enter a new password to protect your game:"
   FreeConsolePlayOverString="Thanks for playing Killing Floor 2! The free event is over, but you can purchase the game and get more information by selecting the Store button below."
   BuyGameString="STORE"
   CustomString="Custom"
   CancelConnectionString="Cancel Loading"
   WeaponTypeStrings(0)="PISTOL"
   WeaponTypeStrings(1)="SHOTGUN"
   WeaponTypeStrings(2)="RIFLE"
   WeaponTypeStrings(3)="PROJECTILE"
   WeaponTypeStrings(4)="FIRE"
   WeaponTypeStrings(5)="TECH"
   WeaponTypeStrings(6)="LAUNCHER"
   WeaponTypeStrings(7)="ASSAULT"
   WeaponTypeStrings(8)="MELEE"
   WeaponTypeStrings(9)="SMG"
   WeaponTypeStrings(10)="ALL"
   RarityStrings(0)="COMMON"
   RarityStrings(1)="UNCOMMON"
   RarityStrings(2)="RARE"
   RarityStrings(3)="EXCEPTIONAL"
   RarityStrings(4)="MASTERCRAFTED"
   RarityStrings(5)="EXCEEDINGLYRARE"
   RarityStrings(6)="ANY"
   MixerGaveAmmoString=", a Mixer viewer, has given you ammo"
   MixerGaveArmorString=", a Mixer viewer, has given you armor"
   MixerGaveDoshString=", a Mixer viewer, has given you Dosh"
   MixerGaveGrenadeString=", a Mixer viewer, has given you a grenade"
   MixerGaveHealthString=", a Mixer viewer, has healed you"
   MixerZedTimeString=", a Mixer viewer, has actived ZedTime"
   MixerRageZedsString=", a Mixer viewer, has enraged nearby Zeds!"
   MixerPukeString=", a Mixer viewer, has puked on you!"
   MixerSpawnedFPString=", a Mixer viewer, has spawned a Fleshpound!"
   Name="Default__KFCommon_LocalizedStrings"
   ObjectArchetype=Object'Core.Default__Object'
}
