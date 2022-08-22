//=============================================================================
// KFGameDifficulty_Survival
//=============================================================================
// Manages difficulty based gameplay settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFGameDifficulty_Survival extends KFGameDifficultyInfo;

defaultproperties
{
	Normal={(TraderTime=75,
   		MovementSpeedMod=0.870000,
   		WaveCountMod=0.850000,
   		DoshKillMod=1.200000,
   		StartingDosh=300,
   		//RespawnDosh=300, this doesn't do anything
   		AmmoPickupsMod=0.400000,
   		ItemPickupsMod=0.450000,
   		SelfInflictedDamageMod=0.100000)}

	Hard={(RespawnDosh=300,
   		AmmoPickupsMod=0.300000,
   		ItemPickupsMod=0.350000,
   		SelfInflictedDamageMod=0.200000)}

	Suicidal={(WaveCountMod=1.300000,
         DoshKillMod=1.000000,  //1.0
   		AmmoPickupsMod=0.40000, //0.25
   		ItemPickupsMod=0.250000,
   		MediumAttackChance=1.000000,
   		HardAttackChance=0.500000,
   		SelfInflictedDamageMod=0.200000)}

	HellOnEarth={(MovementSpeedMod=1.050000,
   		WaveCountMod=1.700000,
   		DoshKillMod=0.900000,
   		StartingDosh=250, //200
   		//RespawnDosh=200, this doesn't do anything
   		AmmoPickupsMod=0.250000,
   		ItemPickupsMod=0.100000,
   		MediumAttackChance=1.000000,
   		HardAttackChance=1.000000)}
}
