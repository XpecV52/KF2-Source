/*******************************************************************************
 * KFSM_PlayerSiren_NormalScream generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_PlayerSiren_NormalScream extends KFSM_Siren_Scream;

protected function bool InternalCanDoSpecialMove()
{
    if(KFPOwner.bIsSprinting)
    {
        KFPOwner.SetSprinting(false);
    }
    return super(KFSpecialMove).InternalCanDoSpecialMove();
}

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    super.SpecialMoveStarted(bForced, PrevMove);
    if((KFPOwner != none) && KFPOwner.bIsSprinting)
    {
        KFPOwner.SetSprinting(false);
    }
}

defaultproperties
{
    ExplosionTemplate=KFGameExplosion'Default__KFSM_PlayerSiren_NormalScream.ExploTemplate0'
}