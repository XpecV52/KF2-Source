/*******************************************************************************
 * KFProj_NailBombGrenade generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_NailBombGrenade extends KFProj_Grenade
    hidecategories(Navigation);

defaultproperties
{
    GrenadeBounceEffectInfo=KFImpactEffectInfo'wep_Nailbomb_arch.Nail_Bomb_Grenade_Impacts'
    DampenFactor=0.4
    DampenFactorParallel=0.6
    ExplosionActorClass=Class'KFGame.KFExplosionActor'
    begin object name=ExploTemplate0 class=KFGameExplosion
        ShardClass=Class'KFProj_NailShard'
        NumShards=10
        ExplosionEffects=KFImpactEffectInfo'wep_Nailbomb_arch.Nailbomb_Explosion'
        Damage=300
        DamageRadius=600
        MyDamageType=Class'KFDT_Explosive_NailBombGrenade'
        KnockDownStrength=0
        ExplosionSound=AkEvent'WW_EXP_Nail_Bomb.Play_Nail_Bomb_Explode'
        ExploLight=PointLightComponent'Default__KFProj_NailBombGrenade.ExplosionPointLight'
        ExploLightFadeOutTime=0.2
        CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
    object end
    // Reference: KFGameExplosion'Default__KFProj_NailBombGrenade.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
    ProjFlightTemplate=ParticleSystem'WEP_Nailbomb_EMIT.FX_Nailbomb_Mesh'
    AssociatedPerkClass=Class'KFGame.KFPerk_Gunslinger'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_NailBombGrenade.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_NailBombGrenade.CollisionCylinder'
    Components(0)=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_NailBombGrenade.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}