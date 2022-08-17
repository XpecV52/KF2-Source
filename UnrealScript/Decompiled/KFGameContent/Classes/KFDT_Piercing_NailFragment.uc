/*******************************************************************************
 * KFDT_Piercing_NailFragment generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Piercing_NailFragment extends KFDT_Piercing
    abstract;

static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
    switch(InHitZoneName)
    {
        case 'lhand':
        case 'rhand':
        case 'lfoot':
        case 'rfoot':
        case 'lforearm':
        case 'rforearm':
        case 'lcalf':
        case 'rcalf':
        case 'lthigh':
        case 'rthigh':
            return true;
        default:
            return false;
            break;
    }
}

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_Grenade_Gunslinger'
    bShouldSpawnBloodSplat=true
    bShouldSpawnPersistentBlood=true
    GunHitPower=25
    MeleeHitPower=20
    EffectGroup=EEffectDamageGroup.FXG_Ballistic
    GoreDamageGroup=EGoreDamageGroup.DGT_Handgun
    ModifierPerkList=/* Array type was not detected. */
    BodyWoundDecalMaterials=/* Array type was not detected. */
    BloodSpread=0.4
    BloodScale=0.6
    KDamageImpulse=400
    KDeathUpKick=250
}