/*******************************************************************************
 * KFDifficultyInfo generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDifficultyInfo extends Object
    hidecategories(Object);

const OverMaxPlayers_MaxLerpedPlayers = 128.f;
const OverMaxPlayers_MaxHealthMod = 20.f;

struct NumPlayerMods
{
    /** Each index relates to the number of players in the game, it's value is the modifier */
    var() float PlayersMod[6];
    /** If we are over our standard max player count of 6, linearly scale up to ModCap value */
    var() float ModCap;

    structdefaultproperties
    {
        PlayersMod[0]=1
        PlayersMod[1]=1
        PlayersMod[2]=1
        PlayersMod[3]=1
        PlayersMod[4]=1
        PlayersMod[5]=1
        ModCap=2
    }
};

struct DifficultySettings
{
    /** How long trader time is */
    var() int TraderTime<ClampMin=0.0>;
    /** Multiplier for the total health of all zeds */
    var() float GlobalHealthMod<ClampMin=0.0>;
    /** Multiplier for the movement speed of a zed */
    var() float MovementSpeedMod<ClampMin=0.0>;
    /** Multiplier for the number of zeds in a wave */
    var() float WaveCountMod<ClampMin=0.0>;
    /** Multiplier for the dosh awarded upon killing a zed */
    var() float DoshKillMod<ClampMin=0.0>;
    /** The amount of dosh a player will start with the first time they spawn */
    var() int StartingDosh<ClampMin=0.0>;
    /** The amount of dosh a player will start with from respawning after dying */
    var() int RespawnDosh<ClampMin=0.0>;
    /** Modify the number of ammo pickups that will be active at once */
    var() float AmmoPickupsMod<ClampMin=0.0|ClampMax=1.0>;
    /** Modify the number of weapon pickups that will be active at once */
    var() float ItemPickupsMod<ClampMin=0.0|ClampMax=1.0>;
    /** The chance that a zed will perform a weak attack at this difficulty level */
    var() float WeakAttackChance<ClampMin=0.0|ClampMax=1.0>;
    /** The chance that a zed will perform a medium attack at this difficulty level */
    var() float MediumAttackChance<ClampMin=0.0|ClampMax=1.0>;
    /** The chance that a zed will perform a hard attack at this difficulty level */
    var() float HardAttackChance<ClampMin=0.0|ClampMax=1.0>;
    /** Modify the damage dealt by self inflicted radial damage (Ex. Grenade) */
    var() float SelfInflictedDamageMod<ClampMin=0.0|ClampMax=1.0>;

    structdefaultproperties
    {
        TraderTime=60
        GlobalHealthMod=1
        MovementSpeedMod=1
        WaveCountMod=1
        DoshKillMod=1
        StartingDosh=250
        RespawnDosh=250
        AmmoPickupsMod=0.5
        ItemPickupsMod=0.3
        WeakAttackChance=1
        MediumAttackChance=0
        HardAttackChance=0
        SelfInflictedDamageMod=1
    }
};

/** Multiplier for the total zeds in a wave depending on the number of players */
var(NumPlayers) NumPlayerMods NumPlayers_WaveSize;
/** Multiplier for the AI's movement speed while hidden depending on  the number of players */
var(NumPlayers) NumPlayerMods NumPlayers_AIHiddenSpeed;
/** Time until a weapon will respawn after being picked up depending on the number of players */
var(NumPlayers) NumPlayerMods NumPlayers_WeaponPickupRespawnTime;
/** Time until ammo will respawn after being picked up depending on the number of players */
var(NumPlayers) NumPlayerMods NumPlayers_AmmoPickupRespawnTime;
/** DifficultySettings struct for Normal difficulty level */
var(Normal) DifficultySettings Normal;
/** DifficultySettings struct for Hard difficulty level */
var(Hard) DifficultySettings Hard;
/** DifficultySettings struct for Suicidal difficulty level */
var(Suicidal) DifficultySettings Suicidal;
/** DifficultySettings struct for HellOnEarth difficulty level */
var(HellOnEarth) DifficultySettings HellOnEarth;
var private DifficultySettings CurrentSettings;

