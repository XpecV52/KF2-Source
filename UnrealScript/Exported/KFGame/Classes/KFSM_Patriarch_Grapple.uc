//=============================================================================
// KFSM_TentacleGrappleBase
//=============================================================================
// Tentacle grapple
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFSM_Patriarch_Grapple extends KFSM_GrappleCombined
    native(SpecialMoves);

/** Time from move start when skel controls are activated */
var float TentacleStartTime;

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

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

function SpecialMoveStarted(bool bForced, Name PrevMove)
{
    local KFPawn_MonsterBoss BossPawn;
    // skip default (instant attach) behavior
    Super.SpecialMoveStarted(bForced, PrevMove);

    bAlignFollowerLookSameDirAsMe = default.bAlignFollowerLookSameDirAsMe;
    bAlignFollowerRotation = default.bAlignFollowerRotation;

    Follower = KFPOwner.InteractionPawn;

    if( Follower != none && !Follower.IsAliveAndWell() )
    {
        KFPOwner.EndSpecialMove();
        return;
    }

    bAlignPawns = false;
    bTentacleCtrlStarted = FALSE;
    bGrabMissed = false;

    BossPawn = KFPawn_MonsterBoss(KFPOwner);
    if (BossPawn != none)
    {
        // On the server start a timer to check collision
        if (KFPOwner.Role == ROLE_Authority)
        {
            // Stop cloaking
            BossPawn.SetCloaked(false);
        }

        BossPawn.BumpFrequency = 0.f;
        BossPawn.PlayGrabDialog();
        BossPawn.SetTimer(TentacleStartTime, false, nameof(BeginTentacleControls), Self);
        if (Follower != none)
        {
            DetachDistance = BossPawn.CylinderComponent.CollisionRadius + Follower.CylinderComponent.CollisionRadius + default.DetachDistance;
        }
    }
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
    Follower.TakeDamage( TentacleDamage, KFPOwner.Controller, GrabLocation, GrabDirection, TentacleDmgType,, KFPOwner );

    // Do a camera shake, etc
    KFPawn_Monster(KFPOwner).MeleeAttackHelper.PlayMeleeHitEffects(Follower, GrabLocation, GrabDirection);
}

function BeginGrapple(optional KFPawn Victim)
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
        TentacleControls[i].BlendInTime = (GrabCheckTime - TentacleStartTime);
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

/** Skip super, this class does not have a looping anim */
function AnimEndNotify( AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime )
{
    Super(KFSpecialMove).AnimEndNotify(SeqNode, PlayedTime, ExcessTime);
}

/** Disable grab interruption */
function NotifyOwnerTakeHit(class<KFDamageType> DamageType, vector HitLoc, vector HitDir, Controller InstigatedBy);

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

/** Ignore input */
function SpecialMoveButtonRetriggered() {}
function SpecialMoveButtonReleased() {}
function PlayerReleasedGrapple() {}

defaultproperties
{
   TentacleStartTime=0.830000
   MaxRange=600.000000
   MaxClawReach=50.000000
   DetachDistance=20.000000
   CurveExponent=1.250000
   TentacleEndBoneOffset=-10.000000
   TentacleBlendOutTime=0.330000
   TentacleEndBone="FrontTentacle7"
   TentacleStartBone="FrontTentacle2"
   RetractAirSpeed=1000.000000
   GrabStartAnimName="Atk_Tentical_V1"
   FollowerSpecialMove=SM_HansGrappleVictim
   bAlignLeaderLocation=False
   bAlignFollowerZ=True
   bStopAlignFollowerRotationAtGoal=False
   bRetryCollisionCheck=False
   AlignDistance=108.000000
   AlignSpeedModifier=0.200000
   Handle="KFSM_Patriarch_Grapple"
   Name="Default__KFSM_Patriarch_Grapple"
   ObjectArchetype=KFSM_GrappleCombined'KFGame.Default__KFSM_GrappleCombined'
}
