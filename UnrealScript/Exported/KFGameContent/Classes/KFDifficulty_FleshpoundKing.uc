//=============================================================================
// KFDifficulty_FleshpoundKing
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//  - Matt 'Squirrlz' Farber
//=============================================================================
class KFDifficulty_FleshpoundKing extends KFMonsterDifficultyInfo
	abstract;

/** Per-difficulty cooldown times for the chest beam */
var const protected array<float> ChestBeamCooldowns;

/** Returns the per-difficulty cooldown time */
static function float GetChestBeamCooldownTime( KFGameReplicationInfo KFGRI )
{
	return default.ChestBeamCooldowns[KFGRI.GameDifficulty];
}

defaultproperties
{
   ChestBeamCooldowns(0)=10.000000
   ChestBeamCooldowns(1)=9.000000
   ChestBeamCooldowns(2)=7.000000
   ChestBeamCooldowns(3)=5.000000
   Normal=(HealthMod=0.750000,HeadHealthMod=0.750000,DamageMod=0.310000,SoloDamageMod=0.500000,BlockSettings=(Duration=1.250000,MaxBlocks=2.000000,Cooldown=4.500000,DamagedHealthPctToTrigger=0.050000,MeleeDamageModifier=0.900000,DamageModifier=0.900000,AfflictionModifier=0.200000,SoloChanceMultiplier=0.100000),RallySettings=(bCanRally=False))
   Hard=(DamageMod=0.650000,SoloDamageMod=0.500000,BlockSettings=(Chance=0.010000,Duration=1.250000,MaxBlocks=3.000000,Cooldown=4.500000,DamagedHealthPctToTrigger=0.050000,MeleeDamageModifier=0.900000,DamageModifier=0.900000,AfflictionModifier=0.200000,SoloChanceMultiplier=0.100000),RallySettings=(bCanRally=False))
   Suicidal=(HealthMod=1.100000,HeadHealthMod=1.050000,DamageMod=1.125000,SoloDamageMod=0.500000,BlockSettings=(Chance=0.200000,Duration=1.250000,MaxBlocks=4.000000,Cooldown=6.500000,DamagedHealthPctToTrigger=0.050000,MeleeDamageModifier=0.900000,DamageModifier=0.900000,AfflictionModifier=0.200000,SoloChanceMultiplier=0.100000),RallySettings=(TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   HellOnEarth=(HealthMod=1.200000,HeadHealthMod=1.100000,DamageMod=1.250000,SoloDamageMod=0.650000,BlockSettings=(Chance=0.300000,Duration=1.250000,MaxBlocks=5.000000,Cooldown=6.500000,DamagedHealthPctToTrigger=0.050000,MeleeDamageModifier=0.900000,DamageModifier=0.900000,AfflictionModifier=0.200000,SoloChanceMultiplier=0.200000),RallySettings=(TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   NumPlayersScale_BodyHealth=0.390000
   NumPlayersScale_HeadHealth=0.280000
   BlockSettings_Player_Versus=(MeleeDamageModifier=0.700000,DamageModifier=0.700000)
   RallySettings_Player_Versus=(DealtDamageModifier=1.200000)
   Name="Default__KFDifficulty_FleshpoundKing"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}