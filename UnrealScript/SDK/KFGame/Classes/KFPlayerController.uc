//=============================================================================
// KFPlayerController
//=============================================================================
// Player Controller for KFGame
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPlayerController extends GamePlayerController
	native(Controller)
	nativereplication
	dependson(EphemeralMatchStats);

`include(KFOnlineStats.uci)
`include(KFGameAnalytics.uci)
`include(KFGame\KFMatchStats.uci);

/*********************************************************************************************
 * @name Perks
********************************************************************************************* */

enum ETextChatChannel
{
	ETCC_ALL,
	ETCC_TEAM,
};

enum EVoiceChannel
{
	EVC_ALL,
	EVC_TEAM,
};

struct native PlayerStats
{
	var int PrimaryXP;
	var int SecondaryXP;
};

/** The Perk */
struct native PerkInfo
{
  	var class<KFPerk> 	PerkClass;
  	var byte			PerkLevel;	// This perk level is specifically used for clientside UI
  	var KFPerk			PerkArchetype;
};

struct native PlayerSteamAvatar
{
	var Texture2D Avatar;
	var UniqueNetId NetID;
};

struct native PlayerAvatarPS4
{
	var string AvatarURL;
	var string PlayerName;
	var KFHTTPImageDownloader ImageDownloader;
};


/** Spawn information for player zeds (Versus) */
struct native sPlayerZedSpawnInfo
{
	var class<KFPawn_Monster> PendingZedPawnClass;
	var vector PendingZedSpawnLocation;
	var float LastSpawnedTime;
};

var ETextChatChannel CurrentTextChatChannel;

var EVoiceChannel CurrentVoiceChannel;

var array<PlayerSteamAvatar>AvatarList;
var array<PlayerAvatarPS4> AvatarListPS4;

var array<PerkInfo>		PerkList;
/* Currently selected (active) perk */
var repnotify KFPerk   	CurrentPerk;
/** These are updated by the client and exist only on the server. They are used for updating our perk between waves */
var class<KFPerk>		ServPendingPerkClass;
var int					ServPendingPerkBuild;
var int					ServPendingPerkLevel;
/** When true, the server has asked the client for perk data but the client has not yet responded */
var bool 				bWaitingForClientPerkData;
/** Used for player controlled zeds */
var class<KFPerk>		MonsterPerkClass;

var const Name 			MusicMessageType;

/** Has perk xp/level been loaded (local player) */
var	private const bool	bPerkStatsLoaded;

/** Id of previously selected perk */
var public globalconfig byte SavedPerkIndex;

/** Player zed spawn params (Versus) */
var transient sPlayerZedSpawnInfo PlayerZedSpawnInfo;

var KFPawn_Human UsablePawn;

/*********************************************************************************************
 * @name Achievements
********************************************************************************************* */
var transient protected int BenefactorDosh;
var private const int BenefactorDoshReq;

/*********************************************************************************************
 * @name UDK Variables
********************************************************************************************* */

/** The effect to play on the camera **/
var KFEmit_CameraEffect CameraEffect;

/** makes playercontroller hear much better (used to magnify hit sounds caused by player) */
var	bool bAcuteHearing;

/** additional post processing settings modifier that can be applied
 * @note: defaultproperties for this are hardcoded to zeroes in C++
 */
var PostProcessSettings PostProcessModifier;

/** if true, rotate smoothly to desiredrotation */
var bool bUsePhysicsRotation;

struct native ObjectiveAnnouncementInfo
{
	/** the default announcement sound to play (can be None) */
	var() SoundNodeWave AnnouncementSound;
	/** text displayed onscreen for this announcement */
	var() localized string AnnouncementText;
};

/** Used to determine if a player can be considered for achievements */
var bool bIsAchievementPlayer;

/*********************************************************************************************
 * @name UT Variables
********************************************************************************************* */

/** Controls how often this Player can spam admin commands */
var float NextAdminCmdTime;
var config bool bHideTraderPaths;

/*********************************************************************************************
 * @name Skill Tracking
********************************************************************************************* */
/** The total "shots" taken during this match. This includes gun shots taken, melee attacks, damage intervals for flame weapons, etc */
var int ShotsFired;
/** The total "shots" that hit another pawn during this match */
var int ShotsHit;
/** The total "shots" that hit an another pawn in the head during this match */
var int ShotsHitHeadshot;

/*********************************************************************************************
 * @name UI
********************************************************************************************* */
var KFGFxMoviePlayer_Manager			MyGFxManager;
var KFGFxMoviePlayer_HUD				MyGFxHUD;

var KFGFxMoviePlayer_PostRoundMenu		MyGFxPostRoundMenu;

var class<KFGFxMoviePlayer_PostRoundMenu> PostRoundMenuClass;

/** whether trader menu is open or not (only tracked client-side) */
var transient	bool	bClientTraderMenuOpen;

var bool 				bPlayerUsedUpdatePerk;

/*********************************************************************************************
 * @name Audio
********************************************************************************************* */

/** Zed time sounds */
var AKEvent		ZedTimeEnterSound;
var AKEvent		ZedTimeExitSound;
var AKEvent		ZedTimePartialEnterSound;
var AKEvent		ZedTimePartialExitSound;

/** Store TimeDilation for the previous Tick */
var float		LastTimeDilation;

/** Event to post to pause all Wwise events */
var AkEvent 	PauseWwiseEvent;

/** Event to post to resume all paused Wwise events */
var AkEvent		ResumeWwiseEvent;

/** "Ears ringing" play event */
var AkEvent		EarsRingingPlayEvent;

/** "Ears ringing" stop event */
var AkEvent		EarsRingingStopEvent;

/** "Heart pounding in ears" start event (probably has a fade-in) */
var AkEvent 	LowHealthStartEvent;
/** "Heart pounding in ears" stop event (probably has a fade-out) */
var AkEvent 	LowHealthStopEvent;
/** Component on which to play stingers */
var AkComponent	StingerAkComponent;

/** Resets all lowpass filters */
var AkEvent		ResetFiltersEvent;

/** Weapon UI sounds */
var AkEvent 	FlashlightOnEvent;
var AkEvent 	FlashlightOffEvent;
var AkEvent 	NightVisionOnEvent;
var AkEvent 	NightVisionOffEvent;

/** Sound to play when all collectibles have been found */
var AkEvent		AllMapCollectiblesFoundEvent;

/*********************************************************************************************
 * @name Gameplay Effects
********************************************************************************************* */

/** The post process effect used to display gameplay effects such as pain, low health, zed time, etc. */
var MaterialEffect GameplayPostProcessEffects;
/** Name of the gameplay post process effect in the post process chain. This is used to cache the effect so that we can modify its parameters from the game code */
var name GameplayPostProcessEffectName;

/** The material used in the above post process material effect */
var MaterialInstanceConstant GameplayPostProcessEffectMIC;
/** Name of the MIC paramter used to display pain */
var name EffectPainParamName;
/** Name of the MIC parameter used to display low health */
var name EffectLowHealthParamName;
/** Name of the MIC parameter used to display zed time */
var name EffectZedTimeParamName;
/** Name of the MIC parameter used to display night vision time */
var name EffectNightVisionParamName;
/** Name of the MIC parameter used to display Siren's scream attack effect */
var name EffectSirenScreamParamName;
/** Name of the MIC parameter used to display Bloat's puke attack effect */
var name EffectBloatsPukeParamName;
/** Name of the MIC parameter used to display Bloat's puke attack effect */
var name EffectHealParamName;
/** Name of the MIC parameter used to display perk skill effect */
var name EffectPerkParamName;
/** Night vision active */
var	bool bNightVisionActive;
/** Perk skill screen effect is active */
var bool bPerkEffectIsActive;
/** Being grabbed screen effect is active */
var bool bGrabEffectIsActive;
/** Interpolation duration for pain effect */
var transient float PainEffectDuration;
/** Pain Effect - The time remaining for the pain effect */
var transient float PainEffectTimeRemaining;

/** Interpolation duration for pain effect */
var transient float HealEffectDuration;
/** Pain Effect - The time remaining for the pain effect */
var transient float HealEffectTimeRemaining;

/** Interpolation duration for pain effect */
var transient float SonicScreamEffectDuration;
/** Siren Scream Effect - The time remaining for the Siren scream effect */
var transient float SirenScreamEffectTimeRemaining;

/** Interpolation duration for pain effect */
var transient float BloatPukeEffectDuration;
/** Bloats Puke Effect - The time remaining for the Siren scream effect */
var transient float BloatPukeEffectTimeRemaining;

/** Low Health Effect - Determines what health is low enough to be considered for low health effects */
var const int LowHealthThreshold;

var transient float TargetZEDTimeEffectIntensity;
var transient float CurrentZEDTimeEffectIntensity;
/** ZED Time Effect - Time remaining in the fade in/out of the effect.*/
var transient float ZEDTimeEffectInterpTimeRemaining;
/** ZED Time Effect - The total fade time if going from an intensity of 0 to 1 or vice versa */
var const 	  float PartialZEDTimeEffectIntensity;

var transient float ExplosionEarRingDuration;
var transient float ExplosionEarRingTimeRemaining;
var transient float ExplosionEarRingEffectIntensity;
var transient float ExplosionEarRingDelay;

var transient bool	bPlayingLowHealthSFX;

// partial zed time visibility
var		bool	bCachedSeeZedTimePawn;
var		float	CachedZedTimeVisibilityTime;
var		bool	bRecursingZedTimeVisibility;
var		float	ZedTimeSightCounter; // interval/tick test

var()			PointLightComponent AmplificationLightTemplate;
var transient   PointLightComponent AmplificationLight;

/*********************************************************************************************
* @name Input
********************************************************************************************* */

/** Represents a percentage of max pawn speed. 0 is highest (100%).
  * Used for replicating left analog stick (we hijack DoubleClickMove, so this enum essentially replaces EDoubleClickDir) */
enum EAnalogMovementSpeed
{
	AMOVESPEED_0, // relates to DCLICK_None
	AMOVESPEED_1, // relates to DCLICK_Left
	AMOVESPEED_2, // relates to DCLICK_Right
	AMOVESPEED_3  // relates to DCLICK_Forward

				  // Max relates to DCLICK_Back

	//AMOVESPEED_4,
	//AMOVESPEED_5,
	//AMOVESPEED_6
};

/** Real-time timer for IgnoreMoveInput */
var private transient float PauseMoveInputTimeLeft;

/*********************************************************************************************
* @name Night Vision
********************************************************************************************* */

var()			PointLightComponent NVGLightTemplate;
var transient	PointLightComponent NVGLight;

/*********************************************************************************************
 * @name Depth of field properties
********************************************************************************************* */

var bool bDOFEnabled; // Is DDF turned on?

var(DOF) float DOFFocalRange;
var(DOF) float DOFFocalAperture;

var(DOF) float DOFFocusBlendRate; // How quickly for the focus distance to adjust to what the player is currently looking at. This is not directly comparable to time, but the calculation is as BlendRate*Time
var float DOFFocusDepth; // What depth the player's eyes are focused at
var(DOF) float DOFMaxFocusDepth; // What max focus depth we'll use. If this is too far, when the focus trace fails (like tracing against the skybox) we end up blurring the whole screen. So this caps the max distance so this doesn't happen
var(DOF) float DOFStaticFocusDepth; // Static depth the player's eyes are focused at(if set to 0.0, then DDFFocusDepth is calculated off what we're looking at)

/** Maximum angle (in degrees) to an enemy for calculating focal distance */
var(DOF) editconst float DOFMaxEnemyAngle;

/** Whether gameplay DOF overrides are active */
var bool bGamePlayDOFActive;
/** Whether ironsights is active and overriding the normal DOF parameters */
var bool bIronSightsDOFActive;

/** Controls the weighting between environment/IronSights DOF and gameplay DOF (e.g. night vision) */
var float DOF_GP_LerpControl;
/** Controls the weighting between environment and IronSights DOF */
var float DOF_IS_LerpControl;

/** Controls how fast NVG DOF lerps on */
var float DOF_NVG_BlendInSpeed;
/** Controls how fast NVG DOF lerps off */
var float DOF_NVG_BlendOutSpeed;

/** Postprocess parameters when Night Vision is enabled */
var(NVG_Post) float NVG_FocusBlendRate;
var(NVG_Post) float NVG_ImageGrainScale;

/** [World] Fixed focal distance for NVG */
var(NVG_Post) float NVG_DOF_FocalDistance;

/** [World] World-unit radius around the focal point that is unblurred. */
var(NVG_Post) float NVG_DOF_SharpRadius;

/** [World] World-unit focal radius that defines how far away from the focal plane ( +/- sharp radius ) the maximum far/near blur radius is reached. */
var(NVG_Post) float NVG_DOF_FocalRadius;

/** [World] Minimum blur size. */
var(NVG_Post) float NVG_DOF_MinBlurSize;

/** [World] Maximum blur size for near-field (objects closer than focal point). */
var(NVG_Post) float NVG_DOF_MaxNearBlurSize;

/** [World] Maximum blur size for far-field (objects more distance than focal point). */
var(NVG_Post) float NVG_DOF_MaxFarBlurSize;

/** [World] Exponent that is used to transition to max blur size inside the focal radius. */
/**     1 -> linear transition */
/**   > 1 slower than linear transition */
/**   < 1 faster than linear transition */
var(NVG_Post) float NVG_DOF_ExpFalloff;

// Cinematic mode DOF overrides
var(Cinematic_DOF) float DOF_Cinematic_BlendInSpeed;
var(Cinematic_DOF) float DOF_Cinematic_BlendOutSpeed;
var(Cinematic_DOF) float DOF_Cinematic_FocalDistance;
var(Cinematic_DOF) float DOF_Cinematic_SharpRadius;
var(Cinematic_DOF) float DOF_Cinematic_FocalRadius;
var(Cinematic_DOF) float DOF_Cinematic_MinBlurSize;
var(Cinematic_DOF) float DOF_Cinematic_MaxNearBlurSize;
var(Cinematic_DOF) float DOF_Cinematic_MaxFarBlurSize;
var(Cinematic_DOF) float DOF_Cinematic_ExpFalloff;

// Gameplay DOF overrides
var(GP_DOF) float DOF_GP_BlendInSpeed;
var(GP_DOF) float DOF_GP_BlendOutSpeed;
var(GP_DOF) float DOF_GP_FocalDistance;
var(GP_DOF) float DOF_GP_SharpRadius;
var(GP_DOF) float DOF_GP_FocalRadius;
var(GP_DOF) float DOF_GP_MinBlurSize;
var(GP_DOF) float DOF_GP_MaxNearBlurSize;
var(GP_DOF) float DOF_GP_MaxFarBlurSize;
var(GP_DOF) float DOF_GP_ExpFalloff;

/*********************************************************************************************
 * @name Misc Postprocess settings
********************************************************************************************* */

var bool bReflectionsEnabled; // Is SSR turned on?
var bool bBlurEnabled; // Is full-screen blur enabled?
var float BlurStrength; // Strength of blur
var float BlurBlendInSpeed; // Speed at which blur blends in
var float BlurBlendOutSpeed; // Speed at which blur blends out
var float BlurLerpControl;

/*********************************************************************************************
 * @name Online (persistant) Stats
********************************************************************************************* */

/** Online subsystem statics */
var private KFOnlineStatsRead  StatsRead; //Only used to read in the stats, everything else should be handled by the write object
var private KFOnlineStatsWrite StatsWrite;

//@HSL_BEGIN - JRO - PS4 Sessions
/*********************************************************************************************
 * @name PS4 Sessions
********************************************************************************************* */

/** TRUE if we are processing a game invite */
var bool bProcessingGameInvite;

/** List of people we've played with this game */
var array<string> RecentlyMetPlayers;
//@HSL_END

/*********************************************************************************************
 * @name Dialog and AAR stats
********************************************************************************************* */

struct native PostWaveReplicationInfo
{
	var Vector 	VectData1; //used for compressing data //X:HeadShots Y:Dosh Earned Z:Damage Dealt
	var Vector 	VectData2;	//used for compressing data //Damage Taken, Heals Received, Heals Given

	var byte	LargeZedKills;
	//Dialog
	var bool 	bDiedDuringWave;
	var bool	bBestTeammate;
	var bool	bKilledMostZeds;
	var bool	bEarnedMostDosh;
	var bool	bAllSurvivedLastWave;
	var bool	bSomeSurvivedLastWave;
	var bool	bOneSurvivedLastWave;
	var bool	bKilledFleshpoundLastWave;
	var bool	bKilledScrakeLastWave;
	/** Work-around so we don't have to wait for GRI.OpenTrader() to determine dialog */
	var bool    bOpeningTrader;

	var class< KFPawn_Monster > ClassKilledByLastWave;

	var byte	RepCount;
};

var repnotify PostWaveReplicationInfo PWRI;

var EphemeralMatchStats MatchStats;
var Class<EphemeralMatchStats> MatchStatsClass;

/*********************************************************************************************
 * @name Spectating
********************************************************************************************* */

enum KFSpectateModes
{
	SMODE_PawnFreeCam,
	SMODE_PawnThirdPerson,
	SMODE_PawnFirstPerson,
	SMODE_Roaming
};

var transient KFSpectateModes CurrentSpectateMode;

/** Used to tell the server if a client spectator is active */
var transient float LastUpdateSpectatorActiveTime;
var transient float UpdateSpectatorActiveInterval;

/*********************************************************************************************
 * @name Aim Assist
********************************************************************************************* */

var config protected bool bDebugTargetAdhesion;
var(AimAssist) protected bool bDebugAutoTarget;

/** Interp curve to scale autotarget scoring for different ranges **/
var(AimAssist) InterpCurveFloat ScoreTargetDistanceCurve;

/** Aim correction */
var(AimAssist)  float MaxAimCorrectionDistance;

/** Aim correction upper limit (all weapons) */
const MAX_AIM_CORRECTION_SIZE = 40.f;

/*********************************************************************************************
 * @name Look At Pawn
********************************************************************************************* */

/** How long to force us to look at a pawn **/
var() float ForceLookAtPawnTime;

/** Pawn we're being forced to look at **/
var() KFPawn ForceLookAtPawn;

/** Don't use the countdown time, just keep looking at the ForceLookAtPawn **/
var() bool bLockToForceLookAtPawn;

/*********************************************************************************************
 * @name Debug
********************************************************************************************* */
var bool bDebugPartialZedTime;
var bool bForcePartialZedTime;

/** Position to draw the tracking map */
var(ZedMap) float TrackerXPosition, TrackerYPosition;
/** Scale to draw the tracking map at */
var(ZedMap) float TrackingMapScale;
/** If true the tracking map is a top down view, otherwise its a side view*/
var(ZedMap) bool  bTrackingMapTopView;
/** Position to draw the tracking map */
var(ZedMap) float TrackerSpawnVolumeSizeX, TrackerSpawnVolumeSizeY;
/** Distance range for the tracking map*/
var(ZedMap) float TrackingMapRange;

enum ETrackingRangeMode
{
	ETR_Custom,
	ETR_10Meters,
	ETR_25Meters,
	ETR_50Meters,
	ETR_100Meters,
	ETR_250Meters
};

/** Current distance range for the tracking map*/
var transient ETrackingRangeMode CurrentTrackerRangeMode;

enum ETrackingMode
{
	ETM_All,
	ETM_AllButTargeting,
	ETM_PawnsOnly,
	ETM_PawnsAndTargetingOnly,
	ETM_SpawnsOnly,
	ETM_FailedSpawnsOnly,
	ETM_HumansAndSpawnsOnly,
	ETM_PickupsOnly
};

/** Current targeting mode for the tracking map*/
var transient ETrackingMode CurrentTrackingMode;

/*********************************************************************************************
 * @name GameConductor debug drawing
********************************************************************************************* */

enum EGameConductorDebugMode
{
	EGCDM_OverallRankAndSkill,
    EGCDM_Skill,
	EGCDM_OverallAccuracy,
	EGCDM_LifeSpan,
    EGCDM_ZedSpawning,
	EGCDM_GameplayAdjustments,
	EGCDM_Status
};

/** Current targeting mode for the tracking map*/
var transient EGameConductorDebugMode CurrentGameConductorDebugMode;

/*********************************************************************************************
 * @name Navigation
********************************************************************************************* */
//var KFNavigationHandle MyKFNavigationHandle;

/*********************************************************************************************
 * @name NoGoZones
********************************************************************************************* */
var transient	float 	NoGoStartTime;
var transient 	bool	bNoGoActive;

cpptext
{
	virtual UBOOL Tick( FLOAT DeltaSeconds, ELevelTick TickType );
	virtual UBOOL WantsLedgeCheck();

	// partial zed time visibility
	UBOOL CacheSeeZedTimePawn(UBOOL bCanSeeZedTimePawn, APawn* P=NULL);
	UBOOL TestZedTimeVisibility(APawn* P, UNetConnection* Connection, UBOOL bLocalPlayerTest);
	UBOOL ConsiderForZedTimeVisibility(APawn* P);
	void  TickPartialZedTime(FLOAT DeltaSeconds);
	void  StopPartialZedTime();

	// Post process
	virtual void BlendPostProcessSettings(FPostProcessSettings& PPSettings, const FPostProcessSettings& PPSettingsA, const FPostProcessSettings& PPSettingsB, const FLOAT BlendWeight) const;
	virtual void AddPostProcessSettings(FPostProcessSettings& PPSettings, const FPostProcessSettings& PPSettingsA) const;
	virtual void ModifyPostProcessSettings(FPostProcessSettings& PPSettings) const;
	virtual void PreSave();
	/** Computes the focal distance for depth of field */
	FLOAT ComputeFocalDistance();

	/**
	 * This will score both Adhesion and Friction targets.  We want the same scoring function as we
	 * don't want the two different systems fighting over targets that are close.
	 **/
	virtual FLOAT ScoreTargetAdhesionFrictionTarget( const APawn* P, FLOAT MaxDistance, const FVector& CamLoc, const FRotator& CamRot, const FInterpCurveFloat TargetingAngle ) const;

	/** Determines whether this Pawn can be used for TargetAdhesion **/
	virtual UBOOL IsValidTargetAdhesionFrictionTarget( APawn* P, FLOAT MaxDistance );

	virtual UBOOL HearSound(UAkBaseSoundObject* InSoundCue, AActor* SoundPlayer, const FVector& SoundLocation, UBOOL bStopWhenOwnerDestroyed
#ifdef __TW_WWISE_
    ,const FRotator& SoundRotation
#endif // __TW_WWISE_
    );

	/** Like HearSound */
	virtual UBOOL HearDialog(AActor* DialogSpeaker, UAkEvent* DialogEvent, BYTE bCanBeMinimized);

	INT* GetOptimizedRepList( BYTE* InDefault, FPropertyRetirement* Retire, INT* Ptr, UPackageMap* Map, UActorChannel* Channel );
}

replication
{
	if ( bNetDirty )
        CurrentPerk, PWRI;

	if ( bNetDirty )
        ForceLookAtPawn, ForceLookAtPawnTime, bLockToForceLookAtPawn;
}

/**
 * Sets whether or not hardware physics are enabled.
 *
 * @param bEnabled	Whether to enable the physics or not.
 */
native function SetHardwarePhysicsEnabled(bool bEnabled);

/** @return Whether or not the user has a keyboard plugged-in. */
native simulated function bool IsKeyboardAvailable() const;
/** @return Whether or not the user has a mouse plugged-in. */
native simulated function bool IsMouseAvailable() const;

/**
 * This will find the best AdhesionFriction target based on the params passed in.
 **/
native function Pawn GetTargetAdhesionFrictionTarget( FLOAT MaxDistance, const out vector CamLoc, const out Rotator CamRot, const InterpCurveFloat TargetingAngle );

/*
 * @param	BulletWhip - whip sound to play
 * @param	FireLocation - where shot was fired
 * @param	FireDir	- direction shot was fired
 * @param	HitLocation - impact location of shot
*/
native function CheckBulletWhip(AkEvent BulletWhip, vector FireLocation, vector FireDir, vector HitLocation, Actor ShootActor);

/** Queries the PRI and returns our current Perk */
native final simulated function KFPerk GetPerk();

native reliable server private event PushPlayerStats( PlayerStats Stats );

/*********************************************************************************************
 * @name Constructors, Destructors, and Loading
********************************************************************************************* */
simulated event PreBeginPlay()
{
	super.PreBeginPlay();

	PostAkEvent( ResetFiltersEvent );
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	MatchStats = new(Self) MatchStatsClass;

}

simulated event ReplicatedEvent( name VarName )
{
	super.ReplicatedEvent( VarName );

	if ( VarName == nameof(Pawn) )
	{
		SetAmplificationLightEnabled(Pawn != None);
		ToggleHealthEffects(Pawn != None);
	}
	if ( VarName == nameof(PWRI) )
	{
		SubmitPostWaveStats();
	}
	if ( VarName == 'CurrentPerk' )
	{
		//force trader to update if it is open
		RecievedNewPerkClass();
	}
}

simulated event ReceivedPlayer()
{
	Super.ReceivedPlayer();

	// Initialize our customization character as authority since we have a PRI
	// if we're not authority, wait for the PRI to be replicated to call ClientInitialize
	if ( Role == ROLE_Authority && IsLocalController() )
	{
	 	PlayerReplicationInfo.ClientInitialize( self );
	}

//@HSL_BEGIN - JRO - 3/21/2016 - PS4 Sessions
	HandleConsoleSessions();
//@HSL_END
}

reliable server function AskForPawn()
{
	local KFPawn P;

	P = KFPawn(Pawn);
	if( P != none  )
	{
		//Pawn ref can be always none on client under certain circumstances
		P.ForceOpenActorChannel();
	}

	super.AskForPawn();
}

/**
 * This function will be called to notify the player controller that the world has received it's game class. In the case of a client
 * we need to initialize the Input System here.
 *
 * @Param GameClass - The Class of the game that was replicated
 */

simulated function ReceivedGameClass(class<GameInfo> GameClass)
{
	local LocalPlayer LP;

	Super.ReceivedGameClass(GameClass);

	// Update world PPC here on the client since RestartPlayer is not called
	// - aladenberger 11/15/12
	LP = LocalPlayer(Player);
	if(LP != None)
	{
		// reset the post processing when we get a new PC
		LP.RemoveAllPostProcessingChains();
		LP.InsertPostProcessingChain(LP.Outer.GetWorldPostProcessChain(), INDEX_NONE, true);

		// Initialize game play post process effects such as damage, low health, etc.
		// This needs to be done after the post process chain has been swapped out above.
		InitGameplayPostProcessFX();
	}
}

/** Allow achievements after the first successful spawn */
event Possess(Pawn aPawn, bool bVehicleTransition)
{
	if( aPawn != none && aPawn.IsAliveAndWell() )
	{
		bIsAchievementPlayer = true;
	}

	super.Possess( aPawn, bVehicleTransition );
}

reliable client function ClientRestart(Pawn NewPawn)
{
	local KFGFxHudWrapper GFxHUDWrapper;

	Super.ClientRestart(NewPawn);

	if(NewPawn == none)
	{
		return;
	}

	UsablePawn = KFPawn_Human(NewPawn);

	// Reinitialize FOV
    FixFOV();

    // Reset low pass audio filter
    SetRTPCValue( 'GRENADEFX', 0, true );

	// Upon spawning close all menus
	MyGFxManager.CloseMenus();
	if(MyGFxHUD != none && MyGFxHUD.SpectatorInfoWidget != none)
	{
		MyGFxHUD.SpectatorInfoWidget.SetVisible(!PlayerReplicationInfo.bOnlySpectator);
	}

	// Clear out persistant dead bodies when players respawn
	if( WorldInfo.MyGoreEffectManager != none )
	{
		KFGoreManager(WorldInfo.MyGoreEffectManager).ResetPersistantGore(true);
	}

	// Spawn the amplification light
        // Disabled for performance
	/*if(AmplificationLight == none && AmplificationLightTemplate != none)
	{
		AmplificationLight = new(self) Class'PointLightComponent' (AmplificationLightTemplate);
		Pawn.AttachComponent(AmplificationLight);
	}*/

	// Reset Depth of Field
	EnableDepthOfField(false);

	// Only unlock achievements for people who have possessed a pawn during this game
	if( NewPawn != none && NewPawn.IsAliveAndWell() )
	{
		bIsAchievementPlayer = true;
	}

	NewPawn.MovementSpeedModifier = 1.f;
	//Spawn hud here
    GFxHUDWrapper = KFGFxHudWrapper(myHUD);
    if( GFxHUDWrapper != none)
    {
        GFxHUDWrapper.CreateHUDMovie();
    }
    if(MyGFxHUD != none)
    {
    	MyGFxHUD.ReceivePawn(KFPawn(Pawn));
    }
}

/** Need to handle death of our customization pawn */
function PawnDied( Pawn inPawn )
{
	if( inPawn == Pawn && KFPawn_Customization(InPawn) != none )
	{
		if( !Pawn.bDeleteMe && !Pawn.bPendingDelete )
		{
			Pawn.UnPossessed();
		}
		Pawn = none;
		if( MyGFxManager != none )
		{
			MyGFxManager.CloseMenus();
		}
		return;
	}

	super.PawnDied( inPawn );
}

function SpawnReconnectedPlayer()
{
	if ( WorldInfo.NetMode == NM_Client )
		return;

	WorldInfo.Game.RestartPlayer( Self );
}

function bool CanRestartPlayer()
{
	local bool bIsReady;

	// Allow for autostart games
	bIsReady = WorldInfo.Game != none
				? KFGameInfo(WorldInfo.Game).IsPlayerReady( KFPlayerReplicationInfo(PlayerReplicationInfo) )
				: PlayerReplicationInfo.bReadyToPlay;

	return PlayerReplicationInfo != None && !PlayerReplicationInfo.bOnlySpectator && bIsReady && HasClientLoadedCurrentWorld() && PendingSwapConnection == None;
}

/** reset input to defaults */
function ResetPlayerMovementInput()
{
	if ( !bCinematicMode )
	{
		Super.ResetPlayerMovementInput();
	}
}

event InitInputSystem()
{
	super.InitInputSystem();

	// Mark us as a user of the VoIP system.
	if ( OnlineSub != none )
	{
		OnlineSub.RegisterLocalTalker(0);
	}
	else
	{
		if(VoiceInterface != none)
		{
		        VoiceInterface.RegisterLocalTalker(0);
	        }
	}
	RegisterTalkerDelegate();
}

/** Spawn and place a customization pawn in a KFCustomizationPoint, or PlayerStart if no CustomizationPoints exist */
function CreateCustomizationPawn()
{
	local KFGameInfo KFGI;
	local NavigationPoint BestStart;

    KFGI = KFGameInfo( WorldInfo.Game );
	if( KFGI == none || KFGI.bRestartLevel && WorldInfo.NetMode!=NM_DedicatedServer && WorldInfo.NetMode!=NM_ListenServer )
	{
		`warn("bRestartLevel && !server, abort from RestartPlayer"@WorldInfo.NetMode);
		return;
	}

	BestStart = GetBestCustomizationStart( KFGI );

	// try to create a pawn to use of the default class for this player
	if (Pawn == None)
	{
		Pawn = KFGI.SpawnCustomizationPawn( BestStart );
	}

	if ( KFPawn_Customization( Pawn ) != none )
	{
		KFPawn_Customization( Pawn ).InitializeCustomizationPawn( self, BestStart );
	}
}

/** Get an unused customization point, if none are found use a PlayerStart point */
function NavigationPoint GetBestCustomizationStart( KFGameInfo KFGI )
{
	local NavigationPoint BestStartSpot;

    BestStartSpot = KFGI.FindCustomizationStart( self );
	// if a start spot wasn't found,
	if (BestStartSpot == None)
	{
        BestStartSpot = KFGI.FindPlayerStart( self, 0);
        `warn("No customization points have been found, using PlayerStart instead");
		if ( BestStartSpot == none )
		{
			`warn("Player start not found, failed to restart player");
			return none;
		}
	}
	return BestStartSpot;
}

//@HSL_BEGIN - JRO - 3/21/2016 - PS4 Sessions
/*********************************************************************************************
 * @name Console Sessions
********************************************************************************************* */
function HandleConsoleSessions()
{
	local UniqueNetId NullId;
	local KFGameReplicationInfo GRI;

	if( WorldInfo.IsConsoleDedicatedServer() && !WorldInfo.IsE3Build() )
	{
		`log("SESSIONS - ReceivedPlayer");
		if(KFGameEngine(Class'Engine'.static.GetEngine()).ConsoleGameSessionGuid == "") // If no session made yet
		{
			`log("SESSIONS - Still need a session");
			GRI = KFGameReplicationInfo(WorldInfo.GRI);
			if(GRI.ConsoleGameSessionHost == NullId) // Lucky this guy gets to make the session!
			{
				`log("SESSIONS - Make one!");
				GRI.ConsoleGameSessionHost = PlayerReplicationInfo.UniqueId;
				ClientCreateGameSession();
			}
			else // Somebody is still trying to make one
			{
				`log("SESSIONS - Wait for"@Class'OnlineSubsystem'.static.UniqueNetIdToString(GRI.ConsoleGameSessionHost)@"to make one");
				GRI.ConsoleGameSessionPendingPlayers.AddItem(PlayerReplicationInfo.UniqueId);
			}
		}
	}
}

