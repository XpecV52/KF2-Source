//=============================================================================
// KFAISpawnManager_Long
//=============================================================================
// The KFAISpawnManager for a long length game
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFAISpawnManager_Long extends KFAISpawnManager;

defaultproperties
{
   DifficultyWaveSettings(0)=(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave1_Long_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave2_Long_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave3_Long_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave4_Long_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave5_Long_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave6_Long_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave7_Long_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave8_Long_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave9_Long_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave10_Long_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Boss_Long_Norm'))
   DifficultyWaveSettings(1)=(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave1_Long_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave2_Long_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave3_Long_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave4_Long_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave5_Long_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave6_Long_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave7_Long_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave8_Long_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave9_Long_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave10_Long_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Boss_Long_Hard'))
   DifficultyWaveSettings(2)=(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave1_Long_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave2_Long_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave3_Long_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave4_Long_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave5_Long_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave6_Long_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave7_Long_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave8_Long_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave9_Long_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave10_Long_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Boss_Long_Sui'))
   DifficultyWaveSettings(3)=(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave1_Long_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave2_Long_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave3_Long_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave4_Long_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave5_Long_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave6_Long_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave7_Long_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave8_Long_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave9_Long_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave10_Long_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Boss_Long_HOE'))
   SoloWaveSpawnRateModifier(0)=(RateModifier=(1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000))
   SoloWaveSpawnRateModifier(1)=(RateModifier=(1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000))
   SoloWaveSpawnRateModifier(2)=(RateModifier=(1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000,1.500000))
   SoloWaveSpawnRateModifier(3)=(RateModifier=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   EarlyWaveIndex=5
   Name="Default__KFAISpawnManager_Long"
   ObjectArchetype=KFAISpawnManager'KFGame.Default__KFAISpawnManager'
}
