/*******************************************************************************
 * FracturedStaticMeshActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class FracturedStaticMeshActor extends Actor
    native(Mesh)
    placeable
    hidecategories(Navigation)
    classgroup(StaticMeshes);

struct native DeferredPartToSpawn
{
    var int ChunkIndex;
    var Vector InitialVel;
    var Vector InitialAngVel;
    var float RelativeScale;
    var bool bExplosion;

    structdefaultproperties
    {
        ChunkIndex=0
        InitialVel=(X=0,Y=0,Z=0)
        InitialAngVel=(X=0,Y=0,Z=0)
        RelativeScale=0
        bExplosion=false
    }
};

struct CheckpointRecord
{
    var bool bIsShutdown;
    var array<byte> FragmentVis;

    structdefaultproperties
    {
        bIsShutdown=false
        FragmentVis=none
    }
};

/** Maximum number of rigid body parts to spawn off per actor, per frame */
var() int MaxPartsToSpawnAtOnce;
var() const editconst export editinline FracturedStaticMeshComponent FracturedStaticMeshComponent;
var const export editinline FracturedSkinnedMeshComponent SkinnedComponent;
var array<int> ChunkHealth;
var transient bool bHasShownMissingSoundWarning;
/** If true, detach parts when an Actor with bCanCauseFractureOnTouch contacts them. Actor must not be blocked by this FSMA. */
var() bool bBreakChunksOnActorTouch;
/** whether this should be saved in checkpoints */
var() bool bShouldSaveForCheckpoint;
/** If set, fractures parts are destroyed on any collision */
var(KFFracturedMeshActor) bool bDestroyFragmentsOnImpact;
var transient bool bHasBeenDirtied;
/** Set of damage types that can cause pieces to break off this FSAM. If empty, all damage types can do this. */
var() array< class<DamageType> > FracturedByDamageType;
/** Allows controlling how much 'health' chunks have on a per-instance basis */
var() float ChunkHealthScale;
/** Allows you to override particle effects to play when chunk is hidden for just this actor. */
var() array<ParticleSystem> OverrideFragmentDestroyEffects;
/** Minimum distance from player where actor will ALWAYS fracture, even when outside the view frustum (scaled by global settings.) */
var() float FractureCullMinDistance;
/** Maximum distance from player where actor will be allowed to fracture (scaled by global settings.) */
var() float FractureCullMaxDistance;
var transient array<DeferredPartToSpawn> DeferredPartsToSpawn;
var PhysEffectInfo PartImpactEffect;
var AkBaseSoundObject ExplosionFractureSound;
var AkBaseSoundObject SingleChunkFractureSound;
var transient MaterialInterface MI_LoseChunkPreviousMaterial;

// Export UFracturedStaticMeshActor::execSpawnPart(FFrame&, void* const)
native final simulated function FracturedStaticMeshPart SpawnPart(int ChunkIndex, Vector InitialVel, Vector InitialAngVel, float RelativeScale, bool bExplosion);

// Export UFracturedStaticMeshActor::execSpawnPartMulti(FFrame&, void* const)
native final simulated function FracturedStaticMeshPart SpawnPartMulti(array<int> ChunkIndices, Vector InitialVel, Vector InitialAngVel, float RelativeScale, bool bExplosion);

simulated event PostBeginPlay()
{
    local PhysicalMaterial PhysMat;

    super.PostBeginPlay();
    ResetHealth();
    if(!bBreakChunksOnActorTouch)
    {
        SetTickIsDisabled(true);
    }
    PhysMat = FracturedStaticMeshComponent.GetFracturedMeshPhysMaterial();
    PartImpactEffect = PhysMat.FindPhysEffectInfo(0);
    PhysMat.FindFractureSounds(ExplosionFractureSound, SingleChunkFractureSound);
    ResetVisibility();
}

// Export UFracturedStaticMeshActor::execResetHealth(FFrame&, void* const)
native final simulated function ResetHealth();

function bool ShouldSaveForCheckpoint()
{
    return bShouldSaveForCheckpoint;
}

function CreateCheckpointRecord(out CheckpointRecord Record)
{
    if((Physics == 0) && bHidden)
    {
        Record.bIsShutdown = true;        
    }
    else
    {
        Record.FragmentVis = FracturedStaticMeshComponent.GetVisibleFragments();
    }
}

function ApplyCheckpointRecord(const out CheckpointRecord Record)
{
    if(Record.bIsShutdown)
    {
        ShutDown();        
    }
    else
    {
        FracturedStaticMeshComponent.SetVisibleFragments(Record.FragmentVis);
    }
}

