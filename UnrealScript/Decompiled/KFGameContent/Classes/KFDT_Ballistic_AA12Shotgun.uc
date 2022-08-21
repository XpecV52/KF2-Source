/*******************************************************************************
 * KFDT_Ballistic_AA12Shotgun generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_AA12Shotgun extends KFDT_Ballistic_Shotgun
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
        case 'chest':
        case 'heart':
            return true;
        default:
            return false;
            break;
    }
}

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_AA12'
    StumblePower=5
    BloodSpread=0.4
    BloodScale=0.6
    KDamageImpulse=350
    KDeathVel=10
    KDeathUpKick=120
}