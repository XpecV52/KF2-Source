//=============================================================================
// KFAIController_ZedClot_Slasher
//=============================================================================
// Slasher clot
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFAIController_ZedClot_Slasher extends KFAIController_ZedClot;

/*********************************************************************************************
* Movement Methods
********************************************************************************************* */

/** Timer function called during latent moves that determines whether NPC should sprint or stop sprinting */
function bool ShouldSprint()
{
	if( MyKFPawn.bCanSprint || (MyKFPawn.bCanSprintWhenDamaged && MyKFPawn.Health < MyKFPawn.HealthMax) )
	{
		return true;
	}
	else
	{
		return false;
	}
}

DefaultProperties
{
	// ---------------------------------------------
	// AI / Navigation
	SprintWithinEnemyRange=(X=120.f,Y=700.f)
	EvadeGrenadeChance=0.6f
}
