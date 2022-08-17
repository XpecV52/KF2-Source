/*******************************************************************************
 * KFDT_Ballistic_Winchester generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_Winchester extends KFDT_Ballistic_Rifle
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
    StunPower=65
    GunHitPower=30
    MeleeHitPower=25
    ModifierPerkList=/* Array type was not detected. */
    KDamageImpulse=2000
    KDeathVel=250
    KDeathUpKick=400
}