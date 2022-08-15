/*******************************************************************************
 * KFAISpawnManager_Short generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAISpawnManager_Short extends KFAISpawnManager within KFGameInfo
    config(Game);

defaultproperties
{
    Waves(0)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave1'
    Waves(1)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave2'
    Waves(2)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave3'
    Waves(3)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Wave4'
    Waves(4)=KFAIWaveInfo'GP_Spawning_ARCH.Short.ZED_Boss'
    EarlyWaveIndex=2
}