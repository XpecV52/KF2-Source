//=============================================================================
// KFAIController_ZedDAR
//=============================================================================
// Base AI controller for evil DAR robots.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFAIController_ZedDAR extends KFAIController_Ranged
	abstract;

var float MinRangeAttackDist;
var float MaxRangeAttackDist;
var float LastRangeAttackTime;
var float TimeBetweenRangeAttacks;
var float BaseTimeBetweenRangeAttacks;
var float TimeBetweenRangeAttackVariance;
var float CheckSpecialMoveTime;
var float LastCheckSpecialMoveTime;

var name FiringSocketName;

var protected float RangeAttackIntervalNormal;
var protected float RangeAttackIntervalHard;
var protected float RangeAttackIntervalSuicidal;
var protected float RangeAttackIntervalHellOnEarth;

var float HeadLossAttackTimeDebuff;
var float HeadLossAccuracyDebuffPct;

var float AimError;

var bool bAllowedToSprint;
var bool bCanEvade;

var int ArmorLossStumblePower;

event PostBeginPlay()
{
	Super.PostBeginPlay();

	BaseTimeBetweenRangeAttacks = GetAttackIntervalByDifficulty();

	TimeBetweenRangeAttacks = BaseTimeBetweenRangeAttacks;
	if(TimeBetweenRangeAttackVariance > 0)
	{
		TimeBetweenRangeAttacks += RandRange(-TimeBetweenRangeAttackVariance, TimeBetweenRangeAttackVariance);
	}
}

function float GetAttackIntervalByDifficulty()
{
	if (Skill == class'KFGameDifficultyInfo'.static.GetDifficultyValue(0)) // Normal
	{
		return RangeAttackIntervalNormal;
	}
	else if (Skill <= class'KFGameDifficultyInfo'.static.GetDifficultyValue(1)) // Hard
	{
		return RangeAttackIntervalHard;
	}
	else if (Skill <= class'KFGameDifficultyInfo'.static.GetDifficultyValue(2)) // Suicidal
	{
		return RangeAttackIntervalSuicidal;
	}
	else if (Skill <= class'KFGameDifficultyInfo'.static.GetDifficultyValue(3)) // Hell on Earth
	{
		return RangeAttackIntervalHellOnEarth;
	}

	return RangeAttackIntervalNormal;
}

function bool CanDoRangedAttack(float DistanceToTargetSqr)
{
	if (!CheckOverallCooldownTimer())
	{
		return false;
	}

	return ((LastRangeAttackTime == 0 || ((WorldInfo.TimeSeconds - LastRangeAttackTime) > TimeBetweenRangeAttacks)) &&
		DistanceToTargetSqr >= Square(MinRangeAttackDist) &&
		DistanceToTargetSqr <= Square(MaxRangeAttackDist) &&
		MyKFPawn.CanDoSpecialMove(SM_StandAndShootAttack));
}

simulated function Tick(float DeltaTime)
{
	local float DistToTargetSqr;

	Super.Tick(DeltaTime);

	if (Role == ROLE_Authority && Enemy != none && MyKFPawn != none)
	{
		if ((WorldInfo.TimeSeconds - LastCheckSpecialMoveTime) >= CheckSpecialMoveTime && !MyKFPawn.IsDoingSpecialMove() )
		{
			if (GetActiveCommand() != none && !GetActiveCommand().IsA('AICommand_SpecialMove'))
			{
				// Trace from worldinfo, open doors ignore traces from zeds
				if (WorldInfo.FastTrace(Enemy.Location, Pawn.Location, , true))
				{
					DistToTargetSqr = VSizeSq(Enemy.Location - Pawn.Location);
					if (CanDoRangedAttack(DistToTargetSqr))
					{
						if (KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).GameConductor != none)
						{
							KFGameInfo(WorldInfo.Game).GameConductor.UpdateOverallAttackCoolDowns(self);
						}

						StartRangedAttack();
						if(TimeBetweenRangeAttackVariance > 0)
						{
							TimeBetweenRangeAttacks = BaseTimeBetweenRangeAttacks + RandRange(-TimeBetweenRangeAttackVariance, TimeBetweenRangeAttackVariance);
						}
					}
				}
			}
			LastCheckSpecialMoveTime = WorldInfo.TimeSeconds;
		}

		if (MyKFPawn.IsDoingSpecialMove(SM_StandAndShootAttack))
		{
			Focus = none;
			SetFocalPoint(Enemy.Location);
		}
		else if (Focus == none)
		{
			Focus = Enemy;
		}
	}
}

