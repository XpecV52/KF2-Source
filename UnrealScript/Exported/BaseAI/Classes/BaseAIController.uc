//=============================================================================
// BaseAIController
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class BaseAIController extends GameAIController
	dependson(BaseAIPawn, PluginBase, AIPluginMovement)
	implements(PlugInOwnerInterface)
	native
	config(AI);

var transient BaseAIPawn	MyBaseAIPawn;
var transient BaseAISquad	BaseSquad;

// ----------------------------------------------------------------------- //
// animation related vars
// ----------------------------------------------------------------------- //

// ----------------------------------------------------------------------- //
// Plugins
// ----------------------------------------------------------------------- //
var const public{protected} array<AITickablePlugin> TickablePlugins;

var instanced PluginSquad	SquadPlugin;

var instanced AIPluginMovement MovementPlugin;
var class<AIPluginMovement> MovementPluginClass;

var instanced AIPluginLeap LeapPlugin;
var class<AIPluginLeap> LeapPluginClass;

var instanced AIPluginStuckFix StuckFixPlugin;
var class<AIPluginStuckFix> StuckFixPluginClass;

// base off KFAICommandHistory
var transient BaseAiPlugInHistory MyAiPlugInHistory;

// ----------------------------------------------------------------------- //
// Movement
// ----------------------------------------------------------------------- //

// ----------------------------------------------------------------------- //
//	perception
// ----------------------------------------------------------------------- //
var bool bUsePerceptionHearing;
var bool bAlwaysAssignEnemy;

/** When last time our enemy was visible */
var	float LastEnemySightedTime;

// ----------------------------------------------------------------------- //
//	firing
// ----------------------------------------------------------------------- //

// ----------------------------------------------------------------------- //
// Target selection/limitation
// ----------------------------------------------------------------------- //
/** List of targets to shoot at */
var array<Actor> TargetList;
/** List of prohibited targets */
var array<Actor> ProhibitedTargetList;

var transient BaseAIPawn SquadAssignedTarget;

struct native LocalEnemyInfo
{
	var array<float>		PerceptionTimestamp;
	var EWSPerceptionMode	LatestPerception;
	var EWSPerceptionMode	DominantPerception;
	var int					VisibleCoverActions;

	var float				CurrentThreat;
	var vector				LatestLocation; //latest location with Seen perception
	var Pawn				Pawn;

	var bool				bSeenBefore;
	var bool				bIsPlayer;

	structcpptext
	{
	/** Constructors */
	FLocalEnemyInfo() {}
	FLocalEnemyInfo(EEventParm)
	{

	}
	FLocalEnemyInfo(APawn* InPawn)
	{
		appMemzero(this, sizeof(FLocalEnemyInfo));
		Pawn = InPawn;
	}

	FORCEINLINE UBOOL CanBeSeenWithAction(BYTE Action) const
	{
		return (VisibleCoverActions & (1 << Action)) != 0;
	}

	UBOOL operator==(const FLocalEnemyInfo& InEnemyInfo) const
	{
		return Pawn == InEnemyInfo.Pawn;
	}

	UBOOL operator==(const APawn* EnemyPawn) const
	{
		return Pawn == EnemyPawn;
	}
	}
};
var array<LocalEnemyInfo> LocalEnemyList;

// ----------------------------------------------------------------------- //
// Attachments and SpecialActionSttachments
// ----------------------------------------------------------------------- //

// ----------------------------------------------------------------------- //
// Enable/Disable Navmesh and plugins
// ----------------------------------------------------------------------- //

/** If this is on, NPC will always try to use Nav Mesh Path Finding Before Path Node */
var bool		bUseNavMesh;
/** If this is on, NPC will always try to use plugins for movement. Only works with navmesh */
var bool		bUsePluginsForMovement;

// ----------------------------------------------------------------------- //
// debug variables
// ----------------------------------------------------------------------- //

