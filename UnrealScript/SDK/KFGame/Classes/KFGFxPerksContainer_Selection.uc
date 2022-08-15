//=============================================================================
// KFGFxPerksContainer_Selection
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 9/26/2013
//=============================================================================

class KFGFxPerksContainer_Selection extends KFGFxPerksContainer;

struct PerkData
{
	var string PerkTitle;
 	var int PerkLevel;
 	var int PerkPercent;
};

var localized string HeaderTitle;
var localized string EndOfWaveString;
var localized string ChangesAppliedOnCloseString;
var localized string OncePerWaveString;

var array<PerkData> PerksData;

var KFGFxMenu_Perks PerksMenu;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetPC());
	PerksMenu = KFGFxMenu_Perks(NewParentMenu);

	super.Initialize( NewParentMenu );
	LocalizeText();
	if(KFPC != none)
	{
		UpdatePerkSelection( KFPC.SavedPerkIndex );
	}
}

function LocalizeText()
{
	local GFxObject LocalizedObject;

	LocalizedObject = CreateObject( "Object" );
	
	LocalizedObject.SetString("header", 					HeaderTitle); 
	LocalizedObject.SetString("oncePerkWave", 				OncePerWaveString);
	//LocalizedObject.SetString("endOfWave", 					EndOfWaveString);
	
	SetObject("localizedText", LocalizedObject);
}

function UpdatePerkSelection(byte SelectedPerkIndex)
{
 	local int i;
	local GFxObject DataProvider;
	local GFxObject TempObj;
	local KFPlayerController KFPC;
	local class<KFPerk> PerkClass;	
	local byte bTierUnlocked;
	local int UnlockedPerkLevel;

	KFPC = KFPlayerController( GetPC() );

	if ( KFPC != none )
	{
	   	DataProvider = CreateArray();

		for (i = 0; i < KFPC.PerkList.Length; i++)
		{
			PerkClass = KFPC.PerkList[i].PerkClass;
			class'KFPerk'.static.LoadTierUnlockFromConfig(PerkClass, bTierUnlocked, UnlockedPerkLevel);
		    TempObj = CreateObject( "Object" );
		    TempObj.SetInt( "PerkLevel", KFPC.PerkList[i].PerkLevel );
		    TempObj.SetString( "Title",  PerkClass.default.PerkName );	
			TempObj.SetString( "iconSource",  "img://"$PerkClass.static.GetPerkIconPath() );
			TempObj.SetBool("bTierUnlocked", bool(bTierUnlocked) && KFPC.PerkList[i].PerkLevel >= UnlockedPerkLevel);
			
		    DataProvider.SetElementObject( i, TempObj );
		}	
		SetObject( "perkData", DataProvider );
		SetInt("SelectedIndex", SelectedPerkIndex);

		UpdatePendingPerkInfo(SelectedPerkIndex);
    }
}

function UpdatePendingPerkInfo(byte SelectedPerkIndex)
{
	local string PerkName;
	local KFPlayerController KFPC;
	local WorldInfo TempWorldInfo;
	local KFGameReplicationInfo KFGRI;

	TempWorldInfo = class'WorldInfo'.static.GetWorldInfo();

	KFPC = KFPlayerController( GetPC() );
	KFGRI = KFGameReplicationInfo(TempWorldInfo.GRI);
	if( KFPC != none && KFGRI != none )
	{
		if(!class'WorldInfo'.static.IsMenuLevel())
		{
			if( (KFPC.bPlayerUsedUpdatePerk && !KFGRI.bTraderIsOpen) || (KFGRI.bTraderIsOpen && PerksMenu.bModifiedPerk)  && KFPC.PlayerReplicationInfo.bReadyToPlay && KFPC.WorldInfo.GRI.bMatchHasBegun)
			{
				PerkName = KFPC.PerkList[KFPC.SavedPerkIndex].PerkClass.default.PerkName;
			}
			else
			{
				PerkName = "";
			}
		}	
		
		if(KFGRI.bTraderIsOpen)
		{
			SetPendingPerkChanges(PerkName, "img://"$KFPC.PerkList[KFPC.SavedPerkIndex].PerkClass.static.GetPerkIconPath(), ChangesAppliedOnCloseString);
		}
		else
		{
			SetPendingPerkChanges(PerkName, "img://"$KFPC.PerkList[KFPC.SavedPerkIndex].PerkClass.static.GetPerkIconPath(), EndOfWaveString);
		}
	}
}

function SetPendingPerkChanges(string PerkClassName, string PerkIconPath, string Message)
{
	ActionScriptVoid("setPendingPerkChanges");
}

function SavePerk(int PerkID)
{
	local KFPlayerController KFPC;

    KFPC = KFPlayerController(GetPC());
	if ( KFPC != none )
	{
		KFPC.RequestPerkChange( PerkID );
	}
}
