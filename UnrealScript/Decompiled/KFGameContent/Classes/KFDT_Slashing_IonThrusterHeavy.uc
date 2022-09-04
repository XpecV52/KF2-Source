/*******************************************************************************
 * KFDT_Slashing_IonThrusterHeavy generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Slashing_IonThrusterHeavy extends KFDT_Slashing_IonThruster
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
    StumblePower=125
    MeleeHitPower=150
    BurnPower=50
    KDamageImpulse=1600
    KDeathVel=500
}