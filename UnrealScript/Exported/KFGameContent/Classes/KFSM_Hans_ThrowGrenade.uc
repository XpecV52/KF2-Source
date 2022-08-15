//=============================================================================
// KFSM_Hans_ThrowGrenade
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFSM_Hans_ThrowGrenade extends KFSM_PlaySingleAnim;

function SpecialMoveStarted( bool bForced, name PrevMove )
{
	local KFPawn_ZedHansBase HansPawn;

	super.SpecialMoveStarted( bForced, PrevMove );
	KFPOwner.ZeroMovementVariables();

	if( AIOwner != none )
	{
		if( AIOwner!= None ) { AIOwner.AILog_Internal(self@"started for"@AIOwner,'Siren'); };
	}

	HansPawn = KFPawn_ZedHansBase(PawnOwner);
	if( HansPawn != none )
	{
		HansPawn.PlayGrenadeDialog( false );
	}
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	super.SpecialMoveEnded( PrevMove, NextMove );
	if( AIOwner != none )
	{
		if( AIOwner!= None ) { AIOwner.AILog_Internal(self@"ended for"@AIOwner,'Siren'); };
	}
}

protected function bool InternalCanDoSpecialMove()
{
//    local KFPawn_ZedHansBase HansPawn;

	// Need to remove enemy check if Hans ever needs to throw grenades at doors, etc.
	if( PawnOwner == none || PawnOwner.Health <= 0 || AIOwner == none || AIOwner.Enemy == none || AIOwner.Enemy.Health <= 0 )
	{
		return false;
	}

//    HansPawn = KFPawn_ZedHansBase(PawnOwner);

	// Make sure we can throw grenade in the current stance, etc. TODO: Commented out because it caused Hans to get stuck
//    if( HansPawn != none && !HansPawn.IsDoingSpecialMove(SM_ChangeStance)
//        && !HansPawn.bGunsEquipped )
//    {
        return true;
//    }
//    else
//    {
//        return false;
//    }
}

defaultproperties
{
   AnimName="Atk_Nade_V1"
   bDisablesWeaponFiring=True
   bDisableMovement=True
   bDisableSteering=False
   Handle="SM_Hans_ThrowGrenade"
   Name="Default__KFSM_Hans_ThrowGrenade"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
