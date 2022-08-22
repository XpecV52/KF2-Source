/*******************************************************************************
 * KFProj_CaulkNBurn_GroundFire generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_CaulkNBurn_GroundFire extends KFProj_GroundFire
    hidecategories(Navigation);

defaultproperties
{
    bWarnAIWhenFired=true
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Impacts'
        bAllowPerMaterialFX=true
        Damage=10
        DamageRadius=100
        MyDamageType=Class'KFDT_Fire_Ground_CaulkNBurn'
        KnockDownStrength=0
        MomentumTransferScale=1
        ExploLight=PointLightComponent'Default__KFProj_CaulkNBurn_GroundFire.FlamePointLight'
        ExploLightFadeOutTime=0.5
        ExploLightStartFadeOutTime=1.5
        ExploLightFlickerIntensity=5
        ExploLightFlickerInterpSpeed=15
        FractureMeshRadius=0
        FracturePartVel=0
        CamShake=none
    object end
    // Reference: KFGameExplosion'Default__KFProj_CaulkNBurn_GroundFire.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    AmbientComponent=AkComponent'Default__KFProj_CaulkNBurn_GroundFire.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_CaulkNBurn_GroundFire.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_CaulkNBurn_GroundFire.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_CaulkNBurn_GroundFire.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_CaulkNBurn_GroundFire.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}