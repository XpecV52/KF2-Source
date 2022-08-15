/*******************************************************************************
 * KFCustomizationCamera generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFCustomizationCamera extends GameCameraBase;

var bool bInitialize;
var byte BodyViewIndex;
var byte CurrentViewIndex;
var() Vector CharacterOffset;
var() Vector HeadOffset;
var float CharacterDistance;
var float HeadDistance;
var int RotationOffset;
var int RotationRate;
var int MaxRotationRate;
var int LastRotation;
var float FadeRotationStartTime;
var float FadeRotationDuration;
var float FadeRotationScaler;

function OnBecomeActive(GameCameraBase OldCamera)
{
    SetCustomizationView(PlayerCamera, PlayerCamera.ViewTarget, CharacterOffset, CharacterDistance);
}

function UpdateCamera(Pawn P, GamePlayerCamera CameraActor, float DeltaTime, out TViewTarget OutVT)
{
    if(!bInitialize && P != none)
    {
        SetCustomizationView(CameraActor, OutVT, CharacterOffset, CharacterDistance);
        bInitialize = true;
    }
}

function SetBodyView(byte Index, optional bool bForceView)
{
    bForceView = false;
    if((BodyViewIndex != Index) || bForceView)
    {
        BodyViewIndex = Index;
        BlendCustomizationPart(PlayerCamera, BodyViewIndex);
    }
}

function BlendCustomizationPart(GamePlayerCamera CameraActor, byte Index)
{
    CurrentViewIndex = Index;
    CameraActor.ViewTarget.POV = CameraActor.CameraCache.POV;
    CameraActor.PendingViewTarget.Target = CameraActor.ViewTarget.Target;
    switch(Index)
    {
        case 0:
            SetCustomizationView(CameraActor, CameraActor.PendingViewTarget, CharacterOffset, CharacterDistance);
            break;
        case 1:
            SetCustomizationView(CameraActor, CameraActor.PendingViewTarget, HeadOffset, HeadDistance);
            break;
        default:
            break;
    }
}

function SetCustomizationView(GamePlayerCamera CameraActor, out TViewTarget OutVT, Vector Offset, float Distance)
{
    local Vector Loc, pos, HitLocation, HitNormal;
    local Rotator Rot;
    local Actor HitActor;

    Loc = OutVT.Target.Location;
    Rot = OutVT.Target.Rotation;
    Rot.Yaw += RotationOffset;
    CameraActor.BlendTimeToGo = 0.5;
    CameraActor.BlendParams.BlendTime = CameraActor.BlendTimeToGo;
    Loc += (Offset >> Rot);
    pos = Loc - (vector(Rot) * Distance);
    HitActor = CameraActor.Trace(HitLocation, HitNormal, pos, Loc, false, vect(12, 12, 12));
    OutVT.POV.Location = ((HitActor == none) ? pos : HitLocation);
    OutVT.POV.Rotation = Rot;
}

function RotatedCamera(int DirectionOffset)
{
    DirectionOffset = int(FClamp(float(DirectionOffset), float(-MaxRotationRate), float(MaxRotationRate)));
    UpdateRotation(DirectionOffset);
    LastRotation = int(float(DirectionOffset) / FadeRotationScaler);
}

function UpdateRotation(int DirectionOffset)
{
    if(PlayerCamera.PCOwner.IsTimerActive('FadeCameraRotation'))
    {
        PlayerCamera.PCOwner.ClearTimer('FadeCameraRotation', self);
    }
    RotationOffset += (DirectionOffset * RotationRate);
    if(CurrentViewIndex == 0)
    {
        SetCustomizationView(PlayerCamera, PlayerCamera.ViewTarget, CharacterOffset, CharacterDistance);        
    }
    else
    {
        SetCustomizationView(PlayerCamera, PlayerCamera.ViewTarget, HeadOffset, HeadDistance);
    }
}

function StartFadeRotation()
{
    if(LastRotation != 0)
    {
        FadeRotationDuration = Abs(float(LastRotation)) * 0.01;
        FadeRotationStartTime = PlayerCamera.PCOwner.WorldInfo.TimeSeconds;
        PlayerCamera.PCOwner.SetTimer(0.01, true, 'FadeCameraRotation', self);
    }
}

function FadeCameraRotation()
{
    local int NewRotation;
    local float RotationAlpha;

    RotationAlpha = (PlayerCamera.PCOwner.WorldInfo.TimeSeconds - FadeRotationStartTime) / FadeRotationDuration;
    RotationAlpha = FClamp(RotationAlpha, 0, 1);
    NewRotation = int(Lerp(float(LastRotation), 0, RotationAlpha));
    if(RotationAlpha >= float(1))
    {
        PlayerCamera.PCOwner.ClearTimer('FadeCameraRotation', self);
        LastRotation = 0;
        NewRotation = 0;
    }
    UpdateRotation(NewRotation);
}

defaultproperties
{
    CharacterOffset=(X=0,Y=-15,Z=6)
    HeadOffset=(X=0,Y=-15,Z=68)
    CharacterDistance=200
    HeadDistance=70
    RotationOffset=38500
    RotationRate=50
    MaxRotationRate=100
    FadeRotationDuration=0.2
    FadeRotationScaler=3.5
}