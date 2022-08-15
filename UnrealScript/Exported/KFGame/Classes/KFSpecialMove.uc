//=============================================================================
// KFSpecialMoveHandler
//=============================================================================
// Manages starting and stopping special moves for pawns
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFSpecialMove extends GameSpecialMove
	native(SpecialMoves)
	abstract;

/** Owner of this special move */
var KFPawn				KFPOwner;
var PlayerController	PCOwner;
var KFAIController		AIOwner;
var transient Object AISpecialOwner;

/*********************************************************************************************
 * Animation
 *********************************************************************************************/

/** Cached reference to the current AnimNodeSlot used for cleanup */
var AnimNodeSlot ActiveSlotNode;

/** If set, this special move will override the value for Pawn::MaxSpeedModifier() */
var bool bOverridePawnSpeedModifier;

/** If set, hit reactions will still play while special move is active */
var bool bAllowHitReactions;
/** If set, HandleMomentum is skipped when taking damage */
var bool bAllowMomentumPush;
/** If set, never interrupt this move for a wander. Instead try to wander at the end of the move 
*   NOTE: this variable could potentially be replaced with bDisableMovement. This is not currently
*   done in case it breaks other special moves */
var bool bCanOnlyWanderAtEnd;
/** If set, allow weapon anims to be played for third-person pawns (weapon attachment) */
var bool bAllowThirdPersonWeaponAnims;

/*********************************************************************************************
 * Weapon firing
 *********************************************************************************************/

/** Weapon firing should cease/be disabled while this special move is being performed */
var bool bDisablesWeaponFiring;

/**
* For SpecialMove interactions. Only InteractionPawn allowed to damage me.
* Note: this is reset to FALSE in SpecialMoveStarted.
*/
var bool bOnlyInteractionPawnCanDamageMe;
/** Can change InteractionPawn before execution (InternalCanDoSpecialMove) */
var bool bCanModifyInteractionPawn;

/*********************************************************************************************
 * GearSpecialMove
 *********************************************************************************************/

/** Flag to allow/disallow headtracking while in this special move. */
var const           bool    bDisableHeadTracking;
/** AI should ignore notifications */
var	const			bool	bDisableAI;
/** Disable movement (but doesn't necessarily stop physics, just blocks inputs). */
var	const			bool	bDisableMovement;
var             	bool	bMovementDisabled;
/** Lock Pawn Rotation, prevent it from being affects by Controller.Rotation */
var	const			bool	bLockPawnRotation;
var     			bool	bPawnRotationLocked;
var                 bool    bDisableLook;
/** Weapon goes down and can't shoot, be switched, can't quick heal, etc */
var                 bool    bDisableWeaponInteraction;
/** if > 0.0 after this many seconds the AI's command is popped and the special move is aborted */
var					float	AITimeout;
var					bool	bDisableAIAttackRangeChecks;
var					bool	bDisableSteering;
/** If TRUE, disables turning in place animations & code. Pawn will always face his rotation. */
var const			bool	bDisableTurnInPlace;
var	const			bool	bDisablePhysics;
var 				bool 	bAllowFireAnims;
var	AICommand_PushedBySM	AICommand;
/** Default AICommand to push on AI when SpecialMove starts */
var class<AICommand_PushedBySM>	DefaultAICommandClass;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/*********************************************************************************************
 * Functions
 *********************************************************************************************/

/** Overridden to lock desired rotation (see GOW3) */
//native function ForcePawnRotation(Pawn P, Rotator NewRotation);

function bool NotifyBump(Actor Other, vector HitNormal);
event byte PackFlags();

/**
 * Checks to see if this Special Move can be done.
 */
protected function bool InternalCanDoSpecialMove()
{
	return (PawnOwner.Physics != PHYS_RigidBody);
}

function InitSpecialMove( Pawn InPawn, Name InHandle )
{
	PawnOwner = InPawn;

	KFPOwner = KFPawn(InPawn);
	if ( PawnOwner.Controller != none )
	{
		PCOwner = PlayerController(PawnOwner.Controller);
		if( PCOwner == none )
		{
			AIOwner = KFAIController(PawnOwner.Controller);
		}
	}
}

