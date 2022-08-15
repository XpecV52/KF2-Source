/*******************************************************************************
 * KFWeap_MeleeBase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_MeleeBase extends KFWeapon
    abstract
    native
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const BLOCK_FIREMODE = 1;
const HEAVY_ATK_FIREMODE = 5;
const CUSTOM_FIREMODE = 6;
const MeleeAttackAnim_F = 'Atk_F';
const MeleeAttackAnim_B = 'Atk_B';
const MeleeAttackAnim_L = 'Atk_L';
const MeleeAttackAnim_R = 'Atk_R';
const MeleeHeavyAttackAnim_F = 'Atk_H_F';
const MeleeHeavyAttackAnim_B = 'Atk_H_B';
const MeleeHeavyAttackAnim_L = 'Atk_H_L';
const MeleeHeavyAttackAnim_R = 'Atk_H_R';
const MeleeComboChainAnim_F = 'Combo_F';
const MeleeComboChainAnim_FL = 'Combo_FL';
const MeleeComboChainAnim_FR = 'Combo_FR';
const MeleeComboChainAnim_B = 'Combo_B';
const MeleeComboChainAnim_BL = 'Combo_BL';
const MeleeComboChainAnim_BR = 'Combo_BR';
const MeleeComboChainAnim_L = 'Combo_L';
const MeleeComboChainAnim_R = 'Combo_R';
const MeleeDrawStrikeAnim = 'Atk_Draw';
const MeleeBlockStartAnim = 'Brace_in';
const MeleeBlockLoopAnim = 'Brace_loop';
const MeleeBlockEndAnim = 'Brace_out';
const CleanBloodyAnim = 'Clean_Blood';
const CleanNonBloodyAnim = 'Clean_NoBlood';
const MeleeSustainedLoopAnim = 'Atk_F_Loop';
const MeleeSustainedStartAnim = 'Atk_F_In';
const MeleeSUstainedEndAnim = 'Atk_F_Out';

var bool bIsBloody;
var bool bMoveAtWalkingSpeed;
var byte MaxChainAtkCount;
/** Hit reaction strength to bypass pawn's ParryStumbleResist */
var() byte ParryStrength;
/**  
 *Estimated attack rate for this weapon, taking chaining, etc. into account.
 *  Basically, just eyeball the animations and take an average.
 */
var() byte EstimatedFireRate;
var float MinMeleeSustainedTime;
var() float MeleeSustainedWarmupTime;
var array< class<DamageType> > BlockDamageType;
/** Damage while blocking will be mitigated by this percentage */
var() float BlockDamageMitigation;
/** Some melee weapons have a chance of ignoring incoming damage while attacking */
var() float ParryDuration;
/** Parry damage will be mitigated by this percentage */
var() float ParryDamageMitigationPercent;
var array<name> MeleeAttackSettleAnims;
var array<name> MeleeBlockHitAnims;
var ParticleSystem DistortTrailParticle;
var ParticleSystem WhiteTrailParticle;
var ParticleSystem BlueTrailParticle;
var ParticleSystem RedTrailParticle;
var AkBaseSoundObject BlockSound;
var AkBaseSoundObject ParrySound;
var ParticleSystem BlockParticleSystem;
var ParticleSystem ParryParticleSystem;
var name BlockEffectsSocketName;

simulated event PreBeginPlay()
{
    super.PreBeginPlay();
    WeaponMIC = Mesh.CreateAndSetMaterialInstanceConstant(0);
}

simulated function bool HasAnyAmmo()
{
    return true;
}

simulated function bool HasAmmo(byte FireModeNum, optional int Amount)
{
    Amount = 1;
    if(FireModeNum == 4)
    {
        return super.HasAmmo(FireModeNum, Amount);
    }
    return true;
}

simulated function bool ShouldOwnerWalk()
{
    return bMoveAtWalkingSpeed;
}

