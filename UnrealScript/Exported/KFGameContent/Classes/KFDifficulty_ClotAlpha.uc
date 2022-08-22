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
   RallyTriggerSettings(0)=(Cooldown=15.000000,SelfDealtDamageModifier=2.500000,SelfTakenDamageModifier=0.100000)
   RallyTriggerSettings(1)=(Cooldown=15.000000,SelfDealtDamageModifier=2.500000,SelfTakenDamageModifier=0.100000)
   RallyTriggerSettings(2)=(SpawnChance=0.250000,RallyChance=0.700000,Cooldown=15.000000,SelfDealtDamageModifier=2.500000,SelfTakenDamageModifier=0.100000)
   RallyTriggerSettings(3)=(SpawnChance=0.350000,RallyChance=0.800000,Cooldown=15.000000,SelfDealtDamageModifier=2.500000,SelfTakenDamageModifier=0.100000)
   Normal=(HealthMod=0.750000,HeadHealthMod=0.750000,RallySettings=(bCanRally=False))
   Hard=(DamagedSprintChance=0.050000,RallySettings=(bCanRally=False))
   Suicidal=(SprintChance=0.050000,DamagedSprintChance=1.000000,RallySettings=(bCauseSprint=True,TakenDamageModifier=0.500000,DealtDamageModifier=2.000000))
   HellOnEarth=(SprintChance=0.750000,DamagedSprintChance=1.000000,RallySettings=(bCauseSprint=True,TakenDamageModifier=0.500000,DealtDamageModifier=2.000000))
   RallySettings_Versus=(bCauseSprint=True)
   RallySettings_Player_Versus=(DealtDamageModifier=1.500000)
   Name="Default__KFDifficulty_ClotAlpha"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
