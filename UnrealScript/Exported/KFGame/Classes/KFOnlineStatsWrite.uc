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



 


 


  



 



 




 



 




 



 



 



 



 



 





 


 



 







#linenumber 15































































































	















#linenumber 16;

const	WeldingPointsRequired = 510;
const	HealingPointsRequired = 20;
const 	MaxPerkLevel = 25;
const 	MaxPrestigeLevel = 10;

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

var private int 	PersonalBest_KnifeKills;
var private int 	PersonalBest_PistolKills;
var private int 	PersonalBest_HeadShots;
var private int 	PersonalBest_Healing;
var private int 	PersonalBest_Kills;
var private int 	PersonalBest_Assists;
var private int 	PersonalBest_LargeZedKil;
var private int 	PersonalBest_Dosh;

/** Achievement IDs **/
// ids must be sequential (no gaps)
const KFACHID_ParisNormal				=	0;
const KFACHID_ParisHard 				=	1;
const KFACHID_ParisSuicidal				=	2;
const KFACHID_ParisHellOnEarth			=	3;
const KFACHID_OutpostNormal 			=	4;
const KFACHID_OutpostHard				=	5;
const KFACHID_OutpostSuicidal			=	6;
const KFACHID_OutpostHellOnEarth		=	7;
const KFACHID_BioticsNormal 			=	8;
const KFACHID_BioticsHard  				=	9;
const KFACHID_BioticsSuicidal			=	10;
const KFACHID_BioticsHellOnEarth		=	11;
const KFACHID_ManorNormal	 			=	12;
const KFACHID_ManorHard  				=	13;
const KFACHID_ManorSuicidal				=	14;
const KFACHID_ManorHellOnEarth			=	15;

const KFACHID_ParisCollectibles			= 	16;
const KFACHID_OutpostCollectibles		= 	17;
const KFACHID_BioticsCollectibles		= 	18;
const KFACHID_ManorCollectibles			= 	19;

const KFACHID_EvacNormal 				=	20;
const KFACHID_EvacHard  				=	21;
const KFACHID_EvacSuicidal				=	22;
const KFACHID_EvacHellOnEarth			=	23;
const KFACHID_CatacombsNormal	 		=	24;
const KFACHID_CatacombsHard  			=	25;
const KFACHID_CatacombsSuicidal			=	26;
const KFACHID_CatacombsHellOnEarth		=	27;

const KFACHID_EvacsCollectibles			= 	28;
const KFACHID_CatacombsCollectibles		= 	29;

/* __TW_ANALYTICS_ */
var int PerRoundWeldXP;
var int PerRoundHealXP;

//Cache of achievements information
var array<AchievementDetails> Achievements;

//var private const InterpCurveFloat 	LevelXPCurve;
var const int XPTable[25];

/** Dev cheats */
var	config	bool	bAllowPerkCheats;
var	private	const	bool	bDisabled;

/** Debugging */
var 		bool 	bLogStatsWrite;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function IncrementIntStat(int StatId,optional int IncBy = 1);
native function IncrementFloatStat( int StatId, optional float IncBy = 1.0 );
native function SetIntStat( int StatId, int Value );
native function SetFloatStat( int StatId, float Value );
native final function bool HasCheated();

native final function NotifyCheats(optional bool bSaveToConfig);

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
	LogInternal("CommandoXP, CommandoLVL " @ "    =" @ GetXPFromProgress( LogSubsystemIntStat( 1) ) @ GetLVLFromProgress( LogSubsystemIntStat( 1) ));
	LogInternal("BerserkerXP, BerserkerLVL " @ "  =" @ GetXPFromProgress( LogSubsystemIntStat( 10) ) @ GetLVLFromProgress( LogSubsystemIntStat( 10) ));
	LogInternal("SupportXP, SupportLVL " @ "      =" @ GetXPFromProgress( LogSubsystemIntStat( 20) ) @ GetLVLFromProgress( LogSubsystemIntStat( 20) ));
	LogInternal("MedicXP, MedicLVL " @ "          =" @ GetXPFromProgress( LogSubsystemIntStat( 40) ) @ GetLVLFromProgress( LogSubsystemIntStat( 40) ));
	LogInternal(" ");
	LogInternal("CommandoProgress " @ "           =" @ LogSubsystemIntStat( 1));
	LogInternal("BerserkerProgress " @ "          =" @ LogSubsystemIntStat( 10));
	LogInternal("SupportProgress " @ "            =" @ LogSubsystemIntStat( 20));
	LogInternal("MedicProgress " @ "              =" @ LogSubsystemIntStat( 40));
	LogInternal("###############################################################");
}

