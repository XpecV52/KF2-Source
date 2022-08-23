/*******************************************************************************
 * GameExplosionActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GameExplosionActor extends Actor
    abstract
    native
    config(Weapon)
    notplaceable
    hidecategories(Navigation);

var protected transient bool bHasExploded;
/**  
 *True if this actor can explode more than once and doesn't die after an explosion.
 *       Used by placeable actors whose explosions are triggered via matinee
 */
var() protected bool bExplodeMoreThanOnce;
var bool bTrackExplosionParticleSystemLifespan;
var config bool bDrawDebug;
var protected export editinline transient PointLightComponent ExplosionLight;
var protected transient float LastLightBrightness;
var protected transient float LightFlickerIntensity;
var protected transient float LightFlickerInterpSpeed;
var protected transient float LightFadeStartTime;
var protected export editinline transient RadialBlurComponent ExplosionRadialBlur;
var protected transient float LightFadeTime;
var protected transient float LightFadeTimeRemaining;
var protected transient float LightInitialBrightness;
var protected transient float RadialBlurFadeTime;
var protected transient float RadialBlurFadeTimeRemaining;
var protected transient float RadialBlurMaxBlurAmount;
var GameExplosion ExplosionTemplate;
var protected export editinline RB_RadialImpulseComponent RadialImpulseComponent;
var Controller InstigatorController;
var Actor HitActorFromPhysMaterialTrace;
var Vector HitLocationFromPhysMaterialTrace;
var Actor Attachee;
var Controller AttacheeController;
var transient float DirectionalExplosionMinDot;
var transient Vector ExplosionDirection;

replication
{
     if(bNetInitial)
        ExplosionDirection;
}

function Actor TraceExplosive(Vector TraceEnd, Vector TraceStart)
{
    return StaticTraceExplosive(TraceEnd, TraceStart, self);
}

// Export UGameExplosionActor::execStaticTraceExplosive(FFrame&, void* const)
native static function Actor StaticTraceExplosive(Vector TraceEnd, Vector TraceStart, Actor SourceActor);

event PreBeginPlay()
{
    super.PreBeginPlay();
    if((Instigator != none) && InstigatorController == none)
    {
        InstigatorController = Instigator.Controller;
    }
}

protected simulated function PhysicalMaterial GetPhysicalMaterial()
{
    local PhysicalMaterial Retval;
    local Vector TraceStart, TraceDest, OutHitNorm, ExploNormal;
    local TraceHitInfo OutHitInfo;

    TraceStart = Location + (vect(0, 0, 1) * 256);
    TraceDest = Location - (vect(0, 0, 1) * 16);
    HitActorFromPhysMaterialTrace = Trace(HitLocationFromPhysMaterialTrace, OutHitNorm, TraceDest, TraceStart, true, vect(0, 0, 0), OutHitInfo, 1 | 2);
    if(FluidSurfaceActor(HitActorFromPhysMaterialTrace) != none)
    {
        Retval = OutHitInfo.PhysMaterial;
        return Retval;
    }
    ExploNormal = vector(Rotation);
    TraceStart = Location + (ExploNormal * 8);
    TraceDest = TraceStart - (ExploNormal * 64);
    HitActorFromPhysMaterialTrace = Trace(HitLocationFromPhysMaterialTrace, OutHitNorm, TraceDest, TraceStart, true, vect(0, 0, 0), OutHitInfo, 1);
    if(HitActorFromPhysMaterialTrace != none)
    {
        Retval = OutHitInfo.PhysMaterial;
    }
    return Retval;
}

simulated function bool DoFullDamageToActor(Actor Victim)
{
    return ((Victim.bStatic || Victim.IsA('KActor')) || Victim.IsA('InterpActor')) || Victim.IsA('FracturedStaticMeshPart');
}

protected simulated function bool IsBehindExplosion(Actor A)
{
    if(ExplosionTemplate.bDirectionalExplosion && !IsZero(ExplosionDirection))
    {
        return (ExplosionDirection Dot Normal(A.Location - Location)) < DirectionalExplosionMinDot;
    }
    return false;
}

// Export UGameExplosionActor::execBoxDistanceToPoint(FFrame&, void* const)
native static final function float BoxDistanceToPoint(Vector Start, Box BBox);

