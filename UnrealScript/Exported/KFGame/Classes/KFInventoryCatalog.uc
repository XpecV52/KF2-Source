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
	Ecrate_EliteMedic,
	Ecrate_Victorian,
	Ecrate_MaceShield,
	ECrate_HorzineSupply_S1,
	ECrate_HorzineSupply_S2,
	ECrate_HorzineSupply_S3,
	ECrate_HorzineSupply_S4,
	ECrate_HorzineSupply_S5,
	ECrate_HorzineSupply_S6,
	ECrate_HorzineSupply_S7,
	ECrate_HorzineSupply_S8,
	ECrate_HorzineSupply_S9,
	ECrate_PSNHorzineSupply_CS1,
	ECrate_PSNHorzineSupply_CS2,
	ECrate_PSNHorzineSupply_CS3,
	ECrate_PSNHorzineSupply_WS1,
	ECrate_PSNHorzineSupply_WS2,
	ECrate_PSNHorzineSupply_WS3,
	ECrate_PSNHorzineSupply_WS4,
	ECrate_PSNHorzineSupply_WS5,
	ECrate_PSNHorzineSupply_E1,
	ECrate_PSNHorzineSupply_E2,
	ECrate_HorzineSupply_S10,
	ECrate_HorzineSupply_S11,
	ECrate_Emote_S1,
	Ecrate_TacticalHorzineMKII,
	ECrate_HorzineSupply_S12,
	ECrate_Deepstrike,
	ECrate_HorzineSupply_S13,
	ECrate_HighVoltage,
	ECrate_Flare,
	ECrate_HorzineSupply_S14,
	ECrate_Junkyard,
	ECrate_Vietnam,
	ECrate_Emote_S2,
	ECrate_HorzineSupply_S16,
	ECrate_Neon,
	ECrate_Vault,
	ECrate_HorzineSupply_S15,
	ECrate_PSNHorzineSupply_WS15,
	ECrate_Vault_Test,
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
   ItemKeyArray(0)=(ContainerId=3174,KeyId=3178,ItemSeriesName="zedkiller",ContainerType=IDT_USB)
   ItemKeyArray(1)=(ContainerId=3180,KeyId=3179,ItemSeriesName="sow",ContainerType=IDT_USB)
   ItemKeyArray(2)=(ContainerId=3181,KeyId=3182,ItemSeriesName="cyberbone",ContainerType=IDT_USB)
   ItemKeyArray(3)=(ContainerId=3274,KeyId=3275,ItemSeriesName="horzineissue",ContainerType=IDT_USB)
   ItemKeyArray(4)=(ContainerId=3280,KeyId=3281,ItemSeriesName="dragonfire",ContainerType=IDT_USB)
   ItemKeyArray(5)=(ContainerId=3596,KeyId=3597,ItemSeriesName="streetpunks",ContainerType=IDT_USB)
   ItemKeyArray(6)=(ContainerId=3896,KeyId=3895,ItemSeriesName="firstencounter",ContainerType=IDT_USB)
   ItemKeyArray(7)=(ContainerId=3592,KeyId=3593,ItemSeriesName="predator",ContainerType=IDT_USB)
   ItemKeyArray(8)=(ContainerId=3590,KeyId=3591,ItemSeriesName="tacticalhorzine",ContainerType=IDT_USB)
   ItemKeyArray(9)=(ContainerId=3594,KeyId=3595,ItemSeriesName="emergencyissue",ContainerType=IDT_USB)
   ItemKeyArray(10)=(ContainerId=4134,KeyId=4135,ItemSeriesName="Swat",ContainerType=IDT_USB)
   ItemKeyArray(11)=(ContainerId=4115,KeyId=4114,ItemSeriesName="exhibit",ContainerType=IDT_USB)
   ItemKeyArray(12)=(ContainerId=4145,KeyId=4144,ItemSeriesName="elitemedic",ContainerType=IDT_USB)
   ItemKeyArray(13)=(ContainerId=4214,KeyId=4215,ItemSeriesName="victorian",ContainerType=IDT_USB)
   ItemKeyArray(14)=(ContainerId=4561,KeyId=4562,ItemSeriesName="maceshield",ContainerType=IDT_USB)
   ItemKeyArray(15)=(ContainerId=3284,KeyId=3282,ItemSeriesName="horzine1",ContainerType=IDT_Crate)
   ItemKeyArray(16)=(ContainerId=3285,KeyId=3283,ItemSeriesName="horzine2",ContainerType=IDT_Crate)
   ItemKeyArray(17)=(ContainerId=3598,KeyId=3599,ItemSeriesName="horzine3",ContainerType=IDT_Crate)
   ItemKeyArray(18)=(ContainerId=3600,KeyId=3601,ItemSeriesName="horzine4",ContainerType=IDT_Crate)
   ItemKeyArray(19)=(ContainerId=3882,KeyId=3880,ItemSeriesName="horzine5",ContainerType=IDT_Crate)
   ItemKeyArray(20)=(ContainerId=3883,KeyId=3881,ItemSeriesName="horzine6",ContainerType=IDT_Crate)
   ItemKeyArray(21)=(ContainerId=4107,KeyId=4105,ItemSeriesName="horzine7",ContainerType=IDT_Crate)
   ItemKeyArray(22)=(ContainerId=4108,KeyId=4106,ItemSeriesName="horzine8",ContainerType=IDT_Crate)
   ItemKeyArray(23)=(ContainerId=4207,KeyId=4208,ItemSeriesName="horzine9",ContainerType=IDT_Crate)
   ItemKeyArray(24)=(ContainerId=4304,KeyId=4303,ItemSeriesName="psncrate_cs1",ContainerType=IDT_Crate)
   ItemKeyArray(25)=(ContainerId=4305,KeyId=4303,ItemSeriesName="psncrate_cs2",ContainerType=IDT_Crate)
   ItemKeyArray(26)=(ContainerId=5371,KeyId=4303,ItemSeriesName="psncrate_cs3",ContainerType=IDT_Crate)
   ItemKeyArray(27)=(ContainerId=4307,KeyId=4303,ItemSeriesName="psncrate_ws1",ContainerType=IDT_Crate)
   ItemKeyArray(28)=(ContainerId=4306,KeyId=4303,ItemSeriesName="psncrate_ws2",ContainerType=IDT_Crate)
   ItemKeyArray(29)=(ContainerId=4569,KeyId=4303,ItemSeriesName="psncrate_ws3",ContainerType=IDT_Crate)
   ItemKeyArray(30)=(ContainerId=4790,KeyId=4303,ItemSeriesName="psncrate_ws4",ContainerType=IDT_Crate)
   ItemKeyArray(31)=(ContainerId=5369,KeyId=4303,ItemSeriesName="psncrate_ws5",ContainerType=IDT_Crate)
   ItemKeyArray(32)=(ContainerId=5646,KeyId=4303,ItemSeriesName="emote1",ContainerType=IDT_Crate)
   ItemKeyArray(33)=(ContainerId=5647,KeyId=4303,ItemSeriesName="emote2",ContainerType=IDT_Crate)
   ItemKeyArray(34)=(ContainerId=4499,KeyId=4501,ItemSeriesName="horzine10",ContainerType=IDT_Crate)
   ItemKeyArray(35)=(ContainerId=4500,KeyId=4502,ItemSeriesName="horzine11",ContainerType=IDT_Crate)
   ItemKeyArray(36)=(ContainerId=4541,KeyId=4540,ItemSeriesName="emote1",ContainerType=IDT_Crate)
   ItemKeyArray(37)=(ContainerId=4514,KeyId=4513,ItemSeriesName="tacticalhorzineII",ContainerType=IDT_USB)
   ItemKeyArray(38)=(ContainerId=4604,KeyId=4603,ItemSeriesName="horzine12",ContainerType=IDT_Crate)
   ItemKeyArray(39)=(ContainerId=4593,KeyId=4594,ItemSeriesName="deepstrike",ContainerType=IDT_USB)
   ItemKeyArray(40)=(ContainerId=4776,KeyId=4775,ItemSeriesName="horzine13",ContainerType=IDT_Crate)
   ItemKeyArray(41)=(ContainerId=4786,KeyId=4785,ItemSeriesName="highvoltage",ContainerType=IDT_USB)
   ItemKeyArray(42)=(ContainerId=4802,KeyId=4801,ItemSeriesName="Flare",ContainerType=IDT_USB)
   ItemKeyArray(43)=(ContainerId=5010,KeyId=5011,ItemSeriesName="horzine14",ContainerType=IDT_Crate)
   ItemKeyArray(44)=(ContainerId=4993,KeyId=4994,ItemSeriesName="junkyard",ContainerType=IDT_USB)
   ItemKeyArray(45)=(ContainerId=4979,KeyId=4980,ItemSeriesName="vietnam",ContainerType=IDT_USB)
   ItemKeyArray(46)=(ContainerId=5143,KeyId=5142,ItemSeriesName="emote2",ContainerType=IDT_Crate)
   ItemKeyArray(47)=(ContainerId=5240,KeyId=5241,ItemSeriesName="horzine16",ContainerType=IDT_Crate)
   ItemKeyArray(48)=(ContainerId=5194,KeyId=5195,ItemSeriesName="neon",ContainerType=IDT_USB)
   ItemKeyArray(49)=(ContainerId=5313,KeyId=-1,ItemSeriesName="vaultcrate",ContainerType=IDT_Crate)
   ItemKeyArray(50)=(ContainerId=5233,KeyId=5234,ItemSeriesName="horzine15",ContainerType=IDT_Crate)
   ItemKeyArray(51)=(ContainerId=5642,KeyId=4303,ItemSeriesName="horzine15",ContainerType=IDT_Crate)
   ItemKeyArray(52)=(ContainerId=5613,KeyId=-1,ItemSeriesName="vaultcrate_test",ContainerType=IDT_Crate)
   Name="Default__KFInventoryCatalog"
   ObjectArchetype=Object'Core.Default__Object'
}
