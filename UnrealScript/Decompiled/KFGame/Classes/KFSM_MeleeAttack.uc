/*******************************************************************************
 * KFSM_MeleeAttack generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_MeleeAttack extends KFSM_PlaySingleAnim
    native(SpecialMoves);

var transient bool bCannotBeParried;

event byte PackFlags()
{
    local byte StrikeFlags;
    local KFPawn_Monster KFPM;

    KFPM = KFPawn_Monster(KFPOwner);
    if(KFPM == none)
    {
        return 255;
    }
    if((KFPM != none) && KFPM.PawnAnimInfo != none)
    {
        StrikeFlags = KFPM.PawnAnimInfo.GetStrikeFlags(AIOwner.PendingAnimStrikeIndex);
        if(StrikeFlags != 255)
        {
            AIOwner.UpdatePendingStrike();
        }
    }
    return StrikeFlags;
}

function UnpackSpecialMoveFlags()
{
    local byte AtkIndex, AtkVariant;

    AtkIndex = byte(KFPOwner.SpecialMoveFlags & 15);
    AtkVariant = byte(KFPOwner.SpecialMoveFlags >> 4);
    AnimName = KFPOwner.PawnAnimInfo.InitMeleeSpecialMove(self, AtkIndex, AtkVariant);
    bCanBeInterrupted = bCanBeInterrupted || !bUseRootMotion;
}

function bool CanOverrideMoveWith(name NewMove)
{
    if(bCanBeInterrupted && ((NewMove == 'KFSM_Stunned') || NewMove == 'KFSM_Stumble') || NewMove == 'Knockdown')
    {
        return true;
    }
    return false;
}

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    local KFPawn_Monster KFPM;

    bUseRootMotion = false;
    bCanBeInterrupted = false;
    UnpackSpecialMoveFlags();
    KFPM = KFPawn_Monster(KFPOwner);
    if(((KFPM != none) && KFPM.bCanCloak) && KFPM.bIsCloaking)
    {
        KFPM.SetCloaked(false);
    }
    super.SpecialMoveStarted(bForced, PrevMove);
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    local KFPawn_Monster KFPM;

    PawnOwner.ClearTimer('InterruptCheckTimer', self);
    if(bCanBeInterrupted && KFPOwner.BodyStanceNodes[AnimStance].bIsPlayingCustomAnim)
    {
        KFPOwner.BodyStanceNodes[AnimStance].SetNotifyWeightThreshold(0.8);
    }
    KFPM = KFPawn_Monster(KFPOwner);
    if(KFPM != none)
    {
        if((KFPM.bCanCloak && KFPM.bCloakOnMeleeEnd) && !KFPM.bIsCloaking)
        {
            KFPM.SetCloaked(true);
        }
        KFPM.MeleeSpecialMoveEnded();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
}

function PlayAnimation()
{
    local float InterruptTime;

    if(AnimName == 'None')
    {
        WarnInternal(((((string(KFPOwner) $ " ") $ string(GetFuncName())) $ " ") $ string(self)) $ " attempting special move attack but the AttackAnims array is empty!");
        return;
    }
    if(AIOwner != none)
    {
        AIOwner.AILog_Internal((((string(GetFuncName()) $ " ") $ string(self)) $ " chose attack animation ") $ string(AnimName), 'Command_SpecialMove');
    }
    if(bCanBeInterrupted)
    {
        InterruptTime = KFSkeletalMeshComponent(PawnOwner.Mesh).GetAnimInterruptTime(AnimName);
        PawnOwner.SetTimer(InterruptTime, false, 'InterruptCheckTimer', self);
    }
    PlaySpecialMoveAnim(AnimName, AnimStance, BlendInTime, BlendOutTime, 1);
}

function NotifyOwnerTakeHit(class<KFDamageType> DamageType, Vector HitLoc, Vector HitDir, Controller InstigatedBy)
{
    if(bCanBeInterrupted && IsAnInterruptHit(PawnOwner, DamageType))
    {
        KFPOwner.EndSpecialMove();
        if(AIOwner != none)
        {
            AIOwner.LastGetStrikeTime = -1;
        }
    }
}

function AbortedByAICommand()
{
    local KFPawn_Monster KFPMOwner;

    if(bCanBeInterrupted)
    {
        if(!KFPOwner.IsTimerActive('InterruptCheckTimer', self))
        {
            KFPMOwner = KFPawn_Monster(KFPOwner);
            KFPOwner.EndSpecialMove();
            if(KFPMOwner != none)
            {
                KFPMOwner.NotifyAnimInterrupt();
            }
            if(AIOwner != none)
            {
                AIOwner.LastGetStrikeTime = -1;
            }
        }
    }
}

function InterruptCheckTimer()
{
    local AICommand_Attack_Melee MeleeCommand;
    local KFPawn_Monster KFPMOwner;

    if(bCanBeInterrupted && AIOwner != none)
    {
        MeleeCommand = AICommand_Attack_Melee(AIOwner.GetActiveCommand());
        if((MeleeCommand != none) && MeleeCommand.bAttackAborted)
        {
            KFPMOwner = KFPawn_Monster(KFPOwner);
            if(KFPMOwner != none)
            {
                KFPMOwner.NotifyAnimInterrupt();
            }
            KFPOwner.EndSpecialMove();
            AIOwner.LastGetStrikeTime = -1;
        }
    }
}

defaultproperties
{
    BlendInTime=0.2
    AbortBlendOutTime=0.5
    bDisableMovement=true
    bDisableSteering=false
    Handle=KFSM_MeleeAttack
}