//Steam stats -> the gameplay variables
event CacheStatsValue(int StatID, float Value)
{
	switch( StatID )
	{
		// Perk XPs and builds
		case 1:
			CommandoXP = GetXPFromProgress( Value );
			CommandoLVL = GetLVLFromProgress( Value );
			CommandoPSG = GetPSGFromProgress( Value );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "CommandoXP:" @ CommandoXP @CommandoLVL @ "VALUE:" @ Round( value ));
			break;
		case 2:
			CommandoBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "CommandoBuild:" @ CommandoBuild);
			break;
		case 10:
			BerserkerXP = GetXPFromProgress( Value );
			BerserkerLVL = GetLVLFromProgress( Value );
			BerserkerPSG = GetPSGFromProgress( Value );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "BerserkerXP:" @ BerserkerXP @ BerserkerLVL @ "VALUE:" @ Round( value ));
			break;
		case 11:
			BerserkerBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "BerserkerBuild:" @ BerserkerBuild);
			break;
		case 20:
			SupportXP = GetXPFromProgress( Value );
			SupportLVL = GetLVLFromProgress( Value );
			SupportPSG = GetPSGFromProgress( Value );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "SupportXP:" @ SupportXP @ SupportLVL @ "VALUE:" @ Round( value ));
			break;
		case 21:
			SupportBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "SupportBuild:" @ SupportBuild);
			break;
		case 40:
			MedicXP = GetXPFromProgress( Value );
			MedicLVL = GetLVLFromProgress( Value );
			MedicPSG = GetPSGFromProgress( Value );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "MedicXP:" @ MedicXP @ MedicLVL @ "VALUE:" @ Round( value ));
			break;
		case 41:
			MedicBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "MedicBuild:" @ MedicBuild);
			break;
		case 30:
			FirebugXP = GetXPFromProgress( Value );
			FirebugLVL = GetLVLFromProgress( Value );
			FirebugPSG = GetPSGFromProgress( Value );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "FirebugXP:" @ FirebugXP @ FirebugLVL @ "VALUE:" @ Round( value ));
			break;
		case 31:
			FirebugBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "FirebugBuild:" @ FirebugBuild);
			break;
		case 60:
			DemoXP = GetXPFromProgress( Value );
			DemoLVL = GetLVLFromProgress( Value );
			DemoPSG = GetPSGFromProgress( Value );
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "DemoXP:" @ DemoXP @ DemoLVL @ "VALUE:" @ Round( value ));
			break;
		case 61:
			DemoBuild = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "DemoBuild:" @ DemoBuild);
			break;
		// end of perk progress stats
		case 200:
			Kills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "Kills:" @ Kills);
			break;
		case 201:
			StalkerKills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "Stalker Kills:" @ StalkerKills);
			break;
		case 22:
			WeldingPoints = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "Welding points:" @ WeldingPoints);
			break;
		case 42:
			HealingPoints = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "Healing points:" @ HealingPoints);
			break;
		case 202:
			CrawlerKills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "Crawler kills:" @ CrawlerKills);
			break;
		case 203:
			FleshpoundKills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "Fleshpound kills:" @ FleshpoundKills);
			break;
		case 2000:
			PersonalBest_KnifeKills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_KnifeKills:" @ PersonalBest_KnifeKills);
			break;
		case 2001:
			PersonalBest_PistolKills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_PistolKills:" @ PersonalBest_PistolKills);
			break;
		case 2002:
			PersonalBest_HeadShots = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_HeadShots:" @ PersonalBest_HeadShots);
			break;
		case 2003:
			PersonalBest_Healing = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_Healing:" @ PersonalBest_Healing);
			break;
		case 2004:
			PersonalBest_Kills = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_Kills:" @ PersonalBest_Kills);
			break;
		case 2005:
			PersonalBest_Assists = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_Assists:" @ PersonalBest_Assists);
			break;
		case 2006:
			PersonalBest_LargeZedKil = Value;
			if (bLogStatsWrite) LogInternal(GetFuncName() @ "PersonalBest_LargeZedKil:" @ PersonalBest_LargeZedKil);
			break;
		case 2007:
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
	}
}

/** returns cached value for xp */
private event int GetPerkXP( int StatID )
{
	switch( StatID )
	{
		case 1:			return CommandoXP;
		case 10:			return BerserkerXP;
		case 20:			return SupportXP;
		case 40:		return MedicXP;
		case 30:			return FirebugXP;
		case 60:			return DemoXP;
	}

	return 0;
}

/** returns cached value for lvl */
private event int GetPerkLVLInternal( int StatID )
{
	switch( StatID )
	{
		case 1:			return CommandoLVL;
		case 10:			return BerserkerLVL;
		case 20:			return SupportLVL;
		case 40:		return MedicLVL;
		case 30:			return FirebugLVL;
		case 60:			return DemoLVL;
	}

	return 0;
}

