/*******************************************************************************
 * KFSM_Frozen generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_Frozen extends KFSpecialMove;

var() name FrozenAnim;
var() array<name> ThawAnims;
var() float FreezeDuration;
var() float FreezeInTime;
var() float FreezeOutTime;
var transient float BeginFreezePhaseTime;
var protected ParticleSystem FrozenShatterTemplate;
var protected ParticleSystem FrozenSteamTemplate;
var protected export editinline ParticleSystemComponent FrozenSteamEffect;
var transient bool bShatter;

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    super.SpecialMoveStarted(bForced, PrevMove);
    DoFreeze();
}

function DoFreeze()
{
    if(KFPOwner.Role == ROLE_Authority)
    {
        FreezeDuration = (default.FreezeDuration - (default.FreezeDuration / 4)) + ((default.FreezeDuration / 2) * FRand());
        KFPOwner.SetTimer(FreezeDuration, false, 'DoThaw', self);
    }
    BeginFreezePhaseTime = KFPOwner.WorldInfo.TimeSeconds;
    KFPOwner.SetTimer(0.1, true, 'UpdateFreezeInParam', self);
    PlaySpecialMoveAnim(FrozenAnim, 0, FreezeInTime, 0.3, 0.001, true);
    FrozenSteamEffect = KFPOwner.WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(FrozenSteamTemplate, KFPOwner.Mesh, 'Root');
    bShatter = true;
}

function DoThaw()
{
    if(KFPOwner.Role == ROLE_Authority)
    {
        KFPOwner.SpecialMoveFlags = 1;
        KFPOwner.ReplicatedSpecialMove.Flags = 1;
        PlayThawAnimation();
    }
}

function PlayThawAnimation()
{
    local byte ThawIndex;

    ThawIndex = byte(Rand(ThawAnims.Length));
    PlaySpecialMoveAnim(ThawAnims[ThawIndex], 0, FreezeOutTime, 0.3, 0.5, false);
    if(KFPawn_Monster(KFPOwner).bIsHeadless)
    {
        KFPOwner.Died(none, none, KFPOwner.Location);        
    }
    else
    {
        bShatter = false;
        BeginFreezePhaseTime = KFPOwner.WorldInfo.TimeSeconds;
        KFPOwner.SetTimer(0.1, true, 'UpdateFreezeOutParam', self);
    }
}

function UpdateFreezeInParam()
{
    local float Param;

    Param = FMin(1, (KFPOwner.WorldInfo.TimeSeconds - BeginFreezePhaseTime) / FreezeInTime);
    KFPOwner.AfflictionHandler.SetFrozenParameter(Param);
    KFPawn_Monster(KFPOwner).RepFrozenMatParam = FloatToByte(Param);
    if(Param >= FreezeInTime)
    {
        KFPOwner.ClearTimer('UpdateFreezeInParam', self);
    }
}

function UpdateFreezeOutParam()
{
    local float Param;

    Param = 1 - FMin(1, (KFPOwner.WorldInfo.TimeSeconds - BeginFreezePhaseTime) / FreezeOutTime);
    KFPOwner.AfflictionHandler.SetFrozenParameter(Param);
    KFPawn_Monster(KFPOwner).RepFrozenMatParam = FloatToByte(Param);
    if(Param >= FreezeOutTime)
    {
        KFPOwner.ClearTimer('UpdateFreezeOutParam', self);
    }
}

function SpecialMoveFlagsUpdated()
{
    PlayThawAnimation();
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    super.SpecialMoveEnded(PrevMove, NextMove);
    if(KFPOwner.MyKFAIC != none)
    {
        KFPOwner.MyKFAIC.bPreparingMove = false;
    }
    KFPOwner.DetachEmitter(FrozenSteamEffect);
    if(bShatter)
    {
        Shatter();
    }
    KFPOwner.ClearTimer('UpdateFreezeInParam', self);
    KFPOwner.ClearTimer('UpdateFreezeOutParam', self);
    KFPOwner.ClearTimer('DoThaw', self);
}

function Shatter()
{
    KFPOwner.WorldInfo.MyEmitterPool.SpawnEmitter(FrozenShatterTemplate, KFPOwner.Location, rotator(vect(0, 0, 1)));
    KFPawn_Monster(KFPOwner).ForceBreakAllConstraints();
}

defaultproperties
{
    FrozenAnim=Stun_Loop_V1
    ThawAnims(0)=Stun_Wakeup_V1
    ThawAnims(1)=Stun_Wakeup_V2
    ThawAnims(2)=Stun_Wakeup_V3
    FreezeDuration=4
    FreezeInTime=1
    FreezeOutTime=1
    bCanOnlyWanderAtEnd=true
    bDisablesWeaponFiring=true
    bDisableMovement=true
    bLockPawnRotation=true
    DefaultAICommandClass=Class'AICommand_PushedBySM'
    Handle=KFSM_Frozen
}