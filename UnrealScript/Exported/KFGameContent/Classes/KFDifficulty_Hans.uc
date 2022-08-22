//=============================================================================
// KFDifficulty_Hans
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_Hans extends KFMonsterDifficultyInfo
	abstract;

defaultproperties
{
   Normal=(HealthMod=0.940000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.550000,SoloDamageMod=0.250000,EvadeOnDamageSettings=(Chance=0.050000,DamagedHealthPctToTrigger=0.010000,ForcedEvadeChance=(FL=0.600000,FR=0.600000)),RallySettings=(bCanRally=False))
   Hard=(HealthMod=1.040000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.700000,SoloDamageMod=0.300000,EvadeOnDamageSettings=(Chance=0.100000,DamagedHealthPctToTrigger=0.010000,ForcedEvadeChance=(FL=0.600000,FR=0.600000)),RallySettings=(bCanRally=False))
   Suicidal=(HealthMod=1.100000,HeadHealthMod=1.080000,SprintChance=1.000000,DamagedSprintChance=1.100000,DamageMod=1.100000,SoloDamageMod=0.350000,EvadeOnDamageSettings=(Chance=0.200000,DamagedHealthPctToTrigger=0.010000,ForcedEvadeChance=(FL=0.600000,FR=0.600000)),BlockSettings=(Chance=0.300000,Duration=1.000000,MaxBlocks=5.000000,Cooldown=7.000000,DamagedHealthPctToTrigger=0.100000,MeleeDamageModifier=0.700000,DamageModifier=0.700000,AfflictionModifier=0.200000,SoloChanceMultiplier=1.000000),RallySettings=(bCanRally=False))
   HellOnEarth=(HealthMod=1.350000,HeadHealthMod=1.250000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=1.150000,SoloDamageMod=0.500000,EvadeOnDamageSettings=(Chance=0.200000,DamagedHealthPctToTrigger=0.010000,ForcedEvadeChance=(FL=0.600000,FR=0.600000)),BlockSettings=(Chance=0.300000,Duration=1.000000,MaxBlocks=6.000000,Cooldown=6.500000,DamagedHealthPctToTrigger=0.100000,MeleeDamageModifier=0.700000,DamageModifier=0.700000,AfflictionModifier=0.200000,SoloChanceMultiplier=1.000000),RallySettings=(bCanRally=False))
   NumPlayersScale_BodyHealth=0.750000
   NumPlayersScale_BodyHealth_Versus=0.750000
   Name="Default__KFDifficulty_Hans"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
