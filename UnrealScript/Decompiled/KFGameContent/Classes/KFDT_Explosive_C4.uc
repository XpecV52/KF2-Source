/*******************************************************************************
 * KFDT_Explosive_C4 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Explosive_C4 extends KFDT_Explosive
    abstract;

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_C4'
    bShouldSpawnPersistentBlood=true
    DoT_Type=EDamageOverTimeGroup.DOT_Fire
    EffectGroup=EEffectDamageGroup.FXG_Fire
    DoT_Duration=3
    DoT_Interval=1
    KnockdownPower=150
    StumblePower=400
    BurnPower=2
    ModifierPerkList=/* Array type was not detected. */
    ObliterationHealthThreshold=-400
    ObliterationDamageThreshold=400
    GibImpulseScale=0.15
    KDeathVel=300
    KDeathUpKick=1000
    RadialDamageImpulse=2000
}