//=============================================================================
// KFSM_PlayerHusk_Suicide
//=============================================================================
// Play a suicide attack animation sequence
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerHusk_Suicide extends KFSM_Husk_Suicide;

protected function bool InternalCanDoSpecialMove()
{
    if( KFPOwner.WorldInfo.GRI.bMatchIsOver || KFGameReplicationInfoVersus(KFPOwner.WorldInfo.GRI).bRoundIsOver )
    {
        return false;
    }

    return super.InternalCanDoSpecialMove();
}

/** Interrupts the special move if the player has released the button */
function SpecialMoveFlagsUpdated()
{
	if( KFPOwner.SpecialMoveFlags == FLAG_SpecialMoveButtonReleased )
	{
		bPendingStopFire = true;
		bCanBeInterrupted = true;

		// End the special move on the server
		if( KFPOwner.Role == ROLE_Authority )
		{
			// Wait 2 frames for the pending stopfire flag to propagate
			KFPOwner.SetTimer( KFPOwner.WorldInfo.DeltaSeconds*2.f, false, nameOf(KFPOwner.EndSpecialMove) );
		}
	}
	else
	{
		super.SpecialMoveFlagsUpdated();
	}
}

/** Interrupt the move if the button was released */
function SpecialMoveButtonReleased()
{
    bPendingStopFire = true;
	KFPOwner.DoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonReleased );
	if( KFPOwner.Role < ROLE_Authority && KFPOwner.IsLocallyControlled() )
	{
		KFPOwner.ServerDoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonReleased );
	}
}

defaultproperties
{
   AnimName="Player_Explode"
   Handle="KFSM_PlayerHusk_Suicide"
   Name="Default__KFSM_PlayerHusk_Suicide"
   ObjectArchetype=KFSM_Husk_Suicide'kfgamecontent.Default__KFSM_Husk_Suicide'
}