simulated function SetSlowMovement(bool bEnabled)
{
    if(Instigator.IsLocallyControlled())
    {
        bMoveAtWalkingSpeed = bEnabled;
        if(Role < ROLE_Authority)
        {
            ServerSetSlowMovement(bEnabled);
        }
    }
}

reliable server function ServerSetSlowMovement(bool bEnabled)
{
    bMoveAtWalkingSpeed = bEnabled;
}

simulated function StartFire(byte FireModeNum)
{
    if((FireModeNum == 0) || FireModeNum == 5)
    {
        StartMeleeFire(FireModeNum, MeleeAttackHelper.ChooseAttackDir(), 0);
        return;
    }
    if((FireModeNum == 3) && WeaponFireTypes[FireModeNum] == 3)
    {
        StartMeleeFire(FireModeNum, MeleeAttackHelper.ChooseAttackDir(), 0);
        return;
    }
    super.StartFire(FireModeNum);
}

simulated function StartMeleeFire(byte FireModeNum, KFPawn.EPawnOctant AttackDir, KFMeleeHelperWeapon.EMeleeAttackType AtkType)
{
    MeleeAttackHelper.InitAttackSequence(AttackDir, AtkType);
    if((Instigator == none) || !Instigator.bNoWeaponFiring)
    {
        if(Role < ROLE_Authority)
        {
            ServerStartMeleeFire(FireModeNum, AttackDir, AtkType);
        }
        BeginFire(FireModeNum);
    }
}

private reliable server final function ServerStartMeleeFire(byte FireModeNum, KFPawn.EPawnOctant AttackDir, KFMeleeHelperWeapon.EMeleeAttackType AtkType)
{
    MeleeAttackHelper.InitAttackSequence(AttackDir, AtkType);
    ServerStartFire(FireModeNum);
}

simulated function AltFireMode()
{
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    StartFire(1);
}

simulated function SetIronSights(bool bNewIronSights)
{
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    if(bNewIronSights)
    {
        StartFire(5);        
    }
    else
    {
        StopFire(5);
    }
}

simulated function SendToFiringState(byte FireModeNum)
{
    if((FireModeNum == 3) && WeaponFireTypes[FireModeNum] == 3)
    {
        super.SendToFiringState(0);
        ClearPendingFire(3);
    }
    super.SendToFiringState(FireModeNum);
}

event RecieveClientImpact(byte FiringMode, const out ImpactInfo Impact, optional out float PenetrationValue)
{
    MeleeAttackHelper.ProcessMeleeHit(FiringMode, Impact);
}

simulated function int GetMeleeDamage(byte FireModeNum, optional Vector RayDir)
{
    local int Damage;
    local KFPerk InstigatorPerk;

    Damage = int(InstantHitDamage[FireModeNum]);
    if(!IsZero(RayDir))
    {
        Damage *= FMin(VSize(RayDir), 1);
    }
    InstigatorPerk = GetPerk();
    if(InstigatorPerk != none)
    {
        if(IsHeavyAttack(FireModeNum))
        {
            InstigatorPerk.ModifyHardAttackDamage(Damage);
        }
    }
    return Damage;
}

simulated function AddBlood(float MinAmount, float MaxAmount)
{
    super.AddBlood(MinAmount, MaxAmount);
    if(!bIsBloody)
    {
        bIsBloody = true;
        ServerSetBloody(true);
    }
}

private reliable server final function ServerSetBloody(bool bNewIsBloody)
{
    bIsBloody = bNewIsBloody;
}

simulated function ANIMNOTIFY_CleanBlood()
{
    bIsBloody = false;
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        BloodParamValue = 0;
        WeaponMIC.SetScalarParameterValue('Scalar_Blood_Contrast', BloodParamValue);
    }
}

simulated function PlayWeaponAnimation(name Sequence, float fDesiredDuration, optional bool bLoop, optional SkeletalMeshComponent SkelMesh)
{
    super.PlayWeaponAnimation(Sequence, fDesiredDuration, bLoop, SkelMesh);
    bFollowAnimSeqCamera = default.bFollowAnimSeqCamera;
}

