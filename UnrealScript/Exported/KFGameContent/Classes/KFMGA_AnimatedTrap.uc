//=============================================================================
// KFMGA_AnimatedTrap
//=============================================================================
// Any trap-style minigame event that uses a similar idle/activate/deactivate
//      set of animations.  Manually handles movement to avoid client/server
//      collision disagreements for collision assumed to be moving via-anims,
//      or problems typical of client/server matinees.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFMGA_AnimatedTrap extends SkeletalMeshActor
    placeable
    implements(KFInterface_MinigameActor);

/** Animation looping while the game is in the deactivated state.  Plays into activation. */
var() name DeactivatedIdleAnim;

/** Animation triggered when activation begins.  Plays into activated idle. */
var() name ActivationAnim;

/** Animation looping while in the activated state.  Plays into deactivation. */
var() name ActivatedIdleAnim;

/** Animation triggered when deactivating.  Plays into deactivated idle. */
var() name DeactivationAnim;

/** Activation state */
var repnotify bool bActivated;

/** Amount to move to rest/back to original */
var() Vector MovementVector;

/** Amount of time to handle move */
var() float MovementTime;

/** Movement curve */
var InterpCurveVector MovementCurve;

/** Sounds for start and end of various phases */
var() AkEvent ActivationStart;
var() AkEvent ActivationEnd;
var() AkEvent DeactivationStart;
var() AkEvent DeactivationEnd;

var AkComponent CageSFXComponent;
var AkEvent CurStartSound;
var AkEvent CurEndSound;

/** VFX for start and end of various phases */
var() ParticleSystemComponent ActivationStartFX;
var() ParticleSystemComponent ActivationEndFX;
var() ParticleSystemComponent DeactivationStartFX;
var() ParticleSystemComponent DeactivationEndFX;

var ParticleSystemComponent CurStartFX;
var ParticleSystemComponent CurEndFX;

replication
{
    if (Role == ROLE_Authority)
        bActivated;
}

simulated event ReplicatedEvent(name VarName)
{
    super.ReplicatedEvent(VarName);

    if (VarName == 'bActivated')
    {
        if (bActivated)
        {
            PlayActivation();
        }
        else
        {
            PlayDeactivation();
        }
    }
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SkeletalMeshComponent.PlayAnim(DeactivatedIdleAnim, , true);
    SetTickIsDisabled(false);
}

/** Called on rigged games to check whether a target at a specific bone can be played */
simulated event bool CanPlayAkEvent(Actor inOwner, name BoneName)
{
    return true;
}

function Activated(KFTrigger_MinigameButton ActivationSource)
{
    if (!bActivated)
    {
        ClearTimer('PlayDeactivationIdle');
        bActivated = true;
        PlayActivation();
    }    
}

function Deactivated()
{
    if (bActivated)
    {
        ClearTimer('ActivationIdle');
        bActivated = false;
        PlayDeactivation();
    }    
}

/** Bunch of animation code.  Activation->Idle and Deactivation->Idle basically work as pairs trigged by a minigame button. */
simulated function PlayActivation()
{
    SkeletalMeshComponent.StopAnim();
    if (ActivationAnim != '')
    {
        SetTimer(SkeletalMeshComponent.GetAnimLength(ActivationAnim), false, 'PlayActivationIdle');
        SkeletalMeshComponent.PlayAnim(ActivationAnim);
    }
    else
    {
        PlayActivationIdle();
    }

    CurStartSound = ActivationStart;
    CurEndSound = ActivationEnd;
    CurStartFX = ActivationStartFX;
    CurEndFX = ActivationEndFX;
    SetMoveActivationCurve();
}

simulated function PlayActivationIdle()
{
    SkeletalMeshComponent.StopAnim();
    if (ActivatedIdleAnim != '')
    {
        SkeletalMeshComponent.PlayAnim(ActivatedIdleAnim,,true);
    }
}

simulated function PlayDeactivation()
{
    SkeletalMeshComponent.StopAnim();
    if (DeactivationAnim != '')
    {
        SetTimer(SkeletalMeshComponent.GetAnimLength(DeactivationAnim), false, 'PlayDeactivationIdle');
        SkeletalMeshComponent.PlayAnim(DeactivationAnim);
    }
    else
    {
        PlayDeactivationIdle();
    }

    CurStartSound = DeactivationStart;
    CurEndSound = DeactivationEnd;
    CurStartFX = DeactivationStartFX;
    CurEndFX = DeactivationEndFX;
    SetMoveDeactivationCurve();
}

simulated function PlayDeactivationIdle()
{
    SkeletalMeshComponent.StopAnim();
    if (DeactivatedIdleAnim != '')
    {
        SkeletalMeshComponent.PlayAnim(DeactivatedIdleAnim, , true);
    }
}

