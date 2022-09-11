/*******************************************************************************
 * KFTrigger_PowerUp generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFTrigger_PowerUp extends Trigger_PawnsOnly
    hidecategories(Navigation)
    implements(KFInterface_Usable);

enum EPowerUp_Type
{
    EPowerUp_HellishRage,
    EPowerUp_MAX
};

var repnotify bool bPowerUpActivated;
var repnotify bool bTriggerReactivated;
var bool bCanBeActivated;
var bool bCurrentActiveStatus;
var() bool GivePowerUpToAllPlayers;
/** Amount of time until the trigger can be reactivated */
var() float ReactivationTime;
/** Objective index for the event this is tied to */
var() int ObjectiveIndex;
/** Index of the event this is tied to */
var() int EventIndex;
/** Actor reference showing status */
var() InterpActor MeshActor;
/** Material index to change in the static mesh */
var() int MaterialIndex;
/** Material color parameter to change in the static mesh */
var() name MaterialParameterName;
/** Initial color for the actor reference */
var() LinearColor InitialColor;
/** Actvated color for the actor reference */
var() LinearColor ActivatedColor;
/** Delay for changing the material in the reactivation */
var() float ReactivationMaterialChangeDelay;
/** Sound to play upon activation */
var() AkEvent ActivationPowerUpSoundEvent;
/** Sound to play upon reactivation */
var() AkEvent ReactivationSoundEvent;
/** Particle effect to play upon activation */
var() ParticleSystem ActivationEffectTemplate;
/** Particle effect to play upon reactivation */
var() ParticleSystem ReactivationEffectTemplate;
/** Particle effect of the trigger that will be activated during the idle state */
var() Emitter IdleActiveParticleEffect;
/** Particle effect of the trigger that will be activated during the inactive state */
var() Emitter IdleInactiveParticleEffect;
var() KFTrigger_PowerUp.EPowerUp_Type PowerUpOnActivation;

replication
{
     if(bNetDirty)
        bPowerUpActivated;

     if(!bNetInitial && bNetDirty)
        bTriggerReactivated;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'bPowerUpActivated')
    {
        UpdateStatus();        
    }
    else
    {
        if(VarName == 'bTriggerReactivated')
        {
            ReactivateTrigger();            
        }
        else
        {
            super(Actor).ReplicatedEvent(VarName);
        }
    }
}

simulated function PostBeginPlay()
{
    super(Trigger).PostBeginPlay();
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(MaterialIndex < MeshActor.StaticMeshComponent.Materials.Length)
        {
            MeshActor.StaticMeshComponent.CreateAndSetMaterialInstanceConstant(MaterialIndex);
        }
        if(IdleInactiveParticleEffect != none)
        {
            IdleInactiveParticleEffect.ParticleSystemComponent.SetActive(false);
        }
        UpdateStatus();
    }
}

