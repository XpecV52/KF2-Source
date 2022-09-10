/*******************************************************************************
 * KFProj_Bullet_HRGTeslauncher generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Bullet_HRGTeslauncher extends KFProj_Bullet_AssaultRifle
    hidecategories(Navigation);

defaultproperties
{
    ProjFlightTemplate=ParticleSystem'WEP_Microwave_Assault_EMIT.FX_Microwave_Rifle_Projectile'
    AmbientComponent=AkComponent'Default__KFProj_Bullet_HRGTeslauncher.AmbientAkSoundComponent'
    ImpactEffects=KFImpactEffectInfo'WEP_Microwave_Assault_ARCH.Microwave_Assault_bullet_impact'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_HRGTeslauncher.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_HRGTeslauncher.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Bullet_HRGTeslauncher.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_HRGTeslauncher.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}