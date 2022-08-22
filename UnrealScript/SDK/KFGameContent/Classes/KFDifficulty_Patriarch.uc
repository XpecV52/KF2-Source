//=============================================================================
// KFDifficulty_Patriarch
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_Patriarch extends KFMonsterDifficultyInfo
	abstract;

defaultproperties
{
	// Normal difficulty
	Normal={(HealthMod=.970000,
		SprintChance=1.000000,
		DamagedSprintChance=1.000000,
		DamageMod=0.650000,
		SoloDamageMod=0.240000,

		RallySettings={(bCanRally=false)}
	)}

	// Hard difficulty
	Hard={(HealthMod=1.370000,
		SprintChance=1.000000,
		DamagedSprintChance=1.000000,
		DamageMod=0.800000,
		SoloDamageMod=0.300000,

		RallySettings={(bCanRally=false)}
	)}

	// Suicidal difficulty
	Suicidal={(HealthMod=1.460000,
		HeadHealthMod=1.460000,
		SprintChance=1.000000,
		DamagedSprintChance=1.000000,
		DamageMod=1.400000,
		SoloDamageMod=0.390000,

		BlockSettings={(Chance=0.85, Duration=1.25, MaxBlocks=5, Cooldown=3.5, DamagedHealthPctToTrigger=0.1,
							MeleeDamageModifier=0.9, DamageModifier=0.9, AfflictionModifier=0.2, SoloChanceMultiplier=1.0)},

		RallySettings={(bCanRally=false)}
	)}

	// Hell On Earth difficulty
	HellOnEarth={(HealthMod=1.70000,
		HeadHealthMod=1.700000,
		SprintChance=1.000000,
		DamagedSprintChance=1.000000,
		DamageMod=1.30000,
		SoloDamageMod=0.500000,

		BlockSettings={(Chance=0.85, Duration=1.25, MaxBlocks=6, Cooldown=3.5, DamagedHealthPctToTrigger=0.1,
							MeleeDamageModifier=0.9, DamageModifier=0.9, AfflictionModifier=0.2, SoloChanceMultiplier=1.0)},

		RallySettings={(bCanRally=false)}
	)}
	
	// Body and head health scale by number of players	
	NumPlayersScale_BodyHealth=0.500000
	NumPlayersScale_HeadHealth=0.300000

	// Versus Body and head health scale by number of player
	NumPlayersScale_BodyHealth_Versus=0.500000
	NumPlayersScale_HeadHealth_Versus=0.300000
}
