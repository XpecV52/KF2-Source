//=============================================================================
// KFAIController_ZedGorefast
//=============================================================================
// Base controller for the Gorefast
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFAIController_ZedGorefast extends KFAIController_Monster;

var bool	bExecutedSprint;

/*********************************************************************************************
* Movement Methods
********************************************************************************************* */

/** Timer function called during latent moves that determines whether NPC should sprint or stop sprinting */
function bool ShouldSprint()
{
	return ( MyKFPawn.bIsSprinting );
// 	Only sprints when in radius and line of sight of character.
// 		When GF loses sight of target he stops sprinting.
// 		If the target gets outside of the radius the GF will stop sprinting.
// 		When in headless the GF should not stay sprinting. This is a bug
	if( Enemy != none && MyKFPawn != none && !MyKFPawn.IsImpaired() && (bExecutedSprint ||
		MyKFPawn.Health < MyKFPawn.HealthMax || (VSizeSq(Enemy.Location - Pawn.Location) <= (SprintWithinEnemyRange.Y * SprintWithinEnemyRange.Y))) )
	{
		bExecutedSprint = true;
		return true;
	}
	else
	{
		return false;
	}
}

event EnemyNotVisible()
{
	if( MyKFPawn.bIsSprinting && !bForceFrustration && MyKFGameInfo.MyKFGRI.AIRemaining > FrustrationThreshold )  // don't stop sprinting if we're in frustration mode
	{
		MyKFPawn.SetSprinting( false );
	}
	bEnemyIsVisible = false;
	DisableEnemyNotVisible();
	EnableSeePlayer();
}

// event SeePlayer( Pawn Seen )
// {
// 	if ( Enemy == Seen )
// 	{
// 		CachedVisibleEnemy = Enemy;
// 		EnemyVisibilityTime = WorldInfo.TimeSeconds;
// 		bEnemyIsVisible = true;
// 		EnableEnemyNotVisible();
// 	}
// }

/**
 * Update sprint settings based on Frustration
 */
function UpdateSprintFrustration( optional byte bForceFrustrationState=255 )
{
	if( bForceFrustration )
	{
		bCanSprint = true;
	}
}

function bool IsFrustrated()
{
	if( bForceFrustration )
	{
		return true;
	}

	return false;
}

/** Test code, mirrors KF1 Gorefast sprint decisions (also done in Tick) */
simulated function Tick( float DeltaTime )
{
	super.Tick( DeltaTime );

	if( bForceFrustration )
	{
		return;
	}

	// @todo: why is this sprint code gorefast specific?
	if( MyKFPawn != none && !bHasDebugCommand && (LastSprintChangeTime == 0.f || (WorldInfo.TimeSeconds - LastSprintChangeTime) > 1.f) )
	{
		if( !MyKFPawn.bIsHeadless && !MyKFPawn.bEmpPanicked && Enemy != none && bEnemyIsVisible && !MyKFPawn.bIsSprinting &&
            ((MyKFPawn.Health < MyKFPawn.HealthMax) ||	(VSizeSq(Enemy.Location - Pawn.Location) <= (SprintWithinEnemyRange.Y * SprintWithinEnemyRange.Y))) )
		{
			bExecutedSprint = true;
			MyKFPawn.SetSprinting( true );
			LastSprintChangeTime = WorldInfo.TimeSeconds;
		}

		if( MyKFPawn.bIsSprinting && MyKFGameInfo.MyKFGRI.AIRemaining > FrustrationThreshold && (Enemy == none || !bEnemyIsVisible) )  // don't stop sprinting if we're in frustration mode
		{
			MyKFPawn.SetSprinting( false );
			LastSprintChangeTime = WorldInfo.TimeSeconds;
		}
	}
}

/*********************************************************************************************
* Sight/Hearing/Bump events
********************************************************************************************* */

event HearNoise( float Loudness, Actor NoiseMaker, optional Name NoiseType )
{
	/*  @todo check if this is desired
	local KFWeapon WeaponNoiseMaker;
	local KFPawn NoiseMakerPawn;
	local float DistFromNoiseMaker, DistFromEnemy;

	WeaponNoiseMaker = KFWeapon( NoiseMaker );

	if( !MyKFPawn.IsDoingSpecialMove() && (NoiseType == 'PlayerFiring' || NoiseType == 'PlayerReload') )
	{
		DisableHearNoise();

		`AILog( self$" HearNoise event, Loudness: "$Loudness$" NoiseMaker: "$NoiseMaker$" Type: "$NoiseType$" Dist: "$VSize( NoiseMaker.Location - Pawn.Location )$"... Disabling HearNoise", 'HearNoise' );
		if( WeaponNoiseMaker != none )
		{
			NoiseMakerPawn = KFPawn(WeaponNoiseMaker.Instigator);

			if( NoiseMakerPawn != none && Enemy != none )
			{
				if( Enemy == NoiseMakerPawn )
				{
					return;
				}

				DistFromNoiseMaker = VSize( NoiseMakerPawn.Location - Pawn.Location );
				DistFromEnemy = VSize( Enemy.Location - Pawn.Location );

				if( DistFromEnemy > 512.f && (DistFromEnemy > DistFromNoiseMaker) && FRand() < 0.8f )
				{
					Enemy = NoiseMakerPawn;
					return;
				}

				if( FRand() < 0.45f && Enemy.Health > KFPawn(Enemy).HealthMax * 0.5f && ActorReachable(NoiseMakerPawn) )
				{
					Enemy = NoiseMakerPawn;
					return;
				}
			}
		}
	}
	*/
}

defaultproperties
{
   bIsProbingMeleeRangeEvents=True
   SprintWithinEnemyRange=(X=0.000000,Y=800.000000)
   StrikeRangePercentage=0.750000
   MaxMeleeHeightAngle=0.680000
   EvadeGrenadeChance=0.750000
   LowIntensityAttackCooldown=3.000000
   Name="Default__KFAIController_ZedGorefast"
   ObjectArchetype=KFAIController_Monster'KFGame.Default__KFAIController_Monster'
}