reliable client function ClientCreateGameSession()
{
	local OnlineGameSettings GameSettings;
	local byte LocalPlayerNum;
	local string RemoteAddressString;

	`log("SESSIONS - ClientCreateGameSession");

	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();

	if (OnlineSub != None && OnlineSub.GameInterface != None)
	{
		// Create the default settings to get the standard settings to advertise
		GameSettings = new class'KFOnlineGameSettings';
		OnlineSub.GameInterface.GetGameServerRemoteAddress(RemoteAddressString);
		`log("  - Remote address:"@ RemoteAddressString);
		GameSettings.JoinString = RemoteAddressString;
		GameSettings.bAllowJoinInProgress = true;

		LocalPlayerNum = LocalPlayer(Player).ControllerId;

		// Register the delegate so we can see when it's done
		OnlineSub.GameInterface.AddCreateOnlineGameCompleteDelegate(OnGameSessionCreateComplete);
		// Now kick off the async create
		if ( !OnlineSub.GameInterface.CreateOnlineGame(LocalPlayerNum, 'Game', GameSettings) )
		{
			`log("Failed to create online game");
			OnlineSub.GameInterface.ClearCreateOnlineGameCompleteDelegate(OnGameSessionCreateComplete);
		}
	}
}

simulated function OnGameSessionCreateComplete(name SessionName,bool bWasSuccessful)
{
	local string SessionGuid;

	`log("SESSIONS - OnGameSessionCreateComplete:"@bWasSuccessful);

	if(!bWasSuccessful)
	{
		ServerGameSessionFailed();
		return;
	}

	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();

	OnlineSub.GameInterface.ClearCreateOnlineGameCompleteDelegate(OnGameSessionCreateComplete);

	// Update the server with the session info
	OnlineSub.GameInterface.ReadSessionGuidBySessionName( 'Game', SessionGuid );
	`log("SESSIONS - SessionGuid:"@SessionGuid);
	ServerGameSessionCreated(SessionGuid);
}

reliable server function ServerGameSessionCreated(string SessionGuid)
{
	`log("SESSIONS - ServerGameSessionCreated:"@SessionGuid);

	KFGameEngine(Class'Engine'.static.GetEngine()).ConsoleGameSessionGuid = SessionGuid;
	KFGameReplicationInfo(WorldInfo.GRI).ConsoleGameSessionGuid = SessionGuid;
}

reliable server function ServerGameSessionFailed()
{
	local KFPlayerController Controller;
	local UniqueNetId NullId;
	local KFGameReplicationInfo GRI;

	`log("SESSIONS - ServerGameSessionFailed");
	GRI = KFGameReplicationInfo(WorldInfo.GRI);
	if (GRI.ConsoleGameSessionPendingPlayers.Length > 0)
	{
		// Pop the front pending player
		GRI.ConsoleGameSessionHost = GRI.ConsoleGameSessionPendingPlayers[0];
		GRI.ConsoleGameSessionPendingPlayers.Remove(0,1);
		// Tell him to make the session

		foreach Worldinfo.AllControllers(class'KFPlayerController', Controller)
		{
			if(Controller.PlayerReplicationInfo.UniqueId == GRI.ConsoleGameSessionHost)
			{
				Controller.ClientCreateGameSession();
				break;
			}
		}
	}
	else
	{
		`log("Everyone failed to make a game session");
		GRI.ConsoleGameSessionHost = NullId;
	}
}

simulated function TryJoinGameSession()
{
	`log("SESSIONS - TryJoinGameSession");

	if( KFGameReplicationInfo(WorldInfo.GRI).ConsoleGameSessionGuid == "" )
	{
		`log("  - Bad session guid. returning");
		return;
	}

	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();

	if (OnlineSub != None && OnlineSub.GameInterface != None)
	{
		//if we're already in a session, safe to assume it's the one we're supposed to be in. Otherwise join it now!
		if(OnlineSub.IsInSession('Game'))
		{
			`log("  - Skipped join, already in a session");
		}
		else
		{
			JoinGameSessionNow();
		}
	}
}

simulated function JoinGameSessionNow()
{
	local OnlineGameSearch NewGameSearch;
	local byte LocalPlayerNum;

	LocalPlayerNum = LocalPlayer(Player).ControllerId;

	// Create a OnlineGameSettings based off the platform session info
	NewGameSearch = new class'OnlineGameSearch';
	OnlineSub.GameInterface.BindSessionGuidToSearch(LocalPlayerNum, NewGameSearch, KFGameReplicationInfo(WorldInfo.GRI).ConsoleGameSessionGuid);
	OnlineSub.GameInterface.AddJoinOnlineGameCompleteDelegate(OnJoinGameSessionComplete);
	if ( !OnlineSub.GameInterface.JoinOnlineGame(LocalPlayerNum, 'Game', NewGameSearch.Results[0]) )
	{
		`log("SESSIONS - Failed to join game");
	}
}

simulated function OnJoinGameSessionComplete(name SessionName,bool bWasSuccessful)
{
	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();

	`log("SESSIONS - OnJoinGameSessionComplete:"@bWasSuccessful);

	OnlineSub.GameInterface.ClearJoinOnlineGameCompleteDelegate(OnJoinGameSessionComplete);
}

event PreClientTravel( string PendingURL, ETravelType TravelType, bool bIsSeamlessTravel )
{
	super.PreClientTravel(PendingURL, TravelType, bIsSeamlessTravel);

	DestroyOnlineGame();
}


/*********************************************************************************************
 * @name Console Session Invites
********************************************************************************************* */
/**
 * Delegate called when the user accepts a game invite externally. This allows
 * the game code a chance to clean up before joining the game via
 * JoinOnlineGame() call.
 *
 * NOTE: There must be space for all signed in players to join the game. All
 * players must also have permission to play online too.
 *
 * @param InviteResult the search/settings for the game we're to join
 */
function OnGameInviteAccepted(const out OnlineGameSearchResult InviteResult, OnGameInviteAcceptedResult ResultReason)
{
	local KFGFxMenu_IIS IISMenu;

	`log("SESSIONS - OnGameInviteAccepted");

	CachedInviteResult = InviteResult;

	if (CachedInviteResult.GameSettings != None)
	{
		if(OnlineSub.PlayerInterface.GetLoginStatus(LocalPlayer(Player).ControllerId) == LS_LoggedIn)
		{
			OnLoginForGameInviteComplete();
		}
		else // Must be at the IIS?
		{
			IISMenu = KFGFxMenu_IIS(MyGFxManager.CurrentMenu);
			if( IISMenu != none )
			{
				IISMenu.AttemptAutoLogin(true);
			}
		}
	}
	else
	{
		if(ResultReason == OGIAR_WrongAccount)
		{
			//HSL_TODO: JRO - Add specific UI message
			NotifyInviteFailed();
		}
		else
		{
			// At the moment, this can't happen, but couldn't hurt to keep it here in case that changes...
			NotifyInviteFailed();
		}
	}
}


function OnLoginForGameInviteComplete()
{
	`log("SESSIONS - OnLoginForGameInviteComplete");

	if (OnlineSub != None && OnlineSub.GameInterface != None && OnlineSub.SystemInterface != None)
	{
		// Make sure the login succeeded
		if (OnlineSub.PlayerInterface.GetLoginStatus(LocalPlayer(Player).ControllerId) == LS_LoggedIn)
		{
			bProcessingGameInvite = true;

			// First thing we do is leave a game if we're in one
			if( OnlineSub.IsInSession( 'Game' ) )
			{
				// Set the destroy delegate so we can know when that is complete
				OnlineSub.GameInterface.AddDestroyOnlineGameCompleteDelegate(OnGameDestroyedForInviteComplete);
				// Now we can destroy the game (completion delegate guaranteed to be called)
				OnlineSub.GameInterface.DestroyOnlineGame( 'Game' );
			}
			else
			{
				OnGameDestroyedForInviteComplete( 'Game', true );
			}
		}
		else
		{
			NotifyInviteFailed();
		}
	}
}

function OnGameDestroyedForInviteComplete(name SessionName,bool bWasSuccessful)
{
	`log("SESSIONS - OnGameDestroyedForInviteComplete");

	OnlineSub.GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnGameDestroyedForInviteComplete);

	// Does failure here matter?
	if(!bWasSuccessful)
	{
		`log("SESSIONS - DestroyOnlineGame for invite failed");
	}

	// Next we check privileges
	OnlineSub.PlayerInterface.AddPrivilegeLevelCheckedDelegate(OnCheckCanPlayOnlineForInviteComplete);
	OnlineSub.PlayerInterface.CanPlayOnline(LocalPlayer(Player).ControllerId);
}

function OnCheckCanPlayOnlineForInviteComplete(byte LocalUserNum, EFeaturePrivilege Privilege, EFeaturePrivilegeLevel PrivilegeLevel)
{
	// Clear delegate
	OnlineSub.PlayerInterface.ClearPrivilegeLevelCheckedDelegate(OnCheckCanPlayOnlineForInviteComplete);

	// If privilege check succeeds join game
	if(Privilege == FP_OnlinePlay)
	{
		if (PrivilegeLevel == FPL_Enabled)
		{
			CheckForCanPlayOnlineSuccess();
		}
		else if (PrivilegeLevel == FPL_Unknown)
		{
			// Online connection error. Ethernet unplugged?
			NotifyInviteFailed();
		}
		// Privilege check failed
		else
		{
			NotifyInviteFailed();

			//@HSL_TODO - JRO - Can't play online, need an upsell?
		}
	}
}

function CheckForCanPlayOnlineSuccess()
{
	// Set the delegate for notification of the join completing
	OnlineSub.GameInterface.AddJoinOnlineGameCompleteDelegate(OnInviteJoinComplete);
	// This will have us join async
	if (!OnlineSub.GameInterface.JoinOnlineGame(LocalPlayer(Player).ControllerId, 'Game', CachedInviteResult))
	{
		OnlineSub.GameInterface.ClearJoinOnlineGameCompleteDelegate(OnInviteJoinComplete);
		// Do some error handling
		NotifyInviteFailed();
	}
}

function NotifyInviteFailed()
{
	bProcessingGameInvite = false;
	Super.NotifyInviteFailed();
}
//@HSL_END

/*********************************************************************************************
 * @name Skill Tracking
********************************************************************************************* */

function AddShotsFired( int AddedShots )
{
    ShotsFired += AddedShots;
    //`log("ShotsFired = "$ShotsFired$" accuracy % = "$(Float(ShotsHit)/Float(ShotsFired) * 100.0));
}

function AddShotsHit( int AddedHits )
{
    ShotsHit += AddedHits;
    //`log("ShotsHit = "$ShotsHit$" accuracy % = "$(Float(ShotsHit)/Float(ShotsFired) * 100.0));
}

function AddHeadHit( int AddedHits )
{
    ShotsHitHeadshot += AddedHits;
    //`log("ShotsHitHeadshot = "$ShotsHitHeadshot$" accuracy % = "$(Float(ShotsHitHeadshot)/Float(ShotsFired) * 100.0));
}

/*********************************************************************************************
 * @name VOIP
********************************************************************************************* */

/** Registers the talker delegate so I can log who is talking */
function RegisterTalkerDelegate()
{
	if (OnlineSub != None && OnlineSub.VoiceInterface != None)
	{
		OnlineSub.VoiceInterface.AddPlayerTalkingDelegate(OnPlayerTalking);
	}
}

function OnPlayerTalking(UniqueNetId TalkingPlayer, bool bIsTalking)
{
	local KFPlayerReplicationInfo KFPRI;

	KFPRI = KFPlayerReplicationInfo(PlayerReplicationInfo);

	if ( KFPRI != none )
	{
		if(KFPRI.UniqueId == TalkingPlayer)
		{
			KFPRI.VOIPStatusChanged(KFPRI, bIsTalking);
			if(bIsTalking)
			{
				if(CurrentVoiceChannel == EVC_ALL)
				{
				KFPRI.ServerNotifyStartVOIP();
				}
				else
				{
					KFPRI.ServerNotifyStartTeamVoip();
				}
			}
			else
			{
				KFPRI.ServerNotifyStopVOIP();
			}

		}

	}
	//`Log("UniqueNetId for talking player is ("$TalkingPlayer.Uid[0]$","$TalkingPlayer.Uid[1]$","$TalkingPlayer.Uid[2]$","$TalkingPlayer.Uid[3]$","$TalkingPlayer.Uid[4]$","$TalkingPlayer.Uid[5]$","$TalkingPlayer.Uid[6]$","$TalkingPlayer.Uid[7]$")");
}

/** Tells this client that it should send voice data over the network */
reliable client function ClientStartNetworkedVoice()
{
	local KFPLayerReplicationInfo KFPRI;

	KFPRI = KFPlayerReplicationInfo( PlayerReplicationInfo );
	if ( KFPRI != none )
	{
		// Don't do this on Console so we don't show someone as talking when they get no onPlayerTalking if the player has no mic.  HSL_BB
		if ( !WorldInfo.IsConsoleBuild() )
		{
			KFPRI.VOIPStatusChanged( PlayerReplicationInfo, true );
			if(CurrentVoiceChannel == EVC_ALL)
			{
				KFPRI.VOIPStatus = 1;
				KFPRI.ServerNotifyStartVOIP();
			}
			else
			{
				KFPRI.VOIPStatus = 2;
				KFPRI.ServerNotifyStartTeamVoip();
			}
		}
	}
	super.ClientStartNetworkedVoice();
}

/** Tells this client that it should not send voice data over the network */
reliable client function ClientStopNetworkedVoice()
{
	local KFPLayerReplicationInfo KFPRI;

	super.ClientStopNetworkedVoice();

	KFPRI = KFPlayerReplicationInfo( PlayerReplicationInfo );

	if ( KFPRI != none )
	{
		KFPRI.VOIPStatus = 0;
		KFPRI.VOIPStatusChanged( PlayerReplicationInfo, false );
		KFPRI.ServerNotifyStopVOIP();
	}
}

/*********************************************************************************************
* @name	Input
********************************************************************************************* */

/**
 * Server/SP only function for changing whether the player is in cinematic mode.  Updates values of various state variables, then replicates the call to the client
 * to sync the current cinematic mode.
 *
 * @param	bInCinematicMode	specify TRUE if the player is entering cinematic mode; FALSE if the player is leaving cinematic mode.
 * @param	bHidePlayer			specify TRUE to hide the player's pawn (only relevant if bInCinematicMode is TRUE)
 * @param	bAffectsHUD			specify TRUE if we should show/hide the HUD to match the value of bCinematicMode
 * @param	bAffectsMovement	specify TRUE to disable movement in cinematic mode, enable it when leaving
 * @param	bAffectsTurning		specify TRUE to disable turning in cinematic mode or enable it when leaving
 * @param	bAffectsButtons		specify TRUE to disable button input in cinematic mode or enable it when leaving.
 */
function SetCinematicMode( bool bInCinematicMode, bool bHidePlayer, bool bAffectsHUD, bool bAffectsMovement, bool bAffectsTurning, bool bAffectsButtons )
{
	super.SetCinematicMode( bInCinematicMode, bHidePlayer, bAffectsHUD, bAffectsMovement, bAffectsTurning, bAffectsButtons );

	// have the server tell the clients whether their buttons should work
	ClientSetIgnoreButtons(bAffectsButtons);
}

/** Called to have all button input eaten by the HUD movie player */
reliable client function ClientSetIgnoreButtons(bool bAffectsButtons)
{
	local KFGFxHudWrapper GFxHUDWrapper;

	// Close the menu if we are in one
	if( bAffectsButtons && MyGFxManager != none )
	{
		MyGFxManager.CloseMenus();
	}

	// When ignoreing buttons, let the HUD eat all of our input
	GFxHUDWrapper = KFGFxHudWrapper(myHUD);
	if( GFxHUDWrapper != none && GFxHUDWrapper.HudMovie != none )
	{
		if( bAffectsButtons )
		{
			GFxHUDWrapper.HudMovie.HudChatBox.ClearAndCloseChat();
		}

		GFxHUDWrapper.HudMovie.EatMyInput(bAffectsButtons);
	}
}

/**
 * @return	TRUE if starting a force feedback waveform is allowed;  child classes should override this method to e.g. temporarily disable
 * 			force feedback
 */
simulated function bool IsForceFeedbackAllowed()
{
	local KFPlayerInput KFInput;
	KFInput = KFPlayerInput(PlayerInput);

	return KFInput != none && KFInput.bForceFeedbackEnabled && super.IsForceFeedbackAllowed();
}

/*********************************************************************************************
* @name	Perks
********************************************************************************************* */

/** InitializePerks is called once after stats have been loaded */
native final 		 function ClientInitializePerks();
native final		 function ResetPerkStatsLoaded();
native final private function LoadAllPerkLevels();
native final private function ReadStatsTimeout();


native final 		 function byte GetLevel();
native final simulated private function SetActivePerkLevel( byte NewLevel );
native final reliable server private event ServerSetLevel(class <KFPerk> PerkClass, byte NewLevel );
native final reliable server private event ClientSetLevelCheat( byte NewLevel );

/** Called by UI to change/modify our perk */
native final event						RequestPerkChange(byte NewPerkIndex);
native final reliable server private event ServerSetPendingPerkUpdate( byte NewPerkIndex, int NewPerkBuild, byte NewLevel );
native final reliable server private event ServerSetSavedPerkIndex( byte NewSavedPerkIndex );
native final reliable server protected event ServerSelectPerk( byte NewPerkIndex, byte NewLevel, optional bool bForce=false );
native final 		function bool CanUpdatePerkInfo();
native final		function ApplyPendingPerks();

static function string GetPerkName( int Index )
{
	return default.PerkList[Index].PerkClass.default.PerkName;
}

unreliable server function ServerCallOutPawnCloaking(KFPawn_Monster CloakedPawn)
{
	if( CloakedPawn != none )
	{
		CloakedPawn.CallOutCloaking( self );
	}
}

// If we are on the perk page and a level changes, update the menu
simulated event UpdatePerkLevelMenu( class<KFPerk> PerkClass )
{
	local KFGFxMenu_Perks PerkMenu;

	if( MyGFxManager != none )
	{
		PerkMenu = KFGFxMenu_Perks(MyGFxManager.CurrentMenu);
		if( PerkMenu != none )
		{
        	PerkMenu.UpdateContainers( PerkClass );
		}
	}
}

/** Makes sure we always spawn in with a valid perk */
function WaitForPerkAndRespawn()
{
	SetTimer( WorldInfo.DeltaSeconds, true, nameOf(Timer_CheckForValidPerk), self );
	bWaitingForClientPerkData = true;
}

/** Waits until perk is valid, clears the timer and respawns */
function Timer_CheckForValidPerk()
{
	local KFPerk MyPerk;

	MyPerk = GetPerk();
	if( MyPerk != none && MyPerk.bInitialized )
	{
		// Make sure that readiness state didn't change while waiting
		if( CanRestartPlayer() )
		{
			WorldInfo.Game.RestartPlayer( self );
		}
		ClearTimer( nameOf(Timer_CheckForValidPerk) );
		bWaitingForClientPerkData = false;
	}
}

event SetHaveUpdatePerk( bool bUsedUpdate )
{
	bPlayerUsedUpdatePerk = bUsedUpdate;
}

event NotifyPendingPerkChanges()
{
	ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_PendingPerkChangesSet, PlayerReplicationInfo );
}

event NotifyPerkUpdated()
{
	ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_PendingPerkChangesApplied, PlayerReplicationInfo );
}

/*
 * Network: Local Player
 */
function NotifyXPGain( class<KFPerk> PerkClass, int Amount )
{
	if( PerkClass != none && MyGFxHUD != none && MyGFxHUD.PlayerStatusContainer != none && IsLocalController() )
	{
		MyGFxHUD.PlayerStatusContainer.UpdateXP( Amount, 0, false, PerkClass );
	}

	KFGameReplicationInfo(WorldInfo.GRI).PrimaryXPAccumulator += Amount;
	
	`RecordAARPerkXPGain( self, PerkClass, Amount );
}

/*
 * Network: Local Player
 */
function NotifyLevelUp(class<KFPerk> PerkClass, byte PerkLevel)
{
	local bool bTierUnlocked;

	if( PerkClass != none && IsLocalController() )
	{
		if( PerkLevel % 5 == 0 )
		{
			bTierUnlocked = true;
			class'KFPerk'.static.SaveTierUnlockToConfig( PerkClass, 1, PerkLevel );
			class'KFLocalMessage_Priority'.static.ClientReceive( self, GMT_TierUnlocked );

			//@HSL_BEGIN - JRO - 5/17/2016 - PS4 Activity Feeds
			OnlineSub.PlayerInterfaceEx.PostActivityFeedPerkLevelUp(PerkList[GetPerkIndexFromClass( PerkClass )].PerkClass.default.PerkName, PerkLevel);
			//@HSL_END
		}
		else
		{
			bTierUnlocked = false;
			class'KFLocalMessage_Priority'.static.ClientReceive( self, GMT_LevelUp );
		}

		MyGFxHUD.LevelUpNotificationWidget.ShowLevelUpNotification( PerkClass, Perklevel, bTierUnlocked );

		// Update cached level for UI
		PerkList[GetPerkIndexFromClass( PerkClass )].PerkLevel = PerkLevel;

		// If this is our current perk, notify it of new level
		if( CurrentPerk.Class == PerkClass )
		{
			SetActivePerkLevel( PerkLevel );
			if(bTierUnlocked)
			{
				PostTierUnlock( PerkClass );
			}
		}

		UpdatePerkLevelMenu( PerkClass );
		ClientWriteAndFlushStats();
	}

	if( Role == ROLE_Authority )
	{
		`DialogManager.PlayLevelUpDialog( self );
	}
	else
	{
		ServerPlayLevelUpDialog();
	}
}

//apply the new perk skills/changes
function PostTierUnlock(class<KFPerk> PerkClass)
{
	local int PerkBuild;
	local byte SelectedSkillsHolder[`MAX_PERK_SKILLS];

	PerkBuild = GetPerkBuildByPerkClass( PerkClass );
	GetPerk().GetUnpackedSkillsArray( PerkClass, PerkBuild,  SelectedSkillsHolder);
	CurrentPerk.UpdatePerkBuild(SelectedSkillsHolder, PerkClass);
}

event int GetPerkIndexFromClass( class<KFPerk> InPerkClass )
{
	return PerkList.Find( 'PerkClass', InPerkClass );
}

/**
 * @brief The Gunslingers RM skill plays an extra sound for certain headshots
 *
 * @param RhythmMethodSound Sound to play
 * @param RhytmMethodRTPCName The sounds RTPC name
 * @param Level Num of sound to play
 */
function PlayRMEffect( AkEvent RhythmMethodSound, name RhytmMethodRTPCName, int Level )
{
	SetRTPCValue( RhytmMethodRTPCName, Level, true );
	PlayAKEvent( RhythmMethodSound );
}

function RecievedNewPerkClass()
{
	//refresh the needed UI for online.
	if(MyGfxManager != none && MyGfxManager.TraderMenu != none)
	{
		MyGfxManager.TraderMenu.UpdatePlayerInfo();
	}
}

/*********************************************************************************************
 * @name Camera
********************************************************************************************* */

native function SetViewTarget(Actor NewViewTarget, optional ViewTargetTransitionParams TransitionParams);

/**
 * Returns index of chosen camera anim, or -1 if nothing suitable could be found.
 * bDoNotRandomize: start from index 0.
 */
simulated native final function int		ChooseRandomCameraAnim(out const array<CameraAnim> Anims, optional FLOAT Scale = 1.f, optional bool bDoNotRandomize);
/**
 * Returns true if there is enough space to play the camera anim
 */
simulated native final function bool	CameraAnimHasEnoughSpace( CameraAnim Anim, optional float  Scale = 1.f );

/**
 * Updates depth of field, lerping between on or off states as needed.
 */
native final function UpdateDOF(float DeltaTime);
native final function UpdateDOFGamePlayLerpControl(float DeltaTime);
native final function UpdateDOFIronSightsLerpControl(float DeltaTime);
native final function UpdateFullscreenBlur(float DeltaTime);

exec function ShowTestDownloadNotification (string ItemName, Float PercentComplete, int ItemsRemaining)
{
	if(MyGFxManager != none && MyGFxManager.PartyWidget != none)
	{
		MyGFxManager.PartyWidget.ShowDownLoadNotification(ItemName, PercentComplete, ItemsRemaining);
	}
}

exec function ToggleScreenShotMode()
{
	myHUD.ToggleHUD();
	if ( Pawn != None && KFWeapon(Pawn.Weapon) != none )
		KFWeapon(Pawn.Weapon).bForceHidden = !myHUD.bShowHUD;
}

/** @param CamEmitter Clear the CameraEffect if it is the one passed in */
function RemoveCameraEffect( KFEmit_CameraEffect CamEmitter )
{
	if (CameraEffect == CamEmitter)
	{
		CameraEffect = None;
	}
}

/** Spawn ClientSide Camera Effects **/
unreliable client function ClientSpawnCameraEffect(class<KFEmit_CameraEffect> CameraEffectClass)
{
	local vector CamLoc;
	local rotator CamRot;

	if (CameraEffectClass != None && CameraEffect == None)
	{
		CameraEffect = Spawn(CameraEffectClass, self);
		if (CameraEffect != None)
		{
			GetPlayerViewPoint(CamLoc, CamRot);
			CameraEffect.RegisterCamera(self);
			CameraEffect.UpdateLocation(CamLoc, CamRot, FOVAngle);
		}
	}
}

function ClearCameraEffect()
{
	if( CameraEffect != None )
	{
		CameraEffect.Destroy();
		CameraEffect = none;
	}
}

/**
*	Handle transitioning from one FOV to another, taking into account the aspect ratio of the screen being used
*
* @param	NewFOV	        The new fov to change to
* @param	TransitionTime	How long the FOV transition should take
*/
simulated function HandleTransitionFOVAspectAdjusted(float NewFOV, float TransitionTime)
{
	local float AdjustedFOV;

	if( PlayerCamera != none && KFPlayerCamera(PlayerCamera) != none )
	{
		AdjustedFOV = CalcFOVForAspectRatio(NewFOV, myHUD.SizeX, myHUD.SizeY);
		KFPlayerCamera(PlayerCamera).TransitionFOV(AdjustedFOV,TransitionTime);
	}
}

/**
*	Handle transitioning from one FOV to another, ignoring the aspect ratio of the screen being used
*
* @param	NewFOV	        The new fov to change to
* @param	TransitionTime	How long the FOV transition should take
*/
simulated function HandleTransitionFOV(float NewFOV, float TransitionTime)
{
	if( PlayerCamera != none && KFPlayerCamera(PlayerCamera) != none )
	{
		KFPlayerCamera(PlayerCamera).TransitionFOV(NewFOV,TransitionTime);
	}
}

/**
 * Called by the hud when the resolution changes, handles setting the proper FOV
 * values for the player and weapon based on the aspect ratio
 * @param NewSizeX the X resolution of the screen
 * @param NewSizeY the Y resolution of the screen
 */
simulated function NotifyResolutionChanged(float NewSizeX, float NewSizeY)
{
	local float AspectRatio;
	local float NewFOV;
	local float UsedPlayerIronSightFOV;
	local KFWeapon KFWeap;

	AspectRatio = NewSizeX / NewSizeY;

	//1.6 = 16/10 which is 16:10 ratio and 16:9 comes to 1.77
    NewFOV = CalcFOVForAspectRatio(PlayerCamera.default.DefaultFOV, NewSizeX, NewSizeY);
	//FocusFOV = CalcFOVForAspectRatio(default.FocusFOV, NewSizeX, NewSizeY);

	// 16X9
	if( AspectRatio >= 1.77 )
	{
        //`log("Detected 16X10 or greater: "$(NewSizeX / NewSizeY));
	}
	else if( AspectRatio >= 1.70 )
	{

		//`log("Detected 16X9: "$(NewSizeX / NewSizeY));
	}
	else
	{
        //`log("Detected 4X3: "$(NewSizeX / NewSizeY));
	}
	//`log("Current FOV = "$DefaultFOV$" Default FOV = "$PlayerCamera.default.DefaultFOV$", NewFOV = "$NewFOV);

	DefaultFOV = NewFOV;
	PlayerCamera.DefaultFOV = NewFOV;

	// Initialize the FOV of all the weapons the player is carrying
	if( Pawn != none && KFInventoryManager(Pawn.InvManager) != none )
	{
		KFInventoryManager(Pawn.InvManager).InitFOV(NewSizeX, NewSizeY, DefaultFOV);
	}

	// Set the FOV to the correct aspect ratio adjusted FOV
	if( PlayerCamera != none && KFPlayerCamera(PlayerCamera) != none )
	{
		if( Pawn != none )
		{
			KFWeap = KFWeapon(Pawn.Weapon);
		}

		//if( bIsFocusing && (!bNoControlledBreathingZoom || (ROWeap != none && ROWeap.OverrideAllowFocusZoom()) ) )
		//{
		//	ROPlayerCamera(PlayerCamera).TransitionFOV(FocusFOV,0.0);
		//}
		/*else*/ if( KFWeap != none && KFWeap.bUsingSights )
		{
			UsedPlayerIronSightFOV = KFWeap.PlayerIronSightFOV;
			KFPlayerCamera(PlayerCamera).TransitionFOV(UsedPlayerIronSightFOV,0.0);
		}
		else
		{
			KFPlayerCamera(PlayerCamera).TransitionFOV(DefaultFOV,0.0);
		}
	}
}

/**
 * For a given 16/9 based FOV, give the proper FOV for an aspect ratio
 * @param OriginalFOV the original FOV in 4/3 ratio that we need to adjust
 * @param NewSizeX the X resolution of the screen
 * @param NewSizeY the Y resolution of the screen
 * @return The FOV value adjusted for the current aspect ratio
 */
