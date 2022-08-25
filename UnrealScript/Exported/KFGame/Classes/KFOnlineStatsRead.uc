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

const KFMAX_Perks = 					10;

 
const VIEWID_KFGameStats =				1;

 
const STATID_None 			 =			0;

 
const STATID_Cmdo_Progress	 =			1;
const STATID_Cmdo_Build      =				2;

 
const STATID_Bsrk_Progress	 =			10;
const STATID_Bsrk_Build		 =			11;

 
const STATID_Sup_Progress	 =				20;
const STATID_Sup_Build		 =			21;
const STATID_Sup_WeldPoints	 =			22;

 
const STATID_Fire_Progress	 =			30;
const STATID_Fire_Build		 =			31;

 
const STATID_Medic_Progress		 =		40;
const STATID_Medic_Build	 =				41;
const STATID_Medic_HealPoints =				42;

 
const STATID_Shrp_Progress	 =			50;
const STATID_Shrp_Build		 =			51;

 
const STATID_Demo_Progress	=			60;
const STATID_Demo_Build		=			61;

 
const STATID_Surv_Progress	 =			70;
const STATID_Surv_Build		 =			71;

 
const STATID_Guns_Progress	 =			80;
const STATID_Guns_Build		 =			81;

 
const STATID_SWAT_Progress	 =			90;
const STATID_SWAT_Build		 =			91;

 
const STATID_Kills 			 =			200;
const STATID_StalkerKills 	 =			201;
const STATID_CrawlerKills 	 =			202;
const STATID_FleshpoundKills	 =			203;

 
const STATID_SpecialEventProgress =     300;
const STATID_WeeklyEventProgress =      301;
const STATID_DailyEventInfo =           302;
const STATID_DailyEventIDs =            303;
const STATID_DailyEventStats1 =         304;
const STATID_DailyEventStats2 =         305;

 
const STATID_DoshVaultTotal =           400;
const STATID_LastViewedDoshVaultTotal = 401;
const STATID_DoshVaultProgress =		402;

 
const STATID_AchievementPlaceholder	 =	500;

 
const STATID_AnalyticsPlaceholder	 =		800;

 
const STATID_PersonalBest_KnifeKills =		2000;
const STATID_PersonalBest_PistolKills	 =	2001;
const STATID_PersonalBest_HeadShots	 =		2002;
const STATID_PersonalBest_Healing	 =		2003;
const STATID_PersonalBest_Kills	 =		2004;
const STATID_PersonalBest_Assists =			2005;
const STATID_PersonalBest_LargeZedKill =	2006;
const STATID_PersonalBest_Dosh =			2007;

 
const STATID_MatchWins =					3000;

 
const STATID_DingoAchievementStart	= 4000;
const STATID_ACHIEVE_MrPerky5		= 4001;
const STATID_ACHIEVE_MrPerky10		= 4002;
const STATID_ACHIEVE_MrPerky15		= 4003;
const STATID_ACHIEVE_MrPerky20		= 4004;
const STATID_ACHIEVE_MrPerky25		= 4005;

const STATID_ACHIEVE_HardWins		= 4015;
const STATID_ACHIEVE_SuicidalWins	= 4016;
const STATID_ACHIEVE_HellWins		= 4017;

const STATID_ACHIEVE_VSZedWins		= 4009;
const STATID_ACHIEVE_VSHumanWins	= 4010;

const STATID_ACHIEVE_HoldOut			= 4011;
const STATID_ACHIEVE_DieVolter			= 4012;
const STATID_ACHIEVE_FleshPoundKill		= 4013;
const STATID_ACHIEVE_ShrikeKill			= 4014;
const STATID_ACHIEVE_SirenKill			= 4018;
const STATID_ACHIEVE_Benefactor			= 4019;
const STATID_ACHIEVE_HealTeam			= 4020;
const STATID_ACHIEVE_QuickOnTheTrigger	= 4033;

const STATID_ACHIEVE_CollectCatacolmbs		= 4021;
const STATID_ACHIEVE_BioticsCollectibles	= 4022;
const STATID_ACHIEVE_EvacsCollectibles		= 4023;
const STATID_ACHIEVE_OutpostCollectibles	= 4024;
const STATID_ACHIEVE_PrisonCollectibles		= 4025;
const STATID_ACHIEVE_ManorCollectibles		= 4026;
const STATID_ACHIEVE_ParisCollectibles		= 4027;
const STATID_ACHIEVE_FarmhouseCollectibles	= 4028;
const STATID_ACHIEVE_BlackForestCollectibles= 4029;
const STATID_ACHIEVE_ContainmentStationCollectibles	= 4030;
const STATID_ACHIEVE_InfernalRealmCollectibles		= 4031;
const STATID_ACHIEVE_HostileGroundsCollectibles		= 4032;
const STATID_ACHIEVE_ZedLandingCollectibles			= 4035;
const STATID_ACHIEVE_DescentCollectibles			= 4036;
const STATID_ACHIEVE_NukedCollectibles				= 4037;
const STATID_ACHIEVE_TragicKingdomCollectibles		= 4038;
const STATID_ACHIEVE_NightmareCollectibles			= 4039;
const STATID_ACHIEVE_KrampusCollectibles			= 4040;
const STATID_ACHIEVE_ArenaCollectibles				= 4041;
const STATID_ACHIEVE_PowercoreCollectibles			= 4042;
 
