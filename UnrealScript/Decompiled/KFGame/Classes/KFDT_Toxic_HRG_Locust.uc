/*******************************************************************************
 * KFDT_Toxic_HRG_Locust generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Toxic_HRG_Locust extends KFDT_Bleeding
    abstract;

var int SpreadOnTouchDamage;

static function int GetSpreadOnTouchDamage()
{
    return default.SpreadOnTouchDamage;
}

defaultproperties
{
    SpreadOnTouchDamage=30
    WeaponDef=Class'KFWeapDef_HRG_Locust'
    DoT_Duration=3
    DoT_Interval=0.5
    PoisonPower=25
    BleedPower=20
    ModifierPerkList(0)=class'KFPerk_Survivalist'
}