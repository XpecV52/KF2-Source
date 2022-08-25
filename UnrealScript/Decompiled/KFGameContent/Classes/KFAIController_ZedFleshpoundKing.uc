/*******************************************************************************
 * KFAIController_ZedFleshpoundKing generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAIController_ZedFleshpoundKing extends KFAIController_ZedFleshpound
    config(AI)
    hidecategories(Navigation);

const MaxPhases = 4;

var KFPawn_ZedFleshpoundKing MyPawn;
var protected float NextBeamCheckTime;
var protected transient float LastBeamTickTime;
var const Vector2D BeamAttackWaitTimeRange;
var const float MinChestBeamTargetAngle;
var const float MaxChestBeamHeightOffset;
var int CurrentPhase;
var const float PhaseThresholds[4];
var const int ChestBeamMinPhase;

event Possess(Pawn inPawn, bool bVehicleTransition)
{
    local KFGameReplicationInfo KFGRI;

    super.Possess(inPawn, bVehicleTransition);
    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if((KFGRI != none) && KFGRI.WaveNum >= KFGRI.WaveMax)
    {
        Class'AICommand_BossTheatrics'.static.DoTheatrics(self, 0);
    }
    MyPawn = KFPawn_ZedFleshpoundKing(inPawn);
}

function bool AmIAllowedToSuicideWhenStuck()
{
    return false;
}

event SeePlayer(Pawn Seen)
{
    super.SeePlayer(Seen);
    if(NextBeamCheckTime == 0)
    {
        NextBeamCheckTime = WorldInfo.TimeSeconds + RandRange(BeamAttackWaitTimeRange.X, BeamAttackWaitTimeRange.Y);
    }
}

simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    if((CommandList != none) && CommandList.Class == Class'AICommand_BossTheatrics')
    {
        return;
    }
    if(((NextBeamCheckTime > 0) && (WorldInfo.TimeSeconds - LastBeamTickTime) > 0.2) && WorldInfo.TimeSeconds >= NextBeamCheckTime)
    {
        LastBeamTickTime = WorldInfo.TimeSeconds;
        CheckForBeamAttack();
    }
}

function CheckForBeamAttack()
{
    local Pawn P, BestTarget;
    local float MaxBeamTargetDistSQ, Dist, DotAngle, Rating, BestRating;

    local Vector Projection, PawnDir;

    if(MyKFPawn.IsDoingSpecialMove())
    {
        return;
    }
    if(CurrentPhase < ChestBeamMinPhase)
    {
        return;
    }
    if(RagePlugin.bIsEnraged)
    {
        return;
    }
    MaxBeamTargetDistSQ = Square(Class'KFSM_FleshpoundKing_ChestBeam'.default.MaxBeamLength * 0.85);
    PawnDir = vector(MyKFPawn.Rotation);
    BestRating = -1;
    foreach WorldInfo.AllPawns(Class'Pawn', P)
    {
        if((P.GetTeamNum() == MyKFPawn.GetTeamNum()) || !P.IsAliveAndWell())
        {
            continue;            
        }
        Projection = P.Location - MyKFPawn.Location;
        Dist = VSizeSq(Projection);
        if(Dist > MaxBeamTargetDistSQ)
        {
            continue;            
        }
        DotAngle = PawnDir Dot Normal(Projection);
        if(((DotAngle > MinChestBeamTargetAngle) && MyKFPawn.FastTrace(P.Location, MyKFPawn.Location)) && Abs(P.Location.Z - MyKFPawn.Location.Z) < MaxChestBeamHeightOffset)
        {
            Rating = Dist * (1 - DotAngle);
            if((BestRating == -1) || Rating < BestRating)
            {
                BestRating = Rating;
                BestTarget = P;
            }
        }        
    }    
    if(BestTarget != none)
    {
        if(BestTarget != Enemy)
        {
            ChangeEnemy(BestTarget, false);
        }
        NextBeamCheckTime = 0;
        Class'AICommand_FleshpoundKing_ChestBeamAttack'.static.ChestBeamAttack(self);
    }
}

function NotifyTakeHit(Controller InstigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum)
{
    local float CurrentHealth;

    super.NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum);
    if((MyPawn != none) && (CurrentPhase + 1) < 4)
    {
        CurrentHealth = float(MyPawn.Health) / float(MyPawn.HealthMax);
        if(CurrentHealth < PhaseThresholds[CurrentPhase + 1])
        {
            TransitionToPhase(CurrentPhase + 1);
        }
    }
}

function TransitionToPhase(int NewPhase)
{
    CurrentPhase = NewPhase;
    MyPawn.CurrentPhase = NewPhase;
    MyPawn.SpawnSubWave();
    switch(NewPhase)
    {
        case 3:
            MyPawn.ActivateShield();
            break;
        default:
            break;
    }
}

function NotifySpecialMoveEnded(KFSpecialMove SM)
{
    super(KFAIController).NotifySpecialMoveEnded(SM);
    if(SM.Handle == 'KFSM_Zed_Boss_Theatrics')
    {
        TransitionToPhase(0);
    }
    if(NextBeamCheckTime < (WorldInfo.TimeSeconds + 2))
    {
        NextBeamCheckTime = (WorldInfo.TimeSeconds + 2) + FRand();
    }
}

function bool CanSwitchEnemies()
{
    return (MyKFPawn != none) && MyKFPawn.SpecialMove != 22;
}

event bool FindNewEnemy()
{
    if(!CanSwitchEnemies())
    {
        return false;
    }
    return super.FindNewEnemy();
}

event bool SetEnemy(Pawn NewEnemy)
{
    if(!CanSwitchEnemies())
    {
        return false;
    }
    return super.SetEnemy(NewEnemy);
}

event ChangeEnemy(Pawn NewEnemy, optional bool bCanTaunt)
{
    bCanTaunt = true;
    if(!CanSwitchEnemies())
    {
        return;
    }
    super(KFAIController).ChangeEnemy(NewEnemy, bCanTaunt);
}

function ForceTargetChange(Pawn NewEnemy)
{
    ChangeEnemy(NewEnemy, false);
}

state ZedVictory
{Begin:

    Sleep(0.1);
    if(MyKFPawn != none)
    {
        Class'AICommand_BossTheatrics'.static.DoTheatrics(self, 1, -1);
    }
    stop;        
}

defaultproperties
{
    BeamAttackWaitTimeRange=(X=1.5,Y=3)
    MinChestBeamTargetAngle=0.77
    MaxChestBeamHeightOffset=64
    PhaseThresholds[0]=1
    PhaseThresholds[1]=0.65
    PhaseThresholds[2]=0.5
    PhaseThresholds[3]=0.2
    ChestBeamMinPhase=2
    SpawnRagedChance=/* Array type was not detected. */
}