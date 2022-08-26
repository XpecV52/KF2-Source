//=============================================================================
// KFGameDifficulty_Endless
//=============================================================================
// Manages difficulty based gameplay settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFGameDifficulty_Endless extends KFGameDifficultyInfo;

struct ZedAdjustments
{
	// How each Zed type will be adjusted.
	var() array<StatAdjustments> ZedsToAdjust;
};

struct SpecialWaveInfo
{
	var() EAIType ZedType;
	var() float PctChance;
};

struct SpecialWaveDifficultyInfo
{
	var() array<SpecialWaveInfo> SpecialWaveInfos;
};

struct ZedDifficultyOverride
{
	var() class<KFPawn_Monster> ClassToAdjust;
	/** The individual health modifier for this zed type */
	var() float HealthMod;
	/** A per zed damage mod configurable by difficulty */
	var() float DamageMod;
	/** A per zed damage mod configurable by difficulty when playing solo/offline */
	var() float SoloDamageMod;

	structdefaultproperties
	{
		HealthMod = 1.f,
		DamageMod = 1.f,
		SoloDamageMod = 1.f
	}
};

struct DifficultyOverride
{
	var() array<ZedDifficultyOverride> ZedsOverride;
};

/** How the difficulty will scale each difficulty increase based on the starting difficulty. */
struct DifficultyScaling
{
	// The difficulty settings for each difficulty.
	var() array<DifficultySettings> Difficulties;

	// When we get into Hell on Earth plus rounds, how will difficulty settings adjust
	var() DifficultySettings DifficultyIncrement;

	// Which difficulty we're currently on
	var() int CurrentDifficultyIndex;

	// The starting probability that a zed will upgrade to the next class
	var() const float BaseUpgradeZedPctChance;

	// Amount that the zed upgrade percent chance will increase each round.
	var() const float IncreaseUpgradeZedPctChance;

	// The probability that a zed will upgrade to the next class.
	var() float UpgradeZedPctChance;

	// Starting probability that a zed will fully upgrade to the final class
	var() const float BaseFullUpgradeZedPctChance;

	// Amount that the zed full upgrade will increase each round
	var() const float IncreaseFullUpgradeZedPctChance;

	// The probability that a zed will fully upgrade to the final class.
	var() float FullUpgradeZedPctChance;

	// How each Stat Adjustment will vary by current difficulty.
	var() array<ZedAdjustments> ZedAdjustmentsByDifficulty;

	// How the Hell on Earth Stat Adjustment will adjust past each boss fight.
	var() StatAdjustments ZedAdjustmentIncrement;

	// The probability that the wave will be an outbreak
	var() array<float> OutbreakPctChances;

	// The probability that the wave will be a special wave.
	var() array<float> SpecialWavePctChance;

	// If we're in a special wave, then what is the probability of a certain zed type being chosen
	var() array<SpecialWaveDifficultyInfo> DifficultySpecialWaveTypes;

	// If a Zed Difficulty Setting needs to be overriden.
	var() array<DifficultyOverride> ZedDiffOverride;

	structdefaultproperties
	{
		BaseUpgradeZedPctChance=.01f,
		IncreaseUpgradeZedPctChance=.01f,
		UpgradeZedPctChance=0.f,

		BaseFullUpgradeZedPctChance=0.001f,
		IncreaseFullUpgradeZedPctChance=0.001f,
		FullUpgradeZedPctChance=0.f
	}
};

var DifficultyScaling CurrentDifficultyScaling;
var() array<DifficultyScaling> DifficultyScalings;

function IncrementHoePlus()
{
	local int DifficultyIndex;
	DifficultyIndex = CurrentDifficultyScaling.CurrentDifficultyIndex;

	if (DifficultyIndex < 0 || DifficultyIndex >= CurrentDifficultyScaling.Difficulties.length)
	{
		return;
	}

	AdjustDifficulties(DifficultyIndex);
	AdjustZedStats(DifficultyIndex);

	SetDifficultySettings(CurrentDifficultyScaling.CurrentDifficultyIndex);
}

function AdjustDifficulties(int DifficultyIndex)
{
	if (DifficultyIndex < 0 || DifficultyIndex >= CurrentDifficultyScaling.Difficulties.length)
	{
		return;
	}

	CurrentDifficultyScaling.Difficulties[DifficultyIndex].TraderTime += CurrentDifficultyScaling.DifficultyIncrement.TraderTime;
	CurrentDifficultyScaling.Difficulties[DifficultyIndex].GlobalHealthMod += CurrentDifficultyScaling.DifficultyIncrement.GlobalHealthMod;
	CurrentDifficultyScaling.Difficulties[DifficultyIndex].MovementSpeedMod += CurrentDifficultyScaling.DifficultyIncrement.MovementSpeedMod;
	CurrentDifficultyScaling.Difficulties[DifficultyIndex].WaveCountMod += CurrentDifficultyScaling.DifficultyIncrement.WaveCountMod;
	CurrentDifficultyScaling.Difficulties[DifficultyIndex].DoshKillMod += CurrentDifficultyScaling.DifficultyIncrement.DoshKillMod;
	CurrentDifficultyScaling.Difficulties[DifficultyIndex].StartingDosh += CurrentDifficultyScaling.DifficultyIncrement.StartingDosh;
	CurrentDifficultyScaling.Difficulties[DifficultyIndex].RespawnDosh += CurrentDifficultyScaling.DifficultyIncrement.RespawnDosh;
	CurrentDifficultyScaling.Difficulties[DifficultyIndex].AmmoPickupsMod += CurrentDifficultyScaling.DifficultyIncrement.AmmoPickupsMod;
	CurrentDifficultyScaling.Difficulties[DifficultyIndex].ItemPickupsMod += CurrentDifficultyScaling.DifficultyIncrement.ItemPickupsMod;
	CurrentDifficultyScaling.Difficulties[DifficultyIndex].WeakAttackChance += CurrentDifficultyScaling.DifficultyIncrement.WeakAttackChance;
	CurrentDifficultyScaling.Difficulties[DifficultyIndex].MediumAttackChance += CurrentDifficultyScaling.DifficultyIncrement.MediumAttackChance;
	CurrentDifficultyScaling.Difficulties[DifficultyIndex].HardAttackChance += CurrentDifficultyScaling.DifficultyIncrement.HardAttackChance;
	CurrentDifficultyScaling.Difficulties[DifficultyIndex].SelfInflictedDamageMod += CurrentDifficultyScaling.DifficultyIncrement.SelfInflictedDamageMod;
	CurrentDifficultyScaling.Difficulties[DifficultyIndex].SpawnRateModifier += CurrentDifficultyScaling.DifficultyIncrement.SpawnRateModifier;
}