simulated function PlayMeleeAnimation(name AnimName, out float out_Rate, float BlendTime)
{
    super.PlayMeleeAnimation(AnimName, out_Rate, BlendTime);
    bFollowAnimSeqCamera = true;
    if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
    {
        KFGameInfo(WorldInfo.Game).DialogManager.PlayMeleeAttackDialog(KFPawn(Instigator), IsHeavyAttack(CurrentFireMode));
    }
}

simulated function UpkeepComplete();

simulated function bool CanReload()
{
    if(FiringStatesArray[2] == 'WeaponUpkeep')
    {
        return true;
    }
    return super.CanReload();
}

simulated function PlayMeleeSettleAnim()
{
    local int AnimIdx;

    if(MeleeAttackSettleAnims.Length > 0)
    {
        AnimIdx = Rand(MeleeAttackSettleAnims.Length);
        PlayAnimation(MeleeAttackSettleAnims[AnimIdx], 0, false, 0.1);
    }
}

simulated function bool IsHeavyAttack(byte FireMode);

function SustainedMinFireTimer();

function SustainedWarmupEndTimer();

simulated function BlockLoopTimer();

simulated function ParryCheckTimer();

unreliable client simulated function ClientPlayBlockEffects()
{
    PlayLocalBlockEffects(BlockSound, BlockParticleSystem);
}

unreliable client simulated function ClientPlayParryEffects()
{
    local KFPerk InstigatorPerk;

    InstigatorPerk = GetPerk();
    if(InstigatorPerk != none)
    {
        InstigatorPerk.SetSuccessfullParry();
    }
    PlayLocalBlockEffects(ParrySound, ParryParticleSystem);
}

simulated function PlayBlockStart()
{
    local float AnimDuration;

    if(Instigator.IsLocallyControlled())
    {
        PlayAnimation('Brace_in');
    }
    AnimDuration = MySkelMesh.GetAnimLength('Brace_in');
    if(AnimDuration > 0)
    {
        SetTimer(AnimDuration, false, 'BlockLoopTimer');        
    }
    else
    {
        BlockLoopTimer();
    }
    ParryDuration = AnimDuration;
}

simulated function PlayLocalBlockEffects(AkBaseSoundObject Sound, ParticleSystem PSTemplate)
{
    local Vector Loc;
    local Rotator Rot;
    local editinline ParticleSystemComponent PSC;

    if(Sound != none)
    {
        PlaySoundBase(Sound, true);
    }
    if(PSTemplate != none)
    {
        if(MySkelMesh.GetSocketWorldLocationAndRotation(BlockEffectsSocketName, Loc, Rot))
        {
            PSC = WorldInfo.MyEmitterPool.SpawnEmitter(PSTemplate, Loc, Rot);
            PSC.SetDepthPriorityGroup(2);            
        }
        else
        {
            LogInternal((string(self) @ string(GetFuncName())) @ "missing BlockEffects Socket!");
        }
    }
}

function bool CanBlockDamageType(class<DamageType> DamageType)
{
    local int Idx;

    Idx = 0;
    J0x0B:

    if(Idx < BlockDamageType.Length)
    {
        if(ClassIsChildOf(DamageType, BlockDamageType[Idx]))
        {
            return true;
        }
        ++ Idx;
        goto J0x0B;
    }
    return false;
}

simulated function BlockCooldownTimer();

simulated function ANIMNOTIFY_DrawAtk();

simulated function AttemptDrawStrike();

