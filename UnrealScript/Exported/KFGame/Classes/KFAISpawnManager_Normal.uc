//=============================================================================
// KFAISpawnManager_Normal
//=============================================================================
// The KFAISpawnManager for a normal length game
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFAISpawnManager_Normal extends KFAISpawnManager;

defaultproperties
{
   DifficultyWaveSettings(0)=(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave1_Med_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave2_Med_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave3_Med_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave4_Med_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave5_Med_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave6_Med_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave7_Med_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Boss_Med_Norm'))
   DifficultyWaveSettings(1)=(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave1_Med_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave2_Med_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave3_Med_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave4_Med_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave5_Med_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave6_Med_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave7_Med_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Boss_Med_Hard'))
   DifficultyWaveSettings(2)=(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave1_Med_SUI',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave2_Med_SUI',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave3_Med_SUI',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave4_Med_SUI',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave5_Med_SUI',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave6_Med_SUI',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave7_Med_SUI',KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Boss_Med_SUI'))
   DifficultyWaveSettings(3)=(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave1_Med_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave2_Med_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave3_Med_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave4_Med_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave5_Med_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave6_Med_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave7_Med_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Boss_Med_HOE'))
   SoloWaveSpawnRateModifier(0)=(RateModifier=(1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000))
   SoloWaveSpawnRateModifier(1)=(RateModifier=(1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000))
   SoloWaveSpawnRateModifier(2)=(RateModifier=(1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000))
   SoloWaveSpawnRateModifier(3)=(RateModifier=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   EarlyWaveIndex=4
   Name="Default__KFAISpawnManager_Normal"
   ObjectArchetype=KFAISpawnManager'KFGame.Default__KFAISpawnManager'
}
