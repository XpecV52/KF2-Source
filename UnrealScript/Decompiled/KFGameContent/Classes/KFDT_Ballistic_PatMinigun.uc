/*******************************************************************************
 * KFDT_Ballistic_PatMinigun generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_PatMinigun extends KFDT_Ballistic_AssaultRifle
    abstract;

static function int GetKillerDialogID()
{
    return 39;
}

defaultproperties
{
    KDamageImpulse=500
    KDeathVel=75
    KDeathUpKick=50
}