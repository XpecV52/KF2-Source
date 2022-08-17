//=============================================================================
// KFSM_Patriach_Grapple
//=============================================================================
// Patriach tentacle grapple
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFSM_Patriarch_Grapple extends KFSM_GrappleAttack
    native(SpecialMoves);

/** Time from move start when skel controls are activated */
var float TentacleStartTime;
/** Time from move start when follower is attached */
var float TentacleGrabTime;

/** Hit detection settings */
var float MaxRange;
var float MaxClawReach;
var float DetachDistance;
var bool bGrabMissed;

/** Skel controls */
var float CurveExponent;
var float TentacleEndBoneOffset;
var float TentacleBlendOutTime;
var name TentacleEndBone;
var name TentacleStartBone;

/** Air speed when in PHYS_Flying during retract */
var float RetractAirSpeed;

/** True if we've grabbed a pawn */
var bool bGrabbedPawn;

var transient array<SkelControlSingleBone>  TentacleControls;
var transient SkelControlSingleBone         TentacleStartCtrl;
var transient bool bTentacleCtrlStarted;

/** Damage values, set by AI command */
var int TentacleDamage;
var class<KFDamageType> TentacleDmgType;

cpptext
{
    virtual void TickSpecialMove(FLOAT DeltaTime);
}

function SpecialMoveStarted(bool bForced, Name PrevMove)
{
    // skip default (instant attach) behavior 
    Super(KFSpecialMove).SpecialMoveStarted(bForced, PrevMove);

    bAlignFollowerLookSameDirAsMe = default.bAlignFollowerLookSameDirAsMe;
    bAlignFollowerRotation = default.bAlignFollowerRotation;

    Follower = KFPOwner.InteractionPawn;

    if( Follower != none && !Follower.IsAliveAndWell() )
    {
        KFPOwner.EndSpecialMove();
        return;
    }

    bAlignPawns = FALSE;
    bTentacleCtrlStarted = FALSE;
    bGrabMissed = false;

    // On the server start a timer to check collision
    if ( KFPOwner.Role == ROLE_Authority )
    {
        // Start the grapple check
        KFPOwner.SetTimer(TentacleGrabTime, FALSE, nameof(CheckGrapple), Self);
        
        // Stop cloaking
        KFPawn_Monster(KFPOwner).SetCloaked( false );
    }

    KFPawn_Monster(KFPOwner).BumpFrequency = 0.f;
    KFPawn_MonsterBoss(KFPOwner).PlayGrabDialog();
    KFPOwner.SetTimer(TentacleStartTime, FALSE, nameof(BeginTentacleControls), Self);
    if( Follower != none )
    {
        DetachDistance = KFPOwner.CylinderComponent.CollisionRadius + Follower.CylinderComponent.CollisionRadius + default.DetachDistance;
    }

    PlayGrappleAnim();
}

function PlayGrappleAnim()
{
    PlaySpecialMoveAnim(GrappleAnims[0], EAS_FullBody);
}

/** Activates the tentacle skel controls */
function BeginTentacleControls()
{
    if ( TentacleControls.Length == 0 )
    {
        InitializeSkelControls();
    }

    SetSkelControlsActive(true);
    bTentacleCtrlStarted = TRUE;
}

/** Test grapple collision on server */
function CheckGrapple()
{
    local vector HitLocation, HitNormal, GrabLocation, GrabDirection;
    local Actor HitActor;

    if( bGrabMissed )
    {
        return;
    }

    if( Follower != none && Follower.IsAliveAndWell() && Follower.CanBeGrabbed(KFPOwner, true) )
    {
        // Out of reach (MaxRange + additional claw reach)
        GrabLocation = Follower.Location + Follower.BaseEyeHeight * vect(0,0,0.75);
        GrabDirection = PawnOwner.Location - GrabLocation;
        if ( VSizeSq(GrabDirection) < Square(MaxRange + MaxClawReach) )
        {        
            // trace for obstructions
            HitActor = PawnOwner.Trace(HitLocation, HitNormal, Follower.Location, PawnOwner.Location, true);
            if ( HitActor == None || HitActor == Follower )
            {
                // Do some damage
                DamageFollower( GrabLocation, GrabDirection );
            }

            // Make sure our follower is still alive after taking damage
            if( Follower != none && Follower.IsAliveAndWell() )
            {
                BeginGrapple();
                return;
            }
        }
    }

    OnGrabMissed();
}

