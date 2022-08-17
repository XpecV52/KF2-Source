//=============================================================================
// KFSM_PlayerHusk_Suicide
//=============================================================================
// Play a suicide attack animation sequence
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerHusk_Suicide extends KFSM_Husk_Suicide;

protected function bool InternalCanDoSpecialMove()
{
    if( KFPOwner.WorldInfo.GRI.bMatchIsOver )
    {
        return false;
    }

    return super.InternalCanDoSpecialMove();
}

DefaultProperties
{
	// ---------------------------------------------
	// SpecialMove
	Handle=KFSM_PlayerHusk_Suicide
	bPawnRotationLocked=true

	// ---------------------------------------------
	// Animations
	AnimName=Player_Explode
	AnimStance=EAS_FullBody
	bUseRootMotion=true
}
