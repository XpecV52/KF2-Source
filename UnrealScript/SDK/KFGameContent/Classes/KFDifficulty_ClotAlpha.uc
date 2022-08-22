//=============================================================================
// KFDifficulty_ClotAlpha
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_ClotAlpha extends KFMonsterDifficultyInfo
	abstract;

/** Struct containing values for Alpha Clot rallies */
struct sRallyTriggerInfo
{
	/** Chance to spawn as a rally-capable Alpha */
	var float SpawnChance;
	/** Chance to rally when all conditions are met */
	var float RallyChance;
	/** Cooldown between rallies */
	var float Cooldown;
	/** How much to modify dealt damage on self when rallying */
	var float SelfDealtDamageModifier;
	/** How much to modify taken damage on self when rallying */
	var float SelfTakenDamageModifier;
};

/** Per-difficulty rally settings */
var const array<sRallyTriggerInfo> RallyTriggerSettings;

defaultproperties
{
	// Normal difficulty
	Normal={(HealthMod=0.750000,
		HeadHealthMod=0.750000,
		RallySettings={(bCanRally=false)}
	)}

	// Hard difficulty
	Hard={(DamagedSprintChance=0.050000,
		RallySettings={(bCanRally=false)}
	)}
	
	// Suicidal difficulty
	Suicidal={(SprintChance=0.050000, //0.15
		DamagedSprintChance=1.000000,
		RallySettings={(bCauseSprint=true, DealtDamageModifier=2.0, TakenDamageModifier=0.5)} // 1.2
	)}

	// Hell On Earth difficulty
	HellOnEarth={(SprintChance=0.750000,
		DamagedSprintChance=1.000000,
		RallySettings={(bCauseSprint=true, DealtDamageModifier=2.0, TakenDamageModifier=0.5)} //{(bCauseSprint=true, DealtDamageModifier=1.5, TakenDamageModifier=0.9)}
	)}

	// Versus Rally settings
	RallySettings_Versus={(bCauseSprint=true)}
	RallySettings_Player_Versus={(DealtDamageModifier=1.5)} //1.2

	// Settings for triggering a rally
	RallyTriggerSettings(`DIFFICULTY_Normal)		={(SpawnChance=0.00, RallyChance=0.00, Cooldown=15.0, SelfTakenDamageModifier=0.1, SelfDealtDamageModifier=2.50)}
	RallyTriggerSettings(`DIFFICULTY_Hard)			={(SpawnChance=0.00, RallyChance=0.00, Cooldown=15.0, SelfTakenDamageModifier=0.1, SelfDealtDamageModifier=2.50)}
	RallyTriggerSettings(`DIFFICULTY_Suicidal)		={(SpawnChance=0.25, RallyChance=0.70, Cooldown=15.0, SelfTakenDamageModifier=0.1, SelfDealtDamageModifier=2.50)}
	RallyTriggerSettings(`DIFFICULTY_HellOnEarth)	={(SpawnChance=0.35, RallyChance=0.80, Cooldown=15.0, SelfTakenDamageModifier=0.1, SelfDealtDamageModifier=2.50)}
}