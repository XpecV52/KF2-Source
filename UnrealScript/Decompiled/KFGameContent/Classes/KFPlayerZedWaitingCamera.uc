/*******************************************************************************
 * KFPlayerZedWaitingCamera generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPlayerZedWaitingCamera extends GameFixedCamera;

var Actor FocalPoint;
var array<Actor> AvailableFocalPoints;
var Vector CameraOffset;
var int CameraPitchAngle;
var float CameraLingerDuration;
var float LastCameraChangeTime;
var float CameraFOV;
var float CameraYaw;
var float CameraPanSpeed;
var Color FadeColor;
var float FadeTime;
var bool bPlayedCameraFade;
var bool bPlayedExitFade;
var Color ExitFadeColor;
var export editinline PointLightComponent CameraLightTemplate;
var export editinline transient PointLightComponent CameraLight;

function OnBecomeActive(GameCameraBase OldCamera)
{
    super.OnBecomeActive(OldCamera);
    if((PlayerCamera != none) && PlayerCamera.PCOwner != none)
    {
        PlayerCamera.PCOwner.ClientSetCameraFade(true, FadeColor, vect2d(1, 0), FadeTime, true);
    }
    CameraOffset = default.CameraOffset;
    bPlayedCameraFade = false;
    bPlayedExitFade = false;
    if((CameraLight == none) && CameraLightTemplate != none)
    {
        CameraLight = new (self) Class'PointLightComponent' (CameraLightTemplate);
    }
    UpdateCameraFocalPoint();
}

function PopulateFocalPoints()
{
    local KFPlayerStart KFPS;
    local KFTraderTrigger KFTT;
    local KFPathnode KFPN;

    foreach PlayerCamera.WorldInfo.AllNavigationPoints(Class'KFPlayerStart', KFPS)
    {
        AvailableFocalPoints[AvailableFocalPoints.Length] = KFPS;        
    }    
    foreach PlayerCamera.WorldInfo.AllNavigationPoints(Class'KFPathnode', KFPN)
    {
        foreach PlayerCamera.DynamicActors(Class'KFTraderTrigger', KFTT)
        {
            if(VSizeSq(KFTT.Location - KFPN.Location) <= 160000)
            {
                AvailableFocalPoints[AvailableFocalPoints.Length] = KFPN;
                break;
            }            
        }                
    }    
}

function UpdateCameraFocalPoint()
{
    local int FocalPointNum;
    local Vector HitLocation, HitNormal, Projection;
    local KFTraderTrigger KFTT;

    if(((PlayerCamera != none) && PlayerCamera.PCOwner != none) && PlayerCamera.WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(AvailableFocalPoints.Length == 0)
        {
            PopulateFocalPoints();
        }
        if(FocalPoint != none)
        {
            FocalPointNum = AvailableFocalPoints.Find(FocalPoint;
            if(FocalPointNum != -1)
            {
                AvailableFocalPoints.Remove(FocalPointNum, 1;
            }
            if(AvailableFocalPoints.Length == 0)
            {
                PopulateFocalPoints();
            }
            FocalPoint.DetachComponent(CameraLight);
        }
        LastCameraChangeTime = PlayerCamera.WorldInfo.TimeSeconds;
        FocalPoint = AvailableFocalPoints[Rand(AvailableFocalPoints.Length)];
        foreach FocalPoint.AllActors(Class'KFTraderTrigger', KFTT)
        {
            Projection = FocalPoint.Location - KFTT.Location;
            if(VSizeSq(Projection) <= 160000)
            {
                CameraYaw = float((rotator(Projection).Yaw + (8192 - Rand(16384))) & 65535);
                break;
            }            
        }        
        PlayerCamera.PCOwner.SetViewTarget(FocalPoint);
        if(FocalPoint != none)
        {
            FocalPoint.Trace(HitLocation, HitNormal, FocalPoint.Location + (vect(0, 0, 1) * (default.CameraOffset.Z + 30)), FocalPoint.Location, false,,, FocalPoint.1);
            if(!IsZero(HitLocation))
            {
                CameraOffset.Z = VSize(HitLocation - FocalPoint.Location) - 30;                
            }
            else
            {
                CameraOffset = default.CameraOffset;
            }
            FocalPoint.AttachComponent(CameraLight);
            CameraLight.SetEnabled(true);
        }
        PlayerCamera.PCOwner.ClientSetCameraFade(true, FadeColor, vect2d(1, 0), FadeTime, true);
        bPlayedCameraFade = false;        
    }
    else
    {
        if(FocalPoint != none)
        {
            FocalPoint.DetachComponent(CameraLight);
            FocalPoint = none;
        }
    }
}

simulated function UpdateCamera(Pawn P, GamePlayerCamera CameraActor, float DeltaTime, out TViewTarget OutVT)
{
    if((PlayerCamera != none) && (PlayerCamera.WorldInfo.TimeSeconds - LastCameraChangeTime) >= (CameraLingerDuration - FadeTime))
    {
        if(!bPlayedCameraFade)
        {
            PlayerCamera.PCOwner.ClientSetCameraFade(true, FadeColor, vect2d(0, 1), FadeTime, true);
            bPlayedCameraFade = true;
        }
        if((PlayerCamera.WorldInfo.TimeSeconds - LastCameraChangeTime) >= CameraLingerDuration)
        {
            UpdateCameraFocalPoint();
        }
    }
    if(FocalPoint != none)
    {
        OutVT.POV.Location = FocalPoint.Location + CameraOffset;
        OutVT.POV.Rotation.Pitch = CameraPitchAngle;
        CameraYaw = float(int(CameraYaw + (CameraPanSpeed * DeltaTime)) & 65535);
        OutVT.POV.Rotation.Yaw = int(CameraYaw);
        OutVT.POV.FOV = CameraFOV;
        PlayerCamera.ApplyCameraModifiers(DeltaTime, OutVT.POV);
    }
    bResetCameraInterpolation = false;
    super(GameCameraBase).UpdateCamera(P, CameraActor, DeltaTime, OutVT);
}

function PlayExitFade()
{
    if(!bPlayedExitFade)
    {
        PlayerCamera.PCOwner.ClientSetCameraFade(true, ExitFadeColor, vect2d(1, 0), FadeTime, true);
        bPlayedExitFade = true;
    }
}

function OnBecomeInActive(GameCameraBase NewCamera)
{
    super(GameCameraBase).OnBecomeInActive(NewCamera);
    if(CameraLight != none)
    {
        if(FocalPoint != none)
        {
            FocalPoint.DetachComponent(CameraLight);
        }
        CameraLight.SetEnabled(false);
        CameraLight = none;
    }
    PlayExitFade();
    CameraOffset = default.CameraOffset;
    FocalPoint = none;
    bPlayedCameraFade = false;
}

defaultproperties
{
    CameraOffset=(X=0,Y=0,Z=300)
    CameraPitchAngle=-3072
    CameraLingerDuration=12
    CameraFOV=160
    CameraPanSpeed=256
    FadeTime=1
    ExitFadeColor=(B=255,G=255,R=255,A=0)
    begin object name=PointLightTemplate class=PointLightComponent
        Radius=2000
        FalloffExponent=10
        Brightness=0.2
        LightColor=(B=235,G=255,R=230,A=255)
        bEnabled=false
        CastShadows=false
        CastStaticShadows=false
        CastDynamicShadows=false
        LightingChannels=(Outdoor=true)
    object end
    // Reference: PointLightComponent'Default__KFPlayerZedWaitingCamera.PointLightTemplate'
    CameraLightTemplate=PointLightTemplate
}