function DamageFollower( vector GrabLocation, vector GrabDirection )
{
    GrabDirection = Normal(GrabDirection);
    Follower.TakeDamage( int(TentacleDamage * 0.5f), KFPOwner.Controller, GrabLocation, GrabDirection, TentacleDmgType,, KFPOwner );
    
    // Do a camera shake, etc
    KFPawn_Monster(KFPOwner).MeleeAttackHelper.PlayMeleeHitEffects(Follower, GrabLocation, GrabDirection);
}

function BeginGrapple()
{
    if ( PawnOwner.Role == ROLE_Authority )
    {
        // @todo: Server only for now because the alignment code is not 
        // network safe on simulated proxy.  Needs invstigation!
        bAlignPawns = default.bAlignPawns;

        // replicate attachment
        KFPOwner.SpecialMoveFlags = EGS_GrabSuccess;
        KFPOwner.ReplicatedSpecialMove.Flags = KFPOwner.SpecialMoveFlags;
        
        // Set our physics to flying for the attract
        Follower.SetPhysics( PHYS_Flying );
        Follower.AirSpeed = RetractAirSpeed;

        KFPawn_MonsterBoss(KFPOwner).PlayGrabbedPlayerDialog( KFPawn_Human(Follower) );
    }

    // Set up a safety net in case interaction cannot be started
    PawnOwner.SetTimer( InteractionStartTimeOut, FALSE, nameof(self.InteractionStartTimedOut), self );

    // See if we can start interaction right now. If we can't, keep trying until we can.
    CheckReadyToStartInteraction();
}

/** StartInteraction */
function StartInteraction()
{
    super.StartInteraction();

    bGrabbedPawn = true;
}

event OnGrabMissed()
{
    bGrabMissed = true;

    if ( PawnOwner.Role == ROLE_Authority )
    {
        KFPOwner.SpecialMoveFlags = EGS_GrabMiss;
        KFPOwner.ReplicatedSpecialMove.Flags = KFPOwner.SpecialMoveFlags;
    }

    bTentacleCtrlStarted = false;
    SetSkelControlsActive(false);
}

/** Toggle attachment */
function SpecialMoveFlagsUpdated()
{
    if ( KFPOwner.SpecialMoveFlags == EGS_GrabSuccess )
    {
        BeginGrapple();
    }
    else if ( KFPOwner.SpecialMoveFlags == EGS_GrabMiss )
    {
        OnGrabMissed();
    }
}

function InitializeSkelControls()
{
    local int i;

    if ( PawnOwner.WorldInfo.NetMode == NM_DedicatedServer )
    {
        return;
    }

    // @note: Could be done with a single (shared) control with a relative
    // translation, but this way we can make a nice curve to the target.
    TentacleControls.Length = 5;
    TentacleControls[0] = SkelControlSingleBone(PawnOwner.Mesh.FindSkelControl('Tentacle3'));
    TentacleControls[1] = SkelControlSingleBone(PawnOwner.Mesh.FindSkelControl('Tentacle4'));
    TentacleControls[2] = SkelControlSingleBone(PawnOwner.Mesh.FindSkelControl('Tentacle5'));
    TentacleControls[3] = SkelControlSingleBone(PawnOwner.Mesh.FindSkelControl('Tentacle6'));
    TentacleControls[4] = SkelControlSingleBone(PawnOwner.Mesh.FindSkelControl('Tentacle7'));

    for(i = 0; i < TentacleControls.Length; ++i)
    {
        TentacleControls[i].BlendInTime = (TentacleGrabTime - TentacleStartTime);
        TentacleControls[i].BlendOutTime = TentacleBlendOutTime;
    }

    // move the anchor bone outside the abdomen
    TentacleStartCtrl = SkelControlSingleBone(PawnOwner.Mesh.FindSkelControl('TentacleAnchor'));
    TentacleStartCtrl.BlendInTime = 0.2f;
    TentacleStartCtrl.BlendOutTime = 0.33f;
}

