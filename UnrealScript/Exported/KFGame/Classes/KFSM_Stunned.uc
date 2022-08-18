//=============================================================================
// KFSM_Stunned
//=============================================================================
// Used to stop a zed from moving and play a stunned and wakeup animation
// for a random amount of time
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 2/5/2014
//=============================================================================
class KFSM_Stunned extends KFSpecialMove;

var	name		StunnedAnim;
var	array<name>	WakeupAnims;

var float StunDuration;

var vector2D PlayerStunDurationRange;
var vector2D StunDurationRange;

/** Notification called when Special Move starts */
function SpecialMoveStarted(bool bForced, Name PrevMove )
{
	super.SpecialMoveStarted( bForced, PrevMove );
	DoStun();
}

/** Stop the movement and play the stun animation for all clients */
function DoStun()
{
	if( KFPOwner.Role == ROLE_Authority )
	{
		// Disable Movement by using the DefaultAICommandClass to call LockdownAI()
		if( KFPOwner.IsHumanControlled() )
		{
			StunDuration = RandRange( PlayerStunDurationRange.X, PlayerStunDurationRange.Y );		
		}			
		else
		{
			StunDuration = RandRange( StunDurationRange.X, StunDurationRange.Y );		
		}

		KFPOwner.SetTimer( StunDuration, false, nameof(DoWakeup), self );
	}

	// We still want to preserve Z velocity, and not stop in mid-air
	KFPOwner.Velocity.X = 0.f;
	KFPOwner.Velocity.Y = 0.f;
	KFPOwner.Acceleration = vect(0,0,0);
	PlaySpecialMoveAnim( StunnedAnim, EAS_FullBody, 0.4f, 0.3f, 1.f, true );
}

/** Overridden to restrict movement when on the ground */
simulated event Tick( float DeltaTime )
{
	super.Tick( DeltaTime );

	if( KFPOwner != none && KFPOwner.Role == ROLE_Authority && KFPOwner.Physics == PHYS_Walking )
	{
		KFPOwner.Velocity.X = 0.f;
		KFPOwner.Velocity.Y = 0.f;
		KFPOwner.Acceleration = vect(0,0,0);
	}
}

/** Wakeup the zed once the servers timer has finished */
function DoWakeup()
{
	// replicate to all clients
	if( KFPOwner.Role == ROLE_Authority )
	{
		KFPOwner.SpecialMoveFlags = 1;
		KFPOwner.ReplicatedSpecialMove.Flags = 1;
        PlayWakeupAnimation();
	}
}

/* Play a random wakeup animation */
function PlayWakeupAnimation()
{
	local byte WakeupIndex;

	WakeupIndex = Rand( WakeupAnims.Length );
	PlaySpecialMoveAnim( WakeupAnims[WakeupIndex], EAS_FullBody, 0.2f, 0.3f, 1.f, false );
}

/* Play the wakeup animation for all clients */
function SpecialMoveFlagsUpdated()
{
	PlayWakeupAnimation();
}

/** Notification called when Special Move starts when ReplicatedSpecialMove changes*/
function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	super.SpecialMoveEnded( PrevMove, NextMove );

	// Enable movement
	if( KFPOwner.MyKFAIC != None )
	{
		KFPOwner.MyKFAIC.bPreparingMove = false;
	}
}

defaultproperties
{
   StunnedAnim="Stun_Loop_V1"
   WakeupAnims(0)="Stun_Wakeup_V1"
   WakeupAnims(1)="Stun_Wakeup_V2"
   WakeupAnims(2)="Stun_Wakeup_V3"
   PlayerStunDurationRange=(X=1.000000,Y=1.500000)
   StunDurationRange=(X=2.000000,Y=4.000000)
   bAllowHitReactions=True
   bCanOnlyWanderAtEnd=True
   bDisablesWeaponFiring=True
   bDisableMovement=True
   bLockPawnRotation=True
   DefaultAICommandClass=Class'KFGame.AICommand_PushedBySM'
   Handle="KFSM_Stunned"
   Name="Default__KFSM_Stunned"
   ObjectArchetype=KFSpecialMove'KFGame.Default__KFSpecialMove'
}
