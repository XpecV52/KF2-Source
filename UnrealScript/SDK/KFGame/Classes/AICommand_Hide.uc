//=============================================================================
// AICommand_Hide
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class AICommand_Hide extends AICommand
	within KFAIController;

var actor HideTarget;
var float Dot;
var bool bLoop;
var int PathAttempts;
var float HideDuration;
var bool bWasSprinting;
/*********************************************************************************************
* Initialization
********************************************************************************************* */

static function bool HideFrom( KFAIController AI, actor InHideTarget, optional float inHideDuration, optional bool bInLoop=true )
{
	local AICommand_Hide Cmd;

	if( AI != None )
	{
		Cmd = new(AI) Default.Class;
		if( Cmd != None )
		{
			Cmd.HideDuration = inHideDuration;
			Cmd.HideTarget = InHideTarget;
			Cmd.bLoop = bInLoop;
			AI.PushCommand(Cmd);
			return true;
		}
	}

	return false;
}

function Pushed()
{
	super.Pushed();
	bWasSprinting = MyKFPawn.bIsSprinting;
	DisableMeleeRangeEventProbing();
	MoveTimer = -1.0;
	Pawn.ZeroMovementVariables();
	StopAllLatentMovement(); // Abort move commands, too?
	if( HideDuration > 0.f )
	{
		SetTimer( HideDuration, false, nameof(Timer_HideDurationExpired), self );
	}
	SetTimer( (0.1+0.4*FRand()), false, nameof(StartHiding), self );
}

function Timer_HideDurationExpired()
{
	Status = 'Success';
	AIZeroMovementVariables( true );
	StopAllLatentMovement();
	GotoState( 'Hiding', 'HideComplete' );
}

function StartHiding()
{
	GotoState('Hiding');
}

function Popped()
{
	super.Popped();
	MyKFPawn.bIsSprinting = bWasSprinting;
	MyKFPawn.ClearHeadTrackTarget( HideTarget );
	EnableMeleeRangeEventProbing();
}

/*********************************************************************************************
* Hiding state
********************************************************************************************* */

state Hiding
{
	event BeginState( name PreviousStateName )
	{
		super.BeginState( PreviousStateName );

	//	MyKFPawn.SetSprinting( true );
	//	MyKFPawn.bIsSprinting = true;
		AIActionStatus = "In DebugHiding state";
		if( Enemy == none )
		{
			Enemy = GetClosestEnemy();
		}
	}

	function bool CheckRetreat()
	{
		if( HideTarget != none )// && Dot < 0.8f ) //Pawn.LineOfSightTo( HideTarget ) )
		{
			class'Path_AlongLine'.static.AlongLine(Pawn, -Normal(HideTarget.Location - Pawn.Location));

			class'Goal_AwayFromPosition'.static.FleeFrom(Pawn, HideTarget.Location, 1700 );
			if( FindPathToward( HideTarget ) != None )
			{
				PathAttempts = 0;
				AIActionStatus = "Hiding from "$HideTarget$" at "$RouteGoal;
				Focus = none;
				return true;
			}
		}
		PathAttempts += 1;
		return false;
	}

Begin:
	if( Pawn.Physics == PHYS_Falling )
	{
		WaitForLanding();
	}
	MyKFPawn.bIsSprinting = true;
	Focus = HideTarget;
// 	if( !CanSee( Pawn(HideTarget) ) )
// 	{
// 		PushState( 'RotateToFocus' );
// 		Sleep( FRand() * 0.22f );
// 	}
	if( CheckRetreat() )
	{
		if( VSize( RouteGoal.Location - Pawn.Location ) > 800.f )
		{
			MyKFPawn.bIsSprinting = true;
		}

//		SetMoveGoal( RouteGoal, none, false, 128.f, true, true );
		if( bLoop || VSize(HideTarget.Location - Pawn.Location) < 800.f )
		{
			Goto( 'Begin' );
		}
		Sleep( 0.15f );
		Dot = normal( Location - HideTarget.Location ) dot vector( HideTarget.Rotation );
		if( Dot > 0.78f )
		{
			PushState( 'RotateToFocus' );
			Status = 'Success';
			Sleep( FRand() * 1.3f + 0.5f );
			PopCommand(self);
		}
		else
		{
			Goto( 'Begin' );
		}
	}
HideComplete:
	Status = 'Success';
	PopCommand(self);
}

state RotateToFocus `DEBUGSTATE
{
Begin:
	AIActionStatus = "Rotating to focus";
	SetFocalPoint( vect(0,0,0) );
	Focus = HideTarget;

	//	Pawn.DesiredRotation = Normalize(Rotator( (Focus == None ? GetFocalPoint() : Focus.Location) - Pawn.Location ));
	//	DesiredRotation = Pawn.DesiredRotation;

	FinishRotation();
	PopState();
}


DefaultProperties
{
	bAllowedToAttack=false
}