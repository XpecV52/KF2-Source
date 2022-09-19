/*******************************************************************************
 * KFProj_Rocket_SealSqueal generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Rocket_SealSqueal extends KFProjectile
    hidecategories(Navigation);

var float FuseTime;
/** This is the effect indicator that is played for the current user */
var(Projectile) ParticleSystem ProjIndicatorTemplate;
var export editinline ParticleSystemComponent ProjIndicatorEffects;
var bool IndicatorActive;

simulated function TryActivateIndicator()
{
    if(!IndicatorActive && Instigator != none)
    {
        IndicatorActive = true;
        if(((WorldInfo.NetMode == NM_Standalone) || Instigator.Role == ROLE_AutonomousProxy) || ((Instigator.Role == ROLE_Authority) && WorldInfo.NetMode == NM_ListenServer) && Instigator.IsLocallyControlled())
        {
            if(ProjIndicatorTemplate != none)
            {
                ProjIndicatorEffects = WorldInfo.MyEmitterPool.SpawnEmitterCustomLifetime(ProjIndicatorTemplate);
            }
            if(ProjIndicatorEffects != none)
            {
                ProjIndicatorEffects.SetAbsolute(false, false, false);
                ProjIndicatorEffects.SetLODLevel(((WorldInfo.bDropDetail) ? 1 : 0));
                ProjIndicatorEffects.bUpdateComponentInTick = true;
                AttachComponent(ProjIndicatorEffects);
            }
        }
    }
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    if(Role == ROLE_Authority)
    {
        SetTimer(FuseTime, false, 'Timer_Detonate');
    }
    AdjustCanDisintigrate();
}

function Timer_Detonate()
{
    Detonate();
}

simulated function OnInstigatorControllerLeft()
{
    if(WorldInfo.NetMode != NM_Client)
    {
        SetTimer((1 + float(Rand(5))) + FRand(), false, 'Timer_Detonate');
    }
}

simulated function GetExplodeEffectLocation(out Vector HitLocation, out Vector HitRotation, out Actor HitActor)
{
    local Vector EffectStartTrace, EffectEndTrace;
    local TraceHitInfo HitInfo;

    EffectStartTrace = Location + (vect(0, 0, 1) * 4);
    EffectEndTrace = EffectStartTrace - (vect(0, 0, 1) * 32);
    HitActor = Trace(HitLocation, HitRotation, EffectEndTrace, EffectStartTrace, false,, HitInfo, 1);
    if(IsZero(HitLocation))
    {
        HitLocation = Location;
    }
    if(IsZero(HitRotation))
    {
        HitRotation = vect(0, 0, 1);
    }
}

simulated event Tick(float DeltaTime)
{
    super(Actor).Tick(DeltaTime);
    StickHelper.Tick(DeltaTime);
    if(!IsZero(Velocity))
    {
        SetRelativeRotation(rotator(Velocity));
    }
    TryActivateIndicator();
}

function Detonate()
{
    local KFWeap_RocketLauncher_SealSqueal SealSquealOwner;
    local Vector ExplosionNormal;

    if(Role == ROLE_Authority)
    {
        SealSquealOwner = KFWeap_RocketLauncher_SealSqueal(Owner);
        if(SealSquealOwner != none)
        {
            SealSquealOwner.RemoveDeployedHarpoon(,, self);
        }
    }
    ExplosionNormal = vect(0, 0, 1) >> Rotation;
    Explode(Location, ExplosionNormal);
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    StickHelper.UnPin();
    super.Explode(HitLocation, HitNormal);
}

simulated function Disintegrate(Rotator InDisintegrateEffectRotation)
{
    local KFWeap_RocketLauncher_SealSqueal SealSquealOwner;

    if(Role == ROLE_Authority)
    {
        SealSquealOwner = KFWeap_RocketLauncher_SealSqueal(Owner);
        if(SealSquealOwner != none)
        {
            SealSquealOwner.RemoveDeployedHarpoon(,, self);
        }
    }
    super.Disintegrate(InDisintegrateEffectRotation);
}

