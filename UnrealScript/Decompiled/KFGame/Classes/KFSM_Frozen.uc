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
var() float FreezeInTime;
var() float FreezeOutTime;
var() Vector2D FreezeDuration;
var float BeginFreezePhaseTime;
var float FreezeMatParamValue;
var protected ParticleSystem FrozenSteamTemplate;
var protected export editinline ParticleSystemComponent FrozenSteamEffect;
var protected bool bIsThawing;
var bool bOwnerCouldCloak;

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    super.SpecialMoveStarted(bForced, PrevMove);
    bIsThawing = false;
    DoFreeze();
}

function DoFreeze()
{
    local float TimeUntilThaw;

    if(KFPOwner.Role == ROLE_Authority)
    {
        TimeUntilThaw = ((KFPOwner.IncapSettings[9].Duration > float(0)) ? KFPOwner.IncapSettings[9].Duration : RandRange(FreezeDuration.X, FreezeDuration.Y));
        KFPOwner.SetTimer(TimeUntilThaw, false, 'DoThaw', self);
        KFPOwner.SetCloaked(false);
        bOwnerCouldCloak = KFPOwner.bCanCloak;
        KFPOwner.bCanCloak = false;
    }
    if(PawnOwner.WorldInfo.NetMode != NM_DedicatedServer)
    {
        BeginFreezePhaseTime = KFPOwner.WorldInfo.TimeSeconds;
        KFPOwner.SetTimer(0.1, true, 'UpdateFreezeInParam', self);
        FrozenSteamEffect = KFPOwner.WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(FrozenSteamTemplate, KFPOwner.Mesh, 'Root');
    }
    PlaySpecialMoveAnim(FrozenAnim, 0, FreezeInTime, 0.3, 0.001, true);
}

function DoThaw()
{
    local KFPawn_Monster P;

    if(PawnOwner.Role == ROLE_Authority)
    {
        P = KFPawn_Monster(PawnOwner);
        if((P != none) && P.bIsHeadless)
        {
            P.BleedOutTimer();            
        }
        else
        {
            KFPOwner.SpecialMoveFlags = byte(1 + Rand(ThawAnims.Length));
            KFPOwner.ReplicatedSpecialMove.Flags = KFPOwner.SpecialMoveFlags;
            PlayThawAnimation();
        }
    }
}

function PlayThawAnimation()
{
    local byte ThawIndex;

    ThawIndex = byte(KFPOwner.SpecialMoveFlags - 1);
    PlaySpecialMoveAnim(ThawAnims[ThawIndex], 0, FreezeOutTime, 0.3, 0.5, false);
    bIsThawing = true;
    if(PawnOwner.WorldInfo.NetMode != NM_DedicatedServer)
    {
        BeginFreezePhaseTime = KFPOwner.WorldInfo.TimeSeconds;
        KFPOwner.SetTimer(0.1, true, 'UpdateFreezeOutParam', self);
        FreezeOutTime = PawnOwner.Mesh.GetAnimLength(ThawAnims[ThawIndex]);
    }
}

function SpecialMoveFlagsUpdated()
{
    PlayThawAnimation();
}

function UpdateFreezeInParam()
{
    local float Param;

    Param = FMin(1, (KFPOwner.WorldInfo.TimeSeconds - BeginFreezePhaseTime) / FreezeInTime);
    SetFrozenParameter(Param);
    if(Param == 1)
    {
        KFPOwner.ClearTimer('UpdateFreezeInParam', self);
    }
}

