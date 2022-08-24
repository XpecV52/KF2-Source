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
   Normal=(HealthMod=0.750000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.670000,SoloDamageMod=0.350000,RallySettings=(bCanRally=False))
   Hard=(SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.810000,SoloDamageMod=0.420000,RallySettings=(bCanRally=False))
   Suicidal=(HealthMod=1.130000,HeadHealthMod=1.130000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=1.470000,SoloDamageMod=0.410000,BlockSettings=(Chance=0.850000,Duration=1.250000,MaxBlocks=5.000000,Cooldown=3.500000,DamagedHealthPctToTrigger=0.100000,MeleeDamageModifier=0.900000,DamageModifier=0.900000,AfflictionModifier=0.200000,SoloChanceMultiplier=1.000000),RallySettings=(bCanRally=False))
   HellOnEarth=(HealthMod=1.390000,HeadHealthMod=1.390000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=1.450000,SoloDamageMod=0.520000,BlockSettings=(Chance=0.850000,Duration=1.250000,MaxBlocks=6.000000,Cooldown=3.500000,DamagedHealthPctToTrigger=0.100000,MeleeDamageModifier=0.900000,DamageModifier=0.900000,AfflictionModifier=0.200000,SoloChanceMultiplier=1.000000),RallySettings=(bCanRally=False))
   NumPlayersScale_BodyHealth=0.500000
   NumPlayersScale_HeadHealth=0.300000
   NumPlayersScale_BodyHealth_Versus=0.500000
   NumPlayersScale_HeadHealth_Versus=0.300000
   Name="Default__KFDifficulty_Patriarch"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
