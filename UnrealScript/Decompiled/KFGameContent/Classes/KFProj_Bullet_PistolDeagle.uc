/*******************************************************************************
 * KFProj_Bullet_PistolDeagle generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Bullet_PistolDeagle extends KFProj_Bullet_RackEmUp
    hidecategories(Navigation);

defaultproperties
{
    ProjFlightTemplate=ParticleSystem'FX_Projectile_EMIT.FX_Tracer_9MM_ZEDTime'
    AmbientComponent=AkComponent'Default__KFProj_Bullet_PistolDeagle.AmbientAkSoundComponent'
    Speed=5000
    MaxSpeed=5000
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_PistolDeagle.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_PistolDeagle.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Bullet_PistolDeagle.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_PistolDeagle.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}