static function float CalcFOVForAspectRatio(float OriginalFOV, float SizeX, float SizeY)
{
	local float AspectRatio;
	local float OriginalAspectRatio;
	local float NewFOV;

	if ( SizeY > 0 )
	{
		AspectRatio = SizeX / SizeY;
		OriginalAspectRatio = 16/9;
		NewFOV = (ATan2((Tan((OriginalFOV*Pi)/360.0)*(AspectRatio/OriginalAspectRatio)),1)*360.0)/Pi;
	}

	if ( NewFOV == 0 )
	{
		// aladenberger 5/11/5012 - Detected FOV calc bug
		// Problem: SizeX = 0 is being used to reinitialize HUD widgets
		// Solution: Call this function again HUD has been initalized, or avoid SizeX = 0 and use the new bRefreshHUDWidgets flag instead
		`log("*** BAD FOV CALC DETECTED ***"@GetFuncName()@"SizeX="$SizeX@"SizeY="$SizeY);
	}

	//`log("OriginalFOV "$OriginalFOV$" NewFOV "$NewFOV);

	return NewFOV;
}

/**
 * Overridden to set the proper FOV for widescreen
 */
function FixFOV()
{
	if( myHud != none )
	{
		if( PlayerCamera != none )
		{
            FOVAngle = CalcFOVForAspectRatio(PlayerCamera.default.DefaultFOV, myHUD.SizeX, myHUD.SizeY);
    		DesiredFOV = CalcFOVForAspectRatio(PlayerCamera.default.DefaultFOV, myHUD.SizeX, myHUD.SizeY);
    		DefaultFOV = CalcFOVForAspectRatio(PlayerCamera.default.DefaultFOV, myHUD.SizeX, myHUD.SizeY);
		}
		else
		{
            FOVAngle = CalcFOVForAspectRatio(default.DefaultFOV, myHUD.SizeX, myHUD.SizeY);
    		DesiredFOV = CalcFOVForAspectRatio(default.DefaultFOV, myHUD.SizeX, myHUD.SizeY);
    		DefaultFOV = CalcFOVForAspectRatio(default.DefaultFOV, myHUD.SizeX, myHUD.SizeY);
		}
	}
	else
	{
		FOVAngle = PlayerCamera.default.DefaultFOV;
		DesiredFOV = PlayerCamera.default.DefaultFOV;
		DefaultFOV = PlayerCamera.default.DefaultFOV;
	}

    if( myHud != none && KFPlayerCamera(PlayerCamera) != none )
    {
        KFPlayerCamera(PlayerCamera).TransitionFOV( DefaultFOV, 0.0f );
    }
}

function ResetFOV()
{
    super.ResetFOV();

    if( KFPlayerCamera(PlayerCamera) != none )
    {
        KFPlayerCamera(PlayerCamera).TransitionFOV( PlayerCamera.DefaultFOV, 0.0f );
    }
}

/**
 * Replicated function to set camera style on client
 *
 * @param	NewCamMode, name defining the new camera mode
 */
reliable client function ClientSetCameraMode( name NewCamMode )
{
	local KFPawn KFP;
	local KFPawn_MonsterBoss KFBoss;
	local vector Loc, Pos, HitLocation, HitNormal;
	local rotator Rot;

	// Debugging - Show/Hide the player model using exec Camera()
	KFP = KFPawn(ViewTarget);
	if( KFP != None )
	{
		KFP.SetMeshVisibility(NewCamMode != 'FirstPerson');
		// Disable aim offset in fixed camera (for anim debugging)
		KFP.bEnableAimOffset = (NewCamMode != 'Fixed');
	}

	if( NewCamMode == 'Boss' )
	{
		KFBoss = GetBoss();

		// If our nightvision is active... disable it
		SetNightVision(false);

		// If our current view target is not a boss, make sure we find one
		if( !ViewTarget.IsA('KFPawn_MonsterBoss') )
		{
			SetViewTarget(KFBoss);
		}
	}
	else
	{
		HideBossNameplate();

		// Apply the same camera offset that Camera.uc uses to avoid popping
		if( NewCamMode == 'FreeCam' )
		{
			if( PlayerCamera != none && PlayerCamera.CameraStyle != NewCamMode )
			{
				Loc = Location;
				Loc += PlayerCamera.FreeCamOffset >> Rotation;
				Rot = PlayerCamera.CameraCache.POV.Rotation;
				Rot.Roll = 0;
				Pos = Loc + Vector(Rot) * PlayerCamera.FreeCamDistance;

				// Make sure we're not in geometry
				Trace( HitLocation, HitNormal, Pos, Loc, false, vect(12,12,12) );

				SetLocation( IsZero(HitLocation) ? Pos : HitLocation );
				SetRotation( Rot );
			}
		}
		else if( NewCamMode == 'FirstPerson' && !PlayerReplicationInfo.bIsSpectator )
		{
			// If are not in spectating mode and have a pawn to view, view it
			if( Pawn != none && ViewTarget != Pawn)
			{
				SetViewTarget( Pawn );
			}
		}

		if( IsSpectating() && ViewTarget != none && (ViewTarget != Pawn || (KFPawn_Customization(Pawn) == none && !Pawn.IsAliveAndWell())) )
		{
			NotifyChangeSpectateViewTarget();
		}
	}

	if ( PlayerCamera != None )
	{
		PlayerCamera.CameraStyle = NewCamMode;
	}
}

function KFPawn_MonsterBoss GetBoss()
{
	local KFPawn_MonsterBoss KFBoss;

	foreach WorldInfo.AllPawns( class'KFPawn_MonsterBoss', KFBoss )
	{
		return KFBoss;
	}

	return none;
}

/**
 * Set new camera mode
 *
 * @param	NewCamMode, new camera mode.
 */
function SetCameraMode( name NewCamMode )
{
	local vector Loc, Pos, HitLocation, HitNormal;
	local rotator Rot;

	if ( PlayerCamera != None )
	{
		PlayerCamera.CameraStyle = NewCamMode;

		// Apply the same camera offset that Camera.uc uses to avoid popping
		if( NewCamMode == 'FreeCam' )
		{
			Loc = Location;
			Loc += PlayerCamera.FreeCamOffset >> Rotation;
			Rot = PlayerCamera.CameraCache.POV.Rotation;
			Rot.Roll = 0;
			Pos = Loc + Vector( Rot ) * PlayerCamera.FreeCamDistance;

			// Make sure we're not in geometry
			Trace( HitLocation, HitNormal, Pos, Loc, false, vect(12,12,12) );

			SetLocation( IsZero(HitLocation) ? Pos : HitLocation );
			SetRotation( Rot );
		}

		if ( WorldInfo.Role == ROLE_Authority )
		{
			ClientSetCameraMode( NewCamMode );
		}
	}
}

/** LandingShake()
returns true if controller wants landing view shake
*/
simulated function bool LandingShake()
{
    // KF2TODO: If we want to be able to disable this in config add this UDK setting back in
    //return bLandingShake;

    return true;
}

/**
 * Processes the player's ViewRotation
 * adds delta rot (player input), applies any limits and post-processing
 * returns the final ViewRotation set on PlayerController
 * Overriden to add free-aim, recoil and sway
 *
 * @param	DeltaTime, time since last frame
 * @param	ViewRotation, current player ViewRotation
 * @param	DeltaRot, player input added to ViewRotation
 */
function ProcessViewRotation( float DeltaTime, out Rotator out_ViewRotation, Rotator DeltaRot )
{
	if( Pawn != none && KFWeapon(Pawn.Weapon) != none )
	{
		KFWeapon(Pawn.Weapon).WeaponProcessViewRotation(self, DeltaTime, DeltaRot);
	}

	super.ProcessViewRotation( DeltaTime, out_ViewRotation, DeltaRot );
}

function SetBossCamera( Pawn Boss )
{
	local KFPawn_MonsterBoss KFPMBoss;

	// If our view target has been obliterated, the camera will default to view the player controller.
	// So, put the player controller where the view target was.
	KFPMBoss = KFPawn_MonsterBoss( Boss );
	if( KFPMBoss != none && KFPMBoss.HitFxInfo.bObliterated )
	{
		SetLocation( Boss.Location );
	}

	SetViewTarget( Boss );
	ServerCamera( 'Boss' );
}

// overridden because to view a dying boss as a client
event ResetCameraMode()
{
	if( PlayerCamera != none && PlayerCamera.CameraStyle != 'Boss' )
	{
		super.ResetCameraMode();
	}
}

/**
 * Simulated function to enable depth of field on client
 *
 * @param	bEnableDOD, boolean to enable/disable DOF
 * @param   StaticDOFDistance, optional parameter specifying static focal distance
 */
simulated function EnableDepthOfField(bool bEnableDOF, optional float StaticDOFDistance, optional float Aperture)
{
	DOFStaticFocusDepth = StaticDOFDistance;
	DOFFocalAperture = Aperture;
	bDOFEnabled = bEnableDOF;
}

/**
 * Simulated function to enable or disable full-screen blur on client
 */
simulated function EnableBlur(bool bEnableBlur, float BlurAmount, float InSpeed, float OutSpeed)
{
	bBlurEnabled = bEnableBlur;
	if(bBlurEnabled)
	{
		BlurStrength = BlurAmount;
	}

	BlurBlendInSpeed = InSpeed;
	BlurBlendOutSpeed = OutSpeed;
}

/**
 * Simulated function to enable/disable IronSights (for DOF)
 */
simulated function EnableIronSights(bool bEnableIronSights)
{
	bIronSightsDOFActive = bEnableIronSights;
}

/**
 * Toggle screen space reflections
 */
simulated function EnableReflections(bool bEnabled)
{
	bReflectionsEnabled = bEnabled;
}

/**
 * Change Camera mode
 *
 * @param	New camera mode to set
 */
exec function Camera( name NewMode )
{
`if(`notdefined(ShippingPC))
	super.Camera( NewMode );
`endif
}

exec function  ResetCustomizationCamera ()
{
	if ( KFPlayerCamera( PlayerCamera ) != none )
	{
		KFPlayerCamera( PlayerCamera ).CustomizationCam.bInitialize = false;
		KFPlayerCamera( PlayerCamera ).CustomizationCam.SetBodyView( 0 );
	}
}

/*********************************************************************************************
 * @name Admin controls (Based on UTPlayerController)
 ********************************************************************************************/

function bool AdminCmdOk()
{
	//If we are the server then commands are ok
	if (WorldInfo.NetMode == NM_ListenServer && LocalPlayer(Player) != None)
	{
		return true;
	}

	if (WorldInfo.TimeSeconds < NextAdminCmdTime)
	{
		return false;
	}

	NextAdminCmdTime = WorldInfo.TimeSeconds + 5.0;
	return true;
}

exec function AdminLogin(string Password)
{
	if (Password != "" && AdminCmdOk() )
	{
		ServerAdminLogin(Password);
	}
}

reliable server private function ServerAdminLogin(string Password)
{
	if ( (WorldInfo.Game.AccessControl != none) && AdminCmdOk() )
	{
		if ( WorldInfo.Game.AccessControl.AdminLogin(self, Password) )
		{
			WorldInfo.Game.AccessControl.AdminEntered(Self);
		}
	}
}

exec function AdminLogOut()
{
	if ( AdminCmdOk() )
	{
		ServerAdminLogOut();
	}
}

reliable server private function ServerAdminLogOut()
{
	if ( WorldInfo.Game.AccessControl != none )
	{
		if ( WorldInfo.Game.AccessControl.AdminLogOut(self) )
		{
			WorldInfo.Game.AccessControl.AdminExited(Self);
		}
	}
}

// Execute an administrative console command on the server.
exec function Admin( string CommandLine )
{
	if (PlayerReplicationInfo.bAdmin)
	{
		ServerAdmin(CommandLine);
	}
}

reliable server private function ServerAdmin( string CommandLine )
{
	local string Result;

	if ( PlayerReplicationInfo.bAdmin )
	{
		Result = ConsoleCommand( CommandLine );
		if( Result!="" )
			ClientMessage( Result );
	}
}

reliable client event ClientWasKicked()
{
	if (IsPrimaryPlayer())
	{
		ClientSetProgressMessage(PMT_ConnectionFailure, class'KFLocalMessage'.default.KickedFromServerString, Localize("Errors", "ConnectionFailed_Title", "Engine"));
		ConsoleCommand("DISCONNECT TWFORCED");
	}
}

/*********************************************************************************************
 * @name Weapon Handling
********************************************************************************************* */

/** Almost exactly like Controller::PickTarget(), but callable clientside */
private native function Pawn PickAimAtTarget(out float bestAim, out float bestDist, vector FireDir, vector projStart, float MaxRange, optional bool bTargetTeammates = False);

/** Accessor for PickAimAtTarget */
simulated final function Pawn GetPickedAimAtTarget(out float bestAim, out float bestDist, vector FireDir, vector projStart, float MaxRange, optional bool bTargetTeammates = False)
{
    return PickAimAtTarget(bestAim, bestDist, FireDir, projStart, MaxRange, bTargetTeammates);
}

exec function SwitchToBestWeapon(optional bool bForceNewWeapon)
{
    // Don't let players use an exec to bring up a weapon if the weapon prevents it
    if( Pawn != none && Pawn.Weapon != none && KFWeapon(Pawn.Weapon) != none )
    {
        if( !KFWeapon(Pawn.Weapon).CanSwitchWeapons() )
        {
             return;
        }
    }

	super.SwitchToBestWeapon(bForceNewWeapon);
}

/**
 * Adjusts weapon aiming direction.
 * Gives controller a chance to modify the aiming of the pawn. For example aim error, auto aiming, adhesion, AI help...
 * Requested by weapon prior to firing.
 *
 * Completely overrides super to support free-aim hip shots going where the muzzle is pointed (modified block is marked)
 *
 * @param	W, weapon about to fire
 * @param	StartFireLoc, world location of weapon fire start trace, or projectile spawn loc.
 * @param	BaseAimRot, original aiming rotation without any modifications.
 */
function Rotator GetAdjustedAimFor( Weapon W, vector StartFireLoc )
{
	local vector	FireDir, HitLocation, HitNormal;
	local actor		BestTarget, HitActor;
	local float		bestAim, bestDist;
	local bool		bNoAimCorrection, bInstantHit;
	local rotator	BaseAimRot;

	bInstantHit = ( W == None || W.bInstantHit );
	BaseAimRot = (Pawn != None) ? Pawn.GetBaseAimRotation() : Rotation;

	if( W != none )
	{
		// Add in the weapon buffer rotation for recoil/sway
		BaseAimRot += WeaponBufferRotation;
	}

    // Clients are done after WeaponBufferRotation unless aim correction is on
    if( Role < ROLE_Authority && !AimingHelp(bInstantHit) )
    {
        return BaseAimRot;
    }

	FireDir	= vector(BaseAimRot);
	HitActor = Trace(HitLocation, HitNormal, StartFireLoc + W.GetTraceRange() * FireDir, StartFireLoc, true);

	if ( (HitActor != None) && HitActor.bProjTarget )
	{
		BestTarget = HitActor;
		bNoAimCorrection = true;
		BestDist = VSize(BestTarget.Location - Pawn.Location);
	}
	else
	{
		// adjust aim based on FOV
		bestAim = 0.90;
		if ( AimingHelp(bInstantHit) )
		{
			bestAim = AimHelpDot(bInstantHit);
		}
		else if ( bInstantHit )
			bestAim = 1.0;

		BestTarget = PickAimAtTarget(bestAim, bestDist, FireDir, StartFireLoc, W.WeaponRange);
		if ( BestTarget == None )
		{
			return BaseAimRot;
		}
	}

	ShotTarget = Pawn(BestTarget);
	if ( !AimingHelp(bInstantHit) )
	{
		return BaseAimRot;
	}

	if ( !bNoAimCorrection && W != None )
	{
		ProcessAimCorrection(ShotTarget, KFWeapon(W), StartFireLoc, BaseAimRot);
	}
	return BaseAimRot;
}

/** Aim correction for near headshot misses */
function ProcessAimCorrection(Pawn Target, KFWeapon W, vector StartLoc, out rotator AimRot)
{
	local vector AimLoc, TargetLoc, HeadLoc;
	local vector2d Offset;
	local float Distance, AimCorrection;
	local KFPawn KFP;

	if ( W == None || W.AimCorrectionSize <= 0 )
	{
		return;
	}

	HeadLoc	 = Target.Mesh.GetBoneLocation('head');
	Distance = VSize(HeadLoc - StartLoc);
	if ( IsZero(HeadLoc) || Distance > MaxAimCorrectionDistance )
	{
		return;
	}
	AimLoc = StartLoc + vector(AimRot) * Distance;

	// Calculate the aim friction multiplier
	// Horizontal component
	TargetLoc	 = HeadLoc;
	TargetLoc.Z  = AimLoc.Z;
	Offset.X = PointDistToLine( AimLoc, (TargetLoc - StartLoc), StartLoc );

	// Vertical component
	TargetLoc	 = HeadLoc;
	TargetLoc.X  = AimLoc.X;
	TargetLoc.Y  = AimLoc.Y;
	Offset.Y = PointDistToLine( AimLoc, (TargetLoc - StartLoc), StartLoc );

	// calculate size of aim correction offset
	AimCorrection = FMin(W.AimCorrectionSize, MAX_AIM_CORRECTION_SIZE);
	if ( `IsInZedTime(self) )
	{
		AimCorrection *= 0.5f;
	}

	if ( Offset.X <= AimCorrection && Offset.Y <= AimCorrection )
	{
		// Skip headless.  We could try a new target behind this one, but it would affect
		// the ShotTarget and in actual gameplay this turns out to be not very useful.
		KFP = KFPawn(Target);
		if ( KFP != None && KFP.IsHeadless() )
	{
			//`log("Aim correction targeted a headless zed");
			return;
		}

		//`log("Aim correction triggered - Slomo="$`IsInZedTime(self)@"["$Offset.X$", "$Offset.Y$"]");
		AimRot = rotator(HeadLoc - StartLoc);
	}
}

/** Like ServerThrowWeapon, but can specify the weapon */
reliable server function ServerThrowOtherWeapon(Weapon W)
{
    if ( W != None && W.Instigator == Pawn && W.CanThrow() )
	{
		Pawn.TossInventory(W);
	}
}

/*********************************************************************************************
 * @name Player Movement
********************************************************************************************* */

// Player movement.
// Player Standing, walking, running, falling.
state PlayerWalking
{
	ignores SeePlayer, HearNoise, Bump;

	/** Overridden to set Pawn.MovementSpeedModifier based on controller input */
	function ProcessMove(float DeltaTime, vector NewAccel, eDoubleClickDir DoubleClickMove, rotator DeltaRot)
	{
		local float MinMoveScale, MaxMoveScale;
		local InterpCurveFloat MoveSensitivityCurve;

		super.ProcessMove( DeltaTime, NewAccel, DoubleClickMove, DeltaRot );

		// DoubleClickMove now stores an approximation of movement scale, so lerp between min and max speed scalars
		MoveSensitivityCurve = class'KFPlayerInput'.default.MoveSensitivityScaleCurve;
		MinMoveScale = MoveSensitivityCurve.Points[0].OutVal;
		MaxMoveScale = MoveSensitivityCurve.Points[ MoveSensitivityCurve.Points.Length - 1 ].OutVal;
		Pawn.MovementSpeedModifier = Lerp( MaxMoveScale, MinMoveScale, float(DoubleClickMove) / float(EAnalogMovementSpeed.AMOVESPEED_Max) );
	}

	/** Overridden to reset Pawn.MovementSpeedModifier */
	function EndState( name NextStateName )
	{
		super.EndState( NextStateName );
		if ( Pawn != None )
		{
			Pawn.MovementSpeedModifier = 1.f;
		}
	}
}

/* HandleWalking:
	Called by PlayerController and PlayerInput to set bIsWalking flag, affecting Pawn's velocity */
function HandleWalking()
{
	local bool bShouldSprint;

    if (Pawn != None)
	{
		// In KF2, the weapon determines our walking state
		if (Pawn.Weapon != None)
		{
            Pawn.SetWalking(Pawn.Weapon.ShouldOwnerWalk());
		}
		else
		{
			Pawn.SetWalking(false);
		}

		bShouldSprint = (bRun != 0 && !IsZero(Pawn.Acceleration));
		if ( bShouldSprint )
		{
			bDuck = 0; // sprint cancels crouch
		}
		KFPawn(Pawn).SetSprinting(bShouldSprint);
	}
}

/* CheckJumpOrDuck()
Called by ProcessMove()
handle jump and duck buttons which are pressed
*/
function CheckJumpOrDuck()
{
	if ( Pawn == None )
	{
		return;
	}

    if ( bPressedJump )
	{
		Pawn.DoJump( bUpdating );
	}
	if ( Pawn.Physics != PHYS_Falling && Pawn.bCanCrouch )
	{
		Pawn.ShouldCrouch(bDuck != 0 && bRun == 0);
	}
}

/** Disable movement on the local player for short time. */
function PauseMoveInput(float PauseTime=0.50)
{
	if ( IsLocalPlayerController() && PauseTime > 0.f && PauseMoveInputTimeLeft == 0.f )
	{
		IgnoreMoveInput(TRUE);
		PauseMoveInputTimeLeft = PauseTime;
	}
}

/** Make sure our movement is re-enabled shortly after (in realtime seconds) */
function TickPauseMoveInput(float DeltaTime)
{
	local float RealDeltaTime;

	if ( PauseMoveInputTimeLeft > 0.f )
	{
		RealDeltaTime = (DeltaTime / WorldInfo.TimeDilation);
		PauseMoveInputTimeLeft -= RealDeltaTime;
		if ( PauseMoveInputTimeLeft <= 0 )
		{
	IgnoreMoveInput(FALSE);
			PauseMoveInputTimeLeft = 0.f;
		}
	}
}

/* ServerMove()
- replicated function sent by client to server - contains client movement and firing info.
overriden to support replicating free aim rotation - Ramm
*/
unreliable server function ServerMove
(
	float	TimeStamp,
	vector	InAccel,
	vector	ClientLoc,
	byte	MoveFlags,
	byte	ClientRoll,
	int		View,
	optional int FreeAimRot
)
{
	local rotator   NewFreeAimRot;
	local int       FreeAimPitch, FreeAimYaw;

	// Unpack the free-aim rotation vars and set the rotation on the pawns weapon
	if( Pawn != none && Pawn.Weapon != none )
	{
	    // Free-aim vars
	    FreeAimPitch = (FreeAimRot & 65535);
		FreeAimYaw = (FreeAimRot >> 16);

		NewFreeAimRot.Pitch  = FreeAimPitch;
		NewFreeAimRot.Yaw  = FreeAimYaw;

		WeaponBufferRotation = NewFreeAimRot;
	}

	Super.ServerMove(TimeStamp, InAccel, ClientLoc, MoveFlags, ClientRoll, View, FreeAimRot);
}

/* DualServerMove()
- replicated function sent by client to server - contains client movement and firing info for two moves
overriden to support replicating free aim rotation - Ramm
*/
unreliable server function DualServerMove
(
	float TimeStamp0,
	vector InAccel0,
	byte PendingFlags,
	int View0,
	float TimeStamp,
	vector InAccel,
	vector ClientLoc,
	byte NewFlags,
	byte ClientRoll,
	int View,
	optional int FreeAimRot0,
	optional int FreeAimRot
)
{
	ServerMove(TimeStamp0,InAccel0,vect(1,2,3),PendingFlags,ClientRoll,View0,FreeAimRot0);
	ServerMove(TimeStamp,InAccel,ClientLoc,NewFlags,ClientRoll,View,FreeAimRot);
}

/* CallServerMove()
Call the appropriate replicated servermove() function to send a client player move to the server
overriden to support replicating free aim rotation - Ramm
*/
function CallServerMove
(
	SavedMove NewMove,
    vector ClientLoc,
    byte ClientRoll,
    int View,
    SavedMove OldMove
)
{
	local vector BuildAccel;
	local byte OldAccelX, OldAccelY, OldAccelZ;
	local int FreeAimRot;

	// Pack free aim rotation before sending to server
	FreeAimRot = ((WeaponBufferRotation.Yaw & 65535) << 16) + (WeaponBufferRotation.Pitch & 65535);

	// compress old move if it exists
	if ( OldMove != None )
	{
		// old move important to replicate redundantly
		BuildAccel = 0.05 * OldMove.Acceleration + vect(0.5, 0.5, 0.5);
		OldAccelX = CompressAccel(BuildAccel.X);
		OldAccelY = CompressAccel(BuildAccel.Y);
		OldAccelZ = CompressAccel(BuildAccel.Z);
		OldServerMove(OldMove.TimeStamp,OldAccelX, OldAccelY, OldAccelZ, OldMove.CompressedFlags());
	}

	if ( PendingMove != None )
	{
		// send two moves simultaneously
		DualServerMove
		(
			PendingMove.TimeStamp,
			PendingMove.Acceleration * 10,
			PendingMove.CompressedFlags(),
			((PendingMove.Rotation.Yaw & 65535) << 16) + (PendingMove.Rotation.Pitch & 65535),
			NewMove.TimeStamp,
			NewMove.Acceleration * 10,
			ClientLoc,
			NewMove.CompressedFlags(),
			ClientRoll,
			View,
			((PendingMove.WeaponBufferRotation.Yaw & 65535) << 16) + (PendingMove.WeaponBufferRotation.Pitch & 65535),
			FreeAimRot
		);
	}
	else
	{
		ServerMove
		(
	    NewMove.TimeStamp,
	    NewMove.Acceleration * 10,
	    ClientLoc,
		NewMove.CompressedFlags(),
		ClientRoll,
	    View,
	    FreeAimRot
		);
	}

	if (PlayerCamera != None && PlayerCamera.bUseClientSideCameraUpdates)
	{
		PlayerCamera.bShouldSendClientSideCameraUpdate = TRUE;
	}
}

/** Overridden to reset MaxResponseTime every call so we don't use an invalid MaxResponseTime.
	On the server, MaxResponseTime used to be set only in PostBeginPlay, taking time dilation into account but not being updated when time dilation changes.
*/
function float GetServerMoveDeltaTime(float TimeStamp)
{
	MaxResponseTime = Default.MaxResponseTime * WorldInfo.TimeDilation;
	return Super.GetServerMoveDeltaTime( TimeStamp );
}

/*********************************************************************************************
 * @name Aim Assist
********************************************************************************************* */

/** Called from PlayerController.UpdateRotation; Takes ForceLookAtPawn, bAutoTargetEnabled, and bTargetAdhesionEnabled into account */
function ModifyUpdateRotation( float DeltaTime, out Rotator DeltaRot )
{
	local KFPlayerInput KFInput;
	KFInput = KFPlayerInput(PlayerInput);

	if( Pawn != none && ForceLookAtPawn != none && (ForceLookAtPawnTime >= 0 || bLockToForceLookAtPawn) )
	{
		if( !bLockToForceLookAtPawn )
		{
            ForceLookAtPawnTime -= DeltaTime;
        }

        KFInput.ApplyForceLookAtPawn( DeltaTime, DeltaRot.Yaw, DeltaRot.Pitch );

        // The CurrentAutoTarget when we're done autotargeting it
        if( !bLockToForceLookAtPawn && ForceLookAtPawnTime <= 0 )
        {
            ForceLookAtPawn = none;
        }
	}
	else if( Pawn != none && KFInput.CurrentAutoTarget != none && KFInput.AutoTargetTimeLeft >= 0 )
	{
        KFInput.ApplyAutoTarget( DeltaTime, KFWeapon(Pawn.Weapon), DeltaRot.Yaw, DeltaRot.Pitch );
	}
	// NOTE:  we probably only want to ApplyTargetAdhesion when we are moving as it hides the Adhesion a lot better
	else if( KFInput.IsAimAssistAdhesionEnabled() && Pawn != none && (PlayerInput.aForward != 0 || PlayerInput.aStrafe != 0) )
	{
		KFInput.ApplyTargetAdhesion( DeltaTime, KFWeapon(Pawn.Weapon), DeltaRot.Yaw, DeltaRot.Pitch );
	}
}

/**
 * Start an instance of autotargeting when going to ironsights or during other actions
 */
simulated function StartAutoTargeting()
{
	local KFPlayerInput KFInput;

	if ( !IsLocalController()  )
	{
		return; // LocalPlayer Only
	}

    if( !PlayerInput.bUsingGamepad )
    {
        return;
    }

	KFInput = KFPlayerInput(PlayerInput);
    KFInput.InitAutoTarget();
}

/** Overloaded to make sure player is actually using gamepad */
function bool AimingHelp(bool bInstantHit)
{
	if( PlayerInput != none
		&& PlayerInput.bUsingGamepad
		&& MaxAimCorrectionDistance > 0.f
		&& IsLocalController() )
    {
        return true;
    }

 	return false;
}

/*********************************************************************************************
 * @name Use / Interact
********************************************************************************************* */

static simulated function KFInterface_Usable GetCurrentUsableActor( Pawn P, optional bool bUseOnFind=false )
{
	local KFInterface_Usable UsableActor;
	local Actor A, BestActor;

	local KFInterface_Usable BestUsableActor;
	local int InteractionIndex, BestInteractionIndex;

	BestInteractionIndex = -1;

	if ( P != None )
	{
		// Check touching -- Useful when UsedBy() is implemented by subclass instead of kismet
		ForEach P.TouchingActors(class'Actor', A)
		{
			UsableActor = KFInterface_Usable( A );
			if ( UsableActor != none && UsableActor.GetIsUsable( P ) )
			{
				// find the best usable by priority
				// use the usable's interaction index as priority, since the UI already sort of does that
				InteractionIndex = UsableActor.GetInteractionIndex();
				if( InteractionIndex > BestInteractionIndex )
				{
					BestInteractionIndex = InteractionIndex;
					BestUsableActor = UsableActor;
					BestActor = A;
				}
			}
		}

		if( BestUsableActor != none )
		{
			if( bUseOnFind )
			{
				BestActor.UsedBy( P );
			}
			return BestUsableActor;
		}
	}
	return none;
}

/** Have to override the engine function, because it only works for kismet trigger events */
function bool TriggerInteracted()
{
	// first let the base engine do it's kismet thing
	if ( Super.TriggerInteracted() )
		return true;

	if( Pawn != none )
	{
		GetCurrentUsableActor( Pawn, true );
	}

	return false;
}

reliable client event ReceiveLocalizedMessage( class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject )
{
	local string TempMessage;
	// Wait for player to be up to date with replication when joining a server, before stacking up messages
	if ( WorldInfo.NetMode == NM_DedicatedServer || WorldInfo.GRI == None )
		return;

	if( Message == class'KFLocalMessage_Game' && MyGFxHUD != none )
	{
		TempMessage = Class'KFLocalMessage_Game'.static.GetString(switch, true, RelatedPRI_1, RelatedPRI_2, OptionalObject);

		if(TempMessage != "")
		{
			MyGFxHUD.ShowNonCriticalMessage( TempMessage );
			if(Switch == KMT_Killed || Switch == KMT_Suicide)
			{
				//zed suicide
				if(Switch == KMT_Suicide  )
				{
					if(RelatedPRI_2.GetTeamNum() == 255 && RelatedPRI_2.UniqueID == PlayerReplicationInfo.UniqueID)
					{
						class'KFMusicStingerHelper'.static.PlayZedPlayerSuicideStinger( Self );
					}
					
					if(RelatedPRI_2.GetTeamNum() == class'KFTeamInfo_Human'.default.TeamIndex && RelatedPRI_2.GetTeamNum() == PlayerReplicationInfo.GetTeamNum())
					{
						if(RelatedPRI_2.UniqueID == PlayerReplicationInfo.UniqueID)
						{
							ReceiveLocalizedMessage( class'KFLocalMessage_Priority', GMT_Died, RelatedPRI_1, RelatedPRI_2, OptionalObject );
						}
						else
						{
							class'KFMusicStingerHelper'.static.PlayTeammateDeathStinger( Self );							
						}
					}
				}
				else if(Switch == KMT_Killed)
				{
					//killed by AI
					if(RelatedPRI_2.GetTeamNum() == class'KFTeamInfo_Human'.default.TeamIndex && RelatedPRI_2.GetTeamNum() == PlayerReplicationInfo.GetTeamNum())
					{
						if(RelatedPRI_2.UniqueID == PlayerReplicationInfo.UniqueID)
						{
							ReceiveLocalizedMessage( class'KFLocalMessage_Priority', GMT_Died, RelatedPRI_1, RelatedPRI_2, OptionalObject );
						}
						else
						{
							class'KFMusicStingerHelper'.static.PlayTeammateDeathStinger( Self );							
						}
					}
				}
				
				MyGFxHUD.ShowKillMessage( RelatedPRI_1, RelatedPRI_2, true, OptionalObject );
			}
		}
	}
	else if(Message == class'KFLocalMessage_PlayerKills' && MyGFxHUD != none)
	{
		if(switch == KMT_PlayerKillPlayer ||  ( class'KFGameEngine'.default.bShowKillTicker && switch == KMT_PLayerKillZed ) )
		{
			if(switch == KMT_PlayerKillPlayer)
			{
				//human killed
				if(RelatedPRI_2.GetTeamNum() == class'KFTeamInfo_Human'.default.TeamIndex)
				{
					//zed killed human
					if(RelatedPRI_1.GetTeamNum() == 255)
					{
						class'KFMusicStingerHelper'.static.PlayZedKillHumanStinger( Self );							
					}
					else if(RelatedPRI_2.GetTeamNum() == PlayerReplicationInfo.GetTeamNum()) //in the case of friendly fire
					{
						if(RelatedPRI_2.UniqueID == PlayerReplicationInfo.UniqueID)
						{
							class'KFMusicStingerHelper'.static.PlayPlayerDiedStinger( Self );							
						}
						else
						{
							class'KFMusicStingerHelper'.static.PlayTeammateDeathStinger( Self );							
						}
					}
				}
				else
				{
					if(RelatedPRI_2.UniqueID == PlayerReplicationInfo.UniqueID)
					{
						//zed death
						class'KFMusicStingerHelper'.static.PlayZedPlayerKilledStinger( Self );	
					}
					
				}
			}
			MyGFxHUD.ShowKillMessage( RelatedPRI_1, RelatedPRI_2, false, OptionalObject );
		}
	}
	else
	{
		super.ReceiveLocalizedMessage( Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject );
	}

}

/** Pending interaction messages exist for cases when two interacting triggers touch eachother ;)
	Only one of the touching actors lists of "TouchingActors" is properly updated. Wait a tick for both to have
	correct lists */
function SetPendingInteractionMessage()
{
	SetTimer( 0.01f, false, nameof(UpdatePendingInteractionMessage) );
}

function UpdatePendingInteractionMessage()
{
	if( Pawn != none )
	{
		UpdateInteractionMessages( Pawn );
	}
}

static function UpdateInteractionMessages( Actor InteractingActor )
{
	local KFInterface_Usable UsableActor;
	local Pawn P;
	local PlayerController PC;

	P = Pawn(InteractingActor);
	if( P != none )
	{
		PC = PlayerController( P.Controller );
		if( PC != none && PC.Role == ROLE_AUTHORITY )
		{
			UsableActor = GetCurrentUsableActor( P );
			if( UsableActor != none )
			{
				PC.SetTimer( 1.f, true, nameof(CheckCurrentUsableActor), PC );
				PC.ReceiveLocalizedMessage( class'KFLocalMessage_Interaction', UsableActor.GetInteractionIndex() );
			}
			else
			{
				PC.ClearTimer( nameof(CheckCurrentUsableActor), PC );
				PC.ReceiveLocalizedMessage( class'KFLocalMessage_Interaction', IMT_None );
			}
		}
	}
}

/** Checks to see if the player still needs an interaction message to be displayed.
  * When used with a timer, lower priority "usable" messages can be resumed after being interrupted by higher priority messages. */
