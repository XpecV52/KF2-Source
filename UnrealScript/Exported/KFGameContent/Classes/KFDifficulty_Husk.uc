//=============================================================================
// KFDifficulty_Husk
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_Husk extends KFMonsterDifficultyInfo
	dependsOn(KFPawn_ZedHusk)
	abstract;

/** Difficulty-based fireball settings */
var array<sHuskFireballSettings> FireballSettings;

/** Versus AI Husk fireball settings */
var sHuskFireballSettings FireballSettings_Versus;

static function sHuskFireballSettings GetFireballSettings( KFPawn_ZedHusk HuskPawn, KFGameReplicationInfo KFGRI )
{
	local sHuskFireballSettings DefaultFireballSettings;

	// Check for versus settings first
	if( KFGRI.bVersusGame )
	{
		if( !HuskPawn.bVersusZed )
		{
			return default.FireballSettings_Versus;
		}
		else
		{
			DefaultFireballSettings.bSpawnGroundFire = true;
			return DefaultFireballSettings;
		}
	}

	return default.FireballSettings[KFGRI.GameDifficulty];
}

defaultproperties
{
   FireballSettings(0)=(ExplosionMomentum=50000.000000)
   FireballSettings(1)=(ExplosionMomentum=55000.000000)
   FireballSettings(2)=(bSpawnGroundFire=True,ExplosionMomentum=60000.000000)
   FireballSettings(3)=(bSpawnGroundFire=True,ExplosionMomentum=65000.000000)
   FireballSettings_Versus=(ExplosionMomentum=50000.000000)
   Normal=(HealthMod=0.750000,HeadHealthMod=0.750000,DamageMod=0.350000,SoloDamageMod=0.350000,RallySettings=(bCanRally=False))
   Hard=(RallySettings=(bCanRally=False))
   Suicidal=(DamagedSprintChance=0.500000,SoloDamageMod=0.750000,RallySettings=(TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   HellOnEarth=(HealthMod=1.300000,HeadHealthMod=1.100000,SprintChance=0.750000,DamagedSprintChance=1.000000,DamageMod=1.500000,SoloDamageMod=0.750000,RallySettings=(bCauseSprint=True,TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   RallySettings_Versus=(bCauseSprint=True)
   RallySettings_Player_Versus=(DealtDamageModifier=1.200000)
   Name="Default__KFDifficulty_Husk"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
