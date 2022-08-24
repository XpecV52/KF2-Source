/*******************************************************************************
 * KFDT_Ballistic_SMG_Medic generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_SMG_Medic extends KFDT_Ballistic_Submachinegun
    abstract;

static function bool CanApplyDamageOverTime(out int InDamage, out class<KFDamageType> KFDT, optional Controller InstigatedBy)
{
    return Class'KFDT_Ballistic_Assault_Medic'.static.CheckMedicToxic(InDamage, KFDT, InstigatedBy);
}

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_MedicSMG'
    GunHitPower=45
    ModifierPerkList=/* Array type was not detected. */
    KDamageImpulse=900
    KDeathVel=100
    KDeathUpKick=-300
}