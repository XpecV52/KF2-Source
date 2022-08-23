/*******************************************************************************
 * KFSM_RagdollKnockdown generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_RagdollKnockdown extends KFSpecialMove;

/** If falling past this distance during knockdown kill pawn */
var(Physics) float KnockdownMaxZ;
var const int MaxKnockdownPawns;
var transient Vector KnockdownStartLoc;
var export editinline transient ParticleSystemComponent DazedPSC;

protected function bool InternalCanDoSpecialMove()
{
    local Pawn P;
    local int KnockdownCount;
    local bool bMayHavePartialKinematics;

    bMayHavePartialKinematics = KFPOwner.IsHeadless();
    if(bMayHavePartialKinematics)
    {
        return false;
    }
    foreach PawnOwner.WorldInfo.AllPawns(Class'Pawn', P)
    {
        if((P.Physics == 10) && !P.bPlayedDeath)
        {
            ++ KnockdownCount;
        }        
    }    
    if(KnockdownCount >= MaxKnockdownPawns)
    {
        return false;
    }
    return super.InternalCanDoSpecialMove();
}

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    local TWDeferredWorkManager DeferredWorkManager;

    DeferredWorkManager = TWDeferredWorkManager(KFPOwner.WorldInfo.DeferredWorkManager);
    DeferredWorkManager.SetTimer(0.0001, false, 'DeferApplyKnockdownImpulse', self);
    if(KFPOwner.WorldInfo.NetMode != NM_DedicatedServer)
    {
        DazedPSC = Class'KFSM_Stunned'.static.AttachDazedEffect(KFPawn_Monster(KFPOwner));
    }
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    local TWDeferredWorkManager DeferredWorkManager;

    DeferredWorkManager = TWDeferredWorkManager(KFPOwner.WorldInfo.DeferredWorkManager);
    DeferredWorkManager.ClearTimer('DeferApplyKnockdownImpulse', self);
    if((DazedPSC != none) && DazedPSC.bIsActive)
    {
        DazedPSC.DeactivateSystem();
    }
    if((PawnOwner.Mesh.PhysicsWeight >= 1) && NextMove != 'KFSM_RecoverFromRagdoll')
    {
        PawnOwner.ClearTimer('EndKnockdown', self);
        PawnOwner.ClearTimer('KnockdownTimer', self);
        TermKnockdownRagdoll(KFPOwner);
    }
}

function DeferApplyKnockdownImpulse()
{
    ApplyKnockdownImpulse(KFPOwner.KnockdownImpulse);
}

function ApplyKnockdownImpulse(const out KnockdownImpulseInfo Info)
{
    local Vector PointImpulse;
    local name PointImpulseBoneName;

    if(IsZero(Info.LinearVelocity) && IsZero(Info.AngularVelocity))
    {
        WarnInternal((string(self) @ "invalid KnockdownImpulse for") @ string(PawnOwner));
    }
    if((PawnOwner.Physics != 10) || PawnOwner.Mesh != PawnOwner.CollisionComponent)
    {
        PlayFallDown();
    }
    if(PawnOwner.Physics == 10)
    {
        KnockdownStartLoc = PawnOwner.Location;
        PawnOwner.Mesh.SetRBAngularVelocity(Info.AngularVelocity, false);
        if(!IsZero(Info.LinearVelocity))
        {
            PawnOwner.Mesh.SetRBLinearVelocity(Info.LinearVelocity, true);
        }
        if(!IsZero(Info.ImpulseStrength))
        {
            if(Info.bIsRadialImpulse)
            {
                PawnOwner.Mesh.AddRadialImpulse(Info.ImpulsePosition, Info.ImpulseStrength.X, Info.ImpulseStrength.Y, 1);                
            }
            else
            {
                PointImpulse = Info.ImpulseStrength * KFPOwner.KnockdownImpulseScale;
                if(Info.PointImpulseHitZone != 255)
                {
                    PointImpulseBoneName = KFPOwner.HitZones[Info.PointImpulseHitZone].BoneName;
                    PointImpulseBoneName = KFPOwner.GetRBBoneFromBoneName(PointImpulseBoneName);
                }
                PawnOwner.Mesh.AddImpulse(PointImpulse, Info.ImpulsePosition, PointImpulseBoneName);
            }
        }
        if(KFPOwner.Role == ROLE_Authority)
        {
            PawnOwner.SetTimer(1.5, false, 'EndKnockdown', self);
            PawnOwner.SetTimer(0.2, true, 'KnockdownTimer', self);
        }        
    }
    else
    {
        WarnInternal((string(self) @ "failed to transition to RigidBody for") @ string(GetFuncName()));
        KFPOwner.EndSpecialMove();
    }
}

