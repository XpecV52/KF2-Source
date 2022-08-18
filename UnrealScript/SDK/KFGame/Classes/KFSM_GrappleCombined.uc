//=============================================================================
// KFSM_GrappleCombined
//=============================================================================
// One grapple to rule them all.  Combines GrappleAttack and GrappleStart
// so we have better control over the transition.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

// @todo: collapse super class "GrappleAttack" into this class
class KFSM_GrappleCombined extends KFSM_GrappleAttack;

// Simple state flags for multi-stage special move
enum EGrappleState
{
    EGS_GrabAttempt,
    EGS_GrabSuccess,
    EGS_GrabMiss,
};

/** Beyond this distance the grapple will fail */
var float MaxGrabDistance;
/** Make sure Z distance isn't too far */
var float MaxVictimZOffset;
/** Anim to play when attempting to grab attach */
var name GrabStartAnimName;

/** If set, this ability can be blocked by a melee weapon */
var bool bCanBeBlocked;
/** Is set, the owner can cancel/abort this move after it's been started */
var bool bCanBeInterrupted;

/** Minimum amount of time to grab if player released button */
var float MinPlayerGrabTime;

/** Should use root motion for the initial "grab attempt" animation */
var	bool  bUseRootMotion;

/** Restrictions for doing grab animation. */
protected function bool InternalCanDoSpecialMove()
{
	if( PawnOwner.IsHumanControlled() && PawnOwner.Physics == PHYS_Falling )
	{
		return false;
	}

	if ( KFPOwner.IsHeadless() )
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
	if ( KFPOwner.SpecialMoveFlags == EGS_GrabAttempt )
	{
		if ( NewMove == 'KFSM_Stunned' || NewMove == 'KFSM_Stumble' )
		{
			return TRUE; // for NotifyAttackParried
		}
	}
	return FALSE;
}

/** Notification called when Special Move starts */
function SpecialMoveStarted(bool bForced, Name PrevMove )
{
	// skip default (instant attach) behavior 
	Super(KFSpecialMove).SpecialMoveStarted(bForced,PrevMove);

	// Reset variables
	Follower = None;
	bAlignFollowerLookSameDirAsMe = default.bAlignFollowerLookSameDirAsMe;
	bAlignPawns = default.bAlignPawns;
	bAlignFollowerRotation = default.bAlignFollowerRotation;
	bPendingStopFire = false;

	PlayGrabAnim();
}

