/*******************************************************************************
 * KFObjectiveCollectActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFObjectiveCollectActor extends Actor
    placeable
    hidecategories(Navigation)
    implements(KFInterface_UsableTriggerTarget);

enum ECollectibleState
{
    ECollectibleState_None,
    ECollectibleState_Carried,
    ECollectibleState_Dropped,
    ECollectibleState_Delivered,
    ECollectibleState_MAX
};

var repnotify transient KFMapObjective_CollectActors ObjectiveOwner;
var() export editinline StaticMeshComponent CollectActorMesh;
var() AkEvent CollectedSoundEvent;
var() ParticleSystem CollectedParticleSystem;
/** Carryable object to give the player upon collecting this actor. Carryable collectibles must be delivered to be considered collected. */
var() class<KFCarryableObject> CarryableClass;
var repnotify transient bool bCollected;
var repnotify transient bool bActive;
var repnotify transient KFObjectiveCollectActor.ECollectibleState CollectibleState;

replication
{
     if(bNetDirty)
        CollectibleState, ObjectiveOwner, 
        bActive, bCollected;
}

simulated function UpdateActivity()
{
    if(bActive && ObjectiveOwner != none)
    {
        ObjectiveOwner.ResetCollectReminder();
    }
    SetEnabled(bActive);
}

simulated function SetEnabled(bool bEnabled)
{
    SetHidden(!bEnabled);
    SetCollision(bEnabled, bEnabled);
}

simulated function SetActive(bool shouldBeActive)
{
    if(shouldBeActive != bActive)
    {
        bActive = shouldBeActive;
        if(bActive)
        {
            if(ObjectiveOwner != none)
            {
                ObjectiveOwner.ResetCollectReminder();
            }
            OnKismetEvent(0);
        }
    }
}

simulated function TriggerTarget(KFUsableTrigger Trigger, Pawn Triggerer)
{
    local KFCarryableObject_Collectible itemCreated;
    local KFInventoryManager KFIM;
    local Inventory existingCarryable;

    if(Role == ROLE_Authority)
    {
        KFIM = KFInventoryManager(Triggerer.InvManager);
        if((CarryableClass != none) && KFIM != none)
        {
            if(!KFIM.ClassIsInInventory(CarryableClass, existingCarryable))
            {
                ObjectiveOwner.OnCollectActor(self);
                itemCreated = KFCarryableObject_Collectible(Triggerer.CreateInventory(CarryableClass));
                if(itemCreated != none)
                {
                    itemCreated.ParentCollectActor = self;
                    itemCreated.UpdateReplicationInfo(true);
                    SetCollectibleState(1);
                    OnCollected();
                    bCollected = true;
                    bActive = false;
                    bForceNetUpdate = true;
                    if(Trigger.MaxTriggeredCount == 0)
                    {
                        Trigger.bActive = false;
                    }
                }
            }
        }
    }
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'bCollected')
    {
        if(bCollected)
        {
            OnCollected();
        }        
    }
    else
    {
        if(VarName == 'bActive')
        {
            UpdateActivity();
            if(bActive)
            {
                OnKismetEvent(0);
            }            
        }
        else
        {
            if(VarName == 'CollectibleState')
            {
                CollectibleStateUpdated();                
            }
            else
            {
                super.ReplicatedEvent(VarName);
            }
        }
    }
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetEnabled(bActive);
}

simulated function OnCollected()
{
    PlaySoundBase(CollectedSoundEvent, true);
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        WorldInfo.MyEmitterPool.SpawnEmitter(CollectedParticleSystem, Location);
    }
    SetEnabled(false);
}

simulated function OnCarryableDropped()
{
    if(ObjectiveOwner != none)
    {
        ObjectiveOwner.OnCarryableDropped(self);
    }
    SetCollectibleState(2);
    OnKismetEvent(1);
}

simulated function DestroyingChildCarryable()
{
    if(ObjectiveOwner != none)
    {
        SetCollectibleState(0);
        ObjectiveOwner.RespawnCollectible(self);
    }
}

simulated function OnKismetEvent(int EventType)
{
    local int I;
    local array<int> OutputLinksToActivate;
    local KFSeqEvent_CollectTrigger ProgressEvent;

    OutputLinksToActivate.AddItem(EventType;
    I = 0;
    J0x21:

    if(I < GeneratedEvents.Length)
    {
        ProgressEvent = KFSeqEvent_CollectTrigger(GeneratedEvents[I]);
        if(ProgressEvent != none)
        {
            ProgressEvent.Reset();
            ProgressEvent.CheckActivate(self, self,, OutputLinksToActivate);
        }
        ++ I;
        goto J0x21;
    }
}

simulated function CollectibleStateUpdated()
{
    switch(CollectibleState)
    {
        case 1:
            if(ObjectiveOwner != none)
            {
                ObjectiveOwner.ClearCollectReminder();
            }
            OnKismetEvent(2);
            break;
        case 2:
            if(ObjectiveOwner != none)
            {
                ObjectiveOwner.ResetCollectReminder();
            }
            OnKismetEvent(1);
            break;
        case 3:
            OnKismetEvent(3);
            break;
        default:
            break;
    }
}

simulated function SetCollectibleState(KFObjectiveCollectActor.ECollectibleState ColState)
{
    CollectibleState = ColState;
    bForceNetUpdate = true;
    CollectibleStateUpdated();
}

defaultproperties
{
    begin object name=StaticMeshComponent0 class=StaticMeshComponent
        StaticMesh=StaticMesh'ENV_Collectible_MESH.Env_Dosh_Collectible'
        ReplacementPrimitive=none
        RBChannel=ERBCollisionChannel.RBCC_GameplayPhysics
        bAllowApproximateOcclusion=true
        bForceDirectLightMap=true
        bUsePrecomputedShadows=true
        RBCollideWithChannels=(Default=true,GameplayPhysics=true,EffectPhysics=true,Pickup=true,FlexAsset=false)
    object end
    // Reference: StaticMeshComponent'Default__KFObjectiveCollectActor.StaticMeshComponent0'
    CollectActorMesh=StaticMeshComponent0
    begin object name=StaticMeshComponent0 class=StaticMeshComponent
        StaticMesh=StaticMesh'ENV_Collectible_MESH.Env_Dosh_Collectible'
        ReplacementPrimitive=none
        RBChannel=ERBCollisionChannel.RBCC_GameplayPhysics
        bAllowApproximateOcclusion=true
        bForceDirectLightMap=true
        bUsePrecomputedShadows=true
        RBCollideWithChannels=(Default=true,GameplayPhysics=true,EffectPhysics=true,Pickup=true,FlexAsset=false)
    object end
    // Reference: StaticMeshComponent'Default__KFObjectiveCollectActor.StaticMeshComponent0'
    Components(0)=StaticMeshComponent0
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    bStatic=true
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
    SupportedEvents=/* Array type was not detected. */
}