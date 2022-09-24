/*******************************************************************************
 * KFDT_Ballistic_HRG_Dragonbreath generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_HRG_Dragonbreath extends KFDT_Ballistic_Shotgun
    abstract;

var class<KFDamageType> BurnDamageType;

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
        case 'chest':
        case 'heart':
            return true;
        default:
            return false;
            break;
    }
}

static function PlayImpactHitEffects(KFPawn P, Vector HitLocation, Vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator)
{
    if(P.bPlayedDeath && P.WorldInfo.TimeSeconds > P.TimeOfDeath)
    {
        default.BurnDamageType.static.PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
        return;
    }
    super(KFDamageType).PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
}

static function ApplySecondaryDamage(KFPawn Victim, int DamageTaken, optional Controller InstigatedBy)
{
    if(default.BurnDamageType.default.DoT_Type != 0)
    {
        Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, default.BurnDamageType);
    }
}

defaultproperties
{
    BurnDamageType=Class'KFDT_Fire_HRG_DragonsBreathDoT'
    WeaponDef=Class'KFGame.KFWeapDef_HRG_Dragonbreath'
    EffectGroup=EEffectDamageGroup.FXG_IncendiaryRound
    StumblePower=40
    GunHitPower=50
    BurnPower=40
    ModifierPerkList=/* Array type was not detected. */
    GibImpulseScale=1
    BloodSpread=0.4
    BloodScale=0.6
    KDamageImpulse=3500
    KDeathVel=650
    KDeathUpKick=800
}