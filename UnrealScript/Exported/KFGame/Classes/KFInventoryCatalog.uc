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
	ECrate_HorzineSupply_S1,
	ECrate_HorzineSupply_S2,
	ECrate_HorzineSupply_S3,
	ECrate_HorzineSupply_S4,
	ECrate_HorzineSupply_S5,
	ECrate_HorzineSupply_S6,
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

defaultproperties
{
   ItemKeyArray(0)=(ContainerID=3174,KeyId=3178,ItemSeriesName="zedkiller",ContainerType=IDT_USB)
   ItemKeyArray(1)=(ContainerID=3180,KeyId=3179,ItemSeriesName="sow",ContainerType=IDT_USB)
   ItemKeyArray(2)=(ContainerID=3181,KeyId=3182,ItemSeriesName="cyberbone",ContainerType=IDT_USB)
   ItemKeyArray(3)=(ContainerID=3274,KeyId=3275,ItemSeriesName="horzineissue",ContainerType=IDT_USB)
   ItemKeyArray(4)=(ContainerID=3280,KeyId=3281,ItemSeriesName="dragonfire",ContainerType=IDT_USB)
   ItemKeyArray(5)=(ContainerID=3596,KeyId=3597,ItemSeriesName="streetpunks",ContainerType=IDT_USB)
   ItemKeyArray(6)=(ContainerID=3896,KeyId=3895,ItemSeriesName="firstencounter",ContainerType=IDT_USB)
   ItemKeyArray(7)=(ContainerID=3592,KeyId=3593,ItemSeriesName="predator",ContainerType=IDT_USB)
   ItemKeyArray(8)=(ContainerID=3590,KeyId=3591,ItemSeriesName="tacticalhorzine",ContainerType=IDT_USB)
   ItemKeyArray(9)=(ContainerID=3594,KeyId=3595,ItemSeriesName="emergencyissue",ContainerType=IDT_USB)
   ItemKeyArray(10)=(ContainerID=3284,KeyId=3282,ItemSeriesName="horzine1",ContainerType=IDT_Crate)
   ItemKeyArray(11)=(ContainerID=3285,KeyId=3283,ItemSeriesName="horzine2",ContainerType=IDT_Crate)
   ItemKeyArray(12)=(ContainerID=3598,KeyId=3599,ItemSeriesName="horzine3",ContainerType=IDT_Crate)
   ItemKeyArray(13)=(ContainerID=3600,KeyId=3601,ItemSeriesName="horzine4",ContainerType=IDT_Crate)
   ItemKeyArray(14)=(ContainerID=3882,KeyId=3880,ItemSeriesName="horzine5",ContainerType=IDT_Crate)
   ItemKeyArray(15)=(ContainerID=3883,KeyId=3881,ItemSeriesName="horzine6",ContainerType=IDT_Crate)
   Name="Default__KFInventoryCatalog"
   ObjectArchetype=Object'Core.Default__Object'
}
