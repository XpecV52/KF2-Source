//=============================================================================
// KFSM_GrappleAttack
//=============================================================================
// Base Move to play a single animation, and end itself once it's done playing.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFSM_PlaySingleAnim extends KFSpecialMove
	abstract
	native(SpecialMoves);

/** Animation to play */
var() name				AnimName;
var() EAnimSlotStance	AnimStance;

var	float		BlendInTime;
var	float		BlendOutTime;
var	bool		bUseRootMotion;

/** Is set, the owner can cancel/abort this move after it's been started */
var bool bCanBeInterrupted;
/** BlendOut time when animation is interrupted */
var	float AbortBlendOutTime;

function SpecialMoveStarted(bool bForced, Name PrevMove)
{
	Super.SpecialMoveStarted(bForced, PrevMove);

	// Play animation
	PlayAnimation();

	if ( bUseRootMotion && AnimStance == EAS_FullBody )
	{
		// Turn on root motion on animation node
		KFPOwner.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Translate, RBA_Translate, RBA_Translate);

		// Turn on Root motion on mesh.
		KFPOwner.Mesh.RootMotionMode = RMM_Accel;
	}
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	if ( bUseRootMotion )
	{
		// Restore default root motion mode
		PawnOwner.Mesh.RootMotionMode = PawnOwner.Mesh.default.RootMotionMode;
		// Turn off Root motion on animation node
		KFPOwner.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Discard, RBA_Discard, RBA_Discard);
	}

	// If still playing an upperbody or fullbody animation allow it to be interrupted
 	if ( bCanBeInterrupted && KFPOwner.BodyStanceNodes[AnimStance].bIsPlayingCustomAnim )
 	{
		KFPOwner.StopBodyAnim(AnimStance, AbortBlendOutTime);
	}

	Super.SpecialMoveEnded(PrevMove, NextMove);
}

/** Play an animation and enable the OnAnimEnd notification */
function PlayAnimation()
{
	PlaySpecialMoveAnim(AnimName, AnimStance, BlendInTime, BlendOutTime, 1.f);
}

/**  When the animation finishes playing end this move */
function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	KFPOwner.EndSpecialMove();
}

/** Handle Interupt/Abort, also see CanOverrideMoveWith() for interrupt moves */
function NotifyOwnerTakeHit(class<KFDamageType> DamageType, vector HitLoc, vector HitDir, Controller InstigatedBy)
{
	if ( bCanBeInterrupted && IsAnInterruptHit(PawnOwner, DamageType) )
	{
		KFPOwner.EndSpecialMove();
	}
}

/** Returns true if this pawn is susceptible to a medium or hard hit reaction */
static function bool IsAnInterruptHit(Pawn P, class<KFDamageType> DamageType)
{
	local KFPawn_Monster KFPM;
	local byte HitZoneIdx;
	local EHitZoneBodyPart BodyPart;

	// only non-RM attacks can be aborted
	if ( DamageType != None )
	{
		KFPM = KFPawn_Monster(P);
		if ( KFPM != None )
		{
			// Grab the BodyPart from the TakeHitInfo, we can do this because PlayAIHitReactions is called just after the HitInfo is generated
			HitZoneIdx = KFPM.HitFxInfo.HitBoneIndex;
			BodyPart = (HitZoneIdx != 255) ? KFPM.HitZones[HitZoneIdx].Limb : BP_Torso;

			if ( KFPM.AfflictionHandler.GetPredictedHitReaction(DamageType, BodyPart) > HIT_Light )
			{
				return true;
			}
		}
	}

	return false;
}

defaultproperties
{
   BlendInTime=0.330000
   BlendOutTime=0.330000
   AbortBlendOutTime=0.330000
   bAllowMomentumPush=True
   Name="Default__KFSM_PlaySingleAnim"
   ObjectArchetype=KFSpecialMove'KFGame.Default__KFSpecialMove'
}
