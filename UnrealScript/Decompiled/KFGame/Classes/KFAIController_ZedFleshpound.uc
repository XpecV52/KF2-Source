/*******************************************************************************
 * KFAIController_ZedFleshpound generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAIController_ZedFleshpound extends KFAIController_Monster
    native(AI)
    config(AI)
    hidecategories(Navigation);

var float LastChargeStuckCheckTime;
var Vector LastChargeStuckCheckLocation;
var float ChargeStuckCheckInterval;
var int ChargeStuckCount;
var float ChargeStuckCheckDistance;
var bool bReadyToBecomeEnraged;
var bool bSawEnemy;
var bool bDebugLeaveTargetAngleThreshold;
var float LastKickClotTime;
var export editinline KFAIPluginRage_Fleshpound RagePlugin;
var class<KFAIPluginRage_Fleshpound> RagePluginClass;
var Vector ChargePivot;

// Export UKFAIController_ZedFleshpound::execCleanup(FFrame&, void* const)
native function Cleanup(optional bool bBeingDestroyed);

simulated function Tick(float DeltaTime)
{
    super(KFAIController).Tick(DeltaTime);
    if(RagePlugin != none)
    {
        RagePlugin.TickRage();
    }
}

function bool AmIAllowedToSuicideWhenStuck()
{
    return false;
}

event bool FindNewEnemy()
{
    local Pawn BestEnemy;
    local float bestDist, newdist;
    local Controller C;
    local Pawn PotentialEnemy;

    foreach WorldInfo.AllControllers(Class'Controller', C)
    {
        if((((C.Pawn == none) || !C.Pawn.IsAliveAndWell()) || Pawn.IsSameTeam(C.Pawn)) || !C.Pawn.CanAITargetThisPawn(self))
        {
            continue;            
        }
        PotentialEnemy = C.Pawn;
        newdist = VSizeSq(PotentialEnemy.Location - Pawn.Location);
        if(BestEnemy == none)
        {
            BestEnemy = PotentialEnemy;
            bestDist = newdist;
            continue;
        }
        if(BestEnemy != none)
        {
            if((bestDist > newdist) || (NumberOfZedsTargetingPawn(PotentialEnemy)) < (NumberOfZedsTargetingPawn(BestEnemy)))
            {
                BestEnemy = PotentialEnemy;
                bestDist = newdist;
            }
        }        
    }    
    if(((Enemy != none) && BestEnemy != none) && BestEnemy == Enemy)
    {
        return false;
    }
    if(BestEnemy != none)
    {
        ChangeEnemy(BestEnemy);
        return HasValidEnemy();
    }
    return false;
}

function NotifyMeleeDamageDealt()
{
    super(KFAIController).NotifyMeleeDamageDealt();
    if(RagePlugin != none)
    {
        if((MyKFPawn.SpecialMove != 4) && MyKFPawn.SpecialMove != 2)
        {
            RagePlugin.EndRage();
        }
    }
}

function NotifyTakeHit(Controller InstigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum)
{
    super(KFAIController).NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum);
    if((RagePlugin != none) && InstigatedBy != self)
    {
        RagePlugin.AccumulatedDOT += Damage;
    }
}

event AttitudeStateChanged(name NewState)
{
    if(MyKFPawn == none)
    {
        return;
    }
    switch(NewState)
    {
        case 'Enraged':
            MyKFPawn.SetEnraged(true);
            break;
        case 'Normal':
            MyKFPawn.SetEnraged(false);
            break;
        default:
            break;
    }
}

function bool CanEvadeGrenade()
{
    return !IsEnraged() && super(KFAIController).CanEvadeGrenade();
}

simulated event bool IsEnraged()
{
    return (MyKFPawn != none) && MyKFPawn.IsEnraged();
}

function bool ShouldSprint()
{
    return IsEnraged();
}

function bool CanSetSprinting(bool bNewSprintStatus)
{
    return !bNewSprintStatus || MyKFPawn.IsEnraged();
}

simulated function StartSteering();

function RestoreCollisionSize()
{
    Pawn.SetCollisionSize(36, Pawn.default.CylinderComponent.CollisionHeight);
}

event SeePlayer(Pawn Seen)
{
    if(!bSawEnemy && Seen == Enemy)
    {
        bSawEnemy = true;
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            AILog_Internal(string(GetFuncName()) $ " Just saw my enemy for first time, starting RageFrustrationTimer", 'SeePlayer');
        }
        RagePlugin.StartRageTimer(true);
    }
    super(KFAIController).SeePlayer(Seen);
}

event bool SetEnemy(Pawn NewEnemy)
{
    local bool bNewEnemySet;

    bNewEnemySet = super(KFAIController).SetEnemy(NewEnemy);
    if(bNewEnemySet)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            AILog_Internal(((string(GetFuncName()) $ " Just started targeting a new enemy (") $ string(NewEnemy)) $ "), clearing RageFrustrationTimer", 'SeePlayer');
        }
        bSawEnemy = false;
        EnableSeePlayer();
        RagePlugin.StartRageTimer();
    }
    return bNewEnemySet;
}

function DoRageTauntAt(optional KFPawn Target)
{
    if(Role == ROLE_Authority)
    {
        if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
        {
            KFGameInfo(WorldInfo.Game).DialogManager.PlaySpotEnragedDialog(MyKFPawn);
        }
    }
    if(!Class'Engine'.static.GetEngine().bDisableAILogging)
    {
        AILog_Internal((string(GetFuncName()) $ "() at ") $ string(Target), 'Command_Rage');
    }
    Class'AICommand_TauntEnemy'.static.Taunt(self, Enemy, 2);
}

function NotifyEnRaged(bool bEnraged)
{
    if(CachedAICommandList != none)
    {
        CachedAICommandList.NotifyCombatBehaviorChange('Enraged', bEnraged);        
    }
    else
    {
        WarnInternal(string(Pawn) $ " became enraged with no AICommand!");
    }
}

function UpdateSprintFrustration(optional byte bForceFrustrationState)
{
    bForceFrustrationState = 255;
}

defaultproperties
{
    ChargeStuckCheckInterval=0.25
    ChargeStuckCheckDistance=10
    RagePluginClass=Class'KFAIPluginRage_Fleshpound'
    bUseRunOverWarning=true
    MinRunOverSpeed=360
    MinRunOverWarningAim=0.85
    bCanTeleportCloser=false
    bCanDoHeavyBump=true
    bIsProbingMeleeRangeEvents=true
    DefaultCommandClass=Class'AICommand_Base_Fleshpound'
    MeleeCommandClass=Class'AICommand_Base_Fleshpound'
    SprintWithinEnemyRange=(X=0,Y=1500)
    FrustrationThreshold=0
    TeleportCooldown=10
    HiddenRelocateTeleportThreshold=7
    EvadeGrenadeChance=0.6
    LowIntensityAttackCooldown=5
    DangerEvadeSettings(0)=(ClassName=KFWeap_Rifle_Winchester1894,Cooldowns=(0.5,0.4,0.3,0.2),EvadeChances=none,ForcedEvadeChances=none,ReactionDelayRanges=none,BlockChances=(0.1,0.2,0.7,0.85),SoloChanceMultiplier=0,LastEvadeTime=0)
    DangerEvadeSettings(1)=(ClassName=KFWeap_Bow_Crossbow,Cooldowns=(0.5,0.4,0.3,0.2),EvadeChances=none,ForcedEvadeChances=none,ReactionDelayRanges=none,BlockChances=(0.1,0.2,0.7,0.85),SoloChanceMultiplier=0,LastEvadeTime=0)
    DangerEvadeSettings(2)=(ClassName=KFWeap_Rifle_M14EBR,Cooldowns=(0.5,0.4,0.3,0.2),EvadeChances=none,ForcedEvadeChances=none,ReactionDelayRanges=none,BlockChances=(0.1,0.2,0.7,0.85),SoloChanceMultiplier=0,LastEvadeTime=0)
    DangerEvadeSettings(3)=(ClassName=KFWeap_Rifle_RailGun,Cooldowns=(0.5,0.4,0.3,0.2),EvadeChances=none,ForcedEvadeChances=none,ReactionDelayRanges=none,BlockChances=(0.1,0.2,0.7,0.85),SoloChanceMultiplier=0,LastEvadeTime=0)
    bNotifyApex=true
    MinHitWall=-0.42
}