/*******************************************************************************
 * KFProj_Mortar_Patriarch generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Mortar_Patriarch extends KFProj_Missile_Patriarch
    hidecategories(Navigation);

function InitEx(Vector AimDir, float CurlForceMultiplier, Vector TargetLoc, float InitialMissileSpeed, float NewSeekDelay, float NewSeekForce, float NewGravForce, float NewDistToApplyGravitySQ)
{
    super.InitEx(AimDir, CurlForceMultiplier, TargetLoc, InitialMissileSpeed, NewSeekDelay, NewSeekForce, NewGravForce, NewDistToApplyGravitySQ);
    Velocity.X *= 0.2;
    Velocity.Y *= 0.2;
    Velocity.Z *= 1.25;
}

defaultproperties
{
    FlightLight=PointLightComponent'Default__KFProj_Mortar_Patriarch.FlightPointLight'
    begin object name=ExploTemplate0 class=KFGameExplosion
        DamageRadius=620
        MyDamageType=Class'KFDT_Explosive_PatMortar'
        ExploLight=PointLightComponent'Default__KFProj_Mortar_Patriarch.ExplosionPointLight'
    object end
    // Reference: KFGameExplosion'Default__KFProj_Mortar_Patriarch.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    AmbientSoundPlayEvent=AkEvent'WW_ZED_Patriarch.Play_Mini_Rocket_LP_Beep'
    AmbientSoundStopEvent=AkEvent'WW_ZED_Patriarch.Stop_Mini_Rocket_LP_Beep'
    AmbientComponent=AkComponent'Default__KFProj_Mortar_Patriarch.AmbientAkSoundComponent'
    MyDamageType=Class'KFDT_Explosive_PatMortar'
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=0
        CollisionRadius=0
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Mortar_Patriarch.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=0
        CollisionRadius=0
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Mortar_Patriarch.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=PointLightComponent'Default__KFProj_Mortar_Patriarch.FlightPointLight'
    Components(2)=AkComponent'Default__KFProj_Mortar_Patriarch.AmbientAkSoundComponent'
    Physics=EPhysics.PHYS_Falling
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=0
        CollisionRadius=0
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Mortar_Patriarch.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}