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

/** Called when this controller has possessed inPawn */
event Possess( Pawn inPawn, bool bVehicleTransition )
{
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo( WorldInfo.GRI );

	super.Possess( inPawn, bVehicleTransition );

	// Play entrance animation
	if( KFGRI != none && KFGRI.WaveNum >= KFGRI.WaveMax )
	{
        class'AICommand_BossTheatrics'.static.DoTheatrics( self, THEATRIC_Entrance );
    }
}

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
			`SafeDialogManager.PlayLoseSightOfBossDialog( MyKFPawn, HumanEnemy );
			`SafeDialogManager.PlayBossLoseSightOfDialog( MyKFPawn, HumanEnemy );
		}
	}

	super.EnemyNotVisible();
}

event bool SetEnemy( Pawn NewEnemy )
{
	if( NewEnemy != Enemy )
	{
		`SafeDialogManager.PlayBossChallengeDialog( MyKFPawn );
	}

	return super.SetEnemy( NewEnemy );
}

/** Bosses should not be processed in frustration mode */
function UpdateSprintFrustration( optional byte bForceFrustration=255 )
{
}

function PlayDamagePlayerDialog( class<DamageType> DmgType );

/** Stub debug command to advance battle phase */
function DebugNextPhase();

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

state ZedVictory
{
Begin:
    Sleep(0.1f);
    class'AICommand_BossTheatrics'.static.DoTheatrics( self, THEATRIC_Victory, -1 );
}

DefaultProperties
{
	FrustrationThreshold=0
    bCanTeleportCloser=false	
}
