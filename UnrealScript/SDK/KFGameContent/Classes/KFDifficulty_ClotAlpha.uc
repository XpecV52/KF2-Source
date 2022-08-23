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

/** Chances, by difficulty, to spawn as a special crawler */
var array<float> ChanceToSpawnAsSpecial;

/** Chances, by difficulty, to spawn as a special gorefast */
static function float GetSpecialAlphaChance( KFGameReplicationInfo KFGRI )
{
	if( KFGRI.bVersusGame )
	{
		return 0.f;
	}
	
`if(`notdefined(ShippingPC))
	if( default.bForceSpecialSpawn )
		return 1.f;
	else
`endif
	return default.ChanceToSpawnAsSpecial[KFGRI.GameDifficulty];
}

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

	// Special Alpha spawn chances
	ChanceToSpawnAsSpecial(`DIFFICULTY_Normal)		=0.0
	ChanceToSpawnAsSpecial(`DIFFICULTY_Hard)		=0.0
	ChanceToSpawnAsSpecial(`DIFFICULTY_Suicidal)	=0.25
	ChanceToSpawnAsSpecial(`DIFFICULTY_HellOnEarth)	=0.35
}