function SetSkelControlsActive(bool bEnabled)
{
    local int i;

    if ( PawnOwner.WorldInfo.NetMode == NM_DedicatedServer )
    {
        return;
    }

    // bEnabled==TRUE is handled in TickSpecialMove to guarantee a valid target
    if ( !bEnabled )
    {
        for(i = 0; i < TentacleControls.Length; ++i)
        {
            TentacleControls[i].SetSkelControlActive(false);
        }
    }

    TentacleStartCtrl.SetSkelControlActive(bEnabled);
}

/** If the follower has been reeled in, end the special move */
event DetachGrabbedPawn()
{
    local int i;

    // bEnabled==TRUE is handled in TickSpecialMove to guarantee a valid target
    for(i = 0; i < TentacleControls.Length; ++i)
    {
        if( TentacleControls[i] != none )
        {
            TentacleControls[i].BlendOutTime = 0.2f;
        }
    }
    if( TentacleStartCtrl != none )
    {
        TentacleStartCtrl.BlendOutTime = 0.2f;
    }
    
    bTentacleCtrlStarted = false;
    SetSkelControlsActive( false );

    KFPOwner.EndSpecialMove();
    if( Follower != none )
    {
        Follower.SetPhysics( PHYS_Falling );
        Follower.EndSpecialMove();
    }

}

// Skip Super(KFSM_GrappleAttack)
function AnimEndNotify( AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime )
{
    Super(KFSpecialMove).AnimEndNotify(SeqNode, PlayedTime, ExcessTime);
}

/** Notification from the pawn that damage was taken during move */
function NotifyOwnerTakeHit(class<KFDamageType> DamageType, vector HitLoc, vector HitDir, Controller InstigatedBy)
{
    return; // no interruption
}

/** Follower has left special move */
function OnFollowerLeavingSpecialMove()
{
    super.OnFollowerLeavingSpecialMove();

    ResetFollowerPhysics();
}

/** Resets physics values on follower */
function ResetFollowerPhysics()
{
    if( Follower != none )
    {
        Follower.AirSpeed = Follower.default.AirSpeed;
        if( Follower.Physics == PHYS_Flying )
        {
            Follower.SetPhysics( PHYS_Falling );
        }
    }   
}

/** Disable skel controls */
function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
    if( PawnOwner != none )
    {
        PawnOwner.ClearTimer(nameof(CheckGrapple), Self);
        PawnOwner.ClearTimer(nameof(BeginTentacleControls), Self);
        KFPawn_Monster(PawnOwner).BumpFrequency = KFPawn_Monster(PawnOwner).default.BumpFrequency;
    }
    
    // Return follower physics to normal
    ResetFollowerPhysics();

    SetSkelControlsActive(false);
    Super.SpecialMoveEnded(PrevMove, NextMove);
}

DefaultProperties
{
    Handle=KFSM_Patriarch_Grapple
    FollowerSpecialMove=SM_HansGrappleVictim
    AlignDistance=108.f
    AlignFollowerInterpSpeed=22.f
    bStopAlignFollowerRotationAtGoal=false
    bAlignFollowerZ=true
    bAlignLeaderLocation=false
    AlignSpeedModifier=0.2f

    TentacleStartTime=0.83f
    TentacleGrabTime=1.18f
    MaxRange=600.f
    MaxClawReach=50.f
    DetachDistance=20.f
    RetractAirSpeed=1000.f
    GrappleAnims.Empty
    GrappleAnims.Add(Atk_Tentical_V1)

    TentacleStartBone=FrontTentacle2
    TentacleEndBone=FrontTentacle7
    TentacleEndBoneOffset=-10
    TentacleBlendOutTime=0.33f
    CurveExponent=1.25f
}