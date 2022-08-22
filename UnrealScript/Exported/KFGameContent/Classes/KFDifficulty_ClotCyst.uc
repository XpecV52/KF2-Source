//=============================================================================
// KFDifficulty_ClotCyst
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_ClotCyst extends KFMonsterDifficultyInfo
	abstract;

defaultproperties
{
   Normal=(HealthMod=0.750000,HeadHealthMod=0.750000,RallySettings=(bCanRally=False))
   Hard=(DamagedSprintChance=0.010000,RallySettings=(bCanRally=False))
   Suicidal=(SprintChance=0.050000,DamagedSprintChance=1.000000,RallySettings=(bCauseSprint=True,TakenDamageModifier=0.500000,DealtDamageModifier=2.000000))
   HellOnEarth=(SprintChance=0.400000,DamagedSprintChance=0.800000,RallySettings=(bCauseSprint=True,TakenDamageModifier=0.500000,DealtDamageModifier=2.000000))
   RallySettings_Versus=(bCauseSprint=True)
   RallySettings_Player_Versus=(DealtDamageModifier=1.200000)
   Name="Default__KFDifficulty_ClotCyst"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