function CheckCurrentUsableActor()
{
	local KFInterface_Usable UsableActor;

	UsableActor = GetCurrentUsableActor( Pawn );
	if( UsableActor != none )
	{
		ReceiveLocalizedMessage( class'KFLocalMessage_Interaction', UsableActor.GetInteractionIndex() );
	}
	else
	{
		ReceiveLocalizedMessage( class'KFLocalMessage_Interaction', IMT_None );
		ClearTimer( nameof(CheckCurrentUsableActor) );
	}
}

/*********************************************************************************************
 * @name Gameplay Effects
********************************************************************************************* */

/**
 * Called from KFPawn to let the client know it has screen effects
 */
simulated function PlayScreenHitFX(class<KFDamageType> KFDT, bool bShowPainEffect)
{
	PlayScreenEffects( KFDT );

	// Always performt his after we've put on screen effects
	PlayScreenMaterialEffects( KFDT, bShowPainEffect );
}

/** Adds a particle effect on the lens if we have one followed by the screen material*/
simulated function PlayScreenEffects(class<KFDamageType> KFDT)
{
	local class<EmitterCameraLensEffectBase> LensEffectTemplate;
	local KFPerk MyKFPerk;

	// First apply the lens effect
	MyKFPerk = GetPerk();
	if( Pawn != none && Pawn.IsFirstPerson() && MyKFPerk != none )
	{
		// Only turn the camera lens effect on if it is not already running to avoid popping from damage over time
		if( GetEffectTimeRemaining( KFDT ) <= 0 )
		{
			LensEffectTemplate = MyKFPerk.GetPerkLensEffect( KFDT );
			if( LensEffectTemplate != none )
			{
				ClientSpawnCameraLensEffect( LensEffectTemplate );
			}
		}
	}
}

/** Plays any pain or damagetype specific screen effects */
simulated function PlayScreenMaterialEffects(class<KFDamageType> KFDT, bool bShowPainEffect)
{
	// Always play a pain effect
	if( bShowPainEffect )
	{
		PainEffectTimeRemaining = PainEffectDuration;
	}

	// Play any damage specific screen effects
	if( KFDT.default.ScreenMaterialName != '' )
	{
		switch (KFDT.default.ScreenMaterialName)
		{
			case EffectSirenScreamParamName:
				SirenScreamEffectTimeRemaining = default.SonicScreamEffectDuration;
				CheckForReducedSirenScreamEffect();
			break;
			case EffectBloatsPukeParamName:
				BloatPukeEffectTimeRemaining = default.BloatPukeEffectDuration;
			break;
			case EffectHealParamName:
				HealEffectTimeRemaining = default.HealEffectDuration;
			break;
		}
	}
}

simulated function CheckForReducedSirenScreamEffect()
{
	local KFPerk MyPerk;

	// First apply the lens effect
	MyPerk = GetPerk();
	if( MyPerk != none && GameplayPostProcessEffectMIC != none )
	{
		GameplayPostProcessEffectMIC.SetScalarParameterValue( EffectSirenScreamParamName, MyPerk.GetSirenScreamStrength() );
	}
}

/** Return if this effect is currently running */
simulated function float GetEffectTimeRemaining(class<KFDamageType> KFDT)
{
	switch (KFDT.default.ScreenMaterialName)
	{
		case EffectSirenScreamParamName:
			return SirenScreamEffectTimeRemaining;
		break;
		case EffectBloatsPukeParamName:
			return BloatPukeEffectTimeRemaining;
		break;
	}
	return 0;
}

/** Only called on locally controlled controllers. Must have an input object to run.
	See parent for better desc. */
event PlayerTick( float DeltaTime )
{
	super.PlayerTick(DeltaTime);

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// Update gameplay effects
		UpdateLowHealthEffect(DeltaTime);
		UpdateZEDTimeEffects(DeltaTime);
		UpdateDOF(DeltaTime);
		UpdateFullscreenBlur(DeltaTime);

		// Since this function is in tick, perform if checks before calling the function as an optimization
		if( ExplosionEarRingTimeRemaining > 0 )
		{
			UpdateEarRingEffect(DeltaTime);
		}

		// Update damage screen effects
		if( PainEffectTimeRemaining > 0 )
		{
			UpdateScreenEffect(DeltaTime, EffectPainParamName, PainEffectTimeRemaining, default.PainEffectDuration);
		}
		if( HealEffectTimeRemaining > 0 )
		{
			UpdateScreenEffect(DeltaTime, EffectHealParamName, HealEffectTimeRemaining, default.HealEffectDuration);
		}
		if( SirenScreamEffectTimeRemaining > 0 )
		{
			UpdateScreenEffect(DeltaTime, EffectSirenScreamParamName, SirenScreamEffectTimeRemaining, default.SonicScreamEffectDuration);
		}
		if( BloatPukeEffectTimeRemaining > 0 )
		{
			UpdateScreenEffect(DeltaTime, EffectBloatsPukeParamName, BloatPukeEffectTimeRemaining, default.BloatPukeEffectDuration);
		}

		// Optimization : Gameplay effects are turned off if no effect is currently active
		if( GameplayPostProcessEffects != none )
		{
			GameplayPostProcessEffects.bShowInGame = ShouldDisplayGameplayPostProcessFX();
		}
	}

	if ( PauseMoveInputTimeLeft > 0.f )
	{
		TickPauseMoveInput(DeltaTime);
	}
}

/** Set the post processing effect of a zed grabbing a player to on or off */
function SetGrabEffect( bool bValue, optional bool bPlayerZed, optional bool bSkipMessage )
{
	bGrabEffectIsActive = bValue;

	if(!bSkipMessage && bGrabEffectIsActive)
	{
		if(bPlayerZed)
		{
			ReceiveLocalizedMessage( class'KFLocalMessage_Interaction', IMT_PlayerClotGrabWarning);
		}
		else
		{
			ReceiveLocalizedMessage( class'KFLocalMessage_Interaction', IMT_ClotGrabWarning);
		}

	}
	else
	{
		ReceiveLocalizedMessage( class'KFLocalMessage_Interaction', IMT_None);
	}

	if( GameplayPostProcessEffectMIC != none )
	{
		if(bGrabEffectIsActive)
		{
			// Update damage screen effects
			GameplayPostProcessEffectMIC.SetScalarParameterValue('Effect_Grabbed', 1);

	   	}
	   	else
	   	{
			GameplayPostProcessEffectMIC.SetScalarParameterValue('Effect_Grabbed', 0);
	   	}
   	}
}

/** Set the post processing effect of an active perk skill to on or off */
function SetPerkEffect( bool bValue )
{
	bPerkEffectIsActive = bValue;

	if( GameplayPostProcessEffectMIC != none )
	{
		if( bPerkEffectIsActive )
		{
			// Update damage screen effects
			GameplayPostProcessEffectMIC.SetScalarParameterValue( EffectPerkParamName, 1 );

	   	}
	   	else
	   	{
			GameplayPostProcessEffectMIC.SetScalarParameterValue( EffectPerkParamName, 0 );
	   	}
   	}
}

/** Caches and intializes gameplay post process effects such as pain, low health and ZED time */
function InitGameplayPostProcessFX()
{
	local MaterialInstanceConstant GameplayPPMIC;

	if ( LocalPlayer(Player) != none )
	{
		GameplayPostProcessEffects = MaterialEffect(LocalPlayer(Player).PlayerPostProcess.FindPostProcessEffect(GameplayPostProcessEffectName));
		if( GameplayPostProcessEffects == none )
		{
			`warn("[GameplayFX] Could not cache gameplay post process effect. Gameplay post-processing will be disabled");
		}

		GameplayPPMIC = MaterialInstanceConstant(GameplayPostProcessEffects.Material);
		if( GameplayPPMIC != none )
		{
			GameplayPostProcessEffectMIC = new class'MaterialInstanceConstant';
			GameplayPostProcessEffectMIC.SetParent(GameplayPPMIC);
			GameplayPostProcessEffects.Material = GameplayPostProcessEffectMIC;
		}
		else
		{
			`warn("[GameplayFX] Could not find MIC in gameplay post process effect. Gameplay post-processing will be disabled");
		}

		// Flush to clear
		ResetGameplayPostProcessFX();
	}
}

/** Resets all gameplay FX to initial state.
	Append to this list if additional effects are added. */
function ResetGameplayPostProcessFX()
{
	if( GameplayPostProcessEffectMIC != none )
	{
		GameplayPostProcessEffectMIC.SetScalarParameterValue(EffectPainParamName, 0.f);
		GameplayPostProcessEffectMIC.SetScalarParameterValue(EffectLowHealthParamName, 0.f);
		GameplayPostProcessEffectMIC.SetScalarParameterValue(EffectZedTimeParamName, 0.f);
		GameplayPostProcessEffectMIC.SetScalarParameterValue(EffectNightVisionParamName, 0.f);
		GameplayPostProcessEffectMIC.SetScalarParameterValue(EffectSirenScreamParamName, 0.f);
		GameplayPostProcessEffectMIC.SetScalarParameterValue(EffectBloatsPukeParamName, 0.f);
		GameplayPostProcessEffectMIC.SetScalarParameterValue(EffectHealParamName, 0.f);
		GameplayPostProcessEffectMIC.SetScalarParameterValue(EffectPerkParamName, 0.f);
	}
	if( GameplayPostProcessEffects != none )
	{
		GameplayPostProcessEffects.bShowInGame = false;
	}

	bNightVisionActive = false;
	bGamePlayDOFActive = false;
	bPerkEffectIsActive = false;
}

/** @return TRUE if any of the gameplay post process effects have a strength greater than 0.
	Append to this list if additional effects are added. */
function bool ShouldDisplayGameplayPostProcessFX()
{
	return 	bPerkEffectIsActive ||
			bGrabEffectIsActive ||
			/* Pain effect is active */
			PainEffectTimeRemaining > 0.f ||
			/* Pawn is in low health */
			(Pawn != none && Pawn.Health <= default.LowHealthThreshold) ||
			/* Getting healed */
			HealEffectTimeRemaining > 0.f ||
			/* ZED time effect is active */
			CurrentZEDTimeEffectIntensity > 0.f ||
			/* Night vision active */
			bNightVisionActive ||
			SirenScreamEffectTimeRemaining > 0.f ||
			/** When the player is puked on */
			BloatPukeEffectTimeRemaining > 0.f;
}

/** Update any screen effects
	Only called on locally controlled controllers. */
function UpdateScreenEffect( float DeltaTime, name EffectName, out float TimeRemaining, float Duration )
{
	local float Intensity;

	if( TimeRemaining > 0.f )
	{
		if( TimeRemaining > DeltaTime )
		{
			TimeRemaining -= DeltaTime;
			Intensity = FClamp(TimeRemaining/Duration, 0.f, 1.f);
		}
		else
		{
			TimeRemaining = 0.f;
			Intensity = 0.f;
		}

		// Update the post process effect
		if( GameplayPostProcessEffectMIC != none )
		{
   			GameplayPostProcessEffectMIC.SetScalarParameterValue(EffectName, Intensity);
   		}
	}
}

/** Fade in ZED Time effect */
function SetZedTimeEffectIntensity(float TargetWeight, optional float BlendTime=0.5)
{
	TargetZEDTimeEffectIntensity = TargetWeight;
	ZEDTimeEffectInterpTimeRemaining = BlendTime;
}

/** Update the ZED time effect.
	Only called on locally controlled controllers. */
function UpdateZEDTimeEffects(float DeltaTime)
{
	local KFPawn KFP;
	local float BlendDelta;
	local float ZedTimeAudioModifier;
	local float RealDeltaTime;
	local float OldZEDTimeEffectIntensity;
	local MaterialInstanceConstant WorldMIC;

	// If we are playing partial zed time FX, check to see if we changed to full zed time
	if ( TargetZEDTimeEffectIntensity == PartialZEDTimeEffectIntensity )
	{
		KFP = KFPawn(Pawn);
		if ( KFP != None && !KFP.bUnaffectedByZedTime )
		{
			ClientEnterZedTime(false); // restart effects
		}
	}

	// Audio filter for pitch shifting.  Take global and local dilation into account.
    if( WorldInfo.TimeDilation != LastTimeDilation )
    {
        ZedTimeAudioModifier = Max((1.0 - WorldInfo.TimeDilation) * 100, 0);
        SetRTPCValue( 'ZEDTime_Modifier', ZedTimeAudioModifier, true );
		LastTimeDilation = WorldInfo.TimeDilation;
    }

	OldZEDTimeEffectIntensity = CurrentZEDTimeEffectIntensity;

	// Post Effect Blending
	if( ZEDTimeEffectInterpTimeRemaining > 0 )
	{
		// While blending use the real world DeltaTime, since that's the GameInfo uses (see TickZedTime)
		RealDeltaTime = (DeltaTime / WorldInfo.TimeDilation);

		BlendDelta = (TargetZEDTimeEffectIntensity - CurrentZEDTimeEffectIntensity);
		CurrentZEDTimeEffectIntensity	 += (BlendDelta / ZEDTimeEffectInterpTimeRemaining) * RealDeltaTime;
		ZEDTimeEffectInterpTimeRemaining -= RealDeltaTime;
	}
	else
	{
		ZEDTimeEffectInterpTimeRemaining = 0.f;
		CurrentZEDTimeEffectIntensity = TargetZEDTimeEffectIntensity;
	}

	if ( OldZEDTimeEffectIntensity != CurrentZEDTimeEffectIntensity )
	{
		if( GameplayPostProcessEffectMIC != none )
		{
			GameplayPostProcessEffectMIC.SetScalarParameterValue(EffectZedTimeParamName, CurrentZEDTimeEffectIntensity);
		}

		foreach WorldInfo.ZedTimeMICs( WorldMIC )
		{
			WorldMIC.SetScalarParameterValue(EffectZedTimeParamName, CurrentZEDTimeEffectIntensity);
		}
	}
}

simulated function PlayEarRingEffect(float Intensity)
{
	ExplosionEarRingDuration = 10.f;

	if( ExplosionEarRingTimeRemaining <= 1.f )
	{
		ExplosionEarRingTimeRemaining = ExplosionEarRingDuration * Intensity;
		ExplosionEarRingDelay = 0.5;
		PlaySoundBase(EarsRingingPlayEvent, true);
	}
}

simulated function UpdateEarRingEffect(float DeltaTime)
{
    // Ramp up to the full ears ringing effect during the delays
	if( ExplosionEarRingDelay > 0.f )
	{
		ExplosionEarRingEffectIntensity = (1.0 - (ExplosionEarRingDelay/0.5)) * 100.f;
		ExplosionEarRingDelay -= DeltaTime;
		SetRTPCValue( 'GRENADEFX', ExplosionEarRingEffectIntensity, true );
		return;
	}

	if( ExplosionEarRingTimeRemaining > 0 )
	{
		ExplosionEarRingEffectIntensity = (ExplosionEarRingTimeRemaining/ExplosionEarRingDuration) * 100.f;
		ExplosionEarRingTimeRemaining -= DeltaTime;

		if( ExplosionEarRingTimeRemaining <= 0 || Pawn == none || Pawn.Health <= 0 )
		{
			ExplosionEarRingTimeRemaining = 0.f;
			ExplosionEarRingEffectIntensity = 0.f;
			PlaySoundBase(EarsRingingStopEvent, true);
		}

		SetRTPCValue( 'GRENADEFX', ExplosionEarRingEffectIntensity, true );
	}
}

/** Update the effect that plays when the player has low health.
	Only called on locally controlled controllers. */
function UpdateLowHealthEffect(float DeltaTime)
{
	local bool bLowHealth;

	if( Pawn != none )
	{
		// If alive and health is less than given threshold
		bLowHealth = Pawn.Health > 0 && Pawn.Health <= default.LowHealthThreshold;

		// Play low health post process effect (flashing red)
		if( GameplayPostProcessEffectMIC != none )
		{
			GameplayPostProcessEffectMIC.SetScalarParameterValue(EffectLowHealthParamName, bLowHealth ? 1.f : 0.f);
		}

		if( bLowHealth )
		{
			if( !bPlayingLowHealthSFX )
			{
				PostAkEvent( LowHealthStartEvent );
				bPlayingLowHealthSFX = true;
			}
		}
		else
		{
			if( bPlayingLowHealthSFX )
			{
				PostAkEvent( LowHealthStopEvent );
				bPlayingLowHealthSFX = false;
			}
		}

		SetRTPCValue( 'Health', Pawn.Health, true );
	}
}

/**
 * Can be used to force health FX on or off
 * Network: Standalone + Local Client
 */
function ToggleHealthEffects(bool bEnableFX)
{
	if( !bEnableFX )
	{
		if( bPlayingLowHealthSFX )
		{
			PostAkEvent( LowHealthStopEvent );
			bPlayingLowHealthSFX = false;
		}

		SetRTPCValue( 'Health', 100, true );
	}
}

/** Plays force feedback associated with shake, if available. Otherwise, plays default force feedback. */
simulated protected function DoForceFeedbackForScreenShake( CameraShake ShakeData, float Scale )
{
	local KFCameraShake KFCS;
	local int ShakeLevel;
	local float RotMag, LocMag, FOVMag;

	// Don't rumble at all if scale is zero
	if( Scale == 0.f )
	{
		return;
	}

	KFCS = KFCameraShake(ShakeData);
	if( KFCS == none || KFCS.FFWaveform == none )
	{
		if( ShakeData != none )
		{
			// figure out if we're "big", "medium", or nothing
			RotMag = ShakeData.GetRotOscillationMagnitude() * Scale;
			if( RotMag > 40.f )
			{
				ShakeLevel = 2;
			}
			else if( RotMag > 20.f )
			{
				ShakeLevel = 1;
			}


			if( ShakeLevel < 2 )
			{
				LocMag = ShakeData.GetLocOscillationMagnitude() * Scale;
				if( LocMag > 10.f )
				{
					ShakeLevel = 2;
				}
				else if( LocMag > 5.f )
				{
					ShakeLevel = 1;
				}

				FOVMag = ShakeData.FOVOscillation.Amplitude * Scale;
				if( ShakeLevel < 2 )
				{
					if( FOVMag > 5.f )
					{
						ShakeLevel = 2;
					}
					else if( FOVMag > 2.f )
					{
						ShakeLevel = 1;
					}
				}
			}

			//`log("level="@ShakeLevel@"rotmag"@VSize(ShakeData.RotAmplitude)@"locmag"@VSize(ShakeData.LocAmplitude)@"fovmag"@ShakeData.FOVAmplitude);

			if( ShakeLevel == 2 )
			{
				if( ShakeData.OscillationDuration <= 1 )
				{
					ClientPlayForceFeedbackWaveform(class'KFGameWaveForms'.default.CameraShakeBigShort);
				}
				else
				{
					ClientPlayForceFeedbackWaveform(class'KFGameWaveForms'.default.CameraShakeBigLong);
				}
			}
			else if( ShakeLevel == 1 )
			{
				if( ShakeData.OscillationDuration <= 1 )
				{
					ClientPlayForceFeedbackWaveform(class'KFGameWaveForms'.default.CameraShakeMediumShort);
				}
				else
				{
					ClientPlayForceFeedbackWaveform(class'KFGameWaveForms'.default.CameraShakeMediumLong);
				}
			}
		}
	}
	else
	{
		ClientPlayForceFeedbackWaveform( KFCameraShake(ShakeData).FFWaveform );
	}
}

/**
 * Tells the client to play a waveform for the specified damage type
 *
 * @param FFWaveform The forcefeedback waveform to play
 * @param FFWaveformInstigator the actor causing the waveform to play
 */
reliable client event ClientPlayForceFeedbackWaveform(ForceFeedbackWaveform FFWaveform,optional Actor FFWaveformInstigator)
{
	// Don't play rumble if we're a spectator
	if( PlayerReplicationInfo.bIsSpectator 
		|| PlayerReplicationInfo.bOnlySpectator
		|| PlayerReplicationInfo.bWaitingPlayer
		|| !PlayerReplicationInfo.bReadyToPlay
		|| IsInState('Spectating') )
	{
		return;
	}

	super.ClientPlayForceFeedbackWaveform( FFWaveform, FFWaveformInstigator );
}

simulated function SetAmplificationLightEnabled(bool bEnabled)
{
	// Spawn the amplification light
	if(bEnabled)
	{
		// Destroy the old light
		if(AmplificationLight != none)
		{
			AmplificationLight.DetachFromAny();
			AmplificationLight = none;
		}

		// Recreate the light
		if(AmplificationLightTemplate != none)
		{
			AmplificationLight = new(self) Class'PointLightComponent' (AmplificationLightTemplate);
		}

		// Attach the light to the pawn
		if(AmplificationLight != none)
		{
			Pawn.AttachComponent(AmplificationLight);
		}
	}
	else
	{
		// Detach and destroy the light
		if(AmplificationLight != none)
		{
			AmplificationLight.DetachFromAny();
			AmplificationLight = none;
		}
	}
}

/** Turns night vision on/off (called if perk has night vision enabled) */
simulated function SetNightVision(bool bEnabled)
{
	if( GameplayPostProcessEffectMIC != none )
	{
		bNightVisionActive = bEnabled;
		GameplayPostProcessEffectMIC.SetScalarParameterValue(EffectNightVisionParamName, (bNightVisionActive) ? 1.f : 0.f);

		if(bEnabled)
		{
			bGamePlayDOFActive = true;
			DOF_GP_BlendInSpeed = DOF_NVG_BlendInSpeed;
			DOF_GP_BlendOutSpeed = DOF_NVG_BlendOutSpeed;
			DOF_GP_FocalDistance = NVG_DOF_FocalDistance;
			DOF_GP_SharpRadius = NVG_DOF_SharpRadius;
			DOF_GP_FocalRadius = NVG_DOF_FocalRadius;
			DOF_GP_MinBlurSize = NVG_DOF_MinBlurSize;
			DOF_GP_MaxNearBlurSize = NVG_DOF_MaxNearBlurSize;
			DOF_GP_MaxFarBlurSize = NVG_DOF_MaxFarBlurSize;
			DOF_GP_ExpFalloff = NVG_DOF_ExpFalloff;
		}
		else
		{
			bGamePlayDOFActive = false;
		}
	}

	if( Pawn != none )
	{
		if( NVGLight == none && NVGLightTemplate != none )
		{
			NVGLight = new(self) Class'PointLightComponent' (NVGLightTemplate);
		}

		if( bEnabled )
		{
			Pawn.AttachComponent(NVGLight);
			NVGLight.SetEnabled(bEnabled);

			AmplificationLight.SetEnabled(!bEnabled);
		}
		else
		{
			Pawn.DetachComponent(NVGLight);
			NVGLight.SetEnabled(bEnabled);

			AmplificationLight.SetEnabled(!bEnabled);
		}
	}
}

/*********************************************************************************************
 * @name Cinematic mode with DOF
********************************************************************************************* */

/** called by the server to synchronize cinematic transitions with the client */
reliable client function ClientSetCinematicMode(bool bInCinematicMode, bool bAffectsMovement, bool bAffectsTurning, bool bAffectsHUD)
{
	bCinematicMode = bInCinematicMode;

	if(bCinematicMode)
	{
		bGamePlayDOFActive = true;
		DOF_GP_BlendInSpeed = DOF_Cinematic_BlendInSpeed;
		DOF_GP_BlendOutSpeed = DOF_Cinematic_BlendOutSpeed;
		DOF_GP_FocalDistance = DOF_Cinematic_FocalDistance;
		DOF_GP_SharpRadius = DOF_Cinematic_SharpRadius;
		DOF_GP_FocalRadius = DOF_Cinematic_FocalRadius;
		DOF_GP_MinBlurSize = DOF_Cinematic_MinBlurSize;
		DOF_GP_MaxNearBlurSize = DOF_Cinematic_MaxNearBlurSize;
		DOF_GP_MaxFarBlurSize = DOF_Cinematic_MaxFarBlurSize;
		DOF_GP_ExpFalloff = DOF_Cinematic_ExpFalloff;
	}
	else
	{
		bGamePlayDOFActive = false;
	}

	// if there's a hud, set whether it should be shown or not
	if ( (myHUD != None) && bAffectsHUD )
	{
		myHUD.bShowHUD = !bCinematicMode;
	}
	if (bAffectsMovement)
	{
		IgnoreMoveInput(bCinematicMode);
	}
	if (bAffectsTurning)
	{
		IgnoreLookInput(bCinematicMode);
	}
}

/*********************************************************************************************
 * @name Zed Time
********************************************************************************************* */

/** Called when initiating zed time to perform recursive trace */
native function bool CanSeeZedTimePawn(bool bZedTimeStart, optional int RecursionCount);
/** Initialize partial zed time visibility interval */
native function StartPartialZedTimeSightCounter();

/** Notification when partial zed time sight counter spots a pawn */
event NotifyPartialZedTimeExited();

/** Returns false if partial (aka Zed Time Lite) should be used */
function bool IsAffectedByZedTime()
{
	if ( bForcePartialZedTime )
	{
		return false;
	}

	return CanSeeZedTimePawn(true);
}

/** Entering Zed time on the server - give the perk a chance to do something */
function EnterZedTime()
{
	local KFPawn KFP;
	local KFPerk MyPerk;
	local bool bPartialZedTime;

	MyPerk = GetPerk();
	if ( MyPerk != none )
	{
		MyPerk.NotifyZedTimeStarted();
	}

	KFP = KFPawn(Pawn);
	if ( KFP != None )
	{
		KFP.bUnaffectedByZedTime = !IsAffectedByZedTime();
		bPartialZedTime = KFP.bUnaffectedByZedTime;

		if ( bPartialZedTime )
		{
			StartPartialZedTimeSightCounter();
		}
	}

	// Call the client
	ClientEnterZedTime(bPartialZedTime);
}

/** Exiting Zed time on the server - give the perk a chance to do something */
function FadeOutZedTime()
{
	local KFPerk MyPerk;

	MyPerk = GetPerk();
	if ( MyPerk != none )
	{
		MyPerk.NotifyZedTimeEnded();
	}

	// Call the client
	ClientFadeOutZedTime();
}

/** Called by the server when the game enters zed time. Used to play the effects */
reliable client function ClientEnterZedTime(bool bPartialOnly)
{
	// TODO: Play a message lettting the player know the first time they enter zed time?

	if ( bPartialOnly )
	{
		PlaySoundBase(ZedTimePartialEnterSound, True);
		SetZedTimeEffectIntensity(PartialZEDTimeEffectIntensity);
	}
	else
	{
		PlaySoundBase(ZedTimeEnterSound, True);
		SetZedTimeEffectIntensity(1.f);
	}
}

/** Called by the server when the game exits zed time. Used to play the effects */
reliable client function ClientFadeOutZedTime()
{
	local KFPawn KFP;
	local bool bIsPartialZedTime;

	KFP = KFPawn(Pawn);
	if ( KFP != None && KFP.bUnaffectedByZedTime )
	{
		bIsPartialZedTime = true;
	}

	PlaySoundBase((bIsPartialZedTime) ? ZedTimePartialExitSound : ZedTimeExitSound, True);
	SetZedTimeEffectIntensity(0.f);
}

/*********************************************************************************************
 * @name User Interface
********************************************************************************************* */

/** AWESOMEHUD(TM) */

// Initialize our GFx HUD
function SetGFxHUD( KFGFxMoviePlayer_HUD NewGFxHud )
{
	MyGFxHUD = NewGFxHud;
}

function ShowBossNameplate( KFPawn_MonsterBoss KFBoss, optional string PlayerName)
{
	if(MyGFxHUD != none)
	{
		MyGFxHUD.ShowBossNameplate(KFBoss.default.BossName$PlayerName, KFBoss.default.BossCaptionStrings[Rand(KFBoss.default.BossCaptionStrings.length)]);
	}
}

function HideBossNameplate()
{
	if(MyGFxHUD != none)
	{
		MyGFxHUD.HideBossNameplate();
	}
}


/* SpawnInGameFrontEnd()
Spawn the Front End for the menus that will be used in game
*/
reliable client function ClientSetFrontEnd( class< KFGFxMoviePlayer_Manager > FrontEndClass, optional bool bSkipMenus )
{
	local LocalPlayer LP;

	if ( MyGFxManager == none )
	{
    	MyGFxManager = new(self) FrontEndClass;
		LP = LocalPlayer( Player );

    	if ( LP != none )
    	{
	    	MyGFxManager.Init( LP );
	    	MyGFxManager.LaunchMenus( bSkipMenus );
    	}
	}
}


/** If -skiplobby is added to the command line, skip past the lobby menu and spawn as a random perk */
reliable server function SkipLobby()
{
	local KFGameInfo KFGI;

	KFGI = KFGameInfo(WorldInfo.Game);
	if (KFGI != none)
	{
		KFGI.LobbyCountdownComplete();
	}
}

/** Notifies playercontroller when a lobby was unable to be found during Find Match */
function NotifyUnsuccessfulSearch()
{
	if( MyGFxManager != none )
	{
		MyGFxManager.NotifyUnsuccessfulSearch();
	}
}

/** Notifies playercontroller when user has created, joined, or left a lobby */
function OnLobbyStatusChanged(bool bInLobby)
{
	if( MyGFxManager != none )
	{
		MyGFxManager.OnLobbyStatusChanged(bInLobby);
	}
}

function string GetSteamAvatar( UniqueNetId NetID )
{
	local string AvatarPath;
	local int i;
	local bool bFoundAvatar;
	local PlayerSteamAvatar CurrentAvatar;

    AvatarPath = "";


	for (i = 0; i < AvatarList.length; i++)
	{
		if(AvatarList[i].NetID == NetID)
		{
			bFoundAvatar = true;
			if(AvatarList[i].Avatar != none)
			{
				AvatarPath = "img://" $ AvatarList[i].Avatar.GetPackageName() $ "." $ AvatarList[i].Avatar.Name;
			}
		}
	}

	if( !bFoundAvatar )
	{
		CurrentAvatar.NetID = NetID;
		AvatarList.AddItem(CurrentAvatar);
		if(OnlineSub != none)
		{
		        OnlineSub.ReadOnlineAvatar(NetID, 64, OnAvatarReceived);
	        }
	}

	return AvatarPath;
}

function OnAvatarReceived(const UniqueNetId NetId, Texture2D Avatar)
{
	local byte i;

	for (i = 0; i < AvatarList.length; i++)
	{
		if (AvatarList[i].NetID == NetId)
		{
			AvatarList[i].Avatar = Avatar;
			return;
		}
	}
}


function string GetPS4Avatar( const string InPlayerName )
{
	local string AvatarPath;
	local int i;
	local bool bFoundAvatar;
	local PlayerAvatarPS4 CurrentAvatar;

	AvatarPath = "";

	if( InPlayerName == "" )
	{
		`warn("Attempted to get PS4 avatar for player with no name");
	}

	for (i = 0; i < AvatarListPS4.length; i++)
	{
		if(AvatarListPS4[i].PlayerName == InPlayerName)
		{
			bFoundAvatar = true;
			if( AvatarListPS4[i].ImageDownloader != none &&
				AvatarListPS4[i].ImageDownloader.TheTexture != none )
			{
				AvatarPath = "img://" $ AvatarListPS4[i].ImageDownloader.TheTexture.GetPackageName() $ "." $ AvatarListPS4[i].ImageDownloader.TheTexture.Name;
			}
		}
	}

	if( !bFoundAvatar && !WorldInfo.IsE3Build() )
	{
		CurrentAvatar.PlayerName = InPlayerName;
		AvatarListPS4.AddItem(CurrentAvatar);

		if(OnlineSub != none)
		{
			OnlineSub.ReadOnlineAvatarByName(InPlayerName, 64, OnAvatarURLPS4Received);
		}
	}

	return AvatarPath;
}


function OnAvatarURLPS4Received(const string ForPlayerName, const string AvatarURL)
{
	local byte i;

	for (i = 0; i < AvatarListPS4.length; i++)
	{
		if( AvatarListPS4[i].PlayerName == ForPlayerName )
		{
			if( AvatarURL != "" )
			{
				AvatarListPS4[i].AvatarURL = AvatarURL;
				AvatarListPS4[i].ImageDownloader = new class'KFHTTPImageDownloader';
				AvatarListPS4[i].ImageDownloader.DownloadImageFromURL(AvatarURL, OnPS4AvatarDownloadComplete);
			}
			else
			{
				AvatarListPS4.RemoveItem( AvatarListPS4[i] );
			}
			return;
		}
	}
}


function OnPS4AvatarDownloadComplete(bool bWasSuccessful)
{
	local int i;

	for( i = AvatarListPS4.length - 1; i >= 0; i-- )
	{
		if( AvatarListPS4[i].ImageDownloader != None &&
			AvatarListPS4[i].AvatarURL == AvatarListPS4[i].ImageDownloader.ImageURL )
		{
			if( bWasSuccessful )
			{
				if( MyGFxHUD != none &&
					MyGFxHUD.GfxScoreBoardPlayer != none &&
					MyGFxHUD.GfxScoreBoardPlayer.ScoreboardWidget != none )
				{
					MyGFxHUD.GfxScoreBoardPlayer.ScoreboardWidget.UpdatePlayerData();
				}
			}
			else
			{
				`log("avatar download fail");
				AvatarListPS4.RemoveItem(AvatarListPS4[i]);
			}
		}
	}
}


