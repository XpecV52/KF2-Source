//=============================================================================
// KFDifficulty_Siren
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_Siren extends KFMonsterDifficultyInfo
	abstract;

defaultproperties
{
	// Normal difficulty
	Normal={(HealthMod=1.00000,
		HeadHealthMod=1.000000,
		DamageMod=1.000000,
		SoloDamageMod=0.500000,
		RallySettings={(bCanRally=false)}
	)}

	// Hard difficulty
	Hard={(HealthMod=1.00000,
		HeadHealthMod=1.000000,
		DamageMod=1.000000,
		SoloDamageMod=0.650000,
		RallySettings={(bCanRally=false)}
	)}
	
	// Suicidal difficulty
	Suicidal={(HealthMod=1.000000,
		HeadHealthMod=1.000000,
		DamageMod=1.000000,
		DamagedSprintChance=0.050000,
		SoloDamageMod=0.650000,
		RallySettings={(DealtDamageModifier=1.2, TakenDamageModifier=0.9)}
	)}

	// Hell On Earth difficulty
	HellOnEarth={(HealthMod=1.000000,
		HeadHealthMod=1.000000,
		DamagedSprintChance=0.100000,
		DamageMod=1.000000,
		SoloDamageMod=0.750000,
		RallySettings={(bCauseSprint=true, DealtDamageModifier=1.2, TakenDamageModifier=0.9)}
	)}

	// Versus Rally settings
	RallySettings_Versus={(bCauseSprint=true)}
	RallySettings_Player_Versus={(DealtDamageModifier=1.2)}
}