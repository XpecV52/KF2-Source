//=============================================================================
// KFSM_GrappleAttack_Hans
//=============================================================================
// Hans's energy drain attack - he grabs his victim (similar to the clot
// grab attack) and syphons health from the victim.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_GrappleAttack_Hans extends KFSM_GrappleAttack;

var bool bAlreadyDetachedFollower;
var KFPawn CachedFollower;

var int DamagePerSecond;
var() int HealthGainPerSecond;

var int FollowerStartingHealth;

var   float EnemyDrawLifeThreshold;
/** How much life to draw from an enemy when drawing life per difficulty level */
var() float MaxEnemyLifeDrawThresholdNormal;
var() float MaxEnemyLifeDrawThresholdHard;
var() float MaxEnemyLifeDrawThresholdSuicidal;
var() float MaxEnemyLifeDrawThresholdHellOnEarth;

/** How long Hans should wait to do an attack on the player he just drained when he is finished */
var() float PostDrainAttackCooldown;

var class<KFExplosionActor> LifeDrainSmokeExplosionActorClass;
var KFGameExplosion         LifeDrainSmokeExplosionTemplate;

// shield
var ParticleSystem InvulnerableEnergyFX;
var ParticleSystemComponent InvulnerableEnergyPSC;
var name InvulnerableEnergySocketName;

function SpecialMoveStarted( bool bForced, Name PrevMove )
{
    local KFExplosionActor ExplosionActor;
	local KFPawn_ZedHansBase HansPawn;
    local KFAIController KFAIC;

    super.SpecialMoveStarted( bForced, PrevMove );

	HansPawn = KFPawn_ZedHansBase(PawnOwner);
	if( Follower != none && HansPawn != none && HansPawn.Controller != none)
	{
        CachedFollower = Follower;

    	// Don't let other zeds target this player
        Follower.ExclusiveTargetingController = HansPawn.Controller;

    	// If other zeds are targeting this player, make them target someone else or wander around
    	foreach Follower.AllActors( class'KFAIController', KFAIC )
    	{
            if( KFAIC != none && KFAIC != HansPawn.Controller
                && KFAIC.Enemy == Follower )
            {
                KFAIC.Enemy = none;
                KFAIC.FindNewEnemy();

                // Have the enemies buzz off for a few if they can't find an enemy
                if( KFAIC.Enemy == none )
                {
                    KFAIC.DoWander( Follower, 5.0, true );
                }
                // Wander anyway if they are real close, just to get them away from Hans - Ramm, maybe add back later if needed
                //else if( VSizeSq(KFAIC.Pawn.Location - Follower.Location) < 250000 ) // 5 meters
                //{
                //    KFAIC.DoWander( Follower, 1.0, true );
                //}
            }
        }

        HansPawn.PlayHealDialog();
        HansPawn.DetachShieldFX();
	}

    if( KFPOwner != none && KFPOwner.MyKFAIC != none )
    {
        // Determine what life draw threshold to use
        if( KFPOwner.MyKFAIC.Skill == class'KFDifficultyInfo'.static.GetDifficultyValue(0) ) // Normal
        {
            EnemyDrawLifeThreshold = MaxEnemyLifeDrawThresholdNormal;
        }
        else if( KFPOwner.MyKFAIC.Skill <= class'KFDifficultyInfo'.static.GetDifficultyValue(1) ) // Hard
        {
            EnemyDrawLifeThreshold = MaxEnemyLifeDrawThresholdHard;
        }
        else if( KFPOwner.MyKFAIC.Skill <= class'KFDifficultyInfo'.static.GetDifficultyValue(2) ) // Suicidal
        {
            EnemyDrawLifeThreshold = MaxEnemyLifeDrawThresholdSuicidal;
        }
        else // Hell on Earth
        {
            EnemyDrawLifeThreshold = MaxEnemyLifeDrawThresholdHellOnEarth;
        }
    }

    KFPOwner.SetTimer( 0.25f, true, nameof(Timer_DrainHealth), self );

    // spawn smoke cloud
    ExplosionActor = KFPOwner.Spawn(LifeDrainSmokeExplosionActorClass, KFPOwner,, KFPOwner.mesh.GetBoneLocation('Root'), rotator(vect(0,0,1)));
    if( ExplosionActor != none )
    {
        ExplosionActor.Explode( LifeDrainSmokeExplosionTemplate );
    }

    InvulnerableEnergyPSC = KFPOwner.WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(InvulnerableEnergyFX, KFPOwner.Mesh, InvulnerableEnergySocketName, true);
}

