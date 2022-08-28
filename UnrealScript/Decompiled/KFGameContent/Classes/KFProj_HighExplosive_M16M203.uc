/*******************************************************************************
 * KFProj_HighExplosive_M16M203 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_HighExplosive_M16M203 extends KFProj_BallisticExplosive
    hidecategories(Navigation);

defaultproperties
{
    ArmDistSquared=150000
    ProjDudTemplate=ParticleSystem'Wep_M16_M203_EMIT.FX_M16_M203_40mm_Projectile_Dud'
    GrenadeBounceEffectInfo=KFImpactEffectInfo'FX_Impacts_ARCH.DefaultGrenadeImpacts'
    bWarnAIWhenFired=true
    TossZ=150
    GravityScale=0.5
    TerminalVelocity=4000
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'Wep_M16_M203_ARCH.M16_M203_Grenade_Explosion'
        Damage=230
        MyDamageType=Class'KFDT_Explosive_M16M203'
        KnockDownStrength=0
        ExplosionSound=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Explosion'
        ExploLight=PointLightComponent'Default__KFProj_HighExplosive_M16M203.ExplosionPointLight'
        ExploLightFadeOutTime=0.2
        CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
        CamShakeInnerRadius=0
        CamShakeOuterRadius=0
    object end
    // Reference: KFGameExplosion'Default__KFProj_HighExplosive_M16M203.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
    AltExploEffects=KFImpactEffectInfo'WEP_M79_ARCH.M79Grenade_Explosion_Concussive_Force'
    ProjFlightTemplate=ParticleSystem'Wep_M16_M203_EMIT.FX_M16_M203_40mm_Projectile'
    ProjFlightTemplateZedTime=ParticleSystem'Wep_M16_M203_EMIT.FX_M16_M203_40mm_Projectile_ZEDTIME'
    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Projectile_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_M79.Stop_WEP_SA_M79_Projectile_Loop'
    AmbientComponent=AkComponent'Default__KFProj_HighExplosive_M16M203.AmbientAkSoundComponent'
    MomentumTransfer=50000
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_HighExplosive_M16M203.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_HighExplosive_M16M203.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_HighExplosive_M16M203.AmbientAkSoundComponent'
    Physics=EPhysics.PHYS_Falling
    LifeSpan=1000
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_HighExplosive_M16M203.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}