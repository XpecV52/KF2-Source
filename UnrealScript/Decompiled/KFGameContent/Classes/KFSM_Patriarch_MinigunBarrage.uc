/*******************************************************************************
 * KFSM_Patriarch_MinigunBarrage generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_Patriarch_MinigunBarrage extends KFSM_PlaySingleAnim;

var KFPawn_ZedPatriarch MyPatPawn;
var KFAIController_ZedPatriarch MyPatController;
var name AimOffsetProfileName;
var name WindUpAnimName;
var name WindDownAnimName;
var array<name> FanAnimNames;
var bool bIsFanFire;
var bool bInterrupted;
var bool bObstructed;
var Rotator FocusFireRotationRate;
var AkEvent MinigunLoop;
var AkEvent MinigunLoopEnd;
var float VisibilityCheckTime;

static function byte PackSMFlags(bool bIsFanFireAttack)
{
    return byte(((bIsFanFireAttack) ? 1 : 0) + (Rand(default.FanAnimNames.Length) << 4));
}

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    local byte Type, Variant;

    MyPatPawn = KFPawn_ZedPatriarch(KFPOwner);
    Type = byte(MyPatPawn.SpecialMoveFlags & 15);
    Variant = byte(MyPatPawn.SpecialMoveFlags >> 4);
    if(Type > 0)
    {
        bDisableMovement = true;
        MyPatPawn.bSprayingFire = true;
        bIsFanFire = true;
        AnimName = FanAnimNames[Variant];        
    }
    else
    {
        bDisableMovement = !MyPatPawn.CanMoveWhenMinigunning();
        MyPatPawn.bSprayingFire = false;
        if(MyPatPawn.Role == ROLE_Authority)
        {
            MyPatPawn.SetGunTracking(true);
        }
        AnimName = default.AnimName;
    }
    super.SpecialMoveStarted(bForced, PrevMove);
    MyPatPawn.SetCloaked(false);
    MyPatPawn.SetSprinting(false);
    MyPatPawn.ZeroMovementVariables();
    MyPatPawn.PlayMinigunWarnDialog();
    MyPatController = KFAIController_ZedPatriarch(MyPatPawn.Controller);
    PlayWindUpAnimation();
    MyPatPawn.SetAimOffsetNodesProfile(AimOffsetProfileName);
    MyPatPawn.bEnableAimOffset = true;
    if((MyPatPawn.Role == ROLE_Authority) && !MyPatPawn.IsHumanControlled())
    {
        MyPatPawn.SetTimer(VisibilityCheckTime, false, 'Timer_CheckEnemyLOS', self);
    }
    bObstructed = false;
    bInterrupted = false;
}

function KFGame.KFPawn.EAnimSlotStance GetAnimStance()
{
    return ((bDisableMovement) ? 0 : 1);
}

function PlayAnimation();

function PlayWindUpAnimation()
{
    if(MyPatPawn.bSprayingFire)
    {
        bUseRootMotion = true;
        AnimStance = 0;
        EnableRootMotion();        
    }
    else
    {
        AnimStance = 1;
    }
    PlaySpecialMoveAnim(WindUpAnimName, AnimStance, BlendInTime, BlendOutTime, 1);
    MyPatPawn.SpinMinigunBarrels(true);
    MyPatPawn.PostAkEventOnBone(MinigunLoop, 'BarrelSpinner', true, true);
}

function Timer_CheckEnemyLOS()
{
    local Vector StartTrace, EndTrace;

    if((MyPatPawn != none) && MyPatPawn.Controller != none)
    {
        MyPatPawn.Mesh.GetSocketWorldLocationAndRotation('MissileCenter', StartTrace);
        EndTrace = StartTrace + (Normal(MyPatPawn.Controller.Enemy.Location - StartTrace) * 300);
        if(!MyPatPawn.FastTrace(EndTrace, StartTrace,, true))
        {
            MyPatPawn.DoSpecialMove(23, true,, 128);
        }
    }
}

function SpecialMoveFlagsUpdated()
{
    switch(MyPatPawn.SpecialMoveFlags)
    {
        case 64:
            bInterrupted = true;
            MyPatPawn.StopBodyAnim(AnimStance, 0.1);
            PlayWindDownAnim();
            break;
        case 128:
            bObstructed = true;
            MyPatPawn.StopBodyAnim(AnimStance, 0.1);
            PlayWindDownAnim();
            break;
        default:
            break;
    }
}

function PlayFireAnim()
{
    if(bInterrupted || bObstructed)
    {
        return;
    }
    MyPatPawn.PlayMinigunAttackDialog();
    if(bIsFanFire)
    {
        MyPatPawn.bDisableTurnInPlace = true;
        bUseRootMotion = true;
        AnimStance = 0;
        EnableRootMotion();
        PlaySpecialMoveAnim(AnimName, AnimStance, 0.1, 0.2);        
    }
    else
    {
        MyPatPawn.RotationRate = FocusFireRotationRate;
        MyPatPawn.bDisableTurnInPlace = false;
        bUseRootMotion = false;
        AnimStance = 1;
        DisableRootMotion();
        PlaySpecialMoveAnim(AnimName, AnimStance, BlendInTime, BlendOutTime, 1);
    }
    MyPatPawn.ZeroMovementVariables();
    if((MyPatPawn.Role == ROLE_Authority) || MyPatPawn.IsLocallyControlled())
    {
        MyPatPawn.Weapon.StartFire(0);
    }
    if(((MyPatPawn.Role == ROLE_Authority) && !bIsFanFire) && !MyPatPawn.IsHumanControlled())
    {
        MyPatPawn.SetTimer(0.1, true, 'Timer_CheckIfFireAllowed', self);
        MyPatPawn.SetTimer(2, true, 'Timer_SearchForMinigunTargets', self);
    }
}

function Timer_CheckIfFireAllowed()
{
    local KFPawn KFP;
    local Vector PawnDir, Projection, OtherProjection, PawnRot2D;
    local float DistSq;

    if(((MyPatController.Enemy == none) || !MyPatController.Enemy.IsAliveAndWell()) || !MyPatPawn.FastTrace(MyPatController.Enemy.Location, MyPatPawn.Location,, true))
    {
        Timer_SearchForMinigunTargets();
    }
    if((MyPatController.Enemy == none) || !MyPatController.Enemy.IsAliveAndWell())
    {
        MyPatPawn.DoSpecialMove(23, true,, 64);
        return;
    }
    PawnDir = vector(MyPatPawn.Rotation);
    Projection = MyPatController.Enemy.Location - MyPatPawn.Location;
    DistSq = VSizeSq(Projection);
    foreach MyPatPawn.WorldInfo.AllPawns(Class'KFPawn', KFP)
    {
        OtherProjection = KFP.Location - MyPatPawn.Location;
        if((((((KFP != MyPatController.Enemy) && KFP.IsAliveAndWell()) && KFP.GetTeamNum() != MyPatPawn.GetTeamNum()) && VSizeSq(OtherProjection) < DistSq) && (PawnDir Dot Normal(OtherProjection)) >= 0.8) && MyPatPawn.FastTrace(KFP.Location, MyPatPawn.Location,, true))
        {
            MyPatController.ChangeEnemy(KFP, false);
            MyPatPawn.SetTimer(2, true, 'Timer_SearchForMinigunTargets', self);
            MyPatPawn.SetGunTracking(true);
            if(!MyPatPawn.IsFiring())
            {
                MyPatPawn.Weapon.StartFire(0);
            }            
            return;
        }        
    }    
    if((MyPatPawn.Controller != none) && MyPatController.Enemy != none)
    {
        PawnRot2D = PawnDir;
        PawnRot2D.Z = 0;
        if((PawnRot2D Dot Normal2D(Projection)) >= 0.5)
        {
            if(!MyPatPawn.IsFiring())
            {
                MyPatPawn.Weapon.StartFire(0);
            }
            return;
        }
    }
    if(MyPatPawn.IsFiring())
    {
        MyPatPawn.StopFiring();
    }
}

function Timer_SearchForMinigunTargets()
{
    if(bIsFanFire || MyPatController == none)
    {
        return;
    }
    if(MyPatController.CheckForEnemiesInFOV(4000, 0.25, 1, true, false) != none)
    {
        MyPatPawn.SetGunTracking(true);
        return;
    }
    if((MyPatController.Enemy == none) || !MyPatPawn.FastTrace(MyPatController.Enemy.Location, MyPatPawn.Location,, true))
    {
        MyPatPawn.DoSpecialMove(23, true,, 64);
    }
}

function PlayWindDownAnim()
{
    if(bObstructed)
    {
        MyPatPawn.StopBodyAnim(AnimStance, 0.33);
    }
    MyPatPawn.ClearTimer('Timer_CheckIfFireAllowed', self);
    MyPatPawn.ClearTimer('Timer_SearchForMinigunTargets', self);
    if((MyPatPawn.Weapon != none) && !MyPatPawn.Weapon.IsInState('Active'))
    {
        MyPatPawn.StopFiring();
        MyPatPawn.Weapon.GotoState('Active');
    }
    MyPatPawn.ZeroMovementVariables();
    if(bDisableMovement)
    {
        bUseRootMotion = true;
        AnimStance = 0;
        EnableRootMotion();
    }
    MyPatPawn.SpinMinigunBarrels(false);
    MyPatPawn.SetGunTracking(false);
    AnimStance = GetAnimStance();
    PlaySpecialMoveAnim(WindDownAnimName, AnimStance, BlendInTime, BlendOutTime, 1);
    MyPatPawn.PostAkEventOnBone(MinigunLoopEnd, 'BarrelSpinner', true, true);
}

function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
    switch(DeferredSeqName)
    {
        case WindUpAnimName:
            PlayFireAnim();
            break;
        case AnimName:
            PlayWindDownAnim();
            break;
        case WindDownAnimName:
            KFPOwner.EndSpecialMove();
            break;
        default:
            break;
    }
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    if(MyPatPawn != none)
    {
        if(!bObstructed)
        {
            MyPatPawn.StartWeaponCooldown();
        }
        if(MyPatPawn.IsFiring())
        {
            if(KFPOwner.BodyStanceNodes[AnimStance].bIsPlayingCustomAnim)
            {
                KFPOwner.StopBodyAnim(AnimStance, AbortBlendOutTime);
            }
        }
        if((MyPatPawn.Weapon != none) && !MyPatPawn.Weapon.IsInState('Active'))
        {
            MyPatPawn.StopFiring();
            MyPatPawn.Weapon.GotoState('Active');
        }
        if(MyPatPawn.bSpinBarrels)
        {
            MyPatPawn.PostAkEventOnBone(MinigunLoopEnd, 'BarrelSpinner', true, true);
        }
        MyPatPawn.bEnableAimOffset = false;
        MyPatPawn.SetDefaultAimOffsetNodesProfile();
        MyPatPawn.ClearTimer('Timer_SearchForMinigunTargets', self);
        MyPatPawn.ClearTimer('Timer_CheckIfFireAllowed', self);
        MyPatPawn.ClearTimer('Timer_CheckEnemyLOS', self);
        MyPatPawn.SetGunTracking(false);
        MyPatPawn.SpinMinigunBarrels(false);
        MyPatPawn.bSprayingFire = false;
        MyPatPawn.RotationRate = MyPatPawn.default.RotationRate;
        MyPatPawn.bDisableTurnInPlace = MyPatPawn.default.bDisableTurnInPlace;
        MyPatPawn = none;
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
}

defaultproperties
{
    AimOffsetProfileName=Minigun
    WindUpAnimName=Gun_TO_Load
    WindDownAnimName=Gun_TO_Idle
    FanAnimNames(0)=Gun_Shoot_Fan_V1
    FanAnimNames(1)=Gun_Shoot_Fan_V3
    FocusFireRotationRate=(Pitch=30000,Yaw=30000,Roll=30000)
    MinigunLoop=AkEvent'WW_ZED_Patriarch.Play_Mini_Gun_Start'
    MinigunLoopEnd=AkEvent'WW_ZED_Patriarch.Play_Mini_Gun_Stop'
    VisibilityCheckTime=1
    AnimName=Gun_Idle
    BlendInTime=0.15
    BlendOutTime=0.1
    AbortBlendOutTime=0.1
    bDisableMovement=true
    bDisableSteering=false
    bAllowFireAnims=true
    bShouldDeferToPostTick=true
    Handle=KFSM_Patriarch_MinigunBarrage
}