function PlayGrappleAnim()
{
    local int GrappleAnimIdx;
    local float Duration, InterruptTime, DamageMod;

    // select a random anim from the list
    GrappleAnimIdx = Rand(GrappleAnims.Length);

    // Missed!
    Duration = PlaySpecialMoveAnim( GrappleAnims[GrappleAnimIdx], EAS_FullBody );

    // Set our release timer
    bAlreadyDetachedFollower = false;
    InterruptTime = KFSkeletalMeshComponent(KFPOwner.Mesh).GetAniminterruptTime( GrappleAnims[GrappleAnimIdx] );
    PostDrainAttackCooldown = (Duration - InterruptTime) + 0.5f;
    KFPOwner.SetTimer( InterruptTime, false, nameof(Timer_DetachFollower), self );

    // Scale the damage per second by the interrupt time (the moment Hans lets go of the player, not when the specialmove ends)
    DamageMod = Duration/InterruptTime;

    // Determine the rate to draw life at
    if( Follower.GetHealthPercentage() > EnemyDrawLifeThreshold )
    {
        // Damage the player completely in 75% of the animation time
        DamagePerSecond = DamageMod * Max(((Follower.Health - (Follower.HealthMax * EnemyDrawLifeThreshold))/(Duration * 0.75)) * 0.25, 1);
    }
    else
    {
        DamagePerSecond = 0;
    }

    // Heal up completely in 75% of the animation time
    HealthGainPerSecond  = DamageMod * ((KFPOwner.HealthMax - (KFPOwner.HealthMax * KFPOwner.GetHealthPercentage()))/(Duration * 0.75)) * 0.25;

    // Have SOME healing
    if( HealthGainPerSecond <= 0 )
    {
        HealthGainPerSecond = 1;
    }

    // Remove from the list so that it's not repeated
    GrappleAnims.Remove(GrappleAnimIdx, 1);
    if ( GrappleAnims.Length == 0 )
    {
        GrappleAnims = default.GrappleAnims;
    }
}

function SpecialMoveEnded( Name PrevMove, Name NextMove )
{
    local KFAISpawnManager SpawnManager;
    local KFPawn_ZedHansBase HansPawn;

    KFPOwner.ClearTimer( nameof(Timer_DrainHealth), self );

    if( KFPOwner != none && KFPOwner.MyKFAIC != none && KFPOwner.MyKFAIC != none
        && KFAIController_Hans(KFPOwner.MyKFAIC) != none )
    {
        HansPawn = KFPawn_ZedHansBase(KFPOwner);

        // stop hunting players and sucking health if you got enough health
        if( KFPOwner.MyKFAIC.GetHealthPercentage() > 0.75 )
        {
            if( HansPawn != none )
            {
                HansPawn.SetHuntAndHealMode( false );
            }
            SpawnManager = KFGameInfo(PawnOwner.WorldInfo.Game).SpawnManager; 
            if ( SpawnManager != none )
            {
                SpawnManager.StopSummoningBossMinions();
            }
        }

    	if( CachedFollower != none && HansPawn != none && KFPOwner.MyKFAIC != none)
    	{
			// If there is no enemy taunt instead of just standing around
            if( KFPOwner.MyKFAIC.Enemy == None && HansPawn.CanDoSpecialMove(SM_Taunt) )
			{
				class'AICommand_TauntEnemy'.static.Taunt( KFPOwner.MyKFAIC, CachedFollower, TAUNT_Standard );
            }
    	}
    }

    KFPOwner.DetachEmitter( InvulnerableEnergyPSC );
    CachedFollower = none;

    super.SpecialMoveEnded( PrevMove, NextMove );
}

