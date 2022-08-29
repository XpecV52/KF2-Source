/*******************************************************************************
 * KFProj_Bullet generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Bullet extends KFProjectile
    abstract
    native
    hidecategories(Navigation);

var float ProjEffectsScale;

function Init(Vector Direction)
{
    super.Init(Direction);
    if((LifeSpan == default.LifeSpan) && WorldInfo.TimeDilation < 1)
    {
        LifeSpan *= WorldInfo.TimeDilation;
    }
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    local KFPawn KFP;
    local bool bPassThrough, bNoPenetrationDmgReduction;
    local KFPerk CurrentPerk;
    local InterpCurveFloat PenetrationCurve;
    local KFWeapon KFW;

    if(Other != Instigator)
    {
        if(!Other.bStatic && DamageRadius == 0)
        {
            if(CheckRepeatingTouch(Other))
            {
                return;
            }
            KFW = KFWeapon(Instigator.Weapon);
            if(KFW.GetInitialPenetrationPower(Instigator.FiringMode) > 0)
            {
                if((PenetrationPower > float(0)) || PassThroughDamage(Other))
                {
                    CurrentPerk = KFW.GetPerk();
                    if(CurrentPerk != none)
                    {
                        bNoPenetrationDmgReduction = CurrentPerk.IgnoresPenetrationDmgReduction();
                    }
                    PenetrationCurve = KFW.PenetrationDamageReductionCurve[Instigator.FiringMode];
                    if(!bNoPenetrationDmgReduction)
                    {
                        Damage *= EvalInterpCurveFloat(PenetrationCurve, PenetrationPower / KFW.GetInitialPenetrationPower(Instigator.FiringMode));
                    }
                    ProcessBulletTouch(Other, HitLocation, HitNormal);
                    KFP = KFPawn(Other);
                    if(KFP != none)
                    {
                        PenetrationPower -= KFP.PenetrationResistance;
                    }
                    bPassThrough = true;
                }                
            }
            else
            {
                ProcessBulletTouch(Other, HitLocation, HitNormal);
            }            
        }
        else
        {
            if(((DamageRadius == 0) && !Other.bBlockActors) && Other.IsA('KFWaterMeshActor'))
            {
                if(WorldInfo.NetMode != NM_DedicatedServer)
                {
                    KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(HitLocation, Instigator,, ImpactEffects);
                }
                bPassThrough = true;
            }
        }
        if(!bPassThrough)
        {
            super.ProcessTouch(Other, HitLocation, HitNormal);
        }
    }
}

simulated function bool PassThroughDamage(Actor HitActor)
{
    if(!HitActor.bBlockActors && HitActor.IsA('InteractiveFoliageActor'))
    {
        return true;
    }
    return false;
}

simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
    if(ExplosionTemplate != none)
    {
        super.TriggerExplosion(HitLocation, HitNormal, HitActor);
        return;
    }
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(HitLocation, Instigator,, ImpactEffects);
    }
}

defaultproperties
{
    bSyncToOriginalLocation=true
    bSyncToThirdPersonMuzzleLocation=true
    bNoReplicationToInstigator=true
    bUseClientSideHitDetection=true
    bDamageDestructiblesOnTouch=true
    bWaitForEffects=true
    bAutoStartAmbientSound=true
    bStopAmbientSoundOnExplode=true
    bAmbientSoundZedTimeOnly=true
    TouchTimeThreshhold=0.15
    ProjEffectsFadeOutDuration=0.25
    AmbientSoundPlayEvent=AkEvent'WW_WEP_Bullet_FlyBys.Play_WEP_Bullet_Flyby_Small'
    AmbientSoundStopEvent=AkEvent'WW_WEP_Bullet_FlyBys.Stop_WEP_Bullet_Flyby_Small'
    begin object name=AmbientAkSoundComponent class=AkComponent
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.1
    object end
    // Reference: AkComponent'Default__KFProj_Bullet.AmbientAkSoundComponent'
    AmbientComponent=AmbientAkSoundComponent
    ImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Light_bullet_impact'
    Speed=50000
    MaxSpeed=50000
    bRotationFollowsVelocity=true
    Damage=10
    DamageRadius=0
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet.CollisionCylinder'
    Components(0)=CollisionCylinder
    begin object name=AmbientAkSoundComponent class=AkComponent
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.1
    object end
    // Reference: AkComponent'Default__KFProj_Bullet.AmbientAkSoundComponent'
    Components(1)=AmbientAkSoundComponent
    bCollideComplex=true
    LifeSpan=4
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bullet.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}