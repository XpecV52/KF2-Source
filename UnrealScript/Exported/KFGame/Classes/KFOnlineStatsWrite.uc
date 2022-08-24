//=============================================================================
// KFOnlineStatsWrite
//=============================================================================
// The KF2 game stats writer
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Joshua Rowan 3/4/2014
//=============================================================================

class KFOnlineStatsWrite extends OnlineStatsWrite
	native
	config(game);

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
const STATID_ACHIEVE_TragicKingdomCollectibles      = 4038;
 
#linenumber 15





































	














#linenumber 16;

const	WeldingPointsRequired = 510;
const	HealingPointsRequired = 10;
const 	MaxPerkLevel = 25;
const 	MaxPrestigeLevel = 10;

//Event consts
const   SpecialEventObjectiveCountMax = 8;

/** Cached PC */
var KFPlayerController MyKFPC;

/** Cached general stats */
var	private	int		Kills;
var private	int 	StalkerKills;
var private	int 	CrawlerKills;
var private	int 	FleshPoundKills;
var private int 	WeldingPoints;
var private int 	HealingPoints;

/** Cached perk XP and build stats */
var private int 	CommandoXP, CommandoLVL, CommandoPSG;
var private int 	CommandoBuild;
var private int 	BerserkerXP, BerserkerLVL, BerserkerPSG;
var private int 	BerserkerBuild;
var private int 	SupportXP, SupportLVL, SupportPSG;
var private int 	SupportBuild;
var private	int 	MedicXP, MedicLVL, MedicPSG;
var private	int 	MedicBuild;
var private	int 	FirebugXP, FirebugLVL, FirebugPSG;
var private	int 	FirebugBuild;
var private	int 	DemoXP, DemoLVL, DemoPSG;
var private	int 	DemoBuild;
var private	int 	GunslingerXP, GunslingerLVL, GunslingerPSG;
var private	int 	GunslingerBuild;
var private	int 	SharpshooterXP, SharpshooterLVL, SharpshooterPSG;
var private	int 	SharpshooterBuild;
var private	int 	SwatXP, SwatLVL, SwatPSG;
var private	int 	SwatBuild;
var private	int 	SurvXP, SurvLVL, SurvPSG;
var private	int 	SurvBuild;

var private int 	PersonalBest_KnifeKills;
var private int 	PersonalBest_PistolKills;
var private int 	PersonalBest_HeadShots;
var private int 	PersonalBest_Healing;
var private int 	PersonalBest_Kills;
var private int 	PersonalBest_Assists;
var private int 	PersonalBest_LargeZedKil;
var private int 	PersonalBest_Dosh;

/** Cached Event Stats */
var private int     SpecialEventInfo;
var private int     InitialSpecialEventInfo;
var private int     WeeklyEventInfo;
var private int     InitialWeeklyEventInfo;

/** Achievement IDs **/
// ids must be sequential (no gaps)
const KFACHID_ParisNormal						=	0;
const KFACHID_ParisHard 						=	1;
const KFACHID_ParisSuicidal						=	2;
const KFACHID_ParisHellOnEarth					=	3;
const KFACHID_OutpostNormal 					=	4;
const KFACHID_OutpostHard						=	5;
const KFACHID_OutpostSuicidal					=	6;
const KFACHID_OutpostHellOnEarth				=	7;
const KFACHID_BioticsNormal 					=	8;
const KFACHID_BioticsHard  						=	9;
const KFACHID_BioticsSuicidal					=	10;
const KFACHID_BioticsHellOnEarth				=	11;
const KFACHID_ManorNormal	 					=	12;
const KFACHID_ManorHard  						=	13;
const KFACHID_ManorSuicidal						=	14;
const KFACHID_ManorHellOnEarth					=	15;

const KFACHID_ParisCollectibles					= 	16;
const KFACHID_OutpostCollectibles				= 	17;
const KFACHID_BioticsCollectibles				= 	18;
const KFACHID_ManorCollectibles					= 	19;

const KFACHID_EvacNormal 						=	20;
const KFACHID_EvacHard  						=	21;
const KFACHID_EvacSuicidal						=	22;
const KFACHID_EvacHellOnEarth					=	23;
const KFACHID_CatacombsNormal	 				=	24;
const KFACHID_CatacombsHard  					=	25;
const KFACHID_CatacombsSuicidal					=	26;
const KFACHID_CatacombsHellOnEarth				=	27;

const KFACHID_EvacsCollectibles					= 	28;
const KFACHID_CatacombsCollectibles				= 	29;

const KFACHID_Berserker_Lvl5					= 	30;
const KFACHID_Berserker_Lvl10					= 	31;
const KFACHID_Berserker_Lvl15					= 	32;
const KFACHID_Berserker_Lvl20					= 	33;
const KFACHID_Berserker_Lvl25					= 	34;
const KFACHID_FieldMedic_Lvl5					= 	35;
const KFACHID_FieldMedic_Lvl10					= 	36;
const KFACHID_FieldMedic_Lvl15					= 	37;
const KFACHID_FieldMedic_Lvl20					= 	38;
const KFACHID_FieldMedic_Lvl25					= 	39;
const KFACHID_Commando_Lvl5						= 	40;
const KFACHID_Commando_Lvl10					= 	41;
const KFACHID_Commando_Lvl15					= 	42;
const KFACHID_Commando_Lvl20					= 	43;
const KFACHID_Commando_Lvl25					= 	44;
const KFACHID_Support_Lvl5						= 	45;
const KFACHID_Support_Lvl10						= 	46;
const KFACHID_Support_Lvl15						= 	47;
const KFACHID_Support_Lvl20						= 	48;
const KFACHID_Support_Lvl25						= 	49;
const KFACHID_Firebug_Lvl5						= 	50;
const KFACHID_Firebug_Lvl10						= 	51;
const KFACHID_Firebug_Lvl15						= 	52;
const KFACHID_Firebug_Lvl20						= 	53;
const KFACHID_Firebug_Lvl25						= 	54;
const KFACHID_Demolitionist_Lvl5				= 	55;
const KFACHID_Demolitionist_Lvl10				= 	56;
const KFACHID_Demolitionist_Lvl15				= 	57;
const KFACHID_Demolitionist_Lvl20				= 	58;
const KFACHID_Demolitionist_Lvl25				= 	59;
const KFACHID_Gunslinger_Lvl5					= 	60;
const KFACHID_Gunslinger_Lvl10					= 	61;
const KFACHID_Gunslinger_Lvl15					= 	62;
const KFACHID_Gunslinger_Lvl20					= 	63;
const KFACHID_Gunslinger_Lvl25					= 	64;

const KFACHID_BerserkerNormal					=	65;
const KFACHID_BerserkerHard						=	66;
const KFACHID_BerserkerSuicidal					=	67;
const KFACHID_BerserkerHellOnEarth				=	68;
const KFACHID_FieldMedicNormal					=	69;
const KFACHID_FieldMedicHard					=	70;
const KFACHID_FieldMedicSuicidal				=	71;
const KFACHID_FieldMedicHellOnEarth				=	72;
const KFACHID_CommandoNormal					=	73;
const KFACHID_CommandoHard						=	74;
const KFACHID_CommandoSuicidal					=	75;
const KFACHID_CommandoHellOnEarth				=	76;
const KFACHID_SupportNormal						=	77;
const KFACHID_SupportHard						=	78;
const KFACHID_SupportSuicidal					=	79;
const KFACHID_SupportHellOnEarth				=	80;
const KFACHID_FirebugNormal						=	81;
const KFACHID_FirebugHard						=	82;
const KFACHID_FirebugSuicidal					=	83;
const KFACHID_FirebugHellOnEarth				=	84;
const KFACHID_DemolitionistNormal				=	85;
const KFACHID_DemolitionistHard					=	86;
const KFACHID_DemolitionistSuicidal				=	87;
const KFACHID_DemolitionistHellOnEarth			=	88;
const KFACHID_GunslingerNormal					=	89;
const KFACHID_GunslingerHard					=	90;
const KFACHID_GunslingerSuicidal				=	91;
const KFACHID_GunslingerHellOnEarth				=	92;

