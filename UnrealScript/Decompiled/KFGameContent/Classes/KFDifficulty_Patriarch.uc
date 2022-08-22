/*******************************************************************************
 * KFDifficulty_Patriarch generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDifficulty_Patriarch extends KFMonsterDifficultyInfo
    abstract;

defaultproperties
{
    Normal=(SprintChance=1,DamagedSprintChance=1,DamageMod=0.65,SoloDamageMod=0.2,RallySettings=(bCanRally=false))
    Hard=(HealthMod=1.37,SprintChance=1,DamagedSprintChance=1,DamageMod=0.8,SoloDamageMod=0.25,RallySettings=(bCanRally=false))
    Suicidal=(HealthMod=1.4,HeadHealthMod=1.35,SprintChance=1,DamagedSprintChance=1,DamageMod=1.4,SoloDamageMod=0.35,BlockSettings=(Chance=0.85,Duration=1.25,MaxBlocks=5,Cooldown=3.5,DamagedHealthPctToTrigger=0.1,MeleeDamageModifier=0.9,DamageModifier=0.9,AfflictionModifier=0.2,SoloChanceMultiplier=1),RallySettings=(bCanRally=false))
    HellOnEarth=(HealthMod=1.55,HeadHealthMod=1.55,SprintChance=1,DamagedSprintChance=1,DamageMod=1.23,SoloDamageMod=0.5,BlockSettings=(Chance=0.85,Duration=1.25,MaxBlocks=6,Cooldown=3.5,DamagedHealthPctToTrigger=0.1,MeleeDamageModifier=0.9,DamageModifier=0.9,AfflictionModifier=0.2,SoloChanceMultiplier=1),RallySettings=(bCanRally=false))
    NumPlayersScale_BodyHealth=0.5
    NumPlayersScale_HeadHealth=0.3
    NumPlayersScale_BodyHealth_Versus=0.5
    NumPlayersScale_HeadHealth_Versus=0.3
}