function SpecialMoveStarted( bool bForced, Name PrevMove )
{
	local AICommand AIOwnerActiveCommand;

	// Push AICommand if it is defined.
	if( AIOwner != None && DefaultAICommandClass != None && AIOwner.MyKFPawn != None )
	{
		AIOwnerActiveCommand == AICommand(AIOwner.GetActiveCommand());

		if(( AIOwnerActiveCommand == none || AIOwnerActiveCommand.AllowPushOfDefaultCommandForSpecialMove(KFPOwner.SpecialMove)))
		{
			AICommand = DefaultAICommandClass.static.PushSpecialMoveCommand(AIOwner);
		}
	}

	if( PCOwner != None )
	{
		if( bDisableLook )
		{
			PCOwner.IgnoreLookInput(TRUE);
		}
	}

	if( bDisableWeaponInteraction && KFPOwner != none && KFPOwner.Weapon != none
        && KFWeapon(KFPOwner.Weapon) != none )
	{
        KFWeapon(KFPOwner.Weapon).SetSimplePutDown(true);
	}

	if( bDisableTurnInPlace )
	{
		KFPOwner.bDisableTurnInPlace = TRUE;
	}

	if( bDisableMovement )
	{
		SetMovementLock(TRUE);
	}

	// If Pawn rotation should be locked, make sure it is.
	if( bLockPawnRotation )
	{
		SetLockPawnRotation(TRUE);
	}

	if( bDisablePhysics )
	{
		PawnOwner.ZeroMovementVariables();
		if (PawnOwner.Role == ROLE_Authority || PawnOwner.IsLocallyControlled())
		{
			PawnOwner.SetPhysics(PHYS_None);
		}
	}
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	// Clear timers.
	PawnOwner.ClearTimer(nameof(AbortSpecialMove), Self);

	// AI set special move command.
	if( AIOwner != None && DefaultAICommandClass != None && AICommand != None )
	{
		if( AIOwner.GetActiveCommand() == AICommand )
		{
			AICommand.Status = 'Success';
			AIOwner.PopCommand(AICommand);
		}
		// Clear reference.
		AICommand = None;
	}

	if( PCOwner != None )
	{
		if( bDisableLook )
		{
			PCOwner.IgnoreLookInput(FALSE);
		}
	}

	if( bDisableWeaponInteraction && KFPOwner != none && KFPOwner.Weapon != none
        && KFWeapon(KFPOwner.Weapon) != none )
	{
        KFWeapon(KFPOwner.Weapon).SetSimplePutDown(false);
	}


	if ( bDisablePhysics && (PawnOwner.Role == ROLE_Authority || PawnOwner.IsLocallyControlled()) )
	{
		PawnOwner.SetPhysics(PHYS_Falling);
	}

	// If movement was disabled, toggle it back on
	if( bMovementDisabled )
	{
		SetMovementLock(FALSE);
	}

	if (AIOwner != none)
	{
		AIOwner.NotifySpecialMoveEnded(self);
	}
	AISpecialOwner = none;

	// If Pawn rotation was locked in default properties, unlock it.
	// Otherwise we're in manual mode, so let the special subclass handle everything.
	if( bPawnRotationLocked )
	{
		SetLockPawnRotation(FALSE);
	}

	if( bDisableTurnInPlace )
	{
		KFPOwner.bDisableTurnInPlace = KFPOwner.default.bDisableTurnInPlace;
	}

	// Disable end of animation notification, so it doesn't interfere with future special moves
	// using that same animation channel.
	if ( ActiveSlotNode != None )
	{
		ActiveSlotNode.SetActorAnimEndNotification( FALSE );
		ActiveSlotNode = None;
	}

	// If we are in a state that should have left us wandering, begin wandering at the end of this move
	if( bCanOnlyWanderAtEnd && KFPOwner != none )
	{
		if( AIOwner != none && KFPOwner.IsHeadless() )
		{
			AIOwner.DoHeadlessWander();
		}
		else if(KFPOwner.ShouldBeWandering())
		{
			KFPOwner.CausePanicWander();	
		}
	}
}

/** Locks or Unlocks Pawn movement */
final function SetMovementLock(bool bEnable)
{
	if( bMovementDisabled != bEnable )
	{
		bMovementDisabled = bEnable;

		if (PCOwner != None)
		{
			PCOwner.IgnoreMoveInput(bEnable);
			// we might be in between the input reading and PlayerMove(), so we need to zero the inputs
			// to make sure a stray tick of motion doesn't get in
			if (PCOwner.PlayerInput != None)
			{
				PCOwner.PlayerInput.aForward = 0.f;
				PCOwner.PlayerInput.aStrafe = 0.f;
				PCOwner.PlayerInput.aUp = 0.f;
			}
		}

		// Set acceleration to zero
		if( bEnable )
		{
			PawnOwner.Acceleration = Vect(0,0,0);
		}
	}
}

/**
 * Locks or UnLocks Pawn rotation.
 * When Pawn rotation is locked, Pawn will stop rotating to match the controller's Yaw.
 */
