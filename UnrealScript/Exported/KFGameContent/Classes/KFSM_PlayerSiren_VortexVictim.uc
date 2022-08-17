//=============================================================================
// KFSM_PlayerSiren_VortexVictim
//=============================================================================
// Victim special move when caught in siren vortex
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerSiren_VortexVictim extends KFSM_GrappleVictim;

/** Animation to play */
var() name	AnimName;

/** Warning message to display to team numbers of the person being grabbed */
var localized string VortexGrabTeamWarningMsg;

/** Start grabbed anim */
function SpecialMoveStarted( bool bForced, Name PrevMove )
{
	local KFPlayerController KFPC;

	Super.SpecialMoveStarted( bForced, PrevMove );

	// if this fails (e.g. missing anim) it's okay to continue unlike with PlaySpecialMoveAnim
	KFPOwner.PlayBodyAnim( AnimName, EAS_FullBody, 1.f, 0.33f, 0.33f, true );

	// Show a non-critical message to the rest of the players
	if( KFPOwner.WorldInfo.NetMode != NM_DedicatedServer /*&& !KFPOwner.IsLocallyControlled()*/ )
	{
		KFPC = KFPlayerController( KFPOwner.WorldInfo.GetALocalPlayerController() );

		if( KFPC != none /*&& KFPC.GetTeamNum() == KFPOwner.GetTeamNum()*/ && KFPC.Pawn != none && KFPC.Pawn.IsAliveAndWell() )
		{
			KFPC.MyGFxHUD.ShowNonCriticalMessage( Repl(VortexGrabTeamWarningMsg, "%x%", KFPOwner.PlayerReplicationInfo.PlayerName) );
		}
	}
}

/** Stop grabbed anim */
function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	Super.SpecialMoveEnded( PrevMove, NextMove );

	KFPOwner.StopBodyAnim( EAS_FullBody, 0.33f );

	// Let other zeds attack you again
	KFPOwner.ExclusiveTargetingController = none;
}

function SetGrabEffect( KFPlayerController KFPC, bool bValue )
{
	KFPC.SetGrabEffect( bValue, true, true );
}

defaultproperties
{
   AnimName="Grabbed_LifeDrain_V1"
   VortexGrabTeamWarningMsg="%x% is trapped by a Siren!"
   bAllowThirdPersonWeaponAnims=False
   bLockPawnRotation=True
   bDisableLook=True
   bDisableWeaponInteraction=True
   Handle="KFSM_PlayerSiren_VortexVictim"
   Name="Default__KFSM_PlayerSiren_VortexVictim"
   ObjectArchetype=KFSM_GrappleVictim'KFGame.Default__KFSM_GrappleVictim'
}
