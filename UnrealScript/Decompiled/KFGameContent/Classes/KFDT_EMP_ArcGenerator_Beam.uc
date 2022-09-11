/*******************************************************************************
 * KFDT_EMP_ArcGenerator_Beam generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_EMP_ArcGenerator_Beam extends KFDT_EMP
    abstract;

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_HRG_EMP_ArcGenerator'
    EffectGroup=EEffectDamageGroup.FXG_Electricity
    StumblePower=30
    GunHitPower=5
    EMPPower=8
    ModifierPerkList=/* Array type was not detected. */
    KDamageImpulse=2000
    KDeathVel=349
    KDeathUpKick=750
    RadialDamageImpulse=750
}