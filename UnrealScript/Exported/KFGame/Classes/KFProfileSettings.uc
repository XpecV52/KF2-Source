/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

/**
 * This class holds the data used in reading/writing online profile settings.
 * Online profile settings are stored by an external service.
 */
class KFProfileSettings extends OnlineProfileSettings
	native;









const KFID_QuickWeaponSelect = 100;
const KFID_CurrentLayoutIndex = 101;
const KFID_ForceFeedbackEnabled = 103;
const KFID_SavedPerkIndex = 105;
const KFID_AllowBloodSplatterDecals = 106;
const KFID_GoreLevel = 107;
const KFID_StoredCharIndex = 111;
const KFID_MasterVolumeMultiplier = 112;
const KFID_DialogVolumeMultiplier = 113;
const KFID_MusicVolumeMultiplier = 114;
const KFID_SFXVolumeMultiplier = 115;
const KFID_GammaMultiplier = 117;
const KFID_MusicVocalsEnabled = 118;
const KFID_MinimalChatter = 119;
const KFID_ShowCrossHair = 121;
const KFID_FOVOptionsPercentageValue = 122;
const KFID_ShowKillTicker = 123;
const KFID_FriendlyHudScale = 125;
const KFID_FavoriteWeapons = 127;
const KFID_GearLoadouts = 128;
const KFID_SetGamma = 129;
const KFID_RequiresPushToTalk = 130;
const KFID_InvertController = 131;
const KFID_AutoTargetEnabled = 132;
const KFID_GamepadSensitivityScale = 133;
const KFID_ZoomedSensitivityScale = 134;
const KFID_GamepadZoomedSensitivityScale = 135;
const KFID_EnableMouseSmoothing = 136;
const KFID_MouseSensitivity = 138;
const KFID_TargetAdhesionEnabled = 139;
const KFID_TargetFrictionEnabled = 140;
const KFID_InvertMouse = 142;
const KFID_DEPRECATED_143 = 143;
const KFID_SavedSoloModeIndex = 144;
const KFID_SavedSoloMapString = 145;
const KFID_SavedSoloDifficultyIndex = 146;
const KFID_SavedSoloLengthIndex = 147;
const KFID_SavedModeIndex = 148;
const KFID_SavedMapString = 149;
const KFID_SavedDifficultyIndex = 150;
const KFID_SavedLengthIndex = 151;
const KFID_SavedPrivacyIndex = 152;
const KFID_SavedServerTypeIndex = 153;
const KFID_SavedInProgressIndex = 154;
const KFID_ControllerSoundEnabled = 155;
const KFID_MatchmakingRegion = 156;
const KFID_UseAltAimOnDuals = 157; 
const KFID_HideBossHealthBar = 158; 
const KFID_AntiMotionSickness = 159; 
const KFID_ShowWelderInInventory = 160; 
const KFID_AutoTurnOff = 161;			
const KFID_ReduceHightPitchSounds = 162; 
const KFID_ShowConsoleCrossHair = 163;
const KFID_VOIPVolumeMultiplier = 164;
const KFID_WeaponSkinAssociations = 165;
const KFID_SavedEmoteId = 166;
const KFID_DisableAutoUpgrade = 167;
const KFID_SafeFrameScale = 168;
const KFID_Native4kResolution = 169;
const KFID_HideRemoteHeadshotEffects = 170;
const KFID_SavedHeadshotID= 171;
const KFID_ToggleToRun=172;
const KFID_ClassicPlayerInfo=173;
const KFID_VOIPMicVolumeMultiplier = 174;
const KFID_GamepadDeadzoneScale = 175;
const KFID_GamepadAccelerationJumpScale = 176;
const KFID_HasTabbedToStore = 177;
const KFID_AllowSwapTo9mm = 178; 
const KFID_SurvivalStartingWeapIdx=179; 
const KFID_SurvivalStartingGrenIdx=180; 
#linenumber 12

struct native WeaponSkinPairs
{
	var init string	ClassPath;
	var int		SkinId;
};

var transient array<CustomizationInfo> Characters;
var transient array<string> FavoriteWeapons;
var transient array<WeaponSkinPairs> ActiveSkins;
var transient bool Dirty;