var(Debug) config int PlugInHistoryNum;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Called ONCe per class for class specific initialization (e.g. ETQ queries)
 */
event InitializeAIClass()
{
}

event Possess(Pawn inPawn, bool bVehicleTransition)
{
	super.Possess(inPawn, bVehicleTransition);

	if (inPawn != none)
	{
		MyBaseAIPawn = BaseAIPawn(inPawn);






	}
}

function PawnDied(Pawn InPawn)
{
    CleanUp();
	super.PawnDied(InPawn);
}

/** This function needs to stay final */
native final function float UpdateEnemyRange();
native final function EWSSymbolicAngle UpdateEnemyAngle();

native function CleanUp(optional bool bBeingDestroyed);

// ----------------------------------------------------------------------- //
// PlugInOwner interface plimentation
// ----------------------------------------------------------------------- //

function BaseAiPlugInHistory GetAiPlugInHistory()
{
	return MyAiPlugInHistory;
}

function float GetTimeSince( float Time2Test )
{
	return (WorldInfo.TimeSeconds - Time2Test);
}

// ----------------------------------------------------------------------- //
// Squad mechanics
// ----------------------------------------------------------------------- //

native function int BroadcastEnemyKnowledge(Pawn EnemyPawn, EWSPerceptionMode Perception);
native function RemoveEnemy(Pawn EnemyPawn);
native function RemoveAllEnemies();
native final function bool IsFriendlyPawn(Pawn TestPlayer) const;
native noexport function bool IsFriendly(Controller TestPlayer) const;

// ----------------------------------------------------------------------- //
// Animation related
// ----------------------------------------------------------------------- //

// ----------------------------------------------------------------------- //
// perception
// ----------------------------------------------------------------------- //
native final function UpdateEnemyPerception(optional bool bSkipResponseDelay);

/** Selects a target from the TargetList or selects an enemy normally */
native function bool SelectTargetInternal(bool bOnlyFromTargetList);
native event bool SetEnemy(Pawn NewEnemy);
native function bool SelectEnemy();
native function bool SelectTarget();

// @todo this will be handled by squads
//function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
function NotifyKilled(Controller Killer, Controller Killed, pawn KilledPawn, class<DamageType> damageTyp)
{
	// remove focus from killed enemy
	if (KilledPawn == Focus)
	{
		Focus = None;
	}

	// Controller's implementation mess with Enemy, so work on this before calling parent
	RemoveEnemy(KilledPawn);

	super.NotifyKilled(Killer, Killed, KilledPawn, damageTyp);
}

// ----------------------------------------------------------------------- //
// logic flow control
// ----------------------------------------------------------------------- //

// ----------------------------------------------------------------------- //
// Navigation
// ----------------------------------------------------------------------- //

// ----------------------------------------------------------------------- //
// Movement
// ----------------------------------------------------------------------- //

function StopMovement(optional EActionPriority ActionPriority = AP_Logic)
{
	if(MovementPlugin != None)
	{
		MovementPlugin.AbortMove(FALSE);
	}

	if( LeapPlugin != none )
	{
		LeapPlugin.AbortMove(FALSE);
	}

	if( StuckFixPlugin != none )
	{
		StuckFixPlugin.AbortMove(false);
	}
}

// ----------------------------------------------------------------------- //
// Attachments and SpecialActionSttachments
// ----------------------------------------------------------------------- //

// ----------------------------------------------------------------------- //
// Level progress
// ----------------------------------------------------------------------- //

// ----------------------------------------------------------------------- //
// Debug functions
// ----------------------------------------------------------------------- //
native function DrawEnemyPerception(Canvas DrawCanvas);

function DrawDebugTextToHud( HUD HUD, String Text, optional color TextColor );

defaultproperties
{
   bAlwaysAssignEnemy=True
   Name="Default__BaseAIController"
   ObjectArchetype=GameAIController'GameFramework.Default__GameAIController'
}
