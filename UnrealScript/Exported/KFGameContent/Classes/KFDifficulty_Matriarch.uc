//=============================================================================
// KFDifficulty_Matriarch
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_Matriarch extends KFMonsterDifficultyInfo
	abstract;

defaultproperties
{
   Normal=(HealthMod=0.700000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.600000,SoloDamageMod=0.370000,RallySettings=(bCanRally=False))
   Hard=(HealthMod=0.900000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.750000,SoloDamageMod=0.450000,RallySettings=(bCanRally=False))
   Suicidal=(SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=1.150000,SoloDamageMod=0.400000,RallySettings=(bCanRally=False))
   HellOnEarth=(HealthMod=1.200000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=1.450000,SoloDamageMod=0.500000,RallySettings=(bCanRally=False))
   NumPlayersScale_BodyHealth=0.500000
   NumPlayersScale_BodyHealth_Versus=0.500000
   Name="Default__KFDifficulty_Matriarch"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
