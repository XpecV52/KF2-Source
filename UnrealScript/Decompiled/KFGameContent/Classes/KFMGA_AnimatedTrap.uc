/*******************************************************************************
 * KFMGA_AnimatedTrap generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFMGA_AnimatedTrap extends SkeletalMeshActor
    hidecategories(Navigation)
    implements(KFInterface_MinigameActor);

/** Animation looping while the game is in the deactivated state.  Plays into activation. */
var() name DeactivatedIdleAnim;
/** Animation triggered when activation begins.  Plays into activated idle. */
var() name ActivationAnim;
/** Animation looping while in the activated state.  Plays into deactivation. */
var() name ActivatedIdleAnim;
/** Animation triggered when deactivating.  Plays into deactivated idle. */
var() name DeactivationAnim;
var repnotify bool bActivated;
/** Amount to move to rest/back to original */
var() Vector MovementVector;
/** Amount of time to handle move */
var() float MovementTime;
var InterpCurveVector MovementCurve;
/** Sounds for start and end of various phases */
var() AkEvent ActivationStart;
var() AkEvent ActivationEnd;
var() AkEvent DeactivationStart;
var() AkEvent DeactivationEnd;
var export editinline AkComponent CageSFXComponent;
var AkEvent CurStartSound;
var AkEvent CurEndSound;
/** VFX for start and end of various phases */
var() export editinline ParticleSystemComponent ActivationStartFX;
var() export editinline ParticleSystemComponent ActivationEndFX;
var() export editinline ParticleSystemComponent DeactivationStartFX;
var() export editinline ParticleSystemComponent DeactivationEndFX;
var export editinline ParticleSystemComponent CurStartFX;
var export editinline ParticleSystemComponent CurEndFX;

replication
{
     if(Role == ROLE_Authority)
        bActivated;
}