function AdjustZedStats(int DifficultyIndex)
{
	local int i;

	if (DifficultyIndex < 0 || DifficultyIndex >= CurrentDifficultyScaling.ZedAdjustmentsByDifficulty.length)
	{
		return;
	}

	for (i = 0; i < CurrentDifficultyScaling.ZedAdjustmentsByDifficulty[DifficultyIndex].ZedsToAdjust.length; i++)
	{
		CurrentDifficultyScaling.ZedAdjustmentsByDifficulty[DifficultyIndex].ZedsToAdjust[i].HealthScale += CurrentDifficultyScaling.ZedAdjustmentIncrement.HealthScale;
		CurrentDifficultyScaling.ZedAdjustmentsByDifficulty[DifficultyIndex].ZedsToAdjust[i].HeadHealthScale += CurrentDifficultyScaling.ZedAdjustmentIncrement.HeadHealthScale;
		CurrentDifficultyScaling.ZedAdjustmentsByDifficulty[DifficultyIndex].ZedsToAdjust[i].ShieldScale += CurrentDifficultyScaling.ZedAdjustmentIncrement.ShieldScale;
		CurrentDifficultyScaling.ZedAdjustmentsByDifficulty[DifficultyIndex].ZedsToAdjust[i].DamageDealtScale += CurrentDifficultyScaling.ZedAdjustmentIncrement.DamageDealtScale;
		CurrentDifficultyScaling.ZedAdjustmentsByDifficulty[DifficultyIndex].ZedsToAdjust[i].DamageTakenScale += CurrentDifficultyScaling.ZedAdjustmentIncrement.DamageTakenScale;
	}
}

function IncrementDifficulty()
{
	CurrentDifficultyScaling.CurrentDifficultyIndex = Clamp(CurrentDifficultyScaling.CurrentDifficultyIndex + 1, 0, CurrentDifficultyScaling.Difficulties.length - 1);
	LogInternal("Incrementing Difficulty Index to" @ CurrentDifficultyScaling.CurrentDifficultyIndex);
	SetDifficultySettings(CurrentDifficultyScaling.CurrentDifficultyIndex);
}

function SetDifficultySettings(float GameDifficulty)
{
	local int DiffSettingIndex;

	if(CurrentDifficultyScaling.Difficulties.length > 0)
	{
		DiffSettingIndex = Clamp(GameDifficulty, 0, CurrentDifficultyScaling.Difficulties.length - 1);
		LogInternal("Setting Difficulty Settings to" @ DiffSettingIndex);
		CurrentSettings = CurrentDifficultyScaling.Difficulties[DiffSettingIndex];
	}
}

function SetDifficultyScaling(float StartingGameDifficulty)
{
	local int DiffScalingIndex;

	if(DifficultyScalings.length > 0)
	{
		DiffScalingIndex = Min(StartingGameDifficulty, DifficultyScalings.length - 1);
		LogInternal("Setting Difficulty Scalings to" @ DiffScalingIndex);
		CurrentDifficultyScaling = DifficultyScalings[DiffScalingIndex];
	}
}

function float GetZedUpgradePctChance()
{
	return CurrentDifficultyScaling.UpgradeZedPctChance;
}

function float GetZedFullUpgradePctChance()
{
	return CurrentDifficultyScaling.FullUpgradeZedPctChance;
}

function IncreaseZedUpgradePct()
{
	CurrentDifficultyScaling.UpgradeZedPctChance = FClamp(CurrentDifficultyScaling.UpgradeZedPctChance + CurrentDifficultyScaling.IncreaseUpgradeZedPctChance, 0.f, 1.f);
}

function IncreaseZedFullUpgradePct()
{
	CurrentDifficultyScaling.FullUpgradeZedPctChance = FClamp(CurrentDifficultyScaling.FullUpgradeZedPctChance + CurrentDifficultyScaling.IncreaseFullUpgradeZedPctChance, 0.f, 1.f);
}

function SetZedUpgradeToBase()
{
	CurrentDifficultyScaling.UpgradeZedPctChance = CurrentDifficultyScaling.BaseUpgradeZedPctChance;
}