function ServerNotifyTeamChanged();

function ClientRecieveNewTeam();

/*********************************************************************************************
 * @name Chat
********************************************************************************************* */

unreliable server function ServerSay( string Msg )
{
	local KFGameInfo KFGI;

	KFGI = KFGameInfo(WorldInfo.Game);
	if(!KFGI.bDisablePublicTextChat || PlayerReplicationInfo.bAdmin)
	{
		super.ServerSay(Msg);
	}
}

unreliable server function ServerTeamSay( string Msg )
{
	local KFGameInfo KFGI;
	KFGI = KFGameInfo(WorldInfo.Game);
	if(WorldInfo.GRI.bMatchIsOver && !KFGI.bDisablePublicTextChat)
	{
		super.ServerSay(Msg);
	}
	else
	{
		super.ServerTeamSay(Msg);
	}
}

/** Completely overrides super */
reliable client event TeamMessage( PlayerReplicationInfo PRI, coerce string S, name Type, optional float MsgLifeTime  )
{
	local string ChatMessage;

	if(PRI == none)
	{
		return;
	}

	if( PRI.Team != none && Type == 'TeamSay' && PRI.Team.TeamIndex != PlayerReplicationInfo.Team.TeamIndex )
	{
		return;
	}

	ChatMessage = GetChatChannel(Type, PRI)@PRI.PlayerName$": " $S;

    if (MyGFxManager != none && Type != MusicMessageType)
    {
    	if (class'WorldInfo'.static.IsMenuLevel())
   		{
   			ChatMessage = S;
   		}

    	if(MyGFxManager.PartyWidget != none && !MyGFxManager.PartyWidget.ReceiveMessage(ChatMessage))  //Fails if message is for updating perks in a steam lobby
    	{
    		return;
    	}
    	if(MyGFxManager.PostGameMenu != none)
    	{
    		MyGFxManager.PostGameMenu.ReceiveMessage(ChatMessage);
    	}
    }

    if( MyGFxHUD != none )
    {
    	if(Type == MusicMessageType)
    	{
			MyGFxHUD.MusicNotification.ShowSongInfo(S);
    	}
    	else
    	{
    		if(Type != 'Event' && Type != 'None' )
			{
    			RecieveChatMessage(PRI, ChatMessage, Type, MsgLifeTime);
    		}
    		else if( MyGFxHUD.HudChatBox != none )
			{
				MyGFxHUD.HudChatBox.AddChatMessage(class'KFLocalMessage'.default.SystemString@S, class 'KFLocalMessage'.default.EventColor);
			}
    	}
	}
}

function string GetChatChannel(name Type, PlayerReplicationInfo PRI)
{
	if(!PRI.bOnlySpectator)
	{
		if(Type == 'TeamSay')
		{
			return "<"$class'KFCommon_LocalizedStrings'.default.TeamString$">";
		}
		else
		{
			return "<"$class'KFCommon_LocalizedStrings'.default.AllString$">";
		}
	}
	else
	{
		return "<"$class'KFCommon_LocalizedStrings'.default.SpectatorString$">";
	}
}

function RecieveChatMessage(PlayerReplicationInfo PRI, string ChatMessage, name Type, optional float MsgLifeTime)
{
	if( MyGFxHUD.HudChatBox != none )
	{
		if(PRI.bOnlySpectator)
		{
			ChatMessage = class'KFCommon_LocalizedStrings'.default.SpectatorString@ChatMessage;
		}
		if(PRI.bAdmin)
		{
			ChatMessage = class'KFLocalMessage'.default.AdminString$ChatMessage;
			MyGFxHUD.HudChatBox.AddChatMessage(ChatMessage, class 'KFLocalMessage'.default.PriorityColor);
		}
		else
		{
			MyGFxHUD.HudChatBox.AddChatMessage(ChatMessage, class 'KFLocalMessage'.default.SayColor);
		}
	}
}

function OpenChatBox()
{
    local KFGFxHudWrapper GFxHUDWrapper;

    GFxHUDWrapper = KFGFxHudWrapper(myHUD);
    if(GFxHUDWrapper != none && GFxHUDWrapper.HudMovie != none)
    {
        GFxHUDWrapper.HudMovie.OpenChatBox();
    }
}

exec function Talk()
{
	CurrentTextChatChannel = ETCC_ALL;
	OpenChatBox();
}

exec function TeamTalk()
{
	CurrentTextChatChannel = ETCC_TEAM;
	OpenChatBox();
}

/*********************************************************************************************
 * @name Lobby / Party
********************************************************************************************* */

reliable client function ClientSetCountdown(bool bFinalCountdown, byte CountdownTime)
{
	if (MyGFxManager != none && MyGFxManager.PartyWidget != none)
	{
		MyGFxManager.PartyWidget.StartCountdown(CountdownTime, bFinalCountdown);
	}
	else
	{
		KFGameReplicationInfo(WorldInfo.GRI).RemainingTime = CountdownTime;
	}
}

/**
 * @brief Tells the UI to stop the local countdown
 */
reliable client function ClientResetCountdown()
{
	if (MyGFxManager != none && MyGFxManager.PartyWidget != none)
	{
		MyGFxManager.PartyWidget.StopCountdown();
	}
}

//@HSL_BEGIN - JRO - 3/14/2016 - Adding presence for Orbis
reliable client function ClientSetOnlineStatus()
{
	if( OnlineSub != none )
	{
		OnlineSub.PlayerInterface.SetOnlineStatus(LocalPlayer(Player).ControllerId, WorldInfo.GetMapName(true), true);
	}
}
//@HSL_END

/*********************************************************************************************
 * @name Inventory
********************************************************************************************* */

// The player wants to fire.
exec function StartFire( optional byte FireModeNum )
{
	local KFInventoryManager KFIM;

	if (!KFPlayerInput(PlayerInput).bQuickWeaponSelect)
	{
		if (MyGFxHUD != none && MyGFxHUD.WeaponSelectWidget != none &&MyGFxHUD.WeaponSelectWidget.bChangingWeapons)
		{
			KFIM = KFInventoryManager( Pawn.InvManager );
			KFIM.SetCurrentWeapon( KFIM.PendingWeapon );
			MyGFxHUD.WeaponSelectWidget.FadeOut();
			return;
		}
	}

	if (MyGFxHUD != none && MyGFxHUD.VoiceCommsWidget != none && MyGFxHUD.VoiceCommsWidget.bActive)
	{
		return;
	}

	if (KFPlayerInput(PlayerInput).bGamepadWeaponSelectOpen &&  MyGFxHUD.WeaponSelectWidget != none)
	{
		MyGFxHUD.WeaponSelectWidget.SetWeaponSwitchStayOpen(false);
		KFPlayerInput(PlayerInput).bGamepadWeaponSelectOpen = false;
	}

	super.StartFire( FireModeNum );
}

// The player wants to alternate-fire.
exec function StartAltFire( optional Byte FireModeNum )
{
	if (!KFPlayerInput(PlayerInput).bQuickWeaponSelect)
	{
		if (KFPlayerInput(PlayerInput).bGamepadWeaponSelectOpen)
		{
			return;
		}
	}
	super.StartAltFire(FireModeNum);
}

/*********************************************************************************************
 * @name Trader
********************************************************************************************* */
/** Server instigated open trader menu */
function OpenTraderMenu( optional bool bForce=false )
{
	local KFInventoryManager KFIM;

	if( Role == ROLE_Authority && Pawn != none )
	{
   		// We don't want to open the trader menu when there is less than 
   		// a second left. Timing/latency are mean sometimes.
   		if( !bForce && WorldInfo.GRI.RemainingTime <= 1 )
   		{
   			return;
   		}

   		KFIM = KFInventoryManager(Pawn.InvManager);
   		if( KFIM != none && !KFIM.bServerTraderMenuOpen )
   		{
	   		KFIM.bServerTraderMenuOpen = true;
	 		ClientOpenTraderMenu();
	 	}
	}
}

reliable client function ClientOpenTraderMenu()
{
	if (MyGFxManager != none)
	{
		MyGFxManager.OpenMenu( UI_Trader, false );
		`TraderDialogManager.PlayOpenTraderMenuDialog( self );
	}
}

function CloseTraderMenu()
{if ( MyGFxManager != none )
	{
		
		MyGFxManager.CloseTraderMenu();
	}if ( MyGFxManager != none )
	{
		MyGFxManager.CloseTraderMenu();
	}
}

/** Our score has either been replicated or updated while the trader menu is open */
simulated function NotifyTraderDoshChanged()
{
	local KFGFxMenu_Trader TraderMenu;
	if( MyGFxManager != none )
	{
		TraderMenu = KFGFxMenu_Trader(MyGFxManager.CurrentMenu);
		if( TraderMenu != none )
		{
			TraderMenu.NotifyDoshChanged();
		}
	}
}


/*********************************************************************************************
 * Post Round Menu
 *********************************************************************************************/

reliable client function ClientOpenRoundSummary()
{
	if( !PlayerReplicationInfo.bReadyToPlay )
	{
		return;
	}

	if (MyGFxManager != none)
	{
		MyGFxManager.CloseMenus();
		MyGFxManager.SetHUDVisiblity(false);
	}

	if(PostRoundMenuClass == none || MyGFxPostRoundMenu != none)
	{
		return;
	}

	//Create and show the post game menu
	MyGFxPostRoundMenu = new PostRoundMenuClass;
	MyGFxPostRoundMenu.Init(class'Engine'.static.GetEngine().GamePlayers[MyGFxPostRoundMenu.LocalPlayerOwnerIndex]);
}

function ClosePostRoundSummary()
{
	if ( MyGFxPostRoundMenu != none )
	{
		MyGFxPostRoundMenu.Close(true);
        MyGFxPostRoundMenu = None;
        PlayerInput.ResetInput();
        if (MyGFxManager != none)
		{
			MyGFxManager.CloseMenus(true);
		}
	}	
}

/*********************************************************************************************
 * Post Game Menu
 *********************************************************************************************/

reliable client function ClientShowPostGameMenu( optional bool bShowMenu=true )
{
	ClosePostRoundSummary();

	if( !bShowMenu )
	{
		ClosePostGameMenu();
	}
	else if (MyGFxManager != none)
	{
		MyGFxManager.bPostGameState = true;
		MyGFxManager.bCanCloseMenu = false;
		MyGFxManager.OpenMenu( UI_PostGame, false );
		MyHUD.bShowHUD = false;
		//`TraderDialogManager.PlayOpenTraderMenuDialog( self );
	}
}

function ClosePostGameMenu()
{
	if ( MyGFxManager != none )
	{
		MyGFxManager.bPostGameState = false;
		MyGFxManager.bCanCloseMenu = true;
		MyGFxManager.ClosePostGameMenu();
		MyHUD.bShowHUD = true;
	}
}

/********************************************************************************************
* RhythmCounter
********************************************************************************************/
function UpdateRhythmCounterWidget( int Count, int Max )
{
	if( MyGFxHUD != none )
	{
		MyGFxHUD.UpdateRhythmCounterWidget( Count, Max );
	}
}

/*********************************************************************************************
 * Objective
 * Tell the objective that a player has accepted/denied the objective
 *********************************************************************************************/
// Client accepts locally
reliable client function ClientAcceptObj()
{
	local KFGameReplicationInfo KFGRI;

   	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
   	if( KFGRI != none && KFGRI.CurrentObjective != none )
   	{
		KFGRI.CurrentObjective.AcceptObj();
	}
}

reliable server function ServerAcceptObj()
{
	local KFPlayerReplicationInfo KFPRI;
	local KFGameReplicationInfo KFGRI;

	KFPRI = KFPlayerReplicationInfo(PlayerReplicationInfo);
   	if( KFPRI != none )
   	{
   		KFPRI.bObjectivePlayer = true;
   	}

   	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
   	if( KFGRI != none && KFGRI.CurrentObjective != none )
   	{
		KFGRI.CurrentObjective.AddObjectivePlayer(PlayerReplicationInfo);
	}

	UpdateInteractionMessages( Pawn );
	ClientAcceptObj();
  	WorldInfo.Game.Broadcast(KFPRI, KFPRI.PlayerName @ "has accepted the Objective.");
}

/*********************************************************************************************
 * @name Audio
 *********************************************************************************************/

/** Gets an AkComponent from the AkAudioDevice's pool of components to use for locational sounds */
native function AkComponent GetPooledAkComponent( optional Actor SourceActor );

unreliable client event WwiseClientHearSound(AkEvent ASound, Actor SourceActor, vector SourceLocation, bool bStopWhenOwnerDestroyed, optional bool bIsOccluded )
{
    local int i;
    local name EnvironmentName;
    local bool bFollowSourceActor;

    bFollowSourceActor = SourceActor != none && IsZero( SourceLocation );
	if( bFollowSourceActor && ASound.bForceHearSoundLocational )
	{
		bFollowSourceActor = false;
		SourceLocation = SourceActor.Location;
	}

    // hardcoded common switch
    if( ASound.bUseEnvironmentReverbSwitchGroup )
    {
        if( bFollowSourceActor && WorldInfo != none )
        {
            EnvironmentName = WorldInfo.GetAkEnvironmentName(SourceActor.Location);
        }
        else if( WorldInfo != none )
        {
            EnvironmentName = WorldInfo.GetAkEnvironmentName(SourceLocation);
        }

        for( i = 0; i < ASound.CustomSwitches.Length; ++i )
        {
            if( ASound.CustomSwitches[0].SwitchGroupName == 'Environment_Reverb' )
            {
                ASound.CustomSwitches[i].SwitchName = EnvironmentName;
                break;
            }
        }

        if( i >= ASound.CustomSwitches.Length )
        {
            ASound.CustomSwitches.Insert(0, 1);
            ASound.CustomSwitches[0].SwitchGroupName = 'Environment_Reverb';
            ASound.CustomSwitches[0].SwitchName = EnvironmentName;
        }
    }

    if( bFollowSourceActor )
	{
		SourceActor.PostAkEvent( ASound, bIsOccluded, !(SourceActor == self || SourceActor == Pawn), bStopWhenOwnerDestroyed );
	}
	else
	{
		PostAkEventAtLocation( ASound, SourceLocation, bIsOccluded );
	}
}

/* Here is an example of how to use custom switches and rtpcs */
/*
unreliable client event WwiseClientHearSound(AkEvent ASound, Actor SourceActor, vector SourceLocation, bool bStopWhenOwnerDestroyed, optional bool bIsOccluded )
{
	for( i = 0; i < ASound.CustomTags.Length; ++i )
	{
		switch( ASound.CustomTags[i] )
		{
		case 'YourCustomTagHere':
			// logic to determine game sync value
			// logic logic logic logic

			// Assign value to RTPC
			ASound.CustomRTPC[i].RTPCName = 'YourCustomRTPCNameHere';
			ASound.CustomRTPC[i].RTPCValue = YourCustomRTPCValue.f;

			// OR to switch
			ASound.CustomSwitches[i].SwitchGroupName = 'YourCustomSwitchGroupNameHere';
			ASound.CustomSwitches[i].SwitchName = 'YourCustomSwitchNameHere';
		};
	}

	super.WwiseClientHearSound(ASound, SourceActor, SourceLocation, bStopWhenOwnerDestroyed, bIsOccluded );
}
*/

/* ClientHearSoundAdvanced()
Replicated function from server for replicating audible sounds played on server that have advanced functionality and require replicating rotation
*/
unreliable client event ClientHearSoundAdvanced(AkEvent ASound, Actor SourceActor, vector SourceLocation, byte CompressedSourcePitch, byte CompressedSourceYaw, byte RapidFireEnabled, bool bStopWhenOwnerDestroyed, optional bool bIsOccluded )
{
    local rotator SoundRotation;

    SoundRotation.Pitch	= 256 * CompressedSourcePitch;
	SoundRotation.Yaw = 256 * CompressedSourceYaw;

    ProcessAdvancedHearSound(ASound, SourceActor, SourceLocation, SoundRotation, RapidFireEnabled, bStopWhenOwnerDestroyed, bIsOccluded);
}

/* ClientHearSoundAdvanced()
Replicated function from server for replicating audible sounds played on server that have advanced functionality and will get the rotation from a relevant actor
*/
unreliable client event ClientHearSoundAdvancedRelevant(AkEvent ASound, Actor SourceActor, vector SourceLocation, byte RapidFireEnabled, bool bStopWhenOwnerDestroyed, optional bool bIsOccluded )
{
    local rotator SoundRotation;

    SoundRotation = SourceActor.GetAKRotation();

    ProcessAdvancedHearSound(ASound, SourceActor, SourceLocation, SoundRotation, RapidFireEnabled, bStopWhenOwnerDestroyed, bIsOccluded);
}

/* ProcessAdvancedHearSound()
 * Process a replicated advanced sound, playing the echo sounds and the original sounds
 *
 * @note: this only gets used for locational shoot sounds at the moment, and it only really supports those kinds of sounds (e.g. always plays echoes, applies RTPC that will mess up sounds that follow)
 */
simulated function ProcessAdvancedHearSound(AkEvent ASound, Actor SourceActor, vector SourceLocation, rotator SourceRotation, byte RapidFireEnabled, bool bStopWhenOwnerDestroyed, optional bool bIsOccluded )
{
	local int i;

	// if the shooter has the Commando Rapid Fire perk skill enabled, set the rapid fire rtpc (which changes pitch).
	// only apply to locational (pooled) sounds, because pooled component correctly have their custom RTPCs reset.
    if( RapidFireEnabled != 0 && !IsZero(SourceLocation) )
    {
    	for( i = 0; i < ASound.CustomRTPCs.Length; ++i )
        {
            if( ASound.CustomRTPCs[0].RTPCName == 'ZEDTime_CommandoPerk' )
            {
                ASound.CustomRTPCs[i].RTPCValue = 100.f;
                break;
            }
        }

        if( i >= ASound.CustomRTPCs.Length )
        {
	    	ASound.CustomRTPCs.Insert(0, 1);
	    	ASound.CustomRTPCs[0].RTPCName = 'ZEDTime_CommandoPerk';
	    	ASound.CustomRTPCs[0].RTPCValue = 100.f;
	    }
	}

    // Play the original base sound
    WwiseClientHearSound(ASound, SourceActor, SourceLocation, bStopWhenOwnerDestroyed, bIsOccluded);

    // Play the sound from the SourceActor's location when the SourceLocation is zero.
    if( SourceActor != none && IsZero(SourceLocation) )
    {
        SourceLocation = SourceActor.Location;
    }

    // Play echoes
    HearEchoes( ASound, SourceLocation, SourceRotation );
}

simulated function HearEchoes( AkEvent ASound, vector SourceLocation, rotator SourceRotation )
{
    local float EchoDistance;
    local ReverbVolume EchoVolume;
    local vector ViewLocation;
	local rotator ViewRotation;
	local float ViewDist;

    class'KFReverbVolume'.static.CalculateEchoVolumeAndDistance( WorldInfo, SourceLocation, EchoVolume, EchoDistance );
	GetPlayerViewPoint( ViewLocation, ViewRotation );
    ViewDist = VSizeSq(ViewLocation-SourceLocation);

    // Play all 4 positional echoes if the listener is within the echo distance
    if( EchoDistance == 0 || (ViewDist < EchoDistance * EchoDistance) )
    {
        // For playing the echo sounds we don't care about pitch, we want the
        // The sound to be arrayed around the sound location disregarding pitch.
        SourceRotation.Pitch = 0;

        PlayDirectionalEcho( ASound.EchoFront, EchoVolume, SourceLocation, EchoDistance, vect(1,0,0) >> SourceRotation );
        PlayDirectionalEcho( ASound.EchoLeft, EchoVolume, SourceLocation, EchoDistance, vect(0,-1,0) >> SourceRotation );
        PlayDirectionalEcho( ASound.EchoRight, EchoVolume, SourceLocation, EchoDistance, vect(0,1,0) >> SourceRotation );
        PlayDirectionalEcho( ASound.EchoRear, EchoVolume, SourceLocation, EchoDistance, vect(-1,0,0) >> SourceRotation );
    }
    // Play a mono echo if the listener is outside the echo distance
    else
    {
        //`log("Echo outside EchoDistance = "$(EchoDistance/100.0)$" Meters doing mono sound");
        PlayEcho( ASound.EchoMono, SourceLocation, FMin((EchoDistance/34029.0) * 2.0,5.0) );
    }
}

function PlayDirectionalEcho( AkEvent EchoSound, ReverbVolume EchoVolume, vector SourceLocation, float EchoDistance, vector EchoDirection )
{
	local vector EchoLocation;
	local float EchoDelay;

	class'KFReverbVolume'.static.CalculateEchoLocationAndDelay( EchoVolume, SourceLocation, EchoDirection, EchoDistance, EchoLocation, EchoDelay );
	PlayEcho( EchoSound, EchoLocation, EchoDelay );
}

function PlayEcho( AkEvent EchoSound, vector EchoLocation, float EchoDelay )
{
	if( EchoSound != none )
	{
		// @todo: could randomize EchoDelay here
		EchoSound.SetCustomRTPC( 'EchoDistance', EchoDelay );
		// @todo: go straight to wwiseclienthearsound?
		PlaySoundBase( EchoSound, true, true, false, EchoLocation, true );
	}
}

/**
 * Pause Wwise sounds for all players
 *
 * @param	bPause	indicates whether Wwise sounds should be paused or resumed
 */
function PauseWwiseForAllPlayers( bool bPause )
{
	local KFPlayerController PC;

	foreach WorldInfo.AllControllers(class'KFPlayerController', PC)
	{
		PC.ClientPauseWwise( bPause );
	}
}

/**
 * Pause Wwise sounds for this player
 *
 * @param bPause indicates indicates whether Wwise sounds should be paused or resumed
 */
reliable client function ClientPauseWwise(bool bPause)
{
	if( bPause )
	{
		PostAkEvent( PauseWwiseEvent );
	}
	else
	{
		PostAkEvent( ResumeWwiseEvent );
	}
}

/*********************************************************************************************
 * @name Standalone (Pause)
 *********************************************************************************************/

/**  Try to pause game; returns success indicator. */
function bool SetPause( bool bPause, optional delegate<CanUnpause> CanUnpauseDelegate=CanUnpause)
{
	local bool bWasPaused, bIsPaused;

	bWasPaused = IsPaused();
	bIsPaused = super.SetPause( bPause, CanUnpauseDelegate );

	if( bWasPaused != bIsPaused )
	{
		PauseWwiseForAllPlayers( !bWasPaused && bIsPaused );
	}

	return bIsPaused;
}

/**
 * Attempts to pause/unpause the game when the UI opens/closes. Note: pausing
 * only happens in standalone mode
 *
 * OVERRIDES SUPER
 *
 * @param bIsOpening whether the UI is opening or closing
 */
function OnExternalUIChanged(bool bIsOpening)
{
	bIsExternalUIOpen = bIsOpening;

	// don't pause or unpause after toggling external UI if we have menus up (menu toggling handles pausing on standalone)
	// (see KFHUDBase::OnLostFocusPause)
	if( WorldInfo.NetMode == NM_Standalone && MyGFxManager.bMenusOpen )
	{
		return;
	}

	SetPause(bIsOpening, CanUnpauseExternalUI);
}

reliable server function ServerPause()
{
	if( WorldInfo.Game.AllowPausing( self ) )
	{
		// Pause if not already
		if( !IsPaused() )
		{
			SetPause( true );
		}
		else
	{
			SetPause( false );
		}
	}
}



exec function changeSafeFrame(float frameScale)
{
	local Vector2D ViewportSize;
	local GameViewportClient GVC;

	GVC = MyGFxManager != None ? MyGFxManager.GetGameViewportClient() : MyGFxHUD != None ? MyGFxHUD.GetGameViewportClient() : None;

	if ( GVC == None )
	{
		return;
	}

	GVC.GetViewportSize(ViewportSize);

	if ( MyGFxManager != None )
	{
		MyGFxManager.SetViewport((ViewportSize.X-(ViewportSize.X*frameScale))/2,(ViewportSize.Y-(ViewportSize.Y*frameScale))/2,(ViewportSize.X*frameScale),(ViewportSize.Y*frameScale));
	}

	if ( MyGFxHUD != None )
	{
		MyGFxHUD.UpdateRatio(frameScale);
	}
}

function SetUIScale(float fScale)
{
	local LocalPlayer LocalPlayer;

	LocalPlayer = LocalPlayer(Player);
	if (LocalPlayer != None && KFGameViewportClient(LocalPlayer.ViewportClient) != None)
	{
		changeSafeFrame(fScale);
	}
}

/*********************************************************************************************
 * @name Stats XP Achievements
 *********************************************************************************************/

/** Accessor functions for UI */
native function int GetPerkXP(class<KFPerk> PerkClass);
native function int GetPerkBuildByPerkClass(class<KFPerk> PerkClass);

/** Debugging */
exec native function GiveXP(int XP);
exec native function LogPerkBuilds();

/** Network: Local Player only */
simulated event InitializeStats()
{
	if ( StatsRead == none && WorldInfo.NetMode != NM_DedicatedServer )
	{
		StatsWrite = new( self ) class'KFOnlineStatsWrite';
		StatsRead = new( self ) class'KFOnlineStatsRead';
		StatsWrite.MyKFPC = self;
		StatsRead.OwningUniqueID = PlayerReplicationInfo.UniqueId;
		StatsRead.LinkedWriteObject = StatsWrite;

		ReadStats();
	}
}

/** Reads stats from the online persistent storage */
simulated function ReadStats()
{
	local array<UniqueNetId> Players;

	`log("ReadStats called! OnlineSub=" $ OnlineSub @ "StatsRead.UserStatsReceivedState=" $ StatsRead.UserStatsReceivedState @ "StatsRead.OwningUniqueID=" $ Class'OnlineSubsystem'.static.UniqueNetIdToString(StatsRead.OwningUniqueID), StatsRead.bLogStatsRead );
	if ( OnlineSub != None && StatsRead.UserStatsReceivedState != OERS_Done )
	{
		OnlineSub.StatsInterface.AddReadOnlineStatsCompleteDelegate( OnStatsInitialized );
		Players[0] = StatsRead.OwningUniqueID;
		OnlineSub.StatsInterface.ReadOnlineStats( Players, StatsRead );
	}
	else if (OnlineSub == None)
	{
		`warn("KFPlayerController.ReadStats: No online subsystem present.");
		OnStatsInitialized(false);
	}
}

