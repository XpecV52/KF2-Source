//=============================================================================
// KFAIController_ZedClot_Alpha
//=============================================================================
// Alpha clot
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFAIController_ZedClot_Alpha extends KFAIController_ZedClot;

/*********************************************************************************************
* Movement Methods
********************************************************************************************* */

/** Timer function called during latent moves that determines whether NPC should sprint or stop sprinting */
function bool ShouldSprint()
{
	if( MyKFPawn == none || (Enemy == none && DoorEnemy == none) || !MyKFPawn.IsAliveAndWell() || !Enemy.IsAliveAndWell() )
	{
		return false;
	}

	if( MyKFPawn.bCanSprint || (MyKFPawn.bCanSprintWhenDamaged && MyKFPawn.Health < MyKFPawn.HealthMax) )
	{
		return true;
	}

	return false;
}

/** Notification I'm about to be run into by a Zed which has bUseRunOverWarning set to true
	Overridden to use alpha clot's non-fear evade */
event RunOverWarning( KFPawn IncomingKFP, float IncomingSpeed, vector IncomingDir )
{
	if( CanEvade() )
	{
		//DoEvade( (Normal(IncomingKFP.Location - Pawn.Location) Cross vect(0,0,1)),, (0.1 + FRand()), true, true );
		//DoHideFrom( IncomingKFP, 4.f );
		DoEvade( GetBestEvadeDir( IncomingKFP.Location, IncomingKFP, false ),,, true, true );
	}
}

DefaultProperties
{
	// ---------------------------------------------
	// AI / Navigation
	SprintWithinEnemyRange=(X=520.f,Y=1200.f)
	EvadeGrenadeChance=0.75f
	// ---------------------------------------------
	// Combat
	bIsProbingMeleeRangeEvents=true

	StrikeRangePercentage=0.6
}
