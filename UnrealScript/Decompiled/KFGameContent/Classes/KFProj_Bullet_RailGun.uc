/*******************************************************************************
 * KFProj_Bullet_RailGun generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Bullet_RailGun extends KFProj_Bullet
    hidecategories(Navigation);

defaultproperties
{
    ProjFlightTemplate=ParticleSystem'wep_railgun_emit.FX_Railgun_Projectile_01'
    AmbientComponent=AkComponent'Default__KFProj_Bullet_RailGun.AmbientAkSoundComponent'
    Speed=30000
    MaxSpeed=30000
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_RailGun.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_RailGun.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Bullet_RailGun.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_RailGun.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}