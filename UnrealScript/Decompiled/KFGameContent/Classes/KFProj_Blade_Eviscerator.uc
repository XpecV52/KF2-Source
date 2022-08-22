/*******************************************************************************
 * KFProj_Blade_Eviscerator generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Blade_Eviscerator extends KFProj_RicochetStickBullet
    hidecategories(Navigation);

simulated event PostBeginPlay()
{
    super(KFProjectile).PostBeginPlay();
    LastLocation = Location;
}

defaultproperties
{
    PickupRadius=250
    WeaponClass=Class'KFWeap_Eviscerator'
    AmmoPickupSound=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Projectile_Pickup'
    ProjPickupTemplate=ParticleSystem'WEP_SawBlade_EMIT.FX_Sawblade_pickup_01'
    LifeSpanAfterStick=180
    BouncesLeft=5
    DampingFactor=0.95
    RicochetEffects=KFImpactEffectInfo'WEP_Sawblade_ARCH.SawbladeImpacts'
    bNoReplicationToInstigator=false
    bAmbientSoundZedTimeOnly=false
    bWarnAIWhenFired=true
    GravityScale=0.75
    ExtraLineCollisionOffsets=/* Array type was not detected. */
    ProjFlightTemplate=ParticleSystem'WEP_SawBlade_EMIT.FX_Sawblade_projectile_01'
    ProjFlightTemplateZedTime=ParticleSystem'WEP_SawBlade_EMIT.FX_Sawblade_projectile_01'
    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Projectile_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_SawBlade.Stop_WEP_SA_Sawblade_Projectile_Loop'
    AmbientComponent=AkComponent'Default__KFProj_Blade_Eviscerator.AmbientAkSoundComponent'
    ImpactEffects=KFImpactEffectInfo'WEP_Sawblade_ARCH.SawbladeEmbedFX'
    Speed=2500
    MaxSpeed=2500
    bRotationFollowsVelocity=false
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=2
        CollisionRadius=6
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Blade_Eviscerator.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=2
        CollisionRadius=6
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Blade_Eviscerator.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Blade_Eviscerator.AmbientAkSoundComponent'
    bNetTemporary=false
    bUpdateSimulatedPosition=true
    LifeSpan=8
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=2
        CollisionRadius=6
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Blade_Eviscerator.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}