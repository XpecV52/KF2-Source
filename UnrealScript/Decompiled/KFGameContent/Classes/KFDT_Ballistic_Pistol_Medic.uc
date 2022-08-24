/*******************************************************************************
 * KFDT_Ballistic_Pistol_Medic generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_Pistol_Medic extends KFDT_Ballistic_Handgun
    abstract;

static function ApplySecondaryDamage(KFPawn Victim, int DamageTaken, optional Controller InstigatedBy)
{
    local class<KFDamageType> ToxicDT;

    ToxicDT = Class'KFDT_Ballistic_Assault_Medic'.static.GetMedicToxicDmgType(DamageTaken, InstigatedBy);
    if(ToxicDT != none)
    {
        Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, ToxicDT);
    }
}

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_MedicPistol'
    StumblePower=0
    GunHitPower=45
    ModifierPerkList=/* Array type was not detected. */
    KDamageImpulse=900
    KDeathVel=100
    KDeathUpKick=-300
}