//=============================================================================
// KFDifficulty_Crawler
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_Crawler extends KFMonsterDifficultyInfo
	abstract;

/** Chances, by difficulty, to spawn as a special crawler */
var array<float> ChanceToSpawnAsSpecial;

static function float GetSpecialCrawlerChance( KFPawn_ZedCrawler CrawlerPawn , KFGameReplicationInfo KFGRI )
{
	if( KFGRI.bVersusGame )
	{
		if( CrawlerPawn.bVersusZed )
		{
			return 0.f;
		}

		return 0.f;
	}
	

	if( default.bForceSpecialSpawn )
		return 1.f;
	else

	return default.ChanceToSpawnAsSpecial[KFGRI.GameDifficulty];
}

defaultproperties
{
   ChanceToSpawnAsSpecial(0)=0.000000
   ChanceToSpawnAsSpecial(1)=0.010000
   ChanceToSpawnAsSpecial(2)=0.150000
   ChanceToSpawnAsSpecial(3)=0.200000
   Normal=(HealthMod=0.750000,HeadHealthMod=0.750000,EvadeOnDamageSettings=(Chance=0.100000,DamagedHealthPctToTrigger=0.010000),RallySettings=(bCanRally=False))
   Hard=(DamagedSprintChance=0.010000,DamageMod=0.750000,EvadeOnDamageSettings=(Chance=0.400000,DamagedHealthPctToTrigger=0.010000),RallySettings=(bCanRally=False))
   Suicidal=(SprintChance=0.850000,DamagedSprintChance=1.000000,MovementSpeedMod=1.300000,EvadeOnDamageSettings=(Chance=1.000000,DamagedHealthPctToTrigger=0.010000),RallySettings=(TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   HellOnEarth=(SprintChance=1.000000,DamagedSprintChance=1.000000,MovementSpeedMod=1.400000,EvadeOnDamageSettings=(Chance=1.000000,DamagedHealthPctToTrigger=0.010000),RallySettings=(bCauseSprint=True,TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   RallySettings_Versus=(bCauseSprint=True)
   RallySettings_Player_Versus=(DealtDamageModifier=1.200000)
   Name="Default__KFDifficulty_Crawler"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