simulated function UpdateStatus()
{
    local LinearColor ParamColor;

    if(WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    ParamColor = ((bPowerUpActivated) ? ActivatedColor : InitialColor);
    if((ReactivationMaterialChangeDelay > float(0)) && ParamColor == InitialColor)
    {
        SetTimer(ReactivationMaterialChangeDelay, false, 'ApplyInitialMaterial');        
    }
    else
    {
        if(MaterialInstance(MeshActor.StaticMeshComponent.GetMaterial(MaterialIndex)) != none)
        {
            MaterialInstance(MeshActor.StaticMeshComponent.GetMaterial(MaterialIndex)).SetVectorParameterValue(MaterialParameterName, ParamColor);
        }
    }
    if(bCurrentActiveStatus != bPowerUpActivated)
    {
        bCurrentActiveStatus = bPowerUpActivated;
        if(bCurrentActiveStatus && ActivationEffectTemplate != none)
        {
            WorldInfo.MyEmitterPool.SpawnEmitter(ActivationEffectTemplate, Location);            
        }
        else
        {
            if(!bCurrentActiveStatus && ReactivationEffectTemplate != none)
            {
                WorldInfo.MyEmitterPool.SpawnEmitter(ReactivationEffectTemplate, Location);
            }
        }
        if(IdleActiveParticleEffect != none)
        {
            IdleActiveParticleEffect.ParticleSystemComponent.SetActive(!bCurrentActiveStatus);
        }
        if(IdleInactiveParticleEffect != none)
        {
            IdleInactiveParticleEffect.ParticleSystemComponent.SetActive(bCurrentActiveStatus);
        }
    }
}

simulated function ApplyInitialMaterial()
{
    MaterialInstance(MeshActor.StaticMeshComponent.GetMaterial(MaterialIndex)).SetVectorParameterValue(MaterialParameterName, InitialColor);
}

simulated function bool GetIsUsable(Pawn User)
{
    return bCanBeActivated && !KFGameReplicationInfo(KFGameInfo(WorldInfo.Game).GameReplicationInfo).bTraderIsOpen;
}

simulated function int GetInteractionIndex(Pawn User)
{
    return 11;
}

event Touch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
{
    super(Trigger).Touch(Other, OtherComp, HitLocation, HitNormal);
    Class'KFPlayerController'.static.UpdateInteractionMessages(Other);
}

event UnTouch(Actor Other)
{
    super(Actor).UnTouch(Other);
    Class'KFPlayerController'.static.UpdateInteractionMessages(Other);
}

function bool UsedBy(Pawn User)
{
    if(bCanBeActivated)
    {
        bCanBeActivated = false;
        bPowerUpActivated = true;
        UpdateStatus();
        ActivatePowerUp(User);
        SetTimer(ReactivationTime, false, 'ReactivateTrigger');
        if(ActivationPowerUpSoundEvent != none)
        {
            PlaySoundBase(ActivationPowerUpSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
        }
        TriggerObjectiveCompletion();
    }
    return true;
}

function ReactivateTrigger()
{
    bPowerUpActivated = false;
    bCanBeActivated = true;
    UpdateStatus();
    bTriggerReactivated = true;
    bForceNetUpdate = true;
    NotifyTriggerReactivated();
    if((ReactivationSoundEvent != none) && WorldInfo.NetMode != NM_Client)
    {
        PlaySoundBase(ReactivationSoundEvent, false, WorldInfo.NetMode == NM_DedicatedServer);
    }
}

function TriggerObjectiveCompletion()
{
    local KFPlayerController KFPC;
    local bool bIsObjectiveDataValid;

    bIsObjectiveDataValid = (((ObjectiveIndex >= 0) && ObjectiveIndex < 5) && EventIndex > 0) && EventIndex < 5;
    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        KFPC.ClientOnTriggerUsed(Class'KFTrigger_PowerUp');
        if(bIsObjectiveDataValid)
        {
            KFPC.ClientOnTryCompleteObjective(ObjectiveIndex, EventIndex);
        }        
    }    
}

function ActivatePowerUp(Pawn User)
{
    local KFPlayerController KFPC;

    NotifyPowerUpActivated();
    if(!GivePowerUpToAllPlayers)
    {
        if(User != none)
        {
            KFPC = KFPlayerController(User.Controller);
            if(KFPC != none)
            {
                switch(PowerUpOnActivation)
                {
                    case 0:
                        KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage_Game', 27);
                        KFPC.ReceivePowerUp(Class'KFPowerUp_HellishRage');
                        break;
                    default:
                        break;
                }
            }
            else
            {
            }/* !MISMATCHING REMOVE, tried If got Type:Else Position:0x0DB! */            
        }
        else
        {
            foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
            {
                switch(PowerUpOnActivation)
                {
                    case 0:
                        KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage_Game', 27);
                        KFPC.ReceivePowerUp(Class'KFPowerUp_HellishRage');
                        break;
                    default:
                        break;
                }                
            }            
        }
    }/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x00A! */
}

function NotifyPowerUpActivated()
{
    local KFSeqEvent_PowerUpActivated PowerUpEvent;
    local int I;

    I = 0;
    J0x0B:

    if(I < GeneratedEvents.Length)
    {
        PowerUpEvent = KFSeqEvent_PowerUpActivated(GeneratedEvents[I]);
        if(PowerUpEvent != none)
        {
            PowerUpEvent.ActivatePowerUp(self, self);
        }
        ++ I;
        goto J0x0B;
    }
}

function NotifyTriggerReactivated()
{
    local KFSeqEvent_PowerUpActivated PowerUpEvent;
    local int I;

    I = 0;
    J0x0B:

    if(I < GeneratedEvents.Length)
    {
        PowerUpEvent = KFSeqEvent_PowerUpActivated(GeneratedEvents[I]);
        if(PowerUpEvent != none)
        {
            PowerUpEvent.ReactivateTrigger(self, self);
        }
        ++ I;
        goto J0x0B;
    }
}

defaultproperties
{
    bCanBeActivated=true
    ReactivationTime=20
    ObjectiveIndex=-1
    EventIndex=-1
    InitialColor=(R=0,G=0,B=0,A=1)
    ActivatedColor=(R=0,G=0,B=0,A=1)
    ReactivationMaterialChangeDelay=0.7
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFTrigger_PowerUp.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFTrigger_PowerUp.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFTrigger_PowerUp.CollisionCylinder'
    Components(1)=CollisionCylinder
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bAlwaysRelevant=true
    NetPriority=2.5
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFTrigger_PowerUp.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}