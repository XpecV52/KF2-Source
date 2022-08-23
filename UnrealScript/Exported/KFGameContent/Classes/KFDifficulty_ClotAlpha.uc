//=============================================================================
// KFDifficulty_ClotAlpha
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_ClotAlpha extends KFMonsterDifficultyInfo
	abstract;

/** Chances, by difficulty, to spawn as a special crawler */
var array<float> ChanceToSpawnAsSpecial;

/** Chances, by difficulty, to spawn as a special gorefast */
static function float GetSpecialAlphaChance( KFGameReplicationInfo KFGRI )
{
	if( KFGRI.bVersusGame )
	{
		return 0.f;
	}
	





	return default.ChanceToSpawnAsSpecial[KFGRI.GameDifficulty];
}

defaultproperties
{
   ChanceToSpawnAsSpecial(0)=0.000000
   ChanceToSpawnAsSpecial(1)=0.000000
   ChanceToSpawnAsSpecial(2)=0.250000
   ChanceToSpawnAsSpecial(3)=0.350000
   Normal=(HealthMod=0.750000,HeadHealthMod=0.750000,RallySettings=(bCanRally=False))
   Hard=(DamagedSprintChance=0.050000,RallySettings=(bCanRally=False))
   Suicidal=(SprintChance=0.050000,DamagedSprintChance=1.000000,RallySettings=(bCauseSprint=True,TakenDamageModifier=0.500000,DealtDamageModifier=2.000000))
   HellOnEarth=(SprintChance=0.750000,DamagedSprintChance=1.000000,RallySettings=(bCauseSprint=True,TakenDamageModifier=0.500000,DealtDamageModifier=2.000000))
   RallySettings_Versus=(bCauseSprint=True)
   RallySettings_Player_Versus=(DealtDamageModifier=1.500000)
   Name="Default__KFDifficulty_ClotAlpha"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
