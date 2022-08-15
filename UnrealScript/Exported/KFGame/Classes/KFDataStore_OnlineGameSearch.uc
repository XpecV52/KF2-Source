//=============================================================================
// KFDataStore_OnlineGameSearch
//=============================================================================
// Data store which holds Game Searches.
//=============================================================================
// Killing Floor 2 Source
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

/**
 * This game search data store handles generating and receiving results for internet queries of all gametypes.
 */
class KFDataStore_OnlineGameSearch extends UIDataStore_OnlineGameSearch
	native(UI)
	config(UI);

function OnSearchComplete(bool bWasSuccessful)
{
	super.OnSearchComplete(bWasSuccessful);
}

native function bool FindServerPlayerList(int SelectedServerIndex);
native function CancelFindServerPlayerList();

native function KFOnlineGameSearch GetActiveKFGameSearch();
native function KFOnlineGameSearch GetCurrentKFGameSearch();

defaultproperties
{
   GameSearchCfgList(0)=(GameSearchClass=Class'KFGame.KFOnlineGameSearch',DefaultGameSettingsClass=Class'KFGame.KFOnlineGameSettings',SearchResultsProviderClass=Class'KFGame.KFUIDataProvider_SearchResult',SearchName="KFGameSearch")
   Tag="KFGameSearch"
   Name="Default__KFDataStore_OnlineGameSearch"
   ObjectArchetype=UIDataStore_OnlineGameSearch'Engine.Default__UIDataStore_OnlineGameSearch'
}