function SetZedFullUpgradeToBase()
{
	CurrentDifficultyScaling.FullUpgradeZedPctChance = CurrentDifficultyScaling.BaseFullUpgradeZedPctChance;
}

function bool ShouldStartHoePlus()
{
	return CurrentDifficultyScaling.CurrentDifficultyIndex + 1 >= CurrentDifficultyScaling.Difficulties.length - 1;
}

function array<StatAdjustments> GetZedsToAdjust()
{
	return CurrentDifficultyScaling.ZedAdjustmentsByDifficulty[CurrentDifficultyScaling.CurrentDifficultyIndex].ZedsToAdjust;
}

function array<ZedDifficultyOverride> GetZedsOverride()
{
	return CurrentDifficultyScaling.ZedDiffOverride[CurrentDifficultyScaling.CurrentDifficultyIndex].ZedsOverride;
}

function float GetOutbreakPctChance()
{
	if(CurrentDifficultyScaling.OutbreakPctChances.length > 0)
	{
		return CurrentDifficultyScaling.OutbreakPctChances[Min(CurrentDifficultyScaling.CurrentDifficultyIndex, CurrentDifficultyScaling.OutbreakPctChances.length - 1)];
	}
	return 0.f;
}

function float GetSpeicalWavePctChance()
{
	if(CurrentDifficultyScaling.SpecialWavePctChance.length > 0)
	{
		return CurrentDifficultyScaling.SpecialWavePctChance[Min(CurrentDifficultyScaling.CurrentDifficultyIndex, CurrentDifficultyScaling.SpecialWavePctChance.length - 1)];
	}
	return 0.f;
}

function EAIType GetSpecialWaveType()
{
	local array<SpecialWaveInfo> SpecialWaves;
	local float RandF;
	local float TotalProb;
	local SpecialWaveInfo It;

	SpecialWaves = CurrentDifficultyScaling.DifficultySpecialWaveTypes[CurrentDifficultyScaling.CurrentDifficultyIndex].SpecialWaveInfos;
	RandF = FRand();

	foreach SpecialWaves(It)
	{
		TotalProb += It.PctChance;
		if (It.PctChance > 0 && RandF < TotalProb)
		{
			return It.ZedType;
		}
	}

	return AT_Clot;
}

function float GetAIDamageModifier(KFPawn_Monster P, float GameDifficulty, bool bSoloPlay)
{
	local float PerZedDamageMod, SoloPlayDamageMod;
	local array<ZedDifficultyOverride> ZedsToAdjust;
	local ZedDifficultyOverride ZedDifficulty;
	local bool bFoundOverride;

	// default if no InMonsterInfo
	PerZedDamageMod = 1.0;
	SoloPlayDamageMod = 1.0;
	bFoundOverride = false;

	ZedsToAdjust = GetZedsOverride();

	foreach ZedsToAdjust(ZedDifficulty)
	{
		if (ZedDifficulty.ClassToAdjust != P.class)
		{
			continue;
		}

		PerZedDamageMod = ZedDifficulty.DamageMod;
		if (bSoloPlay)
		{
			SoloPlayDamageMod = ZedDifficulty.SoloDamageMod;
		}
		bFoundOverride = true;
		break;
	}

	if (bFoundOverride)
	{
		return PerZedDamageMod * SoloPlayDamageMod;
	}
	else
	{
		return super.GetAIDamageModifier(P, Clamp(GetCurrentDifficultyIndex(), 0, 3), bSoloPlay);
	}
}

function GetAIHealthModifier(KFPawn_Monster P, float GameDifficulty, byte NumLivingPlayers, out float HealthMod, out float HeadHealthMod, optional bool bApplyDifficultyScaling = true)
{
	local array<StatAdjustments> ZedsToAdjust;
	local StatAdjustments ZedAdjustment;

	// Clamp Difficulty Index to normal difficulty range in case we're in Hell on Earth+.
	super.GetAIHealthModifier(P, Clamp(GetCurrentDifficultyIndex(), 0, 3), NumLivingPlayers, HealthMod, HeadHealthMod, bApplyDifficultyScaling);

	ZedsToAdjust = GetZedsToAdjust();

	foreach ZedsToAdjust(ZedAdjustment)
	{
		if (ZedAdjustment.ClassToAdjust == P.class)
		{
			HealthMod *= ZedAdjustment.HealthScale;
			HeadHealthMod *= ZedAdjustment.HeadHealthScale;
		}
	}
}

function float GetCharHealthModDifficulty(KFPawn_Monster P, float GameDifficulty)
{
	local array<ZedDifficultyOverride> ZedsToAdjust;
	local ZedDifficultyOverride ZedDifficulty;

	ZedsToAdjust = GetZedsOverride();

	foreach ZedsToAdjust(ZedDifficulty)
	{
		if (ZedDifficulty.ClassToAdjust == P.class)
		{
			return ZedDifficulty.HealthMod;
		}
	}

	// Clamp Difficulty Index to normal difficulty range in case we're in Hell on Earth+.
	return super.GetCharHealthModDifficulty(P, Clamp(GetCurrentDifficultyIndex(), 0, 3));
}

function float GetCharHeadHealthModDifficulty(KFPawn_Monster P, float GameDifficulty)
{
	// Clamp Difficulty Index to normal difficulty range in case we're in Hell on Earth+.
	return super.GetCharHeadHealthModDifficulty(P, Clamp(GetCurrentDifficultyIndex(), 0, 3));
}