function SetDifficultySettings(float GameDifficulty)
{
    switch(GameDifficulty)
    {
        case 0:
            CurrentSettings = Normal;
            break;
        case 1:
            CurrentSettings = Hard;
            break;
        case 2:
            CurrentSettings = Suicidal;
            break;
        case 3:
            CurrentSettings = HellOnEarth;
            break;
        default:
            CurrentSettings = Normal;
            break;
            break;
    }
}

function GetAIHealthModifier(const out KFCharacterInfo_Monster InMonsterInfo, float GameDifficulty, byte NumLivingPlayers, out float HealthMod, out float HeadHealthMod)
{
    if(InMonsterInfo != none)
    {
        HealthMod = (GetGlobalHealthMod()) * (GetCharHealthModDifficulty(InMonsterInfo, GameDifficulty));
        HeadHealthMod = (GetGlobalHealthMod()) * (GetCharHeadHealthModDifficulty(InMonsterInfo, GameDifficulty));
        if(HealthMod <= float(0))
        {
            HealthMod = 1;
            if(HeadHealthMod <= float(0))
            {
                HeadHealthMod = 1;
            }
            return;
        }
        HealthMod *= (1 + (GetNumPlayersHealthMod(NumLivingPlayers, InMonsterInfo.NumPlayersScale_BodyHealth)));
        HeadHealthMod *= (1 + (GetNumPlayersHealthMod(NumLivingPlayers, InMonsterInfo.NumPlayersScale_HeadHealth)));
    }
}

function GetVersusHealthModifier(const out KFCharacterInfo_Monster InMonsterInfo, byte NumLivingPlayers, out float HealthMod, out float HeadHealthMod)
{
    if(InMonsterInfo != none)
    {
        HealthMod = GetGlobalHealthMod();
        HeadHealthMod = GetGlobalHealthMod();
        HealthMod *= (1 + (GetNumPlayersHealthMod(NumLivingPlayers, InMonsterInfo.NumPlayersScale_BodyHealth_Versus)));
        HeadHealthMod *= (1 + (GetNumPlayersHealthMod(NumLivingPlayers, InMonsterInfo.NumPlayersScale_HeadHealth_Versus)));
    }
}

function float GetNumPlayersHealthMod(byte NumLivingPlayers, float HealthScale)
{
    local float StartingLerp, LerpRate;

    if(NumLivingPlayers <= 0)
    {
        return 0;
    }
    if(NumLivingPlayers <= 6)
    {
        return float(NumLivingPlayers - 1) * HealthScale;        
    }
    else
    {
        StartingLerp = HealthScale * float(6);
        LerpRate = float(NumLivingPlayers - 6) / 128;
        return Lerp(StartingLerp, 20, FMin(LerpRate, 1));
    }
}

function float GetGlobalHealthMod()
{
    return CurrentSettings.GlobalHealthMod;
}

function float GetCharHealthModDifficulty(const out KFCharacterInfo_Monster InMonsterInfo, float GameDifficulty)
{
    if(GameDifficulty >= 3)
    {
        return InMonsterInfo.HellOnEarth.HealthMod;        
    }
    else
    {
        if(GameDifficulty >= 2)
        {
            return InMonsterInfo.Suicidal.HealthMod;            
        }
        else
        {
            if(GameDifficulty >= 1)
            {
                return InMonsterInfo.Hard.HealthMod;
            }
        }
    }
    return InMonsterInfo.Normal.HealthMod;
}

function float GetCharHeadHealthModDifficulty(const out KFCharacterInfo_Monster InMonsterInfo, float GameDifficulty)
{
    if(GameDifficulty >= 3)
    {
        return InMonsterInfo.HellOnEarth.HeadHealthMod;        
    }
    else
    {
        if(GameDifficulty >= 2)
        {
            return InMonsterInfo.Suicidal.HeadHealthMod;            
        }
        else
        {
            if(GameDifficulty >= 1)
            {
                return InMonsterInfo.Hard.HeadHealthMod;
            }
        }
    }
    return InMonsterInfo.Normal.HeadHealthMod;
}

function float GetCharSprintChanceByDifficulty(const out KFCharacterInfo_Monster InMonsterInfo, float GameDifficulty)
{
    if(GameDifficulty >= 3)
    {
        return InMonsterInfo.HellOnEarth.SprintChance;        
    }
    else
    {
        if(GameDifficulty >= 2)
        {
            return InMonsterInfo.Suicidal.SprintChance;            
        }
        else
        {
            if(GameDifficulty >= 1)
            {
                return InMonsterInfo.Hard.SprintChance;
            }
        }
    }
    return InMonsterInfo.Normal.SprintChance;
}

