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
	if( (WorldInfo.TimeSeconds - EnemyVisibilityTime) > 1.f )
	{
		HumanEnemy = KFPawn_Human(Enemy);
		if( HumanEnemy != none )
		{
			if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayLoseSightOfBossDialog( MyKFPawn, HumanEnemy );
			if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayBossLoseSightOfDialog( MyKFPawn, HumanEnemy );
		}
	}

	super.EnemyNotVisible();
}

event bool SetEnemy( Pawn NewEnemy )
{
	if( NewEnemy != Enemy )
	{
		if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayBossChallengeDialog( MyKFPawn );
	}

	return super.SetEnemy( NewEnemy );
}

/** Bosses should not be processed in frustration mode */
function UpdateSprintFrustration( optional byte bForceFrustration=255 )
{
}

function PlayDamagePlayerDialog( class<DamageType> DmgType );

defaultproperties
{
   bCanTeleportCloser=False
   FrustrationThreshold=0
   Name="Default__KFAIController_ZedBoss"
   ObjectArchetype=KFAIController_Monster'KFGame.Default__KFAIController_Monster'
}
