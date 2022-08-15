/*******************************************************************************
 * KFDT_Fire_FlameThrower generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Fire_FlameThrower extends KFDT_Fire
    abstract;

static function int GetKillerDialogID()
{
    return 86;
}

static function int GetDamagerDialogID()
{
    return 102;
}

static function int GetDamageeDialogID()
{
    return 116;
}

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_FlameThrower'
    DoT_DamageScale=0.6
}