const KFACHID_All_Lvl25							=	93;

const KFACHID_BlackForestNormal	 				=	94;
const KFACHID_BlackForestHard  					=	95;
const KFACHID_BlackForestSuicidal				=	96;
const KFACHID_BlackForestHellOnEarth			=	97;
const KFACHID_BlackForestCollectibles			= 	98;

const KFACHID_FarmhouseNormal	 				=	99;
const KFACHID_FarmhouseHard  					=	100;
const KFACHID_FarmhouseSuicidal					=	101;
const KFACHID_FarmhouseHellOnEarth				=	102;
const KFACHID_FarmhouseCollectibles				= 	103;

const KFACHID_PrisonNormal	 					=	104;
const KFACHID_PrisonHard  						=	105;
const KFACHID_PrisonSuicidal					=	106;
const KFACHID_PrisonHellOnEarth					=	107;
const KFACHID_PrisonCollectibles				= 	108;

const KFACHID_TutorialComplete					=	109;

const KFACHID_Sharpshooter_Lvl5					= 	110;
const KFACHID_Sharpshooter_Lvl10				= 	111;
const KFACHID_Sharpshooter_Lvl15				= 	112;
const KFACHID_Sharpshooter_Lvl20				= 	113;
const KFACHID_Sharpshooter_Lvl25				= 	114;

const KFACHID_SharpshooterNormal				=	115;
const KFACHID_SharpshooterHard					=	116;
const KFACHID_SharpshooterSuicidal				=	117;
const KFACHID_SharpshooterHellOnEarth			=	118;

const KFACHID_ContainmentStationNormal			=	119;
const KFACHID_ContainmentStationHard			=	120;
const KFACHID_ContainmentStationSuicidal		=	121;
const KFACHID_ContainmentStationHellOnEarth		=	122;
const KFACHID_ContainmentStationCollectibles	= 	123;

const KFACHID_HostileGroundsNormal				=	124;
const KFACHID_HostileGroundsHard				=	125;
const KFACHID_HostileGroundsSuicidal			=	126;
const KFACHID_HostileGroundsHellOnEarth			=	127;
const KFACHID_HostileGroundsCollectibles		= 	128;

const KFACHID_DeadSilence						= 	129;
const KFACHID_QuickOnTheTrigger					= 	130;
const KFACHID_ItsOnlyAFleshWound				= 	131;
const KFACHID_HackAndSlash						= 	132;
const KFACHID_DieVolter							= 	133;
const KFACHID_WinHard							= 	134;
const KFACHID_WinSuicidal						= 	135;
const KFACHID_WinHellOnEarth					=	136;
const KFACHID_MrPerky5							=	137;
const KFACHID_MrPerky10							=	138;
const KFACHID_MrPerky15							=	139;
const KFACHID_MrPerky20							=	140;
const KFACHID_MrPerky25							=	141;
const KFACHID_Win1								=	142;
const KFACHID_Win10								=	143;
const KFACHID_Win25								=	144;
const KFACHID_VsZedWin							=	145;
const KFACHID_VsHumanWin						=	146;
const KFACHID_HoldOut							=	147;
const KFACHID_IGotYourBack						=	148;
const KFACHID_Benefactor						=	149;

const KFACHID_InfernalRealmNormal				=	150;
const KFACHID_InfernalRealmHard					=	151;
const KFACHID_InfernalRealmSuicidal				=	152;
const KFACHID_InfernalRealmHellOnEarth			=	153;
const KFACHID_InfernalRealmCollectibles			= 	154;

const KFACHID_SWAT_Lvl5							= 	155;
const KFACHID_SWAT_Lvl10						= 	156;
const KFACHID_SWAT_Lvl15						= 	157;
const KFACHID_SWAT_Lvl20						= 	158;
const KFACHID_SWAT_Lvl25						= 	159;

const KFACHID_SWATNormal						=	160;
const KFACHID_SWATHard							=	161;
const KFACHID_SWATSuicidal						=	162;
const KFACHID_SWATHellOnEarth					=	163;

const KFACHID_Surv_Lvl5							= 	164;
const KFACHID_Surv_Lvl10						= 	165;
const KFACHID_Surv_Lvl15						= 	166;
const KFACHID_Surv_Lvl20						= 	167;
const KFACHID_Surv_Lvl25						= 	168;

const KFACHID_SurvNormal						=	169;
const KFACHID_SurvHard							=	170;
const KFACHID_SurvSuicidal						=	171;
const KFACHID_SurvHellOnEarth					=	172;

const KFACHID_ZedLandingNormal					=	173;
const KFACHID_ZedLandingHard					=	174;
const KFACHID_ZedLandingSuicidal				=	175;
const KFACHID_ZedLandingHellOnEarth				=	176;
const KFACHID_ZedLandingCollectibles			= 	177;

const KFACHID_DescentNormal						=	178;
const KFACHID_DescentHard						=	179;
const KFACHID_DescentSuicidal					=	180;
const KFACHID_DescentHellOnEarth				=	181;
const KFACHID_DescentCollectibles				= 	182;

const KFACHID_NukedNormal						=	183;
const KFACHID_NukedHard							=	184;
const KFACHID_NukedSuicidal						=	185;
const KFACHID_NukedHellOnEarth					=	186;
const KFACHID_NukedCollectibles					= 	187;

const KFACHID_TragicKingdomNormal               =   188;
const KFACHID_TragicKingdomHard                 =   189;
const KFACHID_TragicKingdomSuicidal             =   190;
const KFACHID_TragicKingdomHellOnEarth          =   191;
const KFACHID_TragicKingdomCollectibles         =   192;

/* __TW_ANALYTICS_ */
var int PerRoundWeldXP;
var int PerRoundHealXP;

//Cache of achievements information
var array<AchievementDetails> Achievements;

//var private const InterpCurveFloat 	LevelXPCurve;
var const int XPTable[25];

/** Stats state */
var private const   bool bFailedToRead;
var private const   bool bReadSuccessful;

/** Dev cheats */
var	config	bool	bAllowPerkCheats;
var	private	const	bool	bDisabled;

/** Debugging */
var 		bool 	bLogStatsWrite;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/*********************************************************************************************
* @name Native stat functions
********************************************************************************************* */
native function IncrementIntStat(int StatId,optional int IncBy = 1);
native function IncrementFloatStat( int StatId, optional float IncBy = 1.0 );
native function SetIntStat( int StatId, int Value );
native function SetFloatStat( int StatId, float Value );
native final function bool HasCheated();
native final function NotifyCheats(optional bool bSaveToConfig);
native final function bool HasReadFailure();
native final function NotifyReadFailure();
native final function bool HasReadStats();
native final function NotifyReadSucceeded();
native final private function int LogSubsystemIntStat( int StatId );

