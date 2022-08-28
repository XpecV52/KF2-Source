/*******************************************************************************
 * KFProj_MedicGrenade_Mini generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_MedicGrenade_Mini extends KFProj_MedicGrenade
    hidecategories(Navigation);

simulated event HitWall(Vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
    local TraceHitInfo HitInfo;

    super(KFProj_Grenade).HitWall(HitNormal, Wall, WallComp);
    if(((Pawn(Wall) == none) && !Wall.bStatic) && Wall.bCanBeDamaged)
    {
        HitInfo.HitComponent = WallComp;
        HitInfo.Item = -1;
        Wall.TakeDamage(int(Damage), InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType, HitInfo, self);
    }
}

simulated function bool Bounce(Vector HitNormal, Actor BouncedOff)
{
    super(KFProj_Grenade).Bounce(HitNormal, BouncedOff);
    Disable('Touch');
    Velocity = vect(0, 0, 0);
    return true;
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    if((Other != Instigator) && !Other.bStatic)
    {
        if(!CheckRepeatingTouch(Other) && Other.GetTeamNum() != GetTeamNum())
        {
            ProcessBulletTouch(Other, HitLocation, HitNormal);
        }
    }
    Disable('Touch');
    Velocity = vect(0, 0, 0);
}

defaultproperties
{
    FuseTime=0.01
    bDamageDestructiblesOnTouch=true
    bWarnAIWhenFired=true
    TossZ=150
    GravityScale=0.5
    TerminalVelocity=4000
    ExplosionActorClass=Class'KFExplosion_MedicGrenadeMini'
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.MedicGrenade_Explosion'
        Damage=60
        DamageFalloffExponent=0
        MyDamageType=Class'KFGame.KFDT_Toxic_MedicGrenadeLauncher'
        KnockDownStrength=0
        MomentumTransferScale=0
        ExplosionSound=AkEvent'WW_WEP_Medic_GrenadeLauncher.Play_WEP_Medic_GrenadeLauncher_Grenade_Explosion'
        FractureMeshRadius=0
        FracturePartVel=0
        CamShake=none
        CamShakeInnerRadius=0
        CamShakeOuterRadius=0
        CamShakeFalloff=1.5
    object end
    // Reference: KFGameExplosion'Default__KFProj_MedicGrenade_Mini.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ProjFlightTemplate=ParticleSystem'WEP_Medic_GrenadeLauncher_EMIT.FX_Medic_GrenadeLauncher_Projectile'
    ProjFlightTemplateZedTime=ParticleSystem'WEP_Medic_GrenadeLauncher_EMIT.FX_Medic_GrenadeLauncher_Projectile_ZEDTIME'
    Speed=4000
    MaxSpeed=4000
    Damage=50
    MyDamageType=Class'KFDT_Ballistic_MedicRifleGrenadeLauncherImpact'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_MedicGrenade_Mini.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_MedicGrenade_Mini.CollisionCylinder'
    Components(0)=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_MedicGrenade_Mini.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}