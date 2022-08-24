//=============================================================================
// KFEmoteList
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFEmoteList extends Object
	abstract
    native;

struct native Emote
{
	var int Id;
	var string ItemName;
	var name AnimName;
	var string IconPath;
	StructDefaultProperties
	{
		IconPath=""
	}
};

var private const array<Emote> Emotes;

/** Cached Emote ID */
var private const int EquippedEmoteId;

/** Debugging */
var private const bool bDebugEmotes;

/** Helper functions for UI and special move */
static native final function name GetUnlockedEmote( int ItemId );
static native final function byte GetEmoteIndex( int ItemId );
static native final function name GetEmoteFromIndex( byte EmoteIndex );
static native final function bool IsEmoteEquipped( int ItemId );
static native final function int GetEquippedEmoteId();

/** Save equipped emote using profile */
static native final function SaveEquippedEmote( int ItemId );

/** Refreshes the equipped emote from profile data */
static native final function RefreshCachedEmoteId();

/** Returns the emote array as const */
static native final function array<Emote> GetEmoteArray() const;

defaultproperties
{
   Emotes(0)=(Id=4515,ItemName="LetsGetCrazy",AnimName="Emote_01_LetsGetCrazy",IconPath="EMOTE_TEX.Emote_LetsGoCrazy_512")
   Emotes(1)=(Id=4516,ItemName="ThunderClap",AnimName="Emote_02_ThunderClap",IconPath="EMOTE_TEX.Emote_Thunderclap_512")
   Emotes(2)=(Id=4517,ItemName="UncleCharlie",AnimName="Emote_03_UncleCharlie",IconPath="EMOTE_TEX.Emote_UncleCharlie_512")
   Emotes(3)=(Id=4518,ItemName="WackyWave",AnimName="Emote_04_WackyWave",IconPath="EMOTE_TEX.Emote_WackyWave_512")
   Emotes(4)=(Id=4519,ItemName="RainingDosh",AnimName="Emote_05_RainingDosh",IconPath="EMOTE_TEX.Emote_RainingDosh_512")
   Emotes(5)=(Id=4520,ItemName="LionUppercut",AnimName="Emote_06_LionUppercut",IconPath="EMOTE_TEX.Emote_Uppercut_512")
   Emotes(6)=(ItemName="MatingRitual",AnimName="Emote_07_MatingRitual",IconPath="EMOTE_TEX.Emote_MatingRitual_512")
   Emotes(7)=(Id=4522,ItemName="KickinIt",AnimName="Emote_08_KickinIt",IconPath="EMOTE_TEX.Emote_KicknIt_512")
   Emotes(8)=(Id=4523,ItemName="Fireball",AnimName="Emote_09_Fireball",IconPath="EMOTE_TEX.Emote_Fireball_512")
   Emotes(9)=(Id=4524,ItemName="Makeitrain",AnimName="Emote_10_Makeitrain",IconPath="EMOTE_TEX.Emote_MknRain_512")
   Emotes(10)=(Id=4525,ItemName="Fireball_Deluxe",AnimName="Emote_09_Fireball_Deluxe",IconPath="EMOTE_TEX.Emote_Fireball_DLX_512")
   Emotes(11)=(Id=4526,ItemName="Makeitrain_Deluxe",AnimName="Emote_10_Makeitrain_Deluxe",IconPath="EMOTE_TEX.Emote_MknRain_DLX_512")
   Emotes(12)=(Id=4527,ItemName="ThunderClap_Deluxe",AnimName="Emote_02_ThunderClap_Deluxe",IconPath="EMOTE_TEX.Emote_Thunderclap_DLX_512")
   Emotes(13)=(Id=4528,ItemName="UncleCharlie_Deluxe",AnimName="Emote_03_UncleCharlie_Deluxe",IconPath="EMOTE_TEX.Emote_UncleCharlie_DLX_512")
   Emotes(14)=(Id=4529,ItemName="LetsGetCrazy_Deluxe",AnimName="Emote_01_LetsGetCrazy_Deluxe",IconPath="EMOTE_TEX.Emote_LetsGoCrazy_DLX_512")
   Emotes(15)=(Id=4530,ItemName="WackyWave_Deluxe",AnimName="Emote_04_WackyWave_Deluxe",IconPath="EMOTE_TEX.Emote_WackyWave_DLX_512")
   Emotes(16)=(Id=4531,ItemName="RainingDosh_Deluxe",AnimName="Emote_05_RainingDosh_Deluxe",IconPath="EMOTE_TEX.Emote_RainingDosh_DLX_512")
   Emotes(17)=(Id=4532,ItemName="LionUppercut_Deluxe",AnimName="Emote_06_LionUppercut_Deluxe",IconPath="EMOTE_TEX.Emote_Uppercut_DLX_512")
   Emotes(18)=(Id=4533,ItemName="MatingRitual_Deluxe",AnimName="Emote_07_MatingRitual_Deluxe",IconPath="EMOTE_TEX.Emote_MatingRitual_DLX_512")
   Emotes(19)=(Id=4534,ItemName="KickinIt_Deluxe",AnimName="Emote_08_KickinIt_Deluxe",IconPath="EMOTE_TEX.Emote_KicknIt_DLX_512")
   EquippedEmoteId=-1
   Name="Default__KFEmoteList"
   ObjectArchetype=Object'Core.Default__Object'
}