event bool SetEnemy(Pawn NewEnemy)
{
	if (MyKFPawn == none || MyKFPawn.IsDoingSpecialMove(SM_StandAndShootAttack))
	{
		if (MyKFPawn.NeedToTurn(NewEnemy.Location))
		{
			if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal(GetFuncName() $ "() rejecting " $ NewEnemy $ " because current enemy (" $ Enemy $ ") we would need to turn to see it",'SetEnemy',);};
			return false;
		}
	}

	return super.SetEnemy(NewEnemy);
}

function StartRangedAttack();

function FireRangedAttack(class<KFProjectile> RangedProjectileClass, vector ProjectileOffset)
{
	local vector SocketLocation, DirToEnemy, HitLocation, HitNormal;
	local KFProjectile SpawnedProjectile;
	local actor	HitActor;
	local Vector AimLocation, AimDispalcement;
	local vector displacementToHitLoc;
	local float distanceToHitLoc;

	if (MyKFPawn == none)
	{
		return;
	}

	if (bDebugAimError)
	{
		// Render debug lines and simulate several shots at once to evaluate aimerror
		DebugAimError(FiringSocketName);
		return;
	}

	SocketLocation = GetStartFireLocation() + (ProjectileOffset >> Pawn.GetViewRotation());
	if (MyKFPawn.Health > 0.f && Role == ROLE_Authority && MyKFPawn.IsDoingSpecialMove(SM_StandAndShootAttack))
	{
		AimLocation = Enemy.Location;
		HitActor = WorldInfo.Trace(HitLocation, HitNormal, AimLocation, SocketLocation, true);

		// Don't shoot if it's too close
		if (HitActor == Enemy)
		{
			if (!bCanLeadTarget)
			{
				DirToEnemy = normal(AimLocation - SocketLocation);

				if( !class'Engine'.static.GetEngine().bDIsableAILogging && self!= None ) { self.AILog_Internal(GetFuncName() @ "Leading - HitActor: " @ HitActor @ " Is My Enemy: " @ Enemy,'FireBall'); };
			}
			else
			{
				DirToEnemy = normal(CalcAimLocToHit(AimLocation, SocketLocation, RangedProjectileClass.default.Speed, RangedProjectileClass.default.Speed, Enemy.Velocity) - SocketLocation);

				if( !class'Engine'.static.GetEngine().bDIsableAILogging && self!= None ) { self.AILog_Internal(GetFuncName() @ "Not Leading - HitActor: " @ HitActor @ " Is My Enemy: " @ Enemy,'FireBall'); };
			}
		}
		else
		{
			// If our path to the enemy is blocked, try his last known position
			AimLocation = AICommand_RangedAttack(GetActiveCommand()).LastKnownEnemyLocation;
			HitActor = Trace(HitLocation, HitNormal, AimLocation, SocketLocation, true);

			displacementToHitLoc = HitLocation - SocketLocation;
			distanceToHitLoc = VSize(displacementToHitLoc);

			// If there is an object in front of us, cancel the attack
			if (distanceToHitLoc < MinRangeAttackDist)
			{
				if( !class'Engine'.static.GetEngine().bDIsableAILogging && self!= None ) { self.AILog_Internal(GetFuncName() @ "- HitActor: " @ HitActor @ " Is NOT My Enemy: " @ Enemy @ " and distanceToHitLoc: " @ distanceToHitLoc @ " is too close so not firing!!!",'FireBall'); };
				MyKFPawn.SpecialMoves[SM_StandAndShootAttack].AbortedByAICommand();
				LastRangeAttackTime = WorldInfo.TimeSeconds;
				return;
			}
			else // Otherwise fire at the enemies last known position
			{
				DirToEnemy = normal((AimLocation - SocketLocation));

				if( !class'Engine'.static.GetEngine().bDIsableAILogging && self!= None ) { self.AILog_Internal(GetFuncName() @ "- Fire at enemy last known position : " @ Enemy @ AimLocation,'FireBall'); };
			}
		}

		AimDispalcement = VRand();
		DirToEnemy += (AimDispalcement * AimError);

		// Shoot the fireball
		SpawnedProjectile = Spawn(RangedProjectileClass, MyKFPawn, , SocketLocation, Rotator(DirToEnemy));
		SpawnedProjectile.Instigator = MyKFPawn;
		SpawnedProjectile.InstigatorController = self;

		// Fire
		SpawnedProjectile.Init(DirToEnemy);

		LastRangeAttackTime = WorldInfo.TimeSeconds;
	}
}

