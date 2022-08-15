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

defaultproperties
{
   SprintWithinEnemyRange=(X=520.000000,Y=1200.000000)
   StrikeRangePercentage=0.600000
   EvadeGrenadeChance=0.750000
   Name="Default__KFAIController_ZedClot_Alpha"
   ObjectArchetype=KFAIController_ZedClot'KFGame.Default__KFAIController_ZedClot'
}
