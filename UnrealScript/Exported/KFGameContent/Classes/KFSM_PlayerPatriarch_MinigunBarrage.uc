//=============================================================================
// KFSM_PlayerPatriarch_MinigunBarrage
//=============================================================================
// Player-controlled Patriarch's minigun barrage attack
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerPatriarch_MinigunBarrage extends KFSM_Patriarch_MinigunBarrage;

var bool bAnimCanBeInterrupted;

/** Name of the aim offset profile to use with this special move */
var name AimOffsetProfileName;

function SpecialMoveStarted( bool bForced, name PrevMove )
{
	bAnimCanBeInterrupted = false;
	bPendingStopFire = false;

	// set aim offset nodes profile
	KFPOwner.SetAimOffsetNodesProfile( AimOffsetProfileName );
	KFPOwner.bEnableAimOffset = true;

	super.SpecialMoveStarted( bForced, PrevMove );
}

/** Plays our fire animation, starts weapon fire */
function PlayFireAnim()
{
	if( bInterrupted || bObstructed )
	{
		return;
	}

	super.PlayFireAnim();

	if( KFPOwner.IsLocallyControlled() )
	{
		KFPOwner.SetTimer( KFSkeletalMeshComponent(KFPOwner.Mesh).GetAnimInterruptTime(AnimName), false, nameOf(Timer_AnimInterrupt), self );
	}
}

/** Overridden to restore camera settings */
function PlayWindDownAnim()
{
	super.PlayWindDownAnim();

	RestoreCameraDefaults();
}

/** Called on animations that can be interrupted */
function Timer_AnimInterrupt()
{
	bAnimCanBeInterrupted = true;

	if( bPendingStopFire )
	{
		SpecialMoveButtonReleased();
	}
}

function SpecialMoveEnded( Name PrevMove, Name NextMove )
{
	// Reset special move flags
	if( KFPOwner != none )
	{
		KFPOwner.SpecialMoveFlags = 255;
		KFPOwner.bEnableAimOffset = false;
		KFPOwner.SetDefaultAimOffsetNodesProfile();
	}

	super.SpecialMoveEnded( PrevMove, NextMove );
}

/** When the grapple animation ends, continue it with a different grapple anim */
function SpecialMoveFlagsUpdated()
{
	if( KFPOwner.SpecialMoveFlags == FLAG_SpecialMoveButtonReleased )
	{
    	bInterrupted = true;
        if( !bIsFanFire )
        {
        	MyPatPawn.StopBodyAnim( EAS_UpperBody, 0.1f );
	    }
   		PlayWindDownAnim();
	}
	else
	{
		super.SpecialMoveFlagsUpdated();
	}
}

/* Called on some player-controlled moves when a firemode input has been pressed */
function SpecialMoveButtonRetriggered()
{
	bPendingStopFire = false;
}

/** Called on some player-controlled moves when a firemode input has been released */
function SpecialMoveButtonReleased()
{
	bPendingStopFire = true;

	if( !bAnimCanBeInterrupted )
	{
		return;
	}

	KFPOwner.DoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonReleased );
	if( KFPOwner.Role < ROLE_Authority && KFPOwner.IsLocallyControlled() )
	{
		KFPOwner.ServerDoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonReleased );
	}
}

defaultproperties
{
   AimOffsetProfileName="Minigun"
   bUseCustomThirdPersonViewOffset=True
   CustomThirdPersonViewOffset=(OffsetHigh=(X=-140.000000,Y=90.000000,Z=45.000000),OffsetMid=(X=-125.000000,Y=110.000000,Z=45.000000),OffsetLow=(X=-160.000000,Y=130.000000,Z=55.000000))
   ViewOffsetInterpTime=0.400000
   CustomCameraFOV=60.000000
   CameraFOVTransitionTime=0.500000
   Handle="KFSM_PlayerPatriarch_MinigunBarrage"
   Name="Default__KFSM_PlayerPatriarch_MinigunBarrage"
   ObjectArchetype=KFSM_Patriarch_MinigunBarrage'kfgamecontent.Default__KFSM_Patriarch_MinigunBarrage'
}
