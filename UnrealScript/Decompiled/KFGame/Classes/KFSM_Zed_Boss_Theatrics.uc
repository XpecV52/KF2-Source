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
    if((KFGRI != none) && !KFGRI.IsBossWave())
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
    local KFInterface_MonsterBoss KFBoss;

    super.SpecialMoveStarted(bForced, PrevMove);
    KFPOwner.BodyStanceNodes[0].SetRootBoneAxisOption(0, 0, 0);
    if(KFPOwner.WorldInfo.NetMode != NM_DedicatedServer)
    {
        KFBoss = KFInterface_MonsterBoss(KFPOwner);
        if(NotEqual_InterfaceInterface(KFBoss, (none)))
        {
            KFGFxHudWrapper(KFPOwner.WorldInfo.GetALocalPlayerController().myHUD).BossRef = KFBoss;
            if((KFBoss.GetMonsterPawn().WorldInfo.TimeSeconds - KFBoss.GetMonsterPawn().CreationTime) < 1)
            {
                if(KFBoss.GetMonsterPawn().bVersusZed)
                {
                    KFPlayerController(KFPOwner.WorldInfo.GetALocalPlayerController()).ShowBossNameplate(KFBoss, ("(" $ KFBoss.GetMonsterPawn().PlayerReplicationInfo.PlayerName) $ ")");                    
                }
                else
                {
                    KFPlayerController(KFPOwner.WorldInfo.GetALocalPlayerController()).ShowBossNameplate(KFBoss);
                }
            }
        }
    }
}

function PlayAnimation()
{
    local byte Variant;
    local Controller BossController;
    local KFInterface_MonsterBoss BossRef;
    local KFPawn BossPawn;
    local KFPlayerController KFPC;
    local KFWeapon KFW;
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
    if(!Class'Engine'.static.GetEngine().bDisableAILogging && AIOwner != none)
    {
        AIOwner.AILog_Internal((((string(GetFuncName()) $ " ") $ string(self)) $ " chose theatric animation ") $ string(AnimName), 'AIController');
    }
    PlaySpecialMoveAnim(AnimName, AnimStance, BlendInTime, BlendOutTime, 1);
    BossController = ((AIOwner != none) ? AIOwner : PCOwner);
    BossRef = KFInterface_MonsterBoss(KFPOwner);
    if(EqualEqual_InterfaceInterface(BossRef, (none)))
    {
        return;
    }
    BossPawn = BossRef.GetMonsterPawn();
    if((BossController != none) && BossController.Role == ROLE_Authority)
    {
        foreach BossController.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
        {
            if(!KFPC.CanViewCinematics())
            {
                continue;                
            }
            KFPC.SetBossCamera(BossRef);            
        }        
    }
    if((((BossPawn == none) || BossPawn.bPlayedDeath) || BossPawn.bPendingDelete) || BossPawn.HitFxInfo.bObliterated)
    {
        return;
    }
    if(BossPawn.WorldInfo.NetMode != NM_DedicatedServer)
    {
        KFPC = GetALocalKFPlayerController();
        if(KFPC.CanViewCinematics())
        {
            KFPC.ClientSetCameraFade(true, FadeInColor, vect2d(1, 0), FadeInTime, true);
            KFPC.SetViewTarget(BossPawn);
            KFPC.ClientSetCameraMode('Boss');
            if(CameraAnim != none)
            {
                BossRef.SetAnimatedBossCamera(true, CameraAnimOffset);
                KFPC.SetCinematicMode(true, false, false, true, true, true);
                KFPC.StopFiring();
                if((KFPC.Pawn != none) && KFPC.Pawn.Weapon != none)
                {
                    KFW = KFWeapon(KFPC.Pawn.Weapon);
                    if((KFW != none) && KFW.bUsingSights)
                    {
                        KFW.SetIronSights(false);
                    }
                }
                KFPC.ClientPlayCameraAnim(CameraAnim, 1, 0.99, BlendInTime, BlendOutTime + 0.03, false, false);
                if((KFPC.myGfxHUD != none) && KFPC.myGfxHUD.bossHealthBar != none)
                {
                    KFPC.myGfxHUD.bossHealthBar.SetBossPawn(BossRef);
                }
            }
        }
    }
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    local KFPlayerController KFPC, OtherKFPC;
    local KFInterface_MonsterBoss BossRef;

    BossRef = KFInterface_MonsterBoss(KFPOwner);
    KFPC = GetALocalKFPlayerController();
    if(NotEqual_InterfaceInterface(BossRef, (none)))
    {
        BossRef.SetAnimatedBossCamera(false);
        if((BossRef.GetMonsterPawn().WorldInfo.NetMode != NM_DedicatedServer) && KFPC.CanViewCinematics())
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
        if(BossRef.GetMonsterPawn().BodyStanceNodes[AnimStance].bIsPlayingCustomAnim)
        {
            BossRef.GetMonsterPawn().StopBodyAnim(AnimStance, 0.2);
        }
    }
    if(CurrentTheatricType == 0)
    {
        if(AIOwner != none)
        {
            AIOwner.AIZeroMovementVariables();
            if(AIOwner.Role == ROLE_Authority)
            {
                foreach AIOwner.WorldInfo.AllControllers(Class'KFPlayerController', OtherKFPC)
                {
                    if(!OtherKFPC.CanViewCinematics())
                    {
                        continue;                        
                    }
                    OtherKFPC.ServerCamera('FirstPerson');
                    if(OtherKFPC.Pawn != none)
                    {
                        OtherKFPC.SetViewTarget(OtherKFPC.Pawn);
                    }
                    OtherKFPC.SetCinematicMode(false, false, true, true, true, false);                    
                }                
            }            
        }
        else
        {
            if(PCOwner != none)
            {
                if(PCOwner.Role == ROLE_Authority)
                {
                    foreach PCOwner.WorldInfo.AllControllers(Class'KFPlayerController', OtherKFPC)
                    {
                        if(!OtherKFPC.CanViewCinematics())
                        {
                            continue;                            
                        }
                        if(((OtherKFPC != PCOwner) && OtherKFPC.Pawn != none) && OtherKFPC.GetTeamNum() == 0)
                        {
                            OtherKFPC.ServerCamera('FirstPerson');                            
                        }
                        else
                        {
                            if(OtherKFPC == PCOwner)
                            {
                                OtherKFPC.ServerCamera('ThirdPerson');                                
                            }
                            else
                            {
                                OtherKFPC.ServerCamera('FreeCam');
                            }
                        }
                        if(OtherKFPC.Pawn != none)
                        {
                            OtherKFPC.SetViewTarget(OtherKFPC.Pawn);
                        }
                        OtherKFPC.SetCinematicMode(false, false, true, true, true, false);                        
                    }                    
                }
            }
        }
        if((BossRef.GetMonsterPawn().WorldInfo.NetMode != NM_DedicatedServer) && KFPC.CanViewCinematics())
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