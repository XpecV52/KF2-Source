/*******************************************************************************
 * KFDT_Toxic_EnvironmentGas generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Toxic_EnvironmentGas extends KFDT_Toxic
    abstract;

defaultproperties
{
    bNoInstigatorDamage=true
    bConsideredIndirectOrAoE=true
    DoT_Type=EDamageOverTimeGroup.DOT_None
    PoisonPower=1
    CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Puke_Light'
}