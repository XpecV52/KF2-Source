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
`include(KFProfileSettings.uci)
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

var float VoIPMin, VoIPMax;

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu(InManager);
  	LocalizeText();
  	InitValues();
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
		LocalizedObject.SetString("controllerSound",Localize("KFGFxOptionsMenu_Audio","ControllerSound","KFGameConsole"));
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

function  InitValues()
{
	local float VoIPCurrent;
	local KFPlayerInput KFPI;
	local bool bControllerSoundEnabled;

	// Don't try to set values of objects that aren't there on Console.
	if( !GetPC().WorldInfo.IsConsoleBuild() )
	{
		KFPI = KFPlayerInput(GetPC().PlayerInput);

		// TODO: This likely needs a PC profile setting - amiller 5/26/2016
		class'KFGameEngine'.static.GetVoIPVolumeRange(VoIPMin, VoIPMax, VoIPCurrent);

		VoIPCurrent = Manager.CachedProfile.GetProfileFloat(KFID_VOIPVolumeMultiplier);

		SetBool("bPushToTalk", class'KFPlayerInput'.default.bRequiresPushToTalk);
		SetFloat("voipVolume", VoIPCurrent/VoIPMax * 100 );
 		SetBool("bPushToTalk", KFPI.bRequiresPushToTalk);
	}
	else
	{
		bControllerSoundEnabled =  Manager.CachedProfile.GetProfileBool(KFID_ControllerSoundEnabled);
		SetBool("controllerSound",bControllerSoundEnabled);
		class'KFGameEngine'.static.SetWWisePADVolume(bControllerSoundEnabled ? 100.f : 0.0f);
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
		Manager.OpenPopup(EGamma, "", class'KFGFxOptionsMenu_Graphics'.default.AdjustGammaDescription, class'KFGFxOptionsMenu_Graphics'.default.ResetGammaString, class'KFGFxOptionsMenu_Graphics'.default.SetGammaString);
	}
	else
	{
		SubSystem = class'GameEngine'.static.GetOnlineSubsystem();

		if( SubSystem != none )
		{
			SubSystem.ShowVOIPConfigUI();	
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
	local bool bWasEnabled;
	// TODO:  add functionality for turning on/off controller sound.
	bWasEnabled = Manager.CachedProfile.GetProfileBool(KFID_ControllerSoundEnabled);
	
	`QAlog(`location@`showvar(bEnabled)@`showvar(bWasEnabled), true);

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

//not implemented yet   This is a stub
function Callback_VOIPVolumeChanged( float NewVolume )
{
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_VOIPVolumeMultiplier, (NewVolume / 100));
	class'KFGameEngine'.static.SetVoIPRecieveVolume( (NewVolume / 100) ); //Steam saves this 
}

function CallBack_ResetAudioOptions()
{
	Manager.OpenPopup( EConfirmation, 
						Localize("KFGFxOptionsMenu_Graphics","WarningPromptString","KFGame"), 
						Localize("KFGFxObject_Menu","ResetDefaults","KFGameConsole"),
						Localize("KFGFxOptionsMenu_Graphics","OKString","KFGame"),
						Localize("KFGFxOptionsMenu_Graphics","CancelString","KFGame"),
						ResetAudioOptions);
}

function ResetAudioOptions()
{
	local KFGameEngine KFGE;

	// Don't try to set values of objects that aren't there on Console.
	if( !GetPC().WorldInfo.IsConsoleBuild() )
	{
		//class'KFGameEngine'.static.GetVoIPVolumeRange(VoIPMin, VoIPMax, VoIPCurrent);
		//SetFloat("voipVolume", /*Default value*/ );
		//SetBool("bPushToTalk", /*Default value*/);
		Manager.CachedProfile.SetProfileSettingValueFloat(KFID_VOIPVolumeMultiplier, Manager.CachedProfile.GetDefaultFloat(KFID_VOIPVolumeMultiplier));
		Manager.CachedProfile.SetProfileSettingValueInt(KFID_RequiresPushToTalk, Manager.CachedProfile.GetDefaultInt(KFID_RequiresPushToTalk));
	}
	else
	{
		// Handle resetting the gamma setting since it is in this menu.
		//DefaultGamma = class'KFGameEngine'.default.DefaultGammaMult;
		

		KFGE = KFGameEngine(Class'Engine'.static.GetEngine());
		KFGE.GammaMultiplier = Manager.CachedProfile.GetDefaultFloat(KFID_GammaMultiplier);
		KFGE.SetGamma(KFGE.GammaMultiplier);
		Manager.CachedProfile.SetProfileSettingValueFloat(KFID_GammaMultiplier,KFGE.GammaMultiplier );
		KFGE.SaveConfig();

		Manager.CachedProfile.SetProfileSettingValueInt(KFID_ControllerSoundEnabled, Manager.CachedProfile.GetDefaultInt(KFID_ControllerSoundEnabled));
	}
	
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_MasterVolumeMultiplier, Manager.CachedProfile.GetDefaultFloat(KFID_MasterVolumeMultiplier));
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_DialogVolumeMultiplier, Manager.CachedProfile.GetDefaultFloat(KFID_DialogVolumeMultiplier));
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_MusicVolumeMultiplier, Manager.CachedProfile.GetDefaultFloat(KFID_MusicVolumeMultiplier));
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_SFXVolumeMultiplier, Manager.CachedProfile.GetDefaultFloat(KFID_SFXVolumeMultiplier));
	Manager.CachedProfile.SetProfileSettingValueInt(KFID_MusicVocalsEnabled, Manager.CachedProfile.GetDefaultInt(KFID_MusicVocalsEnabled));
	Manager.CachedProfile.SetProfileSettingValueInt(KFID_MinimalChatter , Manager.CachedProfile.GetDefaultInt(KFID_MinimalChatter));

	InitValues();
}

defaultproperties
{
	
}