/*********************************************************************************************
* @name Saving & Loading
********************************************************************************************* */
simulated function LogStats()
{
	LogInternal("###############################################################");
	LogInternal("CACHED VALUES:");
	LogInternal("CommandoXP, CommandoLVL " @ "    =" @ CommandoXP @ CommandoLVL);
	LogInternal("BerserkerXP, BerserkerLVL " @ "  =" @ BerserkerXP @ BerserkerLVL);
	LogInternal("SupportXP, SupportLVL " @ "      =" @ SupportXP @ SupportLVL);
	LogInternal("MedicXP, MedicLVL " @ "          =" @ MedicXP @ MedicLVL);
	LogInternal("---------------------------------------------------------------");
	LogInternal("STEAM VALUES:");
	LogInternal("CommandoXP, CommandoLVL " @ "    =" @ GetXPFromProgress( LogSubsystemIntStat( STATID_Cmdo_Progress ) ) @ GetLVLFromProgress( LogSubsystemIntStat( STATID_Cmdo_Progress ) ));
	LogInternal("BerserkerXP, BerserkerLVL " @ "  =" @ GetXPFromProgress( LogSubsystemIntStat( STATID_Bsrk_Progress ) ) @ GetLVLFromProgress( LogSubsystemIntStat( STATID_Bsrk_Progress ) ));
	LogInternal("SupportXP, SupportLVL " @ "      =" @ GetXPFromProgress( LogSubsystemIntStat( STATID_Sup_Progress ) ) @ GetLVLFromProgress( LogSubsystemIntStat( STATID_Sup_Progress ) ));
	LogInternal("MedicXP, MedicLVL " @ "          =" @ GetXPFromProgress( LogSubsystemIntStat( STATID_Medic_Progress ) ) @ GetLVLFromProgress( LogSubsystemIntStat( STATID_Medic_Progress ) ));
	LogInternal(" ");
	LogInternal("CommandoProgress " @ "           =" @ LogSubsystemIntStat( STATID_Cmdo_Progress ));
	LogInternal("BerserkerProgress " @ "          =" @ LogSubsystemIntStat( STATID_Bsrk_Progress ));
	LogInternal("SupportProgress " @ "            =" @ LogSubsystemIntStat( STATID_Sup_Progress ));
	LogInternal("MedicProgress " @ "              =" @ LogSubsystemIntStat( STATID_Medic_Progress ));
	LogInternal("###############################################################");
}

simulated function LogStatValue(int StatId)
{
    LogInternal("*** Stat value for ID" @ StatId @ ": " @ LogSubsystemIntStat(StatId));
}

//Steam stats -> the gameplay variables
event CacheStatsValue(int StatID, float Value)
{
	switch( StatID )
	{
		// Perk XPs and builds
		case STATID_Cmdo_Progress:
			CommandoXP = GetXPFromProgress( Value );
			CommandoLVL = GetLVLFromProgress( Value );
			CommandoPSG = GetPSGFromProgress( Value );
			CheckPerkLvlAchievement( class'KFPerk_Commando', CommandoLVL );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "CommandoXP:" @ CommandoXP @CommandoLVL @ "VALUE:" @ Round( value ));
			break;
		case STATID_Cmdo_Build:
			CommandoBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "CommandoBuild:" @ CommandoBuild);
			break;
		case STATID_Bsrk_Progress:
			BerserkerXP = GetXPFromProgress( Value );
			BerserkerLVL = GetLVLFromProgress( Value );
			BerserkerPSG = GetPSGFromProgress( Value );
			CheckPerkLvlAchievement( class'KFPerk_Berserker', BerserkerLVL );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "BerserkerXP:" @ BerserkerXP @ BerserkerLVL @ "VALUE:" @ Round( value ));
			break;
		case STATID_Bsrk_Build:
			BerserkerBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "BerserkerBuild:" @ BerserkerBuild);
			break;
		case STATID_Sup_Progress:
			SupportXP = GetXPFromProgress( Value );
			SupportLVL = GetLVLFromProgress( Value );
			SupportPSG = GetPSGFromProgress( Value );
			CheckPerkLvlAchievement( class'KFPerk_Support', SupportLVL );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "SupportXP:" @ SupportXP @ SupportLVL @ "VALUE:" @ Round( value ));
			break;
		case STATID_Sup_Build:
			SupportBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "SupportBuild:" @ SupportBuild);
			break;
		case STATID_Medic_Progress:
			MedicXP = GetXPFromProgress( Value );
			MedicLVL = GetLVLFromProgress( Value );
			MedicPSG = GetPSGFromProgress( Value );
			CheckPerkLvlAchievement( class'KFPerk_FieldMedic', MedicLVL );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "MedicXP:" @ MedicXP @ MedicLVL @ "VALUE:" @ Round( value ));
			break;
		case STATID_Medic_Build:
			MedicBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "MedicBuild:" @ MedicBuild);
			break;
		case STATID_Fire_Progress:
			FirebugXP = GetXPFromProgress( Value );
			FirebugLVL = GetLVLFromProgress( Value );
			FirebugPSG = GetPSGFromProgress( Value );
			CheckPerkLvlAchievement( class'KFPerk_Firebug', FirebugLVL );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "FirebugXP:" @ FirebugXP @ FirebugLVL @ "VALUE:" @ Round( value ));
			break;
		case STATID_Fire_Build:
			FirebugBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "FirebugBuild:" @ FirebugBuild);
			break;
		case STATID_Demo_Progress:
			DemoXP = GetXPFromProgress( Value );
			DemoLVL = GetLVLFromProgress( Value );
			DemoPSG = GetPSGFromProgress( Value );
			CheckPerkLvlAchievement( class'KFPerk_Demolitionist', DemoLVL );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "DemoXP:" @ DemoXP @ DemoLVL @ "VALUE:" @ Round( value ));
			break;
		case STATID_Demo_Build:
			DemoBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "DemoBuild:" @ DemoBuild);
			break;
		case STATID_Guns_Progress:
			GunslingerXP = GetXPFromProgress( Value );
			GunslingerLVL = GetLVLFromProgress( Value );
			GunslingerPSG = GetPSGFromProgress( Value );
			CheckPerkLvlAchievement( class'KFPerk_Gunslinger', GunslingerLVL );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "GunslingerXP:" @ GunslingerXP @ GunslingerLVL @ "VALUE:" @ Round( value ));
			break;
		case STATID_Guns_Build:
			GunslingerBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "GunslingerBuild:" @ GunslingerBuild);
			break;
		case STATID_Shrp_Progress:
			SharpshooterXP = GetXPFromProgress( Value );
			SharpshooterLVL = GetLVLFromProgress( Value );
			SharpshooterPSG = GetPSGFromProgress( Value );
			CheckPerkLvlAchievement( class'KFPerk_Sharpshooter', SharpshooterLVL );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "SharpshooterXP:" @ SharpshooterXP @ SharpshooterLVL @ "VALUE:" @ Round( value ));
			break;
		case STATID_Shrp_Build:
			SharpshooterBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "SharpshooterBuild:" @ SharpshooterBuild);
			break;
		case STATID_Swat_Progress:
			SwatXP = GetXPFromProgress( Value );
			SwatLVL = GetLVLFromProgress( Value );
			SwatPSG = GetPSGFromProgress( Value );
			CheckPerkLvlAchievement( class'KFPerk_Swat', SwatLVL );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "SwatXP:" @ SwatXP @ SwatLVL @ "VALUE:" @ Round( value ));
			break;
		case STATID_Swat_Build:
			SwatBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "SwatBuild:" @ SwatBuild);
			break;
		case STATID_Surv_Progress:
			SurvXP = GetXPFromProgress( Value );
			SurvLVL = GetLVLFromProgress( Value );
			SurvPSG = GetPSGFromProgress( Value );
			CheckPerkLvlAchievement( class'KFPerk_Survivalist', SurvLVL );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "SurvXP:" @ SurvXP @ SurvLVL @ "VALUE:" @ Round( value ));
			break;
		case STATID_Surv_Build:
			SurvBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "SurvBuild:" @ SurvBuild);
			break;
		// end of perk progress stats
		case STATID_Kills:
			Kills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "Kills:" @ Kills);
			break;
		case STATID_StalkerKills:
			StalkerKills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "Stalker Kills:" @ StalkerKills);
			break;
		case STATID_Sup_WeldPoints:
			WeldingPoints = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "Welding points:" @ WeldingPoints);
			break;
		case STATID_Medic_HealPoints:
			HealingPoints = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "Healing points:" @ HealingPoints);
			break;
		case STATID_CrawlerKills:
			CrawlerKills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "Crawler kills:" @ CrawlerKills);
			break;
		case STATID_FleshpoundKills:
			FleshpoundKills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "Fleshpound kills:" @ FleshpoundKills);
			break;
        case STATID_SpecialEventProgress:
            InitialSpecialEventInfo = Value;
            if (bLogStatsWrite) LogInternal(GetFuncName() @ "Special Event: " @ SpecialEventInfo);
            break;
        case STATID_WeeklyEventProgress:
            InitialWeeklyEventInfo = Value;
            if (bLogStatsWrite) LogInternal(GetFuncName() @ "Weekly Event:" @ WeeklyEventInfo);
            break;
		case STATID_PersonalBest_KnifeKills:
			PersonalBest_KnifeKills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_KnifeKills:" @ PersonalBest_KnifeKills);
			break;
		case STATID_PersonalBest_PistolKills:
			PersonalBest_PistolKills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_PistolKills:" @ PersonalBest_PistolKills);
			break;
		case STATID_PersonalBest_HeadShots:
			PersonalBest_HeadShots = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_HeadShots:" @ PersonalBest_HeadShots);
			break;
		case STATID_PersonalBest_Healing:
			PersonalBest_Healing = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_Healing:" @ PersonalBest_Healing);
			break;
		case STATID_PersonalBest_Kills:
			PersonalBest_Kills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_Kills:" @ PersonalBest_Kills);
			break;
		case STATID_PersonalBest_Assists:
			PersonalBest_Assists = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_Assists:" @ PersonalBest_Assists);
			break;
		case STATID_PersonalBest_LargeZedKill:
			PersonalBest_LargeZedKil = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_LargeZedKil:" @ PersonalBest_LargeZedKil);
			break;
		case STATID_PersonalBest_Dosh:
			PersonalBest_Dosh = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_Dosh:" @ PersonalBest_Dosh);
			break;
	}
}

