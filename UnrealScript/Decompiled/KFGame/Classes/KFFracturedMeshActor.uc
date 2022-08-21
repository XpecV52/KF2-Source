/*******************************************************************************
 * KFFracturedMeshActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFFracturedMeshActor extends FracturedStaticMeshActor
    native(Effect);

/** type of networking to use */
var() KFDestructibleActor.EDestructibleRepType ReplicationMode;
var const byte VulnerableMultiplier;
/** Amount of damage this actor can take before fully collapsing */
var() int TotalHealth;
var transient int DefaultTotalHealth;
/** Light brightness material parameter for this subobject */
var() MaterialLightParamMod MaterialLightParams;
/** When health reaches zero, should spawn FracturedMeshParts */
var() bool bSpawnPartsWhenDestroyed;
var repnotify transient bool bHasBeenDestroyed;
var repnotify transient bool bHasLostChunk;
var const array< class<DamageType> > VulnerableDamageType;

replication
{
     if(bNetDirty)
        bHasBeenDestroyed, bHasLostChunk;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'bHasBeenDestroyed')
    {
        if(bHasBeenDestroyed)
        {
            BreakOffAllFragments();
        }        
    }
    else
    {
        if(VarName == 'bHasLostChunk')
        {
            if(bHasLostChunk)
            {
                SetLoseChunkReplacementMaterial();
            }
        }
    }
}

simulated event PreBeginPlay()
{
    if(WorldInfo.NetMode == NM_Client)
    {
        Role = ((ReplicationMode == 2) ? 3 : 1);        
    }
    else
    {
        RemoteRole = ((ReplicationMode == 2) ? 0 : 1);
    }
    DefaultTotalHealth = TotalHealth;
    super(Actor).PreBeginPlay();
}

simulated event TakeDamage(int Damage, Controller EventInstigator, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
    local Vector HitDir, HitNormal;

    if(bHasBeenDestroyed)
    {
        return;
    }
    if((HitInfo.HitComponent == none) || HitInfo.Item == -1)
    {
        if(Momentum == vect(0, 0, 0))
        {
            Momentum = Location - HitLocation;
        }
        HitDir = Normal(Momentum);
        TraceComponent(HitLocation, HitNormal, FracturedStaticMeshComponent, HitLocation + (float(50) * HitDir), HitLocation - (float(50) * HitDir),, HitInfo, true);
    }
    if(IsVulnerableTo(DamageType))
    {
        Damage *= float(VulnerableMultiplier);
    }
    super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    if(Role == ROLE_Authority)
    {
        TotalHealth -= Damage;
        if(TotalHealth <= 0)
        {
            BreakOffAllFragments();
        }
    }
}

function bool IsVulnerableTo(class<DamageType> DT)
{
    local int Idx;

    Idx = 0;
    J0x0B:

    if(Idx < VulnerableDamageType.Length)
    {
        if(ClassIsChildOf(DT, VulnerableDamageType[Idx]))
        {
            return true;
        }
        ++ Idx;
        goto J0x0B;
    }
    return false;
}

simulated function bool FractureEffectIsRelevant(bool bForceDedicated, Pawn EffectInstigator, out byte bWantPhysChunksAndParticles)
{
    local bool bResult;

    if((RemoteRole == ROLE_SimulatedProxy) && !bHasLostChunk)
    {
        bResult = super.FractureEffectIsRelevant(true, EffectInstigator, bWantPhysChunksAndParticles);
        if(bResult && (WorldInfo.TimeSeconds - LastRenderTime) > 0.5)
        {
            bWantPhysChunksAndParticles = 0;
        }
        return bResult;
    }
    return super.FractureEffectIsRelevant(bForceDedicated, EffectInstigator, bWantPhysChunksAndParticles);
}

simulated event SetLoseChunkReplacementMaterial()
{
    super.SetLoseChunkReplacementMaterial();
    if(!bHasLostChunk)
    {
        bHasLostChunk = true;
        if(WorldInfo.NetMode != NM_Client)
        {
            bNetDirty = true;
            bForceNetUpdate = true;
        }
    }
}

