/*******************************************************************************
 * KFDemoRecSpectator generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDemoRecSpectator extends KFPlayerController
    config(Game)
    hidecategories(Navigation);

var bool bFindPlayer;
var config bool bLockRotationToViewTarget;
var config bool bAutoSwitchPlayers;
var PlayerReplicationInfo MyRealViewTarget;
var config float AutoSwitchPlayerInterval;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.bOutOfLives = true;
    }
}

simulated event ReceivedPlayer()
{
    super.ReceivedPlayer();
    if((Role == ROLE_Authority) && WorldInfo.Game != none)
    {
        ClientSetHUD(WorldInfo.Game.HUDType);
    }
}

function InitPlayerReplicationInfo()
{
    super(Controller).InitPlayerReplicationInfo();
    PlayerReplicationInfo.PlayerName = "DemoRecSpectator";
    PlayerReplicationInfo.bIsSpectator = true;
    PlayerReplicationInfo.bOnlySpectator = true;
    PlayerReplicationInfo.bOutOfLives = true;
    PlayerReplicationInfo.bWaitingPlayer = false;
}

function SetGFxHUD(KFGFxMoviePlayer_HUD NewGFxHud)
{
    super.SetGFxHUD(NewGFxHud);
    if(NewGFxHud != none)
    {
        NewGFxHud.bCaptureInput = false;
    }
}

exec function Slomo(float NewTimeDilation)
{
    WorldInfo.DemoPlayTimeDilation = NewTimeDilation;
}

exec function ViewClass(class<Actor> aClass, optional bool bQuiet, optional bool bCheat)
{
    local Actor Other, first;
    local bool bFound;

    first = none;
    foreach AllActors(aClass, Other)
    {
        if(bFound || first == none)
        {
            first = Other;
            if(bFound)
            {
                break;
            }
        }
        if(Other == ViewTarget)
        {
            bFound = true;
        }        
    }    
    if(first != none)
    {
        SetViewTarget(first);        
    }
    else
    {
        SetViewTarget(self);
    }
}

exec function DemoViewNextPlayer()
{
    local Pawn P, Pick;
    local bool bFound;

    foreach WorldInfo.AllPawns(Class'Pawn', P)
    {
        if(P.PlayerReplicationInfo != none)
        {
            if(Pick == none)
            {
                Pick = P;
            }
            if(bFound)
            {
                Pick = P;
                break;
                continue;
            }
            bFound = (RealViewTarget == P.PlayerReplicationInfo) || ViewTarget == P;
        }        
    }    
    SetViewTarget(Pick);
}

function SetViewTarget(Actor NewViewTarget, optional ViewTargetTransitionParams TransitionParams)
{
    super.SetViewTarget(NewViewTarget, TransitionParams);
    if(NewViewTarget != self)
    {
        MyRealViewTarget = RealViewTarget;
    }
}

unreliable server function ServerViewSelf(optional ViewTargetTransitionParams TransitionParams)
{
    super.ServerViewSelf(TransitionParams);
    MyRealViewTarget = none;
}

reliable client simulated function ClientSetRealViewTarget(PlayerReplicationInfo NewTarget)
{
    SetViewTarget(self);
    RealViewTarget = NewTarget;
    MyRealViewTarget = NewTarget;
    bFindPlayer = NewTarget == none;
}

function bool SetPause(bool bPause, optional delegate<CanUnpause> CanUnpauseDelegate)
{
    CanUnpauseDelegate = CanUnpause;
    if(WorldInfo.NetMode == NM_Client)
    {
        WorldInfo.Pauser = ((bPause) ? PlayerReplicationInfo : none);
        return true;        
    }
    else
    {
        return false;
    }
}

exec function Pause()
{
    if(WorldInfo.NetMode == NM_Client)
    {
        ServerPause();
    }
}

simulated event GetPlayerViewPoint(out Vector CameraLocation, out Rotator CameraRotation)
{
    super(PlayerController).GetPlayerViewPoint(CameraLocation, CameraRotation);
}

function UpdateRotation(float DeltaTime)
{
    local Rotator NewRotation;

    if(bLockRotationToViewTarget)
    {
        SetRotation(ViewTarget.Rotation);        
    }
    else
    {
        super(PlayerController).UpdateRotation(DeltaTime);
    }
    if(Rotation.Roll != 0)
    {
        NewRotation = Rotation;
        NewRotation.Roll = 0;
        SetRotation(NewRotation);
    }
}

exec function FOV(float F)
{
    super(PlayerController).FOV(F);
}

auto state Spectating
{
    function BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        if(bAutoSwitchPlayers)
        {
            SetTimer(AutoSwitchPlayerInterval, true, 'DemoViewNextPlayer');
        }
    }

    exec function StartFire(optional byte FireModeNum)
    {
        DemoViewNextPlayer();
    }

    function SendInitialViewTarget()
    {
        local PlayerController PC;

        foreach LocalPlayerControllers(Class'PlayerController', PC)
        {
            if(!PC.PlayerReplicationInfo.bOnlySpectator)
            {
                ClientSetRealViewTarget(PC.PlayerReplicationInfo);                
                return;
            }            
        }        
        ClientSetRealViewTarget(none);
    }

    simulated event GetPlayerViewPoint(out Vector CameraLocation, out Rotator CameraRotation)
    {
        global.GetPlayerViewPoint(CameraLocation, CameraRotation);
    }

    event PlayerTick(float DeltaTime)
    {
        local Pawn P;

        global.PlayerTick(DeltaTime);
        if(Role == ROLE_AutonomousProxy)
        {
            if((RealViewTarget == none) && MyRealViewTarget != none)
            {
                RealViewTarget = MyRealViewTarget;
            }
            if(((RealViewTarget == none) || RealViewTarget == PlayerReplicationInfo) && bFindPlayer)
            {
                DemoViewNextPlayer();
                if((RealViewTarget != none) && RealViewTarget != PlayerReplicationInfo)
                {
                    bFindPlayer = false;
                }                
            }
            else
            {
                if(((RealViewTarget != none) && RealViewTarget != PlayerReplicationInfo) && (Pawn(ViewTarget) == none) || Pawn(ViewTarget).PlayerReplicationInfo != RealViewTarget)
                {
                    foreach WorldInfo.AllPawns(Class'Pawn', P)
                    {
                        if(P.PlayerReplicationInfo == RealViewTarget)
                        {
                            SetViewTarget(P);
                            break;
                        }                        
                    }                    
                }
            }
            if(Pawn(ViewTarget) != none)
            {
                TargetViewRotation = ViewTarget.Rotation;
                TargetViewRotation.Pitch = Pawn(ViewTarget).RemoteViewPitch << 8;
            }
        }
    }
Begin:

    if(Role == ROLE_Authority)
    {
        Sleep(0);
        Sleep(0);
        SendInitialViewTarget();
    }
    stop;        
}

defaultproperties
{
    StingerAkComponent=AkComponent'Default__KFDemoRecSpectator.AkComponent'
    AmplificationLightTemplate=PointLightComponent'Default__KFDemoRecSpectator.AmplificationLightTemplate'
    NVGLightTemplate=PointLightComponent'Default__KFDemoRecSpectator.NVGLightTemplate'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFDemoRecSpectator.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFDemoRecSpectator.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFDemoRecSpectator.AkComponent'
    RemoteRole=ENetRole.ROLE_AutonomousProxy
    bDemoOwner=true
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFDemoRecSpectator.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}