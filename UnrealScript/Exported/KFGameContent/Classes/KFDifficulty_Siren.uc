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
   Normal=(DamageMod=1.000000,SoloDamageMod=0.500000,RallySettings=(bCanRally=False))
   Hard=(SoloDamageMod=0.650000,RallySettings=(bCanRally=False))
   Suicidal=(DamagedSprintChance=0.050000,DamageMod=1.000000,SoloDamageMod=0.650000,RallySettings=(TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   HellOnEarth=(DamagedSprintChance=0.100000,DamageMod=1.000000,SoloDamageMod=0.750000,RallySettings=(bCauseSprint=True,TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   RallySettings_Versus=(bCauseSprint=True)
   RallySettings_Player_Versus=(DealtDamageModifier=1.200000)
   Name="Default__KFDifficulty_Siren"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
