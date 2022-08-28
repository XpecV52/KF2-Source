/*******************************************************************************
 * KFDT_Ballistic_FNFal generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_FNFal extends KFDT_Ballistic_Rifle
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
    WeaponDef=Class'KFGame.KFWeapDef_FNFal'
    StunPower=10
    KnockdownPower=20
    StumblePower=18
    GunHitPower=50
    ModifierPerkList=/* Array type was not detected. */
    KDamageImpulse=2250
    KDeathVel=250
    KDeathUpKick=-400
}