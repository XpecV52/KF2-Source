//=============================================================================
// AICommand_Evade
//=============================================================================
// Handles starting/stopping evade special move. Can be used for a variety
// of reasons, but main purpose is to evade away from grenades/projectiles.
//
// Use KFAIController.DoEvade() to start this action.
//
// Typically, this is what happens:
// 1) Player's GetAdjustedAim() sets the player's ShotTarget to be the pawn
//		the player is aiming at.  
// 2) Projectile.PreBeginPlay() calls ReceiveProjectileWarning() for the 
//		ShotTarget.
// 3) KFAIController.ReceiveProjectileWarning() starts a brief timer which goes
//		on to start the evade command. It also warns other Zeds within a radius
//		of about 900 units, calling HandleProjectileWarning() for each notified
//		NPC. Conditions are taken into account prior to warning anothehr Zed, 
//		like ensuring that they are somewhat facing the instigator's location.
//		
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class AICommand_Evade extends AICommand_SpecialMove
	within KFAIController;

/** Direction in which to evade */
var byte			EvadeDirection;
/** Optional delay before starting the evade special move */
var float			EvadeDelay;
/** SpecialMoveFlags used to determine which animation to play */
var byte			SMFlags;
/** Determines whether to use a regular evade, or an "evade in fear" (different set of animations) */
var bool			bFrightened;
/** If true, NPC will turn to face the threat before starting the special moe */
var bool			bTurnToThreat;
/** There used to be a check when the special move completes, to see if another immediate evade is necessary.
	This code is currently commented out (see SpecialMoveFinished() below). RepeatDistSq was used with this. */
var float			RepeatDistSq;

/** Simple constructor that pushes a new instance of the command for the AI */
static function bool Evade( KFAIController AI, byte Direction, optional float InEvadeDelay, optional bool InFrightened, optional bool InTurnToThreat )
{
	local AICommand_Evade Cmd;

	if( AI != None )
	{
		Cmd = new(AI) class'AICommand_Evade';
		if( Cmd != None )
		{
			Cmd.EvadeDirection = Direction;
			Cmd.EvadeDelay	   = InEvadeDelay;
			Cmd.SMFlags		   = Direction;
			Cmd.bFrightened	   = InFrightened;
			Cmd.bTurnToThreat  = InTurnToThreat;

			AI.PushCommand( Cmd );
			return true;
		}
	}

	return false;
}

/** Build debug string */
event String GetDumpString()
{
	return super.GetDumpString()@"Dir:"@EvadeDirection;
}

function Pushed()
{
	AIActionStatus = "Evading!";
	Super.Pushed();
	
	AIZeroMovementVariables();
	// Keep pawn's rotation as desired
	SetDesiredRotation( Pawn.Rotation );
	SetFocalPoint( vect(0,0,0) );
	Focus = none;
	/** Optionally pause in the 'Wait' state - use to hit reactions so a cluster of 
		Zeds don't all attempt to evade at the same instant */
	if( EvadeDelay > 0.f )
	{
		GotoState( 'Wait' );
	}
	else
	{
		GotoState( 'Command_SpecialMove' );
	}
}

function Popped()
{
	AIActionStatus = "Done Evading";
	AIZeroMovementVariables();
	if( MyKFPawn != none )
	{
		MyKFPawn.StopLookingAtPawn();
	}
	Focus = none;
	Super.Popped();
}

function bool CanEvade()
{
	return false;
}

state Wait
{
Begin:
	Sleep( EvadeDelay );
	GotoState('Command_SpecialMove');
}

state Command_SpecialMove
{
	/** Determine whether to use a "fear" evade or a regular evade. */
	function ESpecialMove GetSpecialMove()
	{
		/** Not every Zed has an evade-in-fear special move */
		if( bFrightened && MyKFPawn.CanDoSpecialMove(SM_Evade_Fear) )
		{
			return SM_Evade_Fear;
		}
		else
		{
			return SM_Evade;
		}
	}

	/** Pack the animflags, passing in EvadeDirection to get the appropriate animation sequence */
	function byte GetSpecialMoveFlags( ESpecialMove InSpecialMove )
	{
		return class'KFSM_Evade'.static.PackAnimFlag( EvadeDirection );
	}

	/** Optionally don't begin the special move until rotation is complete */
	function bool ShouldFinishRotation()
	{
		return bTurnToThreat;
	}

	/** Begin executing the special move */
	function bool ExecuteSpecialMove()
	{
		SpecialMove = GetSpecialMove();

		AILog_Internal(GetFuncName()$"()"@SpecialMove,'Command_SpecialMove',);

		if( SpecialMove != SM_None && (!bShouldCheckSpecialMove || MyKFPawn.CanDoSpecialMove( SpecialMove )) )
		{
			MyKFPawn.DoSpecialMove(SpecialMove, true, GetInteractionPawn(), GetSpecialMoveFlags(GetSpecialMove()) );
			AIActionStatus = "SpecialMove: "$MyKFPawn.SpecialMoves[SpecialMove];
			return true;
		}
		else
		{
			return false;
		}
	}

	function FinishedSpecialMove()
	{
// 		local byte BestDir;
// 
// 		if( EvadeFromActor != none && Projectile(EvadeFromActor) != none && VSizeSq(Pawn.Location - EvadeFromActor.Location) <= RepeatDistSq )
// 		{
// 			BestDir = GetBestEvadeDir( EvadeFromActor.Location, Enemy );
// 			EvadeDirection = BestDir;
// 			SMFlags = BestDir;
// 			TimeOutDelaySeconds = default.TimeOutDelaySeconds;
// 			GotoState( GetStateName(), 'Begin', true );
// 		}
// 		else
// 		{
			super.FinishedSpecialMove();
//		}
	}
}

defaultproperties
{
   RepeatDistSq=250000.000000
   bShouldCheckSpecialMove=True
   Name="Default__AICommand_Evade"
   ObjectArchetype=AICommand_SpecialMove'KFGame.Default__AICommand_SpecialMove'
}
