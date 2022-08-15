//=============================================================================
// KFSM_GrappleStart
//=============================================================================
// Try to grab a player.  On success go to KFSM_GrappleAttack
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFSM_GrappleStart extends KFSM_PlaySingleAnim;

/** Beyond this distance the grapple will fail */
var float MaxGrabDistance;

/** If set, this ability can be blocked by a melee weapon */
var bool bCanBeBlocked;

/**
 * Can a new special move override this one before it is finished?
 * This is only if CanDoSpecialMove() == TRUE && !bForce when starting it.
 */
function bool CanOverrideMoveWith( Name NewMove )
{
	if ( !bUseRootMotion && (NewMove == 'KFSM_Stunned' || NewMove == 'KFSM_Stumble') )
	{
		return TRUE; // for NotifyAttackParried
	}
	return FALSE;
}

/** Play an animation and enable the OnAnimEnd notification */
function PlayAnimation()
{
	local float GrabCheckTime;

	// On the server start a timer to check collision
	if ( PawnOwner.Role == ROLE_Authority && AIOwner != None )
	{
		GrabCheckTime = KFSkeletalMeshComponent(PawnOwner.Mesh).GetAnimInterruptTime(AnimName);

		if ( GrabCheckTime <= 0 )
		{
			`warn("Failed to play" @ AnimName @ "on special move" @ Self @ "on Pawn" @ PawnOwner);
			PawnOwner.SetTimer(0.25f, FALSE, nameof(AbortSpecialMove), Self);
			return;
		}

		PawnOwner.SetTimer(GrabCheckTime, FALSE, nameof(CheckGrapple), Self);
	}

	Super.PlayAnimation();
}

/**
  * Check to see if we're in range to lock into a grapple
  * Network: Server
  */
function CheckGrapple()
{
	local vector ToEnemy;
	local vector HitLocation, HitNormal;
	local Actor HitActor;
	local KFPawn Victim;
	local byte SpecialMoveFlags;

	if( AIOwner != none && AIOwner.Enemy != none && AIOwner.Enemy.IsAliveAndWell() /*&& AIOwner.Enemy.Physics != PHYS_Falling*/ )
	{
		ToEnemy = (PawnOwner.Location - AIOwner.Enemy.Location);

		Victim = KFPawn(AIOwner.Enemy);
		if ( Victim != None && (bCanBeBlocked && Victim.MyKFWeapon != None && Victim.MyKFWeapon.IsGrappleBlocked(PawnOwner))
            || (!Victim.CanBeGrabbed(KFPOwner, true)) )
		{
			return; // blocked by weapon or pawn can't be grabbed
		}

		if( VSizeSq(ToEnemy) <= Square(MaxGrabDistance) )
		{
			// trace for obstructions
			HitActor = PawnOwner.Trace(HitLocation, HitNormal, AIOwner.Enemy.Location, PawnOwner.Location, true);
			if ( HitActor == None || HitActor == AIOwner.Enemy )
			{
				SpecialMoveFlags = class'KFSM_GrappleAttack'.static.PackSMFlags();
				// force grapple special move on server
				KFPOwner.DoSpecialMove(SM_GrabAttack, true, AIOwner.Enemy, SpecialMoveFlags);
			}
		}
	}
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	// Clear timers.
	PawnOwner.ClearTimer(nameof(CheckGrapple), Self);

	Super.SpecialMoveEnded(PrevMove, NextMove);
}

/** Handle bCanBeInterrupted, also see CanOverrideMoveWith() for interrupt moves */
function NotifyOwnerTakeHit(class<KFDamageType> DamageType, vector HitLoc, vector HitDir, Controller InstigatedBy)
{
	if ( bCanBeInterrupted && IsAnInterruptHit(PawnOwner, DamageType) )
	{
		// Force stumble.  Cannot simple exit this move without aborting/overriding the animation
		if ( KFPOwner.CanDoSpecialMove(SM_Stumble) )
		{
			KFPOwner.DoSpecialMove(SM_Stumble,,, class'KFSM_Stumble'.static.PackBodyHitSMFlags(KFPOwner, HitDir));
		}
	}
}

defaultproperties
{
	// ---------------------------------------------
	// Animations
	AnimName=Grab
	AnimStance=EAS_FullBody

	// ---------------------------------------------
	// SpecialMove
	bLockPawnRotation=true

	// ---------------------------------------------
	// Combat
	MaxGrabDistance=210.f
	bCanBeBlocked=true
	bCanBeInterrupted=true
}
