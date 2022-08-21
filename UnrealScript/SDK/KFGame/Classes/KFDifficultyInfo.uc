//=============================================================================
// KFDifficultyInfo
//=============================================================================
// Manages difficulty based gameplay settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDifficultyInfo extends Object
	hidecategories(Object);

/** Difficulty setting consts, don't want to use arbitrary numbers all over the place */
`define	DIFFICULTY_NORMAL		0.0
`define	DIFFICULTY_HARD 		1.0
`define	DIFFICULTY_SUICIDAL		2.0
`define	DIFFICULTY_HELLONEARTH	3.0

/**	The maxiumum number of players we will lerp for */
const OverMaxPlayers_MaxLerpedPlayers = 128.f;
/**	The max multiplier for health if we are playing with more than 6 players*/
const OverMaxPlayers_MaxHealthMod = 20.f;

struct NumPlayerMods
{
	/** Each index relates to the number of players in the game, it's value is the modifier */
	var() float PlayersMod[`KF_MAX_PLAYERS];
	/** If we are over our standard max player count of 6, linearly scale up to ModCap value */
	var() float ModCap;

	structdefaultproperties
	{
    	PlayersMod[0]=1.f;
    	PlayersMod[1]=1.f;
    	PlayersMod[2]=1.f;
    	PlayersMod[3]=1.f;
    	PlayersMod[4]=1.f;
    	PlayersMod[5]=1.f;
    	ModCap=2.f;
	}
};

/** Multiplier for the total zeds in a wave depending on the number of players*/
var(NumPlayers) NumPlayerMods NumPlayers_WaveSize;

/** Multiplier for the AI's movement speed while hidden depending on  the number of players*/
var(NumPlayers) NumPlayerMods NumPlayers_AIHiddenSpeed;

/** Time until a weapon will respawn after being picked up depending on the number of players*/
var(NumPlayers) NumPlayerMods NumPlayers_WeaponPickupRespawnTime;

/** Time until ammo will respawn after being picked up depending on the number of players*/
var(NumPlayers) NumPlayerMods NumPlayers_AmmoPickupRespawnTime;

struct DifficultySettings
{
	/** How long trader time is */
    var() int TraderTime<ClampMin = 0.0>;
	/** Multiplier for the total health of all zeds */
	var() float GlobalHealthMod<ClampMin = 0.0>;
	/** Multiplier for the movement speed of a zed */
	var() float MovementSpeedMod<ClampMin = 0.0>;
	/** Multiplier for the number of zeds in a wave */
	var() float WaveCountMod<ClampMin = 0.0>;

	/** Multiplier for the dosh awarded upon killing a zed */
	var() float DoshKillMod<ClampMin = 0.0>;
	/** The amount of dosh a player will start with the first time they spawn */
	var() int	StartingDosh<ClampMin = 0.0>;
	/** The amount of dosh a player will start with from respawning after dying */
	var() int   RespawnDosh<ClampMin = 0.0>;

	/** Modify the number of ammo pickups that will be active at once */
	var() float AmmoPickupsMod<ClampMin = 0.0 | ClampMax = 1.0>;
	/** Modify the number of weapon pickups that will be active at once */
	var() float ItemPickupsMod<ClampMin = 0.0 | ClampMax = 1.0>;

	/** The chance that a zed will perform a weak attack at this difficulty level */
	var() float WeakAttackChance<ClampMin = 0.0 | ClampMax = 1.0>;
	/** The chance that a zed will perform a medium attack at this difficulty level */
	var() float MediumAttackChance<ClampMin = 0.0 | ClampMax = 1.0>;
	/** The chance that a zed will perform a hard attack at this difficulty level */
	var() float HardAttackChance<ClampMin = 0.0 | ClampMax = 1.0>;

	/** Modify the damage dealt by self inflicted radial damage (Ex. Grenade) */
	var() float SelfInflictedDamageMod<ClampMin = 0.0 | ClampMax = 1.0>;

	structdefaultproperties
	{
		TraderTime=60
		GlobalHealthMod=1.f
		MovementSpeedMod=1.f
		WaveCountMod=1.f
		DoshKillMod=1.f
		StartingDosh=250
		RespawnDosh=250
		AmmoPickupsMod=0.5f
		ItemPickupsMod=0.3f

		WeakAttackChance=1.0
		MediumAttackChance=0.0
		HardAttackChance=0.0

		SelfInflictedDamageMod=1
	}
};

/** DifficultySettings struct for Normal difficulty level */
var(Normal) DifficultySettings Normal;
/** DifficultySettings struct for Hard difficulty level */
var(Hard) DifficultySettings Hard;
/** DifficultySettings struct for Suicidal difficulty level */
var(Suicidal) DifficultySettings Suicidal;
/** DifficultySettings struct for HellOnEarth difficulty level */
var(HellOnEarth) DifficultySettings HellOnEarth;

/** A cached version of the DifficultySettings we are currently using */
var private DifficultySettings CurrentSettings;

/** Cache our current difficulty based on the GameDifficulty */
function SetDifficultySettings( float GameDifficulty )
{
	switch ( GameDifficulty )
	{
	 	case `DIFFICULTY_NORMAL:         CurrentSettings = Normal; break;
	 	case `DIFFICULTY_HARD:           CurrentSettings = Hard; break;
	 	case `DIFFICULTY_SUICIDAL:       CurrentSettings = Suicidal; break;
	 	case `DIFFICULTY_HELLONEARTH:    CurrentSettings = HellOnEarth; break;

	 	default: CurrentSettings = Normal; break;
	}
}

/************************************************************
 * Difficulty settings get functions
 ************************************************************/

/** Scales the health this Zed has by the difficulty level */
function GetAIHealthModifier(const out KFCharacterInfo_Monster InMonsterInfo, float GameDifficulty, byte NumLivingPlayers, out float HealthMod, out float HeadHealthMod, optional bool bApplyDifficultyScaling=true)
{
	if ( InMonsterInfo != none )
	{
		// Global mod * character mod
		if( bApplyDifficultyScaling )
		{
	    	HealthMod = GetGlobalHealthMod() * GetCharHealthModDifficulty(InMonsterInfo, GameDifficulty);
			HeadHealthMod = GetGlobalHealthMod() * GetCharHeadHealthModDifficulty(InMonsterInfo, GameDifficulty);
		}

		// invalid scaling?
		if ( HealthMod <= 0 )
		{
			HealthMod = 1.f;
			if( HeadHealthMod <= 0 )
			{
                HeadHealthMod = 1.f;
            }
			return;
		}

	    // Add another multiplier based on the number of players and the zeds character info scalers
		HealthMod *= 1.0 + (GetNumPlayersHealthMod( NumLivingPlayers, InMonsterInfo.NumPlayersScale_BodyHealth ));
		HeadHealthMod *= 1.0 + (GetNumPlayersHealthMod( NumLivingPlayers, InMonsterInfo.NumPlayersScale_HeadHealth ));
	}
}

/** Scales the health this Player (versus mode) Zed has by number of human players */
function GetVersusHealthModifier(const out KFCharacterInfo_Monster InMonsterInfo, byte NumLivingPlayers, out float HealthMod, out float HeadHealthMod)
{
	if ( InMonsterInfo != none )
	{
		HealthMod = GetGlobalHealthMod();
		HeadHealthMod = GetGlobalHealthMod();

	    // Add another multiplier based on the number of players and the zeds character info scalers
		HealthMod *= 1.0 + (GetNumPlayersHealthMod( NumLivingPlayers, InMonsterInfo.NumPlayersScale_BodyHealth_Versus ));
		HeadHealthMod *= 1.0 + (GetNumPlayersHealthMod( NumLivingPlayers, InMonsterInfo.NumPlayersScale_HeadHealth_Versus ));
	}
}

/** Scale health by the number of players.  This is applied as a bonus (zero is valid) for each player behind one */
function float GetNumPlayersHealthMod( byte NumLivingPlayers, float HealthScale )
{
	local float StartingLerp, LerpRate;

	// Early out if we have no living players
	if( NumLivingPlayers <= 0 )
	{
		return 0;
	}

	/** Scale the body health based on the number of players */
	if ( NumLivingPlayers <= `KF_MAX_PLAYERS )
	{
		return (NumLivingPlayers - 1) * HealthScale;
	}
	/** Slowly scale the additional health health to a max value if we are playing with more than 6 players */
	else
	{
		StartingLerp = HealthScale * `KF_MAX_PLAYERS;
		LerpRate = (NumLivingPlayers - `KF_MAX_PLAYERS) / OverMaxPlayers_MaxLerpedPlayers;
		return Lerp( StartingLerp, OverMaxPlayers_MaxHealthMod, fmin(LerpRate, 1.0f) );
	}
}

