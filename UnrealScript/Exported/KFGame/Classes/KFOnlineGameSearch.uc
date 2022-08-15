/**
 * Holds the base configuration settings
 *
 * NOTE: This class will normally be code generated, but the tool doesn't exist yet
 */
class KFOnlineGameSearch extends OnlineGameSearch
	native;

var public transient enum ESortOrder
{
	SORTORDER_None,
	SORTORDER_ACENDING,
	SORTODER_DECENDING,

} SortOrder;

var public transient enum ESortType
{
	SORTTYPE_Name,//alphabetic
	SORTTYPE_Mode,//alphabetic
	SORTTYPE_Difficulty,//numeric 
	SORTTYPE_Map,//alphabetic
	SORTTYPE_PlayerCount,//numeric
	SORTTYPE_WaveCount,//numeric
	SORTTYPE_Ping,//numeric
} SortType;

//Make fake results so we can test the server browser
native final function MakeFakeServerResults();
native final function SortResults(ESortType NewSortType, ESortOrder NewSortOrder);

defaultproperties
{
   GameSettingsClass=Class'KFGame.KFOnlineGameSettings'
   Name="Default__KFOnlineGameSearch"
   ObjectArchetype=OnlineGameSearch'Engine.Default__OnlineGameSearch'
}
