/*******************************************************************************
 * KFSM_Stunned generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_Stunned extends KFSpecialMove;

var name StunnedAnim;
var array<name> WakeupAnims;
var float StunDuration;
var Vector2D PlayerStunDurationRange;
var Vector2D StunDurationRange;

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    super.SpecialMoveStarted(bForced, PrevMove);
    DoStun();
}

function DoStun()
{
    if(KFPOwner.Role == ROLE_Authority)
    {
        if(KFPOwner.IsHumanControlled())
        {
            StunDuration = RandRange(PlayerStunDurationRange.X, PlayerStunDurationRange.Y);            
        }
        else
        {
            StunDuration = RandRange(StunDurationRange.X, StunDurationRange.Y);
        }
        KFPOwner.SetTimer(StunDuration, false, 'DoWakeup', self);
    }
    KFPOwner.Velocity.X = 0;
    KFPOwner.Velocity.Y = 0;
    KFPOwner.Acceleration = vect(0, 0, 0);
    PlaySpecialMoveAnim(StunnedAnim, 0, 0.4, 0.3, 1, true);
}

simulated event Tick(float DeltaTime)
{
    super(GameSpecialMove).Tick(DeltaTime);
    if(((KFPOwner != none) && KFPOwner.Role == ROLE_Authority) && KFPOwner.Physics == 1)
    {
        KFPOwner.Velocity.X = 0;
        KFPOwner.Velocity.Y = 0;
        KFPOwner.Acceleration = vect(0, 0, 0);
    }
}

function DoWakeup()
{
    if(KFPOwner.Role == ROLE_Authority)
    {
        KFPOwner.SpecialMoveFlags = 1;
        KFPOwner.ReplicatedSpecialMove.Flags = 1;
        PlayWakeupAnimation();
    }
}

function PlayWakeupAnimation()
{
    local byte WakeupIndex;

    WakeupIndex = byte(Rand(WakeupAnims.Length));
    PlaySpecialMoveAnim(WakeupAnims[WakeupIndex], 0, 0.2, 0.3, 1, false);
}

function SpecialMoveFlagsUpdated()
{
    PlayWakeupAnimation();
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    super.SpecialMoveEnded(PrevMove, NextMove);
    if(KFPOwner.MyKFAIC != none)
    {
        KFPOwner.MyKFAIC.bPreparingMove = false;
    }
}

defaultproperties
{
    StunnedAnim=Stun_Loop_V1
    WakeupAnims(0)=Stun_Wakeup_V1
    WakeupAnims(1)=Stun_Wakeup_V2
    WakeupAnims(2)=Stun_Wakeup_V3
    PlayerStunDurationRange=(X=1,Y=1.5)
    StunDurationRange=(X=2,Y=4)
    bAllowHitReactions=true
    bCanOnlyWanderAtEnd=true
    bDisablesWeaponFiring=true
    bDisableMovement=true
    bLockPawnRotation=true
    DefaultAICommandClass=Class'AICommand_PushedBySM'
    Handle=KFSM_Stunned
}