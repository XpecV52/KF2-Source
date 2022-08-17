/*******************************************************************************
 * KFSM_Zed_Boss_Theatrics generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_Zed_Boss_Theatrics extends KFSM_PlaySingleAnim;

enum ETheatricType
{
    THEATRIC_Entrance,
    THEATRIC_Victory,
    THEATRIC_MAX
};

var byte CurrentTheatricType;
var CameraAnim CameraAnim;
var Color FadeInColor;
var Color FadeOutColor;
var float FadeInTime;
var float FadeOutTime;

protected function bool InternalCanDoSpecialMove()
{
    local KFGameReplicationInfo KFGRI;

    if(PCOwner != none)
    {
        KFGRI = KFGameReplicationInfo(PCOwner.WorldInfo.GRI);        
    }
    else
    {
        if(AIOwner != none)
        {
            KFGRI = KFGameReplicationInfo(AIOwner.WorldInfo.GRI);
        }
    }
    if((KFGRI != none) && !KFGRI.IsFinalWave())
    {
        return false;
    }
    return super(KFSpecialMove).InternalCanDoSpecialMove();
}

static function byte PackSMFlags(KFPawn P, byte InTauntType)
{
    local byte Variant;
    local KFPawnAnimInfo PAI;

    PAI = P.PawnAnimInfo;
    Variant = 255;
    switch(InTauntType)
    {
        case 0:
            if(PAI.TheatricBossEntranceAnimInfos.Length > 0)
            {
                Variant = byte(Rand(PAI.TheatricBossEntranceAnimInfos.Length));
            }
            break;
        case 1:
            if(PAI.TheatricBossVictoryAnimInfos.Length > 0)
            {
                Variant = byte(Rand(PAI.TheatricBossVictoryAnimInfos.Length));
            }
            break;
        default:
            break;
    }
    if(Variant != 255)
    {
        return byte(InTauntType + (Variant << 4));        
    }
    else
    {
        return 255;
    }
}

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    super.SpecialMoveStarted(bForced, PrevMove);
    KFPOwner.BodyStanceNodes[0].SetRootBoneAxisOption(0, 0, 0);
    if(KFPOwner.WorldInfo.NetMode != NM_DedicatedServer)
    {
        KFGFxHudWrapper(KFPOwner.WorldInfo.GetALocalPlayerController().myHUD).BossPawn = KFPawn_MonsterBoss(KFPOwner);
    }
}

function PlayAnimation()
{
    local byte Variant;
    local KFPawn_MonsterBoss BossPawn;
    local KFPlayerController KFPC;
    local Vector CameraAnimOffset;

    CurrentTheatricType = byte(KFPOwner.SpecialMoveFlags & 15);
    Variant = byte(KFPOwner.SpecialMoveFlags >> 4);
    switch(CurrentTheatricType)
    {
        case 0:
            AnimName = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnimInfos[Variant].AnimationName;
            CameraAnim = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnimInfos[Variant].CameraAnimation;
            CameraAnimOffset = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnimInfos[Variant].CameraAnimOffset;
            BlendInTime = 0;
            BlendOutTime = 0;
            KFPOwner.SetPhysics(2);
            break;
        case 1:
            AnimName = KFPOwner.PawnAnimInfo.TheatricBossVictoryAnimInfos[Variant].AnimationName;
            CameraAnim = KFPOwner.PawnAnimInfo.TheatricBossVictoryAnimInfos[Variant].CameraAnimation;
            CameraAnimOffset = KFPOwner.PawnAnimInfo.TheatricBossVictoryAnimInfos[Variant].CameraAnimOffset;
            break;
        default:
            AnimName = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnimInfos[Variant].AnimationName;
            CameraAnim = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnimInfos[Variant].CameraAnimation;
            CameraAnimOffset = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnimInfos[Variant].CameraAnimOffset;
            break;
            break;
    }
    if(AIOwner != none)
    {
        AIOwner.AILog_Internal((((string(GetFuncName()) $ " ") $ string(self)) $ " chose theatric animation ") $ string(AnimName), 'AIController');
    }
    PlaySpecialMoveAnim(AnimName, AnimStance, BlendInTime, BlendOutTime, 1);
    BossPawn = KFPawn_MonsterBoss(KFPOwner);
    if((((BossPawn == none) || BossPawn.bPlayedDeath) || BossPawn.bPendingDelete) || BossPawn.HitFxInfo.bObliterated)
    {
        if((AIOwner != none) && AIOwner.Role == ROLE_Authority)
        {
            foreach AIOwner.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
            {
                KFPC.SetBossCamera(none);                
            }                        
        }
        else
        {
            if((PCOwner != none) && PCOwner.Role == ROLE_Authority)
            {
                foreach PCOwner.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
                {
                    KFPC.SetBossCamera(none);                    
                }                
            }
        }
        return;
    }
    if((BossPawn.Role == ROLE_Authority) && BossPawn.IsHumanControlled())
    {
        KFPlayerController(BossPawn.Controller).ServerCamera('Boss');
    }
    if(BossPawn.WorldInfo.NetMode != NM_DedicatedServer)
    {
        KFPC = GetALocalKFPlayerController();
        KFPC.ClientSetCameraFade(true, FadeInColor, vect2d(1, 0), FadeInTime, true);
        KFPC.SetViewTarget(BossPawn);
        KFPC.ClientSetCameraMode('Boss');
        if(CameraAnim != none)
        {
            BossPawn.bUseAnimatedTheatricCamera = true;
            BossPawn.TheatricCameraAnimOffset = CameraAnimOffset;
            KFPC.SetCinematicMode(true, false, false, true, true, true);
            KFPC.ClientPlayCameraAnim(CameraAnim, 1, 0.99, BlendInTime, BlendOutTime + 0.03, false, false);
        }
    }
    if(BossPawn.Role == ROLE_Authority)
    {
        BossPawn.PlayMonologue(CurrentTheatricType);
    }
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    local KFPlayerController KFPC;
    local KFPawn_MonsterBoss BossPawn;

    BossPawn = KFPawn_MonsterBoss(KFPOwner);
    KFPC = GetALocalKFPlayerController();
    if(BossPawn != none)
    {
        BossPawn.bUseAnimatedTheatricCamera = false;
        BossPawn.TheatricCameraAnimOffset = vect(0, 0, 0);
        if(BossPawn.WorldInfo.NetMode != NM_DedicatedServer)
        {
            if(CurrentTheatricType == 0)
            {
                KFPC.ClientSetCameraFade(true, FadeOutColor, vect2d(1, 0), FadeOutTime, true);
            }
            if(CameraAnim != none)
            {
                KFPC.ClientStopCameraAnim(CameraAnim);
            }
        }
        if(BossPawn.BodyStanceNodes[AnimStance].bIsPlayingCustomAnim)
        {
            BossPawn.StopBodyAnim(AnimStance, 0.2);
        }
    }
    if(CurrentTheatricType == 0)
    {
        if(AIOwner != none)
        {
            AIOwner.AIZeroMovementVariables();
            if(AIOwner.Role == ROLE_Authority)
            {
                foreach AIOwner.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
                {
                    if(KFPC.Pawn != none)
                    {
                        KFPC.SetViewTarget(KFPC.Pawn);
                    }
                    KFPC.ServerCamera('FirstPerson');
                    KFPC.SetCinematicMode(false, false, true, true, true, false);                    
                }                
            }            
        }
        else
        {
            if(PCOwner != none)
            {
                if(PCOwner.Role == ROLE_Authority)
                {
                    foreach PCOwner.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
                    {
                        if(KFPC.Pawn != none)
                        {
                            KFPC.SetViewTarget(KFPC.Pawn);
                        }
                        if(((KFPC != PCOwner) && KFPC.Pawn != none) && KFPC.GetTeamNum() == 0)
                        {
                            KFPC.ServerCamera('FirstPerson');                            
                        }
                        else
                        {
                            if(KFPC == PCOwner)
                            {
                                KFPC.ServerCamera('ThirdPerson');                                
                            }
                            else
                            {
                                KFPC.ServerCamera('FreeCam');
                            }
                        }
                        KFPC.SetCinematicMode(false, false, true, true, true, false);                        
                    }                    
                }
            }
        }
        if(BossPawn.WorldInfo.NetMode != NM_DedicatedServer)
        {
            KFPC.SetCinematicMode(false, false, true, true, true, false);
            if(KFPC.Pawn != none)
            {
                KFPC.SetViewTarget(KFPC.Pawn);
            }
        }
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
}

function KFPlayerController GetALocalKFPlayerController()
{
    local KFPlayerController KFPC;

    foreach KFPOwner.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if(KFPC.IsLocalPlayerController())
        {            
            return KFPC;
        }        
    }    
    return KFPlayerController(KFPOwner.GetALocalPlayerController());
}

defaultproperties
{
    FadeOutColor=(B=255,G=255,R=255,A=0)
    FadeInTime=3.2
    FadeOutTime=0.6
    bDisablesWeaponFiring=true
    bDisableMovement=true
    Handle=KFSM_Zed_Boss_Theatrics
}