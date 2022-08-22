/*******************************************************************************
 * KFOnlineGameSearch generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFOnlineGameSearch extends OnlineGameSearch
    native;

enum ESortOrder
{
    SORTORDER_None,
    SORTORDER_ACENDING,
    SORTORDER_DECENDING,
    SORTORDER_MAX
};

enum ESortType
{
    SORTTYPE_None,
    SORTTYPE_Name,
    SORTTYPE_Mode,
    SORTTYPE_Difficulty,
    SORTTYPE_Map,
    SORTTYPE_PlayerCount,
    SORTTYPE_WaveCount,
    SORTTYPE_Ping,
    SORTTYPE_MAX
};

var transient KFOnlineGameSearch.ESortOrder SortOrder;
var transient KFOnlineGameSearch.ESortType SortType;
var transient int LastResultsSize;

// Export UKFOnlineGameSearch::execMakeFakeServerResults(FFrame&, void* const)
native final function MakeFakeServerResults();

// Export UKFOnlineGameSearch::execSortResults(FFrame&, void* const)
native final function SortResults(optional KFOnlineGameSearch.ESortType NewSortType, optional KFOnlineGameSearch.ESortOrder NewSortOrder)
{
    NewSortType = 0;
    NewSortOrder = 0;                
}

function bool SortIfChanged()
{
    if(Results.Length != LastResultsSize)
    {
        LastResultsSize = Results.Length;
        SortResults();
        return true;
    }
    return false;
}

defaultproperties
{
    SortOrder=ESortOrder.SORTORDER_ACENDING
    SortType=ESortType.SORTTYPE_Ping
    GameSettingsClass=Class'KFOnlineGameSettings'
}