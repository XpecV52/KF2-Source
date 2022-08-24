//=============================================================================
// KFDifficulty_BloatKingSubspawn
//=============================================================================
// Poop monster difficulty
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_BloatKingSubspawn extends KFMonsterDifficultyInfo
	abstract;

defaultproperties
{
   Normal=(HealthMod=0.350000,HeadHealthMod=0.500000,DamageMod=0.200000,EvadeOnDamageSettings=(Chance=0.100000,DamagedHealthPctToTrigger=0.010000),RallySettings=(bCanRally=False))
   Hard=(HealthMod=0.950000,DamagedSprintChance=0.010000,DamageMod=0.750000,MovementSpeedMod=1.100000,EvadeOnDamageSettings=(Chance=0.400000,DamagedHealthPctToTrigger=0.010000),RallySettings=(bCanRally=False))
   Suicidal=(SprintChance=0.850000,DamagedSprintChance=1.000000,MovementSpeedMod=1.250000,EvadeOnDamageSettings=(Chance=1.000000,DamagedHealthPctToTrigger=0.010000),RallySettings=(TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   HellOnEarth=(SprintChance=1.000000,DamagedSprintChance=1.000000,MovementSpeedMod=1.250000,EvadeOnDamageSettings=(Chance=1.000000,DamagedHealthPctToTrigger=0.010000),RallySettings=(bCauseSprint=True,TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   RallySettings_Versus=(bCauseSprint=True)
   RallySettings_Player_Versus=(DealtDamageModifier=1.200000)
   Name="Default__KFDifficulty_BloatKingSubspawn"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
