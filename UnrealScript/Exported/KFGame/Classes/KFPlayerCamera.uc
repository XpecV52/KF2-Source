//=============================================================================
// KFPlayerCamera
//=============================================================================
// Camera class for KF players
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFPlayerCamera extends GamePlayerCamera
	config(Camera);









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

#linenumber 14;

/** Implements typical third person camera. */
var(Camera) editinline transient KFCustomizationCamera			CustomizationCam;
/** Class to use for third person camera. */
var(Camera) protected const  class<KFCustomizationCamera>      	CustomizationCameraClass;


/** Implements the boss camera. */
var(Camera) editinline transient KFBossCamera					BossCam;
/** Class to use for viewing the boss camera. */
var(Camera) protected const  class<KFBossCamera>      			BossCameraClass;

/** Implements typical first person camera. */
var(Camera) editinline transient KFFirstPersonCamera			FirstPersonCam;
/** Class to use for first person camera. */
var(Camera) protected const  class<GameCameraBase>      		FirstPersonCameraClass;

/*********************************************************************************************
 FOV Blending
********************************************************************************************* */

/** The FOV that the Camera is trying to acheive */
var()	float		TargetFOV;
/** The FOV that was being used at the start of the FOV Transition */
var		float		TransitionStartFOV;
/** How long (in seconds) the camera has been transitioning to TargetFOV */
var		float		TransitionTimeElapsed;
/** How long it should take to transition to the target FOV */
var		float		TransitionTimeTotal;

function PostBeginPlay()
{
	super.PostBeginPlay();

	// Setup camera modes
	if ( (CustomizationCam == None) && (CustomizationCameraClass != None) )
	{
		CustomizationCam = KFCustomizationCamera( CreateCamera(CustomizationCameraClass) );
	}

	// Setup camera modes
	if ( (BossCam == None) && (BossCameraClass != None) )
	{
		BossCam = KFBossCamera( CreateCamera(BossCameraClass) );
	}

	// Setup camera modes
	if ( (FirstPersonCam == None) && (FirstPersonCameraClass != None) )
	{
		FirstPersonCam = KFFirstPersonCamera( CreateCamera(FirstPersonCameraClass) );
	}
}

/** Performs camera update. */
simulated function DoUpdateCamera(float DeltaTime)
{
	// __TW_ZEDTIME_ : Adjust by Pawn's TimeDilation (partial zed time) for camera anims
	Super.DoUpdateCamera(DeltaTime * ViewTarget.Target.CustomTimeDilation);
}

/**
 * UpdateViewTarget
 * Overridden to support FOV Blending
 */
simulated function UpdateViewTarget(out TViewTarget OutVT, float DeltaSeconds)
{
	local float CurrentFOVAngle;
	local float TransitionDelta;

	super.UpdateViewTarget(OutVT,DeltaSeconds);

	if ( CameraActor(OutVT.Target) != None )
	{
		SetFOV(0);	// Give CameraActor control over FOV
	}
	else
	{
		CurrentFOVAngle = GetFOVAngle();
		// Updating the FOV
		if( TransitionTimeTotal > 0.0f && CurrentFOVAngle != TargetFOV )
		{
			TransitionTimeElapsed += DeltaSeconds;
			if( TransitionTimeElapsed > TransitionTimeTotal )
			{
				TransitionTimeElapsed = TransitionTimeTotal;
				TransitionDelta = 1.0;
			}
			else
			{
                TransitionDelta = TransitionTimeElapsed/TransitionTimeTotal;
			}

            //`log("CurrentFOVAngle = "$CurrentFOVAngle$" TransitionDelta = "$TransitionDelta$" TransitionTimeTotal = "$TransitionTimeTotal$" TransitionTimeElapsed = "$TransitionTimeElapsed);

			CurrentFOVAngle = Lerp( TransitionStartFOV, TargetFOV, TransitionDelta );
			super.SetFOV(CurrentFOVAngle);
		}
	}

	// Call this after the FOV has been adjusted
	UpdateCameraLensEffects( OutVT );
}

/**
 * Handle smoothly transitioning between FOVs
 * @param NewFOV specifies the new TargetFOV
 * @param TransitionTime specifies how long in seconds the transition should take
 */
function TransitionFOV(float NewFOV, float TransitionTime)
{
	NewFOV *= GetOptionsFOVScale();

	if( TransitionTime > 0.0f )
	{
		TargetFOV = NewFOV;
		TransitionTimeTotal = TransitionTime;
		TransitionStartFOV = GetFOVAngle();
		TransitionTimeElapsed = 0.0f;
	}
	else
	{
		SetFOV(NewFOV);
		TransitionTimeTotal = 0.0f; // The system won't attempt an FOV transition if TimeTotal is 0.
	}
}

function  float GetOptionsFOVScale()
{
	local float FOVScale;
	local KFProfileSettings Settings;

	if(class'WorldInfo'.static.IsConsoleBuild())
	{
		
		Settings = KFProfileSettings(class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(LocalPlayer(PCOwner.Player).ControllerId));
		FOVScale = Settings.GetProfileFloat(KFID_FOVOptionsPercentageValue);
	}
	else // PC
	{
		FOVScale = class'KFGameEngine'.default.FOVOptionsPercentageValue;
	}
	return FClamp(FOVScale, 0.75f, 1.25f);
}

/**
 * Directly set the FOV with no transition
 */
function SetFOV(float NewFOV)
{
    TransitionTimeTotal = 0.0f;
	TargetFOV = NewFOV;
	super.SetFOV(NewFOV);
}

/** Overriden to use CameraCache.Pov.Location */
static function float CalcRadialShakeScale(Camera Cam, vector Epicenter, float InnerRadius, float OuterRadius, float Falloff)
{
	local Vector			POVLoc;
	local float				DistPct;

	// using camera location so stuff like spectator cameras get shakes applied sensibly as well
	// need to ensure server has reasonably accurate camera position
	POVLoc = Cam.CameraCache.POV.Location;

	if (InnerRadius < OuterRadius)
	{
		DistPct = (VSize(Epicenter - POVLoc) - InnerRadius) / (OuterRadius - InnerRadius);
		DistPct = 1.f - FClamp(DistPct, 0.f, 1.f);
		return DistPct ** Falloff;
	}
	else
	{
		// ignore OuterRadius and do a cliff falloff at InnerRadius
		return (VSize(Epicenter - POVLoc) < InnerRadius) ? 1.f : 0.f;
	}
}

/**
 * Polls game state to determine best camera to use.
 */
protected function GameCameraBase FindBestCameraType(Actor CameraTarget)
{
	if (CameraStyle == 'ThirdPerson')
	{
		return ThirdPersonCam;
	}
	else if (CameraStyle == 'Boss')
	{
		return BossCam;
	}
	else if (CameraStyle == 'Customization')
	{
		return CustomizationCam;
	}
	else if( CameraStyle == 'FirstPerson' )
	{
		return FirstPersonCam;
	}

	return Super.FindBestCameraType(CameraTarget);
}

simulated function Reset();

defaultproperties
{
   CustomizationCameraClass=Class'KFGame.KFCustomizationCamera'
   BossCameraClass=Class'KFGame.KFBossCamera'
   FirstPersonCameraClass=Class'KFGame.KFFirstPersonCamera'
   ThirdPersonCameraClass=Class'KFGame.KFThirdPersonCamera'
   DefaultFOV=90.000000
   FreeCamOffset=(X=0.000000,Y=0.000000,Z=68.000000)
   Name="Default__KFPlayerCamera"
   ObjectArchetype=GamePlayerCamera'GameFramework.Default__GamePlayerCamera'
}
