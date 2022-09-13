/*******************************************************************************
 * KFProj_Bullet_HRG_Boomy generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Bullet_HRG_Boomy extends KFProj_BallisticExplosive
    hidecategories(Navigation);

protected simulated function PrepareExplosionTemplate()
{
    super.PrepareExplosionTemplate();
    ExplosionTemplate.bIgnoreInstigator = true;
}

defaultproperties
{
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_HRG_Boomy_ARCH.WEB_HRG_Boomy_Impacts'
        Damage=35
        DamageRadius=150
        MyDamageType=Class'KFDT_Explosive_HRG_Boomy'
        KnockDownStrength=150
        MomentumTransferScale=10000
        ExplosionSound=AkEvent'ww_wep_hrg_boomy.Play_WEP_HRG_Boomy_ProjExplosion'
        ExploLight=PointLightComponent'Default__KFProj_Bullet_HRG_Boomy.ExplosionPointLight'
        ExploLightFadeOutTime=0.3
        CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
        CamShakeInnerRadius=0
        CamShakeOuterRadius=300
        CamShakeFalloff=1.5
    object end
    // Reference: KFGameExplosion'Default__KFProj_Bullet_HRG_Boomy.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
    ProjFlightTemplateZedTime=ParticleSystem'WEP_HRG_Boomy_EMIT.FX_Boomy_Tracer_ZEDTime'
    AmbientComponent=AkComponent'Default__KFProj_Bullet_HRG_Boomy.AmbientAkSoundComponent'
    Speed=22500
    MaxSpeed=22500
    DamageRadius=0
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_HRG_Boomy.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_HRG_Boomy.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Bullet_HRG_Boomy.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_HRG_Boomy.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}