// Export UFracturedStaticMeshActor::execBreakOffIsolatedIslands(FFrame&, void* const)
native simulated event BreakOffIsolatedIslands(out array<byte> FragmentVis, array<int> IgnoreFrags, Vector ChunkDir, array<FracturedStaticMeshPart> DisableCollWithPart, bool bWantPhysChunks);

// Export UFracturedStaticMeshActor::execSpawnDeferredParts(FFrame&, void* const)
native simulated event bool SpawnDeferredParts();

simulated function bool IsFracturedByDamageType(class<DamageType> dmgType)
{
    local int I;

    if(FracturedByDamageType.Length == 0)
    {
        return true;
    }
    I = 0;
    J0x1D:

    if(I < FracturedByDamageType.Length)
    {
        if(dmgType == FracturedByDamageType[I])
        {
            return true;
        }
        ++ I;
        goto J0x1D;
    }
    return false;
}

simulated function bool FractureEffectIsRelevant(bool bForceDedicated, Pawn EffectInstigator, out byte bWantPhysChunksAndParticles)
{
    local bool bResult;
    local PlayerController P;
    local float FinalMinDistance, FinalCullDistance, DistSq;
    local Vector CameraLoc;
    local Rotator CameraRot;

    bResult = true;
    bWantPhysChunksAndParticles = 1;
    if(EffectInstigator == none)
    {
        return true;        
    }
    else
    {
        if(WorldInfo.NetMode == NM_DedicatedServer)
        {
            return bForceDedicated;
        }
        if((WorldInfo.NetMode == NM_ListenServer) && WorldInfo.Game.NumPlayers > 1)
        {
            if(bForceDedicated)
            {
                return true;
            }
            if(((EffectInstigator != none) && EffectInstigator.IsHumanControlled()) && EffectInstigator.IsLocallyControlled())
            {
                return true;
            }            
        }
        else
        {
            if((EffectInstigator != none) && EffectInstigator.IsHumanControlled())
            {
                return true;
            }
        }
        FinalMinDistance = FractureCullMinDistance * WorldInfo.MyFractureManager.GetFSMFractureCullDistanceScale();
        FinalCullDistance = FractureCullMaxDistance * WorldInfo.MyFractureManager.GetFSMFractureCullDistanceScale();
        DistSq = 1E+10;
        foreach LocalPlayerControllers(Class'PlayerController', P)
        {
            P.GetPlayerViewPoint(CameraLoc, CameraRot);
            DistSq = FMin(DistSq, VSizeSq(Location - CameraLoc));            
        }        
        if(DistSq > (FinalCullDistance * FinalCullDistance))
        {
            bResult = false;            
        }
        else
        {
            if(DistSq < (FinalMinDistance * FinalMinDistance))
            {
                return true;
            }
        }
        if(bResult)
        {
            if((WorldInfo.TimeSeconds - LastRenderTime) < 0.5)
            {
                return true;                
            }
            else
            {
                bWantPhysChunksAndParticles = 0;
                return true;
            }            
        }
        else
        {
            bWantPhysChunksAndParticles = 0;
            return false;
        }
    }
}

// Export UFracturedStaticMeshActor::execRemoveDecals(FFrame&, void* const)
protected native final simulated function RemoveDecals(int IndexToRemoveDecalsFrom);