protected simulated function PrepareExplosionTemplate()
{
    Class'KFPerk_Demolitionist'.static.PrepareExplosive(Instigator, self);
    super.PrepareExplosionTemplate();
}

protected simulated function SetExplosionActorClass()
{
    local KFPlayerReplicationInfo InstigatorPRI;

    if((WorldInfo.TimeDilation < 1) && Instigator != none)
    {
        InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
        if(InstigatorPRI != none)
        {
            if(InstigatorPRI.bNukeActive && Class'KFPerk_Demolitionist'.static.ProjectileShouldNuke(self))
            {
                ExplosionActorClass = Class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass();
            }
        }
    }
    super.SetExplosionActorClass();
}

simulated function SyncOriginalLocation()
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal;
    local TraceHitInfo HitInfo;

    if(((Role < ROLE_Authority) && Instigator != none) && Instigator.IsLocallyControlled())
    {
        HitActor = Trace(HitLocation, HitNormal, OriginalLocation, Location,,, HitInfo, 1);
        if(HitActor != none)
        {
            StickHelper.TryStick(HitNormal, HitLocation, HitActor);
        }
    }
}

protected simulated function StopSimulating()
{
    super.StopSimulating();
    if(ProjIndicatorEffects != none)
    {
        ProjIndicatorEffects.DeactivateSystem();
    }
}

defaultproperties
{
    FuseTime=4
    ProjIndicatorTemplate=ParticleSystem'WEP_Seal_Squeal_EMIT.FX_Harpoon_Projectile_Indicator'
    bSyncToOriginalLocation=true
    bSyncToThirdPersonMuzzleLocation=true
    bUseClientSideHitDetection=true
    bAlwaysReplicateExplosion=true
    bCanDisintegrate=true
    bWarnAIWhenFired=true
    bCanStick=true
    bCanPin=true
    GlassShatterType=FracturedMeshGlassShatterType.FMGS_ShatterAll
    TossZ=150
    GravityScale=0.5
    TerminalVelocity=4000
    ExplosionActorClass=Class'KFGame.KFExplosionActor'
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_Seal_Squeal_ARCH.SealSquealHarpoon_Explosion'
        Damage=250
        DamageRadius=600
        MyDamageType=Class'KFDT_Explosive_SealSqueal'
        KnockDownStrength=0
        ExplosionSound=AkEvent'WW_WEP_SealSqueal.Play_WEP_SealSqueal_Shoot_Explode'
        ExploLight=PointLightComponent'Default__KFProj_Rocket_SealSqueal.ExplosionPointLight'
        ExploLightFadeOutTime=0.2
        CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
        CamShakeInnerRadius=200
        CamShakeFalloff=1.5
    object end
    // Reference: KFGameExplosion'Default__KFProj_Rocket_SealSqueal.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
    ProjFlightTemplate=ParticleSystem'WEP_Seal_Squeal_EMIT.FX_Harpoon_Projectile'
    PinBoneIdx=-1
    StickHelper=KFProjectileStickHelper'Default__KFProj_Rocket_SealSqueal.StickHelper0'
    bBlockedByInstigator=false
    bIgnoreFoliageTouch=true
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
        CollideActors=true
        BlockNonZeroExtent=false
    object end
    // Reference: CylinderComponent'Default__KFProj_Rocket_SealSqueal.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
        CollideActors=true
        BlockNonZeroExtent=false
    object end
    // Reference: CylinderComponent'Default__KFProj_Rocket_SealSqueal.CollisionCylinder'
    Components(0)=CollisionCylinder
    Physics=EPhysics.PHYS_Falling
    bNetTemporary=false
    bUpdateSimulatedPosition=true
    bCollideComplex=true
    NetUpdateFrequency=200
    NetPriority=5
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
        CollideActors=true
        BlockNonZeroExtent=false
    object end
    // Reference: CylinderComponent'Default__KFProj_Rocket_SealSqueal.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}