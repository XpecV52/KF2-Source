//This class is to keep track and look up the id-item matches so we can pass them to a matinee.  

class KFInventoryCatalog extends Object;

enum ECrateSeries
{
	ECrate_ZedKiller,
	ECrate_StoriesOfWar,
	ECrate_CyberBone,
	ECrate_HorzineIssue,
	ECrate_DragonFire,
	ECrate_StreetPunks,
	ECrate_FirstEncounter,
	ECrate_Predator,
	Ecrate_TacticalHorzine,
	Ecrate_EmergencyIssue,
	Ecrate_Swat,
	Ecrate_Exhibit,
	ECrate_HorzineSupply_S1,
	ECrate_HorzineSupply_S2,
	ECrate_HorzineSupply_S3,
	ECrate_HorzineSupply_S4,
	ECrate_HorzineSupply_S5,
	ECrate_HorzineSupply_S6,
	ECrate_HorzineSupply_S7,
	ECrate_HorzineSupply_S8,
};

enum EItemDisplayContainerType
{
	IDT_None,
	IDT_Crate,
	IDT_USB,
};

struct ItemCatalogEntry
{
	var int ContainerID;
	var int KeyID;
	var name ItemSeriesName;
	var EItemDisplayContainerType ContainerType;
};

var() array<ItemCatalogEntry> ItemKeyArray;

static function EItemDisplayContainerType GetItemDisplayContainerType(int ItemID)
{
	local int i;

	for (i = 0; i < default.ItemKeyArray.length; i++)
	{
		if(default.ItemKeyArray[i].ContainerID == ItemID || default.ItemKeyArray[i].KeyID == ItemID)
		{
			return default.ItemKeyArray[i].ContainerType;
		}
	}

	return IDT_None;
}

static function name GetItemSeries(int ItemID)
{
	local int i;

	for (i = 0; i < default.ItemKeyArray.length; i++)
	{
		if(default.ItemKeyArray[i].ContainerID == ItemID || default.ItemKeyArray[i].KeyID == ItemID)
		{
			return default.ItemKeyArray[i].ItemSeriesName;
		}
	}

	return '';
}

DefaultProperties
{
	//defaults
	ItemKeyArray[ECrate_ZedKiller]=(ContainerID=3174, KeyID=3178, ItemSeriesName=zedkiller, ContainerType=IDT_USB)
	ItemKeyArray[ECrate_StoriesOfWar]=(ContainerID=3180, KeyID=3179, ItemSeriesName=sow, ContainerType=IDT_USB)
	ItemKeyArray[ECrate_CyberBone]=(ContainerID=3181, KeyID=3182, ItemSeriesName=cyberbone, ContainerType=IDT_USB)
	ItemKeyArray[ECrate_HorzineIssue]=(ContainerID=3274, KeyID=3275, ItemSeriesName=horzineissue, ContainerType=IDT_USB)
	ItemKeyArray[ECrate_DragonFire]=(ContainerID=3280, KeyID=3281, ItemSeriesName=dragonfire, ContainerType=IDT_USB)
	ItemKeyArray[ECrate_StreetPunks]=(ContainerID=3596, KeyID=3597, ItemSeriesName=streetpunks, ContainerType=IDT_USB)
	ItemKeyArray[ECrate_FirstEncounter]=(ContainerID=3896, KeyID=3895, ItemSeriesName=firstencounter, ContainerType=IDT_USB)
	ItemKeyArray[ECrate_Predator]=(ContainerID=3592, KeyID=3593, ItemSeriesName=predator, ContainerType=IDT_USB)
	ItemKeyArray[Ecrate_TacticalHorzine]=(ContainerID=3590, KeyID=3591, ItemSeriesName=tacticalhorzine, ContainerType=IDT_USB)
	ItemKeyArray[Ecrate_EmergencyIssue]=(ContainerID=3594, KeyID=3595, ItemSeriesName=emergencyissue, ContainerType=IDT_USB)
	ItemKeyArray[Ecrate_Swat]=(ContainerID=4134, KeyID=4135, ItemSeriesName=swat, ContainerType=IDT_USB)
	ItemKeyArray[Ecrate_Exhibit]=(ContainerID=4115, KeyID=4114, ItemSeriesName=exhibit, ContainerType=IDT_USB)
	ItemKeyArray[ECrate_HorzineSupply_S1]=(ContainerID=3284, KeyID=3282, ItemSeriesName=horzine1, ContainerType=IDT_Crate)
	ItemKeyArray[ECrate_HorzineSupply_S2]=(ContainerID=3285, KeyID=3283, ItemSeriesName=horzine2, ContainerType=IDT_Crate)
	ItemKeyArray[ECrate_HorzineSupply_S3]=(ContainerID=3598, KeyID=3599, ItemSeriesName=horzine3, ContainerType=IDT_Crate)
	ItemKeyArray[ECrate_HorzineSupply_S4]=(ContainerID=3600, KeyID=3601, ItemSeriesName=horzine4, ContainerType=IDT_Crate)
	ItemKeyArray[ECrate_HorzineSupply_S5]=(ContainerID=3882, KeyID=3880, ItemSeriesName=horzine5, ContainerType=IDT_Crate)
	ItemKeyArray[ECrate_HorzineSupply_S6]=(ContainerID=3883, KeyID=3881, ItemSeriesName=horzine6, ContainerType=IDT_Crate)
	ItemKeyArray[ECrate_HorzineSupply_S7]=(ContainerID=4107, KeyID=4105, ItemSeriesName=horzine7, ContainerType=IDT_Crate)
	ItemKeyArray[ECrate_HorzineSupply_S8]=(ContainerID=4108, KeyID=4106, ItemSeriesName=horzine8, ContainerType=IDT_Crate)
}