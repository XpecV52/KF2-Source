/*******************************************************************************
 * KFDT_Ballistic_Assault_Medic generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_Assault_Medic extends KFDT_Ballistic_AssaultRifle
    abstract;

static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
    if(super(KFDT_Ballistic).CanDismemberHitZone(InHitZoneName))
    {
        return true;
    }
    switch(InHitZoneName)
    {
        case 'lupperarm':
        case 'rupperarm':
            return true;
        default:
            return false;
            break;
    }
}

static function bool CanApplyDamageOverTime(out int InDamage, out class<KFDamageType> KFDT, optional Controller InstigatedBy)
{
    return Class'KFDT_Ballistic_Assault_Medic'.static.CheckMedicBleed(InDamage, KFDT, InstigatedBy);
}

static function bool CheckMedicBleed(out int InDamage, out class<KFDamageType> KFDT, optional Controller InstigatedBy)
{
    local KFPerk InstigatorPerk;

    InstigatorPerk = KFPlayerController(InstigatedBy).GetPerk();
    if((InstigatorPerk == none) || !InstigatorPerk.IsBleedDmgActive())
    {
        return false;
    }
    InstigatorPerk.ModifyBleedDmg(InDamage);
    KFDT = InstigatorPerk.GetBleedDmgTypeClass();
    return true;
}

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_MedicRifle'
    StumblePower=20
    LegStumblePower=117
    GunHitPower=116
    ModifierPerkList=/* Array type was not detected. */
    KDamageImpulse=1000
    KDeathVel=135
    KDeathUpKick=-200
}