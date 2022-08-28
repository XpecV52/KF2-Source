/*******************************************************************************
 * KFDifficulty_DAR generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDifficulty_DAR extends KFMonsterDifficultyInfo
    abstract;

defaultproperties
{
    Normal=(HealthMod=0.75,HeadHealthMod=0.75,EvadeOnDamageSettings=(Chance=0.1,DamagedHealthPctToTrigger=0.01),RallySettings=(bCanRally=false))
    Hard=(DamagedSprintChance=0.01,DamageMod=0.75,EvadeOnDamageSettings=(Chance=0.4,DamagedHealthPctToTrigger=0.01),RallySettings=(bCanRally=false))
    Suicidal=(SprintChance=0.85,DamagedSprintChance=1,MovementSpeedMod=1.1,EvadeOnDamageSettings=(Chance=1,DamagedHealthPctToTrigger=0.01),RallySettings=(TakenDamageModifier=0.9,DealtDamageModifier=1.2))
    HellOnEarth=(SprintChance=1,DamagedSprintChance=1,MovementSpeedMod=1.2,EvadeOnDamageSettings=(Chance=1,DamagedHealthPctToTrigger=0.01),RallySettings=(bCauseSprint=true,TakenDamageModifier=0.9,DealtDamageModifier=1.2))
}