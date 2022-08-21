/*******************************************************************************
 * KFSM_PlayerPatriarch_TentacleGrab generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_PlayerPatriarch_TentacleGrab extends KFSM_Patriarch_Grapple;

var float MinGrabTargetFOV;

protected function bool InternalCanDoSpecialMove()
{
    local KFPawn KFP, BestTarget;
    local Vector CameraNormal, Projection;
    local float FOV, DistSq, BestDistSq, TentacleRangeSQ;

    if((PCOwner == none) || PCOwner.PlayerCamera == none)
    {
        return false;
    }
    if((KFPOwner != none) && KFPOwner.IsLocallyControlled())
    {
        CameraNormal = vector(PCOwner.PlayerCamera.CameraCache.POV.Rotation);
        TentacleRangeSQ = Square(MaxRange + TentacleEndBoneOffset);
        foreach KFPOwner.WorldInfo.AllPawns(Class'KFPawn', KFP)
        {
            if(CanInteractWithPawn(KFP))
            {
                Projection = KFP.Location - KFPOwner.Location;
                DistSq = VSizeSq(Projection);
                if(DistSq <= TentacleRangeSQ)
                {
                    FOV = CameraNormal Dot Normal(Projection);
                    if(FOV > MinGrabTargetFOV)
                    {
                        if(!IsPawnPathClear(KFPOwner, KFP, KFP.Location, KFPOwner.Location, vect(1, 1, 1), true))
                        {
                            continue;                            
                        }
                        if((BestTarget == none) || DistSq < BestDistSq)
                        {
                            BestDistSq = DistSq;
                            BestTarget = KFP;
                        }
                    }
                }
            }            
        }        
        if(BestTarget != none)
        {
            KFPOwner.InteractionPawn = BestTarget;
        }
        return true;
    }
    return super(KFSM_GrappleCombined).InternalCanDoSpecialMove();
}

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    local KFPawn_ZedPatriarch MyPatPawn;

    if(KFPOwner != none)
    {
        MyPatPawn = KFPawn_ZedPatriarch(KFPOwner);
    }
    if(MyPatPawn != none)
    {
        TentacleDamage = MyPatPawn.TentacleDamage;
        TentacleDmgType = MyPatPawn.TentacleDamageType;
    }
    super.SpecialMoveStarted(bForced, PrevMove);
}

function StartInteraction()
{
    super.StartInteraction();
    if(Follower != none)
    {
        ++ KFPlayerReplicationInfoVersus(KFPOwner.PlayerReplicationInfo).ZedGrabs;
    }
}

function Tick(float DeltaTime)
{
    local Rotator DesiredRotation;

    super(GameSpecialMove).Tick(DeltaTime);
    if(((KFPOwner != none) && Follower != none) && KFPOwner.SpecialMoveFlags >= 1)
    {
        DesiredRotation = KFPOwner.Rotation;
        DesiredRotation.Yaw = int(FInterpTo(float(KFPOwner.Rotation.Yaw), float(rotator(Follower.Location - KFPOwner.Location).Yaw), DeltaTime, 1));
        ForcePawnRotation(KFPOwner, DesiredRotation, false);
    }
}

function ProcessViewRotation(float DeltaTime, out Rotator out_ViewRotation, out Rotator out_DeltaRot)
{
    if(((KFPOwner != none) && Follower != none) && KFPOwner.SpecialMoveFlags >= 1)
    {
        out_ViewRotation = RInterpTo(out_ViewRotation, KFPOwner.Rotation, DeltaTime, 1);
        out_DeltaRot = rot(0, 0, 0);
    }
}

defaultproperties
{
    MinGrabTargetFOV=0.85
    Handle=KFSM_PlayerPatriarch_TentacleGrab
}