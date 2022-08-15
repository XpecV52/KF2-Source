//=============================================================================
// KFSM_MeleeAttack
//=============================================================================
// Handles close-range melee attacks, and base class for all NPC melee attacks.
// An attack is considered to be a melee attack if there are no projectiles
// involved (i.e, just play an animation-based attack)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFSM_MeleeAttack extends KFSM_PlaySingleAnim
	native(SpecialMoves);

/** If Interruptible, is this attack affected by parry stumble */
var transient bool bCannotBeParried;

event byte PackFlags()
{
	local byte StrikeFlags;
	local KFPawn_Monster KFPM;

	KFPM = KFPawn_Monster(KFPOwner);
	if ( KFPM == none )
	{
		return 255;
	}

	if( KFPM != none && KFPM.PawnAnimInfo != none )
	{
		StrikeFlags = KFPM.PawnAnimInfo.GetStrikeFlags(AIOwner.PendingAnimStrikeIndex);

		if( StrikeFlags != 255 )
		{
			//class'AICommand_Attack_Melee'.static.Melee( self, Enemy, StrikeFlags );
			AIOwner.UpdatePendingStrike();
		}
	}
	return StrikeFlags;
}

/** Unpack Special move flags */
function UnpackSpecialMoveFlags()
{
	local byte AtkIndex, AtkVariant;

	AtkIndex = KFPOwner.SpecialMoveFlags & 15;
	AtkVariant = KFPOwner.SpecialMoveFlags >> 4;

	// setup next attack animation based on SpecialMoveFlags
	AnimName = KFPOwner.PawnAnimInfo.InitMeleeSpecialMove(self, AtkIndex, AtkVariant);

	// for now all non-RootMotion are also interruptible
	bCanBeInterrupted = (bCanBeInterrupted || !bUseRootMotion);
}

/**
 * Can a new special move override this one before it is finished?
 * This is only if CanDoSpecialMove() == TRUE && !bForce when starting it.
 */
function bool CanOverrideMoveWith( Name NewMove )
{
	if ( bCanBeInterrupted && (NewMove == 'KFSM_Stunned' || NewMove == 'KFSM_Stumble' || NewMove == 'Knockdown') )
	{
		return TRUE; // for NotifyAttackParried
	}
	return FALSE;
}

function SpecialMoveStarted( bool bForced, name PrevMove )
{
	local KFPawn_Monster KFPM;

	bUseRootMotion = false;
	bCanBeInterrupted = false;

	UnpackSpecialMoveFlags();

	KFPM = KFPawn_Monster(KFPOwner);
	if ( KFPM != none && KFPM.bCanCloak && KFPM.bIsCloaking )
	{
		KFPM.SetCloaked(false);
	}

	Super.SpecialMoveStarted( bForced, PrevMove );
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	local KFPawn_Monster KFPM;

	PawnOwner.ClearTimer(nameof(InterruptCheckTimer), self);

	// prevent this anim from triggering melee impact notifies during AbortBlendOutTime
 	if ( bCanBeInterrupted && KFPOwner.BodyStanceNodes[AnimStance].bIsPlayingCustomAnim )
 	{
		KFPOwner.BodyStanceNodes[AnimStance].SetNotifyWeightThreshold(0.8f);
	}

	KFPM = KFPawn_Monster(KFPOwner);
	if ( KFPM != none )
	{
		if( KFPM.bCanCloak && !KFPM.bIsCloaking )
		{
            KFPM.SetCloaked(true);
        }

		KFPM.MeleeSpecialMoveEnded();
	}

	Super.SpecialMoveEnded(PrevMove, NextMove);
}

/** Called from SpecialMoveStarted */
function PlayAnimation()
{
	local float InterruptTime;

	if( AnimName == '' )
	{
		WarnInternal(KFPOwner$" "$GetFuncName()$" "$self$" attempting special move attack but the AttackAnims array is empty!");
		return;
	}

	if( AIOwner!= None ) { AIOwner.AILog_Internal(GetFuncName()$" "$self$" chose attack animation "$AnimName,'Command_SpecialMove'); };
	if( bCanBeInterrupted )
	{
		InterruptTime = KFSkeletalMeshComponent(PawnOwner.Mesh).GetAnimInterruptTime(AnimName);
		PawnOwner.SetTimer(InterruptTime, false, nameof(InterruptCheckTimer), self);
	}

	PlaySpecialMoveAnim( AnimName, AnimStance, BlendInTime, BlendOutTime, 1.f );
}

/** Notification from the pawn that damage was taken during move - Network: Server */
function NotifyOwnerTakeHit(class<KFDamageType> DamageType, vector HitLoc, vector HitDir, Controller InstigatedBy)
{
	// only non-RM attacks can be aborted
	if ( bCanBeInterrupted && IsAnInterruptHit(PawnOwner, DamageType) )
	{
		KFPOwner.EndSpecialMove();
	}
}

/** Called by owning AI Command when AI behavior decides to stop this attack */
function AbortedByAICommand()
{
	local KFPawn_Monster KFPMOwner;

	if ( bCanBeInterrupted )
	{
		if( !KFPOwner.IsTimerActive( nameof(InterruptCheckTimer), self) )
		{
			KFPMOwner = KFPawn_Monster(KFPOwner);
			KFPOwner.EndSpecialMove();
			if( KFPMOwner != none )
			{
				KFPMOwner.NotifyAnimInterrupt();
			}
		}
	}
}

/** Called when it's safe to interrupt this animation */
function InterruptCheckTimer()
{
	local AICommand_Attack_Melee MeleeCommand;
	local KFPawn_Monster KFPMOwner;

	if ( bCanBeInterrupted && AIOwner != None )
	{
		MeleeCommand = AICommand_Attack_Melee(AIOwner.GetActiveCommand());
		if( MeleeCommand != none && MeleeCommand.bAttackAborted )
		{
			KFPMOwner = KFPawn_Monster(KFPOwner);
			if( KFPMOwner != none )
			{
				KFPMOwner.NotifyAnimInterrupt();
			}
			KFPOwner.EndSpecialMove();
		}
	}
}

defaultproperties
{
   AbortBlendOutTime=0.500000
   bDisableMovement=True
   bDisableSteering=False
   Handle="KFSM_MeleeAttack"
   Name="Default__KFSM_MeleeAttack"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