/** returns cached value for lvl */
private event int GetPerkPSG( int StatID )
{
	switch( StatID )
	{
		case 1:			return CommandoPSG;
		case 10:			return BerserkerPSG;
		case 20:			return SupportPSG;
		case 40:		return MedicPSG;
		case 30:			return FirebugPSG;
		case 60:			return DemoPSG;
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
		case EPB_KnifeKills:			SetIntStat(2000, Value); 	break;
		case EPB_PistolKills:			SetIntStat(2001, Value); 	break;
		case EPB_HeadShots:				SetIntStat(2002, Value); 		break;
		case EPB_Healing:				SetIntStat(2003, Value); 		break;
		case EPB_Kills:					SetIntStat(2004, Value); 			break;
		case EPB_Assists:				SetIntStat(2005, Value); 		break;
		case EPB_LargeZedKill:			SetIntStat(2006, Value); 	break;
		case EPB_Dosh:					SetIntStat(2007, Value); 			break;
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
	IncrementIntStat( 200, 1 );
	Kills++;

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
	IncrementIntStat( 201, 1 );
	AddXP( class'KFPerk_Commando', class'KFPerk_Commando'.static.GetStalkerKillXP( Difficulty ) );
	if (bLogStatsWrite) LogInternal(GetFuncName() @ "Adding stalker kill, IncrementIntStat STATID_StalkerKills by:" @ class'KFPerk_Commando'.static.GetStalkerKillXP(Difficulty));

	//AAR
	if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_Commando'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_Commando',class'KFPerk_Commando'.static.GetStalkerKillXP( Difficulty ));};
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
	IncrementIntStat( 202, 1 );
	AddXP( class'KFPerk_Firebug', class'KFPerk_Firebug'.static.GetCrawlerKillXP( Difficulty ) );
	if (bLogStatsWrite) LogInternal(GetFuncName() @ "Adding crawler kill, IncrementIntStat STATID_CrawlerKills by:" @ class'KFPerk_Firebug'.static.GetCrawlerKillXP(Difficulty));

	//AAR
	if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_Firebug'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_Firebug',class'KFPerk_Firebug'.static.GetCrawlerKillXP( Difficulty ));};
}

/**
 * @brief Adds EXP for a qualified Fleshpound kill
 * @details The Firebug perk only receives extra EXP when a crawler is killed
 * 			with a Firebug weapon. The currently selected skill does not matter
 * @param Difficulty current game difficulty
 */
private function AddFleshpoundKill( byte Difficulty )
{
	FleshpoundKills++;
	IncrementIntStat( 203, 1 );
	AddXP( class'KFPerk_Demolitionist', class'KFPerk_Demolitionist'.static.GetFleshpoundKillXP( Difficulty ) );
	if (bLogStatsWrite) LogInternal(GetFuncName() @ "Adding crawler kill, IncrementIntStat STATID_CrawlerKills by:" @ class'KFPerk_Firebug'.static.GetCrawlerKillXP(Difficulty));

	//AAR
	if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_Demolitionist'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_Demolitionist',class'KFPerk_Demolitionist'.static.GetFleshpoundKillXP( Difficulty ));};
}

/**
 * @brief Checks if a stalker kill qualifies for Firebug EXP
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

// Berserker gains XP when killing a zed close to another player
private event AddSmallRadiusKill( byte Difficulty )
{
	AddXP( class'KFPerk_Berserker', class'KFPerk_Berserker'.static.GetSmallRadiusKillXP(Difficulty) );

	//AAR
	if(MyKFPC!= none && MyKFPC.MatchStats != none && class'KFPerk_Berserker'!= none){MyKFPC.MatchStats.RecordSecondaryXPGain(class'KFPerk_Berserker',class'KFPerk_Berserker'.static.GetSmallRadiusKillXP(Difficulty));};
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

		// keep a running tally for analytics at the end of the match
		PerRoundWeldXP += XPEarned;

		// reset/rollover points needed for next xp gain
		WeldingPoints = WeldingPoints % WeldingPointsRequired;

		if (bLogStatsWrite) LogInternal(GetFuncName() @ "Welding XP earned :" @ XPEarned);
	}

	// We need the welding points to be persistent
	SetIntStat( 22,  WeldingPoints );

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

		// keep a running tally for analytics at the end of the match
		PerRoundHealXP += XPEarned;

		// reset/rollover points needed for next xp gain
		HealingPoints = HealingPoints % HealingPointsRequired;

		if (bLogStatsWrite) LogInternal(GetFuncName() @ "Healing XP earned :" @ XPEarned);
	}

	// We need the welding points to be persistent
	SetIntStat( 42,  HealingPoints );

	return XPEarned;
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

function bool IsAchievementUnlocked( int AchievementIndex )
{
	return ( AchievementIndex < Achievements.length ) && Achievements[AchievementIndex].bWasAchievedOnline;
}

function OnUnlockAchievement( int AchievementIndex )
{
	//Reload the achievement list to get the change
	GetAchievements();
}

/**
 * @brief Call into native to determine if we achieved anything
  *
 * @param MapName The name of the map played
 * @param Difficulty The game's difficulty
 * @param GameLength short/medium/long
 * @param bCoop mutiplayer or not
  */
