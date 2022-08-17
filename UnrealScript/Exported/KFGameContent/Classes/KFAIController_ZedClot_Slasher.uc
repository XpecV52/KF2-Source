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
	if( bCanSprint || (bCanSprintWhenDamaged && MyKFPawn.Health < MyKFPawn.HealthMax) )
	{
		return true;
	}
	else
	{
		return false;
	}
}

defaultproperties
{
   SprintWithinEnemyRange=(X=120.000000,Y=700.000000)
   EvadeGrenadeChance=0.600000
   Name="Default__KFAIController_ZedClot_Slasher"
   ObjectArchetype=KFAIController_ZedClot'KFGame.Default__KFAIController_ZedClot'
}
