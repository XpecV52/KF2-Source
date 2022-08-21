/*******************************************************************************
 * KFImpactEffectManager generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFImpactEffectManager extends Actor
    native(Effect)
    config(Game)
    notplaceable
    hidecategories(Navigation);

var KFImpactEffectInfo DefaultImpactEffects;
var float MaxImpactEffectDistance;
var float MaxDecalRangeSq;
var bool bAlignToSurfaceNormal;
var bool bSuppressSounds;
var globalconfig int MaxImpactEffectDecals;
var transient DecalManager ImpactEffectDecalManager;
var transient AkEvent MostRecentImpactSound;
var transient Vector MostRecentImpactLocation;
var transient float MostRecentImpactTime;
var transient int NumDuplicateImpactSounds;
var float MinRepeatImpactSoundDistanceSq;
var float MinRepeatImpactSoundInterval;
var int MaxDuplicateImpactSounds;

event PostBeginPlay()
{
    super.PostBeginPlay();
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        ImpactEffectDecalManager = Spawn(Class'DecalManager', self,, vect(0, 0, 0), rot(0, 0, 0));
        ImpactEffectDecalManager.MaxActiveDecals = MaxImpactEffectDecals;
    }
}

simulated function PlayImpactEffects(const Vector HitLocation, const Pawn EffectInstigator, optional Vector HitNormal, optional KFImpactEffectInfo CustomImpactEffects, optional bool bWorldImpactsOnly, optional bool bMeleeHit)
{
    local Vector NewHitLoc, FireDir, WaterHitNormal;
    local Actor HitActor;
    local TraceHitInfo HitInfo;
    local MaterialImpactEffect ImpactEffect;
    local KFImpactEffectInfo ImpactEffectInfo;
    local KFFracturedMeshActor FracturedMeshActor;

    ImpactEffectInfo = ((CustomImpactEffects != none) ? CustomImpactEffects : DefaultImpactEffects);
    if(IsZero(HitNormal) && EffectInstigator != none)
    {
        HitNormal = Normal(EffectInstigator.Location - HitLocation);
    }
    FireDir = float(-1) * HitNormal;
    if(ImpactEffectInfo.BulletWhipSnd != none)
    {
        CheckBulletWhip(FireDir, HitLocation, EffectInstigator, ImpactEffectInfo);
    }
    if((EffectInstigator != none) && ImpactEffectIsRelevant(EffectInstigator, HitLocation, false, MaxImpactEffectDistance))
    {
        if(((ImpactEffectInfo.bMakeSplash && !WorldInfo.bDropDetail) && EffectInstigator.IsPlayerPawn()) && EffectInstigator.IsLocallyControlled())
        {
            HitActor = Trace(NewHitLoc, WaterHitNormal, HitLocation, EffectInstigator.Location + (EffectInstigator.EyeHeight * vect(0, 0, 1)), true,, HitInfo, 2 | 1);
            if(WaterVolume(HitActor) != none)
            {
                WorldInfo.MyEmitterPool.SpawnEmitter(ImpactEffectInfo.SplashEffectTemplate, NewHitLoc, rotator(vect(0, 0, 1)));
            }
        }
        HitActor = EffectInstigator.Trace(NewHitLoc, HitNormal, HitLocation - (HitNormal * float(32)), HitLocation + (HitNormal * float(32)), !bWorldImpactsOnly,, HitInfo, 1);
        if(((HitActor != none) && HitActor.bCanBeDamaged) && HitActor.IsA('Pawn'))
        {
            return;
        }
        if((((WorldInfo.NetMode == NM_Client) && HitActor != none) && HitActor.bCanBeDamaged) && !EffectInstigator.IsLocallyControlled())
        {
            FracturedMeshActor = KFFracturedMeshActor(HitActor);
            if(FracturedMeshActor != none)
            {
                if(bMeleeHit)
                {
                    Class'KFMeleeHelperBase'.static.MeleeFractureMeshImpact(FracturedMeshActor, HitLocation, HitNormal);                    
                }
                else
                {
                    FracturedMeshActor.SimulateRemoteHit(HitLocation, HitNormal, HitInfo);
                }
            }
        }
        GetImpactEffect(HitInfo.PhysMaterial, ImpactEffect, ImpactEffectInfo);
        if(ImpactEffect == ImpactEffectInfo.DefaultImpactEffect && HitInfo.PhysMaterial != none)
        {
            if(HitInfo.PhysMaterial.ImpactEffect != none)
            {
                ImpactEffect.ParticleTemplate = HitInfo.PhysMaterial.ImpactEffect;
            }
            if(HitInfo.PhysMaterial.ImpactSound != none)
            {
                ImpactEffect.Sound = HitInfo.PhysMaterial.ImpactSound;
            }
        }
        if(((HitActor != none) && (Pawn(HitActor) == none) || Vehicle(HitActor) != none) && AllowImpactEffects(HitActor, HitLocation, HitNormal))
        {
            if(ImpactEffect.ParticleTemplate != none)
            {
                if(!bAlignToSurfaceNormal)
                {
                    HitNormal = Normal(FireDir - ((float(2) * HitNormal) * (FireDir Dot HitNormal)));
                }
                WorldInfo.MyEmitterPool.SpawnEmitter(ImpactEffect.ParticleTemplate, HitLocation, rotator(HitNormal), HitActor);
            }
            if(((!WorldInfo.bDropDetail && Pawn(HitActor) == none) && (EffectInstigator != none) && VSizeSq(EffectInstigator.Location - HitLocation) < MaxDecalRangeSq) && ((WorldInfo.GetDetailMode() != 0) && !Class'Engine'.static.IsSplitScreen()) || EffectInstigator.IsLocallyControlled() && EffectInstigator.IsHumanControlled())
            {
                SpawnImpactDecal(HitLocation, HitNormal, HitActor, ImpactEffect, HitInfo);
            }
        }
        if(ShouldPlayImpactSound(ImpactEffect.Sound, HitLocation))
        {
            PlayImpactSound(EffectInstigator, HitLocation, FireDir, HitActor, ImpactEffect.Sound, ImpactEffectInfo);
        }
    }
}

simulated function bool ShouldPlayImpactSound(AkBaseSoundObject HitSound, Vector HitLocation)
{
    if((HitSound == none) || bSuppressSounds)
    {
        return false;
    }
    if(((HitSound != MostRecentImpactSound) || VSizeSq(HitLocation - MostRecentImpactLocation) > MinRepeatImpactSoundDistanceSq) || (WorldInfo.TimeSeconds - MostRecentImpactTime) > MinRepeatImpactSoundInterval)
    {
        MostRecentImpactSound = AkEvent(HitSound);
        MostRecentImpactLocation = HitLocation;
        MostRecentImpactTime = WorldInfo.TimeSeconds;
        NumDuplicateImpactSounds = 0;
        return true;
    }
    if((NumDuplicateImpactSounds + 1) <= MaxDuplicateImpactSounds)
    {
        NumDuplicateImpactSounds += 1;
        return true;
    }
    return false;
}

simulated function PlayImpactSound(Pawn EffectInstigator, Vector HitLocation, Vector FireDir, Actor HitActor, AkBaseSoundObject ImpactSound, KFImpactEffectInfo ImpactEffectInfo)
{
    local Vehicle V;

    V = Vehicle(HitActor);
    if(((V != none) && V.IsLocallyControlled()) && V.IsHumanControlled())
    {
        PlayerController(V.Controller).PlaySoundBase(ImpactSound, true);        
    }
    else
    {
        PlaySoundBase(ImpactSound, true,,, HitLocation);
    }
}

simulated function CheckBulletWhip(Vector FireDir, Vector HitLocation, Pawn EffectInstigator, KFImpactEffectInfo ImpactEffectInfo)
{
    local KFPlayerController PC;

    foreach LocalPlayerControllers(Class'KFPlayerController', PC)
    {
        if(!WorldInfo.GRI.OnSameTeam(Owner, PC))
        {
            PC.CheckBulletWhip(ImpactEffectInfo.BulletWhipSnd, EffectInstigator.Location, FireDir, HitLocation, EffectInstigator);
        }        
    }    
}

simulated function SpawnImpactDecal(Vector HitLocation, Vector HitNormal, Actor HitActor, const out MaterialImpactEffect ImpactEffect, optional TraceHitInfo HitInfo)
{
    local MaterialInterface MI;
    local MaterialInstanceTimeVarying MITV_Decal;
    local int DecalMaterialsLength;
    local float DecalSize;

    DecalMaterialsLength = ImpactEffect.DecalMaterials.Length;
    if(DecalMaterialsLength > 0)
    {
        MI = ImpactEffect.DecalMaterials[Rand(DecalMaterialsLength)];
        if(MI != none)
        {
            DecalSize = RandRange(ImpactEffect.DecalMinSize, ImpactEffect.DecalMaxSize);
            if(MaterialInstanceTimeVarying(MI) != none)
            {
                if(Terrain(HitActor) == none)
                {
                    MITV_Decal = new (self) Class'MaterialInstanceTimeVarying';
                    MITV_Decal.SetParent(MI);
                    ImpactEffectDecalManager.SpawnDecal(MITV_Decal, HitLocation, rotator(-HitNormal), DecalSize, DecalSize, 10, false, ((ImpactEffect.bNoDecalRotation) ? 0 : FRand() * 360), HitInfo.HitComponent, true, false, HitInfo.BoneName, HitInfo.Item, HitInfo.LevelIndex);
                    MITV_Decal.SetScalarStartTime(ImpactEffect.DecalDissolveParamName, ImpactEffect.DecalDuration);
                }                
            }
            else
            {
                ImpactEffectDecalManager.SpawnDecal(MI, HitLocation, rotator(-HitNormal), DecalSize, DecalSize, 10, false, ((ImpactEffect.bNoDecalRotation) ? 0 : FRand() * 360), HitInfo.HitComponent, true, false, HitInfo.BoneName, HitInfo.Item, HitInfo.LevelIndex, ImpactEffect.DecalDuration);
            }
        }
    }
}

static simulated function GetImpactEffect(PhysicalMaterial HitMaterial, out MaterialImpactEffect out_ImpactEffect, KFImpactEffectInfo ImpactEffectInfo)
{
    local int I;
    local KFPhysicalMaterialProperty PhysicalProperty;

    if(HitMaterial != none)
    {
        PhysicalProperty = KFPhysicalMaterialProperty(HitMaterial.GetPhysicalMaterialProperty(Class'KFPhysicalMaterialProperty'));
    }
    if(PhysicalProperty != none)
    {
        I = ImpactEffectInfo.ImpactEffects.Find('MaterialType', PhysicalProperty.MaterialType;
        if(I != -1)
        {
            out_ImpactEffect = ImpactEffectInfo.ImpactEffects[I];
            return;
        }
    }
    out_ImpactEffect = ImpactEffectInfo.DefaultImpactEffect;
}

simulated function bool AllowImpactEffects(Actor HitActor, Vector HitLocation, Vector HitNormal)
{
    return !WorldInfo.bDropDetail && PortalTeleporter(HitActor) == none;
}

simulated function PlayMeleeImpact(ImpactInfo Impact, Pawn EffectInstigator, KFWeapon InstigatorWeap, AkEvent HitWorldSound, AkEvent HitPawnSound, CameraShake Shake);

defaultproperties
{
    DefaultImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Light_bullet_impact'
    MaxImpactEffectDistance=4000
    MaxDecalRangeSq=4E+08
    bAlignToSurfaceNormal=true
    MaxImpactEffectDecals=20
    MinRepeatImpactSoundDistanceSq=10000
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    bTickIsDisabled=true
}