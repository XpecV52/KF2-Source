//=============================================================================
// KFGFxOptionsMenu_GameSettings
//=============================================================================
// This menu will be used to update and display the audio options for the game
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  Zane Gholson -  11/12/2014
//=============================================================================

class KFGFxOptionsMenu_GameSettings extends KFGFxObject_Menu;

var localized string SectionNameString;
var localized string GameSettingsString;
var localized string FOVString;
var localized string FriendlyHudScaleString;
var localized string GoreString;
var localized string ShowCrosshairString;
var localized string WiderString;
var localized string NormalString;
var localized string ClassicWeaponSelectString;
var localized string KillTickerString;

var localized array<string> GoreOptionStrings;

var float FOVMinValue, FOVMaxValue, FOVCurrentValue;
var float FriendlyHudScaleMinValue, FriendlyHudScaleMaxValue;

var const byte SHOW_NO_GORE_LEVEL;

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu(InManager);
  	LocalizeText();
  	InitValues();
}

function LocalizeText()
{
    local GFxObject LocalizedObject, GoreOptions;
    local byte i;

    LocalizedObject = CreateObject( "Object" );

    GoreOptions = CreateArray();

    for (i = 0; i <  GoreOptionStrings.Length; i++)
    {
    	GoreOptions.SetElementString(i, GoreOptionStrings[i]);
    }

	LocalizedObject.SetString("sectionName", SectionNameString);
    LocalizedObject.SetString("header", GameSettingsString);
    LocalizedObject.SetString("fov", FOVString);
    LocalizedObject.SetString("friendlyHud", FriendlyHudScaleString);
    LocalizedObject.SetString("gore", GoreString);
    LocalizedObject.SetString("crosshair", ShowCrosshairString);
    LocalizedObject.SetString("classicWeaponSelect", ClassicWeaponSelectString);
    LocalizedObject.SetObject("goreOptions", GoreOptions);
    LocalizedObject.SetString("wider", WiderString);
    LocalizedObject.SetString("normal", NormalString);
    LocalizedObject.SetString("killTicker", KillTickerString);
    LocalizedObject.SetString("close", Class'KFCommon_LocalizedStrings'.default.BackString);

    SetObject("localizedText", LocalizedObject);
}

function  InitValues()
{
	local GFxObject DataObject;

	SetFOVMinMax(FOVMinValue, FOVMaxValue);
	SetFriendlyHudMinMax(FriendlyHudScaleMinValue, FriendlyHudScaleMaxValue);
	DataObject = CreateObject( "Object" );

	DataObject.SetFloat("fov", 					Class'KFGameEngine'.default.FOVOptionsPercentageValue);
 	DataObject.SetFloat("gore", 				Class'GameInfo'.default.GoreLevel);
 	DataObject.SetFloat("friendlyHud", 			GetFriendlyHudScale());
 	DataObject.SetBool("crosshair", 			Class'KFGameEngine'.static.IsCrosshairEnabled());
 	DataObject.SetBool("classicWeaponSelect",	Class'KFPlayerInput'.default.bQuickWeaponSelect);
 	DataObject.SetBool("killTicker",			Class'KFGameEngine'.default.bShowKillTicker);

 	SetObject("dataValues", DataObject);
}

function float GetFriendlyHudScale()
{
	local KFPlayerController KFPC;
	local KFHUDBase KFHUD;

	KFPC = KFPlayerController(GetPC());

	if(KFPC != none)
	{
		KFHUD = KFHUDBase(KFPC.myHUD);

		if(KFHUD != none)
		{
			return KFHUD.FriendlyHudScale;
		}
		else
		{
			return class'KFHUDBase'.default.FriendlyHudScale;
		}
	}

	return 1.0;
}


//use this funtion to set the min and max fov values.
function SetFOVMinMax( float MinVol, float MaxVol )
{
	ActionScriptVoid("setfovRange");
}

//use this funtion to set the min and max fov values.
function SetFriendlyHudMinMax( float MinVol, float MaxVol )
{
	ActionScriptVoid("setFriendlyHudRange");
}

function Callback_CloseMenu()
{
	Manager.OpenMenu( UI_OptionsSelection );
}

function Callback_ToggleCrosshair( bool bShow )
{
	local KFPlayerController KFPC;
	local KFHUDBase KFHUD;

	KFPC = KFPlayerController(GetPC());
	if( KFPC != none )
	{
		KFHUD = KFHUDBase(KFPC.myHUD);

		if( KFHUD != none )
		{
			KFHUD.bDrawCrosshair = bShow;
		}
	}

	class'KFGameEngine'.static.SetCrosshairEnabled(bShow);
}

function Callback_FOVChanged( float NewFOVPercentage )
{
	local PlayerController PC;
	local KFGameEngine KFGE;

	KFGE = KFGameEngine(Class'Engine'.static.GetEngine());
	KFGE.FOVOptionsPercentageValue = NewFOVPercentage;
	KFGE.SaveConfig();

	class'KFGameEngine'.default.FOVOptionsPercentageValue = NewFOVPercentage;
	class'KFGameEngine'.static.StaticSaveConfig();

	PC = GetPC();

	if( PC != none )
	{
		//update FOV on camera here 
		PC.PlayerCamera.SetFOV( PC.PlayerCamera.DefaultFOV * NewFOVPercentage );
		PC.PlayerCamera.UpdateCamera(0.0);
	}
}

function Callback_FriendlyHudChanged(float NewFriendlyHudScale)
{
	local KFPlayerController KFPC;
	local KFHUDBase KFHUD;

	KFPC = KFPlayerController(GetPC());

	if(KFPC != none)
	{
		KFHUD = KFHUDBase(KFPC.myHUD);

		if(KFHUD != none)
		{
			KFHUD.FriendlyHudScale = NewFriendlyHudScale;
			KFHUD.SaveConfig();
		}
		else
		{
			class'KFHUDBase'.default.FriendlyHudScale = NewFriendlyHudScale;
			class'KFHUDBase'.static.StaticSaveConfig();
		}
	}
}

function Callback_WeaponSelectChanged(bool bActive)
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);
	KFPI.bQuickWeaponSelect = bActive;
	KFPI.SaveConfig();
}

function Callback_KillTickerChanged(bool bActive)
{
	local KFGameEngine KFGE;

	KFGE = KFGameEngine(Class'Engine'.static.GetEngine());
	KFGE.bShowKillTicker = bActive;
	KFGE.SaveConfig();

	class'KFGameEngine'.default.bShowKillTicker = bActive;
	class'KFGameEngine'.static.StaticSaveConfig();
}

function Callback_GoreChanged( byte NewGoreLevel )
{
	local KFGameInfo KFGI; 
	
	if( GetPC().WorldInfo.NetMode == NM_Standalone )
	{
		KFGI = KFGameInfo(GetPC().WorldInfo.Game);
		if(KFGI != none)
		{
			KFGI.GoreLevel = NewGoreLevel;
			KFGI.SaveConfig();
		}
	}
	else
	{
		class'GameInfo'.default.GoreLevel = NewGoreLevel;
		class'GameInfo'.static.StaticSaveConfig();
	}
}

defaultproperties
{
	FOVMinValue=1
	FOVMaxValue=1.25
	FriendlyHudScaleMinValue=0.25
	FriendlyHudScaleMaxValue=1.0
}