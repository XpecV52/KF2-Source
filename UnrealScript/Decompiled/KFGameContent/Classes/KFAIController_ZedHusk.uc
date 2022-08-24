/*******************************************************************************
 * KFAIController_ZedHusk generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAIController_ZedHusk extends KFAIController_Monster
    config(AI)
    hidecategories(Navigation);

var bool bBaseCommandInitialized;
var bool bCanUseFlameThrower;
var const bool bDebugAimError;
var const bool bCanLeadTarget;
var float MinDistanceToSuicide;
var float RequiredHealthPercentForSuicide;
var Vector LastEnemySeenPosition;
var float LastFireBallTime;
var float LastFlameThrowerTime;
var float BaseTimeBetweenFireBalls;
var float TimeBetweenFireBalls;
var float TimeBetweenFlameThrower;
var float FireballRandomizedValue;
var int MaxDistanceForFlameThrower;
var int MinDistanceForFireBall;
var int MaxDistanceForFireBall;
var float LastCheckSpecialMoveTime;
var float CheckSpecialMoveTime;
var name FireballSocketName;
var const float FireballAimError;
var const float FireballLeadTargetAimError;
var const float FireballSpeed;
var const float SplashAimChanceNormal;
var const float SplashAimChanceHard;
var const float SplashAimChanceSuicidal;
var const float SplashAimChanceHellOnEarth;
var const float FireballFireIntervalNormal;
var const float FireballFireIntervalHard;
var const float FireballFireIntervalSuicidal;
var const float FireballFireIntervalHellOnEarth;
var const float LowIntensityAttackScaleOfFireballInterval;

function bool IsNearDoor()
{
    return false;
}

event Possess(Pawn inPawn, bool bVehicleTransition)
{
    super.Possess(inPawn, bVehicleTransition);
}

event PostBeginPlay()
{
    local KFGameInfo KFGI;

    super(KFAIController).PostBeginPlay();
    if(WorldInfo.Game != none)
    {
        KFGI = KFGameInfo(WorldInfo.Game);
        if((KFGI != none) && KFGI.GameDifficulty >= KFGI.DifficultyInfo.GetDifficultyValue(2))
        {
            bCanUseFlameThrower = true;
        }
    }
    if(Skill == Class'KFGameDifficultyInfo'.static.GetDifficultyValue(0))
    {
        BaseTimeBetweenFireBalls = FireballFireIntervalNormal;        
    }
    else
    {
        if(Skill <= Class'KFGameDifficultyInfo'.static.GetDifficultyValue(1))
        {
            BaseTimeBetweenFireBalls = FireballFireIntervalHard;            
        }
        else
        {
            if(Skill <= Class'KFGameDifficultyInfo'.static.GetDifficultyValue(2))
            {
                BaseTimeBetweenFireBalls = FireballFireIntervalSuicidal;                
            }
            else
            {
                BaseTimeBetweenFireBalls = FireballFireIntervalHellOnEarth;
            }
        }
    }
    LowIntensityAttackCooldown = BaseTimeBetweenFireBalls * LowIntensityAttackScaleOfFireballInterval;
    TimeBetweenFireBalls = BaseTimeBetweenFireBalls + RandRange(-FireballRandomizedValue, FireballRandomizedValue);
}

simulated function Tick(float DeltaTime)
{
    local float DistToTargetSq;

    super(KFAIController).Tick(DeltaTime);
    if(((Role == ROLE_Authority) && Enemy != none) && MyKFPawn != none)
    {
        if(((WorldInfo.TimeSeconds - LastCheckSpecialMoveTime) >= CheckSpecialMoveTime) && !MyKFPawn.IsDoingSpecialMove())
        {
            if((GetActiveCommand() != none) && !GetActiveCommand().IsA('AICommand_SpecialMove'))
            {
                if(WorldInfo.FastTrace(Enemy.Location, Pawn.Location,, true))
                {
                    DistToTargetSq = VSizeSq(Enemy.Location - Pawn.Location);
                    if(IsSuicidal())
                    {
                        if(CanDoSuicide(DistToTargetSq))
                        {
                            Class'AICommand_Husk_Suicide'.static.Suicide(self);
                        }                        
                    }
                    else
                    {
                        if(CanDoFlamethrower(DistToTargetSq))
                        {
                            if((KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).GameConductor != none)
                            {
                                KFGameInfo(WorldInfo.Game).GameConductor.UpdateOverallAttackCoolDowns(self);
                            }
                            Class'AICommand_HuskFlameThrowerAttack'.static.FlameThrowerAttack(self);                            
                        }
                        else
                        {
                            if(CanDoFireball(DistToTargetSq))
                            {
                                if((KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).GameConductor != none)
                                {
                                    KFGameInfo(WorldInfo.Game).GameConductor.UpdateOverallAttackCoolDowns(self);
                                }
                                Class'AICommand_HuskFireBallAttack'.static.FireBallAttack(self);
                                TimeBetweenFireBalls = BaseTimeBetweenFireBalls + RandRange(-FireballRandomizedValue, FireballRandomizedValue);
                            }
                        }
                    }
                }
            }
            LastCheckSpecialMoveTime = WorldInfo.TimeSeconds;
        }
    }
}

function bool IsSuicidal()
{
    if((MyKFPawn == none) || MyKFPawn.bIsHeadless)
    {
        return false;
    }
    return GetHealthPercentage() <= RequiredHealthPercentForSuicide;
}

function bool CanDoSuicide(float DistToTargetSq)
{
    if((DistToTargetSq <= (MinDistanceToSuicide * MinDistanceToSuicide)) && MyKFPawn.CanDoSpecialMove(23))
    {
        return true;
    }
    return false;
}

function bool CanDoFlamethrower(float DistToTargetSq)
{
    if(!CheckOverallCooldownTimer())
    {
        return false;
    }
    if(((bCanUseFlameThrower && (LastFlameThrowerTime == float(0)) || (WorldInfo.TimeSeconds - LastFlameThrowerTime) > TimeBetweenFlameThrower) && DistToTargetSq <= float(MaxDistanceForFlameThrower * MaxDistanceForFlameThrower)) && MyKFPawn.CanDoSpecialMove(22))
    {
        return true;
    }
    return false;
}

function bool CanDoFireball(float DistToTargetSq)
{
    if(!CheckOverallCooldownTimer())
    {
        return false;
    }
    return ((((LastFireBallTime == float(0)) || (WorldInfo.TimeSeconds - LastFireBallTime) > TimeBetweenFireBalls) && DistToTargetSq >= Square(float(MinDistanceForFireBall))) && DistToTargetSq <= Square(float(MaxDistanceForFireBall))) && MyKFPawn.CanDoSpecialMove(21);
}

event bool SetEnemy(Pawn NewEnemy)
{
    if((MyKFPawn == none) || MyKFPawn.IsDoingSpecialMove(21))
    {
        if(MyKFPawn.NeedToTurn(NewEnemy.Location))
        {
            if(!Class'Engine'.static.GetEngine().bDisableAILogging)
            {
                AILog_Internal(((((string(GetFuncName()) $ "() rejecting ") $ string(NewEnemy)) $ " because current enemy (") $ string(Enemy)) $ ") we would need to turn to see it", 'SetEnemy');
            }
            return false;
        }
    }
    return super(KFAIController).SetEnemy(NewEnemy);
}

function bool ShouldSprint()
{
    if(IsSuicidal())
    {
        return true;
    }
    return super(KFAIController).ShouldSprint();
}

function DoStrike()
{
    if(MyKFPawn.PawnAnimInfo.Attacks[PendingAnimStrikeIndex].Tag == 'Projectile')
    {
        if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
        {
            KFGameInfo(WorldInfo.Game).DialogManager.PlaySpotRocketsDialog(MyKFPawn);
        }
    }
    super.DoStrike();
}

function ShootFireball(class<KFProj_Husk_Fireball> FireballClass, Vector FireballOffset)
{
    local Vector SocketLocation, DirToEnemy, HitLocation, HitNormal;
    local KFProj_Husk_Fireball MyFireball;
    local Actor HitActor;
    local Vector AimLocation, GroundAimLocation;
    local float SplashAimChance;
    local Vector randVectorDraw;
    local float randDraw;
    local Vector displacementToHitLoc;
    local float distanceToHitLoc;
    local KFPawn_ZedHusk MyHuskPawn;

    if(MyKFPawn == none)
    {
        return;
    }
    if(bDebugAimError)
    {
        DebugAimError();
        return;
    }
    SocketLocation = MyKFPawn.GetPawnViewLocation() + (FireballOffset >> Pawn.GetViewRotation());
    if(((float(MyKFPawn.Health) > 0) && Role == ROLE_Authority) && MyKFPawn.IsDoingSpecialMove(21))
    {
        AimLocation = Enemy.Location;
        if(Skill == Class'KFGameDifficultyInfo'.static.GetDifficultyValue(0))
        {
            SplashAimChance = SplashAimChanceNormal;            
        }
        else
        {
            if(Skill <= Class'KFGameDifficultyInfo'.static.GetDifficultyValue(1))
            {
                SplashAimChance = SplashAimChanceHard;                
            }
            else
            {
                if(Skill <= Class'KFGameDifficultyInfo'.static.GetDifficultyValue(2))
                {
                    SplashAimChance = SplashAimChanceSuicidal;                    
                }
                else
                {
                    SplashAimChance = SplashAimChanceHellOnEarth;
                }
            }
        }
        randDraw = FRand();
        if(!Class'Engine'.static.GetEngine().bDisableAILogging && self != none)
        {
            self.AILog_Internal((((string(GetFuncName()) @ " SplashAimChance: ") @ string(SplashAimChance)) @ " randDraw: ") @ string(randDraw), 'FireBall');
        }
        if(randDraw < SplashAimChance)
        {
            GroundAimLocation = Enemy.Location - (vect(0, 0, 1) * Enemy.GetCollisionHeight());
            if(GroundAimLocation.Z < SocketLocation.Z)
            {
                AimLocation = GroundAimLocation;
            }
        }
        HitActor = WorldInfo.Trace(HitLocation, HitNormal, AimLocation, SocketLocation, true);
        if(HitActor == Enemy)
        {
            randVectorDraw = VRand();
            if(!bCanLeadTarget)
            {
                DirToEnemy = Normal(AimLocation - SocketLocation) + (randVectorDraw * FireballAimError);
                if(!Class'Engine'.static.GetEngine().bDisableAILogging && self != none)
                {
                    self.AILog_Internal((((((((string(GetFuncName()) @ " HitActor: ") @ string(HitActor)) @ " Is My Enemy: ") @ string(Enemy)) @ " randVectorDraw: ") @ string(randVectorDraw)) @ " - not leading with an error of: ") @ string(randVectorDraw * FireballAimError), 'FireBall');
                }                
            }
            else
            {
                DirToEnemy = Normal((CalcAimLocToHit(AimLocation, SocketLocation, FireballSpeed, FireballSpeed, Enemy.Velocity)) - SocketLocation) + (randVectorDraw * FireballLeadTargetAimError);
                if(!Class'Engine'.static.GetEngine().bDisableAILogging && self != none)
                {
                    self.AILog_Internal((((((((string(GetFuncName()) @ " HitActor: ") @ string(HitActor)) @ " Is My Enemy: ") @ string(Enemy)) @ " randVectorDraw: ") @ string(randVectorDraw)) @ " - leading with an error of: ") @ string(randVectorDraw * FireballLeadTargetAimError), 'FireBall');
                }
            }            
        }
        else
        {
            AimLocation = AICommand_HuskFireBallAttack(GetActiveCommand()).LastKnownEnemyLocation;
            HitActor = Trace(HitLocation, HitNormal, AimLocation, SocketLocation, true);
            displacementToHitLoc = HitLocation - SocketLocation;
            distanceToHitLoc = VSize(displacementToHitLoc);
            if(distanceToHitLoc < float(300))
            {
                if(!Class'Engine'.static.GetEngine().bDisableAILogging && self != none)
                {
                    self.AILog_Internal(((((((string(GetFuncName()) @ " HitActor: ") @ string(HitActor)) @ " Is NOT My Enemy: ") @ string(Enemy)) @ " and distanceToHitLoc: ") @ string(distanceToHitLoc)) @ " is too close so not firing!!!", 'FireBall');
                }
                MyKFPawn.SpecialMoves[21].AbortedByAICommand();
                LastFireBallTime = WorldInfo.TimeSeconds;
                return;                
            }
            else
            {
                randVectorDraw = VRand();
                DirToEnemy = Normal((AimLocation - SocketLocation) + (randVectorDraw * FireballAimError));
                if(!Class'Engine'.static.GetEngine().bDisableAILogging && self != none)
                {
                    self.AILog_Internal(((((((string(GetFuncName()) @ " Fire at enemy last known position: ") @ string(Enemy)) @ string(AimLocation)) @ " randVectorDraw: ") @ string(randVectorDraw)) @ " - leading with an error of: ") @ string(randVectorDraw * FireballLeadTargetAimError), 'FireBall');
                }
            }
        }
        MyHuskPawn = KFPawn_ZedHusk(MyKFPawn);
        MyFireball = Spawn(FireballClass, MyKFPawn,, SocketLocation, rotator(DirToEnemy));
        MyFireball.Instigator = MyKFPawn;
        MyFireball.InstigatorController = self;
        MyFireball.Speed = FireballSpeed;
        MyFireball.MaxSpeed = FireballSpeed;
        MyFireball.ExplosionTemplate.MomentumTransferScale = MyHuskPawn.FireballSettings.ExplosionMomentum;
        MyFireball.bSpawnGroundFire = MyHuskPawn.FireballSettings.bSpawnGroundFire;
        MyFireball.Init(DirToEnemy);
        LastFireBallTime = WorldInfo.TimeSeconds;
    }
}

function DebugAimError()
{
    local int I;
    local KFDebugLines KFDL;
    local Vector SocketLocation, DirToEnemy;
    local Rotator SocketRotation;

    KFDL = Class'KFDebugLines'.static.GetDebugLines();
    if(KFDL == none)
    {
        msg("You need to turn KFDebugLines on (bEnableAdvDebugLines in KFGame.ini) to do this.");
        return;
    }
    MyKFPawn.Mesh.GetSocketWorldLocationAndRotation(FireballSocketName, SocketLocation, SocketRotation);
    KFDL.AddDebugLine(SocketLocation, SocketLocation + (Normal(Enemy.Location - SocketLocation) * 3024), 0, 255, 0, true);
    I = 0;
    J0x167:

    if(I < 7)
    {
        DirToEnemy = Normal(Enemy.Location - SocketLocation) + (VRand() * FireballAimError);
        KFDL.AddDebugLine(SocketLocation, SocketLocation + (DirToEnemy * 3024), 255, 0, 0, true);
        ++ I;
        goto J0x167;
    }
    msg("GAME PAUSED, UNPAUSE TO CONTINUE");
    DebugFreezeGame();
}

defaultproperties
{
    MinDistanceToSuicide=280
    RequiredHealthPercentForSuicide=0.15
    TimeBetweenFlameThrower=5
    FireballRandomizedValue=1
    MaxDistanceForFlameThrower=500
    MinDistanceForFireBall=300
    MaxDistanceForFireBall=4000
    CheckSpecialMoveTime=0.25
    FireballSocketName=FireballSocket
    FireballAimError=0.03
    FireballLeadTargetAimError=0.03
    FireballSpeed=3600
    SplashAimChanceNormal=0.25
    SplashAimChanceHard=0.35
    SplashAimChanceSuicidal=0.5
    SplashAimChanceHellOnEarth=0.75
    FireballFireIntervalNormal=5
    FireballFireIntervalHard=4.5
    FireballFireIntervalSuicidal=4
    FireballFireIntervalHellOnEarth=3.5
    LowIntensityAttackScaleOfFireballInterval=1.25
    bCanTeleportCloser=false
    bUseDesiredRotationForMelee=false
    EvadeGrenadeChance=0.9
    BaseShapeOfProjectileForCalc=(X=10,Y=10,Z=10)
}