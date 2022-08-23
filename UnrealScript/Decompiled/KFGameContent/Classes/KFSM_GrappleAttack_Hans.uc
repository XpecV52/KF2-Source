/*******************************************************************************
 * KFSM_GrappleAttack_Hans generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_GrappleAttack_Hans extends KFSM_GrappleCombined;

var name GrabStartAnimNameLunge;
var bool bAlreadyDetachedFollower;
var KFPawn CachedFollower;
var float DrainInterval;
var float DelayBeforeDrain;
var int HealthGainPerDrainInterval;
var int DamageDrainRemaining;
var int NumDrainsRemaining;
var int FollowerStartingHealth;
var float EnemyDrawLifeThreshold;
var float MaxEnemyLifeDrawThresholdNormal;
var float MaxEnemyLifeDrawThresholdHard;
var float MaxEnemyLifeDrawThresholdSuicidal;
var float MaxEnemyLifeDrawThresholdHellOnEarth;
var float MinEnemyLifeDrawThreshold;
var float PostDrainAttackCooldown;
var class<KFExplosionActor> LifeDrainSmokeExplosionActorClass;
var KFGameExplosion LifeDrainSmokeExplosionTemplate;
var ParticleSystem InvulnerableEnergyFX;
var export editinline ParticleSystemComponent InvulnerableEnergyPSC;
var name InvulnerableEnergySocketName;

static function byte PackFlagsBase(KFPawn P)
{
    if((P.MyKFAIC != none) && P.MyKFAIC.Enemy != none)
    {
        if(VSizeSq(P.MyKFAIC.Enemy.Location - P.Location) > (Class'KFAIController_Hans'.default.MinDistanceToPerformGrabAttack * 0.33))
        {
            return 128;
        }
    }
    return 0;
}

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    local KFPawn_ZedHansBase HansPawn;

    super.SpecialMoveStarted(bForced, PrevMove);
    if(PawnOwner.Role == ROLE_Authority)
    {
        HansPawn = KFPawn_ZedHansBase(PawnOwner);
        if(HansPawn != none)
        {
            HansPawn.PlayGrabDialog();
        }
    }
    if((KFPOwner != none) && KFPOwner.MyKFAIC != none)
    {
        if(KFPOwner.MyKFAIC.Skill == Class'KFGameDifficultyInfo'.static.GetDifficultyValue(0))
        {
            EnemyDrawLifeThreshold = MaxEnemyLifeDrawThresholdNormal;            
        }
        else
        {
            if(KFPOwner.MyKFAIC.Skill <= Class'KFGameDifficultyInfo'.static.GetDifficultyValue(1))
            {
                EnemyDrawLifeThreshold = MaxEnemyLifeDrawThresholdHard;                
            }
            else
            {
                if(KFPOwner.MyKFAIC.Skill <= Class'KFGameDifficultyInfo'.static.GetDifficultyValue(2))
                {
                    EnemyDrawLifeThreshold = MaxEnemyLifeDrawThresholdSuicidal;                    
                }
                else
                {
                    EnemyDrawLifeThreshold = MaxEnemyLifeDrawThresholdHellOnEarth;
                }
            }
        }
    }
}

function PlayGrabAnim()
{
    if(KFPOwner.SpecialMoveFlags == 128)
    {
        bUseRootMotion = true;
        GrabStartAnimName = default.GrabStartAnimNameLunge;        
    }
    else
    {
        bUseRootMotion = default.bUseRootMotion;
        GrabStartAnimName = default.GrabStartAnimName;
    }
    super.PlayGrabAnim();
}

function PlayGrappleLoopAnim()
{
    local float Duration, InterruptTime, ActualDrainTime, DrainsPerSecond;

    Duration = PlaySpecialMoveAnim(GrappleAnims[0], 0);
    bAlreadyDetachedFollower = false;
    InterruptTime = KFSkeletalMeshComponent(KFPOwner.Mesh).GetAnimInterruptTime(GrappleAnims[0]);
    KFPOwner.SetTimer(InterruptTime, false, 'Timer_DetachFollower', self);
    if(KFPOwner.Role == ROLE_Authority)
    {
        KFPOwner.SpecialMoveFlags = 1;
        PostDrainAttackCooldown = (Duration - InterruptTime) + 0.5;
        ActualDrainTime = InterruptTime - DelayBeforeDrain;
        DrainsPerSecond = 1 / DrainInterval;
        NumDrainsRemaining = int(ActualDrainTime / DrainInterval);
        if(Follower.GetHealthPercentage() > EnemyDrawLifeThreshold)
        {
            DamageDrainRemaining = Max(int(float(Follower.Health) - (float(Follower.HealthMax) * EnemyDrawLifeThreshold)), 0);            
        }
        else
        {
            DamageDrainRemaining = 0;
        }
        HealthGainPerDrainInterval = Max(int((KFPawn_ZedHansBase(KFPOwner).GetHealAmountForThisPhase() / ActualDrainTime) / DrainsPerSecond), 1);
    }
}

function BeginGrapple(optional KFPawn Victim)
{
    local KFPawn_ZedHansBase HansPawn;
    local KFAIController KFAIC;
    local KFExplosionActor ExplosionActor;

    super.BeginGrapple(Victim);
    HansPawn = KFPawn_ZedHansBase(PawnOwner);
    if(((Follower != none) && HansPawn != none) && HansPawn.Controller != none)
    {
        CachedFollower = Follower;
        Follower.ExclusiveTargetingController = HansPawn.Controller;
        foreach Follower.WorldInfo.AllControllers(Class'KFAIController', KFAIC)
        {
            if(((KFAIC != none) && KFAIC != HansPawn.Controller) && KFAIC.Enemy == Follower)
            {
                KFAIC.Enemy = none;
                KFAIC.FindNewEnemy();
                if(KFAIC.Enemy == none)
                {
                    KFAIC.DoWander(Follower, 5, true);
                }
            }            
        }        
        HansPawn.PlayHealDialog();
        KFPOwner.SetTimer(DelayBeforeDrain, true, 'Timer_DrainHealth', self);
    }
    ExplosionActor = KFPOwner.Spawn(LifeDrainSmokeExplosionActorClass, KFPOwner,, KFPOwner.Mesh.GetBoneLocation('Root'), rotator(vect(0, 0, 1)));
    if(ExplosionActor != none)
    {
        ExplosionActor.Explode(LifeDrainSmokeExplosionTemplate);
    }
    if(KFPOwner.WorldInfo.NetMode != NM_DedicatedServer)
    {
        InvulnerableEnergyPSC = KFPOwner.WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(InvulnerableEnergyFX, KFPOwner.Mesh, InvulnerableEnergySocketName, true);
    }
}

function SpecialMoveFlagsUpdated()
{
    if(KFPOwner.SpecialMoveFlags != 128)
    {
        super.SpecialMoveFlagsUpdated();
    }
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    local KFAISpawnManager SpawnManager;
    local KFPawn_ZedHansBase HansPawn;

    KFPOwner.ClearTimer('Timer_DrainHealth', self);
    KFPOwner.ClearTimer('Timer_DetachFollower', self);
    if((((KFPOwner != none) && KFPOwner.MyKFAIC != none) && KFPOwner.MyKFAIC != none) && KFAIController_Hans(KFPOwner.MyKFAIC) != none)
    {
        HansPawn = KFPawn_ZedHansBase(KFPOwner);
        if(HansPawn != none)
        {
            if(HansPawn.AmountHealedThisPhase > (HansPawn.GetHealAmountForThisPhase() * 0.75))
            {
                HansPawn.SetHuntAndHealMode(false);
            }
        }
        SpawnManager = KFGameInfo(PawnOwner.WorldInfo.Game).SpawnManager;
        if(SpawnManager != none)
        {
            SpawnManager.StopSummoningBossMinions();
        }
        if(((CachedFollower != none) && HansPawn != none) && KFPOwner.MyKFAIC != none)
        {
            if((KFPOwner.MyKFAIC.Enemy == none) && HansPawn.CanDoSpecialMove(12))
            {
                Class'AICommand_TauntEnemy'.static.Taunt(KFPOwner.MyKFAIC, CachedFollower, 0);
            }
        }
    }
    if(InvulnerableEnergyPSC != none)
    {
        KFPOwner.DetachEmitter(InvulnerableEnergyPSC);
    }
    CachedFollower = none;
    super.SpecialMoveEnded(PrevMove, NextMove);
}

function Timer_DrainHealth()
{
    local KFPawn_ZedHansBase HansPawn;
    local int Damage;

    if(((((KFPOwner != none) && KFPOwner.Health > 0) && Follower != none) && Follower.Health >= 0) && Follower.IsDoingSpecialMove(31))
    {
        if(NumDrainsRemaining > 0)
        {
            Damage = Round(float(DamageDrainRemaining) / float(NumDrainsRemaining));
            DamageDrainRemaining -= Damage;
            -- NumDrainsRemaining;
            if((Damage > 0) && (float(Follower.Health - Damage) / float(Follower.HealthMax)) > MinEnemyLifeDrawThreshold)
            {
                Follower.TakeDamage(Damage, KFPOwner.Controller, Follower.Location, vect(0, 0, 0), Class'KFDT_DrainHealth');
            }
        }
        KFPOwner.HealDamage(HealthGainPerDrainInterval, KFPOwner.Controller, Class'KFDT_Healing');
        HansPawn = KFPawn_ZedHansBase(KFPOwner);
        if(HansPawn != none)
        {
            HansPawn.AmountHealedThisPhase += float(HealthGainPerDrainInterval);
            HansPawn.LastSmokeTossTime = HansPawn.WorldInfo.TimeSeconds;
        }        
    }
    else
    {
        KFPOwner.ClearTimer('Timer_DrainHealth', self);
    }
}

function Timer_DetachFollower()
{
    bAlreadyDetachedFollower = true;
    KFPOwner.ClearTimer('Timer_DrainHealth', self);
    KFPOwner.ClearTimer('CheckReadyToStartInteraction', self);
    KFPOwner.ClearTimer('InteractionStartTimedOut', self);
    KFPOwner.ClearTimer('RetryCollisionTimer', self);
    if(Follower != none)
    {
        if(KFPOwner.Role == ROLE_Authority)
        {
            Follower.AIIgnoreEndTime = Follower.WorldInfo.TimeSeconds + PostDrainAttackCooldown;
            if(KFPOwner.MyKFAIC != none)
            {
                KFPOwner.MyKFAIC.Enemy = none;
                KFPOwner.MyKFAIC.FindNewEnemy();
            }
        }
        if(bAlignPawns && !KFPOwner.IsHumanControlled())
        {
            Follower.ZeroMovementVariables();
        }
        Follower.EndSpecialMove();
    }
    if(ExecutionCameraAnimInst_Follower != none)
    {
        if(PCOwner != none)
        {
            PCOwner.PlayerCamera.StopCameraAnim(ExecutionCameraAnimInst_Follower);
        }
        ExecutionCameraAnimInst_Follower = none;
    }
    Follower = none;
}

function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
    ActiveSlotNode = none;
    KFPOwner.EndSpecialMove();
}

function OnFollowerLeavingSpecialMove()
{
    if(bAlreadyDetachedFollower)
    {
        return;
    }
    KFPOwner.EndSpecialMove();
}

function NotifyOwnerTakeHit(class<KFDamageType> DamageType, Vector HitLoc, Vector HitDir, Controller InstigatedBy);

defaultproperties
{
    GrabStartAnimNameLunge=Atk_Lunge_Paralyze_V1
    DrainInterval=0.25
    DelayBeforeDrain=0.25
    MaxEnemyLifeDrawThresholdNormal=0.7
    MaxEnemyLifeDrawThresholdHard=0.45
    MaxEnemyLifeDrawThresholdSuicidal=0.35
    MaxEnemyLifeDrawThresholdHellOnEarth=0.25
    MinEnemyLifeDrawThreshold=0.1
    LifeDrainSmokeExplosionActorClass=Class'KFExplosion_HansSmokeGrenade'
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'ZED_Hans_EMIT.SmokeGrenade_Explosion'
        bCausesFracture=false
        Damage=0
        DamageRadius=0
        ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Explosion'
    object end
    // Reference: KFGameExplosion'Default__KFSM_GrappleAttack_Hans.ExploTemplate0'
    LifeDrainSmokeExplosionTemplate=ExploTemplate0
    InvulnerableEnergyFX=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Energy'
    InvulnerableEnergySocketName=Root
    GrappleAnims=/* Array type was not detected. */
    bCanBeBlocked=false
    bCanBeInterrupted=false
    MaxGrabDistance=250
    GrabStartAnimName=Atk_Paralyze_V1
    FollowerSpecialMove=ESpecialMove.SM_HansGrappleVictim
    bStopAlignFollowerRotationAtGoal=false
    AlignDistance=108
    bCanOnlyWanderAtEnd=true
}