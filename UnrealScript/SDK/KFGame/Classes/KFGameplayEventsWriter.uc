//=============================================================================
// KFGameplayEventsWriter
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - @author Jonathan Howard 140807
//  - Author 11/1/2013
//=============================================================================

class KFGameplayEventsWriter extends GameplayEventsWriter
	config(GameStats)
	native(Analytics);

`include(KFGame\KFGameAnalytics.uci);

/*
 * Gameplay
 */

/* Wave/Match Events */
const GAMEEVENT_WAVE_START = 					1001;
const GAMEEVENT_WAVE_END = 						1002;
const GAMEEVENT_SURVIVAL_INFO =					1003;
const GAMEEVENT_MATCH_WON = 					1009;

/* Zed events*/
const GAMEEVENT_ZED_DIED =						1010;
const GAMEEVENT_ZED_SPAWNED =					1011;

/* Player events */
const GAMEEVENT_PLAYER_RELOAD = 				1100;
const GAMEEVENT_PLAYER_PERK_CHANGED = 			1101;
const GAMEEVENT_GRENADE_THROWN = 				1102;

/* Damage Events */
const GAMEEVENT_DAMAGE_GENERIC =				1200;
const GAMEEVENT_PLAYER_HEAL =					1201;
const GAMEEVENT_DOOR_WELD = 					1202;
/* TODO: Populate damage list */

/* XP Events */
const GAMEEVENT_PLAYER_XP_HEAL = 				1300;
const GAMEEVENT_PLAYER_XP_WELD = 				1301;
const GAMEEVENT_PLAYER_XP_SMALL_RADIUS = 		1302;
const GAMEEVENT_PLAYER_XP_STALKER = 			1303;

/* Trader Events */
const GAMEEVENT_PURCHASE_WEAP =					1400;
const GAMEEVENT_PURCHASE_AMMO =					1401;
const GAMEEVENT_PURCHASE_ARMOR =				1402;
const GAMEEVENT_SELL_WEAP =						1403;
const GAMEEVENT_PLAYER_DOSH_DELTA =				1404;

/*
 * Debugging
 */

/** Spawn volume: 1100 - 1110 */
const GAMEEVENT_SPAWNVOLUME_RATING =			2002;
const GAMEEVENT_SPAWNVOLUME_PLAYERS =			2003;
const GAMEEVENT_SPAWNVOLUME_BESTRATING =		2004;

/** AI Events: 1200 - 1299 */
const GAMEEVENT_AI_MOVEFAILURE =				2100;
const GAMEEVENT_AI_BUMP =						2101;
const GAMEEVENT_AI_JUMPSPOT =					2102;
const GAMEEVENT_AI_HITWALL =					2103;
const GAMEEVENT_AI_JUMPOVERWALL =				2104;
const GAMEEVENT_AI_WAITFORDOOR =				2105;
const GAMEEVENT_AI_FINISHEDWAITFORDOOR =		2106;
const GAMEEVENT_AI_FAILEDADJUSTFROMWALL =		2107;
const GAMEEVENT_AI_CHARGEATTACK =				2108;
const GAMEEVENT_AI_CHANGEDENEMY =				2109;
const GAMEEVENT_AI_GETNEXTMOVEGOALFAILURE =		2110;
const GAMEEVENT_AI_REDIRECTEDPATH =				2111;
const GAMEEVENT_AI_BLOCKEDPATH =				2112;
const GAMEEVENT_AI_PATHOBSTRUCTION_FAIL =		2113;
const GAMEEVENT_AI_PATHOBSTRUCTION_REPATH =		2114;
const GAMEEVENT_AI_MOVE_TIMEOUT =				2115;
const GAMEEVENT_AI_INVALIDATE_ANCHOR =			2116;
const GAMEEVENT_AI_ANCHOR_FALLBACK_FAILED =		2117;
const GAMEEVENT_AI_FAILED_ANCHOR =				2118;
const GAMEEVENT_AI_BASED_ON_PAWN =				2119;
const GAMEEVENT_AI_HEADLESS_WANDER =			2120;
const GAMEEVENT_AI_DESTROYED_DOOR =				2121;
const GAMEEVENT_AI_PATHGOALEVAL_ABORT =			2122;
const GAMEEVENT_AI_PATH_FAILURE =				2123;

var globalconfig bool bRecordAIDebugInfo;
var globalconfig bool bRecordDamageEvents;
var globalconfig bool bRecordZedEvents;
var globalconfig bool bUploadPerformanceEvents;

/** Index of file in use by this writer */
var int StatsFileIndex;

/** Emulate a singleton/static variable for the event */
var transient KFAnalyticsZedDeathEvent DeathEvent;
var transient Controller LastDiedController;

cpptext
{
	/** Cleanup the native memory allocations */
	virtual void BeginDestroy();

	/** Turn hit zones into index */
	INT ResolveHitZoneIndex(FHitZoneInfo* HZ);
};

/*
 * @name Aliased resolution functions into script from native (defined from GameplayEventsWriter)
 */

/** Turns a weapon class into an index, possibly adding new information to the array **/
function native int ResolveWeaponClassIndex(class WeaponClass);

/** Turns a damage class into an index, possibly adding new information to the array **/
function native int ResolveDamageClassIndex(class DamageClass);

/** Turns a projectile class into an index, possibly adding new information to the array **/
function native int ResolveProjectileClassIndex(class ProjectileClass);

/** Turns a pawn class into an index, possibly adding new information to the array **/
function native int ResolvePawnIndex(class PawnClass);

/** Turns an actor class into an index, possibly adding new information to the array **/
function native int ResolveActorIndex(Actor Actor);

/**
 *   Creates the archive that we are going to write to
 * @param Filename - name of the file that will be open for serialization
 * @return TRUE if successful, else FALSE
 */
native function bool OpenStatsFile(string Filename);

/**
 *   Can the writer get access to a file to write to (XBOX specific)
 */
native function bool CanAcquireFile();

/**
 * Generates the script wrapper around the native zed death struct
 * @return KFAnalyticsZedDeathEvent or None
 */
native function KFAnalyticsZedDeathEvent GetZedDeathEvent();

/*********************************************************************************************
* @name Match/Wave Event Info
**********************************************************************************************/

function LogSurvivalInfo(int GameDifficulty, int GameLength)
{
	local GenericParamListStatEntry PLE;

	PLE = GetGenericParamListEntry();
	PLE.AddInt('EventID', `StatID(SURVIVAL_INFO));
	PLE.AddInt('GameDifficulty', GameDifficulty);
	PLE.AddInt('GameLength', GameLength);

	PLE.CommitToDisk();
}


