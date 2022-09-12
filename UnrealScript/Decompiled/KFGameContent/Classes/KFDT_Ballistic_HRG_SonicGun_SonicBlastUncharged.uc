/*******************************************************************************
 * KFDT_Ballistic_HRG_SonicGun_SonicBlastUncharged generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDT_Ballistic_HRG_SonicGun_SonicBlastUncharged extends KFDT_Ballistic_Rifle
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
    bCanGib=true
    bCanObliterate=true
    EffectGroup=EEffectDamageGroup.FXG_MicrowaveBlast
    StumblePower=0
    GunHitPower=30
    MicrowavePower=50
    ModifierPerkList=/* Array type was not detected. */
    OverrideImpactEffect=ParticleSystem'WEP_HRG_SonicGun_EMIT.FX_SonicGun_Impact'
    OverrideImpactSound=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_Hit_Surface'
    bExtraMomentumZ=true
    ArmorDamageModifier=1.5
    KDamageImpulse=0
    RadialDamageImpulse=5000
}