static simulated event SetTraderWeaponStats(out array<STraderItemWeaponStats> WeaponStats)
{
    super.SetTraderWeaponStats(WeaponStats);
    WeaponStats.Length = WeaponStats.Length + 1;
    WeaponStats[WeaponStats.Length - 1].StatType = 4;
    WeaponStats[WeaponStats.Length - 1].StatValue = default.BlockDamageMitigation;
    WeaponStats.Length = WeaponStats.Length + 1;
    WeaponStats[WeaponStats.Length - 1].StatType = 5;
    WeaponStats[WeaponStats.Length - 1].StatValue = default.ParryDamageMitigationPercent;
}

static simulated function float CalculateTraderWeaponStatDamage()
{
    local float CalculatedDamage;
    local class<KFDamageType> DamageType;

    CalculatedDamage = default.InstantHitDamage[5];
    DamageType = class<KFDamageType>(default.InstantHitDamageTypes[5]);
    if((DamageType != none) && DamageType.default.DoT_Type != 0)
    {
        CalculatedDamage += ((DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (CalculatedDamage * DamageType.default.DoT_DamageScale));
    }
    return CalculatedDamage;
}

static simulated function float CalculateTraderStatFireRate()
{
    return float(default.EstimatedFireRate);
}

static simulated function float CalculateTraderWeaponStatRange()
{
    if(default.bUseEffectiveRangeForTrader)
    {
        return float(default.EffectiveRange);        
    }
    else
    {
        return default.MeleeAttackHelper.MaxHitRange / 100;
    }
}

simulated state WeaponUpkeep
{
    simulated function byte GetWeaponStateId()
    {
        return 22;
    }

    simulated function BeginState(name PreviousStateName)
    {
        local name AnimName;
        local float Duration;

        AnimName = ((bIsBloody) ? 'Clean_Blood' : 'Clean_NoBlood');
        Duration = MySkelMesh.GetAnimInterruptTime(AnimName);
        if(Duration > 0)
        {
            if(Instigator.IsFirstPerson())
            {
                PlayAnimation(AnimName);
            }
            SetTimer(Duration, false, 'UpkeepComplete');            
        }
        else
        {
            WarnInternal("Duration is zero!!!" @ string(AnimName));
            SetTimer(0.001, false, 'UpkeepComplete');
        }
        NotifyBeginState();
    }

    simulated event EndState(name NextStateName)
    {
        NotifyEndState();
    }

    simulated function UpkeepComplete()
    {
        GotoState('Active');
    }
    stop;    
}

simulated state MeleeChainAttacking extends MeleeAttackBasic
{
    simulated function BeginState(name PrevStateName)
    {
        super.BeginState(PrevStateName);
    }

    simulated function byte GetWeaponStateId()
    {
        switch(MeleeAttackHelper.CurrentAttackDir)
        {
            case 0:
                return 15;
            case 4:
                return 15;
            case 5:
                return 15;
            case 1:
                return 16;
            case 6:
                return 16;
            case 7:
                return 16;
            case 2:
                return 13;
            case 3:
                return 14;
            default:
                return 11;
                break;
        }
    }

    simulated function EndState(name NextStateName)
    {
        super.EndState(NextStateName);
        PlayMeleeSettleAnim();
        if(PendingFire(0) && PendingFire(5))
        {
            ClearPendingFire(0);
        }
    }

    simulated function bool ShouldContinueMelee(optional int ChainCount)
    {
        if(PendingFire(5))
        {
            return false;
        }
        if(!ShouldRefire())
        {
            return false;
        }
        if(!MeleeAttackHelper.bHasChainAttacks)
        {
            return false;
        }
        return (ChainCount + 1) < MaxChainAtkCount;
    }

    simulated function name GetMeleeAnimName(KFPawn.EPawnOctant AtkDir, KFMeleeHelperWeapon.EMeleeAttackType AtkType)
    {
        KFPawn(Instigator).WeaponStateChanged(GetWeaponStateId());
        if(AtkType == 1)
        {
            switch(AtkDir)
            {
                case 0:
                    return 'Combo_F';
                case 4:
                    return 'Combo_FL';
                case 5:
                    return 'Combo_FR';
                case 1:
                    return ((FRand() < 0.5) ? 'Combo_BL' : 'Combo_BR');
                case 6:
                    return 'Combo_BL';
                case 7:
                    return 'Combo_BR';
                case 2:
                    return 'Combo_L';
                case 3:
                    return 'Combo_R';
                default:
                    break;
                }
        }
        else
        {
            switch(AtkDir)
            {
                case 0:
                    return 'Atk_F';
                case 4:
                    return 'Atk_F';
                case 5:
                    return 'Atk_F';
                case 1:
                    return 'Atk_B';
                case 6:
                    return 'Atk_B';
                case 7:
                    return 'Atk_B';
                case 2:
                    return 'Atk_L';
                case 3:
                    return 'Atk_R';
                default:
                    break;
            }
        }
    }
    stop;    
}

simulated state MeleeHeavyAttacking extends MeleeAttackBasic
{
    simulated function byte GetWeaponStateId()
    {
        switch(MeleeAttackHelper.CurrentAttackDir)
        {
            case 0:
                return 19;
            case 4:
                return 19;
            case 5:
                return 19;
            case 1:
                return 20;
            case 6:
                return 20;
            case 7:
                return 20;
            case 2:
                return 17;
            case 3:
                return 18;
            default:
                return 0;
                break;
        }
    }

    simulated function BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        if(Instigator.IsLocallyControlled())
        {
            KFPlayerController(Instigator.Controller).PauseMoveInput(0.1);
        }
    }

    simulated function EndState(name NextStateName)
    {
        super.EndState(NextStateName);
        PlayMeleeSettleAnim();
    }

    simulated function name GetMeleeAnimName(KFPawn.EPawnOctant AtkDir, KFMeleeHelperWeapon.EMeleeAttackType AtkType)
    {
        if(AtkType == 2)
        {
            return 'Atk_Draw';
        }
        switch(AtkDir)
        {
            case 0:
                return 'Atk_H_F';
            case 4:
                return 'Atk_H_F';
            case 5:
                return 'Atk_H_F';
            case 1:
                return 'Atk_H_B';
            case 6:
                return 'Atk_H_B';
            case 7:
                return 'Atk_H_B';
            case 2:
                return 'Atk_H_L';
            case 3:
                return 'Atk_H_R';
            default:
                break;
        }
    }

    simulated function bool IsHeavyAttack(byte FireMode)
    {
        return true;
    }
    stop;    
}

