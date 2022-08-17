/*******************************************************************************
 * KFDT_Ballistic_NailShotgun generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_NailShotgun extends KFDT_Ballistic_Shotgun
    abstract;

static simulated function class<KFProj_PinningBullet> GetPinProjectileClass()
{
    return Class'KFProj_Nail_Nailgun';
}

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_Nailgun'
    StunPower=42
    StumblePower=54
    LegStumblePower=54
    GunHitPower=118
    ModifierPerkList=/* Array type was not detected. */
    BloodSpread=0.4
    BloodScale=0.6
    KDamageImpulse=400
    KDeathVel=15
    KDeathUpKick=120
}