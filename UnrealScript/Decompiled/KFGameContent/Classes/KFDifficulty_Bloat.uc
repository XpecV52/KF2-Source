/*******************************************************************************
 * KFDifficulty_Bloat generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDifficulty_Bloat extends KFMonsterDifficultyInfo
    abstract;

var array<byte> PukeMinesToSpawnOnDeathByDifficulty;
var byte PukeMinesToSpawnOnDeath_Versus;
var byte PukeMinesToSpawnOnDeath_Player_Versus;

static function byte GetPukeMinesToSpawnOnDeath(KFPawn_ZedBloat BloatPawn, GameInfo GI)
{
    if(BloatPawn.bVersusZed)
    {
        return default.PukeMinesToSpawnOnDeath_Player_Versus;
    }
    if(KFGameInfo_VersusSurvival(GI) != none)
    {
        return default.PukeMinesToSpawnOnDeath_Versus;
    }
    return default.PukeMinesToSpawnOnDeathByDifficulty[GI.GetModifiedGameDifficulty()];
}

defaultproperties
{
    PukeMinesToSpawnOnDeathByDifficulty(0)=
/* Exception thrown while deserializing PukeMinesToSpawnOnDeathByDifficulty
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.UnrealStreamImplementations.ReadName(IUnrealStream stream)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    PukeMinesToSpawnOnDeathByDifficulty(1)=.0_2010
    PukeMinesToSpawnOnDeathByDifficulty(2)=.0
    PukeMinesToSpawnOnDeathByDifficulty(3)=.0_9110
    PukeMinesToSpawnOnDeath_Player_Versus=3
    Normal=(HealthMod=0.75,HeadHealthMod=0.75,DamageMod=0.4,SoloDamageMod=0.3,BlockSettings=(Duration=1.25,MaxBlocks=3,Cooldown=3.5,DamagedHealthPctToTrigger=0.1,MeleeDamageModifier=0.3,DamageModifier=0.3,AfflictionModifier=0.2,SoloChanceMultiplier=0.1),RallySettings=(bCanRally=false))
    Hard=(DamageMod=0.75,SoloDamageMod=0.75,BlockSettings=(Chance=0.1,Duration=1.25,MaxBlocks=4,Cooldown=3.5,DamagedHealthPctToTrigger=0.1,MeleeDamageModifier=0.9,DamageModifier=0.9,AfflictionModifier=0.2,SoloChanceMultiplier=0.1),RallySettings=(bCanRally=false))
    Suicidal=(HealthMod=1.2,HeadHealthMod=1.05,SprintChance=0.1,DamagedSprintChance=0.1,SoloDamageMod=0.75,BlockSettings=(Chance=0.65,Duration=1.25,MaxBlocks=5,Cooldown=3.5,DamagedHealthPctToTrigger=0.1,MeleeDamageModifier=0.9,DamageModifier=0.9,AfflictionModifier=0.2,SoloChanceMultiplier=0.1),RallySettings=(bCauseSprint=true,TakenDamageModifier=0.5,DealtDamageModifier=1.5))
    HellOnEarth=(HealthMod=1.3,HeadHealthMod=1.1,SprintChance=0.3,DamagedSprintChance=0.5,DamageMod=1.5,SoloDamageMod=0.75,BlockSettings=(Chance=0.85,Duration=1.25,MaxBlocks=6,Cooldown=3.5,DamagedHealthPctToTrigger=0.1,MeleeDamageModifier=0.9,DamageModifier=0.9,AfflictionModifier=0.2,SoloChanceMultiplier=0.2),RallySettings=(bCauseSprint=true,TakenDamageModifier=0.5,DealtDamageModifier=1.5))
    BlockSettings_Player_Versus=(MeleeDamageModifier=0.3,DamageModifier=0.3)
    RallySettings_Versus=(bCauseSprint=true)
    RallySettings_Player_Versus=(DealtDamageModifier=1.2)
}