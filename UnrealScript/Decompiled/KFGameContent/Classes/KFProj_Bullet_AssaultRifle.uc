/*******************************************************************************
 * KFProj_Bullet_AssaultRifle generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Bullet_AssaultRifle extends KFProj_Bullet
    hidecategories(Navigation);

defaultproperties
{
    ProjFlightTemplate=ParticleSystem'WEP_1P_L85A2_EMIT.FX_L85A2_Tracer_ZEDTime'
    AmbientComponent=AkComponent'Default__KFProj_Bullet_AssaultRifle.AmbientAkSoundComponent'
    ImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Heavy_bullet_impact'
    Speed=22500
    MaxSpeed=22500
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_AssaultRifle.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_AssaultRifle.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Bullet_AssaultRifle.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_AssaultRifle.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}