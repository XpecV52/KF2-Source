//=============================================================================
// KFGFxOptionsMenu_Audio
//=============================================================================
// This menu will be used to update and display the audio options for the game
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  Zane Gholson -  9/29/2014
//=============================================================================

class KFGFxOptionsMenu_Audio extends KFGFxObject_Menu;

//@HSL_MOD_BEGIN - amiller 5/25/2016 - Adding support to save extra data into profile settings








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
#linenumber 14
//@HSL_MOD_END
var localized string SectionNameString;
var localized string OptionsString;
var localized string AudioString;
var localized string DialogVolumeString;
var localized string MasterVolumeString;
var localized string MusicString;
var localized string SFxString;
var localized string VOIPVolumeString;
var localized string ConfigureMicString;
var localized string VocalsString;
var localized string BattleChatterString;
var localized string PushToVoIPString;
var localized string ScreenSizeString;

var float VoIPMin, VoIPMax;

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu(InManager);
  	LocalizeText();
  	InitValues();
  	ConditionallyHideDurangoButton();
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = CreateObject( "Object" );

    LocalizedObject.SetString("master", MasterVolumeString);
    LocalizedObject.SetString("dialog", DialogVolumeString);
    LocalizedObject.SetString("music", MusicString);
    LocalizedObject.SetString("sFx", SFxString);

	// Console adds the gamma button and video section so change the localization so it is correct. 
	if ( GetPC().WorldInfo.IsConsoleBuild() )
	{
		// Cobbling together the "Audio" and "Video" localization strings to make AUDIO/VIDEO.
		LocalizedObject.SetString("header", Caps(class'KFGFxOptionsMenu_Selection'.default.OptionStrings[OM_Audio])$"/"$Caps(class'KFGFxOptionsMenu_Selection'.default.OptionStrings[OM_Video]));
		// This should just be Audio string
		LocalizedObject.SetString("sectionName", Caps(class'KFGFxOptionsMenu_Selection'.default.OptionStrings[1]));
		// This should just be Video string
		LocalizedObject.SetString("options", Caps(class'KFGFxOptionsMenu_Selection'.default.OptionStrings[0]));
		LocalizedObject.SetString("configureMic", class'KFGFxOptionsMenu_Graphics'.default.AdjustGammaString);

		LocalizedObject.SetString("screenSize", ScreenSizeString); //durango option only

		// Controller sound available for PS4 only
		if( class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis) )
		{
			LocalizedObject.SetString("controllerSound", Localize("KFGFxOptionsMenu_Audio","ControllerSound","KFGameConsole"));
		}
	}
	else
	{
		LocalizedObject.SetString("header", Caps(class'KFGFxOptionsMenu_Selection'.default.OptionStrings[OM_Audio]));
		LocalizedObject.SetString("sectionName", SectionNameString);
		LocalizedObject.SetString("options", OptionsString);
		LocalizedObject.SetString("configureMic", ConfigureMicString);
		// Not going to set these values on Console so only add them on PC.
		LocalizedObject.SetString("voipVolume", VOIPVolumeString);
		LocalizedObject.SetString("pushToTalk", PushToVoIPString);
		LocalizedObject.SetString("resetDefault", Localize("KFGFxOptionsMenu_Graphics","DefaultString","KFGame"));
	}
    LocalizedObject.SetString("vocals", VocalsString);
    LocalizedObject.SetString("battleChatter", BattleChatterString);
    LocalizedObject.SetString("close", Class'KFCommon_LocalizedStrings'.default.BackString);
    SetObject("localizedText", LocalizedObject);
}

function ConditionallyHideDurangoButton()
{
	local GfxObject ScreenSizeButton;
	if(!class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Durango))
	{
		//hide screensize button
		ScreenSizeButton = GetObject("screenSizeButton");

		if(ScreenSizeButton != none)
		{
			ScreenSizeButton.SetVisible(false);
		}
	}
}

