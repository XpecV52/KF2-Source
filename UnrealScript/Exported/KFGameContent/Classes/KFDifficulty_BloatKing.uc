//=============================================================================
// KFDifficulty_BloatKing
//=============================================================================
// Bloat King variant of the Bloat difficulty settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_BloatKing extends KFDifficulty_Bloat
    abstract;

defaultproperties
{
   Normal=(HealthMod=0.650000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.700000,SoloDamageMod=0.350000)
   Hard=(HealthMod=0.800000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.850000,SoloDamageMod=0.420000)
   Suicidal=(HealthMod=0.900000,HeadHealthMod=1.000000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=1.150000,SoloDamageMod=0.410000,BlockSettings=(Chance=0.850000,SoloChanceMultiplier=1.000000),RallySettings=(DealtDamageModifier=1.100000))
   HellOnEarth=(HealthMod=1.050000,HeadHealthMod=1.050000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=1.200000,SoloDamageMod=0.520000,BlockSettings=(SoloChanceMultiplier=1.000000),RallySettings=(DealtDamageModifier=1.200000))
   NumPlayersScale_BodyHealth=0.400000
   NumPlayersScale_HeadHealth=0.240000
   Name="Default__KFDifficulty_BloatKing"
   ObjectArchetype=KFDifficulty_Bloat'kfgamecontent.Default__KFDifficulty_Bloat'
}
