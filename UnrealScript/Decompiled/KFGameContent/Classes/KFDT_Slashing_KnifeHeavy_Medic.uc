/*******************************************************************************
 * KFDT_Slashing_KnifeHeavy_Medic generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Slashing_KnifeHeavy_Medic extends KFDT_Slashing_KnifeHeavy
    abstract;

static function bool CanApplyDamageOverTime(out int InDamage, out class<KFDamageType> KFDT, optional Controller InstigatedBy)
{
    return Class'KFDT_Ballistic_Assault_Medic'.static.CheckMedicToxic(InDamage, KFDT, InstigatedBy);
}

defaultproperties
{
    MeleeHitPower=113
}