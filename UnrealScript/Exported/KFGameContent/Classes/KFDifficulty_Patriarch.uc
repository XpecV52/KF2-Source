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
   Normal=(SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.650000,SoloDamageMod=0.200000,RallySettings=(bCanRally=False))
   Hard=(HealthMod=1.370000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.800000,SoloDamageMod=0.250000,RallySettings=(bCanRally=False))
   Suicidal=(HealthMod=1.400000,HeadHealthMod=1.350000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=1.400000,SoloDamageMod=0.350000,BlockSettings=(Chance=0.850000,Duration=1.250000,MaxBlocks=5.000000,Cooldown=3.500000,DamagedHealthPctToTrigger=0.100000,MeleeDamageModifier=0.900000,DamageModifier=0.900000,AfflictionModifier=0.200000,SoloChanceMultiplier=1.000000),RallySettings=(bCanRally=False))
   HellOnEarth=(HealthMod=1.550000,HeadHealthMod=1.550000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=1.230000,SoloDamageMod=0.500000,BlockSettings=(Chance=0.850000,Duration=1.250000,MaxBlocks=6.000000,Cooldown=3.500000,DamagedHealthPctToTrigger=0.100000,MeleeDamageModifier=0.900000,DamageModifier=0.900000,AfflictionModifier=0.200000,SoloChanceMultiplier=1.000000),RallySettings=(bCanRally=False))
   NumPlayersScale_BodyHealth=0.500000
   NumPlayersScale_HeadHealth=0.300000
   NumPlayersScale_BodyHealth_Versus=0.500000
   NumPlayersScale_HeadHealth_Versus=0.300000
   Name="Default__KFDifficulty_Patriarch"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