function  InitValues()
{
	local float VoIPCurrent;
	local KFPlayerInput KFPI;
	local bool bControllerSoundEnabled;
	local GFxObject ControllerSndObj;

	// Don't try to set values of objects that aren't there on Console.
	if( GetPC().WorldInfo.IsConsoleBuild() )
	{
		bControllerSoundEnabled = Manager.CachedProfile.GetProfileBool(KFID_ControllerSoundEnabled);
		SetBool("controllerSound", bControllerSoundEnabled);
		class'KFGameEngine'.static.SetWWisePADVolume(bControllerSoundEnabled ? 100.f : 0.0f);

		// Hide controller sound for any thing that isn't PS4
		if( !GetPC().WorldInfo.IsConsoleBuild(CONSOLE_Orbis) )
		{
			ControllerSndObj = GetObject("controllerSoundCheckBox");
			if (ControllerSndObj != None)
			{
				ControllerSndObj.SetVisible(false);
			}
		}
	}
	else
	{
		KFPI = KFPlayerInput(GetPC().PlayerInput);

		// Retrieve current volume from online sub (indirectly from profile) along with min/max
		class'KFGameEngine'.static.GetVoIPVolumeRange(VoIPMin, VoIPMax, VoIPCurrent);
		// convert to % for the slider
		SetFloat("voipVolume", VoIPCurrent / VoIPMax * 100);

		SetBool("bPushToTalk", class'KFPlayerInput'.default.bRequiresPushToTalk);
		SetBool("bPushToTalk", KFPI.bRequiresPushToTalk);
	}

	SetFloat("masterVolume", Manager.CachedProfile.GetProfileFloat(KFID_MasterVolumeMultiplier));
	SetFloat("dialogVolume", Manager.CachedProfile.GetProfileFloat(KFID_DialogVolumeMultiplier));
	SetFloat("musicVolume", Manager.CachedProfile.GetProfileFloat(KFID_MusicVolumeMultiplier));
	SetFloat("sFxVolume", Manager.CachedProfile.GetProfileFloat(KFID_SFXVolumeMultiplier));
	SetBool("vocalsEnabled", Manager.CachedProfile.GetProfileBool(KFID_MusicVocalsEnabled));
 	SetBool("battleChatter", Manager.CachedProfile.GetProfileBool(KFID_MinimalChatter));
}

function SetVoIPMinMax( float MinVol, float MaxVol )
{
	ActionScriptVoid("setVOIPVolumeRange");
}

event OnClose()
{
	Manager.CachedProfile.Save( GetLP().ControllerId );
 	SaveConfigValues();
}

//Do this when we close the menu so that we do not constantly write to the config.
function SaveConfigValues()
{
	class'KFGameEngine'.static.StaticSaveConfig();
	class'KFGameEngine'.static.GetEngine().SaveConfig();
}

function Callback_ScreenSizePress()
{
	//show the screen size pop up here
	Manager.OpenScreenSizeMovie();
}

function Callback_CloseMenu()
{
	Manager.OpenMenu( UI_OptionsSelection );
}

function Callback_ConfigureMicPress()
{
	local OnlineSubsystem SubSystem;

	// Console swaps the config mic button for Gamma setting so show that pop up instead.
	if( GetPC().WorldInfo.IsConsoleBuild() )
	{
		Manager.SetVariableBool("bStartUpGamma", false);  // Let the manager know if we are gamma for start up so we can block backing out of the popup - HSL
		Manager.DelayedOpenPopup(EGamma,EDPPID_Gamma, "", class'KFGFxOptionsMenu_Graphics'.default.AdjustGammaDescription, class'KFGFxOptionsMenu_Graphics'.default.ResetGammaString, class'KFGFxOptionsMenu_Graphics'.default.SetGammaString);
	}
	else
	{
		SubSystem = class'GameEngine'.static.GetOnlineSubsystem();

		if( SubSystem != none )
		{
			//@SABER_EGS_BEGIN
			if (class'WorldInfo'.static.isEOSBuild())
			{
				// In-game popup winwow with Mic configuration
				Manager.DelayedOpenPopup(EOptionMic, EDPPID_ExitToMainMenu, 
				Class'KFCommon_LocalizedStrings'.default.MicrophonePopupTitleString, 
				"", 
				Class'KFCommon_LocalizedStrings'.default.OKString,
				Class'KFCommon_LocalizedStrings'.default.CancelString);
			}
			else 
			{
				// Overlay window with Mic configuration
				SubSystem.ShowVOIPConfigUI();
			}
			//@SABER_EGS_END
		}
	}
}

function Callback_ConfigureBattleChatter(bool bMinimalChatter)
{
	Manager.CachedProfile.SetProfileSettingValueInt(KFID_MinimalChatter, bMinimalChatter ? 1 : 0);

	KFGameEngine(Class'Engine'.static.GetEngine()).bMinimalChatter = bMinimalChatter;
}

