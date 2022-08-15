/*******************************************************************************
 * GamePlayerCamera generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GamePlayerCamera extends Camera
    transient
    native(Camera)
    hidecategories(Navigation);

/** Implements typical third person camera. */
var(Camera) editinline transient GameCameraBase ThirdPersonCam;
/** Class to use for third person camera. */
var(Camera) protected const class<GameCameraBase> ThirdPersonCameraClass;
/** Implements fixed camera, used for viewing through pre-placed camera actors. */
var(Camera) editinline transient GameCameraBase FixedCam;
/** Class to use for third person camera. */
var(Camera) protected const class<GameCameraBase> FixedCameraClass;
/** Which camera is currently active. */
var(Camera) editinline transient GameCameraBase CurrentCamera;
var transient bool bUseForcedCamFOV;
var transient bool bInterpolateCamChanges;
var private transient bool bResetInterp;
var transient float ForcedCamFOV;
var private transient Actor LastViewTarget;
/** Scalar applied to all screen shakes in splitscreen. Normally used to dampen, since shakes feel more intense in a smaller viewport. */
var() protected const float SplitScreenShakeScale;
var protected transient Actor LastTargetBase;
var protected transient Matrix LastTargetBaseTM;

protected function GameCameraBase CreateCamera(class<GameCameraBase> CameraClass)
{
    local GameCameraBase NewCam;

    NewCam = new (Outer) CameraClass;
    NewCam.PlayerCamera = self;
    NewCam.Init();
    return NewCam;
}

// Export UGamePlayerCamera::execCacheLastTargetBaseInfo(FFrame&, void* const)
protected native function CacheLastTargetBaseInfo(Actor TargetBase);

function PostBeginPlay()
{
    super.PostBeginPlay();
    if((ThirdPersonCam == none) && ThirdPersonCameraClass != none)
    {
        ThirdPersonCam = CreateCamera(ThirdPersonCameraClass);
    }
    if((FixedCam == none) && FixedCameraClass != none)
    {
        FixedCam = CreateCamera(FixedCameraClass);
    }
}

function Reset()
{
    bUseForcedCamFOV = false;
}

protected function GameCameraBase FindBestCameraType(Actor CameraTarget)
{
    local GameCameraBase BestCam;

    if(CameraStyle == 'Default')
    {
        if(CameraActor(CameraTarget) != none)
        {
            BestCam = FixedCam;            
        }
        else
        {
            BestCam = ThirdPersonCam;
        }
    }
    return BestCam;
}

function bool ShouldConstrainAspectRatio()
{
    return false;
}

function UpdateViewTarget(out TViewTarget OutVT, float DeltaTime)
{
    local Pawn P;
    local GameCameraBase NewCamera;
    local CameraActor CamActor;

    if(((PendingViewTarget.Target != none) && OutVT == ViewTarget) && BlendParams.bLockOutgoing)
    {
        return;
    }
    if(OutVT.Target == none)
    {
        LogInternal("Camera::UpdateViewTarget OutVT.Target == None");
        return;
    }
    P = Pawn(OutVT.Target);
    NewCamera = FindBestCameraType(OutVT.Target);
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
    if(CurrentCamera != none)
    {
        if(bResetInterp && !bInterpolateCamChanges)
        {
            CurrentCamera.ResetInterpolation();
        }
        CamActor = CameraActor(OutVT.Target);
        if(CamActor != none)
        {
            CamActor.GetCameraView(DeltaTime, OutVT.POV);
            if((CurrentCamera == FixedCam) && CamActor.bConstrainAspectRatio)
            {
                bConstrainAspectRatio = true;
                OutVT.AspectRatio = CamActor.AspectRatio;
            }
            CamOverridePostProcessAlpha = CamActor.CamOverridePostProcessAlpha;
            if(CamOverridePostProcessAlpha > 0)
            {
                CamPostProcessSettings = CamActor.CamOverridePostProcess;
            }
        }
        CurrentCamera.UpdateCamera(P, self, DeltaTime, OutVT);
        if(CameraStyle == 'FreeCam_Default')
        {
            super.UpdateViewTarget(OutVT, DeltaTime);
        }        
    }
    else
    {
        super.UpdateViewTarget(OutVT, DeltaTime);
    }
    if(bUseForcedCamFOV)
    {
        OutVT.POV.FOV = ForcedCamFOV;
    }
    OutVT.POV.FOV = AdjustFOVForViewport(OutVT.POV.FOV, P);
    SetRotation(OutVT.POV.Rotation);
    SetLocation(OutVT.POV.Location);
    CacheLastTargetBaseInfo(OutVT.Target.Base);
    bResetInterp = false;
}

simulated function UpdateCameraLensEffects(const out TViewTarget OutVT)
{
    local int Idx;

    Idx = 0;
    J0x0B:

    if(Idx < CameraLensEffects.Length)
    {
        if(CameraLensEffects[Idx] != none)
        {
            CameraLensEffects[Idx].UpdateLocation(OutVT.POV.Location, OutVT.POV.Rotation, GetFOVAngle());
        }
        ++ Idx;
        goto J0x0B;
    }
}

simulated function DisplayDebug(HUD HUD, out float out_YL, out float out_YPos)
{
    local Canvas Canvas;

    super.DisplayDebug(HUD, out_YL, out_YPos);
    Canvas = HUD.Canvas;
    Canvas.SetDrawColor(255, 255, 255);
    Canvas.DrawText((("  " @ "CurrentCamera:'") $ string(CurrentCamera)) $ "'");
    out_YPos += out_YL;
    Canvas.SetPos(4, out_YPos);
    if(CurrentCamera != none)
    {
        CurrentCamera.DisplayDebug(HUD, out_YL, out_YPos);
    }
}

simulated function SetColorScale(Vector NewColorScale)
{
    if(bEnableColorScaling == true)
    {
        bEnableColorScaling = true;
        ColorScale = NewColorScale;
        bEnableColorScaleInterp = false;
    }
}

simulated function ResetInterpolation()
{
    bResetInterp = true;
}

function ProcessViewRotation(float DeltaTime, out Rotator out_ViewRotation, out Rotator out_DeltaRot)
{
    if(CurrentCamera != none)
    {
        CurrentCamera.ProcessViewRotation(DeltaTime, ViewTarget.Target, out_ViewRotation, out_DeltaRot);
    }
}

// Export UGamePlayerCamera::execAdjustFOVForViewport(FFrame&, void* const)
protected native final function float AdjustFOVForViewport(float inHorizFOV, Pawn CameraTargetPawn);

defaultproperties
{
    ThirdPersonCameraClass=Class'GameThirdPersonCamera'
    FixedCameraClass=Class'GameFixedCamera'
    CameraStyle=Default
    DefaultFOV=70
}