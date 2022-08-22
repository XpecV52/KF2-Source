//=============================================================================
// KFPawn_MonsterBoss
//=============================================================================
// A base (abstract) class for the boss character at the end of a wave
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_MonsterBoss extends KFPawn_Monster
	abstract
	native(Pawn);

`include(KFGameDialog.uci)

var KFPlayerController KFPC; //used to notify UI

var localized string BossName;
var localized array<string> BossCaptionStrings;

/** Info for minion wave spawning */
struct native BossMinionWaveInfo
{
    /** The minion wave to spawn for Phase 1 healing*/
    var	KFAIWaveInfo				PhaseOneWave;
    /** The minion wave to spawn for Phase 2 healing*/
    var	KFAIWaveInfo				PhaseTwoWave;
    /** The minion wave to spawn for Phase 3 healing*/
    var	KFAIWaveInfo				PhaseThreeWave;
};

/** Waves to summon at each stage by difficulty level*/
var	BossMinionWaveInfo				SummonWaves[4];

/** The base amount of minions to spawn when boss goes into hunt and heal mode */
var             vector2D                 NumMinionsToSpawn;

/** The current phase of the battle we're in */
var repnotify   int 				CurrentBattlePhase;

/** Whether this pawn is in theatric camera mode */
var 			bool 				bUseAnimatedTheatricCamera;

/** The name of the socket to use as a camera base for theatric sequences */
var 			Name 				TheatricCameraSocketName;

/** The relative offset to use for the cinematic camera */
var 			vector 				TheatricCameraAnimOffset;

/** Scalar to apply to attack range when there is only one player remaining in a multiplayer game */
var 			float				LastPlayerAliveAttackRangeScale;

/** Set when the speed increase timer detects that there is only one player left */
var protected 	float 				LastPlayerAliveStartTime;

/** How long after spawn before the boss starts to increase its speed */
var protected const float			TimeUntilSpeedIncrease;

/** How high the speed limit can go */
var protected const float 			SpeedLimitScalar;

/** How much to increase the sprint speed by (per minute) when the speed increase timer elapses */
var protected const	float 			SpeedPctIncreasePerMinute;

/** The final sprint speed after being modified by SetMonsterDefaults() */
var protected 	float 				ActualSprintSpeed;

replication
{
	if( bNetDirty )
		CurrentBattlePhase;
}

simulated event ReplicatedEvent(name VarName)
{
	if( VarName == nameOf(CurrentBattlePhase) )
	{
		OnBattlePhaseChanged();
	}
	else
	{
		Super.ReplicatedEvent( VarName );
	}
}

// Called immediately before gameplay begins.
simulated event PreBeginPlay()
{
	Super.PreBeginPlay();
	OnBattlePhaseChanged();
	KFPC = KFPlayerController(GetALocalPlayerController());
	if( KFPC != none )
	{
		if(KFPC.MyGFxHUD != none && KFPC.MyGFxHUD.BossHealthBar != none)
		{
			KFPC.MyGFxHUD.BossHealthBar.SetBossPawn(self);
		}
	}
}

// Mostly indistinguishable from PreBeginPlay().  Following Pawn conventions only one is 'simulated'
simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	if( WorldInfo.NetMode != NM_Client )
	{
		`AnalyticsLog(("boss_spawn", None, Class.Name));
	}
}

/** Called from Possessed event when this controller has taken control of a Pawn */
function PossessedBy( Controller C, bool bVehicleTransition )
{
	Super.PossessedBy( C, bVehicleTransition );

	PlayBossMusic();

	// Set a timer to begin increasing this boss's speed after enough time has elapsed
	if( !IsHumanControlled() )
	{
		ActualSprintSpeed = SprintSpeed;
		SetTimer( TimeUntilSpeedIncrease, false, nameOf(Timer_IncreaseSpeed) );
	}
}