/** returns cached stats value */
private event GetPerkBuildFromStats( class<KFPerk> PerkClass, out int Build )
{
	switch( PerkClass )
	{
		case class'KFPerk_Commando':
			Build = CommandoBuild;
			break;
		case class'KFPerk_Berserker':
			Build = BerserkerBuild;
			break;
		case class'KFPerk_Support':
			Build = SupportBuild;
			break;
		case class'KFPerk_FieldMedic':
			Build = MedicBuild;
			break;
		case class'KFPerk_Firebug':
			Build = FirebugBuild;
			break;
		case class'KFPerk_Demolitionist':
			Build = DemoBuild;
			break;
		case class'KFPerk_Gunslinger':
			Build = GunslingerBuild;
			break;
		case class'KFPerk_Sharpshooter':
			Build = SharpshooterBuild;
			break;
		case class'KFPerk_Swat':
			Build = SwatBuild;
			break;
		case class'KFPerk_Survivalist':
			Build = SurvBuild;
			break;
	}
}

/** returns cached stats value */
private event SaveBuildToStats(class<KFPerk> InPerk, int Build)
{
	local int StatID;
	StatId = InPerk.static.GetPerkBuildStatID();

	// save and update cached var
	SetIntStat(StatId, Build);
	CacheStatsValue(StatId, Build);

	if (bLogStatsWrite) LogInternal(GetFuncName() @ "Saving build for perk:" @ InPerk @ "Build:" @ Build);
}

/*********************************************************************************************
* @name Perk Progression
********************************************************************************************* */

// External get functions
native final function int GetPerkLevel( class<KFPerk> Perk );
native final function int GetPerkBuild( class<KFPerk> Perk );
native final static function int GetXPNeededAt( int Level );

// Use these instead of IncrementIntStat, etc...
native final private function IncrementXPStat( class<KFPerk> PerkClass, optional int IncBy = 1 );
native final private function int GetXPFromProgress( int PerkProgress );
native final private function int GetLVLFromProgress( int PerkProgress );
native final private function int GetPSGFromProgress( int PerkProgress );

/** Called when some game event awards XP */
private event AddXP( class<KFPerk> PerkClass, int dXP )
{
	if( PerkClass == None )
	{
		return;
	}

	IncrementXPStat( PerkClass, dXP );

	if( MyKFPC != none )
	{
		MyKFPC.NotifyXPGain(PerkClass, dXP);
	}
	if (bLogStatsWrite) LogInternal("AddXP Perk:"$PerkClass@"dXP:"$dXP);
}

/** Called by IncrementXPStat when new level is achieved */
private event NotifyLevelUp(class<KFPerk> PerkClass, int NewLVL)
{
	if( MyKFPC != None )
	{
		MyKFPC.NotifyLevelUp( PerkClass, NewLVL );
		if (bLogStatsWrite) LogInternal(GetFuncName() @ "PerkClass:" @ PerkClass @ "New LVL:" @ NewLVL);
		
		if( NewLVL % 5 == 0 )
		{
			CheckPerkLvlAchievement( PerkCLass, NewLVL );
		}
	}
}

/** returns cached value for xp */
private event int GetPerkXP( int StatID )
{
	switch( StatID )
	{
		case STATID_Cmdo_Progress:			return CommandoXP;
		case STATID_Bsrk_Progress:			return BerserkerXP;
		case STATID_Sup_Progress:			return SupportXP;
		case STATID_Medic_Progress:		return MedicXP;
		case STATID_Fire_Progress:			return FirebugXP;
		case STATID_Demo_Progress:			return DemoXP;
		case STATID_Guns_Progress:			return GunslingerXP;
		case STATID_Shrp_Progress:			return SharpshooterXP;
		case STATID_Swat_Progress:			return SwatXP;
		case STATID_Surv_Progress:			return SurvXP;
	}

	return 0;
}