/** Curves for movement in and out of the activated idle point */
simulated function SetMoveActivationCurve()
{
    MovementCurve.Points.Length = 2;

    MovementCurve.Points[0].InVal = 0;
    MovementCurve.Points[0].OutVal = Location;
    MovementCurve.Points[0].InterpMode = CIM_CurveAuto;

    MovementCurve.Points[1].InVal = MovementTime;
    MovementCurve.Points[1].OutVal = Location + MovementVector;
    MovementCurve.Points[1].InterpMode = CIM_CurveAuto;

    GoToState('Moving');
}

simulated function SetMoveDeactivationCurve()
{
    MovementCurve.Points.Length = 2;

    MovementCurve.Points[0].InVal = 0;
    MovementCurve.Points[0].OutVal = Location;
    MovementCurve.Points[0].InterpMode = CIM_CurveAuto;

    MovementCurve.Points[1].InVal = MovementTime;
    MovementCurve.Points[1].OutVal = Location - MovementVector;
    MovementCurve.Points[1].InterpMode = CIM_CurveAuto;

    GoToState('Moving');
}

/** Only allow activation while not in the moving state */
function bool CanBeActivated(KFTrigger_MinigameButton ActivationSource)
{
    return true;
}

simulated function EndMovement();
simulated state Moving
{
    simulated event BeginState(Name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        SetTimer(MovementTime, false, 'EndMovement');
        CageSFXComponent.PlayEvent(CurStartSound, , false, true);
        CurStartFX.ActivateSystem(true);
    }

    simulated event Tick(float DeltaTime)
    {
        local float TimerCount;
        global.Tick(DeltaTime);

        //Watch for return to 0 on last tick when timer finishes
        TimerCount = GetTimerCount('EndMovement');
        if (TimerCount > 0)
        {
            SetLocation(EvalInterpCurveVector(MovementCurve, TimerCount));
        }
    }

    simulated function EndMovement()
    {
        CageSFXComponent.PlayEvent(CurEndSound, , false, true);
        CurEndFX.ActivateSystem(true);
        GoToState('Auto');
    }

    /** Don't allow activation while it's moving */
    function bool CanBeActivated(KFTrigger_MinigameButton ActivationSource)
    {
        return false;
    }
}

defaultproperties
{
   Begin Object Class=AkComponent Name=CageSFX0
      Name="CageSFX0"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   CageSFXComponent=CageSFX0
   Begin Object Class=ParticleSystemComponent Name=PSC0
      bAutoActivate=False
      ReplacementPrimitive=None
      Name="PSC0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__ParticleSystemComponent'
   End Object
   ActivationStartFX=PSC0
   Begin Object Class=ParticleSystemComponent Name=PSC1
      bAutoActivate=False
      ReplacementPrimitive=None
      Name="PSC1"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__ParticleSystemComponent'
   End Object
   ActivationEndFX=PSC1
   Begin Object Class=ParticleSystemComponent Name=PSC2
      bAutoActivate=False
      ReplacementPrimitive=None
      Name="PSC2"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__ParticleSystemComponent'
   End Object
   DeactivationStartFX=PSC2
   Begin Object Class=ParticleSystemComponent Name=PSC3
      bAutoActivate=False
      ReplacementPrimitive=None
      Name="PSC3"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__ParticleSystemComponent'
   End Object
   DeactivationEndFX=PSC3
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActor:SkeletalMeshComponent0'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'Engine.Default__SkeletalMeshActor:AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'Engine.Default__SkeletalMeshActor:AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'kfgamecontent.Default__KFMGA_AnimatedTrap:SkeletalMeshComponent0.AnimNodeSeq0'
      bUpdateSkelWhenNotRendered=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'kfgamecontent.Default__KFMGA_AnimatedTrap:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      CollideActors=True
      BlockZeroExtent=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActor:SkeletalMeshComponent0'
   End Object
   SkeletalMeshComponent=SkeletalMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Begin Object Class=AudioComponent Name=FaceAudioComponent Archetype=AudioComponent'Engine.Default__SkeletalMeshActor:FaceAudioComponent'
      Name="FaceAudioComponent"
      ObjectArchetype=AudioComponent'Engine.Default__SkeletalMeshActor:FaceAudioComponent'
   End Object
   FacialAudioComp=FaceAudioComponent
   Components(0)=SkeletalMeshComponent0
   Components(1)=FaceAudioComponent
   Components(2)=CageSFX0
   Components(3)=PSC0
   Components(4)=PSC1
   Components(5)=PSC2
   Components(6)=PSC3
   RemoteRole=ROLE_SimulatedProxy
   bAlwaysRelevant=True
   bUpdateSimulatedPosition=True
   NetPriority=2.500000
   CollisionComponent=SkeletalMeshComponent0
   Name="Default__KFMGA_AnimatedTrap"
   ObjectArchetype=SkeletalMeshActor'Engine.Default__SkeletalMeshActor'
}
