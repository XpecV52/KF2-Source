/*******************************************************************************
 * KFRepairableActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFRepairableActor extends KFWeldableActor
    native
    placeable
    hidecategories(Navigation,Collision,Physics,Object,Mobile);

var KFRepairableActorTrigger RepairTrigger;
var() const StaticMesh RepairedMesh;
var() const StaticMesh BrokenMesh;
var() export editinline StaticMeshComponent RepairableActorMesh;
var() export editinline StaticMeshComponent WeldComponent;
var() FXTemplate BreakingEmitterTemplate;
var() FXTemplate BrokenEmitterTemplate;
var export editinline ParticleSystemComponent BrokenEmitter;
var() array<AkEvent> ActivationSoundEvents;
var() array<AkEvent> CompletionSoundEvents;
var() array<AkEvent> ResetSoundEvents;
var() Vector IconLocationOffset;
var transient bool bRepairComplete;
var delegate<OnRepairCompelete> __OnRepairCompelete__Delegate;

delegate OnRepairCompelete(KFRepairableActor RepairedActor);

// Export UKFRepairableActor::execSetupComponents(FFrame&, void* const)
private native final simulated function SetupComponents();

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    SetupComponents();
    InitializeRepairableActorMIC();
    InitializeIntegrityMIC();
    Reset();
}

simulated function InitializeIntegrityMIC()
{
    if((WeldComponent != none) && WeldComponent.GetMaterial(0) != none)
    {
        IntegrityMIC = WeldComponent.CreateAndSetMaterialInstanceConstant(0);
        IntegrityMIC.SetScalarParameterValue('Weld', 0);
        UpdateIntegrityMIC();
    }
}

simulated function InitializeRepairableActorMIC()
{
    local int MaterialIndex;
    local MaterialInstanceConstant NewMIC;

    if(WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    if(RepairableActorMesh == none)
    {
        return;
    }
    MaterialIndex = 0;
    J0x47:

    if(MaterialIndex < RepairableActorMesh.GetNumElements())
    {
        if(RepairableActorMesh.GetMaterial(MaterialIndex) != none)
        {
            NewMIC = new Class'MaterialInstanceConstant';
            NewMIC.SetParent(RepairableActorMesh.GetMaterial(MaterialIndex));
            RepairableActorMesh.SetMaterial(MaterialIndex, NewMIC);
        }
        ++ MaterialIndex;
        goto J0x47;
    }
}

simulated function InitializeWeldableComponent()
{
    WeldableComponent.SetOwner(self);
    WeldableComponent.MaxWeldIntegrity = MaxWeldIntegrity;
    WeldableComponent.bWeldable = true;
    WeldableComponent.__Delegate_OnWeldIntegrityChanged__Delegate = OnWeldCompWeldIntegrityChanged;
    WeldableComponent.SetCollisionCylinderSize(200, 200);
}

simulated function OnWeldCompWeldIntegrityChanged(int Amount, KFPawn Welder)
{
    if(Role == ROLE_Authority)
    {
        FastenWeld(Amount, Welder);        
    }
    else
    {
        WeldIntegrity = WeldableComponent.WeldIntegrity;
        UpdateIntegrityMIC();
    }
}

function Repair(float Amount, optional KFPawn Welder)
{
    FastenWeld(int(Amount), Welder);
}

function FastenWeld(int Amount, optional KFPawn Welder)
{
    if((Amount > 0) && WeldIntegrity < MaxWeldIntegrity)
    {
        UpdateWeldIntegrity(Amount);
        if(!BeingUnwelded())
        {
            if(!BeingWelded())
            {
                WelderPawn = Welder;
            }
        }
        if(WelderPawn == Welder)
        {
            LastWeldTime = WorldInfo.TimeSeconds;
        }
    }
    if(WeldIntegrity >= MaxWeldIntegrity)
    {
        CompleteRepair();
    }
}

simulated function PlayDestroyed()
{
    local AkEvent ActivationSound;

    if(Role == ROLE_Authority)
    {
        bIsDestroyed = true;
        bWasRepaired = false;
        bRepairComplete = false;
        UpdateWeldIntegrity(-WeldIntegrity);
        WeldableComponent.SetDestroyed(true);
        WeldableComponent.SetWeldIntegrity(0);
        foreach ActivationSoundEvents(ActivationSound,)
        {
            PlaySoundBase(ActivationSound,, WorldInfo.NetMode == NM_DedicatedServer);            
        }        
    }
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(RepairableActorMesh != none)
        {
            RepairableActorMesh.SetStaticMesh(BrokenMesh);
        }
        if(BreakingEmitterTemplate.ParticleTemplate != none)
        {
            WorldInfo.MyEmitterPool.SpawnEmitter(BreakingEmitterTemplate.ParticleTemplate, Location + BreakingEmitterTemplate.RelativeOffset, BreakingEmitterTemplate.RelativeRotation);
        }
        if(BrokenEmitterTemplate.ParticleTemplate != none)
        {
            BrokenEmitter = WorldInfo.MyEmitterPool.SpawnEmitter(BrokenEmitterTemplate.ParticleTemplate, Location + BrokenEmitterTemplate.RelativeOffset, BrokenEmitterTemplate.RelativeRotation);
        }
    }
}

simulated function CompleteRepair()
{
    if(Role == ROLE_Authority)
    {
        bRepairComplete = true;
        bForceNetUpdate = true;
    }
    Reset();
    if(RepairFXTemplate.ParticleTemplate != none)
    {
        WorldInfo.MyEmitterPool.SpawnEmitter(RepairFXTemplate.ParticleTemplate, Location + RepairFXTemplate.RelativeOffset);
    }
    OnRepairCompelete(self);
}

simulated function Reset()
{
    local AkEvent CompletionSound, ResetSound;

    if(Role == ROLE_Authority)
    {
        WeldIntegrity = MaxWeldIntegrity;
        bIsDestroyed = false;
        bWasRepaired = true;
        WeldableComponent.SetWeldIntegrity(MaxWeldIntegrity);
        WeldableComponent.SetDestroyed(false);
        if(bRepairComplete)
        {
            foreach CompletionSoundEvents(CompletionSound,)
            {
                PlaySoundBase(CompletionSound,, WorldInfo.NetMode == NM_DedicatedServer);                
            }                        
        }
        else
        {
            foreach ResetSoundEvents(ResetSound,)
            {
                PlaySoundBase(ResetSound,, WorldInfo.NetMode == NM_DedicatedServer);                
            }            
        }
    }
    if(BrokenEmitter != none)
    {
        BrokenEmitter.DeactivateSystem();
        BrokenEmitter = none;
    }
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(RepairableActorMesh != none)
        {
            RepairableActorMesh.SetStaticMesh(RepairedMesh);
        }
    }
}

simulated function UpdateIntegrityMIC()
{
    local float IntegrityScalar;

    if(IntegrityMIC != none)
    {
        if(WeldIntegrity > 0)
        {
            IntegrityScalar = float(WeldIntegrity) / float(MaxWeldIntegrity);            
        }
        else
        {
            IntegrityScalar = 0;
        }
        IntegrityMIC.SetScalarParameterValue('Weld', IntegrityScalar);
        if(WeldComponent != none)
        {
            if(WeldComponent.HiddenGame && WeldIntegrity > 0)
            {
                WeldComponent.SetHidden(false);                
            }
            else
            {
                WeldComponent.SetHidden(true);
            }
        }
    }
}

defaultproperties
{
    begin object name=StaticMeshComponent0 class=StaticMeshComponent
        ReplacementPrimitive=none
        RBChannel=ERBCollisionChannel.RBCC_GameplayPhysics
        bAllowApproximateOcclusion=true
        bForceDirectLightMap=true
        bUsePrecomputedShadows=true
        RBCollideWithChannels=(Default=true,GameplayPhysics=true,EffectPhysics=true,Pickup=true,FlexAsset=false)
    object end
    // Reference: StaticMeshComponent'Default__KFRepairableActor.StaticMeshComponent0'
    RepairableActorMesh=StaticMeshComponent0
    begin object name=StaticMeshComponent1 class=StaticMeshComponent
        ReplacementPrimitive=none
        bAllowApproximateOcclusion=true
        bForceDirectLightMap=true
        bUsePrecomputedShadows=true
        CollideActors=false
        BlockRigidBody=false
    object end
    // Reference: StaticMeshComponent'Default__KFRepairableActor.StaticMeshComponent1'
    WeldComponent=StaticMeshComponent1
    BreakingEmitterTemplate=(ParticleTemplate=ParticleSystem'FX_Gore_EMIT_THREE.FX_HeadExplode_dh_px',RelativeOffset=(X=0,Y=0,Z=0),RelativeRotation=(Pitch=0,Yaw=0,Roll=0))
    BrokenEmitterTemplate=(ParticleTemplate=ParticleSystem'FX_Environmental_EMIT_THREE.FX_Carnival_Electric_Malfunction_01',RelativeOffset=(X=0,Y=0,Z=0),RelativeRotation=(Pitch=0,Yaw=0,Roll=0))
    MaxWeldIntegrity=1500
    RepairFXTemplate=(ParticleTemplate=ParticleSystem'FX_Environmental_EMIT_THREE.FX_Carnival_Game_Entry_01')
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    bNoDelete=true
    bTickIsDisabled=true
    bWorldGeometry=true
    bCanStepUpOn=false
    bAlwaysRelevant=true
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    bReplicateRigidBodyLocation=true
    bMovable=false
    bCollideActors=true
    bBlockActors=true
    bEdShouldSnap=true
    bIgnoreNetRelevancyCollision=true
    NetUpdateFrequency=0.1
}