/** returns cached value for lvl */
private event int GetPerkLVLInternal( int StatID )
{
	switch( StatID )
	{
		case STATID_Cmdo_Progress:			return CommandoLVL;
		case STATID_Bsrk_Progress:			return BerserkerLVL;
		case STATID_Sup_Progress:			return SupportLVL;
		case STATID_Medic_Progress:		return MedicLVL;
		case STATID_Fire_Progress:			return FirebugLVL;
		case STATID_Demo_Progress:			return DemoLVL;
		case STATID_Guns_Progress:			return GunslingerLVL;
		case STATID_Shrp_Progress:			return SharpshooterLVL;
		case STATID_Swat_Progress:			return SwatLVL;		
		case STATID_Surv_Progress:			return SurvLVL;		
	}

	return 0;
}

/** returns cached value for lvl */
private event int GetPerkPSG( int StatID )
{
	switch( StatID )
	{
		case STATID_Cmdo_Progress:			return CommandoPSG;
		case STATID_Bsrk_Progress:			return BerserkerPSG;
		case STATID_Sup_Progress:			return SupportPSG;
		case STATID_Medic_Progress:		return MedicPSG;
		case STATID_Fire_Progress:			return FirebugPSG;
		case STATID_Demo_Progress:			return DemoPSG;
		case STATID_Guns_Progress:			return GunslingerPSG;
		case STATID_Shrp_Progress:			return SharpshooterPSG;
		case STATID_Swat_Progress:			return SwatPSG;
		case STATID_Surv_Progress:			return SurvPSG;
	}

	return 0;
}

private event int GetPerkLVLByClass(class<KFPerk> PerkClass)
{
	local int StatID;

	StatID = PerkClass.static.GetProgressStatID();
	return GetPerkLVLInternal(StatID);
}

/*********************************************************************************************
* @name Personal Bests (AAR)
********************************************************************************************* */

function int GetPersonalBest( EPersonalBests PersonalBestID )
{
	switch( PersonalBestID )
	{
		case EPB_KnifeKills:			return PersonalBest_KnifeKills;
		case EPB_PistolKills:			return PersonalBest_PistolKills;
		case EPB_HeadShots:				return PersonalBest_HeadShots;
		case EPB_Healing:				return PersonalBest_Healing;
		case EPB_Kills:					return PersonalBest_Kills;
		case EPB_Assists:				return PersonalBest_Assists;
		case EPB_LargeZedKill:			return PersonalBest_LargeZedKil;
		case EPB_Dosh:					return PersonalBest_Dosh;
	}
	
	return 0;
}

function SavePersonalBest( EPersonalBests PersonalBestID, int Value )
{
	switch( PersonalBestID )
	{
		case EPB_KnifeKills:			SetIntStat(STATID_PersonalBest_KnifeKills, Value); 	break;
		case EPB_PistolKills:			SetIntStat(STATID_PersonalBest_PistolKills, Value); 	break;
		case EPB_HeadShots:				SetIntStat(STATID_PersonalBest_HeadShots, Value); 		break;
		case EPB_Healing:				SetIntStat(STATID_PersonalBest_Healing, Value); 		break;
		case EPB_Kills:					SetIntStat(STATID_PersonalBest_Kills, Value); 			break;
		case EPB_Assists:				SetIntStat(STATID_PersonalBest_Assists, Value); 		break;
		case EPB_LargeZedKill:			SetIntStat(STATID_PersonalBest_LargeZedKill, Value); 	break;
		case EPB_Dosh:					SetIntStat(STATID_PersonalBest_Dosh, Value); 			break;
	}	
}

/*********************************************************************************************
* @name Gameplay
********************************************************************************************* */
/**
 * @brief Add a kill and give some EXP tp the player
 * @param MonsterClass The killed monster's class
 * @param Difficulty The current game difficulty
 * @param DT The damagetype used to kill the zed
 * @return [description]
 */
private event AddToKills( class<KFPawn_Monster> MonsterClass, byte Difficulty, class<DamageType> DT )
{
	IncrementIntStat( STATID_Kills, 1 );
	Kills++;

	if(!MonsterClass.default.bVersusZed)
	{
		MyKFPC.ReceiveLocalizedMessage(Class'KFLocalMessage_PlayerKills', KMT_PLayerKillZed, MyKFPC.PlayerReplicationInfo, none, MonsterClass);
	}

	if( IsStalkerKill( MonsterClass, DT ) )
	{
		AddStalkerKill( Difficulty );
	}
	else if( IsCrawlerKill( MonsterClass, DT ) )
	{
		AddCrawlerKill( Difficulty );
	}
	else if( IsFleshPoundKill( MonsterClass, DT ) )
	{
		AddFleshpoundKill( Difficulty );
	}
	else if( IsClotKill( MonsterClass, DT ) )
	{
		AddClotKill( Difficulty );
	}
	else if( IsBloatKill( MonsterClass, DT ) )
	{
		AddBloatKill( Difficulty );
	}
	
	if(MyKFPC!= none && MyKFPC.MatchStats != none ){MyKFPC.MatchStats.RecordZedKill(MonsterClass,DT);};
}

/**
 * @brief Adds EXP for a qualified stalker kill
 * @details The commando perk only receives extra EXP when a stalker is killed
 * 			with a commando weapon. The currently slected skill does not matter
 * @param Difficulty current game difficulty
 */
private function AddStalkerKill( byte Difficulty )
{
	StalkerKills++;
	IncrementIntStat( STATID_StalkerKills, 1 );
	AddXP( class'KFPerk_Commando', class'KFPerk_Commando'.static.GetStalkerKillXP( Difficulty ) );
	if (bLogStatsWrite) LogInternal(GetFuncName() @ "Adding stalker kill, IncrementIntStat STATID_StalkerKills by:" @ class'KFPerk_Commando'.static.GetStalkerKillXP(Difficulty));

	//AAR
	if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_Commando'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_Commando',class'KFPerk_Commando'.static.GetStalkerKillXP( Difficulty ));};
	KFGameReplicationInfo(MyKFPC.WorldInfo.GRI).SecondaryXPAccumulator += class'KFPerk_Commando'.static.GetStalkerKillXP( Difficulty );

}

/**
 * @brief Adds EXP for a small radius kill
 * @details Berserker gains XP when killing a zed close to another player
 * 			
 * @param Difficulty current game difficulty
 */
private event AddSmallRadiusKill( byte Difficulty )
{
	AddXP( class'KFPerk_Berserker', class'KFPerk_Berserker'.static.GetSmallRadiusKillXP(Difficulty) );

	//AAR
	if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_Berserker'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_Berserker',class'KFPerk_Berserker'.static.GetSmallRadiusKillXP(Difficulty));};
	KFGameReplicationInfo(MyKFPC.WorldInfo.GRI).SecondaryXPAccumulator += class'KFPerk_Berserker'.static.GetSmallRadiusKillXP(Difficulty);
}

/**
 * @brief Adds EXP for a qualified crawler kill
 * @details The Firebug perk only receives extra EXP when a crawler is killed
 * 			with a Firebug weapon. The currently selected skill does not matter
 * @param Difficulty current game difficulty
 */
private function AddCrawlerKill( byte Difficulty )
{
	CrawlerKills++;
	IncrementIntStat( STATID_CrawlerKills, 1 );
	AddXP( class'KFPerk_Firebug', class'KFPerk_Firebug'.static.GetCrawlerKillXP( Difficulty ) );
	if (bLogStatsWrite) LogInternal(GetFuncName() @ "Adding crawler kill, IncrementIntStat STATID_CrawlerKills by:" @ class'KFPerk_Firebug'.static.GetCrawlerKillXP(Difficulty));

	//AAR
	if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_Firebug'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_Firebug',class'KFPerk_Firebug'.static.GetCrawlerKillXP( Difficulty ));};
	KFGameReplicationInfo(MyKFPC.WorldInfo.GRI).SecondaryXPAccumulator += class'KFPerk_Firebug'.static.GetCrawlerKillXP( Difficulty );
}

