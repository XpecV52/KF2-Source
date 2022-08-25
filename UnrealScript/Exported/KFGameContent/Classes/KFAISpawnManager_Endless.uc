//=============================================================================
// KFAISpawnManager_Endless
//=============================================================================
// The AI Spawn Manager for the Endless Mode
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFAISpawnManager_Endless extends KFAISpawnManager
	within KFGameInfo_Endless;

struct MacroDifficultyWaveInfo
{
	var array<DifficultyWaveInfo> MacroDifficultyWaveSettings;
};

var array<MacroDifficultyWaveInfo> DifficultyWaves;

function SetupNextWave(byte NextWaveIndex, int TimeToNextWaveBuffer = 0)
{
	Super.SetupNextWave(NextWaveIndex % WaveSettings.Waves.length, TimeToNextWaveBuffer);
}

function GetAvailableSquads(byte MyWaveIndex, optional bool bNeedsSpecialSquad = false)
{
	Super.GetAvailableSquads(MyWaveIndex % WaveSettings.Waves.length, bNeedsSpecialSquad);
}

function GetWaveSettings(out DifficultyWaveInfo WaveInfo)
{
	local int AdjustedGameDifficulty;
	AdjustedGameDifficulty = EndlessDifficulty.GetCurrentDifficultyIndex();
	WaveInfo = DifficultyWaves[BaseGameDifficulty].MacroDifficultyWaveSettings[AdjustedGameDifficulty];
	LogInternal("KFAISpawnManager_Endless - Setting WaveInfo to Base Game Difficulty:" @ BaseGameDifficulty @ "AdjustedGameDifficulty:" @ AdjustedGameDifficulty);
}

function OnDifficultyUpdated()
{
	GetWaveSettings(WaveSettings);
}

function OnBossDied()
{
	BossMinionsSpawnSquads.length = 0;
	AvailableSquads.length = 0;
}

defaultproperties
{
   DifficultyWaves(0)=(MacroDifficultyWaveSettings=((Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave1_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave2_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave3_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave4_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Boss_Endless_Norm')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave5_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave6_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave7_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave8_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Boss_Endless_Hard')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave9_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave10_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave10_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave10_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Boss_Endless_SUI')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Boss_Endless_HOE')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Boss_Endless_HOE'))))
   DifficultyWaves(1)=(MacroDifficultyWaveSettings=((Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave1_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave2_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave3_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave4_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Boss_Endless_Norm')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave5_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave6_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave7_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave8_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Boss_Endless_Hard')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave9_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave10_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave10_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave10_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Boss_Endless_SUI')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Boss_Endless_HOE')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Boss_Endless_HOE'))))
   DifficultyWaves(2)=(MacroDifficultyWaveSettings=((Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave1_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave2_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave3_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave4_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Boss_Endless_Norm')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave5_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave6_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave7_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave8_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Boss_Endless_Hard')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave9_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave10_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave10_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave10_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Boss_Endless_SUI')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Boss_Endless_HOE')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Boss_Endless_HOE'))))
   DifficultyWaves(3)=(MacroDifficultyWaveSettings=((Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave1_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave2_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave3_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Wave4_Endless_Norm',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Norm.ZED_Boss_Endless_Norm')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave5_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave6_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave7_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Wave8_Endless_Hard',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Hard.ZED_Boss_Endless_Hard')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave9_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave10_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave10_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Wave10_Endless_Sui',KFAIWaveInfo'GP_Spawning_ARCH.Endless.Suicidal.ZED_Boss_Endless_SUI')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Boss_Endless_HOE')),(Waves=(KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Wave10_Endless_HOE',KFAIWaveInfo'GP_Spawning_ARCH.Endless.HOE.ZED_Boss_Endless_HOE'))))
   Name="Default__KFAISpawnManager_Endless"
   ObjectArchetype=KFAISpawnManager'KFGame.Default__KFAISpawnManager'
}
