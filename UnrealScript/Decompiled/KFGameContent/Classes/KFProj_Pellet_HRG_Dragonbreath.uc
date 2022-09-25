/*******************************************************************************
 * KFProj_Pellet_HRG_Dragonbreath generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Pellet_HRG_Dragonbreath extends KFProj_Bullet_Pellet
    hidecategories(Navigation);

var Vector LastHitNormal;
var float GroundFireChance;

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    LastHitNormal = HitNormal;
    super(KFProj_Bullet).ProcessTouch(Other, HitLocation, HitNormal);
}

simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
    LastHitNormal = HitNormal;
    super(KFProj_Bullet).TriggerExplosion(HitLocation, HitNormal, HitActor);
}

protected simulated function StopSimulating()
{
    local Vector FlameSpawnVel;

    if(((Role == ROLE_Authority) && Physics == 2) && FRand() < GroundFireChance)
    {
        FlameSpawnVel = 0.25 * (CalculateResidualFlameVelocity(LastHitNormal, Normal(Velocity), VSize(Velocity)));
        SpawnResidualFlame(Class'KFProj_HRG_DragonBreath_Splash', Location + (LastHitNormal * 10), FlameSpawnVel);
    }
    super(KFProjectile).StopSimulating();
}

defaultproperties
{
    GroundFireChance=1
    GravityScale=0.35
    TerminalVelocity=7000
    ProjFlightTemplate=ParticleSystem'WEP_DragonsBreath_EMIT.Tracer.FX_DragonsBreath_Tracer'
    begin object name=PointLight0 class=PointLightComponent
        Radius=500
        FalloffExponent=10
        Brightness=0.5
        LightColor=(B=171,G=218,R=252,A=255)
        CastShadows=false
        CastStaticShadows=false
        CastDynamicShadows=false
        bCastPerObjectShadows=false
        LightingChannels=(Outdoor=true)
    object end
    // Reference: PointLightComponent'Default__KFProj_Pellet_HRG_Dragonbreath.PointLight0'
    ProjFlightLight=PointLight0
    ProjFlightTemplateZedTime=ParticleSystem'WEP_DragonsBreath_EMIT.Tracer.FX_DragonsBreath_Tracer_ZEDTime'
    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_DragonsBreath.Play_SA_DragonsBreath_Projectile_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_DragonsBreath.Stop_SA_DragonsBreath_Projectile_Loop'
    AmbientComponent=AkComponent'Default__KFProj_Pellet_HRG_Dragonbreath.AmbientAkSoundComponent'
    ImpactEffects=KFImpactEffectInfo'WEP_DragonsBreath_ARCH.DragonsBreath_bullet_impact'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Pellet_HRG_Dragonbreath.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Pellet_HRG_Dragonbreath.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Pellet_HRG_Dragonbreath.AmbientAkSoundComponent'
    Physics=EPhysics.PHYS_Falling
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Pellet_HRG_Dragonbreath.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}