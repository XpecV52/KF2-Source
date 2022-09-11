/*******************************************************************************
 * KFProj_CrystalSpike_HRG_Vampire generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_CrystalSpike_HRG_Vampire extends KFProj_Bullet
    hidecategories(Navigation);

simulated function ProcessBulletTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    super(KFProjectile).ProcessBulletTouch(Other, HitLocation, HitNormal);
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(Other.IsA('Pawn') && Other.bCanBeDamaged)
        {
            WorldInfo.MyEmitterPool.SpawnEmitter(ImpactEffects.DefaultImpactEffect.ParticleTemplate, HitLocation, rotator(HitNormal), Other);
            PlaySoundBase(ImpactEffects.DefaultImpactEffect.Sound, true,,, HitLocation);
        }
    }
}

defaultproperties
{
    bNoReplicationToInstigator=false
    bWarnAIWhenFired=true
    TerminalVelocity=12000
    ProjFlightTemplate=ParticleSystem'WEP_HRG_Vampire_EMIT.FX_HRG_Vampire_Projectile_ALT'
    AmbientSoundPlayEvent=none
    AmbientSoundStopEvent=none
    AmbientComponent=AkComponent'Default__KFProj_CrystalSpike_HRG_Vampire.AmbientAkSoundComponent'
    ImpactEffects=KFImpactEffectInfo'WEP_HRG_Vampire_Arch.HRG_Vampire_SpikeFireImpacts'
    AssociatedPerkClass=Class'KFGame.KFPerk_FieldMedic'
    Speed=12000
    MaxSpeed=12000
    bBlockedByInstigator=false
    bRotationFollowsVelocity=false
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_CrystalSpike_HRG_Vampire.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_CrystalSpike_HRG_Vampire.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_CrystalSpike_HRG_Vampire.AmbientAkSoundComponent'
    bNetTemporary=false
    bNoEncroachCheck=true
    LifeSpan=10
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_CrystalSpike_HRG_Vampire.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}