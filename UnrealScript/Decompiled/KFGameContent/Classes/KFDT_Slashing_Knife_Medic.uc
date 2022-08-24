/*******************************************************************************
 * KFDT_Slashing_Knife_Medic generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Slashing_Knife_Medic extends KFDT_Slashing_Knife
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
    GunHitPower=44
}