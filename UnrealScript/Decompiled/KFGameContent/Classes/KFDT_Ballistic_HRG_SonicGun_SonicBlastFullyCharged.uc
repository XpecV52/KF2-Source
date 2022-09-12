/*******************************************************************************
 * KFDT_Ballistic_HRG_SonicGun_SonicBlastFullyCharged generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_HRG_SonicGun_SonicBlastFullyCharged extends KFDT_Ballistic_Rifle
    abstract;

static function PlayImpactHitEffects(KFPawn P, Vector HitLocation, Vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator)
{
    if(P.bPlayedDeath && P.WorldInfo.TimeSeconds > P.TimeOfDeath)
    {
        return;
    }
    super(KFDamageType).PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
}

defaultproperties
{
    WeaponDef=Class'KFGame.KFWeapDef_HRG_SonicGun'
    bHasToSpawnMicrowaveFire=false
    EffectGroup=EEffectDamageGroup.FXG_MicrowaveBlast
    StumblePower=250
    GunHitPower=120
    ModifierPerkList=/* Array type was not detected. */
    OverrideImpactEffect=ParticleSystem'WEP_HRG_SonicGun_EMIT.FX_SonicGun_Impact_AltFire'
    OverrideImpactSound=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_Hit_Surface'
    bExtraMomentumZ=true
    KDamageImpulse=1750
    KDeathVel=325
    KDeathUpKick=400
    RadialDamageImpulse=5000
}