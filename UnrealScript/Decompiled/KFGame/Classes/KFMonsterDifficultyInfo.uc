/*******************************************************************************
 * KFMonsterDifficultyInfo generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFMonsterDifficultyInfo extends Object
    abstract;

struct native ZedDifficultySettings
{
    /** The individual health modifier for this zed type */
    var() float HealthMod;
    /** The individual head health modifier for this zed type */
    var() float HeadHealthMod;
    /** The chance that a zed can use sprinting at a specific difficulty */
    var() float SprintChance;
    /** The chance that a zed will start sprinting when damaged */
    var() float DamagedSprintChance;
    /** A per zed damage mod configurable by difficulty */
    var() float DamageMod;
    /** A per zed damage mod configurable by difficulty when playing solo/offline */
    var() float SoloDamageMod;
    /** Per-zed zed time speed scale. 0 = disabled */
    var() float ZedTimeSpeedScale;
    /** Movement speed modifier for each difficulty */
    var() float MovementSpeedMod;
    /** Per-zed evade on damage settings. Triggers evades based on damage taken as a percentage of max health */
    var() sEvadeOnDamageInfo EvadeOnDamageSettings;
    /** Per-zed block settings */
    var() sBlockInfo BlockSettings;
    /** Per-zed rally settings */
    var() sRallyInfo RallySettings;

    structdefaultproperties
    {
        HealthMod=1
        HeadHealthMod=1
        SprintChance=0
        DamagedSprintChance=0
        DamageMod=1
        SoloDamageMod=1
        ZedTimeSpeedScale=0
        MovementSpeedMod=1
        EvadeOnDamageSettings=(Chance=0,DamagedHealthPctToTrigger=0,ForcedEvadeChance=(FL=0,FR=0))
        BlockSettings=(Chance=0,Duration=0,MaxBlocks=0,Cooldown=0,DamagedHealthPctToTrigger=0,MeleeDamageModifier=1,DamageModifier=1,AfflictionModifier=1,SoloChanceMultiplier=0)
        RallySettings=(bCanRally=true,bCauseSprint=false,RallyBuffTime=10,TakenDamageModifier=1,DealtDamageModifier=1)
    }
};

var const ZedDifficultySettings Normal;
var const ZedDifficultySettings Hard;
var const ZedDifficultySettings Suicidal;
var const ZedDifficultySettings HellOnEarth;
var const float NumPlayersScale_BodyHealth;
var const float NumPlayersScale_HeadHealth;
var const float NumPlayersScale_BodyHealth_Versus;
var const float NumPlayersScale_HeadHealth_Versus;
var const sEvadeOnDamageInfo EvadeOnDamageSettings_Versus;
var const sBlockInfo BlockSettings_Versus;
var const sBlockInfo BlockSettings_Player_Versus;
var const sRallyInfo RallySettings_Versus;
var const sRallyInfo RallySettings_Player_Versus;
var const float ZedTimeSpeedScale_Versus;
var const float ZedTimeSpeedScale_Player_Versus;

static function sEvadeOnDamageInfo GetEvadeOnDamageSettings(KFPawn_Monster MonsterPawn, KFGameReplicationInfo KFGRI)
{
    local byte Difficulty;
    local sEvadeOnDamageInfo DefaultEvadeSettings;

    if(KFGRI.bVersusGame)
    {
        if(!MonsterPawn.bVersusZed)
        {
            return default.EvadeOnDamageSettings_Versus;            
        }
        else
        {
            DefaultEvadeSettings.Chance = 0;
            return DefaultEvadeSettings;
        }
    }
    Difficulty = KFGRI.GameDifficulty;
    if(float(Difficulty) >= 3)
    {
        return default.HellOnEarth.EvadeOnDamageSettings;        
    }
    else
    {
        if(float(Difficulty) >= 2)
        {
            return default.Suicidal.EvadeOnDamageSettings;            
        }
        else
        {
            if(float(Difficulty) >= 1)
            {
                return default.Hard.EvadeOnDamageSettings;
            }
        }
    }
    return default.Normal.EvadeOnDamageSettings;
}

static function sRallyInfo GetRallySettings(KFPawn_Monster MonsterPawn, KFGameReplicationInfo KFGRI)
{
    local byte Difficulty;

    if(KFGRI.bVersusGame)
    {
        if(MonsterPawn.bVersusZed)
        {
            return default.RallySettings_Player_Versus;            
        }
        else
        {
            return default.RallySettings_Versus;
        }
    }
    Difficulty = KFGRI.GameDifficulty;
    if(float(Difficulty) >= 3)
    {
        return default.HellOnEarth.RallySettings;        
    }
    else
    {
        if(float(Difficulty) >= 2)
        {
            return default.Suicidal.RallySettings;            
        }
        else
        {
            if(float(Difficulty) >= 1)
            {
                return default.Hard.RallySettings;
            }
        }
    }
    return default.Normal.RallySettings;
}

static function sBlockInfo GetBlockSettings(KFPawn_Monster MonsterPawn, KFGameReplicationInfo KFGRI)
{
    local byte Difficulty;

    if(KFGRI.bVersusGame)
    {
        if(MonsterPawn.bVersusZed)
        {
            return default.BlockSettings_Player_Versus;            
        }
        else
        {
            return default.BlockSettings_Versus;
        }
    }
    Difficulty = KFGRI.GameDifficulty;
    if(float(Difficulty) >= 3)
    {
        return default.HellOnEarth.BlockSettings;        
    }
    else
    {
        if(float(Difficulty) >= 2)
        {
            return default.Suicidal.BlockSettings;            
        }
        else
        {
            if(float(Difficulty) >= 1)
            {
                return default.Hard.BlockSettings;
            }
        }
    }
    return default.Normal.BlockSettings;
}

