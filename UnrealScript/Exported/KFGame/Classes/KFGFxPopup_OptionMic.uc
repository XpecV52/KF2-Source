//=============================================================================
// KFGFxPopup_OptionMic
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 SABER Interactive
//  - Author Pavel Rodionov 14/11/2019
//=============================================================================

//@SABER_EGS_BEGIN
class KFGFxPopup_OptionMic extends KFGFxObject_Popup
config(Microphone);








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

var float micVolume;
var config int deviceIndex;

var OnlineSubsystemSteamworks SubSystem;

function InitializePopup( KFGFxMoviePlayer_Manager InManager )
{
    Super.InitializePopup(InManager);

    SubSystem = OnlineSubsystemSteamworks(class'GameEngine'.static.GetOnlineSubsystem());

    setLocalizedText();

    getDevicesListFromVivox();
    selectDevice();
    setMicVolume();
}

function setLocalizedText()
{
    local GFxObject LocalizedStringsObject;

    LocalizedStringsObject = CreateObject("Object");

    LocalizedStringsObject.SetString("devicesTextField", Class'KFCommon_LocalizedStrings'.default.MicrophonePopupSelectDeviceString);
    LocalizedStringsObject.SetString("sliderTextField", Class'KFCommon_LocalizedStrings'.default.MicrophonePopupVolumeString);
    LocalizedStringsObject.SetString("checkMicButton", Class'KFCommon_LocalizedStrings'.default.MicrophonePopupCheckString);
    LocalizedStringsObject.SetString("stopMicButton", Class'KFCommon_LocalizedStrings'.default.MicrophonePopupStopString);
    LocalizedStringsObject.SetString("refreshButton", Class'KFCommon_LocalizedStrings'.default.MicrophonePopupRefreshString);

    SetObject("setTextLocalized", LocalizedStringsObject);
}

function getDevicesListFromVivox()
{
    local array<string> audioDevices;
    local int i;
    local GFxObject DataProvider;
    DataProvider = CreateArray();

    if( SubSystem != none )
	{
		audioDevices = Subsystem.GetVivoxAudioDevices();

        for (i = 0; i < audioDevices.length; i++)
        {
            DataProvider.SetElementString(i, audioDevices[i]);
        }

        SetObject("fillDevicesList", DataProvider);
	}
}

function selectDevice()
{
    LogInternal(getFuncName()@"deviceIndex:"@deviceIndex);
    SetInt("selectDevices", deviceIndex);
}

function setMicVolume()
{
    micVolume = Manager.CachedProfile.GetProfileFloat(KFID_VOIPMicVolumeMultiplier);
    LogInternal(getFuncName()@"micVolume:"@micVolume);		
    SetFloat("setMicVolume", micVolume);
}


//Action scripts callbacks
function Callback_onBtnAcceptClick()
{
    if( SubSystem != none )
    {
        Subsystem.VivoxEchoTestStop();
    }
    Manager.CachedProfile.SetProfileSettingValueFloat(KFID_VOIPMicVolumeMultiplier, micVolume);
    SaveConfig();
    ClosePopUp();
}

function Callback_onBtnDeclineClick()
{
    if( SubSystem != none )
    {
        Subsystem.VivoxEchoTestStop();
    }
    ClosePopUp();
}

function Callback_DeviceSelect(int newDeviceIndex)
{
    LogInternal(getFuncName()@"deviceIndex:"@newDeviceIndex);
     deviceIndex = newdeviceIndex;
    if( SubSystem != none )
	{
		Subsystem.SetVivoxMicDevice(deviceIndex);
	}
}

function Callback_onRefreshButtonClick()
{
    LogInternal(getFuncName());
    getDevicesListFromVivox();
}

function Callback_MicVolumeChanged(float NewVolume)
{
    LogInternal(getFuncName()@"volume:"@NewVolume);
    micVolume = NewVolume;
    OSS_SetVoIPMicVolume(newVolume);
}

function OSS_SetVoIPMicVolume(float NewVolume)
{
	if( SubSystem != none )
	{
		Subsystem.SetVoIPMicVolume(NewVolume);
	}
}

function Callback_onCheckMicClick()
{
    LogInternal(getFuncName());
    if( SubSystem != none )
	{
		Subsystem.VivoxEchoTestStart();
	}
}

function Callback_onStopMicClick()
{
    LogInternal(getFuncName());
    if( SubSystem != none )
	{
		Subsystem.VivoxEchoTestStop();
	}
}

//@SABER_EGS_END

defaultproperties
{
   Name="Default__KFGFxPopup_OptionMic"
   ObjectArchetype=KFGFxObject_Popup'KFGame.Default__KFGFxObject_Popup'
}
