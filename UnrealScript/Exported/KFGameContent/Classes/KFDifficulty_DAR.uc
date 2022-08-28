//=============================================================================
// KFDifficulty_DAR
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_DAR extends KFMonsterDifficultyInfo
	dependsOn(KFPawn_ZedDAR)
	abstract;

defaultproperties
{
   Normal=(HealthMod=0.750000,HeadHealthMod=0.750000,EvadeOnDamageSettings=(Chance=0.100000,DamagedHealthPctToTrigger=0.010000),RallySettings=(bCanRally=False))
   Hard=(DamagedSprintChance=0.010000,DamageMod=0.750000,EvadeOnDamageSettings=(Chance=0.400000,DamagedHealthPctToTrigger=0.010000),RallySettings=(bCanRally=False))
   Suicidal=(SprintChance=0.850000,DamagedSprintChance=1.000000,MovementSpeedMod=1.100000,EvadeOnDamageSettings=(Chance=1.000000,DamagedHealthPctToTrigger=0.010000),RallySettings=(TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   HellOnEarth=(SprintChance=1.000000,DamagedSprintChance=1.000000,MovementSpeedMod=1.200000,EvadeOnDamageSettings=(Chance=1.000000,DamagedHealthPctToTrigger=0.010000),RallySettings=(bCauseSprint=True,TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   Name="Default__KFDifficulty_DAR"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