/** Play an animation and enable the OnAnimEnd notification */
function PlayGrabAnim()
{
	local float GrabCheckTime;

	// On the server start a timer to check collision
	if ( PawnOwner.Role == ROLE_Authority )
	{
		GrabCheckTime = KFSkeletalMeshComponent(PawnOwner.Mesh).GetAnimInterruptTime(GrabStartAnimName);

		if ( GrabCheckTime <= 0 )
		{
			`warn("Failed to play" @ GrabStartAnimName @ "on special move" @ Self @ "on Pawn" @ PawnOwner);
			PawnOwner.SetTimer(0.25f, FALSE, nameof(AbortSpecialMove), Self);
			return;
		}

		PawnOwner.SetTimer(GrabCheckTime, FALSE, nameof(CheckGrapple), Self);
	}

	PlaySpecialMoveAnim(GrabStartAnimName, EAS_FullBody);

	if ( bUseRootMotion )
	{
		// Turn on root motion on animation node
		KFPOwner.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Translate, RBA_Translate, RBA_Translate);

		// Turn on Root motion on mesh.
		KFPOwner.Mesh.RootMotionMode = RMM_Accel;
	}
}

/**
  * Check to see if we're in range to lock into a grapple
  * Network: Server
  */
function CheckGrapple()
{
	local vector ToEnemy;
	local vector Extent, HitLocation, HitNormal;
	local Actor HitActor;
	local KFPawn Victim;

	if( KFPOwner.IsHumanControlled() )
	{
		Victim = KFPawn(FindPlayerGrabTarget());
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

		if( VSizeSq(ToEnemy) > Square(MaxGrabDistance) )
		{
			return; // exceeded max distance
		}

		if( !KFPOwner.IsHumanControlled() )
		{
			// Set our extent
			Extent.X = PawnOwner.GetCollisionRadius() * 0.5f;
			Extent.Y = Extent.X;
			Extent.Z = PawnOwner.GetCollisionHeight() * 0.5f;

			// trace for obstructions (already checked if IsHumanControlled())
			HitActor = PawnOwner.Trace(HitLocation, HitNormal, Victim.Location, PawnOwner.Location, true, Extent);
			if( HitActor != None && HitActor != Victim )
			{
				return;
			}
		}

		BeginGrapple(Victim);
		PlayGrappleLoopAnim();
	}
}

/** Returns a victim to try and grab onto */
function Pawn FindPlayerGrabTarget()
{
	local KFPawn_Monster KFPM;
	local vector StartLoc, EndLoc;

	KFPM = KFPawn_Monster(PawnOwner);
	if ( KFPM != None )
	{
		StartLoc = PawnOwner.Location;
		EndLoc = StartLoc + Normal(Vector(PawnOwner.Rotation)) * MaxGrabDistance;

		return KFPM.MeleeAttackHelper.FindVictimByFOV(StartLoc, EndLoc, MaxGrabDistance);
	}
}

/** Called when grapple is successful and interaction pawn is attached */
function BeginGrapple(optional KFPawn Victim)
{
    if ( PawnOwner.Role == ROLE_Authority )
    {
        // @todo: Server only for now because the alignment code is not 
        // network safe on simulated proxy.  Needs invstigation!
        bAlignPawns = default.bAlignPawns;

        KFPOwner.InteractionPawn = Victim;
		KFPOwner.ReplicatedSpecialMove.InteractionPawn = Victim;

        // replicate attachment
        KFPOwner.SpecialMoveFlags = EGS_GrabSuccess;
        KFPOwner.ReplicatedSpecialMove.Flags = KFPOwner.SpecialMoveFlags;
    }

    // If button released before loop force at least one loop, then abort
	if ( bPendingStopFire && PawnOwner.IsHumanControlled() && PawnOwner.IsLocallyControlled() )
	{
		PawnOwner.SetTimer(MinPlayerGrabTime, false, nameof(PlayerReleasedGrapple), self);
	}

	// stop root motion
	if ( bUseRootMotion && PawnOwner.Mesh.RootMotionMode == RMM_Accel )
	{
		// Restore default root motion mode
		PawnOwner.Mesh.RootMotionMode = PawnOwner.Mesh.default.RootMotionMode;
		// Turn off Root motion on animation node
		KFPOwner.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Discard, RBA_Discard, RBA_Discard);
	}

    // Set up a safety net in case interaction cannot be started
    PawnOwner.SetTimer( InteractionStartTimeOut, FALSE, nameof(self.InteractionStartTimedOut), self );

    // See if we can start interaction right now. If we can't, keep trying until we can.
    CheckReadyToStartInteraction();
}

// Use timer & animlength instead of animend
function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	if( KFPOwner != none && KFPOwner.Role == ROLE_Authority )
	{
		if ( KFPOwner.SpecialMoveFlags == EGS_GrabAttempt )
		{
			KFPOwner.EndSpecialMove();
		}
		else
		{
			PlayGrappleLoopAnim();
		}
	}
}

/** Toggle attachment */
function SpecialMoveFlagsUpdated()
{
    if ( KFPOwner.SpecialMoveFlags >= EGS_GrabSuccess )
    {
    	// one-time attachment
    	if ( Follower == None )
    	{
    		BeginGrapple();
    	}

   		PlayGrappleLoopAnim();
    }
}

/** Network: All */
function PlayGrappleLoopAnim()
{
	local byte Variant;

	if( KFPOwner != none && KFPOwner.Role == ROLE_Authority )
	{
		// Do not use the last variant
		Variant = Rand(default.GrappleAnims.Length);
		while(Variant == LastVariant)
		{
			Variant = Rand(default.GrappleAnims.Length);
		}

		LastVariant = Variant;
		KFPOwner.SpecialMoveFlags = (Variant << 4) + EGS_GrabSuccess;
		KFPOwner.ReplicatedSpecialMove.Flags = KFPOwner.SpecialMoveFlags;
	}

	PlaySpecialMoveAnim(GrappleAnims[KFPOwner.SpecialMoveFlags >> 4], EAS_FullBody);
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	// Clear timers.
	PawnOwner.ClearTimer(nameof(CheckGrapple), Self);

	// stop root motion
	if ( bUseRootMotion && PawnOwner.Mesh.RootMotionMode == RMM_Accel )
	{
		// Restore default root motion mode
		PawnOwner.Mesh.RootMotionMode = PawnOwner.Mesh.default.RootMotionMode;
		// Turn off Root motion on animation node
		KFPOwner.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Discard, RBA_Discard, RBA_Discard);
	}

	Super.SpecialMoveEnded(PrevMove, NextMove);
}

/** Handle bCanBeInterrupted, also see CanOverrideMoveWith() for interrupt moves */
function NotifyOwnerTakeHit(class<KFDamageType> DamageType, vector HitLoc, vector HitDir, Controller InstigatedBy)
{
	if ( KFPOwner.SpecialMoveFlags == EGS_GrabAttempt )
	{
		if ( bCanBeInterrupted && class'KFSM_PlaySingleAnim'.static.IsAnInterruptHit(PawnOwner, DamageType) )
		{
			// Force stumble.  Cannot simple exit this move without aborting/overriding the animation
			if ( KFPOwner.CanDoSpecialMove(SM_Stumble) )
			{
				KFPOwner.DoSpecialMove(SM_Stumble,,, class'KFSM_Stumble'.static.PackBodyHitSMFlags(KFPOwner, HitDir));
			}
		}
	}
}

/* Called on some player-controlled moves when a firemode input has been pressed */
function SpecialMoveButtonRetriggered()
{
	bPendingStopFire = false;

	// Clear the release timer if it's active
	if( PawnOwner.IsTimerActive(nameOf(PlayerReleasedGrapple), self) )
	{
		PawnOwner.ClearTimer( nameOf(PlayerReleasedGrapple), self );
	}
}

/** Called on some player-controlled moves when a firemode input has been released */
function SpecialMoveButtonReleased()
{
	bPendingStopFire = true;

	// if already attached we can stop immediately
	if ( KFPOwner.SpecialMoveFlags != EGS_GrabAttempt )
	{
		PlayerReleasedGrapple();
	}
}

/** Called when aborting the move due to player input */
function PlayerReleasedGrapple()
{
	KFPOwner.EndSpecialMove();
	if( KFPOwner.Role < ROLE_Authority && KFPOwner.IsLocallyControlled() )
	{
		KFPOwner.ServerDoSpecialMove(SM_None, true);
	}
}

defaultproperties
{
	// ---------------------------------------------
	// Animations
	GrabStartAnimName=Grab

	// ---------------------------------------------
	// SpecialMove
	bLockPawnRotation=true
	//bUseRootMotion=true

	// ---------------------------------------------
	// Combat
	MaxGrabDistance=210.f
	MaxVictimZOffset=128.f
	bCanBeBlocked=true
	bCanBeInterrupted=true
	MinPlayerGrabTime=4.f
}