simulated event ReplicatedEvent(name VarName)
{
    super.ReplicatedEvent(VarName);
    if(VarName == 'bActivated')
    {
        if(bActivated)
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
    SkeletalMeshComponent.PlayAnim(DeactivatedIdleAnim,, true);
    SetTickIsDisabled(false);
}

simulated event bool CanPlayAkEvent(Actor InOwner, name BoneName)
{
    return true;
}

function Activated(KFTrigger_MinigameButton ActivationSource)
{
    if(!bActivated)
    {
        ClearTimer('PlayDeactivationIdle');
        bActivated = true;
        PlayActivation();
    }
}

function Deactivated()
{
    if(bActivated)
    {
        ClearTimer('ActivationIdle');
        bActivated = false;
        PlayDeactivation();
    }
}

simulated function PlayActivation()
{
    SkeletalMeshComponent.StopAnim();
    if(ActivationAnim != 'None')
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
    if(ActivatedIdleAnim != 'None')
    {
        SkeletalMeshComponent.PlayAnim(ActivatedIdleAnim,, true);
    }
}

simulated function PlayDeactivation()
{
    SkeletalMeshComponent.StopAnim();
    if(DeactivationAnim != 'None')
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
    if(DeactivatedIdleAnim != 'None')
    {
        SkeletalMeshComponent.PlayAnim(DeactivatedIdleAnim,, true);
    }
}

simulated function SetMoveActivationCurve()
{
    MovementCurve.Points.Length = 2;
    MovementCurve.Points[0].InVal = 0;
    MovementCurve.Points[0].OutVal = Location;
    MovementCurve.Points[0].InterpMode = 1;
    MovementCurve.Points[1].InVal = MovementTime;
    MovementCurve.Points[1].OutVal = Location + MovementVector;
    MovementCurve.Points[1].InterpMode = 1;
    GotoState('Moving');
}

simulated function SetMoveDeactivationCurve()
{
    MovementCurve.Points.Length = 2;
    MovementCurve.Points[0].InVal = 0;
    MovementCurve.Points[0].OutVal = Location;
    MovementCurve.Points[0].InterpMode = 1;
    MovementCurve.Points[1].InVal = MovementTime;
    MovementCurve.Points[1].OutVal = Location - MovementVector;
    MovementCurve.Points[1].InterpMode = 1;
    GotoState('Moving');
}

function bool CanBeActivated(KFTrigger_MinigameButton ActivationSource)
{
    return true;
}

simulated function EndMovement();

simulated state Moving
{
    simulated event BeginState(name PreviousStateName)
    {
        super(Object).BeginState(PreviousStateName);
        SetTimer(MovementTime, false, 'EndMovement');
        CageSFXComponent.PlayEvent(CurStartSound,, false, true);
        CurStartFX.ActivateSystem(true);
    }

    simulated event Tick(float DeltaTime)
    {
        local float TimerCount;

        global.Tick(DeltaTime);
        TimerCount = GetTimerCount('EndMovement');
        if(TimerCount > float(0))
        {
            SetLocation(EvalInterpCurveVector(MovementCurve, TimerCount));
        }
    }

    simulated function EndMovement()
    {
        CageSFXComponent.PlayEvent(CurEndSound,, false, true);
        CurEndFX.ActivateSystem(true);
        GotoState('Auto');
    }

    function bool CanBeActivated(KFTrigger_MinigameButton ActivationSource)
    {
        return false;
    }
    stop;    
}

defaultproperties
{
    CageSFXComponent=AkComponent'Default__KFMGA_AnimatedTrap.CageSFX0'
    begin object name=PSC0 class=ParticleSystemComponent
        bAutoActivate=false
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFMGA_AnimatedTrap.PSC0'
    ActivationStartFX=PSC0
    begin object name=PSC1 class=ParticleSystemComponent
        bAutoActivate=false
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFMGA_AnimatedTrap.PSC1'
    ActivationEndFX=PSC1
    begin object name=PSC2 class=ParticleSystemComponent
        bAutoActivate=false
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFMGA_AnimatedTrap.PSC2'
    DeactivationStartFX=PSC2
    begin object name=PSC3 class=ParticleSystemComponent
        bAutoActivate=false
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFMGA_AnimatedTrap.PSC3'
    DeactivationEndFX=PSC3
    begin object name=SkeletalMeshComponent0 class=SkeletalMeshComponent
        Animations=AnimNodeSequence'Default__KFMGA_AnimatedTrap.SkeletalMeshComponent0.AnimNodeSeq0'
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__KFMGA_AnimatedTrap.MyLightEnvironment'
    object end
    // Reference: SkeletalMeshComponent'Default__KFMGA_AnimatedTrap.SkeletalMeshComponent0'
    SkeletalMeshComponent=SkeletalMeshComponent0
    LightEnvironment=DynamicLightEnvironmentComponent'Default__KFMGA_AnimatedTrap.MyLightEnvironment'
    FacialAudioComp=AudioComponent'Default__KFMGA_AnimatedTrap.FaceAudioComponent'
    begin object name=SkeletalMeshComponent0 class=SkeletalMeshComponent
        Animations=AnimNodeSequence'Default__KFMGA_AnimatedTrap.SkeletalMeshComponent0.AnimNodeSeq0'
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__KFMGA_AnimatedTrap.MyLightEnvironment'
    object end
    // Reference: SkeletalMeshComponent'Default__KFMGA_AnimatedTrap.SkeletalMeshComponent0'
    Components(0)=SkeletalMeshComponent0
    Components(1)=AudioComponent'Default__KFMGA_AnimatedTrap.FaceAudioComponent'
    Components(2)=AkComponent'Default__KFMGA_AnimatedTrap.CageSFX0'
    begin object name=PSC0 class=ParticleSystemComponent
        bAutoActivate=false
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFMGA_AnimatedTrap.PSC0'
    Components(3)=PSC0
    begin object name=PSC1 class=ParticleSystemComponent
        bAutoActivate=false
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFMGA_AnimatedTrap.PSC1'
    Components(4)=PSC1
    begin object name=PSC2 class=ParticleSystemComponent
        bAutoActivate=false
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFMGA_AnimatedTrap.PSC2'
    Components(5)=PSC2
    begin object name=PSC3 class=ParticleSystemComponent
        bAutoActivate=false
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFMGA_AnimatedTrap.PSC3'
    Components(6)=PSC3
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bAlwaysRelevant=true
    bUpdateSimulatedPosition=true
    NetPriority=2.5
    begin object name=SkeletalMeshComponent0 class=SkeletalMeshComponent
        Animations=AnimNodeSequence'Default__KFMGA_AnimatedTrap.SkeletalMeshComponent0.AnimNodeSeq0'
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__KFMGA_AnimatedTrap.MyLightEnvironment'
    object end
    // Reference: SkeletalMeshComponent'Default__KFMGA_AnimatedTrap.SkeletalMeshComponent0'
    CollisionComponent=SkeletalMeshComponent0
}