protected function PlayFallDown()
{
    KFPOwner.PrepareRagdoll();
    if(KFPOwner.InitRagdoll())
    {
        PawnOwner.Mesh.SetTickGroup(2);
        PawnOwner.SetTickGroup(2);
        if(PawnOwner.Mesh.PhysicsAssetInstance != none)
        {
            PawnOwner.Mesh.PhysicsAssetInstance.SetAllMotorsAngularPositionDrive(false, false, PawnOwner.Mesh, true);
            PawnOwner.Mesh.PhysicsAssetInstance.SetAllMotorsAngularDriveParams(0, 0, 0.004, PawnOwner.Mesh, true);
            PawnOwner.Mesh.PhysicsAssetInstance.SetAllMotorsAngularVelocityDrive(true, true, PawnOwner.Mesh, true);
        }
        PawnOwner.Mesh.bUpdateJointsFromAnimation = false;
        PawnOwner.Mesh.SetRBChannel(22);
        PawnOwner.Mesh.SetRBCollidesWithChannel(22, true);
        PawnOwner.Mesh.SetRBCollidesWithChannel(2, false);
        PawnOwner.Mesh.SetRBCollidesWithChannel(16, false);        
    }
    else
    {
        WarnInternal("Failed to init ragdoll for" @ string(self));
    }
}

protected event KnockdownFailsafe()
{
    PawnOwner.Died(PawnOwner.LastHitBy, Class'KFDT_Falling', PawnOwner.Location);
}

protected function KnockdownTimer()
{
    if(((PawnOwner.Physics != 10) || VSizeSq(PawnOwner.Velocity) < 100) || !PawnOwner.Mesh.RigidBodyIsAwake())
    {
        EndKnockdown();
    }
}

protected function EndKnockdown()
{
    PawnOwner.ClearTimer('EndKnockdown', self);
    PawnOwner.ClearTimer('KnockdownTimer', self);
    if(DazedPSC != none)
    {
        DazedPSC.DeactivateSystem();
    }
    if(Abs(KnockdownStartLoc.Z - PawnOwner.Location.Z) > KnockdownMaxZ)
    {
        KnockdownFailsafe();
    }
    KFPOwner.KnockdownImpulse.LinearVelocity = vect(0, 0, 0);
    KFPOwner.KnockdownImpulse.AngularVelocity = vect(0, 0, 0);
    if(KFPOwner.HasInjuredHitZones())
    {
        KnockdownFailsafe();
    }
    if(PawnOwner.IsAliveAndWell() && PawnOwner.Physics == 10)
    {
        KFPOwner.DoSpecialMove(5, true);
        if(KFPOwner.SpecialMove != 5)
        {
            TermKnockdownRagdoll(KFPOwner);
            LogInternal((string(GetFuncName()) @ "Failed to find special move class for: SM_RecoverFromRagdoll") @ string(self));
        }        
    }
    else
    {
        if(PawnOwner.Physics != 10)
        {
            WarnInternal(("Knockdown timer called outside of PHYS_RigidBody" @ string(PawnOwner.Physics)) @ string(KFPOwner.SpecialMove));
            KnockdownFailsafe();
        }
    }
}

static function TermKnockdownRagdoll(KFPawn P)
{
    local editinline SkeletalMeshComponent Mesh, DefaultMesh;

    if(P.bPlayedDeath)
    {
        return;
    }
    P.SetPhysics(2);
    P.Velocity = vect(0, 0, 0);
    P.Acceleration = vect(0, 0, 0);
    P.CollisionComponent = P.CylinderComponent;
    Mesh = P.Mesh;
    DefaultMesh = P.default.Mesh;
    if(!DefaultMesh.bHasPhysicsAssetInstance)
    {
        Mesh.SetHasPhysicsAssetInstance(false);
    }
    Mesh.MinDistFactorForKinematicUpdate = DefaultMesh.MinDistFactorForKinematicUpdate;
    Mesh.bUpdateKinematicBonesFromAnimation = DefaultMesh.bUpdateKinematicBonesFromAnimation;
    Mesh.bUpdateJointsFromAnimation = DefaultMesh.bUpdateJointsFromAnimation;
    Mesh.PhysicsWeight = DefaultMesh.PhysicsWeight;
    RestoreRBCollision(P);
    if((Mesh != none) && Mesh.PhysicsAssetInstance != none)
    {
        Mesh.PhysicsAssetInstance.SetFullAnimWeightBonesFixed(false, Mesh);
    }
    if(P.bHasBrokenConstraints && P.HasInjuredHitZones())
    {
        P.InitPartialKinematics();
        P.Mesh.UpdateMeshForBrokenConstraints();
    }
}

static function RestoreRBCollision(KFPawn P)
{
    P.Mesh.SetRBCollidesWithChannel(22, false);
    if(!P.Mesh.bUpdateKinematicBonesFromAnimation)
    {
        P.Mesh.SetRBChannel(1);        
    }
    else
    {
        P.Mesh.SetRBChannel(2);
        P.Mesh.SetRBCollidesWithChannel(2, P.default.Mesh.RBCollideWithChannels.Pawn);
    }
    P.UpdateMeshForFleXCollision();
}

defaultproperties
{
    KnockdownMaxZ=750
    MaxKnockdownPawns=5
    bCanOnlyWanderAtEnd=true
    bDisablesWeaponFiring=true
    Handle=KFSM_Knockdown
}