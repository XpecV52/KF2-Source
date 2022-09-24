/*******************************************************************************
 * KFDT_Slashing_ScytheShortAlt generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Slashing_ScytheShortAlt extends KFDT_Slashing_ZweihanderHeavy
    abstract;

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_Scythe'
    bCanGib=true
    bCanObliterate=true
    bUseHitLocationForGibImpulses=true
    bPointImpulseTowardsOrigin=true
    GoreDamageGroup=EGoreDamageGroup.DGT_Explosive
    StumblePower=150
    ObliterationDamageThreshold=100
    MaxObliterationGibs=12
    ImpulseOriginScale=100
    ImpulseOriginLift=150
    KDamageImpulse=3600
    KDeathVel=750
    KDeathUpKick=400
    RadialDamageImpulse=8000
}