function float GetCharSprintChanceByDifficulty(KFPawn_Monster P, float GameDifficulty)
{
	// Clamp Difficulty Index to normal difficulty range in case we're in Hell on Earth+.
	return super.GetCharSprintChanceByDifficulty(P, Clamp(GetCurrentDifficultyIndex(), 0, 3));
}

function float GetCharSprintWhenDamagedChanceByDifficulty(KFPawn_Monster P, float GameDifficulty)
{
	// Clamp Difficulty Index to normal difficulty range in case we're in Hell on Earth+.
	return super.GetCharSprintWhenDamagedChanceByDifficulty(P, Clamp(GetCurrentDifficultyIndex(), 0, 3));
}

function int GetCurrentDifficultyIndex()
{
	return CurrentDifficultyScaling.CurrentDifficultyIndex;
}

defaultproperties
{
   CurrentDifficultyScaling=(DifficultyIncrement=(TraderTime=60,GlobalHealthMod=1.000000,MovementSpeedMod=1.000000,WaveCountMod=1.000000,DoshKillMod=1.000000,StartingDosh=250,RespawnDosh=250,AmmoPickupsMod=0.500000,ItemPickupsMod=0.300000,WeakAttackChance=1.000000,SelfInflictedDamageMod=1.000000,SpawnRateModifier=1.000000),BaseUpgradeZedPctChance=0.010000,IncreaseUpgradeZedPctChance=0.010000,BaseFullUpgradeZedPctChance=0.001000,IncreaseFullUpgradeZedPctChance=0.001000,ZedAdjustmentIncrement=(HealthScale=1.000000,HeadHealthScale=1.000000,ShieldScale=1.000000,MaxBeefcake=1.500000,MaxBeefcakeHealth=1.500000,DamageDealtScale=1.000000,DamageTakenScale=1.000000,AdditionalSubSpawnCount=(X=1.000000,Y=1.000000),DoshGiven=-1))
   DifficultyScalings(0)=(Difficulties=((TraderTime=75,MovementSpeedMod=0.900000,WaveCountMod=0.750000,DoshKillMod=1.100000,StartingDosh=300,AmmoPickupsMod=0.400000,ItemPickupsMod=0.450000,SelfInflictedDamageMod=0.100000,SpawnRateModifier=0.800000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(TraderTime=75,MovementSpeedMod=0.950000,WaveCountMod=0.800000,RespawnDosh=300,AmmoPickupsMod=0.300000,ItemPickupsMod=0.350000,SelfInflictedDamageMod=0.100000,SpawnRateModifier=0.800000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(TraderTime=75,MovementSpeedMod=0.950000,WaveCountMod=0.900000,AmmoPickupsMod=0.400000,ItemPickupsMod=0.250000,MediumAttackChance=1.000000,HardAttackChance=0.500000,SelfInflictedDamageMod=0.100000,SpawnRateModifier=0.700000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(TraderTime=75,MovementSpeedMod=0.950000,WaveCountMod=0.950000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.100000,SpawnRateModifier=0.680000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(TraderTime=75,MovementSpeedMod=0.950000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.100000,SpawnRateModifier=0.680000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45)))),DifficultyIncrement=(TraderTime=0,GlobalHealthMod=0.000000,MovementSpeedMod=0.000000,WaveCountMod=0.100000,DoshKillMod=-0.010000,StartingDosh=0,RespawnDosh=0,AmmoPickupsMod=0.200000,ItemPickupsMod=0.200000,WeakAttackChance=0.000000,SelfInflictedDamageMod=0.000000,SpawnRateModifier=-0.300000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),ZedAdjustmentsByDifficulty=((ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.650000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.450000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=0.620000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthScale=0.500000,DamageDealtScale=0.850000,DoshGiven=5),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=0.420000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthScale=0.420000,DamageDealtScale=0.750000,DoshGiven=11))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.900000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.850000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=0.850000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthScale=0.850000,DamageDealtScale=0.850000,DoshGiven=5),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=0.840000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthScale=0.840000,DamageDealtScale=0.850000,DoshGiven=11))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',DamageDealtScale=0.850000,DoshGiven=5),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',DamageDealtScale=0.850000,DoshGiven=11))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',DoshGiven=1000))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',DoshGiven=1000)))),ZedAdjustmentIncrement=(HealthScale=0.000000,DamageDealtScale=0.010000,DamageTakenScale=0.000000),OutbreakPctChances=(0.000000,0.200000,0.300000,0.400000,0.500000),SpecialWavePctChance=(0.000000,0.200000,0.300000,0.400000,0.500000),DifficultySpecialWaveTypes=((SpecialWaveInfos=(,(ZedType=AT_SlasherClot),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren),(ZedType=AT_Husk),(ZedType=AT_Scrake),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast),(ZedType=AT_Bloat),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot,PctChance=0.100000),(ZedType=AT_Crawler,PctChance=0.100000),(ZedType=AT_Stalker,PctChance=0.100000),(ZedType=AT_Siren),(ZedType=AT_Husk),(ZedType=AT_Scrake),(ZedType=AT_AlphaClot,PctChance=0.100000),(ZedType=AT_GoreFast),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot,PctChance=0.100000),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren,PctChance=0.100000),(ZedType=AT_Husk,PctChance=0.100000),(ZedType=AT_Scrake,PctChance=0.100000),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast,PctChance=0.100000),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren),(ZedType=AT_Husk,PctChance=0.100000),(ZedType=AT_Scrake,PctChance=0.100000),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast,PctChance=0.100000),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren,PctChance=0.100000),(ZedType=AT_Husk,PctChance=0.100000),(ZedType=AT_Scrake,PctChance=0.100000),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound)))),ZedDiffOverride=((ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',DamageMod=0.250000,SoloDamageMod=0.300000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.300000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',HealthMod=0.750000,DamageMod=0.350000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=0.850000,DamageMod=0.425000,SoloDamageMod=0.425000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=0.750000,DamageMod=0.310000,SoloDamageMod=0.310000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=0.500000,DamageMod=0.310000,SoloDamageMod=0.310000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.710000,DamageMod=0.540000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=0.750000,DamageMod=0.670000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=0.630000,DamageMod=0.510000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.650000,DamageMod=0.700000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.350000,DamageMod=0.200000))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',DamageMod=0.250000,SoloDamageMod=0.300000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.300000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',HealthMod=0.750000,DamageMod=0.350000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=0.850000,DamageMod=0.425000,SoloDamageMod=0.425000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=0.750000,DamageMod=0.310000,SoloDamageMod=0.310000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=0.500000,DamageMod=0.310000,SoloDamageMod=0.310000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.710000,DamageMod=0.540000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=0.750000,DamageMod=0.670000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=0.630000,DamageMod=0.510000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.650000,DamageMod=0.700000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.350000,DamageMod=0.200000))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',DamageMod=0.250000,SoloDamageMod=0.300000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.300000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',HealthMod=0.750000,DamageMod=0.350000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=0.850000,DamageMod=0.425000,SoloDamageMod=0.425000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=0.750000,DamageMod=0.310000,SoloDamageMod=0.310000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=0.500000,DamageMod=0.310000,SoloDamageMod=0.310000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.710000,DamageMod=0.540000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=0.750000,DamageMod=0.670000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=0.630000,DamageMod=0.510000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.650000,DamageMod=0.700000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.350000,DamageMod=0.200000))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',DamageMod=0.250000,SoloDamageMod=0.300000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.300000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',HealthMod=0.750000,DamageMod=0.350000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=0.850000,DamageMod=0.425000,SoloDamageMod=0.425000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=0.750000,DamageMod=0.310000,SoloDamageMod=0.310000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=0.500000,DamageMod=0.310000,SoloDamageMod=0.310000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.710000,DamageMod=0.540000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=0.750000,DamageMod=0.670000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=0.630000,DamageMod=0.510000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.650000,DamageMod=0.700000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.350000,DamageMod=0.200000))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',DamageMod=0.250000,SoloDamageMod=0.300000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',HealthMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.300000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',HealthMod=0.750000,DamageMod=0.350000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=0.850000,DamageMod=0.425000,SoloDamageMod=0.425000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=0.750000,DamageMod=0.310000,SoloDamageMod=0.310000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=0.500000,DamageMod=0.310000,SoloDamageMod=0.310000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.710000,DamageMod=0.540000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=0.750000,DamageMod=0.670000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=0.630000,DamageMod=0.510000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.650000,DamageMod=0.700000,SoloDamageMod=0.350000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.350000,DamageMod=0.200000)))))
   DifficultyScalings(1)=(Difficulties=((MovementSpeedMod=0.950000,WaveCountMod=0.750000,DoshKillMod=1.100000,RespawnDosh=300,AmmoPickupsMod=0.300000,ItemPickupsMod=0.350000,SelfInflictedDamageMod=0.200000,SpawnRateModifier=0.800000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(MovementSpeedMod=0.950000,WaveCountMod=0.800000,AmmoPickupsMod=0.400000,ItemPickupsMod=0.250000,MediumAttackChance=1.000000,HardAttackChance=0.500000,SelfInflictedDamageMod=0.200000,SpawnRateModifier=0.700000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(MovementSpeedMod=0.950000,WaveCountMod=0.850000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.200000,SpawnRateModifier=0.680000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(MovementSpeedMod=0.950000,WaveCountMod=0.900000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.200000,SpawnRateModifier=0.650000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(MovementSpeedMod=0.950000,WaveCountMod=0.950000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.200000,SpawnRateModifier=0.600000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45)))),DifficultyIncrement=(TraderTime=0,GlobalHealthMod=0.000000,MovementSpeedMod=0.000000,WaveCountMod=0.100000,DoshKillMod=-0.010000,StartingDosh=0,RespawnDosh=0,AmmoPickupsMod=0.200000,ItemPickupsMod=0.200000,WeakAttackChance=0.000000,SelfInflictedDamageMod=0.000000,SpawnRateModifier=-0.300000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),ZedAdjustmentsByDifficulty=((ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.650000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.450000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=0.620000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthScale=0.500000,DamageDealtScale=0.850000,DoshGiven=5),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=0.420000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthScale=0.420000,DamageDealtScale=0.750000,DoshGiven=11))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.900000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.850000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=0.850000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthScale=0.850000,DamageDealtScale=0.850000,DoshGiven=5),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=0.840000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthScale=0.840000,DamageDealtScale=0.850000,DoshGiven=11))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',DamageDealtScale=0.850000,DoshGiven=5),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',DamageDealtScale=0.850000,DoshGiven=11))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',DoshGiven=1000))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',DoshGiven=1000)))),ZedAdjustmentIncrement=(HealthScale=0.000000,DamageDealtScale=0.010000,DamageTakenScale=0.000000),OutbreakPctChances=(0.000000,0.200000,0.300000,0.400000,0.500000),SpecialWavePctChance=(0.000000,0.200000,0.300000,0.400000,0.500000),DifficultySpecialWaveTypes=((SpecialWaveInfos=(,(ZedType=AT_SlasherClot),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren),(ZedType=AT_Husk),(ZedType=AT_Scrake),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast),(ZedType=AT_Bloat),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot,PctChance=0.100000),(ZedType=AT_Crawler,PctChance=0.100000),(ZedType=AT_Stalker,PctChance=0.100000),(ZedType=AT_Siren),(ZedType=AT_Husk),(ZedType=AT_Scrake),(ZedType=AT_AlphaClot,PctChance=0.100000),(ZedType=AT_GoreFast),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot,PctChance=0.100000),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren,PctChance=0.100000),(ZedType=AT_Husk,PctChance=0.100000),(ZedType=AT_Scrake,PctChance=0.100000),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast,PctChance=0.100000),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren),(ZedType=AT_Husk,PctChance=0.100000),(ZedType=AT_Scrake,PctChance=0.100000),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast,PctChance=0.100000),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren,PctChance=0.100000),(ZedType=AT_Husk,PctChance=0.100000),(ZedType=AT_Scrake,PctChance=0.100000),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound)))),ZedDiffOverride=((ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',DamageMod=0.850000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',DamageMod=0.750000,SoloDamageMod=0.800000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',DamageMod=0.750000,SoloDamageMod=0.800000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',DamageMod=0.750000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',DamageMod=0.750000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',DamageMod=0.700000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',DamageMod=0.650000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=0.750000,DamageMod=0.650000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.820000,DamageMod=0.730000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',DamageMod=0.810000,SoloDamageMod=0.420000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=0.830000,DamageMod=0.750000,SoloDamageMod=0.420000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.800000,DamageMod=0.850000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.950000,DamageMod=0.750000))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',DamageMod=0.850000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',DamageMod=0.750000,SoloDamageMod=0.800000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',DamageMod=0.750000,SoloDamageMod=0.800000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',DamageMod=0.750000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',DamageMod=0.750000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',DamageMod=0.700000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',DamageMod=0.650000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=0.750000,DamageMod=0.650000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.820000,DamageMod=0.730000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',DamageMod=0.810000,SoloDamageMod=0.420000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=0.830000,DamageMod=0.750000,SoloDamageMod=0.420000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.800000,DamageMod=0.850000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.950000,DamageMod=0.750000))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',DamageMod=0.850000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',DamageMod=0.750000,SoloDamageMod=0.800000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',DamageMod=0.750000,SoloDamageMod=0.800000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',DamageMod=0.750000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',DamageMod=0.750000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',DamageMod=0.700000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',DamageMod=0.650000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=0.750000,DamageMod=0.650000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.820000,DamageMod=0.730000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',DamageMod=0.810000,SoloDamageMod=0.420000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=0.830000,DamageMod=0.750000,SoloDamageMod=0.420000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.800000,DamageMod=0.850000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.950000,DamageMod=0.750000))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',DamageMod=0.850000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',DamageMod=0.750000,SoloDamageMod=0.800000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',DamageMod=0.750000,SoloDamageMod=0.800000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',DamageMod=0.750000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',DamageMod=0.750000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',DamageMod=0.700000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',DamageMod=0.650000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=0.750000,DamageMod=0.650000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.820000,DamageMod=0.730000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',DamageMod=0.810000,SoloDamageMod=0.420000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=0.830000,DamageMod=0.750000,SoloDamageMod=0.420000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.800000,DamageMod=0.850000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.950000,DamageMod=0.750000))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',DamageMod=0.850000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',DamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',DamageMod=0.750000,SoloDamageMod=0.800000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',DamageMod=0.750000,SoloDamageMod=0.800000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',DamageMod=0.750000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',DamageMod=0.750000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',DamageMod=0.700000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',DamageMod=0.650000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=0.750000,DamageMod=0.650000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.820000,DamageMod=0.730000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',DamageMod=0.810000,SoloDamageMod=0.420000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=0.830000,DamageMod=0.750000,SoloDamageMod=0.420000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.800000,DamageMod=0.850000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.950000,DamageMod=0.750000)))))
   DifficultyScalings(2)=(Difficulties=((MovementSpeedMod=0.950000,WaveCountMod=0.750000,DoshKillMod=1.100000,AmmoPickupsMod=0.400000,ItemPickupsMod=0.250000,MediumAttackChance=1.000000,HardAttackChance=0.500000,SelfInflictedDamageMod=0.200000,SpawnRateModifier=0.700000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(MovementSpeedMod=0.950000,WaveCountMod=0.800000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.200000,SpawnRateModifier=0.680000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(MovementSpeedMod=0.950000,WaveCountMod=0.900000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.200000,SpawnRateModifier=0.650000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(MovementSpeedMod=0.950000,WaveCountMod=0.950000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.200000,SpawnRateModifier=0.600000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(MovementSpeedMod=0.950000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.200000,SpawnRateModifier=0.550000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45)))),DifficultyIncrement=(TraderTime=0,GlobalHealthMod=0.000000,MovementSpeedMod=0.000000,WaveCountMod=0.100000,DoshKillMod=-0.010000,StartingDosh=0,RespawnDosh=0,AmmoPickupsMod=0.200000,ItemPickupsMod=0.200000,WeakAttackChance=0.000000,SelfInflictedDamageMod=0.000000,SpawnRateModifier=-0.300000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),ZedAdjustmentsByDifficulty=((ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.650000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.450000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=0.620000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthScale=0.500000,DamageDealtScale=0.850000,DoshGiven=5),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=0.420000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthScale=0.420000,DamageDealtScale=0.750000,DoshGiven=11))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.900000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.850000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=0.850000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthScale=0.850000,DamageDealtScale=0.850000,DoshGiven=5),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=0.840000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthScale=0.840000,DamageDealtScale=0.850000,DoshGiven=11))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',DamageDealtScale=0.850000,DoshGiven=5),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',DamageDealtScale=0.850000,DoshGiven=11))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',DoshGiven=1000))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',DoshGiven=1000)))),ZedAdjustmentIncrement=(HealthScale=0.000000,DamageDealtScale=0.010000,DamageTakenScale=0.000000),OutbreakPctChances=(0.000000,0.200000,0.300000,0.400000,0.500000),SpecialWavePctChance=(0.000000,0.200000,0.300000,0.400000,0.500000),DifficultySpecialWaveTypes=((SpecialWaveInfos=(,(ZedType=AT_SlasherClot),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren),(ZedType=AT_Husk),(ZedType=AT_Scrake),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast),(ZedType=AT_Bloat),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot,PctChance=0.100000),(ZedType=AT_Crawler,PctChance=0.100000),(ZedType=AT_Stalker,PctChance=0.100000),(ZedType=AT_Siren),(ZedType=AT_Husk),(ZedType=AT_Scrake),(ZedType=AT_AlphaClot,PctChance=0.100000),(ZedType=AT_GoreFast),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot,PctChance=0.100000),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren,PctChance=0.100000),(ZedType=AT_Husk,PctChance=0.100000),(ZedType=AT_Scrake,PctChance=0.100000),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast,PctChance=0.100000),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren),(ZedType=AT_Husk,PctChance=0.100000),(ZedType=AT_Scrake,PctChance=0.100000),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast,PctChance=0.100000),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren),(ZedType=AT_Husk),(ZedType=AT_Scrake,PctChance=0.100000),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast),(ZedType=AT_Bloat),(ZedType=AT_FleshPound,PctChance=0.100000)))),ZedDiffOverride=((ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=1.200000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=1.100000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=1.100000,DamageMod=1.125000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=1.100000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.850000,DamageMod=1.150000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=1.130000,DamageMod=1.470000,SoloDamageMod=0.410000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.900000,DamageMod=1.150000,SoloDamageMod=0.410000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn'))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=1.200000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=1.100000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=1.100000,DamageMod=1.125000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=1.100000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.850000,DamageMod=1.150000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=1.130000,DamageMod=1.470000,SoloDamageMod=0.410000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.900000,DamageMod=1.150000,SoloDamageMod=0.410000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn'))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=1.200000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=1.100000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=1.100000,DamageMod=1.125000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=1.100000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.850000,DamageMod=1.150000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=1.130000,DamageMod=1.470000,SoloDamageMod=0.410000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.900000,DamageMod=1.150000,SoloDamageMod=0.410000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn'))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=1.200000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=1.100000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=1.100000,DamageMod=1.125000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=1.100000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.850000,DamageMod=1.150000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=1.130000,DamageMod=1.470000,SoloDamageMod=0.410000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.900000,DamageMod=1.150000,SoloDamageMod=0.410000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn'))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=1.200000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=1.100000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=1.100000,DamageMod=1.125000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=1.100000,SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.850000,DamageMod=1.150000,SoloDamageMod=0.400000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=1.130000,DamageMod=1.470000,SoloDamageMod=0.410000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',SoloDamageMod=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=0.900000,DamageMod=1.150000,SoloDamageMod=0.410000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn')))))
   DifficultyScalings(3)=(Difficulties=((MovementSpeedMod=0.950000,WaveCountMod=0.850000,DoshKillMod=1.100000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.500000,SpawnRateModifier=0.680000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(MovementSpeedMod=0.950000,WaveCountMod=0.900000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.500000,SpawnRateModifier=0.650000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(MovementSpeedMod=0.950000,WaveCountMod=0.950000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.500000,SpawnRateModifier=0.600000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(MovementSpeedMod=0.950000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.500000,SpawnRateModifier=0.550000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),(MovementSpeedMod=0.950000,WaveCountMod=1.050000,AmmoPickupsMod=0.250000,ItemPickupsMod=0.100000,MediumAttackChance=1.000000,HardAttackChance=1.000000,SelfInflictedDamageMod=0.500000,SpawnRateModifier=0.500000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45)))),DifficultyIncrement=(TraderTime=0,GlobalHealthMod=0.000000,MovementSpeedMod=0.000000,WaveCountMod=0.100000,DoshKillMod=-0.010000,StartingDosh=0,RespawnDosh=0,AmmoPickupsMod=0.200000,ItemPickupsMod=0.200000,WeakAttackChance=0.000000,SelfInflictedDamageMod=0.000000,SpawnRateModifier=-0.300000,TraderTimerMapOverride=((MapName="KF-DieSector",TraderTime=45))),ZedAdjustmentsByDifficulty=((ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.650000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.450000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=0.620000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthScale=0.500000,DamageDealtScale=0.850000,DoshGiven=5),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=0.420000,DamageDealtScale=0.750000,DoshGiven=250),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthScale=0.420000,DamageDealtScale=0.750000,DoshGiven=11))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.900000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.850000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=0.850000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',HealthScale=0.850000,DamageDealtScale=0.850000,DoshGiven=5),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=0.840000,DamageDealtScale=0.850000,DoshGiven=500),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthScale=0.840000,DamageDealtScale=0.850000,DoshGiven=11))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn',DamageDealtScale=0.850000,DoshGiven=5),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=0.950000,DamageDealtScale=0.950000,DoshGiven=800),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',DamageDealtScale=0.850000,DoshGiven=11))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',DoshGiven=1000))),(ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',DoshGiven=1000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',DoshGiven=1000)))),ZedAdjustmentIncrement=(HealthScale=0.000000,DamageDealtScale=0.010000,DamageTakenScale=0.000000),OutbreakPctChances=(0.000000,0.200000,0.300000,0.400000,0.500000),SpecialWavePctChance=(0.000000,0.200000,0.300000,0.400000,0.500000),DifficultySpecialWaveTypes=((SpecialWaveInfos=(,(ZedType=AT_SlasherClot),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren),(ZedType=AT_Husk),(ZedType=AT_Scrake),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast),(ZedType=AT_Bloat),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot,PctChance=0.100000),(ZedType=AT_Crawler,PctChance=0.100000),(ZedType=AT_Stalker,PctChance=0.100000),(ZedType=AT_Siren),(ZedType=AT_Husk),(ZedType=AT_Scrake),(ZedType=AT_AlphaClot,PctChance=0.100000),(ZedType=AT_GoreFast),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot,PctChance=0.100000),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren,PctChance=0.100000),(ZedType=AT_Husk,PctChance=0.100000),(ZedType=AT_Scrake,PctChance=0.100000),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast,PctChance=0.100000),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren),(ZedType=AT_Husk,PctChance=0.100000),(ZedType=AT_Scrake,PctChance=0.100000),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast,PctChance=0.100000),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound))),(SpecialWaveInfos=(,(ZedType=AT_SlasherClot),(ZedType=AT_Crawler),(ZedType=AT_Stalker),(ZedType=AT_Siren,PctChance=0.100000),(ZedType=AT_Husk,PctChance=0.100000),(ZedType=AT_Scrake,PctChance=0.100000),(ZedType=AT_AlphaClot),(ZedType=AT_GoreFast),(ZedType=AT_Bloat,PctChance=0.100000),(ZedType=AT_FleshPound)))),ZedDiffOverride=((ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=1.300000,DamageMod=1.500000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',HealthMod=1.300000,DamageMod=1.500000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=1.100000,DamageMod=1.250000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=1.200000,DamageMod=1.250000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=1.150000,DamageMod=1.050000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.910000,DamageMod=1.180000,SoloDamageMod=0.510000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=1.390000,DamageMod=1.450000,SoloDamageMod=0.520000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=1.200000,DamageMod=1.200000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=1.050000,DamageMod=1.200000,SoloDamageMod=0.520000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn'))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=1.300000,DamageMod=1.500000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',HealthMod=1.300000,DamageMod=1.500000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=1.100000,DamageMod=1.250000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=1.200000,DamageMod=1.250000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=1.150000,DamageMod=1.050000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.910000,DamageMod=1.180000,SoloDamageMod=0.510000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=1.390000,DamageMod=1.450000,SoloDamageMod=0.520000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=1.200000,DamageMod=1.200000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=1.050000,DamageMod=1.200000,SoloDamageMod=0.520000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn'))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=1.300000,DamageMod=1.500000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',HealthMod=1.300000,DamageMod=1.500000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=1.100000,DamageMod=1.250000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=1.200000,DamageMod=1.250000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=1.150000,DamageMod=1.050000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.910000,DamageMod=1.180000,SoloDamageMod=0.510000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=1.390000,DamageMod=1.450000,SoloDamageMod=0.520000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=1.200000,DamageMod=1.200000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=1.050000,DamageMod=1.200000,SoloDamageMod=0.520000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn'))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=1.300000,DamageMod=1.500000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',HealthMod=1.300000,DamageMod=1.500000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=1.100000,DamageMod=1.250000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=1.200000,DamageMod=1.250000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=1.150000,DamageMod=1.050000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.910000,DamageMod=1.180000,SoloDamageMod=0.510000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=1.390000,DamageMod=1.450000,SoloDamageMod=0.520000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=1.200000,DamageMod=1.200000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=1.050000,DamageMod=1.200000,SoloDamageMod=0.520000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn'))),(ZedsOverride=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthMod=1.300000,DamageMod=1.500000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',HealthMod=1.300000,DamageMod=1.500000,SoloDamageMod=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthMod=1.100000,DamageMod=1.250000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthMod=1.200000,DamageMod=1.250000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',HealthMod=1.150000,DamageMod=1.050000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthMod=0.910000,DamageMod=1.180000,SoloDamageMod=0.510000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthMod=1.390000,DamageMod=1.450000,SoloDamageMod=0.520000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthMod=1.200000,DamageMod=1.200000,SoloDamageMod=0.650000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKing',HealthMod=1.050000,DamageMod=1.200000,SoloDamageMod=0.520000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloatKingSubspawn')))))
   Name="Default__KFGameDifficulty_Endless"
   ObjectArchetype=KFGameDifficultyInfo'KFGame.Default__KFGameDifficultyInfo'
}