static function float GetZedTimeSpeedScale(KFPawn_Monster MonsterPawn, KFGameReplicationInfo KFGRI)
{
    local byte Difficulty;

    if(KFGRI.bVersusGame)
    {
        if(MonsterPawn.bVersusZed)
        {
            return default.ZedTimeSpeedScale_Player_Versus;            
        }
        else
        {
            return default.ZedTimeSpeedScale_Versus;
        }
    }
    Difficulty = KFGRI.GameDifficulty;
    if(float(Difficulty) >= 3)
    {
        return default.HellOnEarth.ZedTimeSpeedScale;        
    }
    else
    {
        if(float(Difficulty) >= 2)
        {
            return default.Suicidal.ZedTimeSpeedScale;            
        }
        else
        {
            if(float(Difficulty) >= 1)
            {
                return default.Hard.ZedTimeSpeedScale;
            }
        }
    }
    return default.Normal.ZedTimeSpeedScale;
}

static function float GetMovementSpeedMod(KFPawn_Monster P, float GameDifficulty)
{
    if(GameDifficulty >= 3)
    {
        return default.HellOnEarth.MovementSpeedMod;        
    }
    else
    {
        if(GameDifficulty >= 2)
        {
            return default.Suicidal.MovementSpeedMod;            
        }
        else
        {
            if(GameDifficulty >= 1)
            {
                return default.Hard.MovementSpeedMod;
            }
        }
    }
    return default.Normal.MovementSpeedMod;
}

defaultproperties
{
    Normal=(HealthMod=1,HeadHealthMod=1,SprintChance=0,DamagedSprintChance=0,DamageMod=0.5,SoloDamageMod=1,ZedTimeSpeedScale=0,MovementSpeedMod=1,EvadeOnDamageSettings=(Chance=0,DamagedHealthPctToTrigger=0,ForcedEvadeChance=(FL=0,FR=0)),BlockSettings=(Chance=0,Duration=0,MaxBlocks=0,Cooldown=0,DamagedHealthPctToTrigger=0,MeleeDamageModifier=1,DamageModifier=1,AfflictionModifier=1,SoloChanceMultiplier=0),RallySettings=(bCanRally=true,bCauseSprint=false,RallyBuffTime=10,TakenDamageModifier=1,DealtDamageModifier=1))
    Hard=(HealthMod=1,HeadHealthMod=1,SprintChance=0,DamagedSprintChance=0,DamageMod=1,SoloDamageMod=1,ZedTimeSpeedScale=0,MovementSpeedMod=1,EvadeOnDamageSettings=(Chance=0,DamagedHealthPctToTrigger=0,ForcedEvadeChance=(FL=0,FR=0)),BlockSettings=(Chance=0,Duration=0,MaxBlocks=0,Cooldown=0,DamagedHealthPctToTrigger=0,MeleeDamageModifier=1,DamageModifier=1,AfflictionModifier=1,SoloChanceMultiplier=0),RallySettings=(bCanRally=true,bCauseSprint=false,RallyBuffTime=10,TakenDamageModifier=1,DealtDamageModifier=1))
    Suicidal=(HealthMod=1,HeadHealthMod=1,SprintChance=0,DamagedSprintChance=0,DamageMod=1.25,SoloDamageMod=1,ZedTimeSpeedScale=0,MovementSpeedMod=1,EvadeOnDamageSettings=(Chance=0,DamagedHealthPctToTrigger=0,ForcedEvadeChance=(FL=0,FR=0)),BlockSettings=(Chance=0,Duration=0,MaxBlocks=0,Cooldown=0,DamagedHealthPctToTrigger=0,MeleeDamageModifier=1,DamageModifier=1,AfflictionModifier=1,SoloChanceMultiplier=0),RallySettings=(bCanRally=true,bCauseSprint=false,RallyBuffTime=10,TakenDamageModifier=1,DealtDamageModifier=1))
    HellOnEarth=(HealthMod=1,HeadHealthMod=1,SprintChance=0,DamagedSprintChance=0,DamageMod=1.75,SoloDamageMod=1,ZedTimeSpeedScale=0,MovementSpeedMod=1,EvadeOnDamageSettings=(Chance=0,DamagedHealthPctToTrigger=0,ForcedEvadeChance=(FL=0,FR=0)),BlockSettings=(Chance=0,Duration=0,MaxBlocks=0,Cooldown=0,DamagedHealthPctToTrigger=0,MeleeDamageModifier=1,DamageModifier=1,AfflictionModifier=1,SoloChanceMultiplier=0),RallySettings=(bCanRally=true,bCauseSprint=false,RallyBuffTime=10,TakenDamageModifier=1,DealtDamageModifier=1))
    BlockSettings_Versus=(Chance=0,Duration=0,MaxBlocks=0,Cooldown=0,DamagedHealthPctToTrigger=0,MeleeDamageModifier=1,DamageModifier=1,AfflictionModifier=1,SoloChanceMultiplier=0)
    BlockSettings_Player_Versus=(Chance=0,Duration=0,MaxBlocks=0,Cooldown=0,DamagedHealthPctToTrigger=0,MeleeDamageModifier=1,DamageModifier=1,AfflictionModifier=1,SoloChanceMultiplier=0)
    RallySettings_Versus=(bCanRally=true,bCauseSprint=false,RallyBuffTime=10,TakenDamageModifier=1,DealtDamageModifier=1)
    RallySettings_Player_Versus=(bCanRally=true,bCauseSprint=false,RallyBuffTime=10,TakenDamageModifier=1,DealtDamageModifier=1)
}