simulated event TakeDamage(int Damage, Controller EventInstigator, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
    local array<byte> FragmentVis;
    local Vector ChunkDir, MomentumDir;
    local FracturedStaticMesh FracMesh;
    local FracturedStaticMeshPart FracPart;
    local array<FracturedStaticMeshPart> NoCollParts;
    local int TotalVisible;
    local array<int> IgnoreFrags;
    local Box ChunkBox;
    local ParticleSystem EffectPSys;
    local float PhysChance, PartScale;
    local byte bWantPhysChunksAndParticles;
    local Pawn InstigatorPawn;
    local WorldFractureSettings FractureSettings;
    local Vector NewHitLocation, HitNormal;

    super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    if(((DamageType != none) && !DamageType.default.bCausesFracture) || !IsFracturedByDamageType(DamageType))
    {
        return;
    }
    if(HitInfo.HitComponent == none)
    {
        if(Momentum == vect(0, 0, 0))
        {
            Momentum = Location - HitLocation;
        }
        TraceComponent(NewHitLocation, HitNormal, FracturedStaticMeshComponent, HitLocation + (float(100) * Normal(Momentum)), HitLocation,, HitInfo, true);
    }
    if(((HitInfo.Item == FracturedStaticMeshComponent.GetCoreFragmentIndex()) || !FracturedStaticMeshComponent.IsFragmentVisible(HitInfo.Item)) || !FracturedStaticMeshComponent.IsFragmentDestroyable(HitInfo.Item))
    {
        return;
    }
    if(EventInstigator != none)
    {
        InstigatorPawn = EventInstigator.Pawn;        
    }
    else
    {
        if(DamageCauser != none)
        {
            InstigatorPawn = DamageCauser.Instigator;
        }
    }
    if(!FractureEffectIsRelevant(false, InstigatorPawn, bWantPhysChunksAndParticles))
    {
        return;
    }
    if(RB_LineImpulseActor(DamageCauser) != none)
    {
        ChunkHealth[HitInfo.Item] = 0;        
    }
    else
    {
        if(DamageType != none)
        {
            ChunkHealth[HitInfo.Item] -= int(WorldInfo.FracturedMeshWeaponDamage * DamageType.default.FracturedMeshDamage);            
        }
        else
        {
            ChunkHealth[HitInfo.Item] -= int(WorldInfo.FracturedMeshWeaponDamage);
        }
    }
    bHasBeenDirtied = true;
    if(ChunkHealth[HitInfo.Item] <= 0)
    {
        FracMesh = FracturedStaticMesh(FracturedStaticMeshComponent.StaticMesh);
        FractureSettings = WorldInfo.GetWorldFractureSettings();
        FragmentVis = FracturedStaticMeshComponent.GetVisibleFragments();
        TotalVisible = FracturedStaticMeshComponent.GetNumVisibleFragments();
        if(Physics == 10)
        {
            if(TotalVisible == 1)
            {
                return;
            }
        }
        if(TotalVisible == FragmentVis.Length)
        {
            SetLoseChunkReplacementMaterial();
        }
        FragmentVis[HitInfo.Item] = 0;
        ChunkDir = FracturedStaticMeshComponent.GetFragmentAverageExteriorNormal(HitInfo.Item);
        MomentumDir = Normal(Momentum);
        if((VSize(ChunkDir) < 0.01) || (MomentumDir Dot ChunkDir) > -0.2)
        {
            ChunkDir += MomentumDir;
        }
        ChunkDir.Z = float(Max(int(ChunkDir.Z), 0));
        ChunkDir.Z /= FracMesh.ChunkLinHorizontalScale;
        ChunkDir = Normal(ChunkDir);
        if(WorldInfo.NetMode != NM_DedicatedServer)
        {
            PhysChance = ((FractureSettings.bEnableChanceOfPhysicsChunkOverride) ? FractureSettings.ChanceOfPhysicsChunkOverride : FracMesh.ChanceOfPhysicsChunk);
            PhysChance *= WorldInfo.MyFractureManager.GetFSMDirectSpawnChanceScale();
            if((((bWantPhysChunksAndParticles == 1) && FracMesh.bSpawnPhysicsChunks) && FRand() < PhysChance) && !FracturedStaticMeshComponent.IsNoPhysFragment(HitInfo.Item))
            {
                PartScale = FracMesh.NormalPhysicsChunkScaleMin + (FRand() * (FracMesh.NormalPhysicsChunkScaleMax - FracMesh.NormalPhysicsChunkScaleMin));
                FracPart = SpawnPart(HitInfo.Item, (ChunkDir * FracMesh.ChunkLinVel) + Velocity, VRand() * FracMesh.ChunkAngVel, PartScale, false);
                if(FracPart != none)
                {
                    FracPart.FracturedStaticMeshComponent.DisableRBCollisionWithSMC(FracturedStaticMeshComponent, true);
                }
            }
            if(bWantPhysChunksAndParticles == 1)
            {
                if(OverrideFragmentDestroyEffects.Length > 0)
                {
                    EffectPSys = OverrideFragmentDestroyEffects[Rand(OverrideFragmentDestroyEffects.Length)];                    
                }
                else
                {
                    if(FracMesh.FragmentDestroyEffects.Length > 0)
                    {
                        EffectPSys = FracMesh.FragmentDestroyEffects[Rand(FracMesh.FragmentDestroyEffects.Length)];
                    }
                }
                if((EffectPSys != none) && WorldInfo.MyFractureManager != none)
                {
                    ChunkBox = FracturedStaticMeshComponent.GetFragmentBox(HitInfo.Item);
                    WorldInfo.MyFractureManager.SpawnChunkDestroyEffect(EffectPSys, ChunkBox, ChunkDir, FracMesh.FragmentDestroyEffectScale, FracturedStaticMeshComponent);
                }
            }
        }
        if((FracMesh.bAlwaysBreakOffIsolatedIslands || FracturedStaticMeshComponent.GetCoreFragmentIndex() == -1) && !FracMesh.bFixIsolatedChunks)
        {
            IgnoreFrags[0] = HitInfo.Item;
            if(FracPart != none)
            {
                NoCollParts[0] = FracPart;
            }
            BreakOffIsolatedIslands(FragmentVis, IgnoreFrags, ChunkDir, NoCollParts, ((bWantPhysChunksAndParticles == 1) ? true : false));
        }
        FracturedStaticMeshComponent.SetVisibleFragments(FragmentVis);
        if(Physics == 10)
        {
            FracturedStaticMeshComponent.RecreatePhysState();
        }
    }
}

