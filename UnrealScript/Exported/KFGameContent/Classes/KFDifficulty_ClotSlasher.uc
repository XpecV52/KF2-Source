//=============================================================================
// KFDifficulty_ClotSlasher
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_ClotSlasher extends KFMonsterDifficultyInfo
	abstract;

defaultproperties
{
   Normal=(HealthMod=0.750000,HeadHealthMod=0.750000,EvadeOnDamageSettings=(Chance=0.100000,DamagedHealthPctToTrigger=0.010000),RallySettings=(bCanRally=False))
   Hard=(DamagedSprintChance=1.000000,EvadeOnDamageSettings=(Chance=0.400000,DamagedHealthPctToTrigger=0.010000),RallySettings=(bCanRally=False))
   Suicidal=(SprintChance=0.500000,DamagedSprintChance=1.000000,MovementSpeedMod=1.100000,EvadeOnDamageSettings=(Chance=1.000000,DamagedHealthPctToTrigger=0.010000),RallySettings=(bCauseSprint=True,TakenDamageModifier=0.500000,DealtDamageModifier=2.000000))
   HellOnEarth=(SprintChance=0.700000,DamagedSprintChance=1.000000,MovementSpeedMod=1.200000,EvadeOnDamageSettings=(Chance=1.000000,DamagedHealthPctToTrigger=0.010000),RallySettings=(bCauseSprint=True,TakenDamageModifier=0.500000,DealtDamageModifier=2.000000))
   RallySettings_Versus=(bCauseSprint=True)
   RallySettings_Player_Versus=(DealtDamageModifier=1.200000)
   ZedTimeSpeedScale_Versus=0.250000
   ZedTimeSpeedScale_Player_Versus=0.750000
   Name="Default__KFDifficulty_ClotSlasher"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
