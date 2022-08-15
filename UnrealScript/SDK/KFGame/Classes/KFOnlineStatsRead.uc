//=============================================================================
// KFOnlineStatsRead
//=============================================================================
// The KF 2 game stats class that holds and modifies the read stats data
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Joshua Rowan 3/4/2014
//=============================================================================

class KFOnlineStatsRead extends OnlineStatsRead
	native;

`include(KFOnlineStats.uci)

var	KFOnlineStatsWrite		LinkedWriteObject;

var	UniqueNetID OwningUniqueID;
/** Sets when Steam's UserStatsReceived callback triggers. */
var EOnlineEnumerationReadState UserStatsReceivedState;

/** Debugging */
var 		bool 	bLogStatsRead;

function OnStatsInitialized(bool bWasSuccessful)
{
	if( !bWasSuccessful)
	{
		`warn("##########################################################################");
		`warn("KFOnlineStatsRead: Unable to get Steam statistics.  Stats will not be set!");
		`warn("##########################################################################");
	}
	else
	{
		OnReadComplete();
	}
}

event OnReadComplete()
{
	local int j;
	local float FloatValue;

	`log("KFOnlineStatsRead: OnReadComplete called, Rows[0].Columns.Length=" $ Rows[0].Columns.Length, bLogStatsRead, 'DevOnline');
	for ( j = 0; j < Rows[0].Columns.Length; j++ )
	{
		switch(Rows[0].Columns[j].StatValue.Type)
		{
			case SDT_Int32:
				LinkedWriteObject.SetIntStat(ColumnIds[j], Rows[0].Columns[j].StatValue.Value1);
				FloatValue = Rows[0].Columns[j].StatValue.Value1;
				`log("OnReadComplete - " @ j @ "IntStat["$ColumnIds[j]$"]="$Rows[0].Columns[j].StatValue.Value1 @ LinkedWriteObject.Properties[j].Data.Value1, bLogStatsRead);
				break;

			case SDT_Float:
				GetFloatStatValueForPlayer(Rows[0].PlayerId, j, FloatValue);
				LinkedWriteObject.SetFloatStat(ColumnIds[j], FloatValue);
				`log("OnReadComplete - FloatStat["$ColumnIds[j]$"]="$FloatValue, bLogStatsRead);
				break;
		}

		LinkedWriteObject.CacheStatsValue(ColumnIds[j], FloatValue);
	}

	LinkedWriteObject.GetAchievements();
	LinkedWriteObject.MyKFPC.ClientInitializePerks();
}

defaultproperties
{
	bLogStatsRead=false
	
	ViewId=`VIEWID_KFGameStats

	ColumnIds.Add(`STATID_Cmdo_Progress)
	ColumnIds.Add(`STATID_Cmdo_Build)
	ColumnIds.Add(`STATID_Bsrk_Progress)
	ColumnIds.Add(`STATID_Bsrk_Build)
	ColumnIds.Add(`STATID_Sup_Progress)
	ColumnIds.Add(`STATID_Sup_Build)
	ColumnIds.Add(`STATID_Fire_Progress)
	ColumnIds.Add(`STATID_Fire_Build)
	ColumnIds.Add(`STATID_Medic_Progress)
	ColumnIds.Add(`STATID_Medic_Build)
	ColumnIds.Add(`STATID_Shrp_Progress)
	ColumnIds.Add(`STATID_Shrp_Build)
	ColumnIds.Add(`STATID_Demo_Progress)
	ColumnIds.Add(`STATID_Demo_Build)
	ColumnIds.Add(`STATID_Ninja_Progress)
	ColumnIds.Add(`STATID_Ninja_Build)
	ColumnIds.Add(`STATID_Guns_Progress)
	ColumnIds.Add(`STATID_Guns_Build)
	ColumnIds.Add(`STATID_SWAT_Progress)
	ColumnIds.Add(`STATID_SWAT_Build)
	ColumnIds.Add(`STATID_Kills)
	ColumnIds.Add(`STATID_StalkerKills)
	ColumnIds.Add(`STATID_Sup_WeldPoints)
	ColumnIds.Add(`STATID_Medic_HealPoints)
	ColumnIds.Add(`STATID_CrawlerKills)
	ColumnIds.Add(`STATID_FleshpoundKills)
	ColumnIds.Add(`STATID_PersonalBest_KnifeKills)
	ColumnIds.Add(`STATID_PersonalBest_PistolKills)
	ColumnIds.Add(`STATID_PersonalBest_HeadShots)
	ColumnIds.Add(`STATID_PersonalBest_Healing)
	ColumnIds.Add(`STATID_PersonalBest_Kills)
	ColumnIds.Add(`STATID_PersonalBest_Assists)
	ColumnIds.Add(`STATID_PersonalBest_LargeZedKill)
	ColumnIds.Add(`STATID_PersonalBest_Dosh)

	
	ColumnMappings.Add((Id=`STATID_Cmdo_Progress))
	ColumnMappings.Add((Id=`STATID_Cmdo_Build))
	ColumnMappings.Add((Id=`STATID_Bsrk_Progress))
	ColumnMappings.Add((Id=`STATID_Bsrk_Build))
	ColumnMappings.Add((Id=`STATID_Sup_Progress))
	ColumnMappings.Add((Id=`STATID_Sup_Build))
	ColumnMappings.Add((Id=`STATID_Fire_Progress))
	ColumnMappings.Add((Id=`STATID_Fire_Build))
	ColumnMappings.Add((Id=`STATID_Medic_Progress))
	ColumnMappings.Add((Id=`STATID_Medic_Build))
	ColumnMappings.Add((Id=`STATID_Shrp_Progress))
	ColumnMappings.Add((Id=`STATID_Shrp_Build))
	ColumnMappings.Add((Id=`STATID_Demo_Progress))
	ColumnMappings.Add((Id=`STATID_Demo_Build))
	ColumnMappings.Add((Id=`STATID_Ninja_Progress))
	ColumnMappings.Add((Id=`STATID_Ninja_Build))
	ColumnMappings.Add((Id=`STATID_Guns_Progress))
	ColumnMappings.Add((Id=`STATID_Guns_Build))
	ColumnMappings.Add((Id=`STATID_SWAT_Progress))
	ColumnMappings.Add((Id=`STATID_SWAT_Build))
	ColumnMappings.Add((Id=`STATID_Kills))
	ColumnMappings.Add((Id=`STATID_StalkerKills))
	ColumnMappings.Add((Id=`STATID_Sup_WeldPoints))
	ColumnMappings.Add((Id=`STATID_Medic_HealPoints))
	ColumnMappings.Add((Id=`STATID_CrawlerKills))
	ColumnMappings.Add((Id=`STATID_FleshpoundKills))
	ColumnMappings.Add((Id=`STATID_PersonalBest_KnifeKills))
	ColumnMappings.Add((Id=`STATID_PersonalBest_PistolKills))
	ColumnMappings.Add((Id=`STATID_PersonalBest_HeadShots))
	ColumnMappings.Add((Id=`STATID_PersonalBest_Healing))
	ColumnMappings.Add((Id=`STATID_PersonalBest_Kills))
	ColumnMappings.Add((Id=`STATID_PersonalBest_Assists))
	ColumnMappings.Add((Id=`STATID_PersonalBest_LargeZedKill))
	ColumnMappings.Add((Id=`STATID_PersonalBest_Dosh))
}
