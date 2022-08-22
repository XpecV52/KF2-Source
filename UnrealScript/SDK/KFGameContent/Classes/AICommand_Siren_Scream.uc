//=============================================================================
// AICommand_Siren_Scream
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class AICommand_Siren_Scream extends AICommand_SpecialMove
	within KFAIController_ZedSiren
	config(AI);


/** The range the siren won't scream if she is closer than */
var int MinScreamRangeSQ;
/** The range the siren needs to be within to start screaming */
var int MaxScreamRangeSQ;

/*********************************************************************************************
* Initialization
********************************************************************************************* */

static function bool Scream( KFAIController_ZedSiren AI )
{
	local AICommand_Siren_Scream Cmd;

	if( AI != None )
	{
		Cmd = new(AI) Default.Class;
		if( Cmd != None )
		{
			AI.PushCommand(Cmd);
			return TRUE;
		}
	}

	return false;
}

function LockdownAI();

state Command_SpecialMove
{
	event HandleAICommandSpecialAction()
	{
		super.HandleAICommandSpecialAction();

		if( CanScream() )
		{
			MyKFPawn.DoSpecialMove(SpecialMove, true, GetInteractionPawn(), GetSpecialMoveFlags(SpecialMove));
		}
	}

	function ESpecialMove GetSpecialMove()
	{
		return default.SpecialMove;
	}

	function bool CanScream()
	{
		local vector EnemyLocation, MyEyeLocation;
		local float RangeToEnemySQ;
		local KFGameInfo KFGI;

		if( Enemy != none
			&& WorldInfo.TimeSeconds > ScreamDelayTime
			&& (DoorEnemy == none || DoorEnemy.IsCompletelyOpen())
			&& (!bShouldCheckSpecialMove || MyKFPawn.CanDoSpecialMove(SpecialMove))
			&& (LastScreamTime == 0.f || `TimeSince(LastScreamTime) > ScreamCooldown)
			&& CheckOverallCooldownTimer()
			&& MyKFPawn.IsCombatCapable()
			&& !GetIsInZedVictoryState() )
		{
			EnemyLocation = Enemy.Location + vect(0,0,1) * Enemy.BaseEyeHeight;
			MyEyeLocation = MyKFPawn.Location + vect(0,0,1) * MyKFPawn.BaseEyeHeight;

	        RangeToEnemySQ = VSizeSQ( EnemyLocation - MyEyeLocation );

			if( RangeToEnemySQ < MaxScreamRangeSQ && RangeToEnemySQ > MinScreamRangeSQ
				&& FastTrace(EnemyLocation, MyEyeLocation) )
			{
				LastScreamTime = WorldInfo.TimeSeconds;
				KFGI = KFGameInfo( WorldInfo.Game );
	        	if( KFGI != none && KFGI.GameConductor != none )
	        	{
	        		KFGI.GameConductor.UpdateOverallAttackCoolDowns( Outer );
	        	}
				return true;
			}
		}

		return false;
	}
}

function Pushed()
{
	AIActionStatus = "Screaming!";
	super.Pushed();
}

function Popped()
{
	super.Popped();
	EnableMeleeRangeEventProbing();
}

DefaultProperties
{
	bAllowedToAttack=false
	bIgnoreNotifies=true
	bIgnoreStepAside=true
	SpecialMove=SM_SonicAttack

	// ---------------------------------------------
	// Behaviors
	MinScreamRangeSQ=17000.f
	MaxScreamRangeSQ=810000.f
}