simulated state MeleeSustained extends WeaponFiring
{
    ignores AllowSprinting, AllowIronSights;

    simulated function bool IsMeleeing()
    {
        return true;
    }

    simulated function BeginState(name PreviousStateName)
    {
        if(MeleeSustainedWarmupTime > 0)
        {
            SetTimer(MeleeSustainedWarmupTime, false, 'SustainedWarmupEndTimer');            
        }
        else
        {
            SustainedWarmupEndTimer();
        }
        StartLoopingFireEffects(CurrentFireMode, true);
        NotifyBeginState();
    }

    simulated function EndState(name NextStateName)
    {
        super.EndState(NextStateName);
        NotifyEndState();
    }

    simulated function bool StillFiring(byte FireMode)
    {
        if((global.StillFiring(FireMode)) || IsTimerActive('SustainedMinFireTimer'))
        {
            return true;
        }
        return false;
    }

    simulated function SustainedWarmupEndTimer()
    {
        FireAmmunition();
        TimeWeaponFiring(CurrentFireMode);
        if(MinMeleeSustainedTime > 0)
        {
            SetTimer(MinMeleeSustainedTime, false, 'SustainedMinFireTimer');
        }
    }

    simulated function FireAmmunition()
    {
        MeleeAttackHelper.MeleeAttackImpact();
        ConsumeAmmo(CurrentFireMode);
    }

    simulated function name GetLoopingFireAnim(byte FireModeNum)
    {
        return 'Atk_F_Loop';
    }

    simulated function name GetLoopStartFireAnim(byte FireModeNum)
    {
        return 'Atk_F_In';
    }

    simulated function name GetLoopEndFireAnim(byte FireModeNum)
    {
        return 'Atk_F_Out';
    }

    simulated function byte GetWeaponStateId()
    {
        return 12;
    }
    stop;    
}

