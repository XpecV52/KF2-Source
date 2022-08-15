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

DefaultProperties
{
    EarlyWaveIndex=2

	Waves(0)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave1'
	Waves(1)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave2'
	Waves(2)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave3'
	Waves(3)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave4'

	Waves(4)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Boss'

	// Normal
    SoloWaveSpawnRateModifier(0)={(RateModifier[0]=1.0,     // Wave 1
                                   RateModifier[1]=1.0,     // Wave 2
                                   RateModifier[2]=1.0,     // Wave 3
                                   RateModifier[3]=1.0)}    // Wave 4

	// Hard
    SoloWaveSpawnRateModifier(1)={(RateModifier[0]=1.0,     // Wave 1
                                   RateModifier[1]=1.0,     // Wave 2
                                   RateModifier[2]=1.0,     // Wave 3
                                   RateModifier[3]=1.0)}    // Wave 4

	// Suicidal
    SoloWaveSpawnRateModifier(2)={(RateModifier[0]=1.0,     // Wave 1
                                   RateModifier[1]=1.0,     // Wave 2
                                   RateModifier[2]=1.0,     // Wave 3
                                   RateModifier[3]=1.0)}    // Wave 4

	// Hell On Earth
    SoloWaveSpawnRateModifier(3)={(RateModifier[0]=1.0,     // Wave 1
                                   RateModifier[1]=1.0,     // Wave 2
                                   RateModifier[2]=1.0,     // Wave 3
                                   RateModifier[3]=1.0)}    // Wave 4

}
