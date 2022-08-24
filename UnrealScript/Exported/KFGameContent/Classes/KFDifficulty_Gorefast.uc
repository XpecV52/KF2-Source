//=============================================================================
// KFDifficulty_Gorefast
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_Gorefast extends KFMonsterDifficultyInfo
	abstract;

/** Chances, by difficulty, to spawn as a special gorefast */
var array<float> ChanceToSpawnAsSpecial;

static function float GetSpecialGorefastChance( KFGameReplicationInfo KFGRI )
{
	if( KFGRI.bVersusGame )
	{
		return 0.f;
	}
	





	return default.ChanceToSpawnAsSpecial[KFGRI.GameDifficulty];
}

defaultproperties
{
   ChanceToSpawnAsSpecial(0)=0.100000
   ChanceToSpawnAsSpecial(1)=0.250000
   ChanceToSpawnAsSpecial(2)=0.350000
   ChanceToSpawnAsSpecial(3)=0.450000
   Normal=(HealthMod=0.750000,HeadHealthMod=0.750000,SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.400000,SoloDamageMod=0.400000,BlockSettings=(Chance=0.200000,Duration=1.000000,MaxBlocks=4.000000,Cooldown=1.000000,DamagedHealthPctToTrigger=0.010000,MeleeDamageModifier=0.800000,DamageModifier=0.800000,AfflictionModifier=0.200000,SoloChanceMultiplier=0.200000),RallySettings=(bCanRally=False))
   Hard=(SprintChance=1.000000,DamagedSprintChance=1.000000,DamageMod=0.750000,SoloDamageMod=0.800000,BlockSettings=(Chance=0.500000,Duration=1.000000,MaxBlocks=4.000000,Cooldown=1.000000,DamagedHealthPctToTrigger=0.010000,MeleeDamageModifier=0.800000,DamageModifier=0.800000,AfflictionModifier=0.200000,SoloChanceMultiplier=0.300000),RallySettings=(bCanRally=False))
   Suicidal=(SprintChance=1.000000,DamagedSprintChance=1.000000,SoloDamageMod=0.650000,BlockSettings=(Chance=0.750000,Duration=1.000000,MaxBlocks=4.000000,Cooldown=1.000000,DamagedHealthPctToTrigger=0.010000,MeleeDamageModifier=0.800000,DamageModifier=0.800000,AfflictionModifier=0.200000,SoloChanceMultiplier=1.000000),RallySettings=(TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   HellOnEarth=(SprintChance=1.000000,DamagedSprintChance=1.000000,SoloDamageMod=0.650000,BlockSettings=(Chance=0.850000,Duration=1.000000,MaxBlocks=5.000000,Cooldown=1.000000,DamagedHealthPctToTrigger=0.010000,MeleeDamageModifier=0.800000,DamageModifier=0.800000,AfflictionModifier=0.200000,SoloChanceMultiplier=1.000000),RallySettings=(bCauseSprint=True,TakenDamageModifier=0.900000,DealtDamageModifier=1.200000))
   BlockSettings_Player_Versus=(MeleeDamageModifier=0.250000,DamageModifier=0.010000)
   RallySettings_Versus=(bCauseSprint=True)
   RallySettings_Player_Versus=(DealtDamageModifier=1.200000)
   Name="Default__KFDifficulty_Gorefast"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
