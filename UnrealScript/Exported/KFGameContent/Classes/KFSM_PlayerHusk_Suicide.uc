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

defaultproperties
{
   AnimName="Player_Explode"
   Handle="KFSM_PlayerHusk_Suicide"
   Name="Default__KFSM_PlayerHusk_Suicide"
   ObjectArchetype=KFSM_Husk_Suicide'kfgamecontent.Default__KFSM_Husk_Suicide'
}
