//=============================================================================
// KFGameDifficulty_Objective
//=============================================================================
// Manages difficulty based gameplay settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFGameDifficulty_Objective extends KFGameDifficultyInfo;

defaultproperties
{
   Normal=(TraderTime=75,MovementSpeedMod=0.900000,WaveCountMod=0.850000,DoshKillMod=1.200000,StartingDosh=300,AmmoPickupsMod=0.400000,ItemPickupsMod=0.450000,SelfInflictedDamageMod=0.100000,SpawnRateModifier=0.800000)
   Hard=(MovementSpeedMod=0.950000,RespawnDosh=300,AmmoPickupsMod=0.300000,ItemPickupsMod=0.350000,SelfInflictedDamageMod=0.200000,SpawnRateModifier=0.800000)
   Suicidal=(MovementSpeedMod=0.950000,WaveCountMod=1.300000,AmmoPickupsMod=0.400000,ItemPickupsMod=0.250000,MediumAttackChance=1.000000,HardAttackChance=0.500000,SelfInflictedDamageMod=0.200000,SpawnRateModifier=0.700000)
   HellOnEarth=(MovementSpeedMod=0.950000,WaveCountMod=1.700000,DoshKillMod=0.900000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.500000,SpawnRateModifier=0.680000)
   Name="Default__KFGameDifficulty_Objective"
   ObjectArchetype=KFGameDifficultyInfo'KFGame.Default__KFGameDifficultyInfo'
}