simulated function BreakOffAllFragments(optional Vector InVelocity)
{
    local array<byte> FragmentVis;
    local int I, NumPartsHidden;
    local Vector SpawnDir;
    local FracturedStaticMesh FracMesh;
    local FracturedStaticMeshPart FracPart;
    local float PartScale;
    local bool bWantPhysChunksAndParticles;

    bHasBeenDirtied = true;
    bHasBeenDestroyed = true;
    bForceNetUpdate = true;
    if(ReplicationMode != 2)
    {
        SetCollision(,, false);
    }
    FracturedStaticMeshComponent.SetBlockRigidBody(false);
    bWantPhysChunksAndParticles = bSpawnPartsWhenDestroyed && ActorEffectIsRelevant(none, false);
    FracMesh = FracturedStaticMesh(FracturedStaticMeshComponent.StaticMesh);
    FragmentVis = FracturedStaticMeshComponent.GetVisibleFragments();
    I = 0;
    J0xEC:

    if(I < FragmentVis.Length)
    {
        if(((FragmentVis[I] != 0) && I != FracturedStaticMeshComponent.GetCoreFragmentIndex()) && FracturedStaticMeshComponent.IsFragmentDestroyable(I))
        {
            if(((bWantPhysChunksAndParticles && FracMesh.bSpawnPhysicsChunks) && WorldInfo.GetDetailMode() > 0) && !WorldInfo.bDropDetail)
            {
                SpawnDir = FracturedStaticMeshComponent.GetFragmentAverageExteriorNormal(I);
                PartScale = FracMesh.ExplosionPhysicsChunkScaleMin + (FRand() * (FracMesh.ExplosionPhysicsChunkScaleMax - FracMesh.ExplosionPhysicsChunkScaleMin));
                FracPart = SpawnPart(I, (((0.5 * SpawnDir) * FracMesh.ChunkLinVel) + Velocity) + InVelocity, (0.5 * VRand()) * FracMesh.ChunkAngVel, PartScale, true);
                if(FracPart != none)
                {
                    FracPart.FracturedStaticMeshComponent.SetRBCollidesWithChannel(14, false);
                }
            }
            ++ NumPartsHidden;
            FragmentVis[I] = 0;
        }
        ++ I;
        goto J0xEC;
    }
    SetLoseChunkReplacementMaterial();
    if(bWantPhysChunksAndParticles && NumPartsHidden > 0)
    {
        PlayBreakOffAllParticles(FracMesh);
    }
    FracturedStaticMeshComponent.SetVisibleFragments(FragmentVis);
    if(ExplosionFractureSound != none)
    {
        PlaySoundBase(ExplosionFractureSound);
    }
}

simulated event BreakOffPartsInRadius(Vector Origin, float Radius, float RBStrength, bool bWantPhysChunksAndParticles)
{
    super.BreakOffPartsInRadius(Origin, Radius, RBStrength, bWantPhysChunksAndParticles);
    SetLoseChunkReplacementMaterial();
}

simulated function PlayBreakOffAllParticles(FracturedStaticMesh FracMesh)
{
    local ParticleSystem EffectPSys;
    local Box MeshBox;

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
        MeshBox.Min = FracturedStaticMeshComponent.Bounds.Origin - FracturedStaticMeshComponent.Bounds.BoxExtent;
        MeshBox.Max = FracturedStaticMeshComponent.Bounds.Origin + FracturedStaticMeshComponent.Bounds.BoxExtent;
        WorldInfo.MyFractureManager.SpawnChunkDestroyEffect(EffectPSys, MeshBox, vect(0, 0, 0), FracMesh.FragmentDestroyEffectScale, FracturedStaticMeshComponent);
    }
}

simulated function SimulateRemoteHit(Vector HitLocation, Vector Momentum, const out TraceHitInfo HitInfo)
{
    if(bHasLostChunk)
    {
        TakeDamage(0, none, HitLocation, Momentum, Class'KFDamageType', HitInfo);
    }
}

simulated function Reset()
{
    if(!bHasBeenDirtied)
    {
        return;
    }
    super.Reset();
    bHasBeenDestroyed = false;
    bHasLostChunk = false;
    bForceNetUpdate = true;
    bNetDirty = true;
    if(ReplicationMode != 2)
    {
        SetCollision(,, true);
    }
    TotalHealth = DefaultTotalHealth;
}

defaultproperties
{
    VulnerableMultiplier=6
    TotalHealth=5000
    MaterialLightParams=(MatID=0,ParamName=BrightnessMultiplier,LightActor=none)
    bSpawnPartsWhenDestroyed=true
    begin object name=FracturedStaticMeshComponent0 class=FracturedStaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: FracturedStaticMeshComponent'Default__KFFracturedMeshActor.FracturedStaticMeshComponent0'
    FracturedStaticMeshComponent=FracturedStaticMeshComponent0
    begin object name=FracturedSkinnedComponent0 class=FracturedSkinnedMeshComponent
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__KFFracturedMeshActor.LightEnvironment0'
    object end
    // Reference: FracturedSkinnedMeshComponent'Default__KFFracturedMeshActor.FracturedSkinnedComponent0'
    SkinnedComponent=FracturedSkinnedComponent0
    FractureCullMaxDistance=100000
    begin object name=FracturedSkinnedComponent0 class=FracturedSkinnedMeshComponent
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__KFFracturedMeshActor.LightEnvironment0'
    object end
    // Reference: FracturedSkinnedMeshComponent'Default__KFFracturedMeshActor.FracturedSkinnedComponent0'
    Components(0)=FracturedSkinnedComponent0
    begin object name=FracturedStaticMeshComponent0 class=FracturedStaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: FracturedStaticMeshComponent'Default__KFFracturedMeshActor.FracturedStaticMeshComponent0'
    Components(1)=FracturedStaticMeshComponent0
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.Ambientcreatures'
        ReplacementPrimitive=none
        HiddenGame=true
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
    object end
    // Reference: SpriteComponent'Default__KFFracturedMeshActor.Sprite'
    Components(2)=Sprite
    bAlwaysRelevant=true
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=0.1
    begin object name=FracturedStaticMeshComponent0 class=FracturedStaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: FracturedStaticMeshComponent'Default__KFFracturedMeshActor.FracturedStaticMeshComponent0'
    CollisionComponent=FracturedStaticMeshComponent0
}