/*******************************************************************************
 * KFProj_HRG_DragonBreath_Splash generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_HRG_DragonBreath_Splash extends KFProj_FlareGunSplash
    hidecategories(Navigation);

defaultproperties
{
    ExplosionActorClass=Class'KFExplosion_HRG_Dragonbreath_GroundFire'
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Impacts'
        Damage=8
        MyDamageType=Class'KFDT_Fire_Ground_HRG_DragonBreath'
        ExploLight=PointLightComponent'Default__KFProj_HRG_DragonBreath_Splash.FlamePointLight'
    object end
    // Reference: KFGameExplosion'Default__KFProj_HRG_DragonBreath_Splash.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    PostExplosionLifetime=2.5
    AmbientComponent=AkComponent'Default__KFProj_HRG_DragonBreath_Splash.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_HRG_DragonBreath_Splash.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_HRG_DragonBreath_Splash.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_HRG_DragonBreath_Splash.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_HRG_DragonBreath_Splash.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}