function float GetCharSprintWhenDamagedChanceByDifficulty(const out KFCharacterInfo_Monster InMonsterInfo, float GameDifficulty)
{
    if(GameDifficulty >= 3)
    {
        return InMonsterInfo.HellOnEarth.DamagedSprintChance;        
    }
    else
    {
        if(GameDifficulty >= 2)
        {
            return InMonsterInfo.Suicidal.DamagedSprintChance;            
        }
        else
        {
            if(GameDifficulty >= 1)
            {
                return InMonsterInfo.Hard.DamagedSprintChance;
            }
        }
    }
    return InMonsterInfo.Normal.DamagedSprintChance;
}

function float GetTraderTimeByDifficulty()
{
    return float(CurrentSettings.TraderTime);
}

function float GetAIDamageModifier(const out KFCharacterInfo_Monster InMonsterInfo, float GameDifficulty, bool bSoloPlay)
{
    local float PerZedDamageMod, SoloPlayDamageMod;

    PerZedDamageMod = 1;
    SoloPlayDamageMod = 1;
    if(InMonsterInfo != none)
    {
        if(GameDifficulty >= 3)
        {
            PerZedDamageMod = InMonsterInfo.HellOnEarth.DamageMod;
            if(bSoloPlay)
            {
                SoloPlayDamageMod = InMonsterInfo.HellOnEarth.SoloDamageMod;
            }            
        }
        else
        {
            if(GameDifficulty >= 2)
            {
                PerZedDamageMod = InMonsterInfo.Suicidal.DamageMod;
                if(bSoloPlay)
                {
                    SoloPlayDamageMod = InMonsterInfo.Suicidal.SoloDamageMod;
                }                
            }
            else
            {
                if(GameDifficulty >= 1)
                {
                    PerZedDamageMod = InMonsterInfo.Hard.DamageMod;
                    if(bSoloPlay)
                    {
                        SoloPlayDamageMod = InMonsterInfo.Hard.SoloDamageMod;
                    }                    
                }
                else
                {
                    PerZedDamageMod = InMonsterInfo.Normal.DamageMod;
                    if(bSoloPlay)
                    {
                        SoloPlayDamageMod = InMonsterInfo.Normal.SoloDamageMod;
                    }
                }
            }
        }
    }
    return PerZedDamageMod * SoloPlayDamageMod;
}

function float GetAIRandomSpeedMod()
{
    return RandRange(0.9, 1.1);
}

function float GetAIGroundSpeedMod()
{
    return CurrentSettings.MovementSpeedMod;
}

function float GetDifficultyMaxAIModifier()
{
    return CurrentSettings.WaveCountMod;
}

function float GetKillCashModifier()
{
    return CurrentSettings.DoshKillMod;
}

function int GetAdjustedStartingCash()
{
    return CurrentSettings.StartingDosh;
}

function int GetAdjustedRespawnCash()
{
    return CurrentSettings.RespawnDosh;
}

function float GetItemPickupModifier()
{
    return CurrentSettings.ItemPickupsMod;
}

function float GetAmmoPickupModifier()
{
    return CurrentSettings.AmmoPickupsMod;
}

function float GetWeakAttackChance()
{
    return CurrentSettings.WeakAttackChance;
}

function float GetMediumAttackChance()
{
    return CurrentSettings.MediumAttackChance;
}

function float GetHardAttackChance()
{
    return CurrentSettings.HardAttackChance;
}

function float GetSelfInflictedDamageMod()
{
    return CurrentSettings.SelfInflictedDamageMod;
}

function float GetNumPlayersModifier(out NumPlayerMods PlayerSetting, byte NumLivingPlayers)
{
    local float StartingLerp, LerpRate;

    if(6 > NumLivingPlayers)
    {
        return PlayerSetting.PlayersMod[Max(NumLivingPlayers - 1, 0)];
    }
    StartingLerp = PlayerSetting.PlayersMod[6 - 1];
    LerpRate = float(NumLivingPlayers - 6) / (32 - float(6));
    return Lerp(StartingLerp, PlayerSetting.ModCap, LerpRate);
}

