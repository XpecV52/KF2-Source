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

/** Make sure Z distance isn't too far */
var float MaxVictimZOffset;

/** If set, this ability can be blocked by a melee weapon */
var bool bCanBeBlocked;

/** Restrictions for doing grab animation. */
protected function bool InternalCanDoSpecialMove()
{
	if( PawnOwner.IsHumanControlled() && PawnOwner.Physics == PHYS_Falling )
	{
		return false;
	}

	return super.InternalCanDoSpecialMove();
}

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
	if ( PawnOwner.Role == ROLE_Authority )
	{
		GrabCheckTime = KFSkeletalMeshComponent(PawnOwner.Mesh).GetAnimInterruptTime(AnimName);

		if ( GrabCheckTime <= 0 )
		{
			WarnInternal("Failed to play" @ AnimName @ "on special move" @ Self @ "on Pawn" @ PawnOwner);
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
	local vector Extent, EndTrace, HitLocation, HitNormal;
	local Actor HitActor;
	local KFPawn Victim;
	local byte SpecialMoveFlags;

	if( bPendingStopFire )
	{
		return;
	}

	// Set our extent
	Extent.X = PawnOwner.GetCollisionRadius() * 0.5f;
	Extent.Y = Extent.X;
	Extent.Z = PawnOwner.GetCollisionHeight() * 0.5f;

	if( KFPOwner.IsHumanControlled() )
	{
		EndTrace = KFPOwner.Location + vector(KFPOwner.Rotation)*MaxGrabDistance;
		HitActor = KFPOwner.Trace(HitLocation, HitNormal, EndTrace, KFPOwner.Location, true, Extent);

		if( HitActor != none )
		{
			Victim = KFPawn(HitActor);
		}
	}
	else if( AIOwner != none )
	{
		Victim = KFPawn( AIOwner.Enemy );
	}

	if( Victim != none && Victim.IsAliveAndWell() && Victim.GetTeamNum() != KFPOwner.GetTeamNum() /*&& AIOwner.Enemy.Physics != PHYS_Falling*/ )
	{
		ToEnemy = (PawnOwner.Location - Victim.Location);

		if ( Victim != None && (bCanBeBlocked && Victim.MyKFWeapon != None && Victim.MyKFWeapon.IsGrappleBlocked(PawnOwner))
            || (!Victim.CanBeGrabbed(KFPOwner, true)) )
		{
			return; // blocked by weapon or pawn can't be grabbed
		}

		// Check victim Z offset
		if( Abs(PawnOwner.Location.Z - Victim.Location.Z) > MaxVictimZOffset )
		{
			return;
		}

		if( VSizeSq(ToEnemy) <= Square(MaxGrabDistance) )
		{
			if( !KFPOwner.IsHumanControlled() )
			{
				// trace for obstructions
				HitActor = PawnOwner.Trace(HitLocation, HitNormal, Victim.Location, PawnOwner.Location, true, Extent);
				if( HitActor != None && HitActor != Victim )
				{
					return;
				}
			}

			SpecialMoveFlags = class'KFSM_GrappleAttack'.static.PackSMFlags();
			// force grapple special move on server
			KFPOwner.DoSpecialMove(SM_GrabAttack, true, Victim, SpecialMoveFlags);
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

function SpecialMoveButtonRetriggered()
{
	KFPOwner.DoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonPressed );
	if( KFPOwner.Role < ROLE_Authority && KFPOwner.IsLocallyControlled() )
	{
		KFPOwner.ServerDoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonPressed );
	}
}

function SpecialMoveButtonReleased()
{
	KFPOwner.DoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonReleased );
	if( KFPOwner.Role < ROLE_Authority && KFPOwner.IsLocallyControlled() )
	{
		KFPOwner.ServerDoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonReleased );
	}
}

function SpecialMoveFlagsUpdated()
{
	if( KFPOwner.SpecialMoveFlags == FLAG_SpecialMoveButtonPressed )
	{
		bPendingStopFire = false;
	}
	else if( KFPOwner.SpecialMoveFlags == FLAG_SpecialMoveButtonReleased )
	{
		bPendingStopFire = true;
	}
	else
	{
		super.SpecialMoveFlagsUpdated();
	}
}

defaultproperties
{
   MaxGrabDistance=210.000000
   MaxVictimZOffset=128.000000
   bCanBeBlocked=True
   AnimName="Grab"
   bCanBeInterrupted=True
   bLockPawnRotation=True
   Name="Default__KFSM_GrappleStart"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
