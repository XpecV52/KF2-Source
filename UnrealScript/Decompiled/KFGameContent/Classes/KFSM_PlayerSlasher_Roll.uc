/*******************************************************************************
 * KFSM_PlayerSlasher_Roll generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_PlayerSlasher_Roll extends KFSM_Evade;

var Rotator InitialRotation;

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    super(KFSM_PlaySingleAnim).SpecialMoveStarted(bForced, PrevMove);
    InitialRotation = KFPOwner.Rotation;
}

protected function bool InternalCanDoSpecialMove()
{
    return ((KFPOwner != none) && KFPOwner.Physics == 1) && super(KFSpecialMove).InternalCanDoSpecialMove();
}

static function byte PackFlagsBase(KFPawn P)
{
    return Class'KFSM_PlayerMeleeBase'.static.GetFourWayMoveDirection(P);
}

function Tick(float DeltaTime)
{
    super(KFSpecialMove).Tick(DeltaTime);
    if((KFPOwner != none) && KFPOwner.Role != ROLE_SimulatedProxy)
    {
        KFPOwner.SetRotation(InitialRotation);
    }
}

defaultproperties
{
    EvadeAnims=/* Array type was not detected. */
    bUseCustomThirdPersonViewOffset=true
    bLockPawnRotation=true
    CustomThirdPersonViewOffset=(OffsetHigh=(X=-175,Y=50,Z=-80),OffsetMid=(X=-145,Y=50,Z=-90),OffsetLow=(X=-220,Y=50,Z=-80))
    ViewOffsetInterpTime=0.3
    CustomCameraFOV=80
    CameraFOVTransitionTime=0.3
}