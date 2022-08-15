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
   Waves(0)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave1'
   Waves(1)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave2'
   Waves(2)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave3'
   Waves(3)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave4'
   Waves(4)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave5'
   Waves(5)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave6'
   Waves(6)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave7'
   Waves(7)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Boss'
   SoloWaveSpawnRateModifier(0)=(RateModifier=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   SoloWaveSpawnRateModifier(1)=(RateModifier=(1.000000,0.500000,1.000000,1.000000,1.000000,1.000000,1.000000))
   SoloWaveSpawnRateModifier(2)=(RateModifier=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   SoloWaveSpawnRateModifier(3)=(RateModifier=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   EarlyWaveIndex=4
   Name="Default__KFAISpawnManager_Normal"
   ObjectArchetype=KFAISpawnManager'KFGame.Default__KFAISpawnManager'
}