simulated event Explode()
{
    local array<byte> FragmentVis;
    local int I;
    local Vector SpawnDir;
    local FracturedStaticMesh FracMesh;
    local FracturedStaticMeshPart FracPart;
    local float PartScale;

    bHasBeenDirtied = true;
    FracMesh = FracturedStaticMesh(FracturedStaticMeshComponent.StaticMesh);
    FragmentVis = FracturedStaticMeshComponent.GetVisibleFragments();
    I = 0;
    J0x71:

    if(I < FragmentVis.Length)
    {
        if((FragmentVis[I] != 0) && I != FracturedStaticMeshComponent.GetCoreFragmentIndex())
        {
            SpawnDir = FracturedStaticMeshComponent.GetFragmentAverageExteriorNormal(I);
            PartScale = FracMesh.ExplosionPhysicsChunkScaleMin + (FRand() * (FracMesh.ExplosionPhysicsChunkScaleMax - FracMesh.ExplosionPhysicsChunkScaleMin));
            FracPart = SpawnPart(I, ((0.5 * SpawnDir) * FracMesh.ChunkLinVel) + Velocity, (0.5 * VRand()) * FracMesh.ChunkAngVel, PartScale, true);
            if(FracPart != none)
            {
                FracPart.FracturedStaticMeshComponent.SetRBCollidesWithChannel(14, false);
            }
            FragmentVis[I] = 0;
        }
        ++ I;
        goto J0x71;
    }
    FracturedStaticMeshComponent.SetVisibleFragments(FragmentVis);
}

// Export UFracturedStaticMeshActor::execBreakOffPartsInRadius(FFrame&, void* const)
native simulated event BreakOffPartsInRadius(Vector Origin, float Radius, float RBStrength, bool bWantPhysChunksAndParticles);

// Export UFracturedStaticMeshActor::execResetVisibility(FFrame&, void* const)
native simulated event ResetVisibility();

simulated event HideOneFragment()
{
    local array<byte> FragmentVis;
    local int I;

    FragmentVis = FracturedStaticMeshComponent.GetVisibleFragments();
    I = 0;
    J0x34:

    if(I < FragmentVis.Length)
    {
        if((FragmentVis[I] != 0) && I != FracturedStaticMeshComponent.GetCoreFragmentIndex())
        {
            FragmentVis[I] = 0;
            FracturedStaticMeshComponent.SetVisibleFragments(FragmentVis);
            bHasBeenDirtied = true;
            return;
        }
        ++ I;
        goto J0x34;
    }
}

simulated event HideFragmentsToMaximizeMemoryUsage()
{
    local array<byte> FragmentVis;
    local int I, Incr;

    Incr = 4;
    FragmentVis = FracturedStaticMeshComponent.GetVisibleFragments();
    I = 0;
    J0x40:

    if(I < FragmentVis.Length)
    {
        if((FragmentVis[I] != 0) && I != FracturedStaticMeshComponent.GetCoreFragmentIndex())
        {
            FragmentVis[I] = 0;
        }
        I += Incr;
        goto J0x40;
    }
    FracturedStaticMeshComponent.SetVisibleFragments(FragmentVis);
}

simulated event SetLoseChunkReplacementMaterial()
{
    local MaterialInterface LoseChunkOutsideMat;
    local FracturedStaticMesh FracMesh;

    if(MI_LoseChunkPreviousMaterial != none)
    {
        return;
    }
    bHasBeenDirtied = true;
    FracMesh = FracturedStaticMesh(FracturedStaticMeshComponent.StaticMesh);
    if(FracturedStaticMeshComponent.LoseChunkOutsideMaterialOverride != none)
    {
        LoseChunkOutsideMat = FracturedStaticMeshComponent.LoseChunkOutsideMaterialOverride;        
    }
    else
    {
        LoseChunkOutsideMat = FracMesh.LoseChunkOutsideMaterial;
    }
    if(LoseChunkOutsideMat != none)
    {
        MI_LoseChunkPreviousMaterial = FracturedStaticMeshComponent.GetMaterial(FracMesh.OutsideMaterialIndex);
        FracturedStaticMeshComponent.SetMaterial(FracMesh.OutsideMaterialIndex, LoseChunkOutsideMat);
    }
}

