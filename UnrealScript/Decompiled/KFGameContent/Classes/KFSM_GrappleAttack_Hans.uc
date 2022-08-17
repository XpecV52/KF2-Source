/*******************************************************************************
 * KFSM_GrappleAttack_Hans generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_GrappleAttack_Hans extends KFSM_GrappleAttack;

var bool bAlreadyDetachedFollower;
var KFPawn CachedFollower;
var int DamagePerSecond;
var() int HealthGainPerSecond;
var int FollowerStartingHealth;
var float EnemyDrawLifeThreshold;
/** How much life to draw from an enemy when drawing life per difficulty level */
var() float MaxEnemyLifeDrawThresholdNormal;
var() float MaxEnemyLifeDrawThresholdHard;
var() float MaxEnemyLifeDrawThresholdSuicidal;
var() float MaxEnemyLifeDrawThresholdHellOnEarth;
/** How long Hans should wait to do an attack on the player he just drained when he is finished */
var() float PostDrainAttackCooldown;
var class<KFExplosionActor> LifeDrainSmokeExplosionActorClass;
var KFGameExplosion LifeDrainSmokeExplosionTemplate;
var ParticleSystem InvulnerableEnergyFX;
var export editinline ParticleSystemComponent InvulnerableEnergyPSC;
var name InvulnerableEnergySocketName;

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    local KFExplosionActor ExplosionActor;
    local KFPawn_ZedHansBase HansPawn;
    local KFAIController KFAIC;

    super.SpecialMoveStarted(bForced, PrevMove);
    HansPawn = KFPawn_ZedHansBase(PawnOwner);
    if(((Follower != none) && HansPawn != none) && HansPawn.Controller != none)
    {
        CachedFollower = Follower;
        Follower.ExclusiveTargetingController = HansPawn.Controller;
        foreach Follower.AllActors(Class'KFAIController', KFAIC)
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
        HansPawn.DetachShieldFX();
    }
    if((KFPOwner != none) && KFPOwner.MyKFAIC != none)
    {
        if(KFPOwner.MyKFAIC.Skill == Class'KFDifficultyInfo'.static.GetDifficultyValue(0))
        {
            EnemyDrawLifeThreshold = MaxEnemyLifeDrawThresholdNormal;            
        }
        else
        {
            if(KFPOwner.MyKFAIC.Skill <= Class'KFDifficultyInfo'.static.GetDifficultyValue(1))
            {
                EnemyDrawLifeThreshold = MaxEnemyLifeDrawThresholdHard;                
            }
            else
            {
                if(KFPOwner.MyKFAIC.Skill <= Class'KFDifficultyInfo'.static.GetDifficultyValue(2))
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
    KFPOwner.SetTimer(0.25, true, 'Timer_DrainHealth', self);
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

function PlayGrappleAnim()
{
    local int GrappleAnimIdx;
    local float Duration, InterruptTime, DamageMod;

    GrappleAnimIdx = Rand(GrappleAnims.Length);
    Duration = PlaySpecialMoveAnim(GrappleAnims[GrappleAnimIdx], 0);
    bAlreadyDetachedFollower = false;
    InterruptTime = KFSkeletalMeshComponent(KFPOwner.Mesh).GetAnimInterruptTime(GrappleAnims[GrappleAnimIdx]);
    PostDrainAttackCooldown = (Duration - InterruptTime) + 0.5;
    KFPOwner.SetTimer(InterruptTime, false, 'Timer_DetachFollower', self);
    DamageMod = Duration / InterruptTime;
    if(Follower.GetHealthPercentage() > EnemyDrawLifeThreshold)
    {
        DamagePerSecond = int(DamageMod * float(Max(int(((float(Follower.Health) - (float(Follower.HealthMax) * EnemyDrawLifeThreshold)) / (Duration * 0.75)) * 0.25), 1)));        
    }
    else
    {
        DamagePerSecond = 0;
    }
    HealthGainPerSecond = int((DamageMod * ((float(KFPOwner.HealthMax) - (float(KFPOwner.HealthMax) * KFPOwner.GetHealthPercentage())) / (Duration * 0.75))) * 0.25);
    if(HealthGainPerSecond <= 0)
    {
        HealthGainPerSecond = 1;
    }
    GrappleAnims.Remove(GrappleAnimIdx, 1;
    if(GrappleAnims.Length == 0)
    {
        GrappleAnims = default.GrappleAnims;
    }
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    local KFAISpawnManager SpawnManager;
    local KFPawn_ZedHansBase HansPawn;

    KFPOwner.ClearTimer('Timer_DrainHealth', self);
    if((((KFPOwner != none) && KFPOwner.MyKFAIC != none) && KFPOwner.MyKFAIC != none) && KFAIController_Hans(KFPOwner.MyKFAIC) != none)
    {
        HansPawn = KFPawn_ZedHansBase(KFPOwner);
        if(KFPOwner.MyKFAIC.GetHealthPercentage() > 0.75)
        {
            if(HansPawn != none)
            {
                HansPawn.SetHuntAndHealMode(false);
            }
            SpawnManager = KFGameInfo(PawnOwner.WorldInfo.Game).SpawnManager;
            if(SpawnManager != none)
            {
                SpawnManager.StopSummoningBossMinions();
            }
        }
        if(((CachedFollower != none) && HansPawn != none) && KFPOwner.MyKFAIC != none)
        {
            if((KFPOwner.MyKFAIC.Enemy == none) && HansPawn.CanDoSpecialMove(13))
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

    if(((((KFPOwner != none) && KFPOwner.Health > 0) && Follower != none) && Follower.Health >= 0) && Follower.IsDoingSpecialMove(29))
    {
        if(Follower.GetHealthPercentage() > EnemyDrawLifeThreshold)
        {
            Follower.TakeDamage(DamagePerSecond, KFPOwner.Controller, Follower.Location, vect(0, 0, 0), Class'KFDT_DrainHealth');
        }
        KFPOwner.HealDamage(HealthGainPerSecond, KFPOwner.Controller, Class'KFDT_Healing');
        HansPawn = KFPawn_ZedHansBase(KFPOwner);
        if(HansPawn != none)
        {
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
        Follower.AIIgnoreEndTime = Follower.WorldInfo.TimeSeconds + PostDrainAttackCooldown;
        KFPOwner.MyKFAIC.Enemy = none;
        KFPOwner.MyKFAIC.FindNewEnemy();
        Follower.EndSpecialMove();
        if(bAlignPawns)
        {
            Follower.ZeroMovementVariables();
        }
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

function NotifyOwnerTakeHit(class<KFDamageType> DamageType, Vector HitLoc, Vector HitDir, Controller InstigatedBy)
{
    return;
}

defaultproperties
{
    MaxEnemyLifeDrawThresholdNormal=0.7
    MaxEnemyLifeDrawThresholdHard=0.6
    MaxEnemyLifeDrawThresholdSuicidal=0.5
    MaxEnemyLifeDrawThresholdHellOnEarth=0.25
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
    FollowerSpecialMove=ESpecialMove.SM_HansGrappleVictim
    bStopAlignFollowerRotationAtGoal=false
    AlignDistance=108
    bCanOnlyWanderAtEnd=true
}