function float GetAIHiddenSpeedModifier(int NumLivingPlayers)
{
    return GetNumPlayersModifier(NumPlayers_AIHiddenSpeed, byte(NumLivingPlayers));
}

function float GetPlayerNumMaxAIModifier(byte NumLivingPlayers)
{
    return GetNumPlayersModifier(NumPlayers_WaveSize, NumLivingPlayers);
}

function float GetAmmoPickupInterval(byte NumLivingPlayers)
{
    return GetNumPlayersModifier(NumPlayers_AmmoPickupRespawnTime, NumLivingPlayers);
}

function float GetWeaponPickupInterval(byte NumLivingPlayers)
{
    return GetNumPlayersModifier(NumPlayers_WeaponPickupRespawnTime, NumLivingPlayers);
}

static function float GetDifficultyValue(byte DifficultyIndex)
{
    switch(DifficultyIndex)
    {
        case 0:
            return 0;
        case 1:
            return 1;
        case 2:
            return 2;
        case 3:
            return 3;
        default:
            return 0;
            break;
    }
}

static function byte GetDifficultyIndex(float GameDifficulty)
{
    switch(GameDifficulty)
    {
        case 0:
            return 0;
        case 1:
            return 1;
        case 2:
            return 2;
        case 3:
            return 3;
        default:
            return 99;
            break;
    }
}

defaultproperties
{
    NumPlayers_WaveSize=(PlayersMod=1,PlayersMod[1]=1,PlayersMod[2]=1,PlayersMod[3]=1,PlayersMod[4]=1,PlayersMod[5]=1,ModCap=2)
    NumPlayers_AIHiddenSpeed=(PlayersMod=1,PlayersMod[1]=1,PlayersMod[2]=1,PlayersMod[3]=1,PlayersMod[4]=1,PlayersMod[5]=1,ModCap=2)
    NumPlayers_WeaponPickupRespawnTime=(PlayersMod=1,PlayersMod[1]=1,PlayersMod[2]=1,PlayersMod[3]=1,PlayersMod[4]=1,PlayersMod[5]=1,ModCap=2)
    NumPlayers_AmmoPickupRespawnTime=(PlayersMod=1,PlayersMod[1]=1,PlayersMod[2]=1,PlayersMod[3]=1,PlayersMod[4]=1,PlayersMod[5]=1,ModCap=2)
    Normal=(TraderTime=60,GlobalHealthMod=1,MovementSpeedMod=1,WaveCountMod=1,DoshKillMod=1,StartingDosh=250,RespawnDosh=250,AmmoPickupsMod=0.5,ItemPickupsMod=0.3,WeakAttackChance=1,MediumAttackChance=0,HardAttackChance=0,SelfInflictedDamageMod=1)
    Hard=(TraderTime=60,GlobalHealthMod=1,MovementSpeedMod=1,WaveCountMod=1,DoshKillMod=1,StartingDosh=250,RespawnDosh=250,AmmoPickupsMod=0.5,ItemPickupsMod=0.3,WeakAttackChance=1,MediumAttackChance=0,HardAttackChance=0,SelfInflictedDamageMod=1)
    Suicidal=(TraderTime=60,GlobalHealthMod=1,MovementSpeedMod=1,WaveCountMod=1,DoshKillMod=1,StartingDosh=250,RespawnDosh=250,AmmoPickupsMod=0.5,ItemPickupsMod=0.3,WeakAttackChance=1,MediumAttackChance=0,HardAttackChance=0,SelfInflictedDamageMod=1)
    HellOnEarth=(TraderTime=60,GlobalHealthMod=1,MovementSpeedMod=1,WaveCountMod=1,DoshKillMod=1,StartingDosh=250,RespawnDosh=250,AmmoPickupsMod=0.5,ItemPickupsMod=0.3,WeakAttackChance=1,MediumAttackChance=0,HardAttackChance=0,SelfInflictedDamageMod=1)
    CurrentSettings=(TraderTime=60,GlobalHealthMod=1,MovementSpeedMod=1,WaveCountMod=1,DoshKillMod=1,StartingDosh=250,RespawnDosh=250,AmmoPickupsMod=0.5,ItemPickupsMod=0.3,WeakAttackChance=1,MediumAttackChance=0,HardAttackChance=0,SelfInflictedDamageMod=1)
}