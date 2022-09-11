/*******************************************************************************
 * KFDT_Ballistic_Frost_Shotgun_Axe generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_Frost_Shotgun_Axe extends KFDT_Ballistic_Shotgun
    abstract;

static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
    if(super(KFDT_Ballistic).CanDismemberHitZone(InHitZoneName))
    {
        return true;
    }
    switch(InHitZoneName)
    {
        case 'lupperarm':
        case 'rupperarm':
            return true;
        default:
            return false;
            break;
    }
}

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_Rifle_FrostShotgunAxe'
    EffectGroup=EEffectDamageGroup.FXG_Freeze
    StumblePower=40
    GunHitPower=20
    FreezePower=17
    ModifierPerkList=/* Array type was not detected. */
    KDamageImpulse=2500
    KDeathVel=650
    KDeathUpKick=800
}