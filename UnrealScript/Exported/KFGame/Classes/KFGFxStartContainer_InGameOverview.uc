//=============================================================================
// KFGFxStartGameContainer_Overview
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 4/23/2014
//=============================================================================

class KFGFxStartContainer_InGameOverview extends KFGFxObject_Container
dependson(KFUnlockManager);


var KFGFxMenu_StartGame StartMenu;
var byte LastDifficultyIndex, LastLengthIndex, LastPrivacyIndex;

var localized string OverviewString;
var localized string ChangeString;

var localized string SharedByString;
var localized string SharedContentString;
var	GFxObject SharedContentButton;

var bool bContentShared;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
	StartMenu = KFGfxMenu_StartGame(NewParentMenu);
 	LocalizeContainer();
	UpdateOverviewInGame();
	SharedContentButton = GetObject("sharedContentButton");
	if(SharedContentButton != none)
	{
		SharedContentButton.SetVisible((GetPC().WorldInfo.NetMode != NM_Standalone));
	}
	UpdateSharedContent();
}

function LocalizeContainer()
{
	local byte i;
	local GFxObject DataProvider, TempObj, LocalizedObject;
	local WorldInfo WI;

	LocalizedObject = CreateObject("Object");

	LocalizedObject.SetString("header", OverviewString);
	LocalizedObject.SetString("gameModeTitle", StartMenu.GameModeTitle);
	LocalizedObject.SetString("mapTitle", StartMenu.MapTitle);
	LocalizedObject.SetString("infoTitle", StartMenu.InfoTitle);
	LocalizedObject.SetString("permissionsTitle", StartMenu.PermissionsTitle);
	

	WI = class'WorldInfo'.static.GetWorldInfo();
	if( WI != none && WI.NetMode != NM_Standalone )
	{
		LocalizedObject.SetString("serverTitle", StartMenu.ServerTypeString);
	}
	
	LocalizedObject.SetString("difficultyTitle", StartMenu.DifficultyTitle);
	LocalizedObject.SetString("lengthTitle", StartMenu.LengthTitle);
	LocalizedObject.SetString("changeString", ChangeString);

	LocalizedObject.SetString("confirm", class'KFCommon_LocalizedStrings'.default.ConfirmString);
	LocalizedObject.SetString("sharedContent", SharedContentString);

	DataProvider = CreateArray();

	for (i = 0; i < class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray().length; i++)
	{
		TempObj = CreateObject("Object");
		TempObj.SetString("label", class'KFCommon_LocalizedStrings'.static.GetPermissionString(i));
		DataProvider.SetElementObject(i, TempObj);
	}

	LocalizedObject.SetObject("permissionOptions", DataProvider);

	if( !class'WorldInfo'.static.IsMenuLevel() )
	{
		LocalizedObject.SetString("authorName", GetPC().WorldInfo.Author);
	}

	SetObject("localizedText", LocalizedObject);
}

function UpdateSharedContent()
{
	local GFxObject DataProvider, TempWeaponObj;
	local int i, j, itemCount;
	local Class<KFUnlockManager> UnlockManagerClass;
	local string PlayerNameList;
	local KFGameReplicationInfo KFGRI;
	local array<PlayerReplicationInfo> WeaponSharedList;
	local bool bContentPreviouslyShared; 

	if(class'WorldInfo'.static.IsMenuLevel())
	{
		return;
	}

	bContentPreviouslyShared = bContentShared;

	KFGRI = KFGameReplicationInfo(GetPC().WorldInfo.GRI);

	if(KFGRI == none)
	{
		return;
	}

	itemCount = 0;

	UnlockManagerClass = Class'KFUnlockManager';
	
	DataProvider = CreateArray();

	//for each unlock item
	for (i = 0;i < UnlockManagerClass.default.SharedContentList.length; i++)
	{
		//if unlocked 
		if(class'KFUnlockManager'.static.IsSharedContentUnlocked(ESharedContentUnlock(i)))
		{
			bContentShared = true;
			TempWeaponObj = CreateObject("Object");
			//formulate details 
			TempWeaponObj.SetString("label", Localize(String(UnlockManagerClass.default.SharedContentList[i].Name), "ItemName", "KFGameContent"));
			TempWeaponObj.SetString("sourceText", Localize(String(UnlockManagerClass.default.SharedContentList[i].Name), "SharedUnlockSource", "KFGameContent"));
			TempWeaponObj.SetString("iconPath", "img://"$UnlockManagerClass.default.SharedContentList[i].IconPath);

			UnlockManagerClass.static.GetSharedContentPlayerList(ESharedContentUnlock(i), WeaponSharedList);
			//for each active PRI
			for (j = 0; j < WeaponSharedList.length; j++)
			{
				if(j == 0)
				{
					PlayerNameList = SharedByString  @WeaponSharedList[j].PlayerName;
				}
				else
				{
					PlayerNameList = PlayerNameList $"," @WeaponSharedList[j].PlayerName;
				}
			}
			
			TempWeaponObj.SetString("names", PlayerNameList);
			//Add Item to list
			DataProvider.SetElementObject(itemCount, TempWeaponObj);
			itemCount++;
		}
	}

	SetObject("sharedContent", DataProvider);	

	if(SharedContentButton != none )
	{
		if(bContentShared != bContentPreviouslyShared)
		{
			SharedContentButton.SetBool("enabled", bContentShared);
		}
	}
}


