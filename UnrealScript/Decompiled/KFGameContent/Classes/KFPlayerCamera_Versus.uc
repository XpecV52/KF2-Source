/*******************************************************************************
 * KFPlayerCamera_Versus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPlayerCamera_Versus extends KFPlayerCamera
    transient
    hidecategories(Navigation);

/** Implements zed waiting camera */
var(Camera) editinline transient KFPlayerZedWaitingCamera PlayerZedWaitingCam;
/** Class to use for zed waiting camera. */
var(Camera) protected const class<KFPlayerZedWaitingCamera> PlayerZedWaitingCameraClass;
/** Implements zed suicide camera */
var(Camera) editinline transient KFPlayerZedSuicideCamera PlayerZedSuicideCam;
/** Class to use for zed suicide camera. */
var(Camera) protected const class<KFPlayerZedSuicideCamera> PlayerZedSuicideCameraClass;

function PostBeginPlay()
{
    super.PostBeginPlay();
    if((PlayerZedWaitingCam == none) && PlayerZedWaitingCameraClass != none)
    {
        PlayerZedWaitingCam = KFPlayerZedWaitingCamera(CreateCamera(PlayerZedWaitingCameraClass));
    }
}

function SwapToZedSuicideCam(Vector SuicideLocation)
{
    local GameCameraBase NewCamera;

    if((PlayerZedSuicideCam == none) && PlayerZedSuicideCameraClass != none)
    {
        PlayerZedSuicideCam = KFPlayerZedSuicideCamera(CreateCamera(PlayerZedSuicideCameraClass));
    }
    NewCamera = PlayerZedSuicideCam;
    if(CurrentCamera != NewCamera)
    {
        if(CurrentCamera != none)
        {
            CurrentCamera.OnBecomeInActive(NewCamera);
        }
        if(NewCamera != none)
        {
            NewCamera.OnBecomeActive(CurrentCamera);
        }
        CurrentCamera = NewCamera;
    }
    PlayerZedSuicideCam.InitSuicideCam(SuicideLocation);
}

protected function GameCameraBase FindBestCameraType(Actor CameraTarget)
{
    if(CameraStyle == 'PlayerZedWaiting')
    {
        return PlayerZedWaitingCam;        
    }
    else
    {
        if(CameraStyle == 'ZedSuicide')
        {
            return PlayerZedSuicideCam;
        }
    }
    return super.FindBestCameraType(CameraTarget);
}

defaultproperties
{
    PlayerZedWaitingCameraClass=Class'KFPlayerZedWaitingCamera'
    PlayerZedSuicideCameraClass=Class'KFPlayerZedSuicideCamera'
    ThirdPersonCameraClass=Class'KFThirdPersonCamera_Versus'
}