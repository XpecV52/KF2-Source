//=============================================================================
// KFGameDifficulty_Weekly
//=============================================================================
// Zed adjustments used in endless mode.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFOutbreakEvent_Endless extends KFOutbreakEvent;

function OnScoreKill(Pawn KilledPawn)
{
	local StatAdjustments ToAdjust;

	foreach ActiveEvent.ZedsToAdjust(ToAdjust)
	{
		if (ClassIsChildOf(KilledPawn.class, ToAdjust.ClassToAdjust))
		{
			if (ToAdjust.bExplosiveDeath && ToAdjust.ExplosionTemplate != none)
			{
				//Skip if we shouldn't do the normal death explosion
				if (KFPawn(KilledPawn) != none && !KFPawn(KilledPawn).WeeklyShouldExplodeOnDeath())
				{
					return;
				}

				KFGameInfo_Endless(Outer).DoDeathExplosion(KilledPawn, ToAdjust.ExplosionTemplate, ToAdjust.ExplosionIgnoreClass);
			}
		}
	}
}

function AdjustMonsterDefaults(out KFPawn_Monster P)
{
	local StatAdjustments ToAdjust;
	local array<StatAdjustments> ZedsToAdjust;

	super.AdjustMonsterDefaults(P);

	if (P == none)
	{
		return;
	}

	ZedsToAdjust = KFGameInfo_Endless(Outer).EndlessDifficulty.GetZedsToAdjust();

	foreach ZedsToAdjust(ToAdjust)
	{
		if (ClassIsChildOf(P.class, ToAdjust.ClassToAdjust))
		{
			P.Health *= ToAdjust.HealthScale;
			P.HealthMax *= ToAdjust.HealthScale;
			P.HitZones[HZI_HEAD].GoreHealth *= ToAdjust.HeadHealthScale;
			P.HitZones[HZI_HEAD].MaxGoreHealth = P.HitZones[HZI_HEAD].GoreHealth;
			P.SetShieldScale(ToAdjust.ShieldScale);
		}
	}
}

function AdjustScoreDamage(Controller InstigatedBy, Pawn DamagedPawn, class<DamageType> damageType)
{
	super.AdjustScoreDamage(InstigatedBy, DamagedPawn, damageType);

	if (ActiveEvent.bUseBeefcakeRules)
	{
		if (InstigatedBy != none)
		{
			AdjustForBeefcakeRules(InstigatedBy.Pawn);
		}

		if (DamagedPawn != none && damageType == class'KFDT_Toxic_PlayerCrawlerSuicide')
		{
			AdjustForBeefcakeRules(DamagedPawn, EBT_StalkerPoison);
		}
	}
}

static function int GetOutbreakId(int SetEventsIndex)
{
	if (SetEventsIndex < 0 || SetEventsIndex >= default.SetEvents.length)
	{
		return INDEX_NONE;
	}

	return default.SetEvents[SetEventsIndex].WeeklyOutbreakId;
}

