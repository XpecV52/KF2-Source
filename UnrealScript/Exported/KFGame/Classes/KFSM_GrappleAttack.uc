//=============================================================================
// KFSM_GrappleAttack
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFSM_GrappleAttack extends KFSM_InteractionPawnLeader
	native(SpecialMoves);

// Animations
var array<name>	 GrappleAnims;
var bool bStopFullBodyWhenMoveEnds;
var byte LastVariant;  // The last anim index this special move played

/** Pack the animation index we'll be using for the zed to emerge */
static function byte PackSMFlags()
{
	return Rand(default.GrappleAnims.Length);
}

/** Notification called when Special Move starts */
function SpecialMoveStarted(bool bForced, Name PrevMove )
{
	Super.SpecialMoveStarted(bForced,PrevMove);
	PlayGrappleAnim();
}

/** StartInteraction */
function StartInteraction() 
{
	local KFAIDirector AIDirector;

	if( Follower != none && KFPOwner != none )
	{
	    // Prevent grenade throwing for a short time after being grabbed to prevent players blowing themselves up
	    if( KFWeapon(Follower.Weapon) != none )
	    {
	        KFWeapon(Follower.Weapon).ZedGrabGrenadeTossCooldown = Follower.WorldInfo.TimeSeconds + 0.35;
	    }

	    // Force the player to look at the zed if grabbed
	    if( Follower.Controller != none && KFPlayerController(Follower.Controller) != none )
	    {
	        KFPlayerController(Follower.Controller).ForceLookAtPawn = KFPOwner;
	        KFPlayerController(Follower.Controller).bLockToForceLookAtPawn = true;
	    }

		// Try to let the game's KFAIDirector know about the successful grab, so it can alert nearby Zeds
		// TODO: Might want to move this to a timer so other zeds aren't alerted until the grapple anim actively looping
		if( KFPOwner.MyKFAIC != none )
		{
			AIDirector = KFPOwner.MyKFAIC.MyAIDirector;

			//Let the AI controller know the initial attack succeeded
			if( KFAIController_Monster(KFPOwner.MyKFAIC) != none )
			{
	            KFAIController_Monster(KFPOwner.MyKFAIC).bCompletedInitialGrabAttack = true;
	        }
		}
		else if ( KFPOwner.WorldInfo.Game != None )
		{
			AIDirector = KFGameInfo( KFPOwner.WorldInfo.Game ).GetAIDirector();
			if ( AIDirector != None )
			{
				// We currently don't notify if/when the player breaks away from the grab
				AIDirector.NotifyPawnGrabbed( Follower, KFPOwner );
			}
		}
	}
}

/**
 * Used for Pawn to Pawn interactions.
 * Return TRUE if we can perform an Interaction with this Pawn.
 */
function bool CanInteractWithPawn(KFPawn OtherPawn)
{
	// Prevent interaction if potentiail victim is dead, not on our team, in Phys_Falling, or busy with another special move
	return( (OtherPawn.IsAliveAndWell() && !KFPOwner.IsSameTeam(OtherPawn) && OtherPawn.Physics != PHYS_Falling && !OtherPawn.IsDoingSpecialMove())
		&& Super.CanInteractWithPawn(OtherPawn) );
}

function PlayGrappleAnim()
{
	LastVariant = KFPOwner.SpecialMoveFlags;
	PlaySpecialMoveAnim(GrappleAnims[LastVariant], EAS_FullBody);
}

// Use timer & animlength instead of animend
function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
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

		KFPOwner.SpecialMoveFlags = Variant;
		KFPOwner.ReplicatedSpecialMove.Flags = Variant;

		// force grapple special move on server
		SpecialMoveFlagsUpdated();
	}
}

/** When the grapple animation ends, continue it with a different grapple anim */
function SpecialMoveFlagsUpdated()
{
	if( KFPOwner.SpecialMoveFlags == FLAG_SpecialMoveButtonReleased )
	{
		KFPOwner.EndSpecialMove();
	}
	else
	{
		PlayGrappleAnim();
	}	
}

/** Notification when Follower is leaving his FollowerSpecialMove */
function OnFollowerLeavingSpecialMove()
{
	KFPOwner.EndSpecialMove();
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	if( bStopFullBodyWhenMoveEnds )
	{
		KFPOwner.StopBodyAnim(EAS_FullBody, 0.2f);
	}
	KFPOwner.ZeroMovementVariables();

	if( Follower != None && Follower.Role == ROLE_Authority )
	{
		if( Follower.IsDoingSpecialMove(FollowerSpecialMove) )
		{
			Follower.EndSpecialMove(FollowerSpecialMove);
		}
	}

	Super.SpecialMoveEnded(PrevMove, NextMove);
}

/** Notification from the pawn that damage was taken during move */
function NotifyOwnerTakeHit(class<KFDamageType> DamageType, vector HitLoc, vector HitDir, Controller InstigatedBy)
{
	// Don't break grab if the damage was from someone on the same team
    if( InstigatedBy != none && KFPOwner != none && InstigatedBy.GetTeamNum() == KFPOwner.GetTeamNum() )
    {
        return;
    }

    // End the move immediately and let ProcessAIHit force a SM_Stumble
	KFPOwner.EndSpecialMove();

	// force stumble when damaged from a grapple
	if ( KFPOwner.CanDoSpecialMove(SM_Stumble) && DamageType.default.StumblePower > 0 )
	{
		KFPOwner.DoSpecialMove(SM_Stumble,,, class'KFSM_Stumble'.static.PackBodyHitSMFlags(KFPOwner, HitDir));
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

defaultproperties
{
   GrappleAnims(0)="Grab_Attack_V1"
   GrappleAnims(1)="Grab_Attack_V2"
   GrappleAnims(2)="Grab_Attack_V3"
   bStopFullBodyWhenMoveEnds=True
   FollowerSpecialMove=SM_GrappleVictim
   bAlignPawns=True
   bStopAlignFollowerRotationAtGoal=True
   AlignDistance=92.000000
   AlignFollowerInterpSpeed=22.000000
   bDisableMovement=True
   bServerOnlyPhysics=True
   Handle="SM_GrappleAttack"
   Name="Default__KFSM_GrappleAttack"
   ObjectArchetype=KFSM_InteractionPawnLeader'KFGame.Default__KFSM_InteractionPawnLeader'
}
