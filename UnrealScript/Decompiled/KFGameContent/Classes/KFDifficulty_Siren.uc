/*******************************************************************************
 * KFDifficulty_Siren generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDifficulty_Siren extends KFMonsterDifficultyInfo
    abstract;

defaultproperties
{
    Normal=(HealthMod=0.75,HeadHealthMod=0.75,SoloDamageMod=0.5,RallySettings=(bCanRally=false))
    Hard=(DamageMod=0.75,SoloDamageMod=0.65,RallySettings=(bCanRally=false))
    Suicidal=(HealthMod=1.2,DamagedSprintChance=0.05,SoloDamageMod=0.65,RallySettings=(TakenDamageModifier=0.9,DealtDamageModifier=1.2))
    HellOnEarth=(HealthMod=1.3,HeadHealthMod=1.1,DamagedSprintChance=0.1,DamageMod=1.5,SoloDamageMod=0.75,RallySettings=(bCauseSprint=true,TakenDamageModifier=0.9,DealtDamageModifier=1.2))
    RallySettings_Versus=(bCauseSprint=true)
    RallySettings_Player_Versus=(DealtDamageModifier=1.2)
}