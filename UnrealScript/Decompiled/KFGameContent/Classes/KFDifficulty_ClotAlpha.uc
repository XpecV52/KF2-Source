/*******************************************************************************
 * KFDifficulty_ClotAlpha generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDifficulty_ClotAlpha extends KFMonsterDifficultyInfo
    abstract;

defaultproperties
{
    Normal=(HealthMod=0.75,HeadHealthMod=0.75,RallySettings=(bCanRally=false))
    Hard=(DamagedSprintChance=0.7,RallySettings=(bCanRally=false))
    Suicidal=(SprintChance=0.5,DamagedSprintChance=1,RallySettings=(bCauseSprint=true,TakenDamageModifier=0.5,DealtDamageModifier=2))
    HellOnEarth=(SprintChance=0.85,DamagedSprintChance=1,RallySettings=(bCauseSprint=true,TakenDamageModifier=0.5,DealtDamageModifier=2))
    RallySettings_Versus=(bCauseSprint=true)
    RallySettings_Player_Versus=(DealtDamageModifier=1.5)
    ChanceToSpawnAsSpecial=/* Array type was not detected. */
}