simulated function NotifyHitByExplosion(Controller InstigatorController, float DamageAmount, class<DamageType> dmgType)
{
    local int Idx;
    local SeqEvent_TakeDamage dmgEvent;

    Idx = 0;
    J0x0B:

    if(Idx < GeneratedEvents.Length)
    {
        dmgEvent = SeqEvent_TakeDamage(GeneratedEvents[Idx]);
        if(dmgEvent != none)
        {
            dmgEvent.HandleDamage(self, InstigatorController, dmgType, int(DamageAmount));
        }
        ++ Idx;
        goto J0x0B;
    }
}

simulated function Reset()
{
    if(!bHasBeenDirtied)
    {
        return;
    }
    bHasBeenDirtied = false;
    ResetVisibility();
    ResetHealth();
    FracturedStaticMeshComponent.SetBlockRigidBody(true);
    if(MI_LoseChunkPreviousMaterial != none)
    {
        FracturedStaticMeshComponent.SetMaterial(FracturedStaticMesh(FracturedStaticMeshComponent.StaticMesh).OutsideMaterialIndex, MI_LoseChunkPreviousMaterial);
        MI_LoseChunkPreviousMaterial = none;
    }
}

defaultproperties
{
    MaxPartsToSpawnAtOnce=6
    begin object name=FracturedStaticMeshComponent0 class=FracturedStaticMeshComponent
        bUseDynamicIBWithHiddenFragments=true
        WireframeColor=(B=255,G=128,R=0,A=255)
        ReplacementPrimitive=none
        bAllowApproximateOcclusion=true
        bForceDirectLightMap=true
    object end
    // Reference: FracturedStaticMeshComponent'Default__FracturedStaticMeshActor.FracturedStaticMeshComponent0'
    FracturedStaticMeshComponent=FracturedStaticMeshComponent0
    begin object name=FracturedSkinnedComponent0 class=FracturedSkinnedMeshComponent
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__FracturedStaticMeshActor.LightEnvironment0'
        bDisableAllRigidBody=true
    object end
    // Reference: FracturedSkinnedMeshComponent'Default__FracturedStaticMeshActor.FracturedSkinnedComponent0'
    SkinnedComponent=FracturedSkinnedComponent0
    ChunkHealthScale=1
    FractureCullMinDistance=512
    FractureCullMaxDistance=4096
    begin object name=FracturedSkinnedComponent0 class=FracturedSkinnedMeshComponent
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__FracturedStaticMeshActor.LightEnvironment0'
        bDisableAllRigidBody=true
    object end
    // Reference: FracturedSkinnedMeshComponent'Default__FracturedStaticMeshActor.FracturedSkinnedComponent0'
    Components(0)=FracturedSkinnedComponent0
    begin object name=FracturedStaticMeshComponent0 class=FracturedStaticMeshComponent
        bUseDynamicIBWithHiddenFragments=true
        WireframeColor=(B=255,G=128,R=0,A=255)
        ReplacementPrimitive=none
        bAllowApproximateOcclusion=true
        bForceDirectLightMap=true
    object end
    // Reference: FracturedStaticMeshComponent'Default__FracturedStaticMeshActor.FracturedStaticMeshComponent0'
    Components(1)=FracturedStaticMeshComponent0
    CollisionType=ECollisionType.COLLIDE_BlockAll
    bNoDelete=true
    bWorldGeometry=true
    bRouteBeginPlayEvenIfStatic=false
    bGameRelevant=true
    bMovable=false
    bCanBeDamaged=true
    BlockRigidBody=true
    bCollideActors=true
    bBlockActors=true
    bProjTarget=true
    bEdShouldSnap=true
    bPathColliding=true
    begin object name=FracturedStaticMeshComponent0 class=FracturedStaticMeshComponent
        bUseDynamicIBWithHiddenFragments=true
        WireframeColor=(B=255,G=128,R=0,A=255)
        ReplacementPrimitive=none
        bAllowApproximateOcclusion=true
        bForceDirectLightMap=true
    object end
    // Reference: FracturedStaticMeshComponent'Default__FracturedStaticMeshActor.FracturedStaticMeshComponent0'
    CollisionComponent=FracturedStaticMeshComponent0
}