/*******************************************************************************
 * KFDT_Ballistic_MicrowaveRifle generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_MicrowaveRifle extends KFDT_Microwave
    abstract;

var class<KFDamageType> BurnDamageType;

static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
    if(super(KFDamageType).CanDismemberHitZone(InHitZoneName))
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
    BurnDamageType=Class'KFGame.KFDT_Fire_MicrowaveRifleDoT'
    WeaponDef=Class'KFGame.KFWeapDef_MicrowaveRifle'
    EffectGroup=EEffectDamageGroup.FXG_MicrowaveProj
    StumblePower=18
    BurnPower=10
    MicrowavePower=30
    ModifierPerkList=/* Array type was not detected. */
    GibImpulseScale=0.85
    KDamageImpulse=550
    KDeathVel=200
    KDeathUpKick=-200
}