defaultproperties
{
   SetEvents(0)=(EventDifficulty=1,GameLength=1,ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.BigPawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.BigPawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.BigPawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.BigPawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.BigPawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.BigPawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.BigPawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',bStartEnraged=True,bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.BigPawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster')),MaxBoomsPerFrame=3,WeeklyOutbreakId=0)
   SetEvents(1)=(EventDifficulty=2,GameLength=1,bScaleOnHealth=True,DeadDamageSizeScale=0.500000,WeeklyOutbreakId=2)
   SetEvents(2)=(EventDifficulty=2,GameLength=1,SpawnRateMultiplier=2.500000,GlobalAmmoCostScale=0.500000,ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',HealthScale=3.000000,HeadHealthScale=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',HealthScale=3.000000,HeadHealthScale=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',HealthScale=3.000000,HeadHealthScale=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',HealthScale=3.000000,HeadHealthScale=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthScale=1.500000,HeadHealthScale=1.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',HealthScale=3.000000,HeadHealthScale=5.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',HealthScale=3.000000,HeadHealthScale=5.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthScale=2.000000,HeadHealthScale=1.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',HealthScale=3.000000,HeadHealthScale=2.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',HealthScale=3.000000,HeadHealthScale=2.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=2.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=1.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',HealthScale=2.000000,HeadHealthScale=2.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthScale=3.000000,HeadHealthScale=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',HealthScale=3.000000,HeadHealthScale=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',HealthScale=3.000000,HeadHealthScale=2.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthScale=1.500000,HeadHealthScale=1.100000)),WaveAICountScale=(0.700000,0.700000,0.700000,0.700000,0.700000,0.700000),ZedSpawnHeadScale=2.700000,PlayerSpawnHeadScale=2.000000,bDisableHeadless=True,WeeklyOutbreakId=3)
   SetEvents(3)=(EventDifficulty=2,GameLength=1,SpawnReplacementList=((SpawnEntry=2,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',PercentChance=0.050000),(SpawnEntry=1,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',PercentChance=0.100000),(SpawnEntry=4,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',PercentChance=0.100000),(SpawnEntry=3,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',PercentChance=0.050000),(SpawnEntry=5,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',PercentChance=0.050000),(SpawnEntry=6,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpound',PercentChance=0.900000),(SpawnEntry=9,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',PercentChance=0.650000)),BossSpawnReplacementList=((NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundKing'),(SpawnEntry=1,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundKing'),(SpawnEntry=3,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundKing')),WaveAICountScale=(0.550000,0.550000,0.550000,0.550000,0.550000,0.550000),WeeklyOutbreakId=4)
   SetEvents(4)=(EventDifficulty=1,GameLength=1,ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',HeadHealthScale=1.200000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',HealthScale=2.000000,HeadHealthScale=2.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',HealthScale=2.000000,HeadHealthScale=2.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',HealthScale=2.000000,HeadHealthScale=2.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthScale=0.400000,HeadHealthScale=1.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',HealthScale=3.000000,HeadHealthScale=6.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',HealthScale=3.000000,HeadHealthScale=6.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthScale=0.350000,HeadHealthScale=2.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',HeadHealthScale=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',HealthScale=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',ShieldScale=1.250000,OverrideDeflationRate=(X=0.010000,Y=0.005000)),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=1.100000,OverrideDeflationRate=(X=0.010000,Y=0.010000)),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=0.500000,OverrideDeflationRate=(X=0.010000,Y=0.010000)),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=0.700000,OverrideDeflationRate=(X=0.010000,Y=0.010000)),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthScale=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',HealthScale=3.500000,HeadHealthScale=5.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthScale=0.700000,HeadHealthScale=0.750000)),WaveAICountScale=(0.700000,0.700000,0.700000,0.700000,0.700000,0.700000),bUseZedDamageInflation=True,ZeroHealthInflation=3.000000,InflationDeathGravity=-0.570000,InflationExplosionTimer=1.700000,WeeklyOutbreakId=5)
   SetEvents(5)=(EventDifficulty=2,GameLength=1,ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.500000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=3.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',BeefcakeScaleIncreases=(0.100000,0.500000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=4.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.200000,0.200000,0.200000,0.200000),MaxBeefcakeHealth=2.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',BeefcakeScaleIncreases=(0.050000,0.100000,0.020000,0.020000),BeefcakeHealthIncreases=(0.200000,0.200000,0.200000,0.200000),MaxBeefcake=1.250000,MaxBeefcakeHealth=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',BeefcakeScaleIncreases=(0.050000,0.100000,0.020000,0.020000),BeefcakeHealthIncreases=(0.200000,0.200000,0.200000,0.200000),MaxBeefcake=1.250000,MaxBeefcakeHealth=2.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',BeefcakeScaleIncreases=(0.050000,0.200000,0.020000,0.020000),BeefcakeHealthIncreases=(0.000000,0.000000,0.000000,0.000000),MaxBeefcake=1.250000,MaxBeefcakeHealth=1.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',BeefcakeScaleIncreases=(0.050000,0.200000,0.020000,0.020000),BeefcakeHealthIncreases=(0.000000,0.000000,0.000000,0.000000),MaxBeefcake=1.250000,MaxBeefcakeHealth=1.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',BeefcakeScaleIncreases=(0.010000,0.010000,0.010000,0.010000),BeefcakeHealthIncreases=(0.000000,0.000000,0.000000,0.000000),MaxBeefcake=1.250000,MaxBeefcakeHealth=1.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',BeefcakeScaleIncreases=(0.010000,0.010000,0.010000,0.010000),BeefcakeHealthIncreases=(0.000000,0.000000,0.000000,0.000000),MaxBeefcake=1.250000,MaxBeefcakeHealth=1.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',BeefcakeScaleIncreases=(0.010000,0.010000,0.010000,0.010000),BeefcakeHealthIncreases=(0.000000,0.000000,0.000000,0.000000),MaxBeefcake=1.250000,MaxBeefcakeHealth=1.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',BeefcakeScaleIncreases=(0.010000,0.010000,0.010000,0.010000),BeefcakeHealthIncreases=(0.000000,0.000000,0.000000,0.000000),MaxBeefcake=1.250000,MaxBeefcakeHealth=1.000000)),bUseBeefcakeRules=True,WaveAICountScale=(0.750000,0.750000,0.750000,0.750000,0.750000,0.750000),WeeklyOutbreakId=7)
   Name="Default__KFOutbreakEvent_Endless"
   ObjectArchetype=KFOutbreakEvent'KFGame.Default__KFOutbreakEvent'
}