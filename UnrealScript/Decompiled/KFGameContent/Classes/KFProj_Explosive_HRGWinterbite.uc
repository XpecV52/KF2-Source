/*******************************************************************************
 * KFProj_Explosive_HRGWinterbite generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Explosive_HRGWinterbite extends KFProj_BallisticExplosive
    hidecategories(Navigation);

simulated function AdjustCanDisintigrate();

protected simulated function PrepareExplosionTemplate()
{
    super(KFProjectile).PrepareExplosionTemplate();
}

protected simulated function SetExplosionActorClass()
{
    super(KFProjectile).SetExplosionActorClass();
}

defaultproperties
{
    ProjDudTemplate=ParticleSystem'WEP_HRG_Winterbite_EMIT.FX_WinterBite_Projectile_Dud'
    GrenadeBounceEffectInfo=KFImpactEffectInfo'WEP_HRG_Winterbite_ARCH.FX_WinterBite_Projectile_Impacts'
    TossZ=150
    GravityScale=0.15
    TerminalVelocity=9000
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_HRG_Winterbite_ARCH.FX_WinterBite_Projectile_Explosion'
        Damage=20
        DamageRadius=200
        DamageFalloffExponent=0
        MyDamageType=Class'KFDT_Explosive_HRGWinterbite'
        KnockDownStrength=0
        MomentumTransferScale=1
        ExplosionSound=AkEvent'WW_WEP_Flare_Gun.Play_WEP_Flare_Gun_Explode_Ice'
        ExploLight=PointLightComponent'Default__KFProj_Explosive_HRGWinterbite.ExplosionPointLight'
        ExploLightFadeOutTime=0.3
        CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
        CamShakeInnerRadius=0
        CamShakeOuterRadius=300
        CamShakeFalloff=1.5
    object end
    // Reference: KFGameExplosion'Default__KFProj_Explosive_HRGWinterbite.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
    AltExploEffects=KFImpactEffectInfo'WEP_HRG_Winterbite_ARCH.FX_WinterBite_Projectile_Explosion_Concussive_Force'
    ProjFlightTemplate=ParticleSystem'WEP_HRG_Winterbite_EMIT.FX_WinterBite_Projectile'
    ProjFlightTemplateZedTime=ParticleSystem'WEP_HRG_Winterbite_EMIT.FX_WinterBite_Projectile_ZEDTIME'
    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Projectile_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_M79.Stop_WEP_SA_M79_Projectile_Loop'
    AmbientComponent=AkComponent'Default__KFProj_Explosive_HRGWinterbite.AmbientAkSoundComponent'
    Speed=9000
    MaxSpeed=9000
    MomentumTransfer=50000
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=0
        CollisionRadius=0
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Explosive_HRGWinterbite.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=0
        CollisionRadius=0
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Explosive_HRGWinterbite.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Explosive_HRGWinterbite.AmbientAkSoundComponent'
    Physics=EPhysics.PHYS_Falling
    LifeSpan=10
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=0
        CollisionRadius=0
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Explosive_HRGWinterbite.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}