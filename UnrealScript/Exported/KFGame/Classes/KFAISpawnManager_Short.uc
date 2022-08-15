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
   Waves(0)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave1'
   Waves(1)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave2'
   Waves(2)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave3'
   Waves(3)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave4'
   Waves(4)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Boss'
   SoloWaveSpawnRateModifier(0)=(RateModifier=(1.500000,1.500000,1.500000,1.500000))
   SoloWaveSpawnRateModifier(1)=(RateModifier=(1.500000,1.500000,1.500000,1.500000))
   SoloWaveSpawnRateModifier(2)=(RateModifier=(1.500000,1.500000,1.500000,1.500000))
   EarlyWaveIndex=2
   Name="Default__KFAISpawnManager_Short"
   ObjectArchetype=KFAISpawnManager'KFGame.Default__KFAISpawnManager'
}
