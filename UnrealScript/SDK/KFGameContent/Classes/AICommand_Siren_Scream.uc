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
var int MinScreamRange;
/** The range the siren needs to be within to start screaming */
var int MaxScreamRange;
/** The range the siren needs to be within to start screaming */
var float ScreamCooldown;


var float LastScreamTime;

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

	function bool CanScream()
	{
		local vector	HitL, HitN;
		local vector EnemyLocation, MyEyeLocation;
		local float RangeToEnemy;

		if( Enemy != none && SpecialMove != SM_None && (!bShouldCheckSpecialMove || MyKFPawn.CanDoSpecialMove( SpecialMove )) )
		{
			if( WorldInfo.TimeSeconds - LastScreamTime < ScreamCooldown
                || !CheckOverallCooldownTimer() )
			{
				return false;
			}

			if( MyKFPawn.IsImpaired() )
			{
				return false;
			}

			EnemyLocation = Enemy.Location + vect(0,0,1) * Enemy.BaseEyeHeight;
			MyEyeLocation = MyKFPawn.Location + vect(0,0,1) * MyKFPawn.BaseEyeHeight;

            RangeToEnemy = VSize(EnemyLocation - MyEyeLocation);

			if( RangeToEnemy < MaxScreamRange && RangeToEnemy > MinScreamRange
				&& Trace(HitL, HitN, EnemyLocation, MyEyeLocation, FALSE,,,TRACEFLAG_Bullet) == none )
			{
				LastScreamTime = WorldInfo.TimeSeconds;
            	if( KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).GameConductor != none )
            	{
            	   KFGameInfo(WorldInfo.Game).GameConductor.UpdateOverallAttackCoolDowns(Outer);
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
	MinScreamRange=130
	MaxScreamRange=920
	ScreamCooldown=5
}
