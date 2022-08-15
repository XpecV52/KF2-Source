/*******************************************************************************
 * KFPlayerCamera generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPlayerCamera extends GamePlayerCamera
    transient
    hidecategories(Navigation);

/** Implements typical third person camera. */
var(Camera) editinline transient KFCustomizationCamera CustomizationCam;
/** Class to use for third person camera. */
var(Camera) protected const class<KFCustomizationCamera> CustomizationCameraClass;
/** Implements the boss camera. */
var(Camera) editinline transient KFBossCamera BossCam;
/** Class to use for viewing the boss camera. */
var(Camera) protected const class<KFBossCamera> BossCameraClass;
/** Implements typical first person camera. */
var(Camera) editinline transient KFFirstPersonCamera FirstPersonCam;
/** Class to use for first person camera. */
var(Camera) protected const class<GameCameraBase> FirstPersonCameraClass;
/** The FOV that the Camera is trying to acheive */
var() float TargetFOV;
var float TransitionStartFOV;
var float TransitionTimeElapsed;
var float TransitionTimeTotal;

function PostBeginPlay()
{
    super.PostBeginPlay();
    if((CustomizationCam == none) && CustomizationCameraClass != none)
    {
        CustomizationCam = KFCustomizationCamera(CreateCamera(CustomizationCameraClass));
    }
    if((BossCam == none) && BossCameraClass != none)
    {
        BossCam = KFBossCamera(CreateCamera(BossCameraClass));
    }
    if((FirstPersonCam == none) && FirstPersonCameraClass != none)
    {
        FirstPersonCam = KFFirstPersonCamera(CreateCamera(FirstPersonCameraClass));
    }
}

simulated function DoUpdateCamera(float DeltaTime)
{
    super(Camera).DoUpdateCamera(DeltaTime * ViewTarget.Target.CustomTimeDilation);
}

simulated function UpdateViewTarget(out TViewTarget OutVT, float DeltaSeconds)
{
    local float CurrentFOVAngle, TransitionDelta;

    super.UpdateViewTarget(OutVT, DeltaSeconds);
    if(CameraActor(OutVT.Target) != none)
    {
        SetFOV(0);        
    }
    else
    {
        CurrentFOVAngle = GetFOVAngle();
        if((TransitionTimeTotal > 0) && CurrentFOVAngle != TargetFOV)
        {
            TransitionTimeElapsed += DeltaSeconds;
            if(TransitionTimeElapsed > TransitionTimeTotal)
            {
                TransitionTimeElapsed = TransitionTimeTotal;
                TransitionDelta = 1;                
            }
            else
            {
                TransitionDelta = TransitionTimeElapsed / TransitionTimeTotal;
            }
            CurrentFOVAngle = Lerp(TransitionStartFOV, TargetFOV, TransitionDelta);
            SetFOV(CurrentFOVAngle);
        }
    }
    UpdateCameraLensEffects(OutVT);
}

function TransitionFOV(float NewFOV, float TransitionTime)
{
    NewFOV *= (GetOptionsFOVScale());
    if(TransitionTime > 0)
    {
        TargetFOV = NewFOV;
        TransitionTimeTotal = TransitionTime;
        TransitionStartFOV = GetFOVAngle();
        TransitionTimeElapsed = 0;        
    }
    else
    {
        SetFOV(NewFOV);
        TransitionTimeTotal = 0;
    }
}

function float GetOptionsFOVScale()
{
    local float FOVScale;

    FOVScale = Class'KFGameEngine'.default.FOVOptionsPercentageValue;
    return FClamp(FOVScale, 0.75, 1.25);
}

function SetFOV(float NewFOV)
{
    TransitionTimeTotal = 0;
    TargetFOV = NewFOV;
    super(Camera).SetFOV(NewFOV);
}

static function float CalcRadialShakeScale(Camera Cam, Vector Epicenter, float InnerRadius, float OuterRadius, float Falloff)
{
    local Vector POVLoc;
    local float DistPct;

    POVLoc = Cam.CameraCache.POV.Location;
    if(InnerRadius < OuterRadius)
    {
        DistPct = (VSize(Epicenter - POVLoc) - InnerRadius) / (OuterRadius - InnerRadius);
        DistPct = 1 - FClamp(DistPct, 0, 1);
        return DistPct ** Falloff;        
    }
    else
    {
        return ((VSize(Epicenter - POVLoc) < InnerRadius) ? 1 : 0);
    }
}

protected function GameCameraBase FindBestCameraType(Actor CameraTarget)
{
    if(CameraStyle == 'ThirdPerson')
    {
        return ThirdPersonCam;        
    }
    else
    {
        if(CameraStyle == 'Boss')
        {
            return BossCam;            
        }
        else
        {
            if(CameraStyle == 'Customization')
            {
                return CustomizationCam;                
            }
            else
            {
                if(CameraStyle == 'FirstPerson')
                {
                    return FirstPersonCam;
                }
            }
        }
    }
    return super.FindBestCameraType(CameraTarget);
}

defaultproperties
{
    CustomizationCameraClass=Class'KFCustomizationCamera'
    BossCameraClass=Class'KFBossCamera'
    FirstPersonCameraClass=Class'KFFirstPersonCamera'
    ThirdPersonCameraClass=Class'KFThirdPersonCamera'
    DefaultFOV=90
    FreeCamOffset=(X=0,Y=0,Z=68)
}