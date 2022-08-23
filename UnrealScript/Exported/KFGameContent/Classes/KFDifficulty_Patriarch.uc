//=============================================================================
// KFDifficulty_Patriarch
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_Patriarch extends KFMonsterDifficultyInfo
	abstract;

defaultproperties
{
   Normal=(HealthMod=0.760000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.650000,SoloDamageMod=0.360000,RallySettings=(bCanRally=False))
   Hard=(HealthMod=1.010000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.800000,SoloDamageMod=0.450000,RallySettings=(bCanRally=False))
   Suicidal=(HealthMod=0.960000,HeadHealthMod=0.960000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=1.470000,SoloDamageMod=0.520000,BlockSettings=(Chance=0.850000,Duration=1.250000,MaxBlocks=5.000000,Cooldown=3.500000,DamagedHealthPctToTrigger=0.100000,MeleeDamageModifier=0.900000,DamageModifier=0.900000,AfflictionModifier=0.200000,SoloChanceMultiplier=1.000000),RallySettings=(bCanRally=False))
   HellOnEarth=(HealthMod=1.160000,HeadHealthMod=1.160000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=1.490000,SoloDamageMod=0.660000,BlockSettings=(Chance=0.850000,Duration=1.250000,MaxBlocks=6.000000,Cooldown=3.500000,DamagedHealthPctToTrigger=0.100000,MeleeDamageModifier=0.900000,DamageModifier=0.900000,AfflictionModifier=0.200000,SoloChanceMultiplier=1.000000),RallySettings=(bCanRally=False))
   NumPlayersScale_BodyHealth=0.500000
   NumPlayersScale_HeadHealth=0.300000
   NumPlayersScale_BodyHealth_Versus=0.500000
   NumPlayersScale_HeadHealth_Versus=0.300000
   Name="Default__KFDifficulty_Patriarch"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
