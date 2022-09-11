/*******************************************************************************
 * KFDT_Ballistic_HRG_Vampire_BloodBallImpact generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_HRG_Vampire_BloodBallImpact extends KFDT_Ballistic_Shell
    abstract;

static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
    return false;
}

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_HRG_Vampire'
    EffectGroup=EEffectDamageGroup.FXG_Toxic
    StumblePower=40
    GunHitPower=40
    PoisonPower=10
    ModifierPerkList=/* Array type was not detected. */
}