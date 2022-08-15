//=============================================================================
// KFSM_HansGrappleVictim
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_HansGrappleVictim extends KFSM_GrappleVictim;

/** Animation to play */
var() name	AnimName;

/** Start grabbed anim */
function SpecialMoveStarted( bool bForced, Name PrevMove )
{
	Super.SpecialMoveStarted(bForced, PrevMove);

	// if this fails (e.g. missing anim) it's okay to continue unlike with PlaySpecialMoveAnim
	KFPOwner.PlayBodyAnim(AnimName, EAS_FullBody, 1.f, 0.33f, 0.33f, true);
}

/** Stop grabbed anim */
function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	Super.SpecialMoveEnded(PrevMove, NextMove);
	KFPOwner.StopBodyAnim(EAS_FullBody, 0.33f);
	// Let other zeds attack you again after Hans is done with you
	KFPOwner.ExclusiveTargetingController = none;
}

// Never set the grab post process effect when grabbed
function SetGrabEffect( KFPlayerController KFPC, bool bValue );

defaultproperties
{
   AnimName="Grabbed_LifeDrain_V1"
   bAllowThirdPersonWeaponAnims=False
   bLockPawnRotation=True
   bDisableLook=True
   bDisableWeaponInteraction=True
   Handle="SM_HansGrappleVictim"
   Name="Default__KFSM_HansGrappleVictim"
   ObjectArchetype=KFSM_GrappleVictim'KFGame.Default__KFSM_GrappleVictim'
}