simulated function OnStatsInitialized( bool bWasSuccessful )
{
	local int i;
	if(OnlineSub != none)
	{
		OnlineSub.StatsInterface.ClearReadOnlineStatsCompleteDelegate( OnStatsInitialized );
	}

	StatsRead.OnStatsInitialized( bWasSuccessful );

	if( MyGFxManager != none )
	{
		MyGFxManager.StatsInitialized();
	}

	ClientInitializePerks();


	//Get starting values for tracking xp changes on AAR -ZG
	for (i = 0; i < PerkList.length; i++)
	{
		`RecordAARPerkXPGain(self, PerkList[i].PerkClass, 0);
	}
}

/** Called from the server at the end of a wave to write stats */
reliable client function ClientWriteAndFlushStats()
{
	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if( OnlineSub != none && OnlineSub.StatsInterface != none && StatsWrite != none && !StatsWrite.HasCheated() )
	{
		`log(GetFuncName() @ "Writing and flushing stats to steam!", StatsWrite.bLogStatsWrite);
		OnlineSub.StatsInterface.WriteOnlineStats('Game', PlayerReplicationInfo.UniqueId, StatsWrite);
		OnlineSub.StatsInterface.FlushOnlineStats('Game');
	}
	else if( StatsWrite == none )
	{
		`log(GetFuncName() @ "Not writing and flushing stats to steam because StatsWrite is null.", StatsWrite.bLogStatsWrite);
	}
}

/**
 * @brief The player won a game while still alve. Client and listen only
  *
 * @param MapName The name of the map played
 * @param Difficulty The game's difficulty
 * @param GameLength short/medium/long
 */
reliable client function ClientWonGame( string MapName, byte Difficulty, byte GameLength, byte bCoop )
{
	if( WorldInfo.NetMode != NM_DedicatedServer && IsLocalPlayerController() )
	{
		StatsWrite.OnGameWon( MapName, Difficulty, GameLength, bCoop, GetPerk().class );
	}
}

reliable client function ClientRoundEnded( byte WinningTeam )
{ 
	if( WorldInfo.NetMode != NM_DedicatedServer && IsLocalPlayerController() )
	{
		StatsWrite.OnRoundEnd( WinningTeam );
	}
}

/**
 * @brief Unlock an achievemnt on the client
 *
 * @param AchievementIndex the achievemnt's index
 */
reliable client event ClientUnlockAchievement( int AchievementIndex, optional bool bAlwaysUnlock=false )
{
	if ( WorldInfo.NetMode != NM_DedicatedServer && IsLocalPlayerController() && (bIsAchievementPlayer || bAlwaysUnlock) &&
		!PlayerReplicationInfo.bOnlySpectator && !StatsWrite.HasCheated() && !StatsWrite.IsAchievementUnlocked(AchievementIndex) )
	{

`if(`notdefined(ShippingPC))
		`QALog("- probably unlocking achievement "$AchievementIndex, true);
`endif
		if (OnlineSub.PlayerInterface.UnlockAchievement(LocalPlayer(Player).ControllerId, AchievementIndex)) //@HSL_BEGIN - JRO - 4/28/2016 - Using the current controller ID instead of hardcoding 0, as 0 can break on console
		{
			StatsWrite.OnUnlockAchievement(AchievementIndex);
		}
	}
}

function float GetPerkLevelProgressPercentage(Class<KFPerk> PerkClass, optional out int CurrentLevelEXP, optional out int NextLevelEXP)
{
	local int NextEXP, CurrentEXP;
	local float EXPPercent;
	local byte 	PerkLevel;

	PerkLevel = GetPerkLevelFromPerkList(PerkClass);
	CurrentEXP = GetPerkXP(PerkClass);

	if( PerkLevel < `MAX_PERK_LEVEL )
	{
		NextEXP = class'KFOnlineStatsWrite'.static.GetXPNeededAt(PerkLevel);
		EXPPercent = float(CurrentEXP) / float(NextEXP);
	}
	else
	{
		EXPPercent = 1.0f;
	}

	CurrentLevelEXP = CurrentEXP;
	NextLevelEXP = NextEXP;

	return EXPPercent  * 100;
}

event  byte GetPerkLevelFromPerkList(Class<KFPerk> PerkClass)
{
	local int i;
	for (i = 0; i < PerkList.Length; i++)
	{
		if(PerkList[i].PerkClass == PerkClass)
		{
			return 	PerkList[i].PerkLevel;
		}
	}
	return 0;
}

/** Kill stat */
function AddZedKill( class<KFPawn_Monster> MonsterClass, byte Difficulty, class<DamageType> DT )
{
	ClientAddZedKill( MonsterClass, Difficulty, DT );
}
native reliable client private function ClientAddZedKill( class<KFPawn_Monster> MonsterClass, byte Difficulty, class<DamageType> DT );

/** Headshot stat */
function AddZedHeadshot( byte Difficulty, class<DamageType> DT )
{
	ClientAddZedHeadshot( Difficulty, DT );
}
native reliable client private function ClientAddZedHeadshot( byte Difficulty, class<DamageType> DT );

/** Perk xp stat */
native reliable client private event ClientAddPlayerXP( int XP, class<KFPerk> PerkClass );
/** XP notification for mods (Network: Server) */
event OnPlayerXPAdded(INT XP, class<KFPerk> PerkClass);

/** Radius kill stat */
function AddSmallRadiusKill( byte Difficulty )
{
	ClientAddSmallRadiusKill( Difficulty );
}
native reliable client private function ClientAddSmallRadiusKill(byte Difficulty);

/** Welding stat */
function AddWeldPoints( int PointsWelded )
{
	ClientAddWeldPoints( PointsWelded );
}
native reliable client private function ClientAddWeldPoints(int PointsWelded);

/** Healing stat */
function AddHealPoints( int PointsHealed )
{
	ClientAddHealPoints( PointsHealed );
}
native reliable client private function ClientAddHealPoints(int PointsHealed);

/** Console command to reset this users stats on steam */
exec function ResetStats(string ConfirmSteamNickInQuotes, bool bResetAchievements=false)
{
	if ( IsLocalPlayerController() )
	{
		if ( ConfirmSteamNickInQuotes != PlayerReplicationInfo.PlayerName )
		{
			LocalPlayer(Player).ViewportClient.ViewportConsole.OutputText("Failed - Confirm using your Steam nickname (Case sensitive)");
			return;
		}

		if ( OnlineSub.ResetStats(bResetAchievements) )
			{
				LocalPlayer(Player).ViewportClient.ViewportConsole.OutputText("Reset was successful");
			}
			else
			{
				`warn("Reset Stats Failed!");
			}
		}
}

protected native function int GetBenefactorDoshReq();

final exec function LogStats()
{
`if(`isdefined(ShippingPC))
	if( StatsWrite != none )
	{
		StatsWrite.LogStats();
	}
`endif
}

/*
 * Enables cheats and disables stats. Used in shipping. Cheats are allowed in dev (see KFGameInfo.AllowCheats)
 */
exec function EnableCheats()
{
	if( !PlayerReplicationInfo.bAdmin && WorldInfo.NetMode != NM_Standalone )
	{
		ReceiveLocalizedMessage(Class'KFLocalMessage', LMT_MustLoginToCheat, PlayerReplicationInfo);
		return;
	}

	ServerEnableCheats();
}

reliable server private function ServerEnableCheats()
{
	local KFGameInfo KFGI;

	// set game to unranked so that players can't earn achievements or anything
	KFGI = KFGameInfo(WorldInfo.Game);
	if( KFGI != none )
	{
		AddCheats( true );
		ClientNotifyCheats();

		BroadcastLocalizedMessage(class'KFLocalMessage', LMT_CheatsEnabled, PlayerReplicationInfo);

		KFGI.SetGameUnranked( true );
		KFGI.UpdateGameSettings();
	}
}

reliable client private function ClientNotifyCheats()
{
	if( StatsWrite != none )
	{
		StatsWrite.NotifyCheats();
	}
}

/** Called from native (AKFCollectibleActor::OnCollect) when a collectible (except for the final one) is found
  * @param FinderPRI: the player who found the collectible
  * @param CollectibleID: which collectible this is (same as number of collectibles found so far)
  */
reliable client event OnMapCollectibleFound( PlayerReplicationInfo FinderPRI, int CollectibleID )
{
	local string CollectibleFoundMsg;
	local KFMapInfo KFMI;

	KFMI = KFMapInfo( WorldInfo.GetMapInfo() );

	CollectibleFoundMsg = Localize( "KFMapInfo", "FoundCollectibleString", "KFGame" );
	CollectibleFoundMsg = repl( CollectibleFoundMsg, "%x%", FinderPRI.PlayerName );
	CollectibleFoundMsg = repl( CollectibleFoundMsg, "%y%", KFMI.CollectiblesToFind - CollectibleID );

	MyGFxHUD.ShowNonCriticalMessage( CollectibleFoundMsg );
}

/** Called from native (AKFCollectibleActor::OnCollect) when the final collectible is found */
reliable client event OnAllMapCollectiblesFound()
{
	MyGFxHUD.ShowNonCriticalMessage( Localize("KFMapInfo", "FoundAllCollectiblesString", "KFGame") );

	PostAkEvent( AllMapCollectiblesFoundEvent );
}

native final function UpdateBenefactor( int DoshAmount );
native final function UnlockHoldOut();

/*********************************************************************************************
 * @name Debug
 *********************************************************************************************/

/** Overridden to make it accessible to cheat manager and potentially dump more debug info */
native function LogOutBugItAIGoToLogFile( const String InScreenShotDesc, const string InGoString, const string InLocString );

// Displays the number of loaded objects for a particular class and its size
simulated function DisplayDebug(HUD HUD, out float out_YL, out float out_YPos)
{
    local KFGameReplicationInfo KFGRI;
	local KFAIController KFAIC;

    super.DisplayDebug(HUD, out_YL, out_YPos);
    if (HUD.ShouldDisplayDebug('Memory'))
	{
    	DrawDebugMemory( HUD.Canvas, out_YL, out_YPos );
	}

	if (HUD.ShouldDisplayDebug('Difficulty'))
	{
		DrawDebugDifficulty( HUD.Canvas, out_YL, out_YPos );
	}

	if (HUD.ShouldDisplayDebug('SpawnWaves'))
	{
		DrawDebugSpawning( HUD.Canvas );
	}

	if( HUD.ShouldDisplayDebug('Map') )
	{
        KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

        if( KFGRI.bTrackingMapEnabled )
        {
            DrawDebugMap( HUD.Canvas );
        }
	}

	if (HUD.ShouldDisplayDebug('DoorGraph'))
	{
		//DrawDebugDoorGraph( HUD.Canvas );
	}

    if (HUD.ShouldDisplayDebug('gri'))
	{
    	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

    	if( KFGRI != none )
        {
            KFGRI.DisplayDebug(HUD, out_YL, out_YPos);
        }
	}

    if (HUD.ShouldDisplayDebug('time'))
	{
		HUD.Canvas.SetDrawColor(0,255,0);
		HUD.Canvas.DrawText("TIME: WorldInfo.TimeDilation: "$WorldInfo.TimeDilation$" CustomTimeDilation: "$CustomTimeDilation);
		out_YPos += out_YL;
		HUD.Canvas.SetPos(4, out_YPos);
	}

	if (HUD.ShouldDisplayDebug('FireAttacks'))
	{
		foreach WorldInfo.AllControllers(class'KFAIController', KFAIC )
		{
			KFAIC.DrawFireAttackDebug();
		}
	}

	if( KFPlayerInput(PlayerInput) != none )
	{
	   KFPlayerInput(PlayerInput).DisplayDebug(HUD, out_YL, out_YPos);
	}

	if( HUD.ShouldDisplayDebug('Conductor') )
	{
        KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

        if( KFGRI.bGameConductorGraphingEnabled )
        {
            DrawDebugConductor( HUD.Canvas );
        }
	}
}

function DrawDebugMemory( Canvas Canvas, out float out_YL, out float out_YPos)
{
	local int		i, ClassCount;
	local float		ClassSize, ResourceSize;
	local array< class<Object> > MemoryArray;

	// Add any class to MemoryArray for its information to be displayed
	MemoryArray.AddItem(class'KFWeapon');
	MemoryArray.AddItem(class'KFWeaponAttachment');
	MemoryArray.AddItem(class'KFPawn_Human');
	MemoryArray.AddItem(class'KFPawn_Monster');
	MemoryArray.AddItem(class'Projectile');

    Canvas.SetDrawColor(0,255,0);
    Canvas.SetPos(4,out_YPos);
	Canvas.DrawText("---------- KFPlayerController: Memory ----------");
	out_YPos += out_YL;

	for ( i = 0; i < MemoryArray.Length; i++ )
	{
		ClassCount = 0;
		ClassSize = 0;
		ResourceSize = 0;

		( i % 2 == 0 ) ? Canvas.SetDrawColor(0,255,0) : Canvas.SetDrawColor(180,255,0);

		class'KFGameEngine'.static.GetClassCountAndSize( ClassCount, ClassSize, ResourceSize, MemoryArray[i] );
        Canvas.SetPos(4,out_YPos);
		Canvas.DrawText(MemoryArray[i].Name $":");
		Canvas.SetPos(154,out_YPos);
        Canvas.DrawText("# Objects = "$ClassCount);
		Canvas.SetPos(254,out_YPos);
        Canvas.DrawText("Class Size = "$ClassSize $"KB");
        Canvas.SetPos(404,out_YPos);
        Canvas.DrawText("True Resource Size = "$ResourceSize $"MB");
		out_YPos += out_YL;
	}
}

/** Draw out the global difficulty modifiers */
function DrawDebugDifficulty( Canvas Canvas, out float out_YL, out float out_YPos)
{
	local KFGameInfo KFGI;
	local byte NumLivingPlayers, NumPlayers;

    KFGI = KFGameInfo( WorldInfo.Game );
    if ( KFGI != none && KFGI.DifficultyInfo != none )
    {
    	NumLivingPlayers = KFGI.GetLivingPlayerCount();
    	NumPlayers = KFGI.GetNumPlayers();
     	Canvas.SetDrawColor(0,255,255);
	    Canvas.SetPos(4,out_YPos);
		Canvas.DrawText( "---------- KFPlayerController: Difficulty ----------" );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, false, "Current Difficulty: " @"("$KFGI.GameDifficulty$")" );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, true, 	"Global Health Mod: " @KFGI.DifficultyInfo.GetGlobalHealthMod() );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, true, 	"Ground Speed Mod: " @KFGI.DifficultyInfo.GetAIGroundSpeedMod() );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, false, "Difficulty Wave Count Mod: " @KFGI.DifficultyInfo.GetDifficultyMaxAIModifier() );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, true, 	"Dosh Per Kill Mod: " @KFGI.DifficultyInfo.GetKillCashModifier()  );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, false, "Starting Dosh: " @KFGI.DifficultyInfo.GetAdjustedStartingCash() );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, true, 	"Respawn Dosh: " @KFGI.DifficultyInfo.GetAdjustedRespawnCash() );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, false, "Active Ammo Pickups Mod: " @KFGI.DifficultyInfo.GetAmmoPickupModifier() );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, true,	"Active Weapon Pickups Mod: " @KFGI.DifficultyInfo.GetItemPickupModifier() );

        Canvas.SetDrawColor(0,255,255);
		Canvas.DrawText( "---------- NumPlayer Modifiers ----------" );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, false,"Num Living Players: " @NumLivingPlayers  );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, true, "Hidden AI Movement Speed Mod: " @KFGI.DifficultyInfo.GetAIHiddenSpeedModifier( NumLivingPlayers) );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, false,"Num Players Wave Count Mod: " @KFGI.DifficultyInfo.GetPlayerNumMaxAIModifier( NumPlayers ) );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, true, "Ammo Pickups Respawn Time: " @KFGI.DifficultyInfo.GetAmmoPickupInterval( NumLivingPlayers ) );
		DrawNextDebugLine( Canvas, out_YL, out_YPos, false,"Weapon Pickups Respawn Time: " @KFGI.DifficultyInfo.GetWeaponPickupInterval( NumLivingPlayers ) );
    }
}

function DrawNextDebugLine( out Canvas Canvas, out float out_YL, out float out_YPos, bool bAlternate, string DebugString, optional float XPos )
{
	( !bAlternate ) ? Canvas.SetDrawColor(0,255,0) : Canvas.SetDrawColor(180,255,0);

	out_YPos += out_YL;
	if ( XPos != 0 )
	{
		Canvas.SetPos( XPos, out_YPos );
	}
	Canvas.DrawText( DebugString );
}

function DrawDebugSpawning( out Canvas Canvas )
{
	local float Buffer, XPos, YPos, BackgroundScale, MarkerScale;
	local float BackgroundWidth, BackgroundHeight, HalfMarkerWidth, HalfMarkerHeight;
	local float CompleteCycle;
	local byte NumCycles;
	local KFGameReplicationInfo KFGRI;

	local Texture2D SineTex;
	local Texture2D MarkerTex;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if( KFGRI == none )
	{
	   return;
	}

    SineTex = Texture2D'GP_Debug.AbsSine_TEX';
    MarkerTex = Texture2D'GP_Debug.SineWaveMarker_TEX';

    BackgroundScale = 0.5f;
    MarkerScale = 0.75f * BackgroundScale;
    BackgroundWidth = SineTex.SizeX * BackgroundScale;
    BackgroundHeight = SineTex.SizeY * BackgroundScale;
    HalfMarkerWidth = MarkerTex.SizeX * MarkerScale / 2;
    HalfMarkerHeight = MarkerTex.SizeY * MarkerScale / 2;

    Buffer = 8;
    XPos = Canvas.ClipX - ( SineTex.SizeX * BackgroundScale ) - Buffer;
	YPos = Buffer;

    NumCycles = 1;
    CompleteCycle = 6.28f / KFGRI.CurrentSineWavFreq;	// ( 2Pi / The Frequency ) gives us the value for a complete cycle

	// Draw Spawn Time Info
    DrawNextSpawnTimeInfo( Canvas, XPos, BackgroundHeight, Buffer * 2 );

	// Draw background
	Canvas.SetPos(Xpos, YPos);
	Canvas.SetDrawColor(255,255,255);
	Canvas.DrawTexture( SineTex, BackgroundScale );

	// Draw Marker
	XPos += ( ( ( KFGRI.CurrentTotalWavesActiveTime / CompleteCycle ) % NumCycles ) * BackgroundWidth ) - HalfMarkerWidth;
    YPos += ( ( KFGRI.CurrentSineMod ) * BackgroundHeight ) - HalfMarkerHeight;

	Canvas.SetPos( Xpos, YPos );
	Canvas.DrawTexture( MarkerTex, MarkerScale );
}

/** Draw the tracking map */
function DrawDebugMap( out Canvas Canvas )
{
`if(`notdefined(ShippingPC))
    local Texture2D OverheadMap;
	local float XPos, YPos, MarkerScale;
	local float HalfMarkerWidth, HalfMarkerHeight;
	local KFGameReplicationInfo KFGRI;
	local float AdjustedSize;
	local float ScreenScale;
	local vector2d CenterLocation, UpperLeftLocation;
	local Texture2D MarkerTex;
	local int i;
	local class<KFPawn> ZedClass;
	local vector ZedLocation;
	local bool bZedUsingSuperSpeed;
	local vector MyLocation;
	local color ElementColor;
	local vector EnemyLocation;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if( !KFGRI.bTrackingMapEnabled )
	{
        return;
	}

    OverheadMap = Texture2D'GP_Debug.MapTest';

    if( Pawn != none )
    {
        MyLocation = Pawn.Location;
    }
    else
    {
        MyLocation = Location;
    }

	ScreenScale = Canvas.ClipY/900.0;
	AdjustedSize = OverheadMap.GetSurfaceHeight() * ScreenScale * TrackingMapScale;

    XPos = TrackerXPosition * Canvas.ClipX;
	YPos = TrackerYPosition * Canvas.ClipY;

    UpperLeftLocation.X = XPos;
    UpperLeftLocation.Y = YPos;

	// Draw background
	Canvas.SetPos(Xpos, YPos);
	Canvas.SetDrawColor(255,255,255,128);
	Canvas.DrawTexture( OverheadMap, ScreenScale * TrackingMapScale);

    CenterLocation.X = XPos + (AdjustedSize * 0.5);
    CenterLocation.Y = YPos + (AdjustedSize * 0.5);

	// Draw Icon where player is
	MarkerTex = class'KFPawn_Human'.default.DebugRadarTexture;
    MarkerScale = ScreenScale * TrackingMapScale * 0.25;
    HalfMarkerWidth = MarkerTex.SizeX * MarkerScale / 2;
    HalfMarkerHeight = MarkerTex.SizeY * MarkerScale / 2;
	XPos = CenterLocation.X - HalfMarkerWidth;
    YPos = CenterLocation.Y - HalfMarkerHeight;

	// Center
	Canvas.SetDrawColor(0,255,0,255);
    Canvas.SetPos( Xpos, YPos );
	Canvas.DrawTexture( MarkerTex, MarkerScale );

    Canvas.SetDrawColor(255,255,255);

    if ( KFGRI != none )
    {
    	// Draw Zeds
    	if( CurrentTrackingMode != ETM_SpawnsOnly && CurrentTrackingMode != ETM_FailedSpawnsOnly
            && CurrentTrackingMode != ETM_PickupsOnly )
        {
            if(  CurrentTrackingMode != ETM_HumansAndSpawnsOnly )
            {
                for (i = 0; i < ArrayCount(KFGRI.ZedInfos); i++)
            	{
                    if( KFGRI.ZedInfos[i].Zed != none )
                    {
                        ZedLocation = KFGRI.ZedInfos[i].Zed.Location;
                        ZedClass = KFGRI.ZedInfos[i].Zed.class;
                        bZedUsingSuperSpeed = KFGRI.ZedInfos[i].bUsingSuperSpeed;
                    }
            		else if( !IsZero(KFGRI.ZedInfos[i].ZedLocation) )
                    {
                        ZedLocation = KFGRI.ZedInfos[i].ZedLocation;
                        ZedClass = KFGRI.ZedInfos[i].ZedClass;
                        bZedUsingSuperSpeed = KFGRI.ZedInfos[i].bUsingSuperSpeed;
                    }
                    else
                    {
                        continue;
                    }

                    // Don't draw targets if we want pawns only
                    if( CurrentTrackingMode != ETM_PawnsOnly && CurrentTrackingMode != ETM_AllButTargeting )
                    {
                        if( KFGRI.ZedInfos[i].Enemy != none )
                        {
                            EnemyLocation = KFGRI.ZedInfos[i].Enemy.Location;
                        }
                		else if( !IsZero(KFGRI.ZedInfos[i].EnemyLocation) )
                        {
                            EnemyLocation = KFGRI.ZedInfos[i].EnemyLocation;
                        }
                    }


                    if( !IsZero(KFGRI.ZedInfos[i].LastTeleportLocation) )
                    {
                        // Orange, teleported
                        ElementColor.R=255;
                        ElementColor.G=128;
                        ElementColor.B=0;
                        // Don't render as superspeed if we just teleported since we'll be orange instead
                        bZedUsingSuperSpeed=false;
                    }
                    else
                    {
                        // Standard Zed Color, Yellow
                        ElementColor.R=255;
                        ElementColor.G=255;
                        ElementColor.B=0;
                    }

                    DrawMapElement(Canvas, ScreenScale, AdjustedSize, CenterLocation, MyLocation, ZedLocation, ZedClass, ElementColor, bZedUsingSuperSpeed, true,,EnemyLocation);

                    if( !IsZero(KFGRI.ZedInfos[i].LastTeleportLocation) )
                    {
                        // Blue, teleported from
                        ElementColor.R=0;
                        ElementColor.G=255;
                        ElementColor.B=255;
                        DrawMapElement(Canvas, ScreenScale, AdjustedSize, CenterLocation, MyLocation, KFGRI.ZedInfos[i].LastTeleportLocation, ZedClass, ElementColor, false, true,,ZedLocation);
                    }
            	}
        	}

        	// Draw Players
            for (i = 0; i < ArrayCount(KFGRI.HumanInfos); i++)
        	{
                if( KFGRI.HumanInfos[i].Human != none )
                {
                    if( KFGRI.HumanInfos[i].Human == Pawn )
                    {
                        continue;
                    }

                    ZedLocation = KFGRI.HumanInfos[i].Human.Location;
                    ZedClass = KFGRI.HumanInfos[i].Human.class;
                }
        		else if( !IsZero(KFGRI.HumanInfos[i].HumanLocation) )
                {
                    ZedLocation = KFGRI.HumanInfos[i].HumanLocation;
                    ZedClass = KFGRI.HumanInfos[i].HumanClass;
                }
                else
                {
                    continue;
                }

                // Standard Human color, Light blue for other players
                ElementColor.R=0;
                ElementColor.G=255;
                ElementColor.B=255;

                DrawMapElement(Canvas, ScreenScale, AdjustedSize, CenterLocation, MyLocation, ZedLocation, ZedClass, ElementColor, false, true);
        	}
    	}

    	if( CurrentTrackingMode != ETM_PawnsOnly && CurrentTrackingMode != ETM_PawnsAndTargetingOnly
            && CurrentTrackingMode != ETM_PickupsOnly )
        {
        	if( CurrentTrackingMode != ETM_FailedSpawnsOnly )
        	{
                // Draw Spawn Volumes
                for (i = 0; i < ArrayCount(KFGRI.SpawnVolumeInfos); i++)
            	{
                    if( IsZero(KFGRI.SpawnVolumeInfos[i].VolumeLocation) )
                    {
                        continue;
                    }

                    if( KFGRI.SpawnVolumeInfos[i].bPortalSpawn )
                    {
                        // Portal spawns are orange
                        ElementColor.R=255;
                        ElementColor.G=128;
                        ElementColor.B=0;
                        ElementColor.A = 64 + (191 * float(KFGRI.SpawnVolumeInfos[i].VolumeAge)/255);
                    }
                    else
                    {
                        // Spawn volumes are white
                        ElementColor.R=255;
                        ElementColor.G=255;
                        ElementColor.B=255;
                        ElementColor.A = 255 * float(KFGRI.SpawnVolumeInfos[i].VolumeAge)/255;//64 + (191 * float(KFGRI.SpawnVolumeInfos[i].VolumeAge)/255);
                    }

                    DrawMapElement(Canvas, ScreenScale, AdjustedSize, CenterLocation, MyLocation, KFGRI.SpawnVolumeInfos[i].VolumeLocation, none, ElementColor, false, true, true);
            	}
        	}

        	// Draw Failed spawns
            for (i = 0; i < ArrayCount(KFGRI.FailedSpawnInfos); i++)
        	{
                if( IsZero(KFGRI.FailedSpawnInfos[i].VolumeLocation) )
                {
                    continue;
                }

                if( KFGRI.FailedSpawnInfos[i].bPortalSpawn )
                {
                    // Portal spawns are orange
                    ElementColor.R=255;
                    ElementColor.G=128;
                    ElementColor.B=0;
                }
                else
                {
                    // Spawn volumes are white
                    ElementColor.R=255;
                    ElementColor.G=255;
                    ElementColor.B=255;
                }

                DrawMapElement(Canvas, ScreenScale, AdjustedSize, CenterLocation, MyLocation, KFGRI.FailedSpawnInfos[i].VolumeLocation, none, ElementColor, false, true, false,, true);
        	}
    	}

    	// Draw weapon pickup info
    	if( CurrentTrackingMode == ETM_PickupsOnly || CurrentTrackingMode == ETM_All
            || CurrentTrackingMode == ETM_AllButTargeting )
        {
            for (i = 0; i < ArrayCount(KFGRI.PickupInfos); i++)
        	{
                if( IsZero(KFGRI.PickupInfos[i].PickupLocation) )
                {
                    continue;
                }

                if( KFGRI.PickupInfos[i].PickupType == 0 )
                {
                    // Ammo pickups are green
                    ElementColor.R=0;
                    ElementColor.G=255;
                    ElementColor.B=0;
                    ElementColor.A = 255;
                }
                else if( KFGRI.PickupInfos[i].PickupType == 1)
                {
                    // Weapon pickups are red
                    ElementColor.R=255;
                    ElementColor.G=0;
                    ElementColor.B=0;
                    ElementColor.A = 255;
                }
                else if( KFGRI.PickupInfos[i].PickupType == 2 )
                {
                    // Armor pickups are blue
                    ElementColor.R=0;
                    ElementColor.G=0;
                    ElementColor.B=255;
                    ElementColor.A = 255;
                }
                else
                {
                    Continue;
                }

                DrawMapElement(Canvas, ScreenScale, AdjustedSize, CenterLocation, MyLocation, KFGRI.PickupInfos[i].PickupLocation, none, ElementColor, false, true, true);
			}
    	}
    }

    // Draw the map key info
    Canvas.SetDrawColor(0,255,0);
    Canvas.SetPos(UpperLeftLocation.X + (AdjustedSize * 0.01), UpperLeftLocation.Y + (AdjustedSize * 0.97));
	Canvas.DrawText( "Tracking Range: "$int(TrackingMapRange/100)$" Meters" );

    Canvas.SetPos(UpperLeftLocation.X + (AdjustedSize * 0.01), UpperLeftLocation.Y + (AdjustedSize * 0.01));
	Canvas.DrawText( "Tracking Mode: "$CurrentTrackingMode );

    Canvas.SetPos(UpperLeftLocation.X + (AdjustedSize * 0.75), UpperLeftLocation.Y + (AdjustedSize * 0.01));
	if( bTrackingMapTopView )
	{
        Canvas.DrawText( "Tracking View: Top Down" );
	}
	else
	{
        Canvas.DrawText( "Tracking View: Side View" );
	}

`endif
}

/** Draw elements of the tracking map */
simulated function DrawMapElement(Canvas Canvas,
                                float ScreenScale,
                                float AdjustedMapSize,
                                vector2d CenterLocation,
                                vector MapHolderLocation,
                                vector ElementLocation,
                                class<KFPawn> ElementClass,
                                Color IconColor,
                                bool bUsingSuperSpeed,
                                bool bDrawHeightArrows,
                                optional bool bBox,
                                optional vector EnemyLocation,
                                optional bool bFailed)
{
`if(`notdefined(ShippingPC))
	local float MarkerScale;
	local float HalfMarkerWidth, HalfMarkerHeight;
	local vector VectToMonster;
	local vector2d MonsterLocation;
	local rotator ViewRotation;
	local float ZedDist, ZedDistScale;
	local Texture2D MarkerTex;
	local Texture2D ArrowUp, ArrowDown;
	local float HalfArrowHeight;
	local float MarkerHeight;
	local float HeightDiff;
	local byte MarkerAlpha;
	local vector VectToEnemyLoc;
	local float EnemyDist, EnemyDistScale;

    ArrowUp=Texture2D'UI_ZEDRadar_TEX.MapIcon_Up';
    ArrowDown=Texture2D'UI_ZEDRadar_TEX.MapIcon_Down';

    VectToMonster = ElementLocation - MapHolderLocation;
    HeightDiff = VectToMonster.Z;

    if( bTrackingMapTopView )
    {
        // Only concerned with X and Y for the overhead map, top down view
        VectToMonster.Z = 0;
    }
    else
    {
        // Only concerned with Z and Y for the side view map
        VectToMonster.Y = 0;
    }

    ZedDist = VSize(VectToMonster);

    if( ZedDist > TrackingMapRange )
    {
        ZedDistScale = 1.0;

        if( IconColor.A > 0 )
        {
            MarkerAlpha = Min(128,IconColor.A);
        }
        else
        {
            MarkerAlpha = 128;
        }
    }
    else
    {
        ZedDistScale = ZedDist/TrackingMapRange;
        MarkerAlpha = 255;
        if( IconColor.A > 0 )
        {
            MarkerAlpha = Min(255,IconColor.A);
        }
        else
        {
            MarkerAlpha = 255;
        }
    }

    ViewRotation = Rotation;
    ViewRotation.Yaw *= -1;
    ViewRotation.Pitch = 0;

    VectToMonster = Normal(VectToMonster >> ViewRotation) * AdjustedMapSize * 0.5 * ZedDistScale;

    if( bTrackingMapTopView )
    {
        // Set up the coordinates for top down view map
        MonsterLocation.X = VectToMonster.Y;
        MonsterLocation.Y = VectToMonster.X * -1;
    }
    else
    {
        // Set up the coordinates for the side view map
        MonsterLocation.X = VectToMonster.X;
        MonsterLocation.Y = VectToMonster.Z * -1;

    }

    MonsterLocation *= ScreenScale;

    MonsterLocation = CenterLocation + MonsterLocation;

    if( !IsZero(EnemyLocation ) )
    {
        VectToEnemyLoc = EnemyLocation - MapHolderLocation;

        if( bTrackingMapTopView )
        {
            // Only concerned with X and Y for the overhead map, top down view
            VectToEnemyLoc.Z = 0;
        }
        else
        {
            // Only concerned with Z and Y for the side view map
            VectToEnemyLoc.Y = 0;
        }

        EnemyDist = VSize(VectToEnemyLoc);

        if( EnemyDist > TrackingMapRange )
        {
            EnemyDistScale = 1.0;
        }
        else
        {
            EnemyDistScale = EnemyDist/TrackingMapRange;
        }

        VectToEnemyLoc = Normal(VectToEnemyLoc >> ViewRotation) * AdjustedMapSize * 0.5 * EnemyDistScale;

        if( bTrackingMapTopView )
        {
            // Set up the coordinates for top down view map
            EnemyLocation.X = VectToEnemyLoc.Y;
            EnemyLocation.Y = VectToEnemyLoc.X * -1;
        }
        else
        {
            // Set up the coordinates for the side view map
            EnemyLocation.X = VectToEnemyLoc.X;
            EnemyLocation.Y = VectToEnemyLoc.Z * -1;

        }

        EnemyLocation *= ScreenScale;

        EnemyLocation.X = CenterLocation.X + EnemyLocation.X;
        EnemyLocation.Y = CenterLocation.Y + EnemyLocation.Y;

        // Blue icon with "EnemyLocation" is teleport, so draw a different color line
        if( IconColor.R == 0 && IconColor.G == 255 && IconColor.B == 255 )
        {
            Canvas.Draw2DLine(EnemyLocation.X, EnemyLocation.Y, MonsterLocation.X, MonsterLocation.Y, MakeColor(0,255,255,128));
        }
        else
        {
            // red line for enemy
            Canvas.Draw2DLine(EnemyLocation.X, EnemyLocation.Y, MonsterLocation.X, MonsterLocation.Y, MakeColor(255,0,0,128));
        }
    }

    // Draw Element Marker
    if( bFailed )
    {
        MarkerTex = Texture2D'UI_ZEDRadar_TEX.MapIcon_FailedSpawn';
    }
    else if( ElementClass != none )
    {
	   MarkerTex = ElementClass.default.DebugRadarTexture;
	}
    MarkerScale = ScreenScale * TrackingMapScale * 0.25;
    if( MarkerTex != none )
    {
        HalfMarkerWidth = MarkerTex.SizeX * MarkerScale / 2;
        HalfMarkerHeight = MarkerTex.SizeY * MarkerScale / 2;
        MarkerHeight = MarkerTex.SizeY * MarkerScale;
    }
    else if( bBox )
    {
        HalfMarkerWidth = TrackerSpawnVolumeSizeX * MarkerScale / 2;
        HalfMarkerHeight = TrackerSpawnVolumeSizeY * MarkerScale / 2;
        MarkerHeight = TrackerSpawnVolumeSizeY * MarkerScale;
    }

    if( bUsingSuperSpeed )
    {
        // red if using super speed
        Canvas.SetDrawColor(255,0,0,MarkerAlpha);
    }
    else
    {
        // yellow if not using super speed
        Canvas.SetDrawColor(IconColor.R,IconColor.G,IconColor.B,MarkerAlpha);
    }

    // Draw a box if it's a box
    if( bBox )
    {
        Canvas.SetPos( MonsterLocation.X - (TrackerSpawnVolumeSizeX * 0.5), MonsterLocation.Y - (TrackerSpawnVolumeSizeY * 0.5));
        Canvas.DrawBox(TrackerSpawnVolumeSizeX * ScreenScale, TrackerSpawnVolumeSizeY * ScreenScale);
    }
    // Draw an icon if it's a pawn
    else
    {
        Canvas.SetPos( MonsterLocation.X - HalfMarkerWidth, MonsterLocation.Y - HalfMarkerHeight );
        Canvas.DrawTexture( MarkerTex, MarkerScale );
    }

    if( bDrawHeightArrows )
    {
        HalfArrowHeight = ArrowUp.SizeY * MarkerScale / 2;

        if( HeightDiff > 300 ) // 3 meters
        {
            Canvas.SetDrawColor(255,255,255,MarkerAlpha);
            Canvas.SetPos( MonsterLocation.X - HalfMarkerWidth, MonsterLocation.Y );
            Canvas.DrawTexture( ArrowUp, MarkerScale );
        }
        else if (HeightDiff < -300 )
        {
            Canvas.SetDrawColor(255,255,255,MarkerAlpha);
            Canvas.SetPos( MonsterLocation.X - HalfMarkerWidth, (MonsterLocation.Y - MarkerHeight) + HalfArrowHeight);
            Canvas.DrawTexture( ArrowDown, MarkerScale );
        }
    }
`endif
}

