//=============================================================================
// KFOnlineGameSettings
//=============================================================================
// Base settings for KF2 online games
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Joshua Rowan 8/22/2013
//=============================================================================

/**
 * Holds the base configuration settings for match
 */
class KFOnlineGameSettings extends OnlineGameSettings
	native;

/** The number of waves in the match */
var databinding int NumWaves;

/** The current of wave in the match */
var databinding int CurrentWave;

/** Is playing, or in ready-up */
var databinding bool bInProgress;

/** The number of Zeds in the current wave */
var databinding int ZedCount;

/** The max number of Zeds in the current Wave */
var databinding int MaxZedCount;

/** The number of waves in the match */
var databinding string MapName;

/** The number of waves in the match */
var databinding int Difficulty;

/** The number of waves in the match */
var databinding int Mode;

/** Have mutators been applied to this server? **/
var databinding bool bMutators;

//This duplicates bAntiCheatProtected, use that instead
//var databinding bool bVACSecure;

//This means the same as bUsesStats in the base class, use that instead
//var databinding bool bRanked;

/** This means the the server is using settings that take it out of normal and 
	sets it to "custom"
*/
var databinding bool bCustom;

var databinding bool bUsedForTakeover;
var databinding bool bAvailableForTakeover;

/** A playercount that doesn't include spectators */
var databinding int NumSpectators;

defaultproperties
{
   NumWaves=6
   CurrentWave=1
   ZedCount=10
   MaxZedCount=100
   MapName="KF-BurningParis"
   NumPublicConnections=6
   Name="Default__KFOnlineGameSettings"
   ObjectArchetype=OnlineGameSettings'Engine.Default__OnlineGameSettings'
}
