/*******************************************************************************
 * KFAIController_Monster generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAIController_Monster extends KFAIController
    abstract
    native(AI)
    config(AI)
    hidecategories(Navigation);

var bool bCompletedInitialGrabAttack;
var bool bPathAroundDestructiblesICantBreak;
var bool bRepathOnInvalidStrike;
var bool bUseRunOverWarning;
var bool bEvadeOnRunOverWarning;
var float MinDistanceToPerformGrabAttack;
var float MinTimeBetweenGrabAttacks;
var float LastAttackTime_Grab;
var float MinRunOverSpeed;
var float LastRunOverWarningTime;
var float MinRunOverWarningAim;
var float RunOverEvadeDelayScale;

function InitPlayerReplicationInfo()
{
    local KFGameInfo KFGI;
    local string NPCName;

    KFGI = KFGameInfo(WorldInfo.Game);
    if((KFGI != none) && KFGI.bEnableGameAnalytics)
    {
        PlayerReplicationInfo = Spawn(Class'KFDummyReplicationInfo', self,, vect(0, 0, 0), rot(0, 0, 0));
        if(Pawn != none)
        {
            NPCName = string(Pawn.Name);
            NPCName = Repl(NPCName, "KFPawn_Zed", "", false);            
        }
        else
        {
            NPCName = string(self.Name);
            NPCName = Repl(NPCName, "KFAIController_Zed", "", false);
        }
        PlayerReplicationInfo.PlayerName = NPCName;
        if(((WorldInfo.Game != none) && KFGameInfo(WorldInfo.Game).GameplayEventsWriter != none) && KFGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress())
        {
            KFGameInfo(WorldInfo.Game).GameplayEventsWriter.LogPlayerIntEvent(1011, self, 0);
        }
    }
}

event Possess(Pawn inPawn, bool bVehicleTransition)
{
    if(KFPawn_Monster(inPawn) != none)
    {
        MyKFPawn = KFPawn_Monster(inPawn);        
    }
    else
    {
        WarnInternal(((string(GetFuncName()) $ "() attempting to possess ") $ string(inPawn)) $ ", but it's not a KFPawn_Monster class! MyKFPawn variable will not be valid.");
    }
    super.Possess(inPawn, bVehicleTransition);
    SetPawnDefaults();
}

function SetPawnDefaults()
{
    local float SprintChance, SprintDamagedChance, HiddenSpeedMod, GameDifficulty;
    local KFGameDifficultyInfo DifficultyInfo;
    local KFGameInfo KFGI;

    KFGI = KFGameInfo(WorldInfo.Game);
    GameDifficulty = KFGI.GameDifficulty;
    DifficultyInfo = KFGI.DifficultyInfo;
    SprintChance = DifficultyInfo.GetCharSprintChanceByDifficulty(MyKFPawn, GameDifficulty);
    SprintDamagedChance = DifficultyInfo.GetCharSprintWhenDamagedChanceByDifficulty(MyKFPawn, GameDifficulty);
    HiddenSpeedMod = DifficultyInfo.GetAIHiddenSpeedModifier(KFGI.GetLivingPlayerCount());
    MyKFPawn.HiddenGroundSpeed = MyKFPawn.default.HiddenGroundSpeed * HiddenSpeedMod;
    if(MyKFPawn.PawnAnimInfo != none)
    {
        MyKFPawn.PawnAnimInfo.SetDifficultyValues(DifficultyInfo);
    }
    SetCanSprint(FRand() <= SprintChance);
    SetCanSprintWhenDamaged(FRand() <= SprintDamagedChance);
    bDefaultCanSprint = bCanSprint;
    if(KFGI.BaseMutator != none)
    {
        KFGI.BaseMutator.ModifyAI(Pawn);
    }
}

function Timer_EnableMeleeRangeEventProbing()
{
    if(!MyKFPawn.IsDoingSpecialMove())
    {
        EnableMeleeRangeEventProbing();        
    }
    else
    {
        SetTimer(0.12, false, 'Timer_EnableMeleeRangeEventProbing', self);
    }
}

event ReadyToMelee()
{
    if(CanDoStrike())
    {
        UpdatePendingStrike();
        LastGetStrikeTime = WorldInfo.TimeSeconds;
        if(PendingAnimStrikeIndex != 255)
        {
            DoStrike();
            return;
        }
    }
    if(bRepathOnInvalidStrike && bFailedToMoveToEnemy || !bMovingToGoal && !bMovingToEnemy)
    {
        SetEnemyMoveGoal(self, true,,, true);        
    }
    else
    {
        if(((!CheckOverallCooldownTimer() && Enemy != none) && Pawn != none) && Pawn.IsAliveAndWell())
        {
            if(VSize(Enemy.Location - Pawn.Location) < (MyKFPawn.CylinderComponent.CollisionRadius * 3))
            {
                if(MyKFPawn.CanDoSpecialMove(12) && (WorldInfo.TimeSeconds - LastTauntTime) > 2)
                {
                    AILog_Internal(string(GetFuncName()) $ " starting taunt command", 'CantMelee');
                    Class'AICommand_TauntEnemy'.static.Taunt(self, KFPawn(Enemy), 0);
                }
            }
        }
    }
}

event Actor GeneratePathTo(Actor Goal, optional float Distance, optional bool bAllowPartialPath)
{
    local Actor PathResult;
    local int I;

    if(bDisablePartialPaths)
    {
        bAllowPartialPath = false;
    }
    AddBasePathConstraints();
    Class'Path_TowardGoal'.static.TowardGoal(Pawn, Goal);
    if(bPathAroundDestructiblesICantBreak)
    {
        Class'Path_AroundDestructibles'.static.AvoidDestructibles(Pawn, true, true);
        Class'Goal_Null'.static.GoUntilBust(Pawn, 2024);        
    }
    else
    {
        Class'Goal_AtActor'.static.AtActor(Pawn, Goal, Distance, bAllowPartialPath);
    }
    PathResult = FindPathToward(Goal);
    Pawn.ClearConstraints();
    if(PathResult == none)
    {
        AILog_Internal((((((string(GetFuncName()) $ "() failed to build a path to ") $ string(Goal)) $ ", offset distance was ") $ string(Distance)) $ ", bAllowPartialPath was ") $ string(bAllowPartialPath), 'PathWarning');
    }
    if(bShowMovePointsDebugInfo)
    {
        I = 0;
        J0x203:

        if(I < RouteCache.Length)
        {
            DrawDebugStar(RouteCache[I].Location, PathNodeShowRouteCacheCrossSize, PathNodeShowRouteCacheColor.R, PathNodeShowRouteCacheColor.G, PathNodeShowRouteCacheColor.B, true);
            DrawDebugString(RouteCache[I].Location + vect(0, 0, 5), string(I),, PathNodeShowRouteCacheColor, PathNodeShowRouteCacheNumberLabelDuration);
            if(I > 0)
            {
                DrawDebugLine(RouteCache[I].Location, RouteCache[I - 1].Location, PathNodeShowRouteCacheColor.R, PathNodeShowRouteCacheColor.G, PathNodeShowRouteCacheColor.B, true);
            }
            ++ I;
            goto J0x203;
        }
    }
    return PathResult;
}

event bool CanGrabAttack()
{
    local KFPawn_Human KFPH;
    local KFPerk EnemyPerk;
    local KFPawn KFPawnEnemy;
    local float DistSq;
    local Vector Extent, HitLocation, HitNormal;
    local Actor HitActor;

    if(((((MyKFPawn == none) || !MyKFPawn.bCanGrabAttack) || MyKFPawn.Health <= 0) || Enemy == none) || (Enemy != none) && Pawn.IsSameTeam(Enemy))
    {
        return false;
    }
    KFPawnEnemy = KFPawn(Enemy);
    if((KFPawnEnemy == none) || !KFPawnEnemy.CanBeGrabbed(MyKFPawn))
    {
        return false;
    }
    if(((MyKFPawn.bIsHeadless || MyKFPawn.Physics == 2) || IsDoingAttackSpecialMove()) || !MyKFPawn.IsCombatCapable())
    {
        return false;
    }
    KFPH = KFPawn_Human(Enemy);
    if(KFPH != none)
    {
        EnemyPerk = KFPH.GetPerk();
        if((EnemyPerk != none) && EnemyPerk.CanNotBeGrabbed())
        {
            return false;
        }
    }
    if(!bCompletedInitialGrabAttack || (LastAttackTime_Grab == 0) || (WorldInfo.TimeSeconds - LastAttackTime_Grab) > MinTimeBetweenGrabAttacks)
    {
        if(Abs(Enemy.Location.Z - Pawn.Location.Z) > Class'KFSM_GrappleCombined'.default.MaxVictimZOffset)
        {
            return false;
        }
        DistSq = VSizeSq(Enemy.Location - Pawn.Location);
        if((DistSq > (MinDistanceToPerformGrabAttack * MinDistanceToPerformGrabAttack)) || MyKFPawn.IsPawnMovingAwayFromMe(Enemy, 300))
        {
            return false;
        }
        Extent.X = Pawn.GetCollisionRadius() * 0.5;
        Extent.Y = Extent.X;
        Extent.Z = Pawn.GetCollisionHeight() * 0.5;
        HitActor = Trace(HitLocation, HitNormal, Enemy.Location, Pawn.Location, true, Extent);
        if((HitActor != none) && HitActor != Enemy)
        {
            return false;
        }
        if(!CanTargetBeGrabbed(KFPawnEnemy))
        {
            return false;
        }
        if(!MyKFPawn.IsDoingMeleeAttack() && !bCompletedInitialGrabAttack || FRand() < MyKFPawn.GrabAttackFrequency)
        {
            return true;
        }
    }
    AILog_Internal(string(GetFuncName()) $ "() returning FALSE", 'GrabAttack');
    return false;
}

function bool CanDoStrike()
{
    local Actor HitActor;
    local Vector TraceStepLocation, HitLocation, HitNormal;

    bIsBodyBlocked = false;
    TraceStepLocation = Pawn.Location + (vect(0, 0, -1) * (Pawn.CylinderComponent.CollisionHeight * 0.5));
    HitActor = Pawn.Trace(HitLocation, HitNormal, Enemy.Location, TraceStepLocation, !bCanStrikeThroughEnemies);
    if((HitActor != none) && HitActor != Enemy)
    {
        if(HitActor.bWorldGeometry)
        {
            bIsBodyBlocked = true;
        }
        HitActor = Pawn.Trace(HitLocation, HitNormal, Enemy.Location + (vect(0, 0, 1) * Enemy.BaseEyeHeight), Pawn.Location + (vect(0, 0, 1) * Pawn.BaseEyeHeight), !bCanStrikeThroughEnemies);
        if((HitActor != none) && HitActor != Enemy)
        {
            return false;
        }
    }
    return true;
}

function DoStrike()
{
    local byte StrikeFlags;

    if((MyKFPawn != none) && MyKFPawn.PawnAnimInfo != none)
    {
        StrikeFlags = MyKFPawn.PawnAnimInfo.GetStrikeFlags(PendingAnimStrikeIndex);
        if(StrikeFlags != 255)
        {
            AILog_Internal(((string(GetFuncName()) $ "() ") $ string(VSize(MyKFPawn.Location - Enemy.Location))) $ " units from enemy and I DO HAVE AN available attack!", 'Command_Attack_Melee');
            Class'AICommand_Attack_Melee'.static.Melee(self, Enemy, StrikeFlags);
            MyKFPawn.PawnAnimInfo.UpdateAttackCooldown(self, PendingAnimStrikeIndex);
            UpdatePendingStrike();            
        }
        else
        {
            AILog_Internal(((string(GetFuncName()) $ "() ") $ string(VSize(MyKFPawn.Location - Enemy.Location))) $ " units from enemy and I have no available attack!", 'Command_Attack_Melee');
        }
    }
}

function DoMeleeAttack(optional Pawn NewEnemy, optional Actor InTarget, optional byte AttackFlags);

function bool HandleZedBlockedPath()
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal;
    local KFPawn_Monster HitMonster;

    HitActor = MyKFPawn.Trace(HitLocation, HitNormal, Enemy.Location + (vect(0, 0, 1) * (Enemy.BaseEyeHeight * 0.5)), MyKFPawn.Location + (vect(0, 0, 1) * (MyKFPawn.BaseEyeHeight * 0.5)), true, MyKFPawn.GetCollisionExtent() * vect(0.2, 0.2, 0.2));
    if((HitActor == none) || HitActor == Enemy)
    {
        return false;
    }
    HitMonster = KFPawn_Monster(HitActor);
    if((HitMonster != none) && HitMonster.Health > 0)
    {
        if(((MyKFPawn == none) || MyKFPawn.Health <= 0) || MyKFPawn.IsDoingSpecialMove())
        {
            return true;
        }
        AILog_Internal(string(GetFuncName()) $ " ENEMY IS BLOCKED", 'ReachedEnemy');
        DisableMeleeRangeEventProbing();
        SetTimer(1.5 + (2 * FRand()), false, 'Timer_EnableMeleeRangeEventProbing', self);
        if(FindNewEnemy())
        {
            ForcePauseAndRepath();
            return true;
        }
        if((VSize(Enemy.Location - Pawn.Location) < AttackRange) && bDirectMoveToGoal)
        {
            if((MyKFPawn.CanDoSpecialMove(12) && FRand() < 0.32) && (WorldInfo.TimeSeconds - LastTauntTime) > 2)
            {
                AILog_Internal(string(GetFuncName()) $ " starting taunt command", 'ReachedEnemy');
                Class'AICommand_TauntEnemy'.static.Taunt(self, KFPawn(Enemy), 0);                
            }
            else
            {
                AILog_Internal(string(GetFuncName()) $ " starting pauseAI command", 'ReachedEnemy');
                DoPauseAI(1 + (3 * FRand()), true);
            }
            return true;
        }
    }
    return false;
}

event RunOverWarning(KFPawn IncomingKFP, float IncomingSpeedSquared, Vector RunOverPoint)
{
    local float Delay;

    if(bEvadeOnRunOverWarning && CanEvade(true))
    {
        Delay = (VSize(IncomingKFP.Location - MyKFPawn.Location) / Sqrt(IncomingSpeedSquared)) * RunOverEvadeDelayScale;
        DoEvade(GetBestEvadeDir(RunOverPoint,, false), IncomingKFP,, Delay, true);
    }
}

defaultproperties
{
    MinDistanceToPerformGrabAttack=188
    MinTimeBetweenGrabAttacks=5
    RunOverEvadeDelayScale=0.25
    DefaultCommandClass=Class'AICommand_Base_Zed'
    bIsPlayer=false
    SightCounterInterval=0.35
}