function Timer_DrainHealth()
{
    local KFPawn_ZedHansBase HansPawn;

    if( KFPOwner != none && KFPOwner.Health > 0 && Follower != none && Follower.Health >= 0 && Follower.IsDoingSpecialMove(SM_HansGrappleVictim) )
    {
        // Don't suck too much of the player's life
        if( Follower.GetHealthPercentage() > EnemyDrawLifeThreshold )
        {
            Follower.TakeDamage( DamagePerSecond, KFPOwner.Controller, Follower.Location, vect(0,0,0), class'KFDT_DrainHealth' );
        }

        KFPOwner.HealDamage( HealthGainPerSecond, KFPOwner.Controller, class'KFDT_Healing' );

        HansPawn = KFPawn_ZedHansBase(KFPOwner);

        if( HansPawn != none )
        {
            // Don't let Hans try and toss smoke right after healing
            HansPawn.LastSmokeTossTime = HansPawn.WorldInfo.TimeSeconds;
        }
    }
    else
    {
        KFPOwner.ClearTimer( nameof(Timer_DrainHealth), self );
    }
}

function Timer_DetachFollower()
{
    // Set flag so follower doesn't try to end special move after detaching
    bAlreadyDetachedFollower = true;

    // Clear timers
    KFPOwner.ClearTimer( nameof(Timer_DrainHealth), self );
    KFPOwner.ClearTimer( nameof(CheckReadyToStartInteraction), self );
    KFPOwner.ClearTimer( nameof(InteractionStartTimedOut), self );
    KFPOwner.ClearTimer( nameof(RetryCollisionTimer), self );

    if( Follower != none )
    {
        // Have Hans and other zeds not attack this player after he just drained them
        Follower.AIIgnoreEndTime = Follower.WorldInfo.TimeSeconds + PostDrainAttackCooldown;
        KFPOwner.MyKFAIC.Enemy = none;
        KFPOwner.MyKFAIC.FindNewEnemy();

        // End special move on Follower
        Follower.EndSpecialMove();

        // Zero movement variables on Follower to stop any animation-driven motion
        if( bAlignPawns )
        {
            Follower.ZeroMovementVariables();
        }
    }

    if( ExecutionCameraAnimInst_Follower != None )
    {
        if( PCOwner != None )
        {
            PCOwner.PlayerCamera.StopCameraAnim( ExecutionCameraAnimInst_Follower );
        }
        ExecutionCameraAnimInst_Follower = None;
    }

    // Clear reference to Interaction Pawn.
    Follower = None;
}

// Use timer & animlength instead of animend
function AnimEndNotify( AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime )
{
    ActiveSlotNode = None;

    // By default end this special move.
    KFPOwner.EndSpecialMove();
}

/** Notification when Follower is leaving his FollowerSpecialMove */
function OnFollowerLeavingSpecialMove()
{
    if( bAlreadyDetachedFollower )
    {
        return;
    }

    KFPOwner.EndSpecialMove();
}

/** Notification from the pawn that damage was taken during move */
function NotifyOwnerTakeHit(class<KFDamageType> DamageType, vector HitLoc, vector HitDir, Controller InstigatedBy)
{
    // Don't take us out of the special move for damage
    // TODO: Implement taking us out of the special move for incaps, or certain melee damage amounts
    return;
}

defaultproperties
{
   MaxEnemyLifeDrawThresholdNormal=0.700000
   MaxEnemyLifeDrawThresholdHard=0.600000
   MaxEnemyLifeDrawThresholdSuicidal=0.500000
   MaxEnemyLifeDrawThresholdHellOnEarth=0.250000
   LifeDrainSmokeExplosionActorClass=Class'kfgamecontent.KFExplosion_HansSmokeGrenade'
   LifeDrainSmokeExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFSM_GrappleAttack_Hans:ExploTemplate0'
   InvulnerableEnergyFX=ParticleSystem'ZED_Hans_EMIT.FX_Hans_invulnerable_Energy'
   InvulnerableEnergySocketName="Root"
   GrappleAnims(0)="Atk_DrawLife_V1"
   FollowerSpecialMove=SM_HansGrappleVictim
   bStopAlignFollowerRotationAtGoal=False
   AlignDistance=108.000000
   bCanOnlyWanderAtEnd=True
   Name="Default__KFSM_GrappleAttack_Hans"
   ObjectArchetype=KFSM_GrappleAttack'KFGame.Default__KFSM_GrappleAttack'
}