/**
 * @brief Adds EXP for a qualified Fleshpound kill
 * @details The Demolitionist perk only receives extra EXP when a Fleshpound is killed
 * 			with a demo weapon. The currently selected skill does not matter
 * @param Difficulty current game difficulty
 */
private function AddFleshpoundKill( byte Difficulty )
{
	FleshpoundKills++;
	IncrementIntStat( STATID_FleshpoundKills, 1 );
	AddXP( class'KFPerk_Demolitionist', class'KFPerk_Demolitionist'.static.GetFleshpoundKillXP( Difficulty ) );
	if (bLogStatsWrite) LogInternal(GetFuncName() @ "Adding crawler kill, IncrementIntStat STATID_CrawlerKills by:" @ class'KFPerk_Firebug'.static.GetCrawlerKillXP(Difficulty));

	//AAR
	if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_Demolitionist'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_Demolitionist',class'KFPerk_Demolitionist'.static.GetFleshpoundKillXP( Difficulty ));};
	KFGameReplicationInfo(MyKFPC.WorldInfo.GRI).SecondaryXPAccumulator += class'KFPerk_Demolitionist'.static.GetFleshpoundKillXP( Difficulty );
}

/**
 * @brief Adds EXP for a qualified clot kill
 * @details The SWAT perk only receives extra EXP when a Fleshpound is killed
 * 			with a demo weapon. The currently selected skill does not matter
 * @param Difficulty current game difficulty
 */
private function AddClotKill( byte Difficulty )
{
	local class<KFPerk> PerkXPClass;

	PerkXPClass = (class'KFPerk_Survivalist'.static.GetPerkClass() == MyKFPC.GetPerk().static.GetPerkClass()) ? class'KFPerk_Survivalist'.static.GetPerkClass() : class'KFPerk_SWAT'.static.GetPerkClass();
	AddXP( PerkXPClass, class'KFPerk_SWAT'.static.GetClotKillXP( Difficulty ) );

	//AAR
	if(MyKFPC!= none && MyKFPC.MatchStats != none && PerkXPClass!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(PerkXPClass,class'KFPerk_SWAT'.static.GetClotKillXP( Difficulty ));};
	KFGameReplicationInfo(MyKFPC.WorldInfo.GRI).SecondaryXPAccumulator += class'KFPerk_SWAT'.static.GetClotKillXP( Difficulty );
}

/**
 * @brief Adds EXP for a qualified bloat kill
 * @details The Firebug perk only receives extra EXP when a bloat is killed
 * 			with a Firebug weapon. The currently selected skill does not matter
 * @param Difficulty current game difficulty
 */
private function AddBloatKill( byte Difficulty )
{
	AddXP( class'KFPerk_Firebug', class'KFPerk_Firebug'.static.GetBloatKillXP( Difficulty ) );
	
	//AAR
	if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_Firebug'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_Firebug',class'KFPerk_Firebug'.static.GetBloatKillXP( Difficulty ));};
	KFGameReplicationInfo(MyKFPC.WorldInfo.GRI).SecondaryXPAccumulator += class'KFPerk_Firebug'.static.GetBloatKillXP( Difficulty );
}

/**
 * @brief Checks if a crawler kill qualifies for Firebug EXP
 *
 * @param DT Used damage type
 * @param MonsterClass the killed zed's class
 * @return true if the zed was a crawler and the damage type is on perk
 */
private final function bool IsCrawlerKill( class<KFPawn_Monster> MonsterClass, class<DamageType> DT )
{
	return  MonsterClass.static.IsCrawlerClass() &&
			class'KFPerk'.static.IsDamageTypeOnThisPerk( class<KFDamageType>(DT), class'KFPerk_Firebug'.static.GetPerkClass() );
}

/**
 * @brief Checks if a stalker kill qualifies for Commando EXP
 *
 * @param DT Used damage type
 * @param MonsterClass the killed zed's class
 * @return true if the zed was a stalker and the damage type is on perk
 */
private final function bool IsStalkerKill( class<KFPawn_Monster> MonsterClass, class<DamageType> DT )
{
	return  MonsterClass.static.IsStalkerClass() &&
			class'KFPerk'.static.IsDamageTypeOnThisPerk( class<KFDamageType>(DT), class'KFPerk_Commando'.static.GetPerkClass() );
}

/**
 * @brief Checks if a fleshpund kill qualifies for demo EXP
 *
 * @param DT Used damage type
 * @param MonsterClass the killed zed's class
 * @return true if the zed was a stalker and the damage type is on perk
 */
private final function bool IsFleshPoundKill( class<KFPawn_Monster> MonsterClass, class<DamageType> DT )
{
	return  MonsterClass.static.IsFleshpoundClass() &&
			class'KFPerk'.static.IsDamageTypeOnThisPerk( class<KFDamageType>(DT), class'KFPerk_Demolitionist'.static.GetPerkClass() );
}

/**
 * @brief Checks if a clot kill qualifies for swat EXP
 *
 * @param DT Used damage type
 * @param MonsterClass the killed zed's class
 * @return true if the zed was a stalker and the damage type is on perk
 */
private final function bool IsClotKill( class<KFPawn_Monster> MonsterClass, class<DamageType> DT )
{
	return  MonsterClass.static.IsClotClass() &&
			(class'KFPerk'.static.IsDamageTypeOnThisPerk( class<KFDamageType>(DT), class'KFPerk_SWAT'.static.GetPerkClass() ) ||
			 class'KFPerk_Survivalist'.static.GetPerkClass() == MyKFPC.GetPerk().static.GetPerkClass());
}

/**
 * @brief Checks if a bloat kill qualifies for Firebug EXP
 *
 * @param DT Used damage type
 * @param MonsterClass the killed zed's class
 * @return true if the zed was a crawler and the damage type is on perk
 */
private final function bool IsBloatKill( class<KFPawn_Monster> MonsterClass, class<DamageType> DT )
{
	return  MonsterClass.static.IsBloatClass() &&
			class'KFPerk'.static.IsDamageTypeOnThisPerk( class<KFDamageType>(DT), class'KFPerk_Firebug'.static.GetPerkClass() );
}

/*
 * Calculates the perk XP reward for a certain number of points
 * Split from AddWeldingPoints so analytics can log XP earned.
 */
private function int ComputeWeldingXP( int Points )
{
	local int XPEarned;
	local KFGameReplicationInfo KFGRI;	

	XPEarned = FFloor( float(Points) / float(WeldingPointsRequired) );
	if( XPEarned >= 1 )
	{
		KFGRI = KFGameReplicationInfo(MyKFPC.WorldInfo.GRI);
		class'KFPerk_Support'.static.MultiplySecondaryXPPoints( XPEarned, KFGRI.GameDifficulty );
	}

	return XPEarned;
}