/** Draw the tracking map */
function DrawDebugConductor( out Canvas Canvas )
{
`if(`notdefined(ShippingPC))
    local KFGameReplicationInfo KFGRI;
	local array<vector2d> Points;
	local int i;
	local Float ScaleX;
	local float UL_X, UL_Y, W, H;
	local float MaxLifeSpan;
	local float BaseLinePlayerSkill, HighSkill, LowSkill;
	local float MaxGlobalSkill;

	if( CurrentGameConductorDebugMode == EGCDM_Skill )
	{
        KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

        if( KFGRI != none )
        {
        	for( i = 0; i < ArrayCount(KFGRI.PlayerAccuracyTracker); i++ )
        	{
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.PlayerAccuracyTracker)),(100.0 - KFGRI.PlayerAccuracyTracker[i]));
        	}
        }

        // Scale the graph to the screen size
        ScaleX = Canvas.ClipX/1920.0;

        // Set the location and size of the graph
        UL_X = 1350 * ScaleX;
        UL_Y = 100 * ScaleX;
        W = 500 * ScaleX;
        H = 250 * ScaleX;

        Canvas.DrawDebugGraphBackground("Weapon Accuracy", UL_X, UL_Y, W, H);
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,100), MakeColor(255, 255, 0, 255), "Hit %", 0,FFloor(KFGRI.PlayerAccuracyTracker[i-1])$"%");

        if( KFGRI != none )
        {
        	Points.Length = 0;

            for( i = 0; i < ArrayCount(KFGRI.PlayerHeadshotAccuracyTracker); i++ )
        	{
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.PlayerHeadshotAccuracyTracker)),(100.0 - KFGRI.PlayerHeadshotAccuracyTracker[i]));
        	}
        }

        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,100), MakeColor(255, 0, 0, 255), "HeadShot %", 50 * ScaleX,FFloor(KFGRI.PlayerHeadshotAccuracyTracker[i-1])$"%");

        if( KFGRI != none )
        {
        	Points.Length = 0;

            for( i = 0; i < ArrayCount(KFGRI.AggregatePlayerSkillTracker); i++ )
        	{
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.AggregatePlayerSkillTracker)),(100.0 - KFGRI.AggregatePlayerSkillTracker[i]));
        	}
        }

        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,100), MakeColor(0, 255, 255, 255), "Skill Rank %", 150 * ScaleX,FFloor(KFGRI.AggregatePlayerSkillTracker[i-1])$"%");

        Points.Length = 0;
        Points[Points.Length] = vect2d(0,100.0 - class'KFGameConductor'.default.ParShotAccuracy);
        Points[Points.Length] = vect2d(100,100.0 - class'KFGameConductor'.default.ParShotAccuracy);
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,100), MakeColor(255, 255, 255, 128), "Par Shot%", 250 * ScaleX,FFloor(class'KFGameConductor'.default.ParShotAccuracy)$"%");

        Points.Length = 0;
        Points[Points.Length] = vect2d(0,100.0 - class'KFGameConductor'.default.ParHeadshotAccuracy);
        Points[Points.Length] = vect2d(100,100.0 - class'KFGameConductor'.default.ParHeadshotAccuracy);
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,100), MakeColor(128, 128, 128, 128), "Par HeadShot%", 350 * ScaleX,FFloor(class'KFGameConductor'.default.ParHeadshotAccuracy)$"%");
    }
	else if( CurrentGameConductorDebugMode == EGCDM_OverallAccuracy )
	{
        KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

        BaseLinePlayerSkill = class'KFGameConductor'.default.ParShotAccuracy * class'KFGameConductor'.default.ShootingAccuracySkillWeight + class'KFGameConductor'.default.ParHeadshotAccuracy * class'KFGameConductor'.default.HeadShootingAccuracySkillWeight;
        HighSkill = BaseLinePlayerSkill * class'KFGameConductor'.default.HighlySkilledAccuracyMod;
        LowSkill = BaseLinePlayerSkill * class'KFGameConductor'.default.LessSkilledAccuracyMod;

        if( MaxGlobalSkill < BaseLinePlayerSkill )
        {
            MaxGlobalSkill = BaseLinePlayerSkill;
        }

        if( MaxGlobalSkill < HighSkill )
        {
            MaxGlobalSkill = HighSkill;
        }

        if( KFGRI != none )
        {
            for( i = 0; i < ArrayCount(KFGRI.AggregatePlayerSkillTracker); i++ )
        	{
                if( MaxGlobalSkill < KFGRI.AggregatePlayerSkillTracker[i] )
                {
                    MaxGlobalSkill = KFGRI.AggregatePlayerSkillTracker[i];
                }
        	}

            for( i = 0; i < ArrayCount(KFGRI.AggregatePlayerSkillTracker); i++ )
        	{
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.AggregatePlayerSkillTracker)),(MaxGlobalSkill - KFGRI.AggregatePlayerSkillTracker[i]));
        	}
        }

        // Scale the graph to the screen size
        ScaleX = Canvas.ClipX/1920.0;

        // Set the location and size of the graph
        UL_X = 1350 * ScaleX;
        UL_Y = 100 * ScaleX;
        W = 500 * ScaleX;
        H = 250 * ScaleX;

        Canvas.DrawDebugGraphBackground("Overall Accuracy", UL_X, UL_Y, W, H);
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,MaxGlobalSkill), MakeColor(128, 255, 0, 255), "Avg Skill", 0,FFloor(KFGRI.AggregatePlayerSkillTracker[i-1]));

        Points.Length = 0;
        Points[Points.Length] = vect2d(0,MaxGlobalSkill - BaseLinePlayerSkill);
        Points[Points.Length] = vect2d(100,MaxGlobalSkill - BaseLinePlayerSkill);
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,MaxGlobalSkill), MakeColor(255, 255, 255, 255), "Base Skill", 75 * ScaleX,FFloor(BaseLinePlayerSkill));

        Points.Length = 0;
        Points[Points.Length] = vect2d(0,MaxGlobalSkill - HighSkill);
        Points[Points.Length] = vect2d(100,MaxGlobalSkill - HighSkill);
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,MaxGlobalSkill), MakeColor(255, 0, 0, 255), "High Skill", 175 * ScaleX,FFloor(HighSkill));

        Points.Length = 0;
        Points[Points.Length] = vect2d(0,MaxGlobalSkill - LowSkill);
        Points[Points.Length] = vect2d(100,MaxGlobalSkill - LowSkill);
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,MaxGlobalSkill), MakeColor(255, 255, 0, 255), "Low Skill", 250 * ScaleX,FFloor(LowSkill));
    }
	else if( CurrentGameConductorDebugMode == EGCDM_LifeSpan )
	{
        KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

        if( KFGRI != none )
        {
        	for( i = 0; i < ArrayCount(KFGRI.TotalZedLifeSpanAverageTracker); i++ )
        	{
                if( MaxLifeSpan < KFGRI.TotalZedLifeSpanAverageTracker[i] )
                {
                    MaxLifeSpan = KFGRI.TotalZedLifeSpanAverageTracker[i];
                }
        	}

            for( i = 0; i < ArrayCount(KFGRI.CurrentWaveZedLifeSpanAverageTracker); i++ )
        	{
                if( MaxLifeSpan < KFGRI.CurrentWaveZedLifeSpanAverageTracker[i] )
                {
                    MaxLifeSpan = KFGRI.CurrentWaveZedLifeSpanAverageTracker[i];
                }
        	}

            for( i = 0; i < ArrayCount(KFGRI.RecentZedLifeSpanAverageTracker); i++ )
        	{
                if( MaxLifeSpan < KFGRI.RecentZedLifeSpanAverageTracker[i] )
                {
                    MaxLifeSpan = KFGRI.RecentZedLifeSpanAverageTracker[i];
                }
        	}

            if( MaxLifeSpan < KFGRI.CurrentParZedLifeSpan )
            {
                MaxLifeSpan = KFGRI.CurrentParZedLifeSpan;
            }

            if( MaxLifeSpan < (KFGRI.CurrentParZedLifeSpan * class'KFGameConductor'.default.ZedLifeSpanHighlySkilledThreshold) )
            {
                MaxLifeSpan = (KFGRI.CurrentParZedLifeSpan * class'KFGameConductor'.default.ZedLifeSpanHighlySkilledThreshold);
            }

            if( MaxLifeSpan < (KFGRI.CurrentParZedLifeSpan * class'KFGameConductor'.default.ZedLifeSpanLessSkilledThreshold) )
            {
                MaxLifeSpan = (KFGRI.CurrentParZedLifeSpan * class'KFGameConductor'.default.ZedLifeSpanLessSkilledThreshold);
            }

        	for( i = 0; i < ArrayCount(KFGRI.TotalZedLifeSpanAverageTracker); i++ )
        	{
                if( MaxLifeSpan < KFGRI.TotalZedLifeSpanAverageTracker[i] )
                {
                    MaxLifeSpan = KFGRI.TotalZedLifeSpanAverageTracker[i];
                }
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.TotalZedLifeSpanAverageTracker)),(MaxLifeSpan - KFGRI.TotalZedLifeSpanAverageTracker[i]));
        	}
        }

        // Scale the graph to the screen size
        ScaleX = Canvas.ClipX/1920.0;

        // Set the location and size of the graph
        UL_X = 1350 * ScaleX;
        UL_Y = 100 * ScaleX;
        W = 500 * ScaleX;
        H = 250 * ScaleX;

        Canvas.DrawDebugGraphBackground("Zed Lifespan Average", UL_X, UL_Y, W, H);
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,MaxLifeSpan), MakeColor(0, 255, 0, 255), "Total", 0,KFGRI.TotalZedLifeSpanAverageTracker[i-1]$" AVG");

        if( KFGRI != none )
        {
        	Points.Length = 0;

            for( i = 0; i < ArrayCount(KFGRI.CurrentWaveZedLifeSpanAverageTracker); i++ )
        	{
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.CurrentWaveZedLifeSpanAverageTracker)),(MaxLifeSpan - KFGRI.CurrentWaveZedLifeSpanAverageTracker[i]));
        	}
        }

        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,MaxLifeSpan), MakeColor(255, 128, 0, 255), "Current Wave", 50 * ScaleX,KFGRI.CurrentWaveZedLifeSpanAverageTracker[i-1]$" AVG");

        if( KFGRI != none )
        {
        	Points.Length = 0;

            for( i = 0; i < ArrayCount(KFGRI.RecentZedLifeSpanAverageTracker); i++ )
        	{
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.RecentZedLifeSpanAverageTracker)),(MaxLifeSpan - KFGRI.RecentZedLifeSpanAverageTracker[i]));
        	}
        }

        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,MaxLifeSpan), MakeColor(0, 255, 255, 255), "Rolling AVG", 135 * ScaleX,KFGRI.RecentZedLifeSpanAverageTracker[i-1]$" AVG");

        Points.Length = 0;
        Points[Points.Length] = vect2d(0,MaxLifeSpan - KFGRI.CurrentParZedLifeSpan);
        Points[Points.Length] = vect2d(100,MaxLifeSpan - KFGRI.CurrentParZedLifeSpan);
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,MaxLifeSpan), MakeColor(255, 255, 255, 255), "Base LifeSpan", 225 * ScaleX,FFloor(KFGRI.CurrentParZedLifeSpan)$"S");

        Points.Length = 0;
        Points[Points.Length] = vect2d(0,MaxLifeSpan - (KFGRI.CurrentParZedLifeSpan * class'KFGameConductor'.default.ZedLifeSpanHighlySkilledThreshold));
        Points[Points.Length] = vect2d(100,MaxLifeSpan - (KFGRI.CurrentParZedLifeSpan * class'KFGameConductor'.default.ZedLifeSpanHighlySkilledThreshold));
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,MaxLifeSpan), MakeColor(255, 0, 0, 255), "High Skill", 325 * ScaleX,FFloor((KFGRI.CurrentParZedLifeSpan * class'KFGameConductor'.default.ZedLifeSpanHighlySkilledThreshold))$"S");

        Points.Length = 0;
        Points[Points.Length] = vect2d(0,MaxLifeSpan - (KFGRI.CurrentParZedLifeSpan * class'KFGameConductor'.default.ZedLifeSpanLessSkilledThreshold));
        Points[Points.Length] = vect2d(100,MaxLifeSpan - (KFGRI.CurrentParZedLifeSpan * class'KFGameConductor'.default.ZedLifeSpanLessSkilledThreshold));
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,MaxLifeSpan), MakeColor(255, 255, 0, 255), "Low Skill", 425 * ScaleX,FFloor((KFGRI.CurrentParZedLifeSpan * class'KFGameConductor'.default.ZedLifeSpanLessSkilledThreshold))$"S");
    }
	else if( CurrentGameConductorDebugMode == EGCDM_Status )
	{
        KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

        if( KFGRI != none )
        {
        	for( i = 0; i < ArrayCount(KFGRI.PlayersHealthStatusTracker); i++ )
        	{
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.PlayersHealthStatusTracker)),(100.0 - KFGRI.PlayersHealthStatusTracker[i] * 100.0));
        	}
        }

        // Scale the graph to the screen size
        ScaleX = Canvas.ClipX/1920.0;

        // Set the location and size of the graph
        UL_X = 1350 * ScaleX;
        UL_Y = 100 * ScaleX;
        W = 500 * ScaleX;
        H = 250 * ScaleX;

        Canvas.DrawDebugGraphBackground("Players Status", UL_X, UL_Y, W, H);
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,100), MakeColor(255, 0, 0, 255), "Health Status", 0,FFloor(KFGRI.PlayersHealthStatusTracker[i-1] * 100.0)$" Health");

        if( KFGRI != none )
        {
        	Points.Length = 0;

            for( i = 0; i < ArrayCount(KFGRI.PlayersAmmoStatusTracker); i++ )
        	{
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.PlayersAmmoStatusTracker)),(100.0 - KFGRI.PlayersAmmoStatusTracker[i] * 100));
        	}
        }

        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,100), MakeColor(255, 255, 0, 255), "Ammo Status", 120 * ScaleX,FFloor(KFGRI.PlayersAmmoStatusTracker[i-1] * 100.0)$" Ammo");

        if( KFGRI != none )
        {
        	Points.Length = 0;

            for( i = 0; i < ArrayCount(KFGRI.AggregatePlayersStatusTracker); i++ )
        	{
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.AggregatePlayersStatusTracker)),(100.0 - KFGRI.AggregatePlayersStatusTracker[i] * 100));
        	}
        }

        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,100), MakeColor(0, 255, 255, 255), "Overall Status", 240 * ScaleX,FFloor(KFGRI.AggregatePlayersStatusTracker[i-1] * 100.0)$" Overall");
    }
	else if( CurrentGameConductorDebugMode == EGCDM_GameplayAdjustments )
	{
        KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

        if( KFGRI != none )
        {
        	for( i = 0; i < ArrayCount(KFGRI.ZedMovementSpeedModifierTracker); i++ )
        	{
                if( MaxLifeSpan < KFGRI.ZedMovementSpeedModifierTracker[i] )
                {
                    MaxLifeSpan = KFGRI.ZedMovementSpeedModifierTracker[i];
                }
        	}

            for( i = 0; i < ArrayCount(KFGRI.ZedSpawnRateModifierTracker); i++ )
        	{
                if( MaxLifeSpan < KFGRI.ZedSpawnRateModifierTracker[i] )
                {
                    MaxLifeSpan = KFGRI.ZedSpawnRateModifierTracker[i];
                }
        	}

        	for( i = 0; i < ArrayCount(KFGRI.ZedMovementSpeedModifierTracker); i++ )
        	{
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.ZedMovementSpeedModifierTracker)),(MaxLifeSpan - KFGRI.ZedMovementSpeedModifierTracker[i]));
        	}

        	if( KFGameInfo(WorldInfo.Game) != none )
        	{
                if( MaxLifeSpan < KFGameInfo(WorldInfo.Game).DifficultyInfo.GetAIGroundSpeedMod() )
                {
                    MaxLifeSpan = KFGameInfo(WorldInfo.Game).DifficultyInfo.GetAIGroundSpeedMod();
                }
        	}
        }

        // Scale the graph to the screen size
        ScaleX = Canvas.ClipX/1920.0;

        // Set the location and size of the graph
        UL_X = 1350 * ScaleX;
        UL_Y = 100 * ScaleX;
        W = 500 * ScaleX;
        H = 250 * ScaleX;

        if( KFGRI.bVersusGame )
        {
            Canvas.DrawDebugGraphBackground("Gameplay Modifications VersusZedHealthMod: "$KFGRI.VersusZedHealthMod$" VersusZedDamageMod: "$KFGRI.VersusZedDamageMod, UL_X, UL_Y, W, H);
        }
        else
        {
            Canvas.DrawDebugGraphBackground("Gameplay Modifications", UL_X, UL_Y, W, H);
        }
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,MaxLifeSpan), MakeColor(0, 255, 0, 255), "Zed Move Speed", 0,KFGRI.ZedMovementSpeedModifierTracker[i-1]$"X");

        if( KFGRI != none )
        {
        	Points.Length = 0;

            for( i = 0; i < ArrayCount(KFGRI.ZedSpawnRateModifierTracker); i++ )
        	{
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.ZedSpawnRateModifierTracker)),(MaxLifeSpan - KFGRI.ZedSpawnRateModifierTracker[i]));
        	}
        }

        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,MaxLifeSpan), MakeColor(255, 128, 0, 255), "Spawn Rate Mod", 150 * ScaleX,KFGRI.ZedSpawnRateModifierTracker[i-1]$"X");

        if( KFGameInfo(WorldInfo.Game) != none )
        {
            Points.Length = 0;
            Points[Points.Length] = vect2d(0,MaxLifeSpan - KFGameInfo(WorldInfo.Game).DifficultyInfo.GetAIGroundSpeedMod());
            Points[Points.Length] = vect2d(100,MaxLifeSpan - KFGameInfo(WorldInfo.Game).DifficultyInfo.GetAIGroundSpeedMod());
            Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,100), MakeColor(0, 255, 255, 255), "Base Speed Mod", 250 * ScaleX,KFGameInfo(WorldInfo.Game).DifficultyInfo.GetAIGroundSpeedMod()$"X");
        }
    }
	else if( CurrentGameConductorDebugMode == EGCDM_ZedSpawning )
	{
        KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

        if( KFGRI != none )
        {
            for( i = 0; i < ArrayCount(KFGRI.ZedSpawnRateTracker); i++ )
        	{
                if( MaxLifeSpan < KFGRI.ZedSpawnRateTracker[i] )
                {
                    MaxLifeSpan = KFGRI.ZedSpawnRateTracker[i];
                }
        	}


        	for( i = 0; i < ArrayCount(KFGRI.ZedSpawnRateTracker); i++ )
        	{
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.ZedSpawnRateTracker)),(MaxLifeSpan - KFGRI.ZedSpawnRateTracker[i]));
        	}
        }

        // Scale the graph to the screen size
        ScaleX = Canvas.ClipX/1920.0;

        // Set the location and size of the graph
        UL_X = 1350 * ScaleX;
        UL_Y = 100 * ScaleX;
        W = 500 * ScaleX;
        H = 250 * ScaleX;

        Canvas.DrawDebugGraphBackground("Zed Spawning", UL_X, UL_Y, W, H);
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,MaxLifeSpan), MakeColor(0, 255, 0, 255), "Zed Spawn Delay", 0,KFGRI.ZedSpawnRateTracker[i-1]$" S");
    }
	else if( CurrentGameConductorDebugMode == EGCDM_OverallRankAndSkill )
	{
        KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

        if( KFGRI != none )
        {
        	for( i = 0; i < ArrayCount(KFGRI.OverallRankAndSkillModifierTracker); i++ )
        	{
                Points[Points.Length] = vect2d(i * Float(ArrayCount(KFGRI.OverallRankAndSkillModifierTracker)),(100 - KFGRI.OverallRankAndSkillModifierTracker[i] * 100));
        	}
        }

        // Scale the graph to the screen size
        ScaleX = Canvas.ClipX/1920.0;

        // Set the location and size of the graph
        UL_X = 1350 * ScaleX;
        UL_Y = 100 * ScaleX;
        W = 500 * ScaleX;
        H = 250 * ScaleX;

        Canvas.DrawDebugGraphBackground("Overall Rank And Skill Modifier. GameConductor Status: "$GetEnum(enum'EGameConductorStatus', KFGRI.CurrentGameConductorStatus), UL_X, UL_Y, W, H);
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,100), MakeColor(128, 255, 255, 255), "Overall Rank and Skill", 0,KFGRI.OverallRankAndSkillModifierTracker[i-1]);

        Points.Length = 0;
        Points[Points.Length] = vect2d(0,50);
        Points[Points.Length] = vect2d(100,50);
        Canvas.DrawDebugGraphElement(Points, UL_X, UL_Y, W, H, vect2d(0,100), vect2d(0,100), MakeColor(255, 255, 255, 255), "Baseline", 225 * ScaleX,"0.5");
    }
`endif
}

`if(`notdefined(ShippingPC))
/** Current debugging mode for the game conductor display*/
simulated exec function NextGraphMode()
{
	switch ( CurrentGameConductorDebugMode )
	{
	case EGCDM_OverallRankAndSkill:
        CurrentGameConductorDebugMode = EGCDM_GameplayAdjustments;
		break;
	case EGCDM_GameplayAdjustments:
        CurrentGameConductorDebugMode = EGCDM_Skill;
		break;
	case EGCDM_Skill:
        CurrentGameConductorDebugMode = EGCDM_OverallAccuracy;
		break;
	case EGCDM_OverallAccuracy:
        CurrentGameConductorDebugMode = EGCDM_LifeSpan;
		break;
	case EGCDM_LifeSpan:
        CurrentGameConductorDebugMode = EGCDM_Status;
		break;
	case EGCDM_Status:
		CurrentGameConductorDebugMode = EGCDM_ZedSpawning;
		break;
	case EGCDM_ZedSpawning:
		CurrentGameConductorDebugMode = EGCDM_OverallRankAndSkill;
		break;
	default:
		CurrentGameConductorDebugMode = EGCDM_OverallRankAndSkill;
		break;
    }
}

/** Toggle the game conductor graph */
simulated exec function ToggleGraph()
{
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if ( KFGRI != none )
	{
	 	KFGRI.bGameConductorGraphingEnabled = !KFGRI.bGameConductorGraphingEnabled;

        ServerEnableConductorGraph(KFGRI.bGameConductorGraphingEnabled);

        if( MyHud != none )
        {
            MyHud.bShowDebugInfo = KFGRI.bGameConductorGraphingEnabled;

            if( KFGRI.bGameConductorGraphingEnabled && !MyHud.ShouldDisplayDebug('Conductor') )
            {
                MyHud.DebugDisplay[MyHud.DebugDisplay.Length] = 'Conductor';
            }

            if( !KFGRI.bGameConductorGraphingEnabled && MyHud.ShouldDisplayDebug('Conductor') )
    		{
    			MyHud.DebugDisplay.RemoveItem('Conductor');
    		}

       		MyHud.SaveConfig();
        }
	}
}

/** Enable the tracking map on the server */
reliable server function ServerEnableConductorGraph( bool bEnabled )
{
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if ( KFGRI != none )
	{
	 	KFGRI.bGameConductorGraphingEnabled = bEnabled;
	}
}

/** Toggle the tracking map */
simulated exec function ToggleTracker()
{
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if ( KFGRI != none )
	{
	 	KFGRI.bTrackingMapEnabled = !KFGRI.bTrackingMapEnabled;

        ServerEnableTrackingMap(KFGRI.bTrackingMapEnabled);

        if( MyHud != none )
        {
            MyHud.bShowDebugInfo = KFGRI.bTrackingMapEnabled;

            if( !MyHud.ShouldDisplayDebug('Map') )
            {
                MyHud.DebugDisplay[MyHud.DebugDisplay.Length] = 'Map';
            }

       		MyHud.SaveConfig();
        }
	}
}

/** Enable the tracking map on the server */
reliable server function ServerEnableTrackingMap( bool bEnabled )
{
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if ( KFGRI != none )
	{
	 	KFGRI.bTrackingMapEnabled = bEnabled;
	}
}

/** Increase tracking range preset */
simulated exec function NextTrackingMode()
{
	switch ( CurrentTrackingMode )
	{
	case ETM_All:
        CurrentTrackingMode = ETM_AllButTargeting;
		break;
	case ETM_AllButTargeting:
        CurrentTrackingMode = ETM_PawnsOnly;
		break;
	case ETM_PawnsOnly:
		CurrentTrackingMode = ETM_PawnsAndTargetingOnly;
		break;
	case ETM_PawnsAndTargetingOnly:
		CurrentTrackingMode = ETM_SpawnsOnly;
		break;
	case ETM_SpawnsOnly:
		CurrentTrackingMode = ETM_FailedSpawnsOnly;
		break;
	case ETM_FailedSpawnsOnly:
		CurrentTrackingMode = ETM_HumansAndSpawnsOnly;
		break;
	case ETM_HumansAndSpawnsOnly:
		CurrentTrackingMode = ETM_PickupsOnly;
		break;
	case ETM_PickupsOnly:
		CurrentTrackingMode = ETM_All;
		break;
	default:
		CurrentTrackingMode = ETM_All;
		break;
    }
}

/** Toggle top down or side view */
simulated exec function ToggleMapView()
{
    bTrackingMapTopView = !bTrackingMapTopView;
}

/** Set the tracking range */
simulated exec function SetTrackingRange(float NewRange)
{
    CurrentTrackerRangeMode=ETR_Custom;
    TrackingMapRange = NewRange;
}

/** Increase tracking range preset */
simulated exec function NextTrackingRange()
{
    if( CurrentTrackerRangeMode == ETR_Custom )
    {
        if( TrackingMapRange < 1000 )
        {
            // Do nothing
        }
        else if( TrackingMapRange >= 1000 && TrackingMapRange < 2500 )
        {
            CurrentTrackerRangeMode = ETR_10Meters;
        }
        else if( TrackingMapRange < 5000 )
        {
            CurrentTrackerRangeMode = ETR_25Meters;
        }
        else if( TrackingMapRange < 10000 )
        {
            CurrentTrackerRangeMode = ETR_50Meters;
        }
        else
        {
            CurrentTrackerRangeMode = ETR_100Meters;
        }
    }

	switch ( CurrentTrackerRangeMode )
	{
	case ETR_10Meters:
        CurrentTrackerRangeMode = ETR_25Meters;
		TrackingMapRange = 2500;
		break;
	case ETR_25Meters:
		TrackingMapRange = 5000;
		CurrentTrackerRangeMode = ETR_50Meters;
		break;
	case ETR_50Meters:
		TrackingMapRange = 10000;
		CurrentTrackerRangeMode = ETR_100Meters;
		break;
	case ETR_100Meters:
		TrackingMapRange = 25000;
		CurrentTrackerRangeMode = ETR_250Meters;
		break;
	case ETR_250Meters:
		TrackingMapRange = 25000;
		break;
	default:
		TrackingMapRange = 1000;
		CurrentTrackerRangeMode = ETR_10Meters;
		break;
    }
}

/** Decrease tracking range preset */
simulated exec function PreviousTrackingRange()
{
    if( CurrentTrackerRangeMode == ETR_Custom )
    {
        if( TrackingMapRange < 2500 )
        {
            CurrentTrackerRangeMode = ETR_10Meters;
        }
        else if( TrackingMapRange < 5000 )
        {
            CurrentTrackerRangeMode = ETR_25Meters;
        }
        else if( TrackingMapRange < 10000 )
        {
            CurrentTrackerRangeMode = ETR_50Meters;
        }
        else if( TrackingMapRange < 25000 )
        {
            CurrentTrackerRangeMode = ETR_100Meters;
        }
    }

	switch ( CurrentTrackerRangeMode )
	{
	case ETR_250Meters:
		TrackingMapRange = 10000;
		CurrentTrackerRangeMode = ETR_100Meters;
		break;
	case ETR_100Meters:
		TrackingMapRange = 5000;
		CurrentTrackerRangeMode = ETR_50Meters;
		break;
	case ETR_50Meters:
		TrackingMapRange = 2500;
		CurrentTrackerRangeMode = ETR_25Meters;
		break;
	case ETR_25Meters:
		TrackingMapRange = 1000;
		CurrentTrackerRangeMode = ETR_10Meters;
		break;
	case ETR_10Meters:
		TrackingMapRange = 1000;
		break;
	default:
		TrackingMapRange = 25000;
		CurrentTrackerRangeMode = ETR_250Meters;
		break;
    }
}

/** Toggle the wave debug display */
simulated exec function ToggleWaveDebug()
{
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if ( KFGRI != none )
	{
        KFGRI.bDebugSpawnManager = !KFGRI.bDebugSpawnManager;

        ServerEnableWaveDebug(KFGRI.bDebugSpawnManager);

        if( MyHud != none )
        {
            MyHud.bShowDebugInfo = KFGRI.bDebugSpawnManager;

    		// remove debugtype if already in array
    		if (INDEX_NONE != MyHud.DebugDisplay.RemoveItem('SpawnWaves'))
    		{
    			MyHud.SaveConfig();
    		}

            if( KFGRI.bDebugSpawnManager && !MyHud.ShouldDisplayDebug('SpawnWaves') )
            {
                MyHud.DebugDisplay[MyHud.DebugDisplay.Length] = 'SpawnWaves';
            }

       		MyHud.SaveConfig();
        }
	}
}

/** Enable the wave debug on the server */
reliable server function ServerEnableWaveDebug( bool bEnabled )
{
	local KFGameReplicationInfo KFGRI;
	local KFAISpawnManager KFSM;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if ( KFGRI != none )
	{
	 	KFGRI.bDebugSpawnManager = bEnabled;
	 	KFSM = KFGameInfo( WorldInfo.Game ).SpawnManager;
	 	if( KFSM != none )
        {
            KFGRI.CurrentSineWavFreq = KFSM.GetSineWaveFreq();
            KFGRI.CurrentSineMod = KFSM.GetSineMod();
    		KFGRI.CurrentNextSpawnTimeMod = KFSM.GetNextSpawnTimeMod();
    		KFGRI.CurrentMaxMonsters = KFSM.GetMaxMonsters();
	 	}
	}
}

`endif

function DrawNextSpawnTimeInfo( out Canvas Canvas, /*out KFAISpawnManager KFSM,*/ float XPos, float YPos, float Buffer )
{
	local KFMapInfo KFMI;
	local float MapSpawnTime;
	local KFGameReplicationInfo KFGRI;

   	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
   	if( KFGRI != none )
   	{
        KFMI = KFMapInfo(WorldInfo.GetMapInfo());
    	MapSpawnTime = KFMI != none ? KFMI.WaveSpawnPeriod : class'KFMapInfo'.default.WaveSpawnPeriod;

        DrawNextDebugLine( Canvas, Buffer, YPos, false, "(Y Axis) Zed Spawning Intensity " @ 1 - KFGRI.CurrentSineMod, Xpos );
       	DrawNextDebugLine( Canvas, Buffer, YPos, true, "Base Map Spawn Time: " @MapSpawnTime, Xpos );
       	DrawNextDebugLine( Canvas, Buffer, YPos, false, "Length and Num Players Modifier: " @KFGRI.CurrentNextSpawnTimeMod, Xpos );

    	if ( KFGRI.CurrentMaxMonsters <= KFGRI.CurrentAIAliveCount )
    	{
       		DrawNextDebugLine( Canvas, Buffer, YPos, false, "Max Monsters Reached", Xpos );
    	}
    	else if ( KFGRI.bCurrentSMFinishedSpawning )
    	{
       		DrawNextDebugLine( Canvas, Buffer, YPos, false, "All zeds are in game", Xpos );
    	}
    	else
    	{
       		DrawNextDebugLine( Canvas, Buffer, YPos, false, "Time until next spawn: " @KFGRI.CurrentTimeTilNextSpawn, Xpos );
       		DrawNextDebugLine( Canvas, Buffer, YPos, false, "Current spawn delay: " @KFGRI.CurrentNextSpawnTime, Xpos );
    	}

       	DrawNextDebugLine( Canvas, Buffer, YPos, true, KFGRI.CurrentAIAliveCount @"/" @ KFGRI.CurrentMaxMonsters @"Zeds In Game", Xpos );
   	}
}

`if(`notdefined(ShippingPC))
reliable client function ClientDrawDebugLine(vector LineStart, vector LineEnd, bool bPersistent, bool bClear, Color LineColor)
{
	if( bClear )
	{
		FlushPersistentDebugLines();
	}

	DrawDebugLine(LineStart,LineEnd, LineColor.R,LineColor.G,LineColor.B,bPersistent);// green
}


reliable client function ClientDrawDebugSphere(vector SphereLocation, float SphereRadius, bool bPersistent, bool bClear)
{
	if( bClear )
	{
		FlushPersistentDebugLines();
	}
	DrawDebugSphere(SphereLocation,SphereRadius,8,0,255,0,bPersistent);// green
}

