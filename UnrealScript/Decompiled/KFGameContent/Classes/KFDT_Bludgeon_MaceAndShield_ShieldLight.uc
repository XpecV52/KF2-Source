/*******************************************************************************
 * KFDT_Bludgeon_MaceAndShield_ShieldLight generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Bludgeon_MaceAndShield_ShieldLight extends KFDT_Bludgeon_MaceAndShield
    abstract;

defaultproperties
{
    bCanGib=true
    bCanObliterate=true
    bUseHitLocationForGibImpulses=true
    EffectGroup=EEffectDamageGroup.FXG_ShieldBash
    GoreDamageGroup=EGoreDamageGroup.DGT_Explosive
    KnockdownPower=100
    StumblePower=400
    ObliterationHealthThreshold=-30
    ObliterationDamageThreshold=50
    MaxObliterationGibs=12
    KDamageImpulse=3500
    KDeathVel=375
    RadialDamageImpulse=6000
}