/*******************************************************************************
 * KFProj_ExplosiveSubmunition_HX25 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_ExplosiveSubmunition_HX25 extends KFProj_BallisticExplosive
    hidecategories(Navigation);

var protected KFWeapon OwnerWeapon;

function Init(Vector Direction)
{
    super(KFProjectile).Init(Direction);
    OwnerWeapon = KFWeapon(Owner);
    if(OwnerWeapon != none)
    {
        OwnerWeapon.LastPelletFireTime = WorldInfo.TimeSeconds;
    }
}

function bool ShouldWarnAIWhenFired()
{
    return (super(KFProjectile).ShouldWarnAIWhenFired() && OwnerWeapon != none) && OwnerWeapon.LastPelletFireTime < WorldInfo.TimeSeconds;
}

protected simulated function PrepareExplosionTemplate()
{
    local KFPawn KFP;
    local KFPerk CurrentPerk;

    ExplosionTemplate.bIgnoreInstigator = true;
    super.PrepareExplosionTemplate();
    if(ExplosionActorClass == Class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass())
    {
        KFP = KFPawn(Instigator);
        if(KFP != none)
        {
            CurrentPerk = KFP.GetPerk();
            if(CurrentPerk != none)
            {
                CurrentPerk.SetLastHX25NukeTime(WorldInfo.TimeSeconds);
            }
        }
    }
}

simulated event HitWall(Vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
    if((WorldInfo.NetMode == NM_Client) && Pawn(Wall) != none)
    {
        Touch(Wall, WallComp, Location, HitNormal);
        return;
    }
    super.HitWall(HitNormal, Wall, WallComp);
}

simulated function bool AllowNuke()
{
    local KFPawn KFP;
    local KFPerk CurrentPerk;

    KFP = KFPawn(Instigator);
    if(KFP != none)
    {
        CurrentPerk = KFP.GetPerk();
        if((CurrentPerk != none) && (WorldInfo.TimeSeconds - CurrentPerk.GetLastHX25NukeTime()) < 0.25)
        {
            return false;
        }
    }
    return super(KFProjectile).AllowNuke();
}

defaultproperties
{
    bWarnAIWhenFired=true
    AlwaysRelevantDistanceSquared=2250000
    TossZ=150
    GravityScale=0.5
    TerminalVelocity=4000
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_HX25_Pistol_ARCH.HX25_Pistol_Submunition_Explosion'
        Damage=30
        DamageRadius=150
        ActorClassToIgnoreForDamage=Class'KFProj_ExplosiveSubmunition_HX25'
        MyDamageType=Class'KFDT_ExplosiveSubmunition_HX25'
        KnockDownStrength=10
        MomentumTransferScale=1
        ExplosionSound=AkEvent'WW_WEP_SA_HX25.Play_WEP_SA_HX25_Mini_Explosion'
        ExploLight=PointLightComponent'Default__KFProj_ExplosiveSubmunition_HX25.ExplosionPointLight'
        ExploLightFadeOutTime=0.3
        CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
        CamShakeInnerRadius=0
        CamShakeOuterRadius=300
        CamShakeFalloff=1.5
    object end
    // Reference: KFGameExplosion'Default__KFProj_ExplosiveSubmunition_HX25.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
    AltExploEffects=KFImpactEffectInfo'WEP_HX25_Pistol_ARCH.HX25_Pistol_Submunition_Explosion_Concussive_Force'
    ProjFlightTemplate=ParticleSystem'WEP_HX25_Pistol_EMIT.FX_HX25_Pistol_Projectile_small'
    ProjFlightTemplateZedTime=ParticleSystem'WEP_HX25_Pistol_EMIT.FX_HX25_Pistol_Projectile_small_ZEDTIME'
    AmbientComponent=AkComponent'Default__KFProj_ExplosiveSubmunition_HX25.AmbientAkSoundComponent'
    MomentumTransfer=50000
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_ExplosiveSubmunition_HX25.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_ExplosiveSubmunition_HX25.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_ExplosiveSubmunition_HX25.AmbientAkSoundComponent'
    Physics=EPhysics.PHYS_Falling
    LifeSpan=1000
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_ExplosiveSubmunition_HX25.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}