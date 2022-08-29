/*******************************************************************************
 * KFDT_Slashing_FireAxeHeavy generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Slashing_FireAxeHeavy extends KFDT_Slashing_FireAxe
    abstract;

static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
    if(super.CanDismemberHitZone(InHitZoneName))
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
    StunPower=75
    StumblePower=75
    MeleeHitPower=100
    KDamageImpulse=300
    KDeathUpKick=400
}