function float GetGlobalHealthMod()
{
	return CurrentSettings.GlobalHealthMod;
}

/** note: this returns a pass by value struct */
function float GetCharHealthModDifficulty( const out KFCharacterInfo_Monster InMonsterInfo, float GameDifficulty )
{
	if ( GameDifficulty >= `DIFFICULTY_HELLONEARTH )
	{
		return InMonsterInfo.HellOnEarth.HealthMod;
	}
	else if ( GameDifficulty >= `DIFFICULTY_SUICIDAL )
	{
		return InMonsterInfo.Suicidal.HealthMod;
	}
	else if ( GameDifficulty >= `DIFFICULTY_HARD )
	{
		return InMonsterInfo.Hard.HealthMod;
	}
	return InMonsterInfo.Normal.HealthMod;
}

/** note: this returns a pass by value struct */
function float GetCharHeadHealthModDifficulty( const out KFCharacterInfo_Monster InMonsterInfo, float GameDifficulty )
{
	if ( GameDifficulty >= `DIFFICULTY_HELLONEARTH )
	{
		return InMonsterInfo.HellOnEarth.HeadHealthMod;
	}
	else if ( GameDifficulty >= `DIFFICULTY_SUICIDAL )
	{
		return InMonsterInfo.Suicidal.HeadHealthMod;
	}
	else if ( GameDifficulty >= `DIFFICULTY_HARD )
	{
		return InMonsterInfo.Hard.HeadHealthMod;
	}
	return InMonsterInfo.Normal.HeadHealthMod;
}

