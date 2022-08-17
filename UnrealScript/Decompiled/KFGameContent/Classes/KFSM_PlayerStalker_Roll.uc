/*******************************************************************************
 * KFSM_PlayerStalker_Roll generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_PlayerStalker_Roll extends KFSM_Evade;

static function byte PackFlagsBase(KFPawn P)
{
    return Class'KFSM_PlayerMeleeBase'.static.GetFourWayMoveDirection(P);
}

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    super(KFSM_PlaySingleAnim).SpecialMoveStarted(bForced, PrevMove);
    if((KFPOwner != none) && KFPawn_Monster(KFPOwner).bIsCloaking)
    {
        KFPawn_Monster(KFPOwner).SetCloaked(false);
    }
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    if(KFPOwner != none)
    {
        KFPawn_Monster(KFPOwner).SetCloaked(true);
    }
    super(KFSM_PlaySingleAnim).SpecialMoveEnded(PrevMove, NextMove);
}

defaultproperties
{
    EvadeAnims=/* Array type was not detected. */
}