reliable client function ClientDrawDebugCylinder(vector CylinderLocation, float CylinderRadius, float CylinderLength, rotator CylinderRotation, bool bPersistent, bool bClear)
{
	local vector X,Y,Z;

	if( bClear )
	{
		FlushPersistentDebugLines();
	}
	GetAxes(CylinderRotation,X,Y,Z);
	DrawDebugCylinder(CylinderLocation - Z * CylinderLength, CylinderLocation + Z * CylinderLength, CylinderRadius, 8, 0, 255, 0, bPersistent);  // green
}
`endif

/*********************************************************************************************
 * @name Object
 *********************************************************************************************/

event Destroyed()
{
	local KFProjectile KFProj;

    // Stop currently playing stingers when the map is being switched
    if( StingerAkComponent != none )
    {
        StingerAkComponent.StopEvents();
    }

    SetRTPCValue( 'Health', 100, true );
    PostAkEvent( LowHealthStopEvent );
	bPlayingLowHealthSFX = false;

	// Update projectiles in the world
	foreach DynamicActors( class'KFProjectile', KFProj )
	{
		if( KFProj.InstigatorController == self )
		{
			KFProj.OnInstigatorControllerLeft();
		}
	}

	// Clear any clientside-only gameplay data from pool manager
	if( WorldInfo != none && WorldInfo.NetMode == NM_Client )
	{
	    class'KFGameplayPoolManager'.static.GetPoolManager().Reset();	
	}

	Super.Destroyed();
}

/*********************************************************************************************
 * State Dead
 * Pawn is dead, return to spectating after a short while
 *********************************************************************************************/
state Dead
{
	event BeginState(Name PreviousStateName)
	{
		local KFPawn KFP;
		local KFPlayerInput KFPI;

		Super.BeginState( PreviousStateName );

		// Allow suicide cam to linger a tiny bit longer
		if( PlayerCamera.CameraStyle == 'ZedSuicide' )
		{
			SetTimer( 6.f, false, nameOf(StartSpectate) );
		}
		else
		{
			SetTimer( 5.f, false, nameOf(StartSpectate) );
		}

        // Deactivate any post process effects when we die
		ResetGameplayPostProcessFX();

		// setup for first-person death
		KFP = KFPawn(ViewTarget);

		if( KFP != none && UsingFirstPersonCamera() )
		{
			KFP.Mesh.SetOwnerNoSee( true );
			KFP.Mesh.CastShadow = false;
			KFP.SetThirdPersonAttachmentVisibility( false );
			KFP.SetFirstPersonVisibility( false );
		}

		if(CurrentPerk != none)
		{
			CurrentPerk.PlayerDied();
		}

		KFPI = KFPlayerInput(PlayerInput);

		if(KFPI != none)
		{
			KFPI.HideVoiceComms();
		}

		if( MyGFxManager != none )
		{
			MyGFxManager.CloseMenus();
		}

		if(MyGFxHUD != none )
		{
			MyGFxHUD.PawnDied();
		}


	}

	exec function StartFire( optional byte FireModeNum )
	{
		StartSpectate();
	}

	function SetViewTarget( Actor NewViewTarget, optional ViewTargetTransitionParams TransitionParams )
	{
		if( PlayerCamera.CameraStyle == 'Boss' )
		{
			super.SetViewTarget( NewViewTarget, TransitionParams );
		}
		// do nothing / don't allow switch during this state
	}

	event EndState( Name NextStateName )
	{
		local KFPawn KFP;

		Super.EndState( NextStateName );
		ClearTimer( nameof(StartSpectate) );

		// undo setup for first-person death
		KFP = KFPawn(ViewTarget);
		if( KFP != none )
		{
			KFP.Mesh.CastShadow = KFP.Mesh.default.CastShadow;
		}

        // Show the spectating hud
		NotifyChangeSpectateViewTarget();
	}

	/** ResetCameraMode is called from PlayerController:Dead::EndState and set the cam mode for both clients and server. We only want the server to do that. */
	event ResetCameraMode()
	{
		if( Role == ROLE_Authority )
		{
			Global.ResetCameraMode();
		}
	}
}

/**
 * Should be to instigate a transition to spectating, automatically handles notifying server or notifying the owning client as necessary.
 */
function StartSpectate( optional Name SpectateType )
{
	if ( Role == ROLE_Authority )
	{
		if( IsLocalPlayerController() )
		{
			ClientGotoState( 'Spectating' );
		}
		else
		{
			GotoState( 'Spectating' );
			ClientGotoState( 'Spectating' );
		}
	}
}

/*********************************************************************************************
 * State Spectating
 * View other players on your team
 *********************************************************************************************/
simulated function NextSpectateMode();

unreliable server function ServerSetSpectatorActive();

function MoveToValidSpectatorLocation()
{
	local PlayerStart PS;
	local vector CameraLocation;

	// Make sure that our freecam isn't trapped in the lobby
	foreach AllActors( class'PlayerStart', PS )
	{
		CameraLocation = PS.Location + ( vect(0,0,1) * (PS.CylinderComponent.CollisionHeight * 2.f) );
		SetLocation( CameraLocation );
		ServerSetSpectatorLocation( CameraLocation );
		SetRotation( rot(-1024,0,0) );
		break;
	}
}

state Spectating
{
	event BeginState(Name PreviousStateName)
	{
		local KFGFxHudWrapper GFxHUDWrapper;
		local KFPlayerReplicationInfo KFPRI;

		GFxHUDWrapper = KFGFxHudWrapper(myHUD);
		if( GFxHUDWrapper != none)
		{
		    GFxHUDWrapper.CreateHUDMovie();
		}
		// Make sure we nuke our customization pawn!
		if( Pawn != none && KFPawn_Customization(Pawn) != none )
		{
			if( WorldInfo.NetMode != NM_Client )
			{
				Pawn.Destroy();
			}
		}

		Super.BeginState(PreviousStateName);

		// Teleport controller to a valid in-world location
		if( IsLocalPlayerController() && !bIsAchievementPlayer )
		{
			MoveToValidSpectatorLocation();
		}

		// Try to get a player to spectate right away
		if( WorldInfo.NetMode != NM_Client )
		{
			if( ViewTarget == none || ViewTarget == self || ViewTarget.bDeleteMe || (Pawn(ViewTarget) != none && !Pawn(ViewTarget).IsAliveAndWell()) )
			{
				ServerViewNextPlayer();
			}

			// Put us in roaming if our viewtarget is ourself
			if( ViewTarget == self )
			{
				SpectateRoaming();
			}
			else
			{
				SpectatePlayer( SMODE_PawnFreeCam );
			}
		}

		if( MyGFxHUD != none )
		{
			MyGFxHUD.SetHUDSpectating(true);
		}

		NotifyChangeSpectateViewTarget();

		// If we end up spectating in standalone, toggle health FX off
		if( WorldInfo.NetMode == NM_StandAlone )
		{
			ToggleHealthEffects(false);
		}

		if( IsLocalPlayerController() && !bIsAchievementPlayer && WorldInfo.GRI.ElapsedTime > 2.f )
		{
			MoveToValidSpectatorLocation();
		}
		KFPRI = KFPlayerReplicationInfo(PlayerReplicationInfo);
		if(KFPRI != none)
		{
			KFPRI.PlayerHealth = 0;
			KFPRI.PlayerHealthPercent = 0;
			KFPRI.bNetDirty = true;				
		}
	}

	exec function StartFire(optional BYTE FireModeNum)
	{

	}

	exec function SpectateNextPlayer()
	{
		ServerViewNextPlayer();
		NotifyChangeSpectateViewTarget();
	}

	exec function SpectatePreviousPlayer()
	{
		ServerViewPrevPlayer();
		NotifyChangeSpectateViewTarget();
	}

	exec function SpectateChangeCamMode()
	{
		ServerNextSpectateMode();
		NotifyChangeSpectateViewTarget();
	}

	event EndState(Name NextStateName)
	{
		Super.EndState(NextStateName);

		if( MyGFxHUD != none )
		{
			MyGFxHUD.SetHUDSpectating( false );
		}
	}

	// overridden (copy-pasted) to pass rotation delta to ReplicateMove
	function PlayerMove(float DeltaTime)
	{
		local vector X,Y,Z;

// BEGIN MOD
		local rotator OldRotation;
		OldRotation = Rotation;
// END MOD

		GetAxes(Rotation,X,Y,Z);
		Acceleration = PlayerInput.aForward*X + PlayerInput.aStrafe*Y + PlayerInput.aUp*vect(0,0,1);
		UpdateRotation(DeltaTime);

		if (Role < ROLE_Authority) // then save this move and replicate it
		{
			ReplicateMove(DeltaTime, Acceleration, DCLICK_None, rot(0,0,0));

// BEGIN MOD
			// only done for clients, as LastActiveTime only affects idle kicking
			if( (!IsZero(Acceleration) || OldRotation != Rotation) && `TimeSince(LastUpdateSpectatorActiveTime) > UpdateSpectatorActiveInterval )
			{
				LastUpdateSpectatorActiveTime = WorldInfo.TimeSeconds;
				ServerSetSpectatorActive();
			}
// END MOD
		}
		else
		{
			ProcessMove(DeltaTime, Acceleration, DCLICK_None, rot(0,0,0));
		}
	}

	unreliable server function ServerSetSpectatorActive()
	{
		LastActiveTime = WorldInfo.TimeSeconds;
	}

	function SetViewTarget( Actor NewViewTarget, optional ViewTargetTransitionParams TransitionParams )
	{
		if( NewViewTarget != ViewTarget )
		{
			NotifyChangeSpectateViewTarget();
		}

		global.SetViewTarget( NewViewTarget, TransitionParams );
	}
}

/** Called when view target is changed while in spectating state */
function NotifyChangeSpectateViewTarget()
{
	local KFPlayerReplicationInfo KFPRI;
	local KFPawn KFP;

	KFP = KFPawn(ViewTarget);

	// Avoids an issue where spectate hud is briefly visible before spawning for the first time
	if(  WorldInfo.GRI == none || WorldInfo.GRI.ElapsedTime < 2.f )
	{
		return;
	}

	if( MyGFxHUD != none && MyGFxHUD.SpectatorInfoWidget != none && KFP != none )
	{
		if( KFP == Pawn && Pawn.IsAliveAndWell() )
		{
			return;
		}

		// Try to get a valid PRI, default to our own if we can't
		if( KFP.PlayerReplicationInfo != none )
		{
			KFPRI = KFPlayerReplicationInfo(KFP.PlayerReplicationInfo);
		}
		else
		{
			KFPRI = KFPlayerReplicationInfo(PlayerReplicationInfo);
		}

		if( KFPRI != none)
		{
			MyGFxHUD.SpectatorInfoWidget.SetSpectatedKFPRI(KFPRI);
		}
	}
}

reliable client event ClientSetViewTarget( Actor A, optional ViewTargetTransitionParams TransitionParams )
{
	local vector ViewLocation;
	local rotator ViewRotation;

    // Set the camera location to where we are viewing when we switch viewtargets
    // while spectating. This fixes issues where when we switch back to viewing
    // ourself, the camera is off in some strange area of the map, or worse
    // the customization room
    if( IsSpectating() )
    {
        GetPlayerViewPoint( ViewLocation, ViewRotation );

        SetLocation(ViewLocation);
        ViewRotation.Roll=0;
        SetRotation(ViewRotation);

        ServerSetSpectatorLocation(Location);
    }

	super.ClientSetViewTarget( A, TransitionParams);
	if( IsSpectating() && ViewTarget != none )
	{
		NotifyChangeSpectateViewTarget();
	}
}

/** Switches between spectating modes (first-person, third-person, etc.) */
unreliable server function ServerNextSpectateMode()
{
	local KFPawn HumanViewTarget;

	if( !IsSpectating() )
	{
		return;
	}

	// switch to roaming if human viewtarget is dead
	if( CurrentSpectateMode != SMODE_Roaming )
	{
		HumanViewTarget = KFPawn(ViewTarget);
		if( HumanViewTarget == none || !HumanViewTarget.IsAliveAndWell() )
		{
			SpectateRoaming();
			return;
		}
	}

	switch ( CurrentSpectateMode )
	{
	case SMODE_PawnFreeCam:
		SpectatePlayer( SMODE_PawnThirdPerson );
		break;
	case SMODE_PawnThirdPerson:
		SpectatePlayer( SMODE_PawnFirstPerson );
		break;
	case SMODE_PawnFirstPerson:
		SpectateRoaming();
		break;
	case SMODE_Roaming:
		SpectatePlayer( SMODE_PawnFreeCam );
		break;
	}
}

/** Switches to a spectating mode that targets a player
 * (reliable because this seems to get missed pretty frequently when joining a server as a spectator,
 *  leading to unexpected/confusing spectating views)
 */
function SpectatePlayer( KFSpectateModes Mode )
{
	if( PlayerCamera != none && PlayerCamera.CameraStyle == 'Boss' )
	{
		return;
	}

	CurrentSpectateMode = Mode;

	if( KFPawn_Human(ViewTarget) == none )
	{
		TryViewNextPlayer();

		if ( KFPawn(ViewTarget) == None )
		{
			// if we couldn't find a valid player to target, switch to roaming cam
			SpectateRoaming();
			return;
		}
	}

	// need to have a mode before setting view target (spectating)
	switch( Mode )
	{
	case SMODE_PawnFreeCam:
		SetCameraMode('FreeCam');
		break;

	case SMODE_PawnThirdPerson:
		SetCameraMode('ThirdPerson');
		break;

	case SMODE_PawnFirstPerson:
		SetCameraMode('FirstPerson');
		break;
	};
}

/** Switches to the "roaming" spectating mode, which doesn't target a specific player */
reliable server function SpectateRoaming()
{
	CurrentSpectateMode = SMODE_Roaming;
	ServerViewSelf();
	if ( ViewTarget == self )
	{
		SetCameraMode('FirstPerson');
	}
}

/** Tries to find us a new view target if we don't have one or have an invalid one */
reliable server function TryViewNextPlayer()
{
	local KFPawn KFPTarget;

	KFPTarget = KFPawn( ViewTarget );
	if( KFPTarget == None || KFPTarget.IsAliveAndWell() )
	{
		ServerViewNextPlayer();
	}
}

/** Switches to the next player view target (only in spectating modes that target players) */
unreliable server function ServerViewNextPlayer()
{
	if( IsSpectating() )
	{
		switch ( CurrentSpectateMode )
		{
			case SMODE_PawnFreeCam:
			case SMODE_PawnThirdPerson:
			case SMODE_PawnFirstPerson:
			case SMODE_Roaming:
				if( ViewTarget == self && CurrentSpectateMode != SMODE_PawnFreeCam )
				{
					CurrentSpectateMode = SMODE_PawnFreeCam;
					SetCameraMode( 'FreeCam' );
				}
				ViewAPlayer( +1 );
				break;
		}
	}
}

/** Finds previous spectate view target */
unreliable server function ServerViewPrevPlayer()
{
	if( IsSpectating() )
	{
		switch ( CurrentSpectateMode )
		{
			case SMODE_PawnFreeCam:
			case SMODE_PawnThirdPerson:
			case SMODE_PawnFirstPerson:
			case SMODE_Roaming:
				if( ViewTarget == self )
				{
					CurrentSpectateMode = SMODE_PawnFreeCam;
					SetCameraMode( 'FreeCam' );
				}
				ViewAPlayer( -1 );
				break;
		}
	}
}

/*********************************************************************************************
 * @name Dialog and AAR
 *********************************************************************************************/

/** Submit/replicate post wave game stats for AAR and dialog */
function SubmitPostWaveStats(optional bool bOpeningTrader)
{
	MatchStats.RecordWaveInfo();

	if( Role == ROLE_Authority )
	{
		PWRI.bOpeningTrader = bOpeningTrader;
		PWRI.RepCount++;
	}

	// Trigger trader open dialog after RecordWaveInfo, but before ResetLastWaveInfo!!!
	// @todo: This should get moved to GRI.OpenTrader(), but for now we're
	//  heavily dependant on accurate match stats.
	if ( PWRI.bOpeningTrader && IsLocalController() )
	{
		`TraderDialogManager.PlayBeginTraderTimeDialog( self );
	}
}

function SavePersonalBest(EPersonalBests PersonalBestID, int Value)
{
	StatsWrite.SavePersonalBest(PersonalBestID, Value);
}

function int GetPersonalBest(EPersonalBests PersonalBestID)
{
	return StatsWrite.GetPersonalBest(PersonalBestID);
}

/**
 * Recieve award information from server at end of match
 * @note: Could be optimized by sending data via variable rep (PRI/GRI)
 */
reliable client function ClientReceiveAwardInfo(byte AwardID, PlayerReplicationInfo PRI, int Value)
{
	//@HSL_BEGIN - JRO - 5/17/2016 - PS4 Activity Feeds
	local string AwardName;

	MatchStats.ReceiveAwardInfo(AwardID, PRI, Value);

	if(PRI != None && PRI == PlayerReplicationInfo)
	{
		AwardName = Localize("EphemeralMatchStats", MatchStats.TeamAwardList[AwardID].TitleIdentifier, "KFGame");
		OnlineSub.PlayerInterfaceEx.PostActivityFeedTeamAward(AwardName);
	}
	//@HSL_END
}

/** Network: Local Player only */
reliable client function ReceiveTopWeapons(TopWeaponReplicationInfo TopWeapons)
{
	MatchStats.UnpackTopWeapons(TopWeapons);
}

unreliable client event ClientHearDialog( Actor DialogSpeaker, AkEvent DialogEvent, byte bCanBeMinimized )
{
	local KFPawn KFP;

	// if player wants minimal chatter and the dialog event can be minimized, then don't play it
	if( bCanBeMinimized == 1 && class'KFGameEngine'.default.bMinimalChatter )
	{
		return;
	}

	KFP = KFPawn( DialogSpeaker );

	if( KFP != none )
	{
		KFP.PlayDialogEvent( DialogEvent );
	}
}

function NotifyKilled( Controller Killer, Controller Killed, pawn KilledPawn, class<DamageType> damageType )
{
	local KFPawn_Monster MonsterPawn;

	super.NotifyKilled( Killer, Killed, KilledPawn, damageType );

	MonsterPawn = KFPawn_Monster(KilledPawn);
	if( self == Killer && self != Killed && MonsterPawn != none )
	{
		if( !PWRI.bKilledFleshpoundLastWave && MonsterPawn.IsA('KFPawn_ZedFleshpound') )
		{
			PWRI.bKilledFleshpoundLastWave = true;
		}
		else if( !PWRI.bKilledScrakeLastWave && MonsterPawn.IsA('KFPawn_ZedScrake') )
		{
			PWRI.bKilledScrakeLastWave = true;
		}

		MatchStats.ZedsKilledLastWave++;

		CheckForZedOnDeathAchievements( MonsterPawn );
	}
	// Own death.  Like PawnDied(), but with more input parameters
	else if ( self == Killed )
	{
		// update death streak
		PWRI.bDiedDuringWave = true;

		if( Killer != none && Killer.Pawn != None )
		{
			PWRI.ClassKilledByLastWave = class< KFPawn_Monster >( Killer.Pawn.Class );
		}

		//clear any interaction messages
		ReceiveLocalizedMessage(class'KFLocalMessage_Interaction', IMT_None);

		// Set camera to location of body with a bit of a Z offset
		// NOTE: Prevents camera from snapping back to lobby for a brief duration
		SetLocation( KilledPawn.Location + vect(0,0,1)*(KilledPawn.GetCollisionRadius()*2.f) );
	}
}

native protected function CheckForZedOnDeathAchievements( KFPawn_Monster MonsterPawn );

function PlayTraderDialog( int DialogEventID )
{
	`TraderDialogManager.PlayDialog( DialogEventID, self );
}

reliable client function ClientPlayTraderDialog( int DialogEventID )
{
	`TraderDialogManager.PlayDialog( DialogEventID, self );
}

simulated function PlayTraderSelectItemDialog( bool bTooExpensive, bool bTooHeavy )
{
	`TraderDialogManager.PlaySelectItemDialog( self, bTooExpensive, bTooHeavy );
}

unreliable server function ServerPlayLevelUpDialog()
{
	`DialogManager.PlayLevelUpDialog( self );
}

unreliable server function ServerPlayVoiceCommsDialog( int CommsIndex )
{
	BroadcastLocalizedMessage( class'KFLocalMessage_VoiceComms', CommsIndex, PlayerReplicationInfo );
	`DialogManager.PlayVoiceCommandDialog( KFPawn(Pawn), CommsIndex );
}

exec function PlayVoiceCommsDialog( int CommsIndex )
{
	ServerPlayVoiceCommsDialog( CommsIndex );
}

/*********************************************************************************************
 * Networking
 *********************************************************************************************/

`if(`notdefined(ShippingPC))
exec function TestConnectionPopup(string Title, optional string Description)
{
	ShowConnectionProgressPopup(PMT_Information, Title,Description);
}
`endif

function CancelDownload()
{
	`log("Disconnecting!!!");
	ConsoleCommand("DISCONNECT");
}

reliable client event bool ShowConnectionProgressPopup( EProgressMessageType ProgressType, string ProgressTitle, string ProgressDescription, bool SuppressPasswordRetry = false)
{
	local KFGameEngine KFGEngine;
	local KFGameViewportClient KFGVPC;
	local string CachedTitle, CachedMessage;

	if( MyGFxManager == none)
    {
    	return false;
    }

	KFGVPC = KFGameViewportClient(LocalPlayer(Player).ViewportClient);
   	if( KFGVPC != none && KFGVPC.ErrorTitle != "" )
    {
    	KFGVPC.GetErrorMessage(CachedTitle, CachedMessage);
    }
    else
    {
    	CachedTitle = ProgressTitle;
    	CachedMessage = ProgressDescription;
    }

    switch(ProgressType)
    {
        case    PMT_ConnectionFailure :
        case    PMT_PeerConnectionFailure :
			DestroyOnlineGame();
 			KFGEngine = KFGameEngine( Class'KFGameEngine'.static.GetEngine() );
        	if( KFGEngine != none )
        	{
        		switch (KFGEngine.LastConnectionError)
        		{
        			case CE_WrongPassword:
        			case CE_NeedPassword:
						if ( SuppressPasswordRetry )
						{
	        				MyGFxManager.OpenPopup(ENotification, CachedTitle, CachedMessage, class'KFCommon_LocalizedStrings'.default.OKString);
	        				KFGEngine.LastConnectionError = CE_None;
						}
						else
						{
							MyGFxManager.OpenPopup(EInputPrompt, CachedMessage, "", class'KFCommon_LocalizedStrings'.default.ConfirmString, class'KFCommon_LocalizedStrings'.default.CancelString, OnAttemptPassword);
							KFGEngine.LastConnectionError = CE_None;
						}
        			return true;

        			default:
	        			MyGFxManager.OpenPopup(ENotification, CachedTitle, CachedMessage, class'KFCommon_LocalizedStrings'.default.OKString);
	        			KFGEngine.LastConnectionError = CE_None;
					return true;
        		}
        	}
        break;
        case	PMT_AdminMessage :
        case    PMT_DownloadProgress :
	        MyGFxManager.OpenPopup(EConfirmation, CachedTitle, CachedMessage, "", "", None, None, class'KFCommon_LocalizedStrings'.default.CancelString, CancelDownload);
	        return true;
        break;
    }

    return false;
}

/**
 * Triggered when the 'disconnect' console command is called, to allow cleanup before disconnecting (e.g. for the online subsystem)
 * NOTE: If you block disconnect, store the 'Command' parameter, and trigger ConsoleCommand(Command) when done; be careful to avoid recursion
 */
event bool NotifyDisconnect(string Command)
{
	// See also UnregisterPlayer()
	ClientWriteAndFlushStats();
	DestroyOnlineGame();

	return super.NotifyDisconnect(Command);
}

/** If we have an online game but can't join it or are leaving it, destroy it. */
event DestroyOnlineGame()
{
	//@HSL_BEGIN - JRO - 4/28/2016 - Record the people recently met
	OnlineSub.PlayerInterfaceEx.RecordPlayersRecentlyMet(LocalPlayer(Player).ControllerId, RecentlyMetPlayers, string(PlayerReplicationInfo.SessionName));
	RecentlyMetPlayers.length = 0;
	//@HSL_END

	OnlineSub.GameInterface.DestroyOnlineGame(PlayerReplicationInfo.SessionName);
}

//This is the function that the password prompt points to for onConfirm (confirmButton click or enter key)
function OnAttemptPassword()
{
	local string URL, Password;
	local KFGameViewportClient Viewport;

	Password = KFGFxPopup_InputPrompt(MyGFxManager.CurrentPopup).PlayerInputString;
	Viewport =  KFGameViewportClient(LocalPlayer(Player).ViewportClient);

	URL = "Open" @Viewport.LastConnectionAttemptAddress $"?Password=" $Password;

	ConsoleCommand(URL);
}

function ClearOnlineDelegates()
{
	if( OnlineSub != none )
	{
		OnlineSub.GameInterface.ClearOnlineDelegates();
	}

	super.ClearOnlineDelegates();
}

exec function RequestSwitchTeam();
exec function SwitchTeam(); //disabled

/**
 * @brief Activates/Deactivates the timer that could eventually start to hurt the player (Client)
 *
 * @param bNewActive on/off
 * @param Delay Time we waitr before we start to hurt campers
 */
protected native function SetNoGoActive( bool bNewActive, float Delay );

/**
 * @brief Activates/Deactivates the timer that could eventually start to hurt the player (Server)
 *
 * @param bNewActive on/off
 * @param Delay Time we waitr before we start to hurt campers
 */
reliable protected server event ServerSetNoGoActive( bool bNewActive, float Delay )
{
	bNoGoActive = bNewActive;

	if( bNoGoActive )
	{
		SetTimer( Delay, false, nameOf(MotivatePlayerToMove) );
	}
	else
	{
		ClearTimer( nameOf(MotivatePlayerToMove) );
	}
}

/**
 * @brief Deals some damage to motivate the player to move out if a NoGoVolume
 */
protected function MotivatePlayerToMove()
{
	if( Pawn != none && bNoGoActive )
	{
		Pawn.TakeDamage( (Pawn.HealthMax / 10), self, Pawn.Location, vect(0,0,0), class'KFVersusNoGoVolume'.static.GetNoGoDTClass() );
	}
	else
	{
		bNoGoActive = false;
		ClearTimer( nameOf(MotivatePlayerToMove) );
	}

	SetTimer( class'KFVersusNoGoVolume'.static.GetNoGoHurtInterval(), true, nameOf(MotivatePlayerToMove) );
}

exec function GCF()
{
	if ( MyGFxManager != None )
	{
		MyGFxManager.currentFocus();
	}
}


function OnControllerChanged(int ControllerId,bool bIsConnected)
{
	local LocalPlayer LP;

	// Don't worry about remote players
	LP = LocalPlayer(Player);

	// If the controller that changed, is attached to the this playercontroller
	if (WorldInfo.IsConsoleBuild() &&
		LP != None &&
		LP.ControllerId == ControllerId &&
		!bIsConnected &&
		MyGFxManager != none )
	{
		// Toggle menus if not actively open
		if( !MyGFxManager.bMenusOpen )
		{
			MyGFxManager.ToggleMenus();
		}

		MyGFxManager.OpenPopup(ENotification, Localize("Notifications", "ControllerDisconnectedTitle", "KFGameConsole"), Localize("Notifications", "ControllerDisconnectedPS4Message", "KFGameConsole"), class'KFCommon_LocalizedStrings'.default.OKString);
	}

	Super.OnControllerChanged(ControllerId, bIsConnected);
}

defaultproperties
{
	MatchStatsClass=Class'EphemeralMatchStats'
    InputClass=class'KFGame.KFPlayerInput'
   	CheatClass=class'KFGame.KFCheatManager'
   	CameraClass=class'KFPlayerCamera'

	ServPendingPerkBuild=-1
	ServPendingPerkLevel=-1

	// FOV is overriden by PlayerCamera in 'FixFOV', but setting these anyway
    DesiredFOV=90.0
	DefaultFOV=90.0

    // Set this flag so we check for sound occlusion when sounds play
    bCheckSoundOcclusion=true

	ZedTimeEnterSound=AkEvent'WW_GLO_Runtime.Set_ZEDTime_On'
	ZedTimeExitSound=AkEvent'WW_GLO_Runtime.Set_ZEDTime_Off'
	ZedTimePartialEnterSound=AkEvent'WW_GLO_Runtime.Set_ZEDTime_Partial_On'
	ZedTimePartialExitSound=AkEvent'WW_GLO_Runtime.Set_ZEDTime_Partial_Off'

	PauseWwiseEvent=AkEvent'WW_GLO_Runtime.Pause_All'
	ResumeWwiseEvent=AkEvent'WW_GLO_Runtime.Resume_All'

	EarsRingingPlayEvent=AkEvent'WW_UI_PlayerCharacter.Play_PC_Concussion_Ear_Ring_Loop'
	EarsRingingStopEvent=AkEvent'WW_UI_PlayerCharacter.Stop_PC_Concussion_Ear_Ring_Loop'

	LowHealthStartEvent=AkEvent'WW_UI_PlayerCharacter.Play_UI_Low_Health_LP'
	LowHealthStopEvent=AkEvent'WW_UI_PlayerCharacter.Stop_UI_Low_Health_LP'
	ResetFiltersEvent=AkEvent'WW_UI_PlayerCharacter.Reset_LowPass_Filters'

	FlashlightOnEvent=AkEvent'WW_UI_PlayerCharacter.Play_WEP_Flashlight_TurnOn'
	FlashlightOffEvent=AkEvent'WW_UI_PlayerCharacter.Play_WEP_Flashlight_TurnOff'
	NightVisionOnEvent=AkEvent'WW_UI_PlayerCharacter.Play_WEP_Nightvision_TurnOn'
	NightVisionOffEvent=AkEvent'WW_UI_PlayerCharacter.Play_WEP_Nightvision_TurnOff'

	AllMapCollectiblesFoundEvent=AkEvent'WW_UI_PlayerCharacter.Play_UI_Collectible_CollectAll'

	Begin Object class=AkComponent name=AkComponent_0
		BoneName=Root // needs bone name so Wwise doesn't highjack it
		bStopWhenOwnerDestroyed=true
	End Object
	StingerAkComponent=AkComponent_0
	Components.Add(AkComponent_0)

	// Gameplay Postprocess Effects
	GameplayPostProcessEffectName=GameplayEffect
	EffectPainParamName=Effect_Pain
	PainEffectDuration=0.5f
	EffectLowHealthParamName=Effect_LowHealth
	EffectZedTimeParamName=Effect_ZEDTIME
	EffectNightVisionParamName=Effect_NightVision
	EffectSirenScreamParamName=Effect_Siren
	SonicScreamEffectDuration=6.f
	EffectBloatsPukeParamName=Effect_Puke
	BloatPukeEffectDuration=2.f
	EffectHealParamName=Effect_Heal
	EffectPerkParamName=Effect_PerkSkill
	HealEffectDuration=1.f
	CurrentZEDTimeEffectIntensity=-1.f

	LowHealthThreshold=50
	PartialZEDTimeEffectIntensity=0.35f

	Begin Object Class=PointLightComponent Name=NVGLightTemplate_0
		Brightness=0.05
		Radius=800
		CastShadows=FALSE
		CastStaticShadows=FALSE
		bAIIgnoreLuminosity=TRUE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
		bEnabled=FALSE
		bDisableSpecular=TRUE
	End Object
	NVGLightTemplate=NVGLightTemplate_0

	Begin Object Class=PointLightComponent Name=AmplificationLightTemplate_0
		Brightness=0.02
		Radius=200
		FalloffExponent=2.f
		CastShadows=FALSE
		CastStaticShadows=FALSE
		bAIIgnoreLuminosity=TRUE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
		bEnabled=TRUE
		bDisableSpecular=TRUE
	End Object
	AmplificationLightTemplate=AmplificationLightTemplate_0

	// Depth of field settings
	bDOFEnabled=false
	DOFFocusBlendRate=2.0f
	DOFMaxFocusDepth=5000.0f // 50 meters max focal distance
	DOFMaxEnemyAngle=15.0f // 15 degrees

	DOFFocalRange=0.25f
	DOFFocalAperture=0.2f

	bGamePlayDOFActive=false
	bIronSightsDOFActive=false
	DOF_GP_LerpControl=0.0f
	DOF_IS_LerpControl=0.0f

	DOF_NVG_BlendInSpeed=4.0f
	DOF_NVG_BlendOutSpeed=10.0f

	NVG_FocusBlendRate=3.0f
	NVG_ImageGrainScale=6.0f

	NVG_DOF_FocalDistance=1200.0
	NVG_DOF_SharpRadius=1000.0
	NVG_DOF_FocalRadius=1200.0
	NVG_DOF_MinBlurSize=0.0
	NVG_DOF_MaxNearBlurSize=4.0
	NVG_DOF_MaxFarBlurSize=3.0
	NVG_DOF_ExpFalloff=1.0

	DOF_Cinematic_BlendInSpeed=50.0
	DOF_Cinematic_BlendOutSpeed=10.0
	DOF_Cinematic_FocalDistance=300
	DOF_Cinematic_SharpRadius=200.0
	DOF_Cinematic_FocalRadius=300.0
	DOF_Cinematic_MinBlurSize=0.0
	DOF_Cinematic_MaxNearBlurSize=0.0
	DOF_Cinematic_MaxFarBlurSize=4.0
	DOF_Cinematic_ExpFalloff=1.0

	// Reflections
	bReflectionsEnabled=true
	bBlurEnabled=false;
	BlurStrength=0.0;
	BlurBlendInSpeed=1.0;
	BlurBlendOutSpeed=1.0;
	BlurLerpControl=0.0;

	//NavigationHandleClass=class'KFNavigationHandle'

	PerkList.Add((PerkClass=class'KFPerk_Berserker'))
	PerkList.Add((PerkClass=class'KFPerk_Commando')
	PerkList.Add((PerkClass=class'KFPerk_Support')
	PerkList.Add((PerkClass=class'KFPerk_FieldMedic'))
	PerkList.Add((PerkClass=class'KFPerk_Demolitionist'))
	PerkList.Add((PerkClass=class'KFPerk_Firebug'))
	PerkList.Add((PerkClass=class'KFPerk_Gunslinger'))
	PerkList.Add((PerkClass=class'KFPerk_Sharpshooter'))
	//PerkList.Add((PerkClass=class'KFPerk_MartialArtist'))
	//PerkList.Add((PerkClass=class'KFPerk_SWAT'))

    TrackerXPosition=0.67
    TrackerYPosition=0.025
    TrackingMapScale=1.0
    TrackingMapRange=5000
    CurrentTrackerRangeMode=ETR_Custom
    CurrentTrackingMode=ETM_All
    TrackerSpawnVolumeSizeX=15
    TrackerSpawnVolumeSizeY=13
    bTrackingMapTopView=True

	ScoreTargetDistanceCurve=(Points=((InVal=0.0,OutVal=0.3),(InVal=200.0,OutVal=0.02),(InVal=5000.0,OutVal=0.0)))
	MaxAimCorrectionDistance=10000.f
    bSkipExtraLOSChecks=true

    MusicMessageType=Music

    UpdateSpectatorActiveInterval=1.0

    BenefactorDoshReq=1000
}
