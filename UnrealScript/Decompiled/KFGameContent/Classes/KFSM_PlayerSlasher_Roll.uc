/*******************************************************************************
 * KFSM_PlayerSlasher_Roll generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_PlayerSlasher_Roll extends KFSM_Evade;

static function byte PackFlagsBase(KFPawn P)
{
    return Class'KFSM_PlayerMeleeBase'.static.GetFourWayMoveDirection(P);
}

defaultproperties
{
    EvadeAnims=/* Array type was not detected. */
}