//=============================================================================
// KFSM_GrappleVictim
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_GrappleVictim extends KFSM_InteractionPawnFollower;

var transient KFPlayerController OwnerController;

var AkEvent GrabbedSoundModeStartEvent;
var AkEvent GrabbedSoundModeEndEvent;

/** Recently grabbed targets get a repreive */
var float GrabVictimCooldownTime;

/** Notification called when Special Move starts */
function SpecialMoveStarted(bool bForced, Name PrevMove )
{
	local KFPawn_Human KFPH;
	local KFGameInfo KFGI;

	super.SpecialMoveStarted( bForced, PrevMove );

	OwnerController = KFPlayerController( PawnOwner.Controller );

	if( OwnerController != none)
	{
		SetGrabEffect(OwnerController, true);
		if( OwnerController.IsLocalController() )
		{
			OwnerController.PostAkEvent(GrabbedSoundModeStartEvent);
		}
	}

	if( PawnOwner.Role == ROLE_Authority )
	{
		KFPH = KFPawn_Human( PawnOwner );
		if( KFPH != none )
		{
			KFGI = KFGameInfo(KFPH.WorldInfo.Game);
			if( KFGI != none && KFGI.DialogManager != none )
			{
				KFGI.DialogManager.PlayPlayerGrabbedDialog( KFPH );
			}
		}
	}

	KFPOwner.ShouldCrouch( false );
	if( KFPOwner.bIsCrouched )
	{
		KFPOwner.ForceUnCrouch();
	}
	KFPOwner.bCanCrouch = false;
	KFPOwner.bCanJump = false;
	KFPOwner.bJumpCapable = false;
}

function SpecialMoveEnded( Name PrevMove, Name NextMove )
{
	super.SpecialMoveEnded( PrevMove, NextMove );

	if( OwnerController != none )
	{
        // Clear the force look at from being grabbed
        OwnerController.ForceLookAtPawn = none;
        OwnerController.bLockToForceLookAtPawn = false;

		SetGrabEffect(OwnerController, false);
		if( OwnerController.IsLocalController() )
		{
			OwnerController.PostAkEvent(GrabbedSoundModeEndEvent);
		}
	}

	if ( PawnOwner.Role == ROLE_Authority )
	{
		KFPOwner.SetWeakGrabCoolDown(GrabVictimCooldownTime);
	}

	KFPOwner.bCanCrouch = KFPOwner.default.bCanCrouch;
	KFPOwner.bCanJump = KFPOwner.default.bCanJump;
	KFPOwner.bJumpCapable = KFPOwner.default.bJumpCapable;
}

function SetGrabEffect( KFPlayerController KFPC, bool bValue )
{
	KFPC.SetGrabEffect(bValue);
}

DefaultProperties
{
	// ---------------------------------------------
	// SpecialMove
	Handle=SM_GrappleVictim
	bDisableMovement=true
	bLockPawnRotation=false
	bDisableLook=false

	// KFSpecialMove
	bAllowThirdPersonWeaponAnims=true

	// Audio
	GrabbedSoundModeStartEvent=AkEvent'WW_UI_PlayerCharacter.Play_Grab_Start'
	GrabbedSoundModeEndEvent=AkEvent'WW_UI_PlayerCharacter.Play_Grab_Stop'

	GrabVictimCooldownTime=5.f
}