native final function OnGameWon( string MapName, byte Difficulty, byte GameLength, byte bCoop );

/**
 * @brief Check for map specific achievements on game end
 *
 * @param MapName The name of the map played
 * @param Difficulty The game's difficulty
 * @param GameLength short/medium/long
 * @param bCoop mutiplayer or not
 */
native final function CheckMapEndAchievements( string MapName, byte Difficulty, byte bCoop );

defaultproperties
{
   XPTable(0)=2640
   XPTable(1)=2917
   XPTable(2)=3224
   XPTable(3)=3562
   XPTable(4)=3936
   XPTable(5)=4349
   XPTable(6)=4806
   XPTable(7)=5311
   XPTable(8)=5868
   XPTable(9)=6484
   XPTable(10)=7165
   XPTable(11)=7918
   XPTable(12)=8749
   XPTable(13)=9667
   XPTable(14)=10683
   XPTable(15)=11804
   XPTable(16)=13044
   XPTable(17)=14413
   XPTable(18)=15927
   XPTable(19)=17599
   XPTable(20)=19447
   XPTable(21)=21489
   XPTable(22)=23745
   XPTable(23)=26238
   XPTable(24)=28993
   Properties(0)=(Data=(Type=SDT_Int32))
   Properties(1)=(PropertyId=1,Data=(Type=SDT_Int32))
   Properties(2)=(PropertyId=2,Data=(Type=SDT_Int32))
   Properties(3)=(PropertyId=10,Data=(Type=SDT_Int32))
   Properties(4)=(PropertyId=11,Data=(Type=SDT_Int32))
   Properties(5)=(PropertyId=20,Data=(Type=SDT_Int32))
   Properties(6)=(PropertyId=21,Data=(Type=SDT_Int32))
   Properties(7)=(PropertyId=30,Data=(Type=SDT_Int32))
   Properties(8)=(PropertyId=31,Data=(Type=SDT_Int32))
   Properties(9)=(PropertyId=40,Data=(Type=SDT_Int32))
   Properties(10)=(PropertyId=41,Data=(Type=SDT_Int32))
   Properties(11)=(PropertyId=50,Data=(Type=SDT_Int32))
   Properties(12)=(PropertyId=51,Data=(Type=SDT_Int32))
   Properties(13)=(PropertyId=60,Data=(Type=SDT_Int32))
   Properties(14)=(PropertyId=61,Data=(Type=SDT_Int32))
   Properties(15)=(PropertyId=70,Data=(Type=SDT_Int32))
   Properties(16)=(PropertyId=71,Data=(Type=SDT_Int32))
   Properties(17)=(PropertyId=80,Data=(Type=SDT_Int32))
   Properties(18)=(PropertyId=81,Data=(Type=SDT_Int32))
   Properties(19)=(PropertyId=90,Data=(Type=SDT_Int32))
   Properties(20)=(PropertyId=91,Data=(Type=SDT_Int32))
   Properties(21)=(PropertyId=200,Data=(Type=SDT_Int32))
   Properties(22)=(PropertyId=201,Data=(Type=SDT_Int32))
   Properties(23)=(PropertyId=22,Data=(Type=SDT_Int32))
   Properties(24)=(PropertyId=42,Data=(Type=SDT_Int32))
   Properties(25)=(PropertyId=202,Data=(Type=SDT_Int32))
   Properties(26)=(PropertyId=203,Data=(Type=SDT_Int32))
   Properties(27)=(PropertyId=2000,Data=(Type=SDT_Int32))
   Properties(28)=(PropertyId=2001,Data=(Type=SDT_Int32))
   Properties(29)=(PropertyId=2002,Data=(Type=SDT_Int32))
   Properties(30)=(PropertyId=2003,Data=(Type=SDT_Int32))
   Properties(31)=(PropertyId=2004,Data=(Type=SDT_Int32))
   Properties(32)=(PropertyId=2005,Data=(Type=SDT_Int32))
   Properties(33)=(PropertyId=2006,Data=(Type=SDT_Int32))
   Properties(34)=(PropertyId=2007,Data=(Type=SDT_Int32))
   ViewIds(0)=1
   Name="Default__KFOnlineStatsWrite"
   ObjectArchetype=OnlineStatsWrite'Engine.Default__OnlineStatsWrite'
}