function UpdateFreezeOutParam()
{
    local float Param;

    Param = 1 - FMin(1, (KFPOwner.WorldInfo.TimeSeconds - BeginFreezePhaseTime) / FreezeOutTime);
    SetFrozenParameter(Param);
    if(Param == 0)
    {
        KFPOwner.ClearTimer('UpdateFreezeOutParam', self);
    }
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    super.SpecialMoveEnded(PrevMove, NextMove);
    if(KFPOwner.WorldInfo.NetMode != NM_DedicatedServer)
    {
        KFPOwner.DetachEmitter(FrozenSteamEffect);
        if(!KFPOwner.IsAliveAndWell())
        {
            PlayDeathEffects();
            KFPOwner.ClearTimer('UpdateFreezeOutParam', self);            
        }
        else
        {
            if(!bIsThawing)
            {
                BeginFreezePhaseTime = KFPOwner.WorldInfo.TimeSeconds;
                FreezeOutTime = 0.5;
                KFPOwner.SetTimer(0.1, true, 'UpdateFreezeOutParam', self);
            }
        }
    }
    if(KFPOwner.Role == ROLE_Authority)
    {
        KFPOwner.bCanCloak = bOwnerCouldCloak;
    }
    KFPOwner.ClearTimer('UpdateFreezeInParam', self);
    KFPOwner.ClearTimer('DoThaw', self);
}

function OnGoreMeshSwap()
{
    SetFrozenParameter(FreezeMatParamValue);
}

function SetFrozenParameter(float FreezeAmount)
{
    local MaterialInstanceConstant MIC;
    local int I;

    if(PawnOwner.WorldInfo.NetMode != NM_DedicatedServer)
    {
        FreezeMatParamValue = FreezeAmount;
        foreach KFPOwner.CharacterMICs(MIC,)
        {
            MIC.SetScalarParameterValue('Scalar_Ice', FreezeMatParamValue);            
        }        
        I = 0;
        J0xBB:

        if(I < 3)
        {
            if(KFPOwner.ThirdPersonAttachments[I] != none)
            {
                ApplyFreeze(KFPOwner.ThirdPersonAttachments[I]);
            }
            ++ I;
            goto J0xBB;
        }
        if(KFPawn_Monster(KFPOwner) != none)
        {
            I = 0;
            J0x15C:

            if(I < KFPawn_Monster(KFPOwner).StaticAttachList.Length)
            {
                if(KFPawn_Monster(KFPOwner).StaticAttachList[I] != none)
                {
                    ApplyFreeze(KFPawn_Monster(KFPOwner).StaticAttachList[I]);
                }
                ++ I;
                goto J0x15C;
            }
        }
    }
}

function ApplyFreeze(MeshComponent MeshToFreeze)
{
    local MaterialInstanceConstant MIC;
    local int I;

    I = 0;
    J0x0B:

    if(I < MeshToFreeze.Materials.Length)
    {
        MIC = MaterialInstanceConstant(MeshToFreeze.GetMaterial(I));
        if(MIC != none)
        {
            MIC.SetScalarParameterValue('Scalar_Ice', FreezeMatParamValue);
        }
        ++ I;
        goto J0x0B;
    }
}

function PlayDeathEffects()
{
    if(PawnOwner.WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    if(PawnOwner.HitDamageType != Class'KFDT_Bleeding')
    {
        Class'KFDT_Freeze'.static.PlayShatter(KFPOwner, false);        
    }
    else
    {
        PawnOwner.SetTimer(0.5, false, 'DelayedShatterTimer', self);
    }
}

function DelayedShatterTimer()
{
    Class'KFDT_Freeze'.static.PlayShatter(KFPOwner, true);
}

function bool CanOverrideSpecialMove(name InMove)
{
    if(InMove == 'KFSM_Block')
    {
        return true;
    }
    return false;
}

defaultproperties
{
    FrozenAnim=Stun_Loop_V1
    ThawAnims(0)=Stun_Wakeup_V1
    ThawAnims(1)=Stun_Wakeup_V2
    ThawAnims(2)=Stun_Wakeup_V3
    FreezeInTime=0.5
    FreezeOutTime=1
    FreezeDuration=(X=3,Y=5)
    FrozenSteamTemplate=ParticleSystem'WEP_Freeze_Grenade_EMIT.FX_Freeze_Grenade_Smoke'
    bCanOnlyWanderAtEnd=true
    bDisablesWeaponFiring=true
    bDisableMovement=true
    bLockPawnRotation=true
    DefaultAICommandClass=Class'AICommand_PushedBySM'
    Handle=KFSM_Frozen
}