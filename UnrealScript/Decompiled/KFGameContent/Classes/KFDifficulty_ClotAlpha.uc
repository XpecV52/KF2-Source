/*******************************************************************************
 * KFDifficulty_ClotAlpha generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDifficulty_ClotAlpha extends KFMonsterDifficultyInfo
    abstract;

var array<float> ChanceToSpawnAsSpecial;

static function float GetSpecialAlphaChance(KFGameReplicationInfo KFGRI)
{
    if(KFGRI.bVersusGame)
    {
        return 0;
    }
    return default.ChanceToSpawnAsSpecial[KFGRI.GameDifficulty];
}

defaultproperties
{
    ChanceToSpawnAsSpecial(0)=0
    ChanceToSpawnAsSpecial(1)=0
    ChanceToSpawnAsSpecial(2)=0.25
    ChanceToSpawnAsSpecial(3)=0.35
    Normal=(HealthMod=0.75,HeadHealthMod=0.75,RallySettings=(bCanRally=false))
    Hard=(DamagedSprintChance=0.05,RallySettings=(bCanRally=false))
    Suicidal=(SprintChance=0.05,DamagedSprintChance=1,RallySettings=(bCauseSprint=true,TakenDamageModifier=0.5,DealtDamageModifier=2))
    HellOnEarth=(SprintChance=0.75,DamagedSprintChance=1,RallySettings=(bCauseSprint=true,TakenDamageModifier=0.5,DealtDamageModifier=2))
    RallySettings_Versus=(bCauseSprint=true)
    RallySettings_Player_Versus=(DealtDamageModifier=1.5)
}