function Callback_PushToTalkChanged(bool bValue)
{
	local PlayerController PC;
	local KFPlayerInput KFPI;

	PC = GetPC();
	if(PC != none)
	{
		KFPI = KFPlayerInput(GetPC().PlayerInput);
		if(KFPI != none)
		{
			KFPI.UpdatePushToTalk(bValue);
		}
	}
}

function Callback_ConfigureVocals( bool bEnabled )
{
	Manager.CachedProfile.SetProfileSettingValueInt(KFID_MusicVocalsEnabled, bEnabled ? 1 : 0);
	KFGameEngine(Class'Engine'.static.GetEngine()).bMusicVocalsEnabled = bEnabled;
}

function Callback_ConfigureControllerSound( bool bEnabled )
{







	Manager.CachedProfile.SetProfileSettingValueInt(KFID_ControllerSoundEnabled, bEnabled ? 1 : 0);
	KFGameEngine(Class'Engine'.static.GetEngine()).PadVolumeMultiplier = bEnabled ? 100.0f : 0.0f;
	class'KFGameEngine'.static.SetWWisePADVolume(bEnabled ? 100.0f : 0.0f);
}

function Callback_MasterVolumeChanged( float NewVolume )
{
	local float MasterVolumeMultiplier;
	MasterVolumeMultiplier = NewVolume;
	class'KFGameEngine'.static.SetWWiseMasterVolume( MasterVolumeMultiplier);
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_MasterVolumeMultiplier, MasterVolumeMultiplier);
	KFGameEngine(Class'Engine'.static.GetEngine()).MasterVolumeMultiplier = MasterVolumeMultiplier;
}

function Callback_DialogVolumeChanged( float NewVolume )
{
	local float DialogVolumeMultiplier;

	DialogVolumeMultiplier = NewVolume;
	class'KFGameEngine'.static.SetWWiseVoiceVolume( DialogVolumeMultiplier);
	GetPC().SetAudioGroupVolume( 'Voice', DialogVolumeMultiplier / 100 ); //0 - 1 
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_DialogVolumeMultiplier, DialogVolumeMultiplier);
	KFGameEngine(Class'Engine'.static.GetEngine()).DialogVolumeMultiplier = DialogVolumeMultiplier;
}

function Callback_MusicVolumeChanged( float NewVolume )
{
	local float MusicVolumeMultiplier;

	MusicVolumeMultiplier = NewVolume;
	class'KFGameEngine'.static.SetWWiseMusicVolume( MusicVolumeMultiplier);
	GetPC().SetAudioGroupVolume( 'Music', MusicVolumeMultiplier / 100 ); //0 - 1 
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_MusicVolumeMultiplier, MusicVolumeMultiplier);
	KFGameEngine(Class'Engine'.static.GetEngine()).MusicVolumeMultiplier = MusicVolumeMultiplier;
}

function Callback_SFxVolumeChanged( float NewVolume )
{
	local float SFXVolumeMultiplier;

	SFXVolumeMultiplier = NewVolume;
	class'KFGameEngine'.static.SetWWiseSFXVolume( SFXVolumeMultiplier);
	GetPC().SetAudioGroupVolume( 'SFX', SFXVolumeMultiplier / 100 );
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_SFXVolumeMultiplier, SFXVolumeMultiplier);
	KFGameEngine(Class'Engine'.static.GetEngine()).SFxVolumeMultiplier = SFXVolumeMultiplier;
}

function Callback_VOIPVolumeChanged( float SliderValue )
{
	local float NewVolume;

	// VoIPMax should be initialized by now
	if ( VoIPMax > 0 )
	{
		// convert from % back to multiplier (expected by OnlineSub)
		NewVolume = (SliderValue / 100) * VoIPMax;
		Manager.CachedProfile.SetProfileSettingValueFloat(KFID_VOIPVolumeMultiplier, NewVolume);
		class'KFGameEngine'.static.SetVoIPRecieveVolume( NewVolume ); //Steam saves this 
	}
}

function CallBack_ResetAudioOptions()
{
	Manager.DelayedOpenPopup( EConfirmation, EDPPID_Misc,
						Localize("KFGFxOptionsMenu_Graphics","WarningPromptString","KFGame"), 
						Localize("KFGFxObject_Menu","ResetDefaults","KFGameConsole"),
						Localize("KFGFxOptionsMenu_Graphics","OKString","KFGame"),
						Localize("KFGFxOptionsMenu_Graphics","CancelString","KFGame"),
						ResetAudioOptions);
}