function vector GetStartFireLocation()
{
	return MyKFPawn.GetPawnViewLocation();
}

function bool ShouldSprint()
{
	return bAllowedToSprint && super.ShouldSprint();
}

function bool CanEvade(optional bool bOverrideSpecialMove)
{
	return bCanEvade && super.CanEvade(bOverrideSpecialMove);
}

function OnArmorLoss(name ArmorName)
{
	MyKFPawn.AfflictionHandler.AccrueAffliction(AF_Stumble, ArmorLossStumblePower);

	if(ArmorName == 'head')
	{
		BaseTimeBetweenRangeAttacks += HeadLossAttackTimeDebuff;
		AimError *= (1.f + HeadLossAccuracyDebuffPct);
	}
	else if (ArmorName == 'front')
	{
		bCanSprint = false;
		bAllowedToSprint = false;
		bCanEvade = false;
		MyKFPawn.bIsSprinting = false;
	}
}

defaultproperties
{
   MinRangeAttackDist=300.000000
   MaxRangeAttackDist=4000.000000
   TimeBetweenRangeAttackVariance=1.000000
   CheckSpecialMoveTime=0.250000
   RangeAttackIntervalNormal=7.000000
   RangeAttackIntervalHard=6.000000
   RangeAttackIntervalSuicidal=5.000000
   RangeAttackIntervalHellOnEarth=4.000000
   HeadLossAttackTimeDebuff=2.000000
   HeadLossAccuracyDebuffPct=2.000000
   AimError=0.030000
   bAllowedToSprint=True
   bCanEvade=True
   ArmorLossStumblePower=100
   bCanTeleportCloser=False
   bUseDesiredRotationForMelee=False
   SprintWithinEnemyRange=(X=800.000000,Y=1500.000000)
   EvadeGrenadeChance=0.900000
   BaseShapeOfProjectileForCalc=(X=10.000000,Y=10.000000,Z=10.000000)
   DangerEvadeSettings(0)=(ClassName="KFProj_Bullet_Pellet",Cooldowns=(3.000000,2.000000,1.000000,0.750000),EvadeChances=(0.100000,0.300000,0.500000,0.700000),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.000000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(1)=(ClassName="KFProj_Nail_Nailgun",Cooldowns=(3.000000,2.000000,1.000000,0.750000),EvadeChances=(0.100000,0.300000,0.500000,0.700000),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.000000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(2)=(ClassName="KFProj_Bullet_DragonsBreath",Cooldowns=(3.000000,2.000000,1.000000,0.750000),EvadeChances=(0.100000,0.300000,0.500000,0.700000),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.000000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(3)=(ClassName="KFProj_HighExplosive_M79",Cooldowns=(3.000000,2.000000,1.000000,0.750000),EvadeChances=(0.100000,0.300000,0.500000,0.700000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(4)=(ClassName="KFProj_Rocket_RPG7",Cooldowns=(3.000000,2.000000,1.000000,0.750000),EvadeChances=(0.100000,0.300000,0.500000,0.700000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(5)=(ClassName="KFDT_Explosive_M16M203",Cooldowns=(3.000000,2.000000,1.000000,0.750000),EvadeChances=(0.100000,0.300000,0.500000,0.700000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(6)=(ClassName="KFProj_CaulkNBurn_GroundFire",Cooldowns=(3.000000,2.000000,1.500000,1.000000),EvadeChances=(0.100000,0.300000,0.500000,0.700000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(7)=(ClassName="KFProj_FlameThrower_GroundFire",Cooldowns=(3.000000,2.000000,1.500000,1.000000),EvadeChances=(0.400000,0.500000,0.600000,0.700000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(8)=(ClassName="KFWeap_Flame_CaulkBurn",Cooldowns=(3.000000,2.000000,1.500000,1.000000),EvadeChances=(0.400000,0.500000,0.600000,0.700000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(9)=(ClassName="KFWeap_Flame_Flamethrower",Cooldowns=(3.000000,2.000000,1.500000,1.000000),EvadeChances=(0.400000,0.500000,0.600000,0.700000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(10)=(ClassName="KFWeap_Beam_Microwave",Cooldowns=(3.000000,2.000000,1.500000,1.000000),EvadeChances=(0.400000,0.500000,0.600000,0.700000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(11)=(ClassName="KFWeap_Bow_Crossbow",Cooldowns=(2.300000,2.300000,2.300000,1.300000),EvadeChances=(0.080000,0.100000,0.200000,0.350000),ForcedEvadeChances=((FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.150000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.150000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(12)=(ClassName="KFWeap_Rifle_M14EBR",Cooldowns=(2.300000,2.300000,2.300000,1.300000),EvadeChances=(0.080000,0.100000,0.200000,0.350000),ForcedEvadeChances=((FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.150000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.150000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(13)=(ClassName="KFWeap_Rifle_Winchester1894",Cooldowns=(2.300000,2.300000,2.300000,1.300000),EvadeChances=(0.080000,0.100000,0.200000,0.350000),ForcedEvadeChances=((FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.150000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.150000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(14)=(ClassName="KFWeap_Rifle_RailGun",Cooldowns=(2.300000,2.300000,2.300000,1.300000),EvadeChances=(0.080000,0.100000,0.200000,0.350000),ForcedEvadeChances=((FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.150000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.150000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(15)=(ClassName="KFProj_FragGrenade",Cooldowns=(3.000000,2.000000,1.000000,0.750000),EvadeChances=(0.100000,0.200000,0.500000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(16)=(ClassName="KFProj_MolotovGrenade",Cooldowns=(3.000000,2.000000,1.000000,0.750000),EvadeChances=(0.100000,0.200000,0.500000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(17)=(ClassName="KFProj_DynamiteGrenade",Cooldowns=(3.000000,2.000000,1.000000,0.750000),EvadeChances=(0.100000,0.200000,0.500000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(18)=(ClassName="KFProj_NailBombGrenade",Cooldowns=(3.000000,2.000000,1.000000,0.750000),EvadeChances=(0.100000,0.200000,0.500000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(19)=(ClassName="KFProj_HEGrenade",Cooldowns=(3.000000,2.000000,1.000000,0.750000),EvadeChances=(0.100000,0.200000,0.500000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   Name="Default__KFAIController_ZedDAR"
   ObjectArchetype=KFAIController_Ranged'kfgamecontent.Default__KFAIController_Ranged'
}