final function SetLockPawnRotation(bool bLock)
{
	if( bPawnRotationLocked != bLock )
	{
		bPawnRotationLocked = bLock;

		// If we were locked, then interpolate back to new (unlocked) rotation
		if( !bLock )
		{
			//PawnOwner.InterpolatePawnRotation();
		}
	}
}

/** Play a CameraAnim */
function CameraAnimInst PlayCameraAnim
(
	Pawn			PawnToPlay,
	CameraAnim		InCameraAnim,
	optional float	Rate=1.f,
	optional float	Scale=1.f,
	optional float	BlendInTime,
	optional float	BlendOutTime,
	optional bool	bLoop,
	optional bool	bRandomStartTime,
	optional float	Duration,
	optional bool	bSingleInstance,
	optional bool	bSkipSpaceCheck
)
{
	local KFPlayerController	KFPC;

	KFPC = KFPlayerController(PawnToPlay.Controller);

	// Only play camera animations on local human players
	if (KFPC == None || !PawnToPlay.IsLocallyControlled() || KFPC.PlayerCamera == None || InCameraAnim == None)
	{
		return None;
	}

	if (!bSkipSpaceCheck && !KFPC.CameraAnimHasEnoughSpace(InCameraAnim, Scale))
	{
		LogInternal("PlayCameraAnim failed CameraAnimHasEnoughSpace:" @ KFPC.CameraAnimHasEnoughSpace(InCameraAnim, Scale));
		return None;
	}

	if (PawnOwner != None && PawnOwner.WorldInfo.GRI.bMatchIsOver)
	{
		return None;
	}

	// Play camera animation
	return KFPC.PlayerCamera.PlayCameraAnim(InCameraAnim, Rate, Scale, BlendInTime, BlendOutTime, bLoop, bRandomStartTime, Duration, bSingleInstance);
}

/* Play a custom animation by name */
simulated function float PlaySpecialMoveAnim( name AnimName,
											  EAnimSlotStance AnimStance,
											  optional float BlendInTime=0.2f,
											  optional float BlendOutTime=0.2f,
											  optional float Rate=1.f,
											  optional bool	bLooping )
{
	local float Duration;

	if (KFPOwner.bLogCustomAnim) LogInternal("PlaySpecialMoveAnim '"$AnimName$"' on"@KFPOwner@" SM="$self);

	Duration = KFPOwner.PlayBodyAnim(AnimName, AnimStance, Rate, BlendInTime, BlendOutTime, bLooping);

	// Make sure animation is valid (otherwise this move could break)
	if ( Duration <= 0 && KFPOwner.IsDoingSpecialMove() )
	{
		// Failed to play animation, fall back to just setting a timer to exit the special move.
		WarnInternal("Failed to play" @ AnimName @ "on special move" @ Self @ "on Pawn" @ PawnOwner);
		PawnOwner.SetTimer(0.25f, FALSE, nameof(AbortSpecialMove), Self);
		return 0;
	}

	// Enable OnAnimEnd notification (auto-reset by the slot node)
	if ( !bLooping )
	{
		ActiveSlotNode = KFPOwner.BodyStanceNodes[AnimStance];
		ActiveSlotNode.SetActorAnimEndNotification( TRUE );
	}

	return Duration;
}

/** Timer used to exist gracefully if something has gone wrong */
function AbortSpecialMove()
{
	KFPOwner.EndSpecialMove();
}

/** Called by owning AI Command when AI behavior decides to stop this attack */
function AbortedByAICommand();

/**
 * Notification called when body stance animation finished playing.
 * @param	SeqNode		- Node that finished playing. You can get to the SkeletalMeshComponent by looking at SeqNode->SkelComponent
 * @param	PlayedTime	- Time played on this animation. (play rate independant).
 * @param	ExcessTime	- how much time overlapped beyond end of animation. (play rate independant).
 */
function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	// By default end this special move.
	KFPOwner.EndSpecialMove();
}

/** Notification from the pawn that damage was taken during move */
function NotifyOwnerTakeHit(class<KFDamageType> DamageType, vector HitLoc, vector HitDir, Controller InstigatedBy);

/** Used for changing attack target (non claimable, switch to other enemy) */
event ModifyInteractionPawn(out KFPawn OtherPawn);

defaultproperties
{
   bDisableAIAttackRangeChecks=True
   bDisableSteering=True
   Handle="KFSpecialMove"
   Name="Default__KFSpecialMove"
   ObjectArchetype=GameSpecialMove'GameFramework.Default__GameSpecialMove'
}
