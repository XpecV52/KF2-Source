/*******************************************************************************
 * KFDifficulty_Husk generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDifficulty_Husk extends KFMonsterDifficultyInfo
    abstract;

var array<sHuskFireballSettings> FireballSettings;
var sHuskFireballSettings FireballSettings_Versus;

static function sHuskFireballSettings GetFireballSettings(KFPawn_ZedHusk HuskPawn, KFGameReplicationInfo KFGRI)
{
    local sHuskFireballSettings DefaultFireballSettings;

    if(KFGRI.bVersusGame)
    {
        if(!HuskPawn.bVersusZed)
        {
            return default.FireballSettings_Versus;            
        }
        else
        {
            DefaultFireballSettings.bSpawnGroundFire = true;
            return DefaultFireballSettings;
        }
    }
    return default.FireballSettings[KFGRI.GameDifficulty];
}

defaultproperties
{
    FireballSettings(0)=(bSpawnGroundFire=false,ExplosionMomentum=50000)
    FireballSettings(1)=(bSpawnGroundFire=false,ExplosionMomentum=55000)
    FireballSettings(2)=(bSpawnGroundFire=true,ExplosionMomentum=60000)
    FireballSettings(3)=(bSpawnGroundFire=true,ExplosionMomentum=65000)
    FireballSettings_Versus=(bSpawnGroundFire=false,ExplosionMomentum=50000)
    Normal=(HealthMod=0.75,HeadHealthMod=0.75,RallySettings=(bCanRally=false))
    Hard=(RallySettings=(bCanRally=false))
    Suicidal=(DamagedSprintChance=0.5,RallySettings=(TakenDamageModifier=0.9,DealtDamageModifier=1.2))
    HellOnEarth=(HealthMod=1.3,HeadHealthMod=1.1,SprintChance=0.75,DamagedSprintChance=1,DamageMod=1.5,RallySettings=(bCauseSprint=true,TakenDamageModifier=0.9,DealtDamageModifier=1.2))
    RallySettings_Versus=(bCauseSprint=true)
    RallySettings_Player_Versus=(DealtDamageModifier=1.2)
}