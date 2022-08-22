/*******************************************************************************
 * KFSM_Siren_Scream generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_Siren_Scream extends KFSM_PlaySingleAnim;

const DAMAGE_COUNT_PER_SCREAM = 4;

var float ScreamDamageFrequency;
var byte ScreamCount;
var float LastScreamTime;
var GameExplosion ExplosionTemplate;
var const class<GameExplosionActor> ExplosionActorClass;
var bool bEndedNormally;
var bool bDrawWaveRadius;
var bool bDrawProjectileShield;
var AkEvent ScreamInterruptSound;
var GameExplosionActor ExplosionActor;
var KFTrigger_SirenProjectileShield ProjectileShield;
var const float ProjectileShieldLifetime;

function bool CanOverrideMoveWith(name NewMove)
{
    if(bCanBeInterrupted && (((NewMove == 'KFSM_Stunned') || NewMove == 'KFSM_Stumble') || NewMove == 'KFSM_Knockdown') || NewMove == 'KFSM_Frozen')
    {
        return true;
    }
    return false;
}

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    super.SpecialMoveStarted(bForced, PrevMove);
    bEndedNormally = false;
    LastScreamTime = 0;
    KFPOwner.SetTimer(ProjectileShieldLifetime, false, 'Timer_DestroyProjectileShield', self);
    if(AIOwner != none)
    {
        if(AIOwner != none)
        {
            AIOwner.AILog_Internal((string(KFPOwner) @ "started for") @ string(AIOwner), 'Siren');
        }
    }
}

function ScreamBegan()
{
    if(bDrawWaveRadius || bDrawProjectileShield)
    {
        KFPOwner.FlushPersistentDebugLines();
    }
    SpawnProjectileShield();
    InitializeSirenExplosion();
}

function SpawnProjectileShield()
{
    local Vector vExtent;

    if((KFPOwner.Role == ROLE_Authority) && ProjectileShield == none)
    {
        ProjectileShield = KFPOwner.Spawn(Class'KFTrigger_SirenProjectileShield', KFPOwner,, KFPOwner.Location, KFPOwner.Rotation);
        ProjectileShield.SetBase(KFPOwner);
        ProjectileShield.SetRelativeLocation(vect(0, 0, 0));
        vExtent = vect(0, 0, 1) * ProjectileShield.CylinderComponent.CollisionHeight;
        if(bDrawProjectileShield)
        {
            KFPOwner.DrawDebugCylinder(ProjectileShield.Location - vExtent, ProjectileShield.Location + vExtent, ProjectileShield.CylinderComponent.CollisionRadius, 10, 255, 0, 0, true);
        }
    }
}

function Timer_DestroyProjectileShield()
{
    DestroyProjectileShield();
}

function DestroyProjectileShield()
{
    if(ProjectileShield != none)
    {
        ProjectileShield.Destroy();
        ProjectileShield = none;
        if(bDrawProjectileShield)
        {
            KFPOwner.FlushPersistentDebugLines();
        }
    }
}

function InitializeSirenExplosion()
{
    if(ExplosionTemplate != none)
    {
        ExplosionActor = KFPOwner.Spawn(ExplosionActorClass, KFPOwner,, KFPOwner.Location, KFPOwner.Rotation);
        if(ExplosionActor != none)
        {
            ExplosionActor.Instigator = KFPOwner;
            ExplosionActor.InstigatorController = KFPOwner.Controller;
            ScreamExplosion();
            KFPOwner.SetTimer(ScreamDamageFrequency, true, 'ScreamExplosion', self);
        }
    }
}

function ScreamExplosion()
{
    if(!KFPOwner.IsCombatCapable())
    {
        KFPOwner.EndSpecialMove();
        return;
    }
    LastScreamTime = KFPOwner.WorldInfo.TimeSeconds;
    ExplosionTemplate.Damage = float(KFPawn_Monster(KFPOwner).GetRallyBoostDamage(int(default.ExplosionTemplate.Damage)));
    ExplosionActor.Explode(ExplosionTemplate);
    ++ ScreamCount;
    if(ScreamCount >= 4)
    {
        bEndedNormally = true;
        KFPOwner.EndSpecialMove();
    }
}

function CheckIfScreamWasInterrupted()
{
    if((!bEndedNormally && LastScreamTime > 0) && (KFPOwner.WorldInfo.TimeSeconds - LastScreamTime) < 0.5)
    {
        KFPOwner.PlayAkEvent(ScreamInterruptSound, false, true);
    }
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    super.SpecialMoveEnded(PrevMove, NextMove);
    CheckIfScreamWasInterrupted();
    KFPOwner.ClearTimer('ScreamExplosion', self);
    ScreamCount = 0;
    DestroyProjectileShield();
    if(AIOwner != none)
    {
        if(AIOwner != none)
        {
            AIOwner.AILog_Internal((string(KFPOwner) @ "ended for") @ string(AIOwner), 'Siren');
        }
    }
}

defaultproperties
{
    ScreamDamageFrequency=1
    begin object name=ExploTemplate0 class=KFGameExplosion
        Damage=18
        DamageRadius=800
        ActorClassToIgnoreForDamage=Class'KFGame.KFPawn_Monster'
        MyDamageType=Class'KFGame.KFDT_Sonic'
        KnockDownStrength=0
        MomentumTransferScale=100
        CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.SirenScream'
    object end
    // Reference: KFGameExplosion'Default__KFSM_Siren_Scream.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ExplosionActorClass=Class'KFExplosion_SirenScream'
    ScreamInterruptSound=AkEvent'WW_ZED_Siren.Stop_Siren_Scream'
    ProjectileShieldLifetime=1
    AnimName=Atk_Combo1_V1
    AnimStance=EAnimSlotStance.EAS_UpperBody
    bCanBeInterrupted=true
    bDisableSteering=false
    Handle=KFSM_SirenScream
}