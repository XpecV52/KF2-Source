/*******************************************************************************
 * KFDT_Explosive_HRG_Locust generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Explosive_HRG_Locust extends KFDT_Explosive
    abstract;

var class<KFDamageType> DoTDamageType;

static function ApplySecondaryDamage(KFPawn Victim, int DamageTaken, optional Controller InstigatedBy)
{
    if(Victim.Controller == InstigatedBy)
    {
        return;
    }
    if(default.DoTDamageType.default.DoT_Type != 0)
    {
        Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, default.DoTDamageType);
    }
}

defaultproperties
{
    DoTDamageType=Class'KFGame.KFDT_Toxic_HRG_Locust'
    WeaponDef=Class'KFGame.KFWeapDef_HRG_Locust'
    bCanPlayDeadHitEffects=false
    ModifierPerkList=/* Array type was not detected. */
    bCausesFracture=false
}