//=============================================================================
// KFDifficulty_ClotAlphaKing
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_ClotAlphaKing extends KFDifficulty_ClotAlpha
	abstract;

/** Struct containing values for Alpha Clot rallies */
struct sRallyTriggerInfo
{
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
	// Settings for triggering a rally
	RallyTriggerSettings(`DIFFICULTY_Normal)		={(RallyChance=0.00, Cooldown=15.0, SelfTakenDamageModifier=0.10, SelfDealtDamageModifier=2.50)}
	RallyTriggerSettings(`DIFFICULTY_Hard)			={(RallyChance=0.00, Cooldown=15.0, SelfTakenDamageModifier=0.10, SelfDealtDamageModifier=2.50)}
	RallyTriggerSettings(`DIFFICULTY_Suicidal)		={(RallyChance=0.70, Cooldown=15.0, SelfTakenDamageModifier=0.10, SelfDealtDamageModifier=2.50)}
	RallyTriggerSettings(`DIFFICULTY_HellOnEarth)	={(RallyChance=0.80, Cooldown=15.0, SelfTakenDamageModifier=0.10, SelfDealtDamageModifier=2.50)}
}