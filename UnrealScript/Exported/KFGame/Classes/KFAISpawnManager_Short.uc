//=============================================================================
// KFAISpawnManager_Short
//=============================================================================
// The KFAISpawnManager for a short length game
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFAISpawnManager_Short extends KFAISpawnManager;

defaultproperties
{
   DifficultyWaveSettings(0)=(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Short.Norm.ZED_Wave1_Short_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Short.Norm.ZED_Wave2_Short_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Short.Norm.ZED_Wave3_Short_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Short.Norm.ZED_Wave4_Short_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Short.Norm.ZED_Boss_Short_Norm'))
   DifficultyWaveSettings(1)=(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Short.Hard.ZED_Wave1_Short_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Short.Hard.ZED_Wave2_Short_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Short.Hard.ZED_Wave3_Short_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Short.Hard.ZED_Wave4_Short_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Short.Hard.ZED_Boss_Short_Hard'))
   DifficultyWaveSettings(2)=(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Short.SUI.ZED_Wave1_Short_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Short.SUI.ZED_Wave2_Short_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Short.SUI.ZED_Wave3_Short_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Short.SUI.ZED_Wave4_Short_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Short.SUI.ZED_Boss_Short_Sui'))
   DifficultyWaveSettings(3)=(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Short.HOE.ZED_Wave1_Short_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Short.HOE.ZED_Wave2_Short_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Short.HOE.ZED_Wave3_Short_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Short.HOE.ZED_Wave4_Short_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Short.HOE.ZED_Boss_Short_HOE'))
   SoloWaveSpawnRateModifier(0)=(RateModifier=(1.650000,1.650000,1.650000,1.650000))
   SoloWaveSpawnRateModifier(1)=(RateModifier=(1.800000,1.800000,1.800000,1.800000))
   SoloWaveSpawnRateModifier(2)=(RateModifier=(1.800000,1.800000,1.800000,1.800000))
   SoloWaveSpawnRateModifier(3)=(RateModifier=(1.400000,1.400000,1.400000,1.400000))
   EarlyWaveIndex=2
   Name="Default__KFAISpawnManager_Short"
   ObjectArchetype=KFAISpawnManager'KFGame.Default__KFAISpawnManager'
}
