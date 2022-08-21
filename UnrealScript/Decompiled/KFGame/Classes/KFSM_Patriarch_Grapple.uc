/*******************************************************************************
 * KFSM_Patriarch_Grapple generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_Patriarch_Grapple extends KFSM_GrappleCombined
    native(SpecialMoves);

var float TentacleStartTime;
var float MaxRange;
var float MaxClawReach;
var float DetachDistance;
var bool bGrabMissed;
var bool bGrabbedPawn;
var transient bool bTentacleCtrlStarted;
var float CurveExponent;
var float TentacleEndBoneOffset;
var float TentacleBlendOutTime;
var name TentacleEndBone;
var name TentacleStartBone;
var float RetractAirSpeed;
var transient array<SkelControlSingleBone> TentacleControls;
var transient SkelControlSingleBone TentacleStartCtrl;
var int TentacleDamage;
var class<KFDamageType> TentacleDmgType;

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    super.SpecialMoveStarted(bForced, PrevMove);
    bAlignFollowerLookSameDirAsMe = default.bAlignFollowerLookSameDirAsMe;
    bAlignFollowerRotation = default.bAlignFollowerRotation;
    Follower = KFPOwner.InteractionPawn;
    if((Follower != none) && !Follower.IsAliveAndWell())
    {
        KFPOwner.EndSpecialMove();
        return;
    }
    bAlignPawns = false;
    bTentacleCtrlStarted = false;
    bGrabMissed = false;
    if(KFPOwner.Role == ROLE_Authority)
    {
        KFPawn_Monster(KFPOwner).SetCloaked(false);
    }
    KFPawn_Monster(KFPOwner).BumpFrequency = 0;
    KFPawn_MonsterBoss(KFPOwner).PlayGrabDialog();
    KFPOwner.SetTimer(TentacleStartTime, false, 'BeginTentacleControls', self);
    if(Follower != none)
    {
        DetachDistance = (KFPOwner.CylinderComponent.CollisionRadius + Follower.CylinderComponent.CollisionRadius) + default.DetachDistance;
    }
}

function BeginTentacleControls()
{
    if(TentacleControls.Length == 0)
    {
        InitializeSkelControls();
    }
    SetSkelControlsActive(true);
    bTentacleCtrlStarted = true;
}

function CheckGrapple()
{
    local Vector HitLocation, HitNormal, GrabLocation, GrabDirection;
    local Actor HitActor;

    if(bGrabMissed)
    {
        return;
    }
    if(((Follower != none) && Follower.IsAliveAndWell()) && Follower.CanBeGrabbed(KFPOwner, true))
    {
        GrabLocation = Follower.Location + (Follower.BaseEyeHeight * vect(0, 0, 0.75));
        GrabDirection = PawnOwner.Location - GrabLocation;
        if(VSizeSq(GrabDirection) < Square(MaxRange + MaxClawReach))
        {
            HitActor = PawnOwner.Trace(HitLocation, HitNormal, Follower.Location, PawnOwner.Location, true);
            if((HitActor == none) || HitActor == Follower)
            {
                DamageFollower(GrabLocation, GrabDirection);
            }
            if((Follower != none) && Follower.IsAliveAndWell())
            {
                BeginGrapple();
                return;
            }
        }
    }
    OnGrabMissed();
}

function DamageFollower(Vector GrabLocation, Vector GrabDirection)
{
    GrabDirection = Normal(GrabDirection);
    Follower.TakeDamage(TentacleDamage, KFPOwner.Controller, GrabLocation, GrabDirection, TentacleDmgType,, KFPOwner);
    KFPawn_Monster(KFPOwner).MeleeAttackHelper.PlayMeleeHitEffects(Follower, GrabLocation, GrabDirection);
}

function BeginGrapple(optional KFPawn Victim)
{
    if(PawnOwner.Role == ROLE_Authority)
    {
        bAlignPawns = default.bAlignPawns;
        KFPOwner.SpecialMoveFlags = 1;
        KFPOwner.ReplicatedSpecialMove.Flags = KFPOwner.SpecialMoveFlags;
        Follower.SetPhysics(4);
        Follower.AirSpeed = RetractAirSpeed;
        KFPawn_MonsterBoss(KFPOwner).PlayGrabbedPlayerDialog(KFPawn_Human(Follower));
    }
    PawnOwner.SetTimer(InteractionStartTimeOut, false, 'InteractionStartTimedOut', self);
    CheckReadyToStartInteraction();
}

function StartInteraction()
{
    super.StartInteraction();
    bGrabbedPawn = true;
}

event OnGrabMissed()
{
    bGrabMissed = true;
    if(PawnOwner.Role == ROLE_Authority)
    {
        KFPOwner.SpecialMoveFlags = 2;
        KFPOwner.ReplicatedSpecialMove.Flags = KFPOwner.SpecialMoveFlags;
    }
    bTentacleCtrlStarted = false;
    SetSkelControlsActive(false);
}

function SpecialMoveFlagsUpdated()
{
    if(KFPOwner.SpecialMoveFlags == 1)
    {
        BeginGrapple();        
    }
    else
    {
        if(KFPOwner.SpecialMoveFlags == 2)
        {
            OnGrabMissed();
        }
    }
}

function InitializeSkelControls()
{
    local int I;

    if(PawnOwner.WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    TentacleControls.Length = 5;
    TentacleControls[0] = SkelControlSingleBone(PawnOwner.Mesh.FindSkelControl('Tentacle3'));
    TentacleControls[1] = SkelControlSingleBone(PawnOwner.Mesh.FindSkelControl('Tentacle4'));
    TentacleControls[2] = SkelControlSingleBone(PawnOwner.Mesh.FindSkelControl('Tentacle5'));
    TentacleControls[3] = SkelControlSingleBone(PawnOwner.Mesh.FindSkelControl('Tentacle6'));
    TentacleControls[4] = SkelControlSingleBone(PawnOwner.Mesh.FindSkelControl('Tentacle7'));
    I = 0;
    J0x1F5:

    if(I < TentacleControls.Length)
    {
        TentacleControls[I].BlendInTime = GrabCheckTime - TentacleStartTime;
        TentacleControls[I].BlendOutTime = TentacleBlendOutTime;
        ++ I;
        goto J0x1F5;
    }
    TentacleStartCtrl = SkelControlSingleBone(PawnOwner.Mesh.FindSkelControl('TentacleAnchor'));
    TentacleStartCtrl.BlendInTime = 0.2;
    TentacleStartCtrl.BlendOutTime = 0.33;
}

function SetSkelControlsActive(bool bEnabled)
{
    local int I;

    if(PawnOwner.WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    if(!bEnabled)
    {
        I = 0;
        J0x5A:

        if(I < TentacleControls.Length)
        {
            TentacleControls[I].SetSkelControlActive(false);
            ++ I;
            goto J0x5A;
        }
    }
    TentacleStartCtrl.SetSkelControlActive(bEnabled);
}

event DetachGrabbedPawn()
{
    local int I;

    I = 0;
    J0x0B:

    if(I < TentacleControls.Length)
    {
        if(TentacleControls[I] != none)
        {
            TentacleControls[I].BlendOutTime = 0.2;
        }
        ++ I;
        goto J0x0B;
    }
    if(TentacleStartCtrl != none)
    {
        TentacleStartCtrl.BlendOutTime = 0.2;
    }
    bTentacleCtrlStarted = false;
    SetSkelControlsActive(false);
    KFPOwner.EndSpecialMove();
    if(Follower != none)
    {
        Follower.SetPhysics(2);
        Follower.EndSpecialMove();
    }
}

function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
    super(KFSpecialMove).AnimEndNotify(SeqNode, PlayedTime, ExcessTime);
}

function NotifyOwnerTakeHit(class<KFDamageType> DamageType, Vector HitLoc, Vector HitDir, Controller InstigatedBy);

function OnFollowerLeavingSpecialMove()
{
    super.OnFollowerLeavingSpecialMove();
    ResetFollowerPhysics();
}

function ResetFollowerPhysics()
{
    if(Follower != none)
    {
        Follower.AirSpeed = Follower.default.AirSpeed;
        if(Follower.Physics == 4)
        {
            Follower.SetPhysics(2);
        }
    }
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    if(PawnOwner != none)
    {
        PawnOwner.ClearTimer('CheckGrapple', self);
        PawnOwner.ClearTimer('BeginTentacleControls', self);
        KFPawn_Monster(PawnOwner).BumpFrequency = KFPawn_Monster(PawnOwner).default.BumpFrequency;
    }
    ResetFollowerPhysics();
    SetSkelControlsActive(false);
    super.SpecialMoveEnded(PrevMove, NextMove);
}

function SpecialMoveButtonRetriggered();

function SpecialMoveButtonReleased();

function PlayerReleasedGrapple();

defaultproperties
{
    TentacleStartTime=0.83
    MaxRange=600
    MaxClawReach=50
    DetachDistance=20
    CurveExponent=1.25
    TentacleEndBoneOffset=-10
    TentacleBlendOutTime=0.33
    TentacleEndBone=FrontTentacle7
    TentacleStartBone=FrontTentacle2
    RetractAirSpeed=1000
    GrabStartAnimName=Atk_Tentical_V1
    FollowerSpecialMove=ESpecialMove.SM_HansGrappleVictim
    bAlignLeaderLocation=false
    bAlignFollowerZ=true
    bStopAlignFollowerRotationAtGoal=false
    bRetryCollisionCheck=false
    AlignDistance=108
    AlignSpeedModifier=0.2
    Handle=KFSM_Patriarch_Grapple
}