/*********************************************************************************************
* @name Player/Zed specific gameplay events
**********************************************************************************************/

native function LogKFDamageEvent(int EventID, Controller Instigator, KFPawn Victim, int HitZone, int Damage, class<DamageType> DamageType);

native function LogKFPlayerPerk(int EventID, Controller Player, class<KFPerk> PerkClass);

function LogZedKilled(Controller Killer, Controller Monster, KFPawn_Monster MonsterPawn)
{
	if (DeathEvent == None)
	{
		DeathEvent = GetZedDeathEvent();
		if (DeathEvent != None)
		{
			DeathEvent.SetBasicInfo(Killer, Monster, MonsterPawn);
		}
	}
	else
	{
		`warn("Calling LogZedKilled() without committing previous context!");
		DeathEvent = None;
		LogZedKilled(Killer, Monster, MonsterPawn);
	}
}

function LogZedKilledPerPlayer(Controller Player, float DamageDealt, int ReceivedExp, int ReceivedDosh, class<KFPerk> Perk)
{
	if (DeathEvent != None)
	{
		DeathEvent.AddPerPlayer(Player, DamageDealt, ReceivedExp, ReceivedDosh, Perk);
	}
	else
	{
		`warn("Calling LogZedKilledPerPlayer() without an initialized context!");
	}
}

function LogPlayerWeaponReload(KFWeapon Weap, Controller Player)
{
	local GenericParamListStatEntry PLE;

	PLE = GetGenericParamListEntry();
	PLE.AddInt('EventID', `StatID(PLAYER_RELOAD));
	PLE.AddInt('PlayerIndex', ResolvePlayerIndex(Player));
	PLE.AddInt('WeaponName', ResolveWeaponClassIndex(Weap.class));
	PLE.AddVector('PlayerLocation', Player.Location);
	PLE.AddInt('AmmoCount', Weap.AmmoCount[0]);
	PLE.AddInt('SpareAmmoCount', Weap.SpareAmmoCount[0]);
	PLE.AddInt('MagazineCapacity', Weap.MagazineCapacity[0]);

	PLE.CommitToDisk();
}

function LogPlayerHealEvent(int Amount, Controller Healer, class<DamageType> DamageType, Controller Recipient, int DoshEarned)
{
	local GenericParamListStatEntry PLE;

	PLE = GetGenericParamListEntry();
	PLE.AddInt('EventID', `StatID(PLAYER_HEAL));
	PLE.AddInt('Amount', Amount);
	PLE.AddInt('DoshEarned', DoshEarned);
	PLE.AddInt('HealerIndex', ResolvePlayerIndex(Healer));
	PLE.AddInt('RecipientIndex', ResolvePlayerIndex(Recipient));
	PLE.AddInt('DamageClassIndex', ResolveDamageClassIndex(DamageType));

	PLE.CommitToDisk();
}

function LogDoorWeldEvent(int Amount, int MaxWeldIntegrity, int PostWeldIntegrity, Controller Welder, Controller Damager, Actor Door)
{
	local GenericParamListStatEntry PLE;

	PLE = GetGenericParamListEntry();
	PLE.AddInt('EventID', `StatID(DOOR_WELD));
	PLE.AddInt('Amount', Amount);
	PLE.AddInt('MaxWeldIntegrity', MaxWeldIntegrity);
	PLE.AddInt('PostWeldIntegrity', PostWeldIntegrity);
	PLE.AddInt('Welder', ResolvePlayerIndex(Welder));
	PLE.AddInt('Damager', ResolvePlayerIndex(Damager));
	PLE.AddInt('DoorActor', ResolveActorIndex(Door));

	PLE.CommitToDisk();
}

/* Log How Much Dosh was Spent/Earned at the Trader  */
function LogPlayerDoshDelta( Controller Player, int DoshDelta )
{
	local GenericParamListStatEntry PLE;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', `StatID(PLAYER_DOSH_DELTA) );
	PLE.AddInt( 'PlayerIndex', ResolvePlayerIndex(Player) );
	PLE.AddInt( 'DoshDelta', DoshDelta );

	PLE.CommitToDisk();
}

