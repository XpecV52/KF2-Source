/*******************************************************************************
 * KFDT_Slashing_ZweihanderHeavy generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Slashing_ZweihanderHeavy extends KFDT_Slashing_Katana
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
    AARWeaponID=50
    StunPower=42
    KnockdownPower=40
    StumblePower=63
    LegStumblePower=63
    MeleeHitPower=50
    ModifierPerkList=/* Array type was not detected. */
    KDamageImpulse=1600
    KDeathVel=500
    KDeathUpKick=200
}