/** Gradually increases sprint speed */
function Timer_IncreaseSpeed()
{
	SetTimer( 10.f, false, nameOf(Timer_IncreaseSpeed) );

	if( IsOnePlayerLeftInTeamGame() )
	{
		if( LastPlayerAliveStartTime == 0.f )
		{
			LastPlayerAliveStartTime = WorldInfo.TimeSeconds;
		}

		// Adjust sprint speed but don't let it go below original or higher than 2x
		SprintSpeed = fClamp( ActualSprintSpeed + ((`TimeSince(LastPlayerAliveStartTime) / 60.f) 
						* (ActualSprintSpeed * SpeedPctIncreasePerMinute)), ActualSprintSpeed, ActualSprintSpeed * SpeedLimitScalar );
	}
	else
	{
		LastPlayerAliveStartTime = 0.f;
		SprintSpeed = ActualSprintSpeed;
	}
}

/** Returns the number of minions to spawn based on number of players */
function byte GetNumMinionsToSpawn()
{
	return byte( Lerp(NumMinionsToSpawn.X, NumMinionsToSpawn.Y, fMax(WorldInfo.Game.NumPlayers, 1)/float(WorldInfo.Game.MaxPlayers)) );
}

/** sends any notifications to anything that needs to know this pawn has taken damage */
function NotifyTakeHit(Controller InstigatedBy, vector HitLocation, int Damage, class<DamageType> DamageType, vector Momentum, Actor DamageCauser)
{
	Super.NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum, DamageCauser);

	`DialogManager.PlayBossTakeDamageDialog( self );
}


/** Return true if AI can target this pawn */
function bool CanAITargetThisPawn(Controller TargetingController)
{
    if( TargetingController.Pawn.IsSameTeam( self ) )
    {
        // Don't let weaker zeds target a boss!!!
        return false;
    }

    return Super.CanAITargetThisPawn(TargetingController);
}

/* PlayDying() is called on server/standalone game when killed
and also on net client when pawn gets bTearOff set to true (and bPlayedDeath is false)
*/
simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	local KFGameReplicationInfo KFGRI;

    super.PlayDying( DamageType, HitLoc );

	//@HSL_BEGIN - JRO - 5/17/2016 - PS4 Activity Feeds
	class'GameEngine'.static.GetOnlineSubsystem().PlayerInterfaceEx.PostActivityFeedBossKill(string(Class.Name), WorldInfo.GetMapName(true));
	//@HSL_END

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if( KFGRI != none && !KFGRI.IsFinalWave() )
	{
		return;
	}

	if(KFPC != none)
	{
		KFPC.SetBossCamera( self );
	}
}

/** Called when pawn dies or is destroyed. Overloaded to call OnBattlePhaseChanged. */
simulated function TerminateEffectsOnDeath()
{
	super.TerminateEffectsOnDeath();

	OnBattlePhaseChanged();
}

/** Reapply active gameplay related MIC params (e.g. when switching to the gore mesh) */
simulated function UpdateGameplayMICParams()
{
	super.UpdateGameplayMICParams();
	OnBattlePhaseChanged();
}

/** Returns current battle phase, used by KFPawnAnimInfo */
simulated function int GetCurrentBattlePhase()
{
	return CurrentBattlePhase;
}

/** Called when current battle phase changes */
/* Network: ALL
 */
simulated function OnBattlePhaseChanged()
{
	UpdateBattlePhaseOnLocalPlayerUI();
}

simulated function UpdateBattlePhaseOnLocalPlayerUI()
{
	if( KFPC == none || KFPC.MyGFxHUD == none || KFPC.MyGFxHUD.bossHealthBar == none )
	{
		return;
	}

    KFPC.MyGFxHUD.bossHealthBar.UpdateBossBattlePhase(CurrentBattlePhase);   
}

/** Called from AICommand_MoveToGoal::NotifyHitWall() and AICommand_MoveToGoal::ReachedIntermediateMoveGoal() */
function bool HandleAIDoorBump( KFDoorActor Door )
{
	return TryDestroyDoor( Door );
}

/** Destroy unwelded doors instantly when there are few players remaining */
function bool TryDestroyDoor( KFDoorActor Door )
{
	if( Door != none && !Door.bIsDoorOpen && !Door.bIsDestroyed && Door.WeldIntegrity == 0 && CanObliterateDoors() )
	{
		Door.IncrementHitCount( self );
		Door.DestroyDoor( Controller );
		return true;
	}

	return false;
}

/** If we're a player, process hitwall and destroy doors here if all conditions are met */
event HitWall( vector HitNormal, actor Wall, PrimitiveComponent WallComp )
{
	local KFDoorActor Door;

	if( IsHumanControlled() )
	{
		if( !Wall.bStatic && IsAliveAndWell() )
		{
			Door = KFDoorActor( Wall );
			if( Door != none )
			{
				TryDestroyDoor( Door );
			}
		}
	}

	super.HitWall( HitNormal, Wall, WallComp );
}

/** Determines if this boss can plow through doors */
function bool CanObliterateDoors()
{
	// We only want the kool-aid man effect if we're sprinting
	if( !bIsSprinting )
	{
		return false;
	}

	// Only allow door obliteration if there is one player remaining in a multiplayer game
	return true;//IsOnePlayerLeftInTeamGame();
}

/** Returns the attack range scalar when there is only one player remaining */
function float GetAttackRangeScale()
{
	if( IsOnePlayerLeftInTeamGame() )
	{
		return LastPlayerAliveAttackRangeScale;
	}

	return 1.f;
}

/** Returns true if there is only one player remaining in a multiplayer game */
function bool IsOnePlayerLeftInTeamGame()
{

	if( WorldInfo.Game.NumPlayers > 1 )
	{
		return KFGameInfo(WorldInfo.Game).GetLivingPlayerCount() == 1;
	}

	return false;
}

/** Similar to IsOnePlayerLeftInTeamGame(), but more expensive and can be called on clients */
native function bool LocalIsOnePlayerLeftInTeamGame();

/************************************
 * @name	Ephemeral Stats Tracking
 ************************************/

static function bool IsABoss(){ return true; }

/**
 * This pawn has died.
 */
function bool Died( Controller Killer, class<DamageType> DamageType, vector HitLocation )
{
	local bool result;

	result = super.Died( Killer, DamageType, HitLocation );
	if (result)
	{
		KFGameInfo(WorldInfo.Game).BossDied(Killer);
	}

	ClearTimer( nameOf(Timer_IncreaseSpeed) );

	return result;
}

/** Used by subclasses to determine if the boss icon can be rendered */
function bool ShouldDrawBossIcon()
{
	return false;
}

/** Play music for this boss (overridden for each boss) */
function PlayBossMusic();

// bosses cannot be decapitated
function CauseHeadTrauma(float BleedOutTime=5.f);
simulated function PlayHeadAsplode();

function PlayMonologue( byte MonologueType )
{
	//`DialogManager.PlayBossMonologue( self, MonologueType );
}

function PlayGrabDialog()
{
	`DialogManager.PlayBossGrabDialog( self );
}

function PlayHealDialog()
{
	`DialogManager.PlayBossHealDialog( self );
}

function PlayLeapedDialog()
{
	`DialogManager.PlayBossLeapedDialog( self );
}

function PlayLandedDialog()
{
	`DialogManager.PlayBossLandedDialog( self );
}

function PlayGrabbedPlayerDialog( KFPawn_Human Target );

function PlayGrabKilledDialog();

defaultproperties
{
`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Patriarch';
`endif

	Begin Object Name=KFPawnSkeletalMeshComponent
		// Enabling kinematic for physics interaction while alive.  (see also MinDistFactorForKinematicUpdate)
		bUpdateKinematicBonesFromAnimation=true
	End Object

	// ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_BossTheatrics)		= class'KFGame.KFSM_Zed_Boss_Theatrics'
		//SpecialMoveClasses(SM_RecoverFromRagdoll)	= None
		//SpecialMoveClasses(SM_Knockdown)			= None
	End Object
	bAlwaysRelevant=true

	// ---------------------------------------------
	// Spawning
    MinSpawnSquadSizeType=EST_Boss

    bWeakZedGrab=false

	// ---------------------------------------------
	// Last Player Remaining Difficulty
	LastPlayerAliveAttackRangeScale=0.75f
	TimeUntilSpeedIncrease=60.0
	SpeedPctIncreasePerMinute=0.20
	SpeedLimitScalar=1.30
}