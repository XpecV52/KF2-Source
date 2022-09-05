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
   Emotes(20)=(Id=4744,ItemName="TheCossack",AnimName="Emote_01_Dance",IconPath="EMOTE_TEX_02.Emote_02_Squat_Dance_512")
   Emotes(21)=(Id=4754,ItemName="TheCossack_Deluxe",AnimName="Emote_01_Dance_Deluxe",IconPath="EMOTE_TEX_02.Emote_02_Squat_Dance_DLX_512")
   Emotes(22)=(Id=4745,ItemName="TheWave",AnimName="Emote_02_Dance",IconPath="EMOTE_TEX_02.Emote_02_The_Wave_512")
   Emotes(23)=(Id=4755,ItemName="TheWave_Deluxe",AnimName="Emote_02_Dance_Deluxe",IconPath="EMOTE_TEX_02.Emote_02_The_Wave_DLX_512")
   Emotes(24)=(Id=4746,ItemName="Breakin",AnimName="Emote_03_Dance",IconPath="EMOTE_TEX_02.Emote_02_Handstand_512")
   Emotes(25)=(Id=4756,ItemName="Breakin_Deluxe",AnimName="Emote_03_Dance_Deluxe",IconPath="EMOTE_TEX_02.Emote_02_Handstand_DLX_512")
   Emotes(26)=(Id=4747,ItemName="NoHands",AnimName="Emote_04_Dance",IconPath="EMOTE_TEX_02.Emote_02_Kap_Kick_512")
   Emotes(27)=(Id=4757,ItemName="NoHands_Deluxe",AnimName="Emote_04_Dance_Deluxe",IconPath="EMOTE_TEX_02.Emote_02_Kap_Kick_DLX_512")
   Emotes(28)=(Id=4748,ItemName="HealClick",AnimName="Emote_05_Dance",IconPath="EMOTE_TEX_02.Emote_02_Click_It_512")
   Emotes(29)=(Id=4758,ItemName="HealClick_Deluxe",AnimName="Emote_05_Dance_Deluxe",IconPath="EMOTE_TEX_02.Emote_02_Click_It_DLX_512")
   Emotes(30)=(Id=4749,ItemName="TheSprinkler",AnimName="Emote_06_Dance",IconPath="EMOTE_TEX_02.Emote_02_The_Sprinkler_512")
   Emotes(31)=(Id=4759,ItemName="TheSprinkler_Deluxe",AnimName="Emote_06_Dance_Deluxe",IconPath="EMOTE_TEX_02.Emote_02_The_Sprinkler_DLX_512")
   Emotes(32)=(Id=4750,ItemName="Maniac",AnimName="Emote_07_Dance",IconPath="EMOTE_TEX_02.Emote_02_Running_Dosh_512")
   Emotes(33)=(Id=4760,ItemName="Maniac_Deluxe",AnimName="Emote_07_Dance_Deluxe",IconPath="EMOTE_TEX_02.Emote_02_Running_Dosh_DLX_512")
   Emotes(34)=(Id=4751,ItemName="RunningMan",AnimName="Emote_08_Dance",IconPath="EMOTE_TEX_02.Emote_02_Running_Man_512")
   Emotes(35)=(Id=4761,ItemName="RunningMan_Deluxe",AnimName="Emote_08_Dance_Deluxe",IconPath="EMOTE_TEX_02.Emote_02_Running_Man_DLX_512")
   Emotes(36)=(Id=4752,ItemName="TheRobot",AnimName="Emote_09_Dance",IconPath="EMOTE_TEX_02.Emote_02_The_Robot_512")
   Emotes(37)=(Id=4762,ItemName="TheRobot_Deluxe",AnimName="Emote_09_Dance_Deluxe",IconPath="EMOTE_TEX_02.Emote_02_The_Robot_DLX_512")
   Emotes(38)=(Id=4753,ItemName="AirMetal",AnimName="Emote_10_Dance",IconPath="EMOTE_TEX_02.Emote_02_Guitar_Solo_512")
   Emotes(39)=(Id=4763,ItemName="AirMetal_Deluxe",AnimName="Emote_10_Dance_Deluxe",IconPath="EMOTE_TEX_02.Emote_02_Guitar_Solo_DLX_512")
   Emotes(40)=(Id=7911,ItemName="Homerun",AnimName="Emote_11_Babe_Ruth",IconPath="EMOTE_TEX_03.Emote_03_BabeRuth_512")
   Emotes(41)=(Id=7921,ItemName="Homerun_Deluxe",AnimName="Emote_11_Babe_Ruth_Deluxe",IconPath="EMOTE_TEX_03.Emote_03_BabeRuth_DLX_512")
   Emotes(42)=(Id=7907,ItemName="NeedYourEnergy",AnimName="Emote_12_Spirit_Bomb",IconPath="EMOTE_TEX_03.Emote_03_SpiritBomb_512")
   Emotes(43)=(Id=7917,ItemName="NeedYourEnergy_Deluxe",AnimName="Emote_12_Spirit_Bomb_Deluxe",IconPath="EMOTE_TEX_03.Emote_03_SpiritBomb_DLX_512")
   Emotes(44)=(Id=7905,ItemName="UniversalMastery",AnimName="Emote_13_Master_of_the_Universe",IconPath="EMOTE_TEX_03.Emote_03_MasteroftheUniverse_512")
   Emotes(45)=(Id=7915,ItemName="UniversalMastery_Deluxe",AnimName="Emote_13_Master_of_the_Universe_Deluxe",IconPath="EMOTE_TEX_03.Emote_03_MasteroftheUniverse_DLX_512")
   Emotes(46)=(Id=7909,ItemName="FastestGun",AnimName="Emote_14_Quick_Draw",IconPath="EMOTE_TEX_03.Emote_03_QuickDraw_512")
   Emotes(47)=(Id=7919,ItemName="FastestGun_Deluxe",AnimName="Emote_14_Quick_Draw_Deluxe",IconPath="EMOTE_TEX_03.Emote_03_QuickDraw_DLX_512")
   Emotes(48)=(Id=7912,ItemName="CoinTrick",AnimName="Emote_15_Coin_Trick",IconPath="EMOTE_TEX_03.Emote_03_CoinTrick_512")
   Emotes(49)=(Id=7922,ItemName="CoinTrick_Deluxe",AnimName="Emote_15_Coin_Trick_Deluxe",IconPath="EMOTE_TEX_03.Emote_03_CoinTrick_DLX_512")
   Emotes(50)=(Id=7910,ItemName="SpiritFingers",AnimName="Emote_16_Finger_Guns",IconPath="EMOTE_TEX_03.Emote_03_FingerGuns_512")
   Emotes(51)=(Id=7920,ItemName="SpiritFingers_Deluxe",AnimName="Emote_16_Finger_Guns_Deluxe",IconPath="EMOTE_TEX_03.Emote_03_FingerGuns_DLX_512")
   Emotes(52)=(Id=7913,ItemName="MagicFoster",AnimName="Emote_17_Magic_Mike",IconPath="EMOTE_TEX_03.Emote_03_HearMeRoar_512")
   Emotes(53)=(Id=7923,ItemName="MagicFoster_Deluxe",AnimName="Emote_17_Magic_Mike_Deluxe",IconPath="EMOTE_TEX_03.Emote_03_HearMeRoar_DLX_512")
   Emotes(54)=(Id=7908,ItemName="FinalForm",AnimName="Emote_18_Noooooooooooo",IconPath="EMOTE_TEX_03.Emote_03_Nooo_512")
   Emotes(55)=(Id=7918,ItemName="FinalForm_Deluxe",AnimName="Emote_18_Noooooooooooo_Deluxe",IconPath="EMOTE_TEX_03.Emote_03_Nooo_DLX_512")
   Emotes(56)=(Id=7906,ItemName="ZedTime",AnimName="Emote_19_Bullet_Time",IconPath="EMOTE_TEX_03.Emote_03_BulletTime_512")
   Emotes(57)=(Id=7916,ItemName="ZedTime_Deluxe",AnimName="Emote_19_Bullet_Time_Deluxe",IconPath="EMOTE_TEX_03.Emote_03_BulletTime_DLX_512")
   Emotes(58)=(Id=7904,ItemName="CraneFist",AnimName="Emote_20_Kung_Fu",IconPath="EMOTE_TEX_03.Emote_03_KungFu_512")
   Emotes(59)=(Id=7914,ItemName="CraneFist_Deluxe",AnimName="Emote_20_Kung_Fu_Deluxe",IconPath="EMOTE_TEX_03.Emote_03_KungFu_DLX_512")
   EquippedEmoteId=-1
   Name="Default__KFEmoteList"
   ObjectArchetype=Object'Core.Default__Object'
}
