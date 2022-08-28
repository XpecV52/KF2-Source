//=============================================================================
// KFDifficulty_Bloat
//=============================================================================
// Per Zed, per difficulty balance settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDifficulty_Bloat extends KFMonsterDifficultyInfo
	abstract;

/** Number of puke mines to spawn when a bloat dies on a per-difficulty basis */
var array<byte> PukeMinesToSpawnOnDeathByDifficulty;

/** How many puke mines to spawn when an AI bloat dies in versus */
var byte PukeMinesToSpawnOnDeath_Versus;

/** How many puke mines to spawn when a player-controlled bloat dies in versus */
var byte PukeMinesToSpawnOnDeath_Player_Versus;

/** Gets the number of puke mines that the bloat should spawn when dying */
static function byte GetPukeMinesToSpawnOnDeath( KFPawn_ZedBloat BloatPawn, GameInfo GI)
{
	if( BloatPawn.bVersusZed )
	{
		return default.PukeMinesToSpawnOnDeath_Player_Versus;
	}
	if( KFGameInfo_VersusSurvival(GI) != none )
	{
		return default.PukeMinesToSpawnOnDeath_Versus;
	}
	return default.PukeMinesToSpawnOnDeathByDifficulty[GI.GetModifiedGameDifficulty()];
}

defaultproperties
{
   PukeMinesToSpawnOnDeathByDifficulty(0)=0
   PukeMinesToSpawnOnDeathByDifficulty(1)=1
   PukeMinesToSpawnOnDeathByDifficulty(2)=3
   PukeMinesToSpawnOnDeathByDifficulty(3)=3
   PukeMinesToSpawnOnDeath_Player_Versus=3
   Normal=(HealthMod=0.750000,HeadHealthMod=0.750000,DamageMod=0.400000,SoloDamageMod=0.300000,BlockSettings=(Duration=1.250000,MaxBlocks=3.000000,Cooldown=3.500000,DamagedHealthPctToTrigger=0.100000,MeleeDamageModifier=0.300000,DamageModifier=0.300000,AfflictionModifier=0.200000,SoloChanceMultiplier=0.100000),RallySettings=(bCanRally=False))
   Hard=(DamageMod=0.750000,SoloDamageMod=0.750000,BlockSettings=(Chance=0.100000,Duration=1.250000,MaxBlocks=4.000000,Cooldown=3.500000,DamagedHealthPctToTrigger=0.100000,MeleeDamageModifier=0.900000,DamageModifier=0.900000,AfflictionModifier=0.200000,SoloChanceMultiplier=0.100000),RallySettings=(bCanRally=False))
   Suicidal=(HealthMod=1.200000,HeadHealthMod=1.050000,SprintChance=0.100000,DamagedSprintChance=0.100000,SoloDamageMod=0.750000,BlockSettings=(Chance=0.650000,Duration=1.250000,MaxBlocks=5.000000,Cooldown=3.500000,DamagedHealthPctToTrigger=0.100000,MeleeDamageModifier=0.900000,DamageModifier=0.900000,AfflictionModifier=0.200000,SoloChanceMultiplier=0.100000),RallySettings=(bCauseSprint=True,TakenDamageModifier=0.500000,DealtDamageModifier=1.500000))
   HellOnEarth=(HealthMod=1.300000,HeadHealthMod=1.100000,SprintChance=0.300000,DamagedSprintChance=0.500000,DamageMod=1.500000,SoloDamageMod=0.750000,BlockSettings=(Chance=0.850000,Duration=1.250000,MaxBlocks=6.000000,Cooldown=3.500000,DamagedHealthPctToTrigger=0.100000,MeleeDamageModifier=0.900000,DamageModifier=0.900000,AfflictionModifier=0.200000,SoloChanceMultiplier=0.200000),RallySettings=(bCauseSprint=True,TakenDamageModifier=0.500000,DealtDamageModifier=1.500000))
   BlockSettings_Player_Versus=(MeleeDamageModifier=0.300000,DamageModifier=0.300000)
   RallySettings_Versus=(bCauseSprint=True)
   RallySettings_Player_Versus=(DealtDamageModifier=1.200000)
   Name="Default__KFDifficulty_Bloat"
   ObjectArchetype=KFMonsterDifficultyInfo'KFGame.Default__KFMonsterDifficultyInfo'
}
