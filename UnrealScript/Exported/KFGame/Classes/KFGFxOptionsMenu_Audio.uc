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

	LocalizedObject.SetString("sectionName", SectionNameString);
	LocalizedObject.SetString("options", OptionsString);
    LocalizedObject.SetString("header", AudioString);
    LocalizedObject.SetString("master", MasterVolumeString);
    LocalizedObject.SetString("dialog", DialogVolumeString);
    LocalizedObject.SetString("music", MusicString);
    LocalizedObject.SetString("sFx", SFxString);
    LocalizedObject.SetString("voipVolume", VOIPVolumeString);
    LocalizedObject.SetString("configureMic", ConfigureMicString);
    LocalizedObject.SetString("pushToTalk", PushToVoIPString);
    LocalizedObject.SetString("vocals", VocalsString);
    LocalizedObject.SetString("battleChatter", BattleChatterString);
    LocalizedObject.SetString("close", Class'KFCommon_LocalizedStrings'.default.BackString);
    SetObject("localizedText", LocalizedObject);
}

function  InitValues()
{
	local float VoIPMin, VoIPMax, VoIPCurrent;

	class'KFGameEngine'.static.GetVoIPVolumeRange(VoIPMin, VoIPMax, VoIPCurrent);
	SetVoIPMinMax(VoIPMin, VoIPMax);
	SetFloat("voipVolume", VoIPCurrent );

	SetFloat("masterVolume", class'KFGameEngine'.default.MasterVolumeMultiplier);
	SetFloat("dialogVolume", class'KFGameEngine'.default.DialogVolumeMultiplier);
	SetFloat("musicVolume", class'KFGameEngine'.default.MusicVolumeMultiplier);
 	SetFloat("sFxVolume", class'KFGameEngine'.default.SFxVolumeMultiplier);
 	SetBool("vocalsEnabled", class'KFGameEngine'.default.bMusicVocalsEnabled);
 	SetBool("battleChatter", class'KFGameEngine'.default.bMinimalChatter);
 	SetBool("bPushToTalk", class'KFPlayerInput'.default.bRequiresPushToTalk);
}

function SetVoIPMinMax( float MinVol, float MaxVol )
{
	ActionScriptVoid("setVOIPVolumeRange");
}

event OnClose()
{
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

	SubSystem = class'GameEngine'.static.GetOnlineSubsystem();

	if( SubSystem != none )
	{
		SubSystem.ShowVOIPConfigUI();	
	}
}

function Callback_ConfigureBattleChatter(bool bMinimalChatter)
{
	class'KFGameEngine'.default.bMinimalChatter = bMinimalChatter;
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
	class'KFGameEngine'.default.bMusicVocalsEnabled = bEnabled;
	KFGameEngine(Class'Engine'.static.GetEngine()).bMusicVocalsEnabled = bEnabled;
}

function Callback_MasterVolumeChanged( float NewVolume )
{
	local float MasterVolumeMultiplier;

	MasterVolumeMultiplier = NewVolume;
	class'KFGameEngine'.static.SetWWiseMasterVolume( MasterVolumeMultiplier);
	class'KFGameEngine'.default.MasterVolumeMultiplier = MasterVolumeMultiplier;
	KFGameEngine(Class'Engine'.static.GetEngine()).MasterVolumeMultiplier = MasterVolumeMultiplier;
}

function Callback_DialogVolumeChanged( float NewVolume )
{
	local float DialogVolumeMultiplier;

	DialogVolumeMultiplier = NewVolume;
	class'KFGameEngine'.static.SetWWiseVoiceVolume( DialogVolumeMultiplier);
	GetPC().SetAudioGroupVolume( 'Voice', DialogVolumeMultiplier / 100 ); //0 - 1 
	class'KFGameEngine'.default.DialogVolumeMultiplier = DialogVolumeMultiplier;
	KFGameEngine(Class'Engine'.static.GetEngine()).DialogVolumeMultiplier = DialogVolumeMultiplier;
}

function Callback_MusicVolumeChanged( float NewVolume )
{
	local float MusicVolumeMultiplier;

	MusicVolumeMultiplier = NewVolume;
	class'KFGameEngine'.static.SetWWiseMusicVolume( MusicVolumeMultiplier);
	GetPC().SetAudioGroupVolume( 'Music', MusicVolumeMultiplier / 100 ); //0 - 1 
	class'KFGameEngine'.default.MusicVolumeMultiplier = MusicVolumeMultiplier;
	KFGameEngine(Class'Engine'.static.GetEngine()).MusicVolumeMultiplier = MusicVolumeMultiplier;
}

function Callback_SFxVolumeChanged( float NewVolume )
{
	local float SFXVolumeMultiplier;

	SFXVolumeMultiplier = NewVolume;
	class'KFGameEngine'.static.SetWWiseSFXVolume( SFXVolumeMultiplier);
	GetPC().SetAudioGroupVolume( 'SFX', SFXVolumeMultiplier / 100 );
	class'KFGameEngine'.default.SFxVolumeMultiplier = SFXVolumeMultiplier;
	KFGameEngine(Class'Engine'.static.GetEngine()).SFxVolumeMultiplier = SFXVolumeMultiplier;
}

//not implemented yet   This is a stub
function Callback_VOIPVolumeChanged( float NewVolume )
{
	class'KFGameEngine'.static.SetVoIPRecieveVolume(NewVolume); //Steam saves this 
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
   Name="Default__KFGFxOptionsMenu_Audio"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