function GetKFPRIArray( out array<KFPlayerReplicationInfo> KFPRIArray )
{
	local PlayerController PC;
	local KFGameReplicationInfo KFGRI;

	PC = GetPC();

	if ( PC == none || PC.WorldInfo == none || PC.WorldInfo.GRI == none )
	{
	 	return;
	}

	KFGRI = KFGameReplicationInfo( GetPC().WorldInfo.GRI );
	if ( KFGRI != none )
	{
	 	KFGRI.GetKFPRIArray( KFPRIArray );
	}
}

// The party leader has modified a game option
function UpdateGameMode( string Mode )
{
	SetString("gameMode", Mode);
}

// The party leader has modified a game option
function UpdateMap( string MapName, string MapSource )
{
	ActionScriptVoid("updateMap");
}

// The party leader has modified a game option
function UpdateDifficulty( string Difficulty )
{
	SetString("difficultyText", Difficulty);
}

// The party leader has modified a game option
function UpdateLength( string Length )
{
	SetString("lengthText", Length);
}

function UpdateServerType(string ServerType)
{
	local WorldInfo WI;

	WI = class'WorldInfo'.static.GetWorldInfo();

	if( WI != none && WI.NetMode != NM_Standalone )
	{
		SetString("serverType", ServerType);
	}
}

// The party leader has modified a game option
function UpdatePrivacy( string Privacy )
{
	SetString("permissionsText", Privacy);
}

function UpdateOverviewInGame()
{
	local KFGameReplicationInfo KFGRI;
	local string GameDifficultyString;
	local Float CurrentGameDifficulty;
	local int CurrentLengthIndex, CurrentPrivacyIndex;

	KFGRI = KFGameReplicationInfo(GetPC().WorldInfo.GRI);
    if(KFGRI != none)
    {
    	SetCurrentMapInfo();

    	// Update Game mode
    	
		UpdateGameMode(KFGRI.GameClass.default.GameName);

    	// Update Difficulty
    	CurrentGameDifficulty = KFGRI.GameDifficulty;
    	if(LastDifficultyIndex != CurrentGameDifficulty)
    	{
    		GameDifficultyString =  Class'KFCommon_LocalizedStrings'.static.GetDifficultyString(CurrentGameDifficulty);
    		UpdateDifficulty(GameDifficultyString);
    		LastDifficultyIndex = CurrentGameDifficulty;
    	}
        
        CurrentLengthIndex = KFGRI.GameLength;
        if(LastLengthIndex != CurrentLengthIndex)        
        {
			UpdateLength(class'KFCommon_LocalizedStrings'.static.GetLengthString(CurrentLengthIndex));
			LastLengthIndex = CurrentLengthIndex;
        }

		UpdateServerType( class'KFCommon_LocalizedStrings'.static.GetServerTypeString(int(KFGRI.bCustom)) );
		
		if( StartMenu.OptionsComponent != none )
		{
			CurrentPrivacyIndex = StartMenu.OptionsComponent.SavedPrivacyIndex;
			if(LastPrivacyIndex != CurrentPrivacyIndex)
			{
				UpdatePrivacy( class'KFCommon_LocalizedStrings'.static.GetPermissionString(CurrentPrivacyIndex) );
				LastPrivacyIndex = CurrentPrivacyIndex;
			}
		}
    }
}

function SetCurrentMapInfo()
{
	local string CurrentMapName, FriendlyName, MapSource;

	CurrentMapName = GetPC().WorldInfo.GetMapName(true);
	MapSource = StartMenu.GetMapSource(CurrentMapName);
	FriendlyName = StartMenu.GetFriendlyMapName(CurrentMapName);
	UpdateMap(FriendlyName, MapSource);
}

defaultproperties
{
   LastDifficultyIndex=255
   LastLengthIndex=255
   LastPrivacyIndex=255
   OverviewString="MATCH OVERVIEW"
   ChangeString="CHANGE"
   SharedByString="Shared by:"
   SharedContentString="SHARED CONTENT"
   Name="Default__KFGFxStartContainer_InGameOverview"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
