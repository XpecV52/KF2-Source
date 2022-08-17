//=============================================================================
// KFSM_PlayerAlpha_Grab
//=============================================================================
// Player controlled alpha clot grab special move
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerAlpha_Grab extends KFSM_GrappleCombined;

/** Script Tick function. */
function Tick( float DeltaTime )
{
    local rotator DesiredRotation;

    super.Tick( DeltaTime );

    if( KFPOwner != none && Follower != none && KFPOwner.SpecialMoveFlags >= EGS_GrabSuccess )
    {
        // Set pawn rotation
        DesiredRotation = KFPOwner.Rotation;
        DesiredRotation.Yaw = FInterpTo( KFPOwner.Rotation.Yaw, rotator(Follower.Location - KFPOwner.Location).Yaw, DeltaTime, 1.f );
        ForcePawnRotation( KFPOwner, DesiredRotation, false );
    }
}

/** Lock view rotation when grabbing */
function ProcessViewRotation( float DeltaTime, out rotator out_ViewRotation, out Rotator out_DeltaRot )
{
    if( Follower != none )
    {
        out_ViewRotation = RInterpTo( out_ViewRotation, KFPOwner.Rotation, DeltaTime, 1.f );
        out_DeltaRot = rot(0,0,0);
    }
}

defaultproperties
{
   GrabStartAnimName="Player_Grab"
   bUseRootMotion=True
   GrappleAnims(0)="Player_Grab_Atk_V1"
   GrappleAnims(1)="Player_Grab_Atk_V2"
   GrappleAnims(2)="Player_Grab_Atk_V3"
   bPawnRotationLocked=True
   Name="Default__KFSM_PlayerAlpha_Grab"
   ObjectArchetype=KFSM_GrappleCombined'KFGame.Default__KFSM_GrappleCombined'
}
