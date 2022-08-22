//=============================================================================
// KFAIController_ZedClot
//=============================================================================
// Base controller for the Alpha, Slasher, and Cyst Clots
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFAIController_ZedClot extends KFAIController_Monster
	abstract
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

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

	// Sprint if we've reached the frustration threshold
	if ( IsFrustrated() )
	{
		return true;
	}

	// Sprint if we've been damaged and sprinting is allowed
	if( bCanSprint || (bCanSprintWhenDamaged && MyKFPawn.Health < MyKFPawn.HealthMax) )
	{
		return true;
	}

	return false;
}

/*********************************************************************************************
* Combat
**********************************************************************************************/

function bool CanDoStrike()
{
	// Prioritize a grab over doing a strike
	if( CanGrabAttack() )
	{
		return false;
	}

	return super.CanDoStrike();
}

/** Launch a grab attack */
event DoGrabAttack( optional Pawn NewEnemy, optional float InPostSpecialMoveSleepTime=0.f )
{
	if( CommandList == None || AICommand(CommandList).bAllowedToAttack )
	{
		if( NewEnemy != None && NewEnemy != Enemy )
		{
			SetEnemy( NewEnemy );
		}
		ClearMovementInfo( true, "Aborted For GrabAttack" );
		if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal(GetFuncName()$"() Init AICommand_Attack_Grab",'InitAICommand',);};
		class'AICommand_Attack_Grab'.static.Grab( self, InPostSpecialMoveSleepTime );
	}
	else if( CommandList != none && !AICommand(CommandList).bAllowedToAttack )
	{
		if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal(GetFuncName()$"() not doing grab attack because current command ("$CommandList$") will not allow it",'GrabAttack',);};
	}
}

defaultproperties
{
   bEvadeOnRunOverWarning=True
   bIsProbingMeleeRangeEvents=True
   SprintWithinEnemyRange=(X=600.000000,Y=1200.000000)
   Name="Default__KFAIController_ZedClot"
   ObjectArchetype=KFAIController_Monster'KFGame.Default__KFAIController_Monster'
}