simulated state MeleeBlocking
{
    ignores ForceReload, ShouldAutoReload;

    simulated function byte GetWeaponStateId()
    {
        return 21;
    }

    simulated function BeginState(name PreviousStateName)
    {
        PlayBlockStart();
        if(ParryDuration > 0)
        {
            SetTimer(ParryDuration, false, 'ParryCheckTimer');
        }
        NotifyBeginState();
    }

    simulated function EndState(name NextStateName)
    {
        if(Instigator.IsLocallyControlled())
        {
            PlayAnimation('Brace_out');
        }
        NotifyEndState();
    }

    simulated function EndFire(byte FireModeNum)
    {
        global.EndFire(FireModeNum);
        if(!StillFiring(CurrentFireMode) && !IsTimerActive('ParryCheckTimer'))
        {
            GotoState('BlockingCooldown');
        }
    }

    simulated function ParryCheckTimer()
    {
        if(!StillFiring(CurrentFireMode))
        {
            GotoState('BlockingCooldown');
        }
    }

    function bool IsGrappleBlocked(Pawn InstigatedBy)
    {
        local float FacingDot;
        local Vector Dir2d;

        Dir2d = Normal2D(InstigatedBy.Location - Location);
        FacingDot = vector(Rotation) Dot Dir2d;
        if(FacingDot > 0.087)
        {
            if(IsTimerActive('ParryCheckTimer'))
            {
                KFPawn(InstigatedBy).NotifyAttackParried(Instigator, 255);
                ClientPlayParryEffects();                
            }
            else
            {
                ClientPlayBlockEffects();
            }
            return true;
        }
        return false;
    }

    function AdjustDamage(out int InDamage, class<DamageType> DamageType, Actor DamageCauser)
    {
        local float FacingDot;
        local Vector Dir2d;
        local KFPerk InstigatorPerk;

        Dir2d = Normal2D(DamageCauser.Location - Location);
        FacingDot = vector(Rotation) Dot Dir2d;
        if((FacingDot > 0.087) && CanBlockDamageType(DamageType))
        {
            InstigatorPerk = GetPerk();
            if(IsTimerActive('ParryCheckTimer'))
            {
                InDamage *= ParryDamageMitigationPercent;
                if(KFPawn(DamageCauser) != none)
                {
                    KFPawn(DamageCauser).NotifyAttackParried(Instigator, ParryStrength);
                }
                ClientPlayParryEffects();
                if(InstigatorPerk != none)
                {
                    InstigatorPerk.SetSuccessfullParry();
                }                
            }
            else
            {
                InDamage *= BlockDamageMitigation;
                ClientPlayBlockEffects();
                if(InstigatorPerk != none)
                {
                    InstigatorPerk.SetSuccessfullBlock();
                }
            }
        }
    }

    simulated function BlockLoopTimer()
    {
        if(Instigator.IsLocallyControlled())
        {
            PlayAnimation('Brace_loop',, true);
        }
    }

    unreliable client simulated function ClientPlayBlockEffects()
    {
        local int AnimIdx;
        local float Duration;
        local KFPerk InstigatorPerk;

        global.ClientPlayBlockEffects();
        InstigatorPerk = GetPerk();
        if(InstigatorPerk != none)
        {
            InstigatorPerk.SetSuccessfullBlock();
        }
        if((MeleeBlockHitAnims.Length > 0) && !IsTimerActive('ParryCheckTimer'))
        {
            AnimIdx = Rand(MeleeBlockHitAnims.Length);
            Duration = MySkelMesh.GetAnimLength(MeleeBlockHitAnims[AnimIdx]);
            if(Duration > float(0))
            {
                PlayAnimation(MeleeBlockHitAnims[AnimIdx]);
                SetTimer(Duration, false, 'BlockLoopTimer');
            }
        }
    }
    stop;    
}

