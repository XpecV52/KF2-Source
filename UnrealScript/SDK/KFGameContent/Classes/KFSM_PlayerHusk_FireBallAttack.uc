//=============================================================================
// KFSM_Husk_FireBallAttack
//=============================================================================
// Player-controlled Husk fireball attack
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerHusk_FireBallAttack extends KFSM_PlaySingleAnim;

/** Set to true when wind up anim ahs finished */
var bool bReadyToFire;

/** Anims */
var name WindUpAnimName;
var name FireHeldAnimName;

function SpecialMoveStarted( bool bForced, name PrevMove )
{
	super.SpecialMoveStarted( bForced, PrevMove );	

	bReadyToFire = false;
	PlayWindUpAnimation();
}

/** Overridden to do nothing */
function PlayAnimation() {}

/** Plays our wind up anim, starts the barrel spin skel controller */
function PlayWindUpAnimation()
{
	bUseRootMotion = true;
	KFPOwner.Mesh.RootMotionMode = RMM_Accel;
	KFPOwner.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Translate, RBA_Translate, RBA_Translate);
	AnimStance = EAS_FullBody;
	PlaySpecialMoveAnim( WindUpAnimName, EAS_FullBody, BlendInTime, BlendOutTime, 1.f );
}

/** Plays our looping hold animation */
function PlayFireHeldAnimation()
{
	bReadyToFire = true;

	/*bUseRootMotion = false;
	KFPOwner.Mesh.RootMotionMode = KFPOwner.Mesh.default.RootMotionMode;
	KFPOwner.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Discard, RBA_Discard, RBA_Discard);
	AnimStance = EAS_UpperBody;*/
	PlaySpecialMoveAnim( FireHeldAnimName, EAS_FullBody, BlendInTime, BlendOutTime, 1.f, true );
}

/** Plays the fire animation */
function PlayFireAnimation()
{
	bReadyToFire = false;
	bPendingStopFire = false;

	/*bUseRootMotion = false;
	KFPOwner.Mesh.RootMotionMode = KFPOwner.Mesh.default.RootMotionMode;
	KFPOwner.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Discard, RBA_Discard, RBA_Discard);
	AnimStance = EAS_UpperBody;*/

	PlaySpecialMoveAnim( AnimName, EAS_FullBody, BlendInTime, BlendOutTime, 1.f, false );
}

/** Plays subsequent animations in the barrage */
function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	switch( SeqNode.AnimSeqName )
	{
		case WindUpAnimName:
			if( bPendingStopFire )
			{
				PlayFireAnimation();
			}
			else
			{
				PlayFireHeldAnimation();
			}
			break;

		case AnimName:
			KFPOwner.EndSpecialMove();
			break;
	}
}

/** When the grapple animation ends, continue it with a different grapple anim */
function SpecialMoveFlagsUpdated()
{
	if( KFPOwner.SpecialMoveFlags == FLAG_SpecialMoveButtonReleased )
	{
		bPendingStopFire = true;
		if( bReadyToFire )
		{
			PlayFireAnimation();
		}
	}
	else if( KFPOwner.SpecialMoveFlags == FLAG_SpecialMoveButtonPressed )
	{
		bPendingStopFire = false;
	}
	else
	{
		super.SpecialMoveFlagsUpdated();
	}
}

/* Called on some player-controlled moves when a firemode input has been pressed */
function SpecialMoveButtonRetriggered()
{
	KFPOwner.DoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonPressed );
	if( KFPOwner.Role < ROLE_Authority && KFPOwner.IsLocallyControlled() )
	{
		KFPOwner.ServerDoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonPressed );
	}
}

/** Called on some player-controlled moves when a firemode input has been released */
function SpecialMoveButtonReleased()
{
	KFPOwner.DoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonReleased );
	if( KFPOwner.Role < ROLE_Authority && KFPOwner.IsLocallyControlled() )
	{
		KFPOwner.ServerDoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonReleased );
	}
}

DefaultProperties
{
	// SpecialMove
	WindUpAnimName=Player_Shoot_Start
	FireHeldAnimName=Player_Shoot_Loop
	AnimName=Player_Shoot_End
	Handle=KFSM_PlayerHusk_FireBallAttack
	bDisableSteering=false
	bDisableMovement=true
	AnimStance=EAS_FullBody
   	bCanBeInterrupted=true

	bUseCustomThirdPersonViewOffset=true
	CustomThirdPersonViewOffset={(
		OffsetHigh=(X=-135,Y=75,Z=40),
		OffsetLow=(X=-180,Y=75,Z=50),
		OffsetMid=(X=-120,Y=60,Z=0),
		)}
	ViewOffsetInterpTime=0.3f
	CustomCameraFOV=60.f
	CameraFOVTransitionTime=0.4f
}