function ResetAudioOptions()
{
	local KFGameEngine KFGE;
	local float FloatValue;
	local float DefaultGamma;
	
	// Don't try to set values of objects that aren't there on Console.
	if( !GetPC().WorldInfo.IsConsoleBuild() )
	{
		Manager.CachedProfile.SetProfileSettingValueInt(KFID_RequiresPushToTalk, Manager.CachedProfile.GetDefaultInt(KFID_RequiresPushToTalk));
	
		FloatValue = Manager.CachedProfile.GetDefaultFloat(KFID_VOIPVolumeMultiplier);		
		Manager.CachedProfile.SetProfileSettingValueFloat(KFID_VOIPVolumeMultiplier, FloatValue);
		class'KFGameEngine'.static.SetVoIPRecieveVolume(FloatValue);
	}
	else
	{
		// Handle resetting the gamma setting since it is in this menu.
		DefaultGamma = Manager.CachedProfile.GetDefaultFloat(KFID_GammaMultiplier);

		// Multiplying by 100 so we can go 0-100 with a snapInterval of 1 for consistency. HSL_BB
		KFGE = KFGameEngine(Class'Engine'.static.GetEngine());
		KFGE.GammaMultiplier = DefaultGamma;
		KFGE.SaveConfig();

		Manager.CachedProfile.SetProfileSettingValueFloat(KFID_GammaMultiplier, DefaultGamma);
		class'KFGameEngine'.static.SetGamma(DefaultGamma);

		Manager.CachedProfile.SetProfileSettingValueInt(KFID_ControllerSoundEnabled, Manager.CachedProfile.GetDefaultInt(KFID_ControllerSoundEnabled));
	}
	
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_MasterVolumeMultiplier, Manager.CachedProfile.GetDefaultFloat(KFID_MasterVolumeMultiplier));
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_DialogVolumeMultiplier, Manager.CachedProfile.GetDefaultFloat(KFID_DialogVolumeMultiplier));
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_MusicVolumeMultiplier, Manager.CachedProfile.GetDefaultFloat(KFID_MusicVolumeMultiplier));
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_SFXVolumeMultiplier, Manager.CachedProfile.GetDefaultFloat(KFID_SFXVolumeMultiplier));
	Manager.CachedProfile.SetProfileSettingValueInt(KFID_MusicVocalsEnabled, Manager.CachedProfile.GetDefaultInt(KFID_MusicVocalsEnabled));
	Manager.CachedProfile.SetProfileSettingValueInt(KFID_MinimalChatter , Manager.CachedProfile.GetDefaultInt(KFID_MinimalChatter));

	Callback_MasterVolumeChanged(Manager.CachedProfile.GetDefaultFloat(KFID_MasterVolumeMultiplier));
	Callback_DialogVolumeChanged(Manager.CachedProfile.GetDefaultFloat(KFID_DialogVolumeMultiplier));
	Callback_MusicVolumeChanged(Manager.CachedProfile.GetDefaultFloat(KFID_MusicVolumeMultiplier));
	Callback_SFxVolumeChanged(Manager.CachedProfile.GetDefaultFloat(KFID_SFXVolumeMultiplier));
	Callback_ConfigureVocals(bool(Manager.CachedProfile.GetDefaultInt(KFID_MusicVocalsEnabled)));
	Callback_ConfigureBattleChatter(bool(Manager.CachedProfile.GetDefaultInt(KFID_MinimalChatter)));
	

	Manager.CachedProfile.Save(GetLP().ControllerId);
	SaveConfigValues();
	InitValues();
}

defaultproperties
{
   SectionNameString="VOLUME"
   OptionsString="OPTIONS"
   AudioString="AUDIO OPTIONS"
   DialogVolumeString="Dialog Volume"
   MasterVolumeString="Master Volume"
   MusicString="In-Game Music Volume"
   SFxString="SFX Volume"
   VOIPVolumeString="Voice Chat Receive Volume"
   ConfigureMicString="CONFIGURE MICROPHONE"
   VocalsString="Music Vocals"
   BattleChatterString="Minimize Battle Chatter"
   PushToVoIPString="Push to VoIP"
   ScreenSizeString="ADJUST SCREEN SIZE"
   Name="Default__KFGFxOptionsMenu_Audio"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