simulated state BlockingCooldown extends Active
{
    ignores AllowSprinting;

    simulated function BeginState(name PreviousStateName)
    {
        SetTimer(0.5, false, 'BlockCooldownTimer');
        super.BeginState(PreviousStateName);
    }

    simulated function bool HasAmmo(byte FireModeNum, optional int Amount)
    {
        Amount = 1;
        if(FireModeNum == 1)
        {
            return false;
        }
        return global.HasAmmo(FireModeNum, Amount);
    }

    simulated function bool ShouldAutoReload(byte FireModeNum)
    {
        if(FireModeNum == 1)
        {
            return false;
        }
        return global.ShouldAutoReload(FireModeNum);
    }

    simulated function BlockCooldownTimer()
    {
        GotoState('Active');
    }
    stop;    
}

simulated state WeaponEquipping
{
    simulated function ANIMNOTIFY_DrawAtk()
    {
        SetTimer(0.001, false, 'AttemptDrawStrike');
    }

    simulated function AttemptDrawStrike()
    {
        if(PendingFire(0) || PendingFire(5))
        {
            MeleeAttackHelper.InitAttackSequence(3, 2);
            SendToFiringState(5);
        }
    }
    stop;    
}

defaultproperties
{
    MaxChainAtkCount=3
    ParryStrength=4
    EstimatedFireRate=100
    MinMeleeSustainedTime=0.5
    MeleeSustainedWarmupTime=0.25
    BlockDamageType(0)=class'KFDT_Bludgeon'
    BlockDamageType(1)=class'KFDT_Slashing'
    BlockDamageMitigation=0.5
    ParryDuration=1
    ParryDamageMitigationPercent=0.2
    MeleeAttackSettleAnims(0)=Settle_V1
    MeleeBlockHitAnims(0)=Block_Hit_V1
    MeleeBlockHitAnims(1)=Block_Hit_V2
    MeleeBlockHitAnims(2)=Block_Hit_V3
    DistortTrailParticle=ParticleSystem'FX_Gameplay_EMIT_THREE.Trails.FX_Trail_Distort_R_01'
    WhiteTrailParticle=ParticleSystem'FX_Gameplay_EMIT_THREE.Trails.FX_Trail_White_R_01'
    BlueTrailParticle=ParticleSystem'FX_Gameplay_EMIT_THREE.Trails.FX_Trail_Blue_R_01'
    RedTrailParticle=ParticleSystem'FX_Gameplay_EMIT_THREE.Trails.FX_Trail_Red_R_01'
    BlockParticleSystem=ParticleSystem'FX_Impacts_EMIT.FX_Block_melee_01'
    ParryParticleSystem=ParticleSystem'FX_Impacts_EMIT.FX_Parry_melee_01'
    BlockEffectsSocketName=BlockEffect
    FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Melee'
    FireModeIconPaths(1)=none
    FireModeIconPaths(2)=none
    FireModeIconPaths(3)=none
    FireModeIconPaths(4)=none
    FireModeIconPaths(5)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Melee'
    InventoryGroup=EInventoryGroup.IG_Melee
    EffectiveRange=2
    begin object name=MeleeHelper class=KFMeleeHelperWeapon
        bUseDirectionalMelee=true
        bHasChainAttacks=true
        MaxHitRange=150
    object end
    // Reference: KFMeleeHelperWeapon'Default__KFWeap_MeleeBase.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitMomentum=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    bMeleeWeapon=true
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        MinTickTimeStep=0.025
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_MeleeBase.FirstPersonMesh'
    Mesh=FirstPersonMesh
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_MeleeBase.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_MeleeBase.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}