protected simulated function bool DoExplosionDamage(bool bCauseDamage, bool bCauseEffects)
{
    local Actor Victim, HitActor;
    local Vector BBoxCenter;
    local bool bDamageBlocked, bDoFullDamage, bCauseFractureEffects, bCausePawnEffects, bCauseDamageEffects, bHurtSomeone;

    local float ColRadius, ColHeight, CheckRadius, VictimDist;
    local array<Actor> VictimsList;
    local Box BBox;
    local Controller ModInstigator;
    local GamePawn VictimPawn;
    local FracturedStaticMeshActor FracActor;
    local byte WantPhysChunksAndParticles;
    local TraceHitInfo HitInfo;
    local KActorFromStatic NewKActor;
    local editinline StaticMeshComponent HitStaticMesh;

    bCauseFractureEffects = (bCauseEffects && WorldInfo.NetMode != NM_DedicatedServer) && ExplosionTemplate.bCausesFracture;
    bCauseEffects = bCauseEffects && WorldInfo.NetMode != NM_Client;
    bHurtSomeone = false;
    CheckRadius = GetEffectCheckRadius(bCauseDamage, bCauseFractureEffects, bCauseEffects);
    if(CheckRadius > 0)
    {
        foreach CollidingActors(Class'Actor', Victim, CheckRadius, Location, ExplosionTemplate.bUseOverlapCheck,, HitInfo)
        {
            if(Victim.bWorldGeometry)
            {
                HitStaticMesh = StaticMeshComponent(HitInfo.HitComponent);
                if((((HitStaticMesh != none) && HitStaticMesh.CanBecomeDynamic()) && !WorldInfo.bDropDetail) && WorldInfo.GetDetailMode() > 0)
                {
                    NewKActor = Class'KActorFromStatic'.static.MakeDynamic(HitStaticMesh);
                    if(NewKActor != none)
                    {
                        Victim = NewKActor;
                    }
                }
            }
            if(((((((Victim != self) && !Victim.bWorldGeometry || Victim.bCanBeDamaged) && NavigationPoint(Victim) == none) && Victim != ExplosionTemplate.ActorToIgnoreForDamage) && !ExplosionTemplate.bIgnoreInstigator || Victim != Instigator) && !ClassIsChildOf(Victim.Class, ExplosionTemplate.ActorClassToIgnoreForDamage)) && !IsBehindExplosion(Victim))
            {
                VictimPawn = GamePawn(Victim);
                Victim.GetComponentsBoundingBox(BBox);
                if(ExplosionTemplate.bUseOverlapCheck)
                {
                    VictimDist = BoxDistanceToPoint(Location, BBox);                    
                }
                else
                {
                    VictimDist = VSize(Location - Victim.Location);
                }
                if(bCauseFractureEffects && VictimPawn == none)
                {
                    FracActor = FracturedStaticMeshActor(Victim);
                    if(((((FracActor != none) && VictimDist < ExplosionTemplate.FractureMeshRadius) && FracActor.Physics == 0) && FracActor.IsFracturedByDamageType(ExplosionTemplate.MyDamageType)) && FracActor.FractureEffectIsRelevant(false, Instigator, WantPhysChunksAndParticles))
                    {
                        FracActor.NotifyHitByExplosion(InstigatorController, ExplosionTemplate.Damage, ExplosionTemplate.MyDamageType);
                        FracActor.BreakOffPartsInRadius(Location, ExplosionTemplate.FractureMeshRadius, ExplosionTemplate.FracturePartVel, ((WantPhysChunksAndParticles == 1) ? true : false));
                    }
                }
                bCausePawnEffects = (bCauseEffects && VictimPawn != none) && !VictimPawn.InGodMode();
                bCauseDamageEffects = bCauseDamage && VictimDist < ExplosionTemplate.DamageRadius;
                if(DoFullDamageToActor(Victim))
                {
                    bDamageBlocked = false;
                    bDoFullDamage = true;                    
                }
                else
                {
                    if(bCausePawnEffects || bCauseDamageEffects)
                    {
                        BBoxCenter = (BBox.Min + BBox.Max) * 0.5;
                        HitActor = TraceExplosive(BBoxCenter, Location + vect(0, 0, 20));
                        bDamageBlocked = (HitActor != none) && HitActor != Victim;
                        bDoFullDamage = false;
                    }
                }
                if(!bDamageBlocked)
                {
                    if(bCauseDamageEffects)
                    {
                        ModInstigator = InstigatorController;
                        if((((AttacheeController != none) && AttacheeController.PlayerReplicationInfo != none) && VictimPawn != none) && !WorldInfo.GRI.OnSameTeam(AttacheeController, VictimPawn.Controller))
                        {
                            ModInstigator = AttacheeController;
                        }
                        Victim.TakeRadiusDamage(ModInstigator, GetDamageFor(Victim), ExplosionTemplate.DamageRadius, ExplosionTemplate.MyDamageType, ExplosionTemplate.MomentumTransferScale, Location, bDoFullDamage, ((Owner != none) ? Owner : self), ExplosionTemplate.DamageFalloffExponent);
                        VictimsList[VictimsList.Length] = Victim;
                        if(Victim.IsA('Pawn'))
                        {
                            bHurtSomeone = true;
                        }
                    }
                    if(bCausePawnEffects)
                    {
                        SpecialPawnEffectsFor(VictimPawn, VictimDist);
                        continue;
                    }
                    if(bCauseEffects)
                    {
                        SpecialCringeEffectsFor(Victim, VictimDist);
                    }
                }
            }            
        }        
        if(ExplosionTemplate.bFullDamageToAttachee && VictimsList.Find(Attachee == -1)
        {
            Victim = Attachee;
            Victim.GetBoundingCylinder(ColRadius, ColHeight);
            Victim.TakeRadiusDamage(InstigatorController, GetDamageFor(Victim), ExplosionTemplate.DamageRadius, ExplosionTemplate.MyDamageType, ExplosionTemplate.MomentumTransferScale, Location, true, ((Owner != none) ? Owner : self));
        }
    }
    return bHurtSomeone;
}

function float GetEffectCheckRadius(bool bCauseDamage, bool bCauseFractureEffects, bool bCauseEffects)
{
    local float CheckRadius;

    if(bCauseFractureEffects)
    {
        CheckRadius = ExplosionTemplate.FractureMeshRadius;
    }
    if(bCauseDamage)
    {
        CheckRadius = FMax(CheckRadius, ExplosionTemplate.DamageRadius);
    }
    if(bCauseEffects)
    {
        CheckRadius = FMax(CheckRadius, ExplosionTemplate.KnockDownRadius);
        CheckRadius = FMax(CheckRadius, ExplosionTemplate.CringeRadius);
    }
    return CheckRadius;
}

simulated function float GetDamageFor(Actor Victim)
{
    return ExplosionTemplate.Damage;
}

protected function SpecialPawnEffectsFor(GamePawn VictimPawn, float VictimDist);

protected function SpecialCringeEffectsFor(Actor Victim, float VictimDist);

protected simulated function UpdateExplosionTemplateWithPerMaterialFX(PhysicalMaterial PhysMaterial);

simulated function SpawnExplosionParticleSystem(ParticleSystem Template);

simulated function SpawnExplosionDecal();

simulated function SpawnExplosionFogVolume();

simulated function Explode(GameExplosion NewExplosionTemplate, optional Vector Direction)
{
    local float HowLongToLive;
    local PhysicalMaterial PhysMat;
    local bool bHurtSomeone;

    ExplosionTemplate = NewExplosionTemplate;
    if(ExplosionTemplate.bDirectionalExplosion)
    {
        ExplosionDirection = Normal(Direction);
        DirectionalExplosionMinDot = Cos(ExplosionTemplate.DirectionalExplosionAngleDeg * 0.01745329);
    }
    HowLongToLive = (LifeSpan + ExplosionTemplate.DamageDelay) + 0.01;
    if(!bHasExploded || bExplodeMoreThanOnce)
    {
        if(ExplosionTemplate.bAllowPerMaterialFX)
        {
            PhysMat = GetPhysicalMaterial();
            UpdateExplosionTemplateWithPerMaterialFX(PhysMat);
        }
        if(WorldInfo.NetMode != NM_DedicatedServer)
        {
            if(ExplosionTemplate.ParticleEmitterTemplate != none)
            {
                SpawnExplosionParticleSystem(ExplosionTemplate.ParticleEmitterTemplate);
                if(bTrackExplosionParticleSystemLifespan == true)
                {
                    HowLongToLive = FMax(ExplosionTemplate.ParticleEmitterTemplate.GetMaxLifespan(0) + 0.1, HowLongToLive);
                }
            }
            SpawnExplosionDecal();
            if(((ExplosionTemplate.ExploLight != none) && WorldInfo.bAllowExplosionLights) && !WorldInfo.bDropDetail)
            {
                if(ExplosionLight != none)
                {
                    DetachComponent(ExplosionLight);
                }
                ExplosionLight = new (self) Class'PointLightComponent' (ExplosionTemplate.ExploLight);
                if(ExplosionLight != none)
                {
                    AttachComponent(ExplosionLight);
                    ExplosionLight.SetEnabled(true);
                    SetTimer(ExplosionTemplate.ExploLightFadeOutTime);
                    LightFadeTime = ExplosionTemplate.ExploLightFadeOutTime;
                    LightFadeTimeRemaining = LightFadeTime;
                    LightFadeStartTime = ExplosionTemplate.ExploLightStartFadeOutTime;
                    LightFlickerIntensity = ExplosionTemplate.ExploLightFlickerIntensity;
                    LightFlickerInterpSpeed = ExplosionTemplate.ExploLightFlickerInterpSpeed;
                    HowLongToLive = FMax((LightFadeTime + LightFadeStartTime) + 0.2, HowLongToLive);
                    LightInitialBrightness = ExplosionTemplate.ExploLight.Brightness;
                }
            }
            if(ExplosionTemplate.ExploRadialBlur != none)
            {
                if((ExplosionTemplate.bPerformRadialBlurRelevanceCheck == false) || ImpactEffectIsRelevant(Instigator, Location + vect(0, 0, 1), false, 4000, 350, true))
                {
                    if(ExplosionRadialBlur != none)
                    {
                        DetachComponent(ExplosionRadialBlur);
                    }
                    ExplosionRadialBlur = new (self) Class'RadialBlurComponent' (ExplosionTemplate.ExploRadialBlur);
                    if(ExplosionRadialBlur != none)
                    {
                        AttachComponent(ExplosionRadialBlur);
                        RadialBlurFadeTime = ExplosionTemplate.ExploRadialBlurFadeOutTime;
                        RadialBlurFadeTimeRemaining = RadialBlurFadeTime;
                        RadialBlurMaxBlurAmount = ExplosionTemplate.ExploRadialBlurMaxBlur;
                        SetTimer(FMax(RadialBlurFadeTime, LightFadeTime));
                        HowLongToLive = FMax(RadialBlurFadeTime + 0.2, HowLongToLive);
                    }
                }
            }
            DoExplosionCameraEffects();
            if(RadialImpulseComponent == none)
            {                
            }
            else
            {
                if((ExplosionTemplate.MyDamageType != none) && ExplosionTemplate.MyDamageType.default.RadialDamageImpulse > 0)
                {
                    RadialImpulseComponent.ImpulseRadius = FMax(ExplosionTemplate.DamageRadius, ExplosionTemplate.KnockDownRadius);
                    RadialImpulseComponent.ImpulseStrength = ExplosionTemplate.MyDamageType.default.RadialDamageImpulse;
                    RadialImpulseComponent.bVelChange = ExplosionTemplate.MyDamageType.default.bRadialDamageVelChange;
                    RadialImpulseComponent.ImpulseFalloff = 0;
                    RadialImpulseComponent.FireImpulse(Location);
                }
            }
            SpawnExplosionFogVolume();
            if(FluidSurfaceActor(HitActorFromPhysMaterialTrace) != none)
            {
                FluidSurfaceActor(HitActorFromPhysMaterialTrace).FluidComponent.ApplyForce(HitLocationFromPhysMaterialTrace, 1024, 20, false);
            }
        }
        bHurtSomeone = false;
        if(ExplosionTemplate.Damage > 0)
        {
            if(ExplosionTemplate.DamageDelay > 0)
            {
                DoExplosionDamage(false, true);
                SetTimer(ExplosionTemplate.DamageDelay, false, 'DelayedExplosionDamage');                
            }
            else
            {
                bHurtSomeone = DoExplosionDamage(true, true);
            }            
        }
        else
        {
            DoExplosionDamage(false, true);
        }
        if(WorldInfo.NetMode != NM_DedicatedServer)
        {
            if(bHurtSomeone && ExplosionTemplate.ExplosionSoundHurtSomeone != none)
            {
                PlaySoundBase(ExplosionTemplate.ExplosionSoundHurtSomeone, true, true, false, Location + vect(0, 0, 0.1), true);                
            }
            else
            {
                if(ExplosionTemplate.ExplosionSound != none)
                {
                    PlaySoundBase(ExplosionTemplate.ExplosionSound, true, true, false, Location + vect(0, 0, 0.1), true);
                }
            }
        }
        if(Role == ROLE_Authority)
        {
            MakeNoise(1);
        }
        if(bDrawDebug)
        {
            DrawDebug();
        }
        bHasExploded = true;
        if(!bPendingDelete && !bDeleteMe)
        {
            LifeSpan = ((bExplodeMoreThanOnce) ? 0 : HowLongToLive);
        }
    }
}

simulated function DelayedExplosionDamage()
{
    DoExplosionDamage(true, false);
}

simulated function DrawDebug()
{
    local Color C;
    local float Angle;

    if(ExplosionTemplate.bDirectionalExplosion)
    {
        C.R = 255;
        C.G = 128;
        C.B = 16;
        C.A = 255;
        Angle = ExplosionTemplate.DirectionalExplosionAngleDeg * 0.01745329;
        DrawDebugCone(Location, ExplosionDirection, ExplosionTemplate.DamageRadius, Angle, Angle, 8, C, true);        
    }
    else
    {
        DrawDebugSphere(Location, ExplosionTemplate.DamageRadius, 10, 255, 128, 16, true);
    }
}

simulated function DoExplosionCameraEffects()
{
    local CameraShake Shake;
    local float ShakeScale;
    local PlayerController PC;

    foreach WorldInfo.LocalPlayerControllers(Class'PlayerController', PC)
    {
        if(PC.PlayerCamera != none)
        {
            Shake = ChooseCameraShake(Location, PC);
            if(Shake != none)
            {
                ShakeScale = PC.PlayerCamera.CalcRadialShakeScale(PC.PlayerCamera, Location, ExplosionTemplate.CamShakeInnerRadius, ExplosionTemplate.CamShakeOuterRadius, ExplosionTemplate.CamShakeFalloff);
                if(ExplosionTemplate.bOrientCameraShakeTowardsEpicenter)
                {
                    PC.ClientPlayCameraShake(Shake, ShakeScale, ExplosionTemplate.bAutoControllerVibration, 2, rotator(Location - PC.ViewTarget.Location));
                    continue;
                }
                PC.ClientPlayCameraShake(Shake, ShakeScale, ExplosionTemplate.bAutoControllerVibration);
            }
        }        
    }    
    SpawnCameraLensEffects();
}

simulated function SpawnCameraLensEffects()
{
    local PlayerController PC;

    if(ExplosionTemplate.CameraLensEffect != none)
    {
        foreach WorldInfo.LocalPlayerControllers(Class'PlayerController', PC)
        {
            if((((PC.Pawn != none) && VSize(PC.Pawn.Location - Location) < ExplosionTemplate.CameraLensEffectRadius) && PC.IsAimingAt(self, 0.1)) && !IsBehindExplosion(PC.Pawn))
            {
                PC.ClientSpawnCameraLensEffect(ExplosionTemplate.CameraLensEffect);
            }            
        }        
    }
}

protected simulated function CameraShake ChooseCameraShake(Vector Epicenter, PlayerController PC)
{
    local Vector CamX, CamY, CamZ, ToEpicenter;
    local float FwdDot, RtDot;
    local CameraShake ChosenShake;
    local Rotator NoPitchRot;

    if(ExplosionTemplate.bOrientCameraShakeTowardsEpicenter)
    {
        return ExplosionTemplate.CamShake;        
    }
    else
    {
        if(((ExplosionTemplate.CamShake_Left != none) || ExplosionTemplate.CamShake_Right != none) || ExplosionTemplate.CamShake_Rear != none)
        {
            ToEpicenter = Epicenter - PC.PlayerCamera.Location;
            ToEpicenter.Z = 0;
            ToEpicenter = Normal(ToEpicenter);
            NoPitchRot = PC.PlayerCamera.Rotation;
            NoPitchRot.Pitch = 0;
            GetAxes(NoPitchRot, CamX, CamY, CamZ);
            FwdDot = CamX Dot ToEpicenter;
            if(FwdDot > 0.707)
            {
                ChosenShake = ExplosionTemplate.CamShake;                
            }
            else
            {
                if(FwdDot > -0.707)
                {
                    RtDot = CamY Dot ToEpicenter;
                    ChosenShake = ((RtDot > 0) ? ExplosionTemplate.CamShake_Right : ExplosionTemplate.CamShake_Left);                    
                }
                else
                {
                    ChosenShake = ExplosionTemplate.CamShake_Rear;
                }
            }
        }
    }
    if(ChosenShake == none)
    {
        ChosenShake = ExplosionTemplate.CamShake;
    }
    return ChosenShake;
}

defaultproperties
{
    begin object name=ImpulseComponent0 class=RB_RadialImpulseComponent
        ReplacementPrimitive=none
    object end
    // Reference: RB_RadialImpulseComponent'Default__GameExplosionActor.ImpulseComponent0'
    RadialImpulseComponent=ImpulseComponent0
    begin object name=ImpulseComponent0 class=RB_RadialImpulseComponent
        ReplacementPrimitive=none
    object end
    // Reference: RB_RadialImpulseComponent'Default__GameExplosionActor.ImpulseComponent0'
    Components(0)=ImpulseComponent0
    CollisionType=ECollisionType.COLLIDE_CustomDefault
}