//=============================================================================
// KFAISpawnManager_Tutorial
//=============================================================================
// The KFAISpawnManager for a tutorial game
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFAISpawnManager_Tutorial extends KFAISpawnManager;

defaultproperties
{
   Waves(0)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave1'
   Waves(1)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave2'
   Waves(2)=None
   SoloWaveSpawnRateModifier(0)=(RateModifier=(1.500000,1.500000,1.000000,1.000000))
   EarlyWaveIndex=2
   Name="Default__KFAISpawnManager_Tutorial"
   ObjectArchetype=KFAISpawnManager'KFGame.Default__KFAISpawnManager'
}
