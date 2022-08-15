//=============================================================================
// AICommand_TauntEnemy
//=============================================================================
// Handles AI use of the taunt animation special move
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class AICommand_TauntEnemy extends AICommand_SpecialMove
	within KFAIController;

/** Set to true when taunting a killed enemy */
var Pawn	TauntTarget;

var byte TauntType;

/** Simple constructor that pushes a new instance of the command for the AI */
static function bool Taunt( KFAIController AI, optional Pawn inTauntTarget, optional byte InTauntType )
{
	local AICommand_TauntEnemy Cmd;

	if( AI != None )
	{
		Cmd = new(AI) default.class;
		if( Cmd != None )
		{
			Cmd.TauntTarget	= inTauntTarget;
			Cmd.TauntType	= InTauntType;
			AI.PushCommand( Cmd );
			return true;
		}
	}

	return false;
}

function Pushed()
{
	Super.Pushed();
	StopAllLatentMovement();
	AIZeroMovementVariables();

	if( TauntTarget != none )
	{
		Focus = TauntTarget;
	}

	`AILog( "Beginning to taunt enemy "$Enemy, 'Command_Taunt' );
	AIActionStatus = "Starting taunt AICommand";
	if( Focus != None )
	{
		SetDesiredRotation(rotator(Focus.Location - Pawn.Location));
	}

    if( bUsePluginsForMovement )
    {
        MovementPlugin.DisablePlugin();
	}

	DisableMeleeRangeEventProbing();
}

function Popped()
{
	AIActionStatus = "Finished taunt AICommand";
	LastTauntTime = WorldInfo.TimeSeconds;
	EnableMeleeRangeEventProbing();
    if( bUsePluginsForMovement )
    {
        MovementPlugin.EnablePlugin();
	}

	if( TauntType == TAUNT_EnemyKilled || Enemy == none )
    {
        FindNewEnemy();
    }

	Super.Popped();
}

state Command_SpecialMove
{
	function float GetPreSpecialMoveSleepTime()
	{
		return FRand();
	}

	function bool ExecuteSpecialMove()
	{
		local byte SpecialMoveFlags;

		SpecialMove = GetSpecialMove();

		`AILog( GetFuncName()@SpecialMove, 'Command_Taunt' );

		if( SpecialMove != SM_None && MyKFPawn.CanDoSpecialMove(SpecialMove) )
		{
			SpecialMoveFlags = class'KFSM_Zed_Taunt'.static.PackSMFlags(MyKFPawn, TauntType);
			if( SpecialMoveFlags != 255 )
			{
				MyKFPawn.DoSpecialMove(SpecialMove, true, GetInteractionPawn(), SpecialMoveFlags);
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}

	function ESpecialMove GetSpecialMove()
	{
		return SM_Taunt;
	}
}

DefaultProperties
{
	bShouldCheckSpecialMove=true
	bAllowedToAttack=false
	TimeOutDelaySeconds=25.f
}
