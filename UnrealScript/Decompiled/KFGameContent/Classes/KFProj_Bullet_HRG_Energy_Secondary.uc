/*******************************************************************************
 * KFProj_Bullet_HRG_Energy_Secondary generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Bullet_HRG_Energy_Secondary extends KFProj_Bullet
    hidecategories(Navigation);

defaultproperties
{
    ProjFlightTemplateZedTime=ParticleSystem'WEP_HRG_Energy_EMIT.FX_Energy_Alt_Tracer_Instant'
    AmbientComponent=AkComponent'Default__KFProj_Bullet_HRG_Energy_Secondary.AmbientAkSoundComponent'
    ImpactEffects=KFImpactEffectInfo'WEP_HRG_Energy_ARCH.Wep_HRG_Energy_Impact_Alt'
    Speed=7500
    MaxSpeed=7500
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_HRG_Energy_Secondary.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_HRG_Energy_Secondary.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Bullet_HRG_Energy_Secondary.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_HRG_Energy_Secondary.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}