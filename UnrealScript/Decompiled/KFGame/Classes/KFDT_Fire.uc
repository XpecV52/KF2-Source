/*******************************************************************************
 * KFDT_Fire generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Fire extends KFDamageType
    abstract;

static function int GetKillerDialogID()
{
    return 86;
}

static function int GetDamagerDialogID()
{
    return 102;
}

static function int GetDamageeDialogID()
{
    return 116;
}

defaultproperties
{
    DoT_Type=EDamageOverTimeGroup.DOT_Fire
    EffectGroup=EEffectDamageGroup.FXG_Fire
    GoreDamageGroup=EGoreDamageGroup.DGT_Fire
    bIgnoreSelfInflictedScale=true
    DoT_Duration=5
    DoT_Interval=1
    DoT_DamageScale=1.5
    BurnPower=0.25
    ModifierPerkList(0)=class'KFPerk_Firebug'
    CameraLensEffectTemplate=Class'KFCameraLensEmit_Fire'
    KDamageImpulse=0
}