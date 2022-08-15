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

defaultproperties
{
   bCanTeleportCloser=False
   bCanStrikeThroughEnemies=True
   bIsProbingMeleeRangeEvents=True
   SprintWithinEnemyRange=(X=520.000000,Y=1200.000000)
   EvadeGrenadeChance=0.600000
   Name="Default__KFAIController_ZedBloat"
   ObjectArchetype=KFAIController_Monster'KFGame.Default__KFAIController_Monster'
}
