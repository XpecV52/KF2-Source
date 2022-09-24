/*******************************************************************************
 * KFDT_Fire_HRG_DragonsBreathDoT generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Fire_HRG_DragonsBreathDoT extends KFDT_Fire
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
    WeaponDef=Class'KFGame.KFWeapDef_HRG_Dragonbreath'
    DoT_Duration=2.7
    DoT_Interval=0.5
    DoT_DamageScale=0.7
    BurnPower=10
}