event FavoriteWeapon(name WeaponName)
{
	if(FavoriteWeapons.Find(string(WeaponName)) == INDEX_NONE)
	{
		// Only add if unique
		FavoriteWeapons.AddItem(string(WeaponName));
		Dirty = true;
	}
}

event UnFavoriteWeapon(name WeaponName)
{
	local int Index;
	Index = FavoriteWeapons.Find(string(WeaponName));
	if( Index != INDEX_NONE )
	{
		FavoriteWeapons.Remove(Index, 1);
		Dirty = true;
	}
}

event Save( byte ControllerId )
{
	if(Dirty)
	{
		FlattenExtraToProfileSettings();
		if( KFGameEngine(class'Engine'.static.GetEngine()).LocalLoginStatus != LS_UsingLocalProfile )
		{
			class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.WriteProfileSettings(ControllerId, self);
		}
		Dirty = false;
	}
}

native function SaveWeaponSkin(string ClassPath, int Id);
native function ClearWeaponSkin(string ClassPath);

event ApplyWeaponSkin(int ItemDefinition)
{
	local class<KFWeaponDefinition> WeaponDef;
	local int ItemIndex;

	ItemIndex = class'KFWeaponSkinList'.default.Skins.Find('Id', ItemDefinition);

	if(ItemIndex == INDEX_NONE)
	{
		return;
	}

	WeaponDef = class'KFWeaponSkinList'.default.Skins[ItemIndex].WeaponDef;

	if(WeaponDef != none)
	{
		class'KFWeaponSkinList'.Static.SaveWeaponSkin(WeaponDef, ItemDefinition);
	}
}

function bool HasSafeFrameSet()
{
	return GetProfileFloat( KFID_SafeFrameScale ) != 0.f;
}

function bool SetProfileSettingValueInt(int ProfileSettingId,int Value)
{
	if(super.SetProfileSettingValueInt(ProfileSettingId, Value))
	{
		Dirty = true;
		return true;
	}

	//`QALog(`location@"Failed to set value for"@`showvar(ProfileSettingId)@"To"@`showvar(Value));

	return false;
}

function bool SetProfileSettingValueBool(int ProfileSettingId, bool Value)
{
	if(super.SetProfileSettingValueInt(ProfileSettingId, Value ? 1 : 0))
	{
		Dirty = true;
		return true;
	}

	//`QALog(`location@"Failed to set value for"@`showvar(ProfileSettingId)@"To"@`showvar(Value));

	return false;
}

function bool SetProfileSettingValueFloat(int ProfileSettingId,float Value)
{
	if(super.SetProfileSettingValueFloat(ProfileSettingId, Value))
	{
		Dirty = true;
		return true;
	}

	//`QALog(`location@"Failed to set value for"@`showvar(ProfileSettingId)@"To"@`showvar(Value));

	return false;
}

event int GetProfileInt(int ProfileSettingId)
{
	local int tempInt;
	GetProfileSettingValueInt(ProfileSettingId, tempInt);
	return tempInt;
}


event bool GetProfileBool(int ProfileSettingId)
{
	local int tempInt;
	GetProfileSettingValueInt(ProfileSettingId, tempInt);
	return tempInt != 0;
}

event float GetProfileFloat(int ProfileSettingId)
{
	local float tempFloat;
	GetProfileSettingValueFloat(ProfileSettingId, tempFloat);
	return tempFloat;
}

event string GetProfileString(int ProfileSettingId)
{
	local string TempStr;
	GetProfileSettingValue(ProfileSettingId, TempStr);
	return TempStr;
}


function int GetDefaultInt(int ProfileSettingId)
{
	local int tempInt;
	GetProfileSettingDefaultInt(ProfileSettingId, tempInt);
	return tempInt;
}


function bool GetDefaultBool(int ProfileSettingId)
{
	local int tempInt;
	GetProfileSettingDefaultInt(ProfileSettingId, tempInt);
	return tempInt != 0;
}

function float GetDefaultFloat(int ProfileSettingId)
{
	local float tempFloat;
	GetProfileSettingDefaultFloat(ProfileSettingId, tempFloat);
	return tempFloat;
}


native function bool SetCharacterGear(const out CustomizationInfo GearSet);

native function PushProfileSettingsToClasses();

native event SetToDefaults();

