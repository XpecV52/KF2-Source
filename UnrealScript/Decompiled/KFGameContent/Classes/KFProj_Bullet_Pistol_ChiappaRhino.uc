/*******************************************************************************
 * KFProj_Bullet_Pistol_ChiappaRhino generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Bullet_Pistol_ChiappaRhino extends KFProj_Bullet
    hidecategories(Navigation);

defaultproperties
{
    bSpawnShrapnel=true
    ProjFlightTemplate=ParticleSystem'FX_Projectile_EMIT.FX_Tracer_9MM_ZEDTime'
    AmbientComponent=AkComponent'Default__KFProj_Bullet_Pistol_ChiappaRhino.AmbientAkSoundComponent'
    NumSpawnedShrapnel=3
    ShrapnelClass=Class'KFProj_Bullet_Pistol_ChiappaRhinoShrapnel'
    ShrapnelSpreadWidthEnvironment=0.25
    ShrapnelSpreadHeightEnvironment=0.25
    ShrapnelSpreadWidthZed=0.75
    ShrapnelSpreadHeightZed=0.75
    ShrapnelSpawnSoundEvent=AkEvent'WW_WEP_ChiappaRhinos.Play_WEP_ChiappaRhinos_Bullet_Fragmentation'
    ShrapnelSpawnVFX=ParticleSystem'WEP_ChiappaRhino_EMIT.FX_ChiappaRhino_Shrapnel_Hit'
    Speed=18000
    MaxSpeed=18000
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_Pistol_ChiappaRhino.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_Pistol_ChiappaRhino.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Bullet_Pistol_ChiappaRhino.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet_Pistol_ChiappaRhino.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}