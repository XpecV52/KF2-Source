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

DefaultProperties
{
    EarlyWaveIndex=4

	Waves(0)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave1'
	Waves(1)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave2'
	Waves(2)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave3'
	Waves(3)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave4'
	Waves(4)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave5'
	Waves(5)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave6'
	Waves(6)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Wave7'
	Waves(7)=KFAIWaveInfo'GP_Spawning_ARCH.Normal.ZED_Boss'

	// Normal
    SoloWaveSpawnRateModifier(0)={(RateModifier[0]=1.5,     // Wave 1
                                   RateModifier[1]=1.5,     // Wave 2
                                   RateModifier[2]=1.5,     // Wave 3
                                   RateModifier[3]=1.5,     // Wave 4
                                   RateModifier[4]=1.5,     // Wave 5
                                   RateModifier[5]=1.5,     // Wave 6
                                   RateModifier[6]=1.5)}    // Wave 7

	// Hard
    SoloWaveSpawnRateModifier(1)={(RateModifier[0]=1.5,     // Wave 1
                                   RateModifier[1]=1.5,     // Wave 2
                                   RateModifier[2]=1.5,     // Wave 3
                                   RateModifier[3]=1.5,     // Wave 4
                                   RateModifier[4]=1.5,     // Wave 5
                                   RateModifier[5]=1.5,     // Wave 6
                                   RateModifier[6]=1.5)}    // Wave 7

	// Suicidal
    SoloWaveSpawnRateModifier(2)={(RateModifier[0]=1.5,     // Wave 1
                                   RateModifier[1]=1.5,     // Wave 2
                                   RateModifier[2]=1.5,     // Wave 3
                                   RateModifier[3]=1.5,     // Wave 4
                                   RateModifier[4]=1.5,     // Wave 5
                                   RateModifier[5]=1.5,     // Wave 6
                                   RateModifier[6]=1.5)}    // Wave 7

	// Hell On Earth
    SoloWaveSpawnRateModifier(3)={(RateModifier[0]=1.0,     // Wave 1
                                   RateModifier[1]=1.0,     // Wave 2
                                   RateModifier[2]=1.0,     // Wave 3
                                   RateModifier[3]=1.0,     // Wave 4
                                   RateModifier[4]=1.0,     // Wave 5
                                   RateModifier[5]=1.0,     // Wave 6
                                   RateModifier[6]=1.0)}    // Wave 7
}
