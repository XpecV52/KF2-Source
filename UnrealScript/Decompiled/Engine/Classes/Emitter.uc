/*******************************************************************************
 * Emitter generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Emitter extends Actor
    native
    placeable
    hidecategories(Navigation);

struct CheckpointRecord
{
    var bool bIsActive;

    structdefaultproperties
    {
        bIsActive=false
    }
};

var() const editconst export editinline ParticleSystemComponent ParticleSystemComponent;
var() const editconst export editinline DynamicLightEnvironmentComponent LightEnvironment;
var bool bDestroyOnSystemFinish;
var() bool bPostUpdateTickGroup;
var repnotify bool bCurrentlyActive;
var transient bool bDepthTestEnabled;

replication
{
     if(bNoDelete)
        bCurrentlyActive;
}

// Export UEmitter::execSetTemplate(FFrame&, void* const)
native event SetTemplate(ParticleSystem NewTemplate, optional bool bDestroyOnFinish);

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    if((WorldInfo.NetMode == NM_DedicatedServer) && (RemoteRole == ROLE_None) || bNetTemporary)
    {
        LifeSpan = 0.2;
        if(bNoDelete)
        {
            SetTickIsDisabled(true);
        }
    }
    if(ParticleSystemComponent != none)
    {
        ParticleSystemComponent.__OnSystemFinished__Delegate = OnParticleSystemFinished;
        bCurrentlyActive = ParticleSystemComponent.bAutoActivate;
    }
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'bCurrentlyActive')
    {
        ParticleSystemComponent.SetActive(bCurrentlyActive);        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
}

simulated function OnParticleSystemFinished(ParticleSystemComponent FinishedComponent)
{
    if(bDestroyOnSystemFinish)
    {
        LifeSpan = 0.0001;
    }
    bCurrentlyActive = false;
}

function OnToggle(SeqAct_Toggle Action)
{
    if(Action.InputLinks[0].bHasImpulse)
    {
        ParticleSystemComponent.ActivateSystem();
        bCurrentlyActive = true;        
    }
    else
    {
        if(Action.InputLinks[1].bHasImpulse)
        {
            ParticleSystemComponent.DeactivateSystem();
            bCurrentlyActive = false;            
        }
        else
        {
            if(Action.InputLinks[2].bHasImpulse)
            {
                if(ParticleSystemComponent.bSuppressSpawning || !bCurrentlyActive)
                {
                    ParticleSystemComponent.ActivateSystem();
                    bCurrentlyActive = true;                    
                }
                else
                {
                    ParticleSystemComponent.DeactivateSystem();
                    bCurrentlyActive = false;
                }
            }
        }
    }
    ParticleSystemComponent.LastRenderTime = WorldInfo.TimeSeconds;
    ForceNetRelevant();
    if(RemoteRole != ROLE_None)
    {
        SetForcedInitialReplicatedProperty(BoolProperty'bCurrentlyActive', bCurrentlyActive == default.bCurrentlyActive);
    }
}

function OnParticleEventGenerator(SeqAct_ParticleEventGenerator Action);

simulated function ShutDown()
{
    super.ShutDown();
    bCurrentlyActive = false;
}

simulated function SetFloatParameter(name ParameterName, float Param)
{
    if(ParticleSystemComponent != none)
    {
        ParticleSystemComponent.super(Emitter).SetFloatParameter(ParameterName, Param);        
    }
    else
    {
        LogInternal(("Warning: Attempting to set a parameter on " $ string(self)) $ " when the PSC does not exist");
    }
}

simulated function SetVectorParameter(name ParameterName, Vector Param)
{
    if(ParticleSystemComponent != none)
    {
        ParticleSystemComponent.super(Emitter).SetVectorParameter(ParameterName, Param);        
    }
    else
    {
        LogInternal(("Warning: Attempting to set a parameter on " $ string(self)) $ " when the PSC does not exist");
    }
}

simulated function SetColorParameter(name ParameterName, Color Param)
{
    if(ParticleSystemComponent != none)
    {
        ParticleSystemComponent.super(Emitter).SetColorParameter(ParameterName, Param);        
    }
    else
    {
        LogInternal(("Warning: Attempting to set a parameter on " $ string(self)) $ " when the PSC does not exist");
    }
}

simulated function SetExtColorParameter(name ParameterName, byte Red, byte Green, byte Blue, byte Alpha)
{
    local Color C;

    if(ParticleSystemComponent != none)
    {
        C.R = Red;
        C.G = Green;
        C.B = Blue;
        C.A = Alpha;
        ParticleSystemComponent.SetColorParameter(ParameterName, C);        
    }
    else
    {
        LogInternal(("Warning: Attempting to set a parameter on " $ string(self)) $ " when the PSC does not exist");
    }
}

simulated function SetActorParameter(name ParameterName, Actor Param)
{
    if(ParticleSystemComponent != none)
    {
        ParticleSystemComponent.super(Emitter).SetActorParameter(ParameterName, Param);        
    }
    else
    {
        LogInternal(("Warning: Attempting to set a parameter on " $ string(self)) $ " when the PSC does not exist");
    }
}

simulated function OnSetParticleSysParam(SeqAct_SetParticleSysParam Action)
{
    local int Idx, ParamIdx;

    if((ParticleSystemComponent != none) && Action.InstanceParameters.Length > 0)
    {
        Idx = 0;
        J0x41:

        if(Idx < Action.InstanceParameters.Length)
        {
            if(Action.InstanceParameters[Idx].ParamType != 0)
            {
                ParamIdx = ParticleSystemComponent.InstanceParameters.Find('Name', Action.InstanceParameters[Idx].Name;
                if(ParamIdx == -1)
                {
                    ParamIdx = ParticleSystemComponent.InstanceParameters.Length;
                    ParticleSystemComponent.InstanceParameters.Length = ParamIdx + 1;
                }
                ParticleSystemComponent.InstanceParameters[ParamIdx] = Action.InstanceParameters[Idx];
                if(Action.bOverrideScalar)
                {
                    ParticleSystemComponent.InstanceParameters[ParamIdx].Scalar = Action.ScalarValue;
                }
            }
            ++ Idx;
            goto J0x41;
        }
    }
}

function bool ShouldSaveForCheckpoint()
{
    return bNoDelete && RemoteRole != ROLE_None;
}

function CreateCheckpointRecord(out CheckpointRecord Record)
{
    Record.bIsActive = bCurrentlyActive;
}

function ApplyCheckpointRecord(const out CheckpointRecord Record)
{
    bCurrentlyActive = Record.bIsActive;
    if(bCurrentlyActive)
    {
        ParticleSystemComponent.ActivateSystem();        
    }
    else
    {
        ParticleSystemComponent.DeactivateSystem();
    }
    ForceNetRelevant();
}

simulated function HideSelf();

defaultproperties
{
    begin object name=ParticleSystemComponent0 class=ParticleSystemComponent
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__Emitter.ParticleSystemComponent0'
    ParticleSystemComponent=ParticleSystemComponent0
    bDepthTestEnabled=true
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.S_Emitter'
        bIsScreenSizeScaled=true
        ScreenSize=0.0025
        SpriteCategoryName=Effects
        ReplacementPrimitive=none
        HiddenGame=true
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
    object end
    // Reference: SpriteComponent'Default__Emitter.Sprite'
    Components(0)=Sprite
    begin object name=ParticleSystemComponent0 class=ParticleSystemComponent
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__Emitter.ParticleSystemComponent0'
    Components(1)=ParticleSystemComponent0
    begin object name=ArrowComponent0 class=ArrowComponent
        ArrowColor=(B=128,G=255,R=0,A=255)
        ArrowSize=1.5
        bTreatAsASprite=true
        SpriteCategoryName=Effects
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__Emitter.ArrowComponent0'
    Components(2)=ArrowComponent0
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bNoDelete=true
    bHardAttach=true
    bGameRelevant=true
    bEdShouldSnap=true
    SupportedEvents(0)=class'SeqEvent_Touch'
    SupportedEvents(1)=class'SeqEvent_Destroyed'
    SupportedEvents(2)=class'SeqEvent_TakeDamage'
    SupportedEvents(3)=class'SeqEvent_HitWall'
    SupportedEvents(4)=class'SeqEvent_AnimNotify'
    SupportedEvents(5)=class'SeqEvent_MobileTouch'
    SupportedEvents(6)=class'SeqEvent_ParticleEvent'
}