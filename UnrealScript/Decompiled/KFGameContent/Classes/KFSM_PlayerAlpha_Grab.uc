/*******************************************************************************
 * KFSM_PlayerAlpha_Grab generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_PlayerAlpha_Grab extends KFSM_GrappleCombined;

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

    super(KFSpecialMove).Tick(DeltaTime);
    if(((KFPOwner != none) && Follower != none) && KFPOwner.SpecialMoveFlags >= 1)
    {
        DesiredRotation = KFPOwner.Rotation;
        DesiredRotation.Yaw = int(FInterpTo(float(KFPOwner.Rotation.Yaw), float(rotator(Follower.Location - KFPOwner.Location).Yaw), DeltaTime, 1));
        ForcePawnRotation(KFPOwner, DesiredRotation, false);
    }
}

function ProcessViewRotation(float DeltaTime, out Rotator out_ViewRotation, out Rotator out_DeltaRot)
{
    if(Follower != none)
    {
        out_ViewRotation = RInterpTo(out_ViewRotation, KFPOwner.Rotation, DeltaTime, 1);
        out_DeltaRot = rot(0, 0, 0);
    }
}

defaultproperties
{
    GrappleAnims=/* Array type was not detected. */
    bUseRootMotion=true
    GrabStartAnimName=Player_Grab
    bLockPawnRotation=true
    bPawnRotationLocked=true
}