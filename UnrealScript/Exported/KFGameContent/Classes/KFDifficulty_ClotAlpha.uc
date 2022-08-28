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

defaultproperties
{
   Normal=(HealthMod=0.750000,HeadHealthMod=0.750000,RallySettings=(bCanRally=False))
   Hard=(DamagedSprintChance=0.700000,RallySettings=(bCanRally=False))
   Suicidal=(SprintChance=0.500000,DamagedSprintChance=1.000000,RallySettings=(bCauseSprint=True,TakenDamageModifier=0.500000,DealtDamageModifier=2.000000))
   HellOnEarth=(SprintChance=0.850000,DamagedSprintChance=1.000000,RallySettings=(bCauseSprint=True,TakenDamageModifier=0.500000,DealtDamageModifier=2.000000))
   RallySettings_Versus=(bCauseSprint=True)
   RallySettings_Player_Versus=(DealtDamageModifier=1.500000)
   ChanceToSpawnAsSpecial(0)=0.000000
   ChanceToSpawnAsSpecial(1)=0.000000
   ChanceToSpawnAsSpecial(2)=0.250000
   ChanceToSpawnAsSpecial(3)=0.350000
   Name="Default__KFDifficulty_ClotAlpha"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