#linenumber 14

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
		WarnInternal("##########################################################################");
		WarnInternal("KFOnlineStatsRead: Unable to get Steam statistics.  Stats will not be set!");
		WarnInternal("##########################################################################");
	}
	else
	{
		OnReadComplete();
	}
}

native function NativeOnReadComplete();

event OnReadComplete()
{
	NativeOnReadComplete();
	if (bLogStatsRead) LogInternal("KFOnlineStatsRead: OnReadComplete called, Rows[0].Columns.Length=" $ Rows[0].Columns.Length @ "self:'"$self$"'",'DevOnline');

}

defaultproperties
{
   ViewId=1
   ColumnIds(0)=1
   ColumnIds(1)=2
   ColumnIds(2)=10
   ColumnIds(3)=11
   ColumnIds(4)=20
   ColumnIds(5)=21
   ColumnIds(6)=30
   ColumnIds(7)=31
   ColumnIds(8)=40
   ColumnIds(9)=41
   ColumnIds(10)=50
   ColumnIds(11)=51
   ColumnIds(12)=60
   ColumnIds(13)=61
   ColumnIds(14)=70
   ColumnIds(15)=71
   ColumnIds(16)=80
   ColumnIds(17)=81
   ColumnIds(18)=90
   ColumnIds(19)=91
   ColumnIds(20)=200
   ColumnIds(21)=201
   ColumnIds(22)=22
   ColumnIds(23)=42
   ColumnIds(24)=202
   ColumnIds(25)=203
   ColumnIds(26)=300
   ColumnIds(27)=301
   ColumnIds(28)=302
   ColumnIds(29)=303
   ColumnIds(30)=304
   ColumnIds(31)=305
   ColumnIds(32)=2000
   ColumnIds(33)=2001
   ColumnIds(34)=2002
   ColumnIds(35)=2003
   ColumnIds(36)=2004
   ColumnIds(37)=2005
   ColumnIds(38)=2006
   ColumnIds(39)=2007
   ColumnIds(40)=3000
   ColumnIds(41)=400
   ColumnIds(42)=401
   ColumnIds(43)=402
   ColumnMappings(0)=(Id=1,Name="CmdoProgress")
   ColumnMappings(1)=(Id=2,Name="CmdoBuild")
   ColumnMappings(2)=(Id=10,Name="BsrkProgress")
   ColumnMappings(3)=(Id=11,Name="BsrkBuild")
   ColumnMappings(4)=(Id=20,Name="SupProgress")
   ColumnMappings(5)=(Id=21,Name="SupBuild")
   ColumnMappings(6)=(Id=30,Name="FireProgress")
   ColumnMappings(7)=(Id=31,Name="FireBuild")
   ColumnMappings(8)=(Id=40,Name="MedicProgress")
   ColumnMappings(9)=(Id=41,Name="MedicBuild")
   ColumnMappings(10)=(Id=50,Name="ShrpProgress")
   ColumnMappings(11)=(Id=51,Name="ShrpBuild")
   ColumnMappings(12)=(Id=60,Name="DemoProgress")
   ColumnMappings(13)=(Id=61,Name="DemoBuild")
   ColumnMappings(14)=(Id=70,Name="SurvProgress")
   ColumnMappings(15)=(Id=71,Name="SurvBuild")
   ColumnMappings(16)=(Id=80,Name="GunsProgress")
   ColumnMappings(17)=(Id=81,Name="GunsBuild")
   ColumnMappings(18)=(Id=90,Name="SWATProgress")
   ColumnMappings(19)=(Id=91,Name="SwatBuild")
   ColumnMappings(20)=(Id=200,Name="Kills")
   ColumnMappings(21)=(Id=201,Name="StalkerKills")
   ColumnMappings(22)=(Id=22,Name="SupWeldPoints")
   ColumnMappings(23)=(Id=42,Name="MedicHealPoints")
   ColumnMappings(24)=(Id=202,Name="CrawlerKills")
   ColumnMappings(25)=(Id=203,Name="FleshPoundKills")
   ColumnMappings(26)=(Id=300,Name="SpecialEventProgress")
   ColumnMappings(27)=(Id=301,Name="WeeklyEventProgress")
   ColumnMappings(28)=(Id=302,Name="DailyEventProgress")
   ColumnMappings(29)=(Id=303,Name="DailyEventIDs")
   ColumnMappings(30)=(Id=304,Name="DailyEventStats1")
   ColumnMappings(31)=(Id=305,Name="DailyEventStats2")
   ColumnMappings(32)=(Id=2000,Name="PersonalBestKnifeKills")
   ColumnMappings(33)=(Id=2001,Name="PersonalBestPistolKills")
   ColumnMappings(34)=(Id=2002,Name="PersonalBestHeadshots")
   ColumnMappings(35)=(Id=2003,Name="PersonalBestHealing")
   ColumnMappings(36)=(Id=2004,Name="PersonalBestKills")
   ColumnMappings(37)=(Id=2005,Name="PersonalBestAssists")
   ColumnMappings(38)=(Id=2006,Name="PersonalBestLargeZedKills")
   ColumnMappings(39)=(Id=2007,Name="PersonalBestDosh")
   ColumnMappings(40)=(Id=3000,Name="MatchWins")
   ColumnMappings(41)=(Id=400,Name="DoshVaultTotal")
   ColumnMappings(42)=(Id=401,Name="LastViewedDoshVaultTotal")
   ColumnMappings(43)=(Id=402,Name="DoshVaultProgress")
   Name="Default__KFOnlineStatsRead"
   ObjectArchetype=OnlineStatsRead'Engine.Default__OnlineStatsRead'
}
