/*******************************************************************************
 * KFProj_Explosive_HRG_Kaboomstick generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Explosive_HRG_Kaboomstick extends KFProj_BallisticExplosive
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
    TossZ=150
    TerminalVelocity=7000
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_HRG_Kaboomstick_ARCH.WEP_HRG_Kaboomstick_Explosion'
        Damage=38
        DamageRadius=200
        MyDamageType=Class'KFDT_Explosive_HRG_Kaboomstick'
        KnockDownStrength=0
        MomentumTransferScale=22500
        ExplosionSound=AkEvent'WW_WEP_SA_HX25.Play_WEP_SA_HX25_Explosion'
        ExploLight=PointLightComponent'Default__KFProj_Explosive_HRG_Kaboomstick.ExplosionPointLight'
        ExploLightFadeOutTime=0.3
        CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
        CamShakeInnerRadius=0
        CamShakeOuterRadius=300
        CamShakeFalloff=1.5
    object end
    // Reference: KFGameExplosion'Default__KFProj_Explosive_HRG_Kaboomstick.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
    AltExploEffects=KFImpactEffectInfo'WEP_HRG_Kaboomstick_ARCH.WEP_HRG_Kaboomstick_Explosion_Concussive_Force'
    ProjFlightTemplate=ParticleSystem'WEP_HRG_Kaboomstick_EMIT.FX_HRG_Kaboomstick_Projectile'
    ProjFlightTemplateZedTime=ParticleSystem'WEP_HRG_Kaboomstick_EMIT.FX_HRG_Kaboomstick_Projectile_ZEDTIME'
    AmbientComponent=AkComponent'Default__KFProj_Explosive_HRG_Kaboomstick.AmbientAkSoundComponent'
    AssociatedPerkClass=Class'KFGame.KFPerk_Demolitionist'
    Speed=7000
    MaxSpeed=7000
    MomentumTransfer=50000
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Explosive_HRG_Kaboomstick.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Explosive_HRG_Kaboomstick.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Explosive_HRG_Kaboomstick.AmbientAkSoundComponent'
    Physics=EPhysics.PHYS_Falling
    bBounce=false
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Explosive_HRG_Kaboomstick.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}