//@HSL_MOD_BEGIN - amiller 5/11/2016 - Adding support to save extra data into profile settings
native function FlattenExtraToProfileSettings();
native function ExpandExtraFromProfileSettings();
//@HSL_MOD_END

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   DefaultSettings(0)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=100,Data=(Type=SDT_Int32,Value1=1)))
   DefaultSettings(1)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=101,Data=(Type=SDT_Int32)))
   DefaultSettings(2)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=103,Data=(Type=SDT_Int32,Value1=1)))
   DefaultSettings(3)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=105,Data=(Type=SDT_Int32)))
   DefaultSettings(4)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=106,Data=(Type=SDT_Int32,Value1=1)))
   DefaultSettings(5)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=107,Data=(Type=SDT_Int32)))
   DefaultSettings(6)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=111,Data=(Type=SDT_Int32)))
   DefaultSettings(7)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=112,Data=(Type=SDT_Float,Value1=1112014848)))
   DefaultSettings(8)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=113,Data=(Type=SDT_Float,Value1=1112014848)))
   DefaultSettings(9)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=114,Data=(Type=SDT_Float,Value1=1112014848)))
   DefaultSettings(10)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=115,Data=(Type=SDT_Float,Value1=1112014848)))
   DefaultSettings(11)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=117,Data=(Type=SDT_Float,Value1=1063675494)))
   DefaultSettings(12)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=118,Data=(Type=SDT_Int32)))
   DefaultSettings(13)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=119,Data=(Type=SDT_Int32)))
   DefaultSettings(14)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=121,Data=(Type=SDT_Int32)))
   DefaultSettings(15)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=122,Data=(Type=SDT_Float,Value1=1065353216)))
   DefaultSettings(16)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=123,Data=(Type=SDT_Int32)))
   DefaultSettings(17)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=125,Data=(Type=SDT_Float,Value1=1065353216)))
   DefaultSettings(18)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=127,Data=(Type=SDT_String)))
   DefaultSettings(19)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=128,Data=(Type=SDT_String)))
   DefaultSettings(20)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=129,Data=(Type=SDT_Int32)))
   DefaultSettings(21)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=130,Data=(Type=SDT_Int32)))
   DefaultSettings(22)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=131,Data=(Type=SDT_Int32)))
   DefaultSettings(23)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=133,Data=(Type=SDT_Float,Value1=1065353216)))
   DefaultSettings(24)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=134,Data=(Type=SDT_Float,Value1=1051931443)))
   DefaultSettings(25)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=135,Data=(Type=SDT_Float,Value1=1058642330)))
   DefaultSettings(26)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=138,Data=(Type=SDT_Float,Value1=1106247680)))
   DefaultSettings(27)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=139,Data=(Type=SDT_Int32,Value1=1)))
   DefaultSettings(28)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=140,Data=(Type=SDT_Int32,Value1=1)))
   DefaultSettings(29)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=132,Data=(Type=SDT_Int32,Value1=1)))
   DefaultSettings(30)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=142,Data=(Type=SDT_Int32)))
   DefaultSettings(31)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=136,Data=(Type=SDT_Int32,Value1=1)))
   DefaultSettings(32)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=164,Data=(Type=SDT_Float,Value1=1069547520)))
   DefaultSettings(33)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=174,Data=(Type=SDT_Float,Value1=1112014848)))
   DefaultSettings(34)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=144,Data=(Type=SDT_Int32)))
   DefaultSettings(35)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=145,Data=(Type=SDT_String)))
   DefaultSettings(36)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=146,Data=(Type=SDT_Int32)))
   DefaultSettings(37)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=147,Data=(Type=SDT_Int32)))
   DefaultSettings(38)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=148,Data=(Type=SDT_Int32)))
   DefaultSettings(39)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=149,Data=(Type=SDT_String)))
   DefaultSettings(40)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=150,Data=(Type=SDT_Int32)))
   DefaultSettings(41)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=151,Data=(Type=SDT_Int32)))
   DefaultSettings(42)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=152,Data=(Type=SDT_Int32)))
   DefaultSettings(43)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=153,Data=(Type=SDT_Int32)))
   DefaultSettings(44)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=154,Data=(Type=SDT_Int32)))
   DefaultSettings(45)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=155,Data=(Type=SDT_Int32)))
   DefaultSettings(46)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=156,Data=(Type=SDT_String)))
   DefaultSettings(47)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=157,Data=(Type=SDT_Int32)))
   DefaultSettings(48)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=158,Data=(Type=SDT_Int32)))
   DefaultSettings(49)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=159,Data=(Type=SDT_Int32)))
   DefaultSettings(50)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=160,Data=(Type=SDT_Int32)))
   DefaultSettings(51)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=161,Data=(Type=SDT_Int32)))
   DefaultSettings(52)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=162,Data=(Type=SDT_Int32)))
   DefaultSettings(53)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=167,Data=(Type=SDT_Int32)))
   DefaultSettings(54)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=170,Data=(Type=SDT_Int32,Value1=1)))
   DefaultSettings(55)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=165,Data=(Type=SDT_String)))
   DefaultSettings(56)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=163,Data=(Type=SDT_Int32,Value1=1)))
   DefaultSettings(57)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=166,Data=(Type=SDT_Int32,Value1=-1)))
   DefaultSettings(58)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=171,Data=(Type=SDT_Int32,Value1=-1)))
   DefaultSettings(59)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=168,Data=(Type=SDT_Float)))
   DefaultSettings(60)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=169,Data=(Type=SDT_Int32)))
   DefaultSettings(61)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=172,Data=(Type=SDT_Int32,Value1=1)))
   DefaultSettings(62)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=173,Data=(Type=SDT_Int32)))
   DefaultSettings(63)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=175,Data=(Type=SDT_Float,Value1=1045220557)))
   DefaultSettings(64)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=176,Data=(Type=SDT_Float,Value1=1053609165)))
   DefaultSettings(65)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=177,Data=(Type=SDT_Int32)))
   DefaultSettings(66)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=178,Data=(Type=SDT_Int32)))
   DefaultSettings(67)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=179,Data=(Type=SDT_Int32)))
   DefaultSettings(68)=(Owner=OPPO_Game,ProfileSetting=(PropertyId=180,Data=(Type=SDT_Int32)))
   VersionNumber=6
   ProfileMappings(0)=(Id=100,Name="Quick Weapon Select",MappingType=PVMT_RawValue,ValueMappings=((Id=0),))
   ProfileMappings(1)=(Id=101,Name="Current Layout Index",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0)))
   ProfileMappings(2)=(Id=103,Name="Force Feedback Enabled",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0)))
   ProfileMappings(3)=(Id=105,Name="Saved Perk Index",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0),(Id=0)))
   ProfileMappings(4)=(Id=106,Name="Allow Blood Splatter Decals")
   ProfileMappings(5)=(Id=107,Name="Gore Level",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0),(Id=0)))
   ProfileMappings(6)=(Id=111,Name="Stored Character Index",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0),(Id=0)))
   ProfileMappings(7)=(Id=112,Name="Master Volume Multi",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0),(Id=0),(Id=0),(Id=0),(Id=0),(Id=0),(Id=0),(Id=0),(Id=0),(Id=0),(Id=0)))
   ProfileMappings(8)=(Id=113,Name="Dialog Volume Multi",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0),(Id=0),(Id=0),(Id=0),(Id=0),(Id=0),(Id=0),(Id=0),(Id=0),(Id=0),(Id=0)))
   ProfileMappings(9)=(Id=114,Name="Music Volume Multi",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0)))
   ProfileMappings(10)=(Id=115,Name="SFX Volume Multi",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0)))
   ProfileMappings(11)=(Id=117,Name="Gamma Multiplier",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0)))
   ProfileMappings(12)=(Id=118,Name="Music Vocals Enabled",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0)))
   ProfileMappings(13)=(Id=119,Name="Minimal Chatter",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0),(Id=0)))
   ProfileMappings(14)=(Id=121,Name="Show Crosshair",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0)))
   ProfileMappings(15)=(Id=122,Name="FOV Options Percentage",MappingType=PVMT_RawValue,ValueMappings=(,(Id=0)))
   ProfileMappings(16)=(Id=123,Name="FOV Options Percentage")
   ProfileMappings(17)=(Id=125,Name="Friendly HUD Scale")
   ProfileMappings(18)=(Id=127,Name="Favorite Weapons")
   ProfileMappings(19)=(Id=128,Name="Gear Loadouts")
   ProfileMappings(20)=(Id=129,Name="Set Gamma")
   ProfileMappings(21)=(Id=130,Name="RequiresPushToTalk")
   ProfileMappings(22)=(Id=131,Name="controllerInvertedValue")
   ProfileMappings(23)=(Id=132,Name="AutoTarget Enabled")
   ProfileMappings(24)=(Id=133,Name="GamepadSensitivityScale")
   ProfileMappings(25)=(Id=134,Name="Zoomed Sensitivity")
   ProfileMappings(26)=(Id=135,Name="Gamepad Zoomed Sensitivity")
   ProfileMappings(27)=(Id=138,Name="View acceleration enabled")
   ProfileMappings(28)=(Id=139,Name="aimAssistRotationValue")
   ProfileMappings(29)=(Id=140,Name="aimAssistSlowDownValue")
   ProfileMappings(30)=(Id=142,Name="invertedValue")
   ProfileMappings(31)=(Id=136,Name="mouseSmoothingLabel")
   ProfileMappings(32)=(Id=164,Name="VOIPVolumeMultiplier")
   ProfileMappings(33)=(Id=174,Name="VoipMicVolumeMultiplier")
   ProfileMappings(34)=(Id=144,Name="SavedSoloModeIndex")
   ProfileMappings(35)=(Id=145,Name="SavedSoloMapString")
   ProfileMappings(36)=(Id=146,Name="SavedSoloDifficultyIndex")
   ProfileMappings(37)=(Id=147,Name="SavedSoloLengthIndex")
   ProfileMappings(38)=(Id=148,Name="SavedModeIndex")
   ProfileMappings(39)=(Id=149,Name="SavedMapString")
   ProfileMappings(40)=(Id=150,Name="SavedDifficultyIndex")
   ProfileMappings(41)=(Id=151,Name="SavedLengthIndex")
   ProfileMappings(42)=(Id=152,Name="SavedPrivacyIndex")
   ProfileMappings(43)=(Id=153,Name="SavedServerTypeIndex")
   ProfileMappings(44)=(Id=154,Name="SavedInProgressIndex")
   ProfileMappings(45)=(Id=155,Name="Controller Sound Enabled")
   ProfileMappings(46)=(Id=156,Name="Matchmaking Region")
   ProfileMappings(47)=(Id=175,Name="Gamepad Deadzone")
   ProfileMappings(48)=(Id=176,Name="Gamepad Acceleration Jump")
   ProfileMappings(49)=(Id=157,Name="Use alt Dual Aim")
   ProfileMappings(50)=(Id=158,Name="Hide Boss Health Bar")
   ProfileMappings(51)=(Id=159,Name="Anti Motion Sickness")
   ProfileMappings(52)=(Id=160,Name="Show Welder in Inventory")
   ProfileMappings(53)=(Id=161,Name="Auto Turn off")
   ProfileMappings(54)=(Id=162,Name="Reduce High Pitch Sounds")
   ProfileMappings(55)=(Id=167,Name="Disable Auto Upgrade")
   ProfileMappings(56)=(Id=170,Name="Hide Remote Player Headshot Effects")
   ProfileMappings(57)=(Id=165,Name="Weapon Skin KeyValue Pairs")
   ProfileMappings(58)=(Id=163,Name="Show Console Crosshair")
   ProfileMappings(59)=(Id=166,Name="Saved Emote ID")
   ProfileMappings(60)=(Id=171,Name="Saved Headshot ID")
   ProfileMappings(61)=(Id=168,Name="Safe Frame")
   ProfileMappings(62)=(Id=169,Name="Native 4k Resolution")
   ProfileMappings(63)=(Id=172,Name="Toggle To Run")
   ProfileMappings(64)=(Id=173,Name="Legacy Health Bars")
   ProfileMappings(65)=(Id=177,Name="Has Tabbed To Store")
   ProfileMappings(66)=(Id=177,Name="Has Tabbed To Store")
   ProfileMappings(67)=(Id=178,Name="AllowSwitchTo9mm")
   ProfileMappings(68)=(Id=179,Name="Survival Starting Weapon Index")
   ProfileMappings(69)=(Id=180,Name="Survival Starting Grenade Index")
   Name="Default__KFProfileSettings"
   ObjectArchetype=OnlineProfileSettings'Engine.Default__OnlineProfileSettings'
}
