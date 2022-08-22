//=============================================================================
// KFDifficulty_Hans
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_Hans extends KFMonsterDifficultyInfo
	abstract;

defaultproperties
{
	// Normal difficulty
	Normal={(HealthMod=0.94, //0.8
		SprintChance=1.000000,
		DamagedSprintChance=1.000000,
		DamageMod=0.550000,
		SoloDamageMod=0.250000, //0.2
		EvadeOnDamageSettings={(Chance=0.05, DamagedHealthPctToTrigger=0.01, ForcedEvadeChance=(FL=0.6, FR=0.6))},
		RallySettings={(bCanRally=false)}
	)}

	// Hard difficulty
	Hard={(HealthMod=1.04,
		SprintChance=1.000000,
		DamagedSprintChance=1.000000,
		DamageMod=0.700000,
		SoloDamageMod=0.30000, //0.25
		EvadeOnDamageSettings={(Chance=0.10, DamagedHealthPctToTrigger=0.01, ForcedEvadeChance=(FL=0.6, FR=0.6))},
		RallySettings={(bCanRally=false)}		
	)}

	// Suicidal difficulty
	Suicidal={(HealthMod=1.1, //1.45 //1.2
		HeadHealthMod=1.080000, //1.35
		SprintChance=1.000000,
		DamagedSprintChance=1.1, //1.0
		DamageMod=1.1, //0.9 //1.0
		SoloDamageMod=0.350000,
		EvadeOnDamageSettings={(Chance=0.2, DamagedHealthPctToTrigger=0.01, ForcedEvadeChance=(FL=0.6, FR=0.6))},  //0.6 //0.1 try lowering evade   0.40
		BlockSettings={(Chance=0.3, Duration=1.0, MaxBlocks=5, Cooldown=7.0, DamagedHealthPctToTrigger=0.1,  //Cooldown=3.5  
							MeleeDamageModifier=0.7, DamageModifier=0.7, AfflictionModifier=0.2, SoloChanceMultiplier=1.0)},
		RallySettings={(bCanRally=false)}
	)}

	// Hell On Earth difficulty
	HellOnEarth={(HealthMod=1.350000,
		HeadHealthMod=1.250000,
		SprintChance=1.000000,
		DamagedSprintChance=1.000000,
		DamageMod=1.150000,
		SoloDamageMod=0.500000,
		EvadeOnDamageSettings={(Chance=0.2, DamagedHealthPctToTrigger=0.01, ForcedEvadeChance=(FL=0.6f, FR=0.6f))},
		BlockSettings={(Chance=0.3, Duration=1.0, MaxBlocks=6, Cooldown=6.5, DamagedHealthPctToTrigger=0.1,
							MeleeDamageModifier=0.7, DamageModifier=0.7, AfflictionModifier=0.2, SoloChanceMultiplier=1.0)},
		RallySettings={(bCanRally=false)}
	)}
	
	// Body and head health scale by number of players
	NumPlayersScale_BodyHealth=0.750000
	NumPlayersScale_BodyHealth_Versus=0.750000
}