function float GetCharSprintChanceByDifficulty( const out KFCharacterInfo_Monster InMonsterInfo, float GameDifficulty )
{
	if ( GameDifficulty >= `DIFFICULTY_HELLONEARTH )
	{
		return InMonsterInfo.HellOnEarth.SprintChance;
	}
	else if ( GameDifficulty >= `DIFFICULTY_SUICIDAL )
	{
		return InMonsterInfo.Suicidal.SprintChance;
	}
	else if ( GameDifficulty >= `DIFFICULTY_HARD )
	{
		return InMonsterInfo.Hard.SprintChance;
	}
	return InMonsterInfo.Normal.SprintChance;
}

function float GetCharSprintWhenDamagedChanceByDifficulty( const out KFCharacterInfo_Monster InMonsterInfo, float GameDifficulty )
{
	if ( GameDifficulty >= `DIFFICULTY_HELLONEARTH )
	{
		return InMonsterInfo.HellOnEarth.DamagedSprintChance;
	}
	else if ( GameDifficulty >= `DIFFICULTY_SUICIDAL )
	{
		return InMonsterInfo.Suicidal.DamagedSprintChance;
	}
	else if ( GameDifficulty >= `DIFFICULTY_HARD )
	{
		return InMonsterInfo.Hard.DamagedSprintChance;
	}
	return InMonsterInfo.Normal.DamagedSprintChance;
}

/**	Get the trader time by the difficulty level */
function float GetTraderTimeByDifficulty()
{
	return CurrentSettings.TraderTime;
}

