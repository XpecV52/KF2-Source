//=============================================================================
// KFGFxPopup_Gamma
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 1/10/2014
//=============================================================================

class KFGFxPopup_Gamma extends KFGFxObject_Popup;

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
#linenumber 14;
//@HSL_MOD_END
var GFxObject GammaSlider;
var string GammaImagePath;

function InitializePopup( KFGFxMoviePlayer_Manager InManager )
{
	local float GammaMult;

    Super.InitializePopup(InManager);

	GammaSlider = GetObject("mainSlider");
	if(Manager.CachedProfile != none)
	{
		Manager.CachedProfile.GetProfileSettingValueFloat(KFID_GammaMultiplier, GammaMult);  
	}

	else if(class'WorldInfo'.static.IsPlayInEditor())
	{
		GammaMult = class'KFGameEngine'.default.DefaultGammaMult;
	}


	// Multiplying by 100 so we can go 0-100 with a snapInterval of 1 for consistency. HSL_BB
	GammaSlider.SetFloat("value", GammaMult*100);
	SetString("imagePath", "img://"$GammaImagePath);

 	Manager.bEnableGammaCorrection = true;
 	Manager.RefreshViewportFlags();
}

event OnClosed()
{
    Super.OnClosed();
    Manager.bEnableGammaCorrection = false;
    Manager.RefreshViewportFlags();
	Manager.SaveConfig();
}

function SetGamma( float GammaValue )
{
	local KFGameEngine KFGE;

	KFGE = KFGameEngine(Class'Engine'.static.GetEngine());
	KFGE.GammaMultiplier = GammaValue;
	KFGE.SaveConfig();

	class'KFGameEngine'.static.SetGamma( GammaValue );
	//class'KFGameEngine'.default.GammaMultiplier = GammaValue;
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_GammaMultiplier, GammaValue);
	Manager.CachedProfile.SetProfileSettingValueInt(KFID_SetGamma, 1);

	class'KFGameEngine'.static.StaticSaveConfig();
}

function ResetGamma()
{
	local float DefaultGamma;
	local KFGameEngine KFGE;
	//@HSL_MOD_BEGIN - amiller 5/25/2016 - Adding support to save extra data into profile settings
	DefaultGamma = Manager.CachedProfile.GetDefaultFloat(KFID_GammaMultiplier);

	// Multiplying by 100 so we can go 0-100 with a snapInterval of 1 for consistency. HSL_BB
	GammaSlider.SetFloat("value", DefaultGamma*100);
	LogInternal("RESET GAMME: DefaultGamma-" @DefaultGamma @"Slider Value -" @(DefaultGamma * 100));
	KFGE = KFGameEngine(Class'Engine'.static.GetEngine());
	KFGE.GammaMultiplier = DefaultGamma;
	KFGE.SaveConfig();

	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_GammaMultiplier, DefaultGamma);
    class'KFGameEngine'.static.SetGamma( DefaultGamma );
	//class'KFGameEngine'.default.GammaMultiplier = DefaultGamma;
//@HSL_MOD_END
	class'KFGameEngine'.static.StaticSaveConfig();
}


function Callback_ClosedPopup()
{
	Manager.bSetGamma = true;
	Manager.CachedProfile.Save( GetLP().ControllerId );
//@SABER_EGS_BEGIN 
	ClosePopUp();
//@SABER_EGS_END
}

function Callback_GammaChanged( float NewGamma )
{
	// Dividing by 100 so we can go 0-100 with a snapInterval of 1 for consistency. HSL_BB
	SetGamma( NewGamma/100 );
}

function Callback_DefaultGamma()
{
	ResetGamma();
}

defaultproperties
{
   GammaImagePath="UI_GammaPopup_TEX.KF2_Brightess_Calibration"
   Name="Default__KFGFxPopup_Gamma"
   ObjectArchetype=KFGFxObject_Popup'KFGame.Default__KFGFxObject_Popup'
}
