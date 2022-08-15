/*******************************************************************************
 * KFProj_MolotovGrenade generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_MolotovGrenade extends KFProj_Grenade
    hidecategories(Navigation);

var class<KFProjectile> ResidualFlameProjClass;
/** Number of lingering fires/fireballs to spawn */
var() int NumResidualFlames;
var AkEvent ThrowAkEvent;

simulated function SpawnFlightEffects()
{
    super(KFProjectile).SpawnFlightEffects();
    PlaySoundBase(ThrowAkEvent);
}

simulated event HitWall(Vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
    if((StaticMeshComponent(WallComp) != none) && StaticMeshComponent(WallComp).CanBecomeDynamic())
    {
        return;
    }
    Explode(Location, HitNormal);
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    if(Other.bBlockActors)
    {
        if((Pawn(Other) != none) && Pawn(Other).GetTeamNum() == GetTeamNum())
        {
            return;
        }
        if((KFDestructibleActor(Other) != none) && KFDestructibleActor(Other).ReplicationMode == 2)
        {
            return;
        }
        Explode(Location, HitNormal);
    }
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    local Vector HitVelocity;
    local KFPerk InstigatorPerk;
    local Rotator FlareRot;

    HitVelocity = Velocity;
    super(KFProjectile).Explode(HitLocation, HitNormal);
    if(Role < ROLE_Authority)
    {
        return;
    }
    SpawnResidualFlames(HitLocation, HitNormal, HitVelocity);
    if((Instigator != none) && Instigator.Controller != none)
    {
        InstigatorPerk = KFPlayerController(Instigator.Controller).GetPerk();
        if(InstigatorPerk.IsFlarotovActive())
        {
            FlareRot = rotator(HitVelocity);
            FlareRot.Pitch = 0;
            Spawn(Class'KFProj_MolotovFlare', self,, HitLocation + (HitNormal * float(20)), FlareRot);
        }
    }
}

simulated function SpawnResidualFlames(Vector HitLocation, Vector HitNormal, Vector HitVelocity)
{
    local int I;
    local Vector HitVelDir;
    local float HitVelMag;
    local Vector SpawnLoc, SpawnVel;

    HitVelMag = VSize(HitVelocity);
    HitVelDir = Normal(HitVelocity);
    SpawnLoc = HitLocation + (HitNormal * 10);
    I = 0;
    J0x5A:

    if(I < NumResidualFlames)
    {
        SpawnVel = CalculateResidualFlameVelocity(HitNormal, HitVelDir, HitVelMag);
        SpawnResidualFlame(SpawnLoc, SpawnVel);
        ++ I;
        goto J0x5A;
    }
    SpawnResidualFlame(HitLocation, HitVelocity / 3);
}

function Vector CalculateResidualFlameVelocity(Vector HitNormal, Vector HitVelDir, float HitVelMag)
{
    local Vector SpawnDir;

    SpawnDir = VRandCone(HitVelDir, 3.141593 / float(4));
    SpawnDir = SpawnDir + (-SpawnDir Dot HitNormal * HitNormal);
    SpawnDir = VRandCone(SpawnDir, 3.141593 / float(4));
    return SpawnDir * (HitVelMag / 3);
}

function SpawnResidualFlame(Vector SpawnLoc, Vector SpawnVel)
{
    local KFProjectile SpawnedProjectile;

    SpawnedProjectile = Spawn(ResidualFlameProjClass, self,, SpawnLoc);
    if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
    {
        SpawnedProjectile.Init(Normal(SpawnVel));
        SpawnedProjectile.Velocity = SpawnVel;
        SpawnedProjectile.Speed = VSize(SpawnedProjectile.Velocity);
    }
}

defaultproperties
{
    ResidualFlameProjClass=Class'KFProj_MolotovSplash'
    NumResidualFlames=4
    ThrowAkEvent=AkEvent'WW_WEP_EXP_MOLOTOV.Play_WEP_EXP_Molotov_Throw'
    FuseTime=10
    TossZ=650
    TerminalVelocity=2000
    ExplosionActorClass=Class'KFGame.KFExplosionActor'
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'wep_molotov_arch.Molotov_Explosion'
        Damage=60
        DamageRadius=200
        MyDamageType=Class'KFDT_Fire_MolotovGrenade'
        KnockDownStrength=0
        MomentumTransferScale=0
        ExplosionSound=AkEvent'WW_WEP_EXP_MOLOTOV.Play_WEP_EXP_Molotov_Explosion'
        ExploLight=PointLightComponent'Default__KFProj_MolotovGrenade.FlamePointLight'
        ExploLightFadeOutTime=0.2
        ExploLightStartFadeOutTime=0.4
        FractureMeshRadius=0
        CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Molotov'
        CamShakeInnerRadius=250
        CamShakeOuterRadius=400
    object end
    // Reference: KFGameExplosion'Default__KFProj_MolotovGrenade.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
    ProjFlightTemplate=ParticleSystem'WEP_3P_Molotov_EMIT.FX_Molotov_Grenade_Mesh'
    AssociatedPerkClass=Class'KFGame.KFPerk_Firebug'
    Speed=1200
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_MolotovGrenade.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_MolotovGrenade.CollisionCylinder'
    Components(0)=CollisionCylinder
    begin object name=FlightPointLight class=PointLightComponent
        Radius=300
        FalloffExponent=10
        Brightness=2
        LightColor=(B=140,G=190,R=245,A=255)
        CastShadows=false
        CastStaticShadows=false
        CastDynamicShadows=false
        LightingChannels=(Outdoor=true)
    object end
    // Reference: PointLightComponent'Default__KFProj_MolotovGrenade.FlightPointLight'
    Components(1)=FlightPointLight
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_MolotovGrenade.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}