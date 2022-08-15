//=============================================================================
// KFAIController_ZedBloat
//=============================================================================
// The mighty Bloat.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFAIController_ZedBloat extends KFAIController_Monster;

/** Notification that enemy is now within melee attack range, called from TickMeleeCombatDecision() */
event EnemyInMeleeRange()
{
	if( !IsMeleeRangeEventProbingEnabled() || MyKFPawn.IsDoingSpecialMove() )
	{
		return;
	}

	Super.EnemyInMeleeRange();
} 

DefaultProperties
{
	// ---------------------------------------------
	// AI / Navigation
    bCanTeleportCloser=false
	SprintWithinEnemyRange=(X=520.f,Y=1200.f)
	EvadeGrenadeChance=0.6f
	// ---------------------------------------------
	// Combat
	bIsProbingMeleeRangeEvents=true
	bCanStrikeThroughEnemies=true
}