/**	Scales the damage this Zed deals by the difficulty level */
function float GetAIDamageModifier(const out KFCharacterInfo_Monster InMonsterInfo, float GameDifficulty, bool bSoloPlay)
{
    local float PerZedDamageMod, SoloPlayDamageMod;

    // default if no InMonsterInfo
    PerZedDamageMod = 1.0;
    SoloPlayDamageMod = 1.0;

    if( InMonsterInfo != none )
    {
    	if ( GameDifficulty >= `DIFFICULTY_HELLONEARTH )
    	{
    		PerZedDamageMod = InMonsterInfo.HellOnEarth.DamageMod;
    		if( bSoloPlay )
    		{
                SoloPlayDamageMod = InMonsterInfo.HellOnEarth.SoloDamageMod;
    		}
    	}
    	else if ( GameDifficulty >= `DIFFICULTY_SUICIDAL )
    	{
    		PerZedDamageMod = InMonsterInfo.Suicidal.DamageMod;
    		if( bSoloPlay )
    		{
                SoloPlayDamageMod = InMonsterInfo.Suicidal.SoloDamageMod;
    		}
    	}
    	else if ( GameDifficulty >= `DIFFICULTY_HARD )
    	{
    		PerZedDamageMod = InMonsterInfo.Hard.DamageMod;
    		if( bSoloPlay )
    		{
                SoloPlayDamageMod = InMonsterInfo.Hard.SoloDamageMod;
    		}
    	}
    	else
    	{
            PerZedDamageMod = InMonsterInfo.Normal.DamageMod;
    		if( bSoloPlay )
    		{
                SoloPlayDamageMod = InMonsterInfo.Normal.SoloDamageMod;
    		}
    	}
	}

	//`log("DamageMod: "$PerZedDamageMod * SoloPlayDamageMod$" Per Zed Difficulty DamageMod "$PerZedDamageMod$" bSoloPlay = "$bSoloPlay$" SoloPlayDamageMod = "$SoloPlayDamageMod/*, bLogAIDefaults*/);

	return PerZedDamageMod * SoloPlayDamageMod;
}

/** Gives the random range of AI speed modification */
function float GetAIRandomSpeedMod()
{
	// randomize by +/- 10%
	return RandRange(0.9f, 1.1f);
}

/** Scales the movement speed of this Zed by the difficulty level */
function float GetAIGroundSpeedMod()
{
	return CurrentSettings.MovementSpeedMod;
}

/** Returns adjusted total num AI modifier for this wave's difficulty */
function float GetDifficultyMaxAIModifier()
{
	return CurrentSettings.WaveCountMod;
}

/* Get the starting money value adjusted by difficulty */
function float GetKillCashModifier()
{
	return CurrentSettings.DoshKillMod;
}

/* Get the starting money value adjusted by difficulty */
function int GetAdjustedStartingCash()
{
	return CurrentSettings.StartingDosh;
}

/* Get the money value adjusted by difficulty if you've died */
function int GetAdjustedRespawnCash()
{
	return CurrentSettings.RespawnDosh;
}

/* Get the modifier for the number of active weapon pickups in a map */
function float GetItemPickupModifier()
{
	return CurrentSettings.ItemPickupsMod;
}

/* Get the modifier for the number of active item pickups in a map */
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

/************************************************************
 * NumPlayers Modifiers
 ************************************************************/

/** If we have a standard number of players, use the PlayersMod value.
*	Otherwise, lerp to the ModCap value so the modifiers level out at untested player numbers */
function float GetNumPlayersModifier( out NumPlayerMods PlayerSetting, byte NumLivingPlayers )
{
	local float StartingLerp, LerpRate;

	if ( `KF_MAX_PLAYERS > NumLivingPlayers )
	{
	 	return PlayerSetting.PlayersMod[Max(NumLivingPlayers - 1, 0)];
	}

	// Begin the lerp at the last value of PlayersMod
    StartingLerp = PlayerSetting.PlayersMod[ `KF_MAX_PLAYERS - 1 ];
    // Increase the mod value by scaling from 6 to 32;
	LerpRate = (NumLivingPlayers - `KF_MAX_PLAYERS) / (32.f - `KF_MAX_PLAYERS);
	return Lerp( StartingLerp, PlayerSetting.ModCap, LerpRate );
}

// Scale the hidden movement speed of this Zed by the difficulty level
function float GetAIHiddenSpeedModifier( int NumLivingPlayers )
{
	return GetNumPlayersModifier( NumPlayers_AIHiddenSpeed, NumLivingPlayers );
}

/** Returns adjusted total num AI modifier for this wave's player num */
function float GetPlayerNumMaxAIModifier( byte NumLivingPlayers )
{
	return GetNumPlayersModifier( NumPlayers_WaveSize, NumLivingPlayers );
}

/** Return the time it takes to respawn an ammo pickup */
function float GetAmmoPickupInterval( byte NumLivingPlayers )
{
	return GetNumPlayersModifier( NumPlayers_AmmoPickupRespawnTime, NumLivingPlayers );
}

/** Return the time it takes to respawn an weapon pickup */
function float GetWeaponPickupInterval( byte NumLivingPlayers )
{
	return GetNumPlayersModifier( NumPlayers_WeaponPickupRespawnTime, NumLivingPlayers );
}

// return the value of a difficulty level
static function float GetDifficultyValue( byte DifficultyIndex )
{
	switch ( DifficultyIndex )
	{
	 	case 0:	return `DIFFICULTY_NORMAL;
	 	case 1:	return `DIFFICULTY_HARD;
	 	case 2:	return `DIFFICULTY_SUICIDAL;
	 	case 3:	return `DIFFICULTY_HELLONEARTH;
	 	default: return `DIFFICULTY_NORMAL;
	}
}

static function byte GetDifficultyIndex( float GameDifficulty )
{
 	switch ( GameDifficulty )
	{
	 	case `DIFFICULTY_NORMAL:		return 0;
	 	case `DIFFICULTY_HARD:   		return 1;
	 	case `DIFFICULTY_SUICIDAL:		return 2;
	 	case `DIFFICULTY_HELLONEARTH:	return 3;

	 	default: return 99;
	}
}

defaultproperties
{

}