/** Welding does not earn XP directly, WeldingPointsRequired have to be earned first */
private event int AddWeldingPoints( int PointsWelded )
{
	local int XPEarned;

	WeldingPoints += PointsWelded;

	if (bLogStatsWrite) LogInternal(GetFuncName() @ "WeldingPoints are now:" @ WeldingPoints);

	XPEarned = ComputeWeldingXP( WeldingPoints ); //FFloor( float(WeldingPoints) / float(WeldingPointsRequired) );
	if( XPEarned >= 1 )
	{
		AddXP(class'KFPerk_Support', XPEarned);

		//AAR
		if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_Support'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_Support',XPEarned);};
		KFGameReplicationInfo(MyKFPC.WorldInfo.GRI).SecondaryXPAccumulator += XPEarned;

		// keep a running tally for analytics at the end of the match
		PerRoundWeldXP += XPEarned;

		// reset/rollover points needed for next xp gain
		WeldingPoints = WeldingPoints % WeldingPointsRequired;

		if (bLogStatsWrite) LogInternal(GetFuncName() @ "Welding XP earned :" @ XPEarned);
	}

	// We need the welding points to be persistent
	SetIntStat( STATID_Sup_WeldPoints,  WeldingPoints );

	return XPEarned;
}

/** Repairing doors is another source of secondary XP for the Support class. It uses different
 *      values for the XP earned, and is only earned on completion.  However, it tallies into 
 *      the same end stat.
 */
private event int DoorRepaired()
{
    local int XPEarned;
    local KFGameReplicationInfo KFGRI;
    KFGRI = KFGameReplicationInfo(MyKFPC.WorldInfo.GRI);
    if (KFGRI != none)
    {
        class'KFPerk_Support'.static.GetDoorRepairXP(XPEarned, KFGRI.GameDifficulty);
        if (XPEarned > 0)
        {
            AddXP(class'KFPerk_Support', XPEarned);
            if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_Support'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_Support',XPEarned);};
            KFGRI.SecondaryXPAccumulator += XPEarned;
            PerRoundWeldXP += XPEarned;

            LogInternal(GetFuncName() @ "Door Repair XP earned :" @ XPEarned);
        }
    }    

    return XPEarned;
}

/*
 * Calculates the perk XP reward for a certain number of points
 * Split from AddHealingPoints so analytics can log XP earned.
 */
private function int ComputeHealingXP( int Points )
{
	local int XPEarned;
	local KFGameReplicationInfo KFGRI;	

	XPEarned = FFloor( float(Points) / float(HealingPointsRequired) );
	if( XPEarned >= 1 )
	{
		KFGRI = KFGameReplicationInfo(MyKFPC.WorldInfo.GRI);
		class'KFPerk_FieldMedic'.static.MultiplySecondaryXPPoints( XPEarned, KFGRI.GameDifficulty );
	}

	return XPEarned;
}

/** Healing does not earn XP directly, HealingPointsRequired have to be earned first */
private event int AddHealingPoints( int PointsHealed )
{
	local int XPEarned;

	HealingPoints += PointsHealed;

	if (bLogStatsWrite) LogInternal(GetFuncName() @ "HealingPoints are now:" @ HealingPointsRequired);

	XPEarned = ComputeHealingXP( HealingPoints );
	if( XPEarned >= 1 )
	{
		AddXP(class'KFPerk_FieldMedic', XPEarned);

		//AAR
		if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_FieldMedic'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_FieldMedic',XPEarned);};
		KFGameReplicationInfo(MyKFPC.WorldInfo.GRI).SecondaryXPAccumulator += XPEarned;

		// keep a running tally for analytics at the end of the match
		PerRoundHealXP += XPEarned;

		// reset/rollover points needed for next xp gain
		HealingPoints = HealingPoints % HealingPointsRequired;

		if (bLogStatsWrite) LogInternal(GetFuncName() @ "Healing XP earned :" @ XPEarned);
	}

	// We need the welding points to be persistent
	SetIntStat( STATID_Medic_HealPoints,  HealingPoints );

	if( MyKFPC != none )
	{
		MyKFPC.ClientUnlockAchievement( KFACHID_IGotYourBack );
	}

	return XPEarned;
}

/**
 * @brief Add a headshot and give some EXP tp the player
 * @param Difficulty The current game difficulty
 * @param DT The damagetype used to headshot the zed
 * @return [description]
 */
private event AddToHeadshots( byte Difficulty, class<DamageType> DT )
{
    //Do both separately to allow for multi-perk pass through (Ex: single flare uses both)
	if( IsGunslingerHeadshot( DT ) )
	{
		AddGunslingerHeadshot( Difficulty );
	}
	
    if( IsSharpshooterHeadshot(DT) )
	{
		AddSharpshooterHeadshot( Difficulty );
	}
}

/**
 * @brief Adds EXP for a gunslinger headshot
 * @details The Gunslinger perk only receives extra EXP when a headshot is achieved with a Gunslinger weapon.
 * @param Difficulty current game difficulty
 */
private function AddGunslingerHeadshot( byte Difficulty )
{
	AddXP( class'KFPerk_Gunslinger', class'KFPerk_Gunslinger'.static.GetHeadshotXP(Difficulty) );

	//AAR
	if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_Gunslinger'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_Gunslinger',class'KFPerk_Gunslinger'.static.GetHeadshotXP(Difficulty));};
	KFGameReplicationInfo(MyKFPC.WorldInfo.GRI).SecondaryXPAccumulator += class'KFPerk_Gunslinger'.static.GetHeadshotXP(Difficulty);
}

/**
 * @brief Adds EXP for a sharpshooter headshot
 * @details The Sharpshooter perk only receives extra EXP when a headshot is achieved with a Sharpshooter weapon.
 * @param Difficulty current game difficulty
 */
private function AddSharpshooterHeadshot( byte Difficulty )
{
	AddXP( class'KFPerk_Sharpshooter', class'KFPerk_Sharpshooter'.static.GetHeadshotXP(Difficulty) );

	//AAR
	if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_Sharpshooter'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_Sharpshooter',class'KFPerk_Sharpshooter'.static.GetHeadshotXP(Difficulty));};
	KFGameReplicationInfo(MyKFPC.WorldInfo.GRI).SecondaryXPAccumulator += class'KFPerk_Sharpshooter'.static.GetHeadshotXP(Difficulty);
}

/**
 * @brief Checks if a headshot qualifies for gunslinger EXP
 *
 * @param DT Used damage type
 * @return true if damage type is on perk
 */
private final function bool IsGunslingerHeadshot( class<DamageType> DT )
{
	return (class'KFPerk_Gunslinger'.static.IsDamageTypeOnPerk( class<KFDamageType>(DT) ));
}

/**
 * @brief Checks if a headshot qualifies for sharpshooter EXP
 *
 * @param DT Used damage type
 * @return true if damage type is on perk
 */
private final function bool IsSharpshooterHeadshot( class<DamageType> DT )
{
	return (class'KFPerk'.static.IsDamageTypeOnThisPerk( class<KFDamageType>(DT), class'KFPerk_Sharpshooter'.static.GetPerkClass() ));
}

/*********************************************************************************************
* @name Achievements
********************************************************************************************* */

function GetAchievements()
{
	if( MyKFPC.IsLocalPlayerController() )
	{
		Achievements.Remove( 0, Achievements.length );
		MyKFPC.OnlineSub.PlayerInterface.GetAchievements( 0, Achievements );
	}
}

final function bool IsAchievementUnlocked( int AchievementIndex )
{
	return ( AchievementIndex < Achievements.length ) && Achievements[AchievementIndex].bWasAchievedOnline;
}

function OnUnlockAchievement( int AchievementIndex )
{
	//Reload the achievement list to get the change
	GetAchievements();
}

