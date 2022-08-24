/*******************************************************************************
 * KFDT_Fire_FlareGun generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Fire_FlareGun extends KFDT_Ballistic_Handgun
    abstract;

var class<KFDamageType> BurnDamageType;

static function ApplySecondaryDamage(KFPawn Victim, int DamageTaken, optional Controller InstigatedBy)
{
    if(default.BurnDamageType.default.DoT_Type != 0)
    {
        Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, default.BurnDamageType);
    }
}

defaultproperties
{
    BurnDamageType=Class'KFDT_Fire_FlareGunDoT'
    WeaponDef=Class'KFGame.KFWeapDef_FlareGun'
    EffectGroup=EEffectDamageGroup.FXG_Flare
    KnockdownPower=15
    StumblePower=100
    GunHitPower=150
    BurnPower=15.5
    ModifierPerkList=/* Array type was not detected. */
    CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Fire'
    KDamageImpulse=1000
    KDeathVel=10
    KDeathUpKick=120
}