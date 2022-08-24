//=============================================================================
// KFAIController_ZedBoss
//=============================================================================
// Base Zed boss AIController
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
//
class KFAIController_ZedBoss extends KFAIController_Monster
	native(AI);

/*********************************************************************************************
* Battle phases
**********************************************************************************************/

/** TRUE if we've already summoned minions this battle phase */
var bool bSummonedThisPhase;

/** NPC has lost sight of current enemy */
event EnemyNotVisible()
{
	local KFPawn_Human HumanEnemy;

	// EnemyNotVisible can be triggered rapidly due to minor obstructions like streetlights,
	// so try to account for that by only having the player say something after a period of
	// visibility
	if( `TimeSince(EnemyVisibilityTime) > 1.f )
	{
		HumanEnemy = KFPawn_Human(Enemy);
		if( HumanEnemy != none )
		{
			`DialogManager.PlayLoseSightOfBossDialog( MyKFPawn, HumanEnemy );
			`DialogManager.PlayBossLoseSightOfDialog( MyKFPawn, HumanEnemy );
		}
	}

	super.EnemyNotVisible();
}

event bool SetEnemy( Pawn NewEnemy )
{
	if( NewEnemy != Enemy )
	{
		`DialogManager.PlayBossChallengeDialog( MyKFPawn );
	}

	return super.SetEnemy( NewEnemy );
}

/** Bosses should not be processed in frustration mode */
function UpdateSprintFrustration( optional byte bForceFrustrationState=255 )
{
}

function PlayDamagePlayerDialog( class<DamageType> DmgType );

/** Stub debug command to advance battle phase */
function DebugNextPhase();

/** Stop summoning zeds */
function Timer_StopSummoningZeds()
{
    MyKFGameInfo.SpawnManager.StopSummoningBossMinions();
}

/*********************************************************************************************
*  Victory
********************************************************************************************* */
function EnterZedVictoryState()
{
	ClearMovementInfo();
	if( CommandList != None )
	{
		AbortCommand( CommandList );
	}

	DisableMeleeRangeEventProbing();
	ChangeEnemy(none);
	MyKFPawn.SetSprinting( false );

    // Keep boss looking at the camera
    LockPawnRotationTo(MyKFPawn.Rotation);
    MyKFPawn.SetRemoteViewPitch(0);

    // Force end any special moves
    if( MyKFPawn.IsDoingSpecialMove() )
    {
    	MyKFPawn.EndSpecialMove();
    }

    GotoState( 'ZedVictory', 'Begin');
}

DefaultProperties
{
	FrustrationThreshold=0
    bCanTeleportCloser=false
    LowIntensityAttackCooldown=0
}