native function UnlockDingoAchievement(int AchievementId, optional int Value = 1);

/**
 * @brief Call into native to determine if we achieved anything
  *
 * @param MapName The name of the map played
 * @param Difficulty The game's difficulty
 * @param GameLength short/medium/long
 * @param bCoop multiplayer or not
  */
native final function OnGameWon( string MapName, byte Difficulty, byte GameLength, byte bCoop, class<KFPerk> PerkClass );

native final function OnRoundEnd( byte WinningTeam );

/**
 * @brief Check for map specific achievements on game end
 *
 * @param MapName The name of the map played
 * @param Difficulty The game's difficulty
 * @param GameLength short/medium/long
 * @param bCoop multiplayer or not
 */
native final function CheckMapEndAchievements( string MapName, byte Difficulty, byte bCoop );

/**
 * @brief Check if a new perk tier has been reached
 * 
 * @param PerkClass Perk leveled up
 * @param NewLVL The new perk level
 */
native final private function CheckPerkLvlAchievement( class<KFPerk> PerkClass, int NewLVL );

/**
 * @brief Check if a new difficulty with the selected perk was won
 * 
 * @param PerkClass Selected perk class
 * @param Difficulty Difficulty played
 */
native final private function CheckPerkDifficultyAchievements( class<KFPerk> PerkClass, byte Difficulty );

/**
 * @brief Check if all perks reached lvl 25 and unlock achievement
 */
native final private function CheckAllPerksLvl25();
/**
 * @brief Unlocks the tutorial achievement
 */
native final function UnlockTutorialAchievement();
native final function CheckForRoundTeamWinAchievements( byte WinningTeam );

/*********************************************************************************************
* @name Events
********************************************************************************************* */
final function bool CanCacheSpecialEvent()
{
    return InitialSpecialEventInfo > 0;
}

/** Verify what event we're in and cache local event state.  If we've changed to a new event,
 *      clear out the status flags before caching new date value.
 */
native final private function CacheSpecialEventState(int Value);

/** Triggered by KF PC when the special event ID is passed through as a valid value */
final function UpdateSpecialEventState()
{
    CacheSpecialEventState(InitialSpecialEventInfo);
}

/** Update the state of a special event.  If the passed in EventIndex doesn't match our current
 *      special event index, do not update the stat.  Also, if the map name passed doesn't match
 *      the list of allowed maps in native, don't record.
 */
native final function UpdateSpecialEvent(int EventIndex, int ObjectiveIndex);

/** Grab the state of a special event objective at a specific index. */
native final function bool IsEventObjectiveComplete(int ObjectiveIndex);

final function bool CanCacheWeeklyEvent()
{
    return InitialWeeklyEventInfo > 0;
}

/** Cache the state of the weekly event.If the cached week/year combo in the stored
 *      value don't match, everything is cleared.
 */
native final private function CacheWeeklyEventState(int Value);

/** Triggered by KF PC when the weekly event ID is passed through as a valid value */
final function UpdateWeeklyEventState()
{
    CacheWeeklyEventState(InitialWeeklyEventInfo);
}

/** Update the state of the weekly event.  Called via game type. */
native final function WeeklyEventComplete();

/** Whether or not the current weekly has been finished */
native final function bool IsWeeklyEventComplete();

/** Get a list of IDs associated with the prizes given out for completing a weekly */
native static final function array<int> GetWeeklyOutbreakRewards(int Index = -1);

defaultproperties
{
   XPTable(0)=795
   XPTable(1)=940
   XPTable(2)=1112
   XPTable(3)=1315
   XPTable(4)=1556
   XPTable(5)=1841
   XPTable(6)=2178
   XPTable(7)=2576
   XPTable(8)=3047
   XPTable(9)=3604
   XPTable(10)=4263
   XPTable(11)=5043
   XPTable(12)=5965
   XPTable(13)=7056
   XPTable(14)=8347
   XPTable(15)=9874
   XPTable(16)=11680
   XPTable(17)=13816
   XPTable(18)=16343
   XPTable(19)=19332
   XPTable(20)=22868
   XPTable(21)=27051
   XPTable(22)=31999
   XPTable(23)=37852
   XPTable(24)=44775
   Properties(0)=(PropertyId=1,Data=(Type=SDT_Int32))
   Properties(1)=(PropertyId=2,Data=(Type=SDT_Int32))
   Properties(2)=(PropertyId=10,Data=(Type=SDT_Int32))
   Properties(3)=(PropertyId=11,Data=(Type=SDT_Int32))
   Properties(4)=(PropertyId=20,Data=(Type=SDT_Int32))
   Properties(5)=(PropertyId=21,Data=(Type=SDT_Int32))
   Properties(6)=(PropertyId=30,Data=(Type=SDT_Int32))
   Properties(7)=(PropertyId=31,Data=(Type=SDT_Int32))
   Properties(8)=(PropertyId=40,Data=(Type=SDT_Int32))
   Properties(9)=(PropertyId=41,Data=(Type=SDT_Int32))
   Properties(10)=(PropertyId=50,Data=(Type=SDT_Int32))
   Properties(11)=(PropertyId=51,Data=(Type=SDT_Int32))
   Properties(12)=(PropertyId=60,Data=(Type=SDT_Int32))
   Properties(13)=(PropertyId=61,Data=(Type=SDT_Int32))
   Properties(14)=(PropertyId=70,Data=(Type=SDT_Int32))
   Properties(15)=(PropertyId=71,Data=(Type=SDT_Int32))
   Properties(16)=(PropertyId=80,Data=(Type=SDT_Int32))
   Properties(17)=(PropertyId=81,Data=(Type=SDT_Int32))
   Properties(18)=(PropertyId=90,Data=(Type=SDT_Int32))
   Properties(19)=(PropertyId=91,Data=(Type=SDT_Int32))
   Properties(20)=(PropertyId=200,Data=(Type=SDT_Int32))
   Properties(21)=(PropertyId=201,Data=(Type=SDT_Int32))
   Properties(22)=(PropertyId=22,Data=(Type=SDT_Int32))
   Properties(23)=(PropertyId=42,Data=(Type=SDT_Int32))
   Properties(24)=(PropertyId=202,Data=(Type=SDT_Int32))
   Properties(25)=(PropertyId=203,Data=(Type=SDT_Int32))
   Properties(26)=(PropertyId=300,Data=(Type=SDT_Int32))
   Properties(27)=(PropertyId=301,Data=(Type=SDT_Int32))
   Properties(28)=(PropertyId=2000,Data=(Type=SDT_Int32))
   Properties(29)=(PropertyId=2001,Data=(Type=SDT_Int32))
   Properties(30)=(PropertyId=2002,Data=(Type=SDT_Int32))
   Properties(31)=(PropertyId=2003,Data=(Type=SDT_Int32))
   Properties(32)=(PropertyId=2004,Data=(Type=SDT_Int32))
   Properties(33)=(PropertyId=2005,Data=(Type=SDT_Int32))
   Properties(34)=(PropertyId=2006,Data=(Type=SDT_Int32))
   Properties(35)=(PropertyId=2007,Data=(Type=SDT_Int32))
   Properties(36)=(PropertyId=3000,Data=(Type=SDT_Int32))
   ViewIds(0)=1
   Name="Default__KFOnlineStatsWrite"
   ObjectArchetype=OnlineStatsWrite'Engine.Default__OnlineStatsWrite'
}