/* Log what the player purchased/sold and how much ammo when applicable */
function LogTraderTransactions( int EventID, Controller Player, class<Actor> TraderItem, optional int AmmoPurchased, optional bool bSecondaryAmmo = false )
{
	local GenericParamListStatEntry PLE;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', EventID );
	PLE.AddInt( 'PlayerIndex', ResolvePlayerIndex(Player) );
	PLE.AddInt( 'WeaponName', ResolveWeaponClassIndex(TraderItem) );
	PLE.AddInt( 'AmmoPurchased', AmmoPurchased );
	PLE.AddString( 'SecondaryAmmo', bSecondaryAmmo );

	PLE.CommitToDisk();
}

/* Log how much armor the player purchased */
function LogArmorPurchase( int EventID, Controller Player, int ArmorPurchased )
{
	local GenericParamListStatEntry PLE;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', EventID );
	PLE.AddInt( 'PlayerIndex', ResolvePlayerIndex(Player) );
	PLE.AddInt( 'ArmorPurchased', ArmorPurchased );

	PLE.CommitToDisk();
}


/**
* Logs the location of all players when this event occurred
*
* @param EventId the event being logged
*/
native function LogAllPlayerPositionsEvent(int EventId);

function LogSpawnVolumeRating( KFSpawnVolume SpawnVolume, float FinalRating, float UsageRating, float LocationRating )
{
	local GenericParamListStatEntry  PLE;
	local vector InteriorBB;
	local string ToolTipText;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID',GAMEEVENT_SPAWNVOLUME_RATING);
	PLE.AddVector( 'BaseLocation', SpawnVolume.Location );
	PLE.AddString('Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_TrafficLight'");
	PLE.AddString('Name', SpawnVolume.Name );
	PLE.AddVector( 'BoxLoc', SpawnVolume.Location );
	PLE.AddVector('BoxColor',vect(0,255,0));
	InteriorBB = SpawnVolume.VisibilityBounds.BoxExtent;
	PLE.AddVector( 'BoxExtent', InteriorBB );
	PLE.AddVector('HeatmapPoint',SpawnVolume.Location);
	ToolTipText = "Final Rating: "$FinalRating$"\nUsage Rating: "$UsageRating$"\nLocation Rating: "$LocationRating;
	PLE.AddString('Text',ToolTipText);
	PLE.CommitToDisk();

}

function LogPlayersAtSpawn( KFPlayerController KFPC, vector ViewLoc, rotator ViewRot )
{
	local GenericParamListStatEntry  PLE;
	local string ToolTipText;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID',GAMEEVENT_SPAWNVOLUME_PLAYERS);
	PLE.AddVector( 'BaseLocation', ViewLoc );
	PLE.AddString('Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Attractor'");
	PLE.AddString('Name', KFPC.Name );
	ToolTipText = "Player: "$KFPC.Name$"\nViewLoc: "$ViewLoc$"\nViewRot: "$ViewRot;
	PLE.AddString('Text',ToolTipText);
	PLE.AddVector( 'LineStart', ViewLoc );
	PLE.AddVector('LineColor',vect(0,255,0));
	PLE.AddVector( 'LineEnd', ViewLoc + vector(ViewRot) * 750.f );
	PLE.AddInt('PlayerIndex',ResolvePlayerIndex(KFPC));

	PLE.CommitToDisk();
}

function LogBestSpawnVolume(KFSpawnVolume KFSV, int WaveNum, int SpawnCount)
{
	local GenericParamListStatEntry  PLE;
	local string ToolTipText;
	local vector InteriorBB;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID',GAMEEVENT_SPAWNVOLUME_BESTRATING);
	PLE.AddVector( 'BaseLocation', KFSV.Location );
	PLE.AddString('Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Spawn'");
	PLE.AddString('Name',KFSV.Name);
	ToolTipText = "Wave " $WaveNum $"\nSpawned "$ SpawnCount $" Zeds" $"\nTimes chosen for spawn: "$KFSV.VolumeChosenCount;
	PLE.AddString('Text',ToolTipText);
	PLE.AddVector( 'BoxLoc', KFSV.Location );
	InteriorBB = KFSV.VisibilityBounds.BoxExtent;
	PLE.AddVector( 'BoxExtent', InteriorBB );
	PLE.AddVector('HeatmapPoint',KFSV.Location);
	PLE.CommitToDisk();
}


/*********************************************************************************************
* AI specific gameplay events
**********************************************************************************************/

function LogAIPathFailure( KFAIController KFAIC, NavigationPoint Anchor, actor Goal, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;
	local int i;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', GAMEEVENT_AI_PATH_FAILURE );
	PLE.AddVector( 'BaseLocation', KFAIC.Pawn.Location );
	PLE.AddString( 'Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Repulsor'" );
	PLE.AddString( 'Name',KFAIC.Pawn.Name );
	if( Anchor != None )
	{
		PLE.AddVector( 'SphereLoc', Anchor.Location );
		PLE.AddFloat( 'SphereRadius', 32.f );
		PLE.AddVector( 'SphereColor', vect(0,255,0) );
	}
	if( Goal != None )
	{
		PLE.AddVector( 'LineStart', KFAIC.Pawn.Location );
		PLE.AddVector( 'LineEnd', KFAIC.MoveGoal.Location );
		PLE.AddVector( 'LineColor', vect(0,0,255) );
	}
	if( KFAIC.RouteCache.Length > 0 )
	{
		ToolTipText = ToolTipText$" RCItems:"$KFAIC.RouteCache.Length;
		for( i = 0; i < KFAIC.RouteCache.Length; i++ )
		{
			ToolTipText = ToolTipText$" RC0:"$KFAIC.RouteCache[i];
		}
	}

	ToolTipText = ToolTipText;
	PLE.AddString( 'Text', ToolTipText );
	PLE.AddVector( 'HeatmapPoint', KFAIC.Pawn.Location);
	PLE.CommitToDisk();
}

function LogAIHeadlessWander( KFAIController KFAIC, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', GAMEEVENT_AI_HEADLESS_WANDER );
	PLE.AddVector( 'BaseLocation', KFAIC.Pawn.Location );
	PLE.AddString( 'Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Repulsor'" );
	PLE.AddString( 'Name',KFAIC.Pawn.Name );

	ToolTipText = ToolTipText;
	PLE.AddString( 'Text', ToolTipText );
	PLE.AddVector( 'HeatmapPoint', KFAIC.Pawn.Location);
	PLE.CommitToDisk();
}

function LogAIBasedOnPawn( KFAIController KFAIC, Pawn BasePawn, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', GAMEEVENT_AI_BASED_ON_PAWN );
	PLE.AddVector( 'BaseLocation', KFAIC.Pawn.Location );
	PLE.AddString( 'Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Repulsor'" );
	PLE.AddString( 'Name',KFAIC.Pawn.Name );
	ToolTipText = ToolTipText;
	PLE.AddString( 'Text', ToolTipText );
	PLE.AddVector( 'LineStart', KFAIC.Pawn.Location );
	PLE.AddVector( 'LineEnd', BasePawn.Location );
	PLE.AddVector( 'HeatmapPoint', KFAIC.Pawn.Location);
	PLE.CommitToDisk();
}

/*********************************************************************************************
* Anchor issues
* Checking issues with NPC path starting navigation points.
********************************************************************************************* */

/** This is evil - when initial abort for Goal_At evaluator happens, when NPC's anchor is also the goal */
function LogAIPathGoalEvalAbort( KFAIController KFAIC, PathGoalEvaluator PathEvaluator, NavigationPoint StartNav, string ToolTipText )
{
	local GenericParamListStatEntry	PLE;
	local KFPawn					NPC;

	if ( !bRecordAIDebugInfo ) return;

	// Get the NPC Controller's KFPawn
	NPC = KFAIC.MyKFPawn;

	PLE = GetGenericParamListEntry();
	// For the visualizer to work, add the event ID param for the define you added in KFGameAnalytics.uci
	PLE.AddInt( 'EventID', GAMEEVENT_AI_PATHGOALEVAL_ABORT );
	// For the visualizer to work, you must also add the 'name' parameter - the name of the main actor involved should be fine
	PLE.AddString( 'Name', NPC.Name );
	// For the visualizer to work, you must add a BaseLocation vector, which is where the sprite will be drawn
	PLE.AddVector( 'BaseLocation', NPC.Location );
	// The sprite to render at BaseLocation
	PLE.AddString( 'Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Repulsor'" );
	// This is the text to show as a tooltip when the mouse pointer is hovering over a gameplayevent icon
	PLE.AddString( 'Text', ToolTipText );
	// Define a red line to render from the NPC to StartNav's location, using the 'LineStart' and 'LineEnd' parameters
	PLE.AddVector( 'LineStart', NPC.Location );
	PLE.AddVector( 'LineEnd', StartNav.Location );
	PLE.AddVector( 'LineColor', vect(255,0,0) );
	// Define a red sphere to render at StartNav's location
	PLE.AddVector( 'SphereLoc', StartNav.Location );
	PLE.AddFloat( 'SphereRadius', 32.f );
	PLE.AddVector( 'SphereColor', vect(255,0,0) );
	// Marks the pawn's location for the HeatMapVisualizer
	PLE.AddVector( 'HeatmapPoint', NPC.Location );
	// Save the data
	PLE.CommitToDisk();
}

function LogAIDestroyedDoor( KFAIController KFAIC, KFDoorActor Door, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', GAMEEVENT_AI_DESTROYED_DOOR );
	PLE.AddVector( 'BaseLocation', Door.Location );
	PLE.AddString( 'Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Repulsor'" );
	PLE.AddString( 'Name',KFAIC.Pawn.Name );
	PLE.AddString( 'Text', ToolTipText );
	PLE.AddVector( 'LineStart', Door.Location );
	PLE.AddVector( 'LineEnd', KFAIC.Pawn.Location );
	PLE.AddVector( 'HeatmapPoint', Door.Location );
	PLE.CommitToDisk();
}

/**
 *	This is very bad - it happens when an NPC cannot find a valid starting navigation point when
 *	generating a path. FindPath will fail, and no partial path will be found either. This is a
 *	time when something has gone very wrong (like the NPC spawned in an invalid location with
 *	no pathnodes). Teleporting the NPC to the nearest NavigationPoint that's not visible to
 *	players is the quick-fix if other attempts fail (moving a bit and trying to find a valid anchor
 *	again, etc).
 */
function LogAIFailedAnchor( int EventID, KFAIController KFAIC, Actor MoveTarget, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', GAMEEVENT_AI_ANCHOR_FALLBACK_FAILED);
	PLE.AddVector( 'BaseLocation', KFAIC.Pawn.Location );
	PLE.AddString( 'Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Repulsor'" );
	PLE.AddString( 'Name',KFAIC.Pawn.Name );

	if( MoveTarget != none )
	{
		ToolTipText = ToolTipText$" MoveTarget:"$MoveTarget;
		PLE.AddString( 'Text', ToolTipText );
		PLE.AddVector( 'LineStart', KFAIC.Pawn.Location );
		PLE.AddVector( 'LineEnd', MoveTarget.Location );
	}
	PLE.AddVector( 'HeatmapPoint',KFAIC.Pawn.Location);
	PLE.CommitToDisk();
}

/**
 *	An NPC on a path has been unexpectedly blocked, and the HandlePathObstruction() event
 *	successfully built a path around it.
 */
function LogAIPathObstruction( int EventID, KFAIController KFAIC, Actor Obstruction, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;
	local float Radius, Height;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', EventID ); //GAMEEVENT_AI_PATHOBSTRUCTION_REPATH);
	PLE.AddVector( 'BaseLocation', KFAIC.Pawn.Location );
	PLE.AddString( 'Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Repulsor'" );
	PLE.AddString( 'Name',KFAIC.Pawn.Name );

	PLE.AddVector( 'SphereLoc', Obstruction.Location );
	Obstruction.GetBoundingCylinder( Radius,Height) ;
	PLE.AddFloat( 'SphereRadius',Radius );
	PLE.AddVector( 'SphereColor',vect(255,0,0) );

	ToolTipText = ToolTipText$" Obstruction:"$Obstruction;
	PLE.AddString( 'Text', ToolTipText );
	PLE.AddVector( 'LineStart', KFAIC.Pawn.Location );
	PLE.AddVector( 'LineEnd', Obstruction.Location );
	PLE.AddVector( 'HeatmapPoint',KFAIC.Pawn.Location);
	PLE.CommitToDisk();
}

/**
 *	Sometimes an NPC is blocked by something unexpected when on a path. After a few re-tries,
 *	the NPC will often temporarily block the next pathnode he's attempting to reach and generate
 *	a new path, in an effort to path around the obstruction.
 */
function LogAIBlockedPath( KFAIController KFAIC, NavigationPoint Start, NavigationPoint End, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', GAMEEVENT_AI_BlockedPath);
	PLE.AddVector( 'BaseLocation', KFAIC.Pawn.Location );
	PLE.AddString( 'Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Repulsor'" );
	PLE.AddString( 'Name',KFAIC.Pawn.Name );
	ToolTipText = ToolTipText$" MoveTarget: "$KFAIC.MoveTarget$" MoveGoal: "$KFAIC.MoveTarget;
	PLE.AddString( 'Text', ToolTipText );
	PLE.AddVector( 'LineStart', Start.Location );
	PLE.AddVector( 'LineEnd', End.Location );
	PLE.AddVector( 'HeatmapPoint',KFAIC.Pawn.Location);
	PLE.CommitToDisk();
}

/**
 *	An NPC using the AIMoveToGoal command has decided to alter its path due to an obstruction, which
 *	can include other Zeds, doors, welded doors, etc.
 */
function LogAIRedirectedPath( KFAIController KFAIC, actor MoveGoal, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;

	if ( !bRecordAIDebugInfo ) return;

	`AILog_Ext( KFAIC.Pawn$" GAMEEVENT_AI_REDIRECTEDPATH at "$KFAIC.Pawn.Location$" MoveGoal: "$MoveGoal$" ToolTipText: "$ToolTipText, 'Critical', KFAIC );

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', GAMEEVENT_AI_REDIRECTEDPATH );
	PLE.AddVector( 'BaseLocation', KFAIC.Pawn.Location );
	PLE.AddString( 'Sprite', "Texture2D'EditorResources.Crowd.T_Crowd_Repulsor'" );
	PLE.AddString( 'Name', KFAIC.Pawn.Name );
	ToolTipText = ToolTipText$" Base: "$KFAIC.Pawn.Base$" MG Dist:"$VSize(MoveGoal.Location - KFAIC.Pawn.Location)$" SS? "$KFAIC.MyKFPawn.IsUsingSuperSpeed();
	//ToolTipText = "Wave " $WaveNum $"\nSpawned "$ SpawnCount $" Zeds" $"\nTimes chosen for spawn: "$KFSV.VolumeChosenCount;
	PLE.AddString( 'Text', ToolTipText );
	PLE.AddVector( 'LineStart', KFAIC.Pawn.Location );
	PLE.AddVector( 'LineEnd', KFAIC.Pawn.Location + vector(KFAIC.Pawn.Rotation) * 350.f );
	if( KFAIC.MoveGoal != none )
	{
		PLE.AddVector( 'SecondLineStart', KFAIC.Pawn.Location );
		PLE.AddVector( 'SecondLineEnd', KFAIC.MoveGoal.Location );
		PLE.AddVector( 'SecondLineColor', vect(1,1,0) );
	}
	PLE.AddVector( 'HeatmapPoint',KFAIC.Pawn.Location);
	PLE.CommitToDisk();
}

function LogAIMoveFailure( KFAIController KFAIC, vector NPCLocation, rotator NPCRotation, actor MoveGoal, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', GAMEEVENT_AI_MOVEFAILURE );
	PLE.AddVector( 'BaseLocation', NPCLocation );
	PLE.AddString( 'Sprite', "Texture2D'EditorResources.Crowd.T_Crowd_Crosswalk'" );
	PLE.AddString( 'Name', KFAIC.Pawn.Name );
	if( MoveGoal != none )
	{
		ToolTipText = ToolTipText$" MG Dist:"$VSize(MoveGoal.Location - KFAIC.Pawn.Location)$" SS? "$KFAIC.MyKFPawn.IsUsingSuperSpeed();
	}
	else
	{
		ToolTipText = ToolTipText$" SS? "$KFAIC.MyKFPawn.IsUsingSuperSpeed();
	}
	if( KFAIC.MyKFPawn.Base != none )
	{
		ToolTipText = ToolTipText$" Base:"$KFAIC.MyKFPawn.Base;
	}
	else
	{
		ToolTipText = ToolTipText$" NO BASE!";
	}
	//ToolTipText = "Wave " $WaveNum $"\nSpawned "$ SpawnCount $" Zeds" $"\nTimes chosen for spawn: "$KFSV.VolumeChosenCount;
	PLE.AddString( 'Text', ToolTipText );
	PLE.AddVector( 'LineStart', NPCLocation );
	PLE.AddVector( 'LineEnd', NPCLocation + vector(NPCRotation) * 350.f );
	if( KFAIC.MoveGoal != none || KFAIC.MoveTarget != none )
	{
		PLE.AddVector( 'SecondLineStart', NPCLocation );
		if( KFAIC.MoveTarget != none )
		{
			PLE.AddVector( 'SecondLineEnd', KFAIC.MoveTarget.Location );
		}
		else
		{
			PLE.AddVector( 'SecondLineEnd', KFAIC.MoveGoal.Location );
		}
		PLE.AddVector( 'SecondLineColor', vect(1,1,0) );
	}
	PLE.AddVector( 'HeatmapPoint', NPCLocation );
	PLE.CommitToDisk();
}

function LogAIGetNextMoveGoalFailure( KFAIController KFAIC, vector NPCLocation, rotator NPCRotation, actor MoveGoal, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;

	if ( !bRecordAIDebugInfo ) return;

	`AIlog_Ext( KFAIC.Pawn$" LogAIGetNextMoveGoalFailure at "$NPCLocation$" MoveGoal: "$MoveGoal$" ToolTipText: "$ToolTipText, 'PathWarning', KFAIC );
// 	KFAIC.AIBugItStringCreator( KFAIC.Pawn.Location, KFAIC.Pawn.Rotation, GoString, LocString );
// 	`Log( GoString );
// 	`Log( LocString );
	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', GAMEEVENT_AI_GETNEXTMOVEGOALFAILURE );
	PLE.AddVector( 'BaseLocation', NPCLocation );
	PLE.AddString( 'Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Spawn'" );
	PLE.AddString( 'Name',KFAIC.Pawn.Name );
	ToolTipText = ToolTipText$" Base: "$KFAIC.Pawn.Base$" MG Dist:"$VSize(MoveGoal.Location - KFAIC.Pawn.Location)$" SS: "$KFAIC.MyKFPawn.IsUsingSuperSpeed();
	//ToolTipText = "Wave " $WaveNum $"\nSpawned "$ SpawnCount $" Zeds" $"\nTimes chosen for spawn: "$KFSV.VolumeChosenCount;
	PLE.AddString( 'Text', ToolTipText );
	PLE.AddVector( 'LineStart', NPCLocation );
	PLE.AddVector( 'LineEnd', NPCLocation + vector(NPCRotation) * 350.f );
	if( KFAIC.MoveGoal != none )
	{
		PLE.AddVector( 'SecondLineStart', NPCLocation );
		PLE.AddVector( 'SecondLineEnd', KFAIC.MoveGoal.Location );
		PLE.AddVector( 'SecondLineColor', vect(1,1,0) );
	}
	PLE.AddVector( 'HeatmapPoint',NPCLocation);
	PLE.CommitToDisk();
}

/**
 * LogAIChargeAttack()
 * @param	KFAIC			   	KFAIController
 * @param	ChargeStartLocation	NPC's location at start of the charge attack
 * @param	ChargeEndLocation  	NPC's location when finished the charge attack
 * @param	ToolTipText		   	ToolTip text shown for this event's icon
 */
function LogAIChargeAttack( KFAIController KFAIC, vector ChargeStartLocation, vector ChargeEndLocation, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID',GAMEEVENT_AI_CHARGEATTACK );
	PLE.AddVector( 'BaseLocation', ChargeStartLocation );
	PLE.AddString( 'Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Attractor'" );
	PLE.AddString( 'Name',KFAIC.Pawn.Name );
	ToolTipText = ToolTipText$" Enemy: "$KFAIC.Enemy;
	//ToolTipText = "Wave " $WaveNum $"\nSpawned "$ SpawnCount $" Zeds" $"\nTimes chosen for spawn: "$KFSV.VolumeChosenCount;
	PLE.AddString( 'Text', ToolTipText );
	PLE.AddVector( 'LineStart', ChargeStartLocation );
	PLE.AddVector( 'LineEnd', ChargeEndLocation );
	PLE.AddVector( 'HeatmapPoint', ChargeStartLocation );
	PLE.CommitToDisk();
}

/**
 * LogAIBump()
 * @param	KFAIC	   	KFAIController
 * @param	NPCLocation	NPC's Location at time of event
 * @param	NPCRotation	NPC's Rotation at time of event
 * @param	Other	   	Other actor that was bumped into
 * @param	ToolTipText	ToolTip text shown for this event's icon
 */
function LogAIBump( int EventID, KFAIController KFAIC, vector NPCLocation, rotator NPCRotation, actor Other, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID',GAMEEVENT_AI_BUMP );
	PLE.AddVector( 'BaseLocation', NPCLocation );
	PLE.AddString( 'Sprite', "Texture2D'EditorResources.Crowd.T_Crowd_TrafficLight'" );
	PLE.AddString( 'Name',KFAIC.Pawn.Name );
	ToolTipText = ToolTipText$" Other: "$Other$" Base: "$KFAIC.Pawn.Base$" SS: "$KFAIC.MyKFPawn.IsUsingSuperSpeed()$" Command: "$KFAIC.CachedAICommandList;
	PLE.AddString( 'Text', ToolTipText );
	PLE.AddVector( 'LineStart', NPCLocation );
	PLE.AddVector( 'LineEnd', NPCLocation + vector(NPCRotation) * 750.f );
	PLE.AddVector( 'HeatmapPoint',NPCLocation );
	PLE.CommitToDisk();
}

/**
 * LogAIFailedAdjustFromWall()
 * @param	KFAIC	   	KFAIController
 * @param	NPCLocation	NPC's Location at time of event
 * @param	NPCRotation	NPC's Rotation at time of event
 * @param	Wall	   	Wall actor that NPC couldn't adjust around
 * @param	ToolTipText	ToolTip text shown for this event's icon
 */
function LogAIWall( int EventID, KFAIController KFAIC, vector NPCLocation, rotator NPCRotation, actor Wall, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', EventID); // GAMEEVENT_AI_FAILEDADJUSTFROMWALL );
	PLE.AddVector( 'BaseLocation', NPCLocation );
	PLE.AddString( 'Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Spawn'" );
	PLE.AddString( 'Name',KFAIC.Pawn.Name );
	ToolTipText = ToolTipText$" Wall: "$Wall$" Phys: "$KFAIC.Pawn.GetPhysicsName()$" SS: "$KFAIC.MyKFPawn.IsUsingSuperSpeed();
	PLE.AddString( 'Text', ToolTipText );
	PLE.AddVector( 'LineStart', NPCLocation );
	PLE.AddVector( 'LineEnd', NPCLocation + vector(NPCRotation) * 250.f );
	PLE.AddVector( 'HeatmapPoint',NPCLocation );
	PLE.CommitToDisk();
}


/**
 * LogAIWaitForDoor()
 * @param	KFAIC	   	KFAIController
 * @param	NPCLocation	NPC's Location at time of event
 * @param	Door	   	Door that NPC must wait for
 * @param	ToolTipText	ToolTip text shown for this event's icon
 */
function LogAIDoor( int EventID, KFAIController KFAIC, vector NPCLocation, KFDoorActor Door, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;

	if ( !bRecordAIDebugInfo ) return;

	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID', EventID); // GAMEEVENT_AI_WAITFORDOOR );
	PLE.AddVector( 'BaseLocation', NPCLocation );
	PLE.AddString( 'Sprite',"Texture2D'EditorResources.door'" );
	PLE.AddString( 'Name',KFAIC.Pawn.Name );
	ToolTipText = ToolTipText$" Command: "$KFAIC.CachedAICommandList;
	PLE.AddString( 'Text', ToolTipText );
	PLE.AddVector( 'LineStart', NPCLocation );
	PLE.AddVector( 'LineEnd', Door.Location );
	PLE.AddVector( 'HeatmapPoint', NPCLocation );
	PLE.CommitToDisk();
}

/**
 * LogAIJumpSpot()
 * @param	KFAIC	   	KFAIController
 * @param	NPCLocation	NPC's Location at time of event
 * @param	NPCRotation	NPC's Rotation at time of event
 * @param	JumpSpot   	JumpSpot that was used
 * @param	ToolTipText	ToolTip text shown for this event's icon
 */
//function LogAIJumpSpot( KFAIController KFAIC, vector NPCLocation, rotator NPCRotation, KFJumpSpot JumpSpot, string ToolTipText )
//{
//	local GenericParamListStatEntry  PLE;

//	if ( !bRecordAIDebugInfo ) return;

//	PLE = GetGenericParamListEntry();
//	PLE.AddInt( 'EventID', GAMEEVENT_AI_JUMPSPOT );
//	PLE.AddVector( 'BaseLocation', KFAIC.Pawn.Location );
//	PLE.AddString( 'Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Spawn'" );
//	PLE.AddString( 'Name', KFAIC.Pawn.Name );
//	ToolTipText = ToolTipText$" SSpeed: "$KFAIC.MyKFPawn.IsUsingSuperSpeed();
//	PLE.AddString( 'Text', ToolTipText );
//	// Line to new enemy
//	PLE.AddVector( 'LineStart', KFAIC.Pawn.Location );
//	PLE.AddVector('LineColor',vect(0,255,0));
//	PLE.AddVector( 'LineEnd', JumpSpot.Location );
//	PLE.CommitToDisk();
//}

/**
 * LogAIChangedEnemy()
 * @param	KFAIC	   	KFAIController
 * @param	NewEnemy   	New enemy to begin targeting
 * @param	OldEnemy   	Previous enemy
 * @param	ToolTipText	ToolTip text shown for this event's icon
 */
function LogAIChangedEnemy( KFAIController KFAIC, Pawn NewEnemy, Pawn OldEnemy, string ToolTipText )
{
	local GenericParamListStatEntry  PLE;

	if ( !bRecordAIDebugInfo ) return;


	PLE = GetGenericParamListEntry();
	PLE.AddInt( 'EventID',GAMEEVENT_AI_CHANGEDENEMY);
	PLE.AddVector( 'BaseLocation', KFAIC.Pawn.Location );
	PLE.AddString( 'Sprite',"Texture2D'EditorResources.Crowd.T_Crowd_Behavior'" );
	PLE.AddString( 'Name', KFAIC.Pawn.Name );
	ToolTipText = ToolTipText$" from "$OldEnemy.PlayerReplicationInfo.PlayerName$" to "$NewEnemy.PlayerReplicationInfo.PlayerName$" "$KFAIC.CachedAICommandList;
	PLE.AddString( 'Text', ToolTipText );
	// Line to new enemy
	PLE.AddVector( 'LineStart', KFAIC.Pawn.Location );
	PLE.AddVector('LineColor',vect(0,255,0));
	PLE.AddVector( 'LineEnd', NewEnemy.Location );
	PLE.CommitToDisk();
}

defaultproperties
{
	SupportedEvents.Add((EventID=GAMEEVENT_ZED_DIED,EventName="Zed died",StatGroup=(Group=GSG_Game,Level=3),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_SPAWNVOLUME_RATING,EventName="SpawnVolume Rating",StatGroup=(Group=GSG_Game,Level=3),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_SPAWNVOLUME_PLAYERS,EventName="Player positions at AISpawn",StatGroup=(Group=GSG_Game,Level=3),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_SPAWNVOLUME_BESTRATING,EventName="The best rated spawn volume",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_MOVEFAILURE,EventName="AI move failures",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_BUMP,EventName="AI Bumped",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_JUMPSPOT,EventName="AI using JumpSpot",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_HITWALL,EventName="AI HitWall events",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_JUMPOVERWALL,EventName="AI high-jump locations",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_WAITFORDOOR,EventName="AI waiting for door",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_FINISHEDWAITFORDOOR,EventName="AI finished waiting for door",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_FAILEDADJUSTFROMWALL,EventName="AI Failed AdjustFromWall",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_CHARGEATTACK,EventName="AI charge attack start/end locations",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_CHANGEDENEMY,EventName="AI changed enemy",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_REDIRECTEDPATH,EventName="AI path redirected",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_BLOCKEDPATH,EventName="AI blocked its path",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_PATHOBSTRUCTION_FAIL,EventName="AI Obstructed",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_PATHOBSTRUCTION_REPATH,EventName="AI Obstructed Repath",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_INVALIDATE_ANCHOR,EventName="AI Invalidated Anchor",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_MOVE_TIMEOUT,EventName="AI Move Timed Out",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_ANCHOR_FALLBACK_FAILED,EventName="AI Failed Fallback Anchor",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_FAILED_ANCHOR,EventName="AI Failed Anchor Find",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_BASED_ON_PAWN,EventName="AI Landed On Pawn",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_HEADLESS_WANDER,EventName="AI Headless Wander",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_DESTROYED_DOOR,EventName="AI Destroyed Door",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_PATHGOALEVAL_ABORT,EventName="GoalEval Initial Abort",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
	SupportedEvents.Add((EventID=GAMEEVENT_AI_PATH_FAILURE,EventName="PathFind Failure",StatGroup=(Group=GSG_Game,Level=10),EventDataType=`GET_GenericParamList))
}

