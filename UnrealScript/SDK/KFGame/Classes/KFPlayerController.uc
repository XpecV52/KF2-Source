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

var array<PlayerSteamAvatar>AvatarList;

var array<PerkInfo>		PerkList;
/* Currently selected (active) perk */
var KFPerk    			CurrentPerk;
/** These are updated by the client and exist only on the server. They are used for updating our perk between waves */
var class<KFPerk>		ServPendingPerkClass;
var int					ServPendingPerkBuild;
var int					ServPendingPerkLevel;

var const Name 			MusicMessageType;

/** Has perk xp/level been loaded (local player) */
var	private const bool	bPerkStatsLoaded;

/** Id of previously selected perk */
var public config byte SavedPerkIndex;

var KFPawn_Human UsablePawn;

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

/*********************************************************************************************
 * @name UT Variables
********************************************************************************************* */

/** Controls how often this Player can spam admin commands */
var float NextAdminCmdTime;
var config bool bHideTraderPaths;

/*********************************************************************************************
 * @name UI
********************************************************************************************* */
var KFGFxMoviePlayer_Manager			MyGFxManager;
var KFGFxMoviePlayer_HUD				MyGFxHUD;

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

/*********************************************************************************************
 * @name Dialog and AAR stats 
********************************************************************************************* */

struct native PostWaveReplicationInfo
{
	var Vector 	VectData1; //used for compressing data //X:HeadShots Y:Dosh Earned Z:Damage Dealt
	var Vector 	VectData2;	//used for compressing data //Damage Taken, Heals Received, Heals Given
	
	var byte	LargeZedKills;
	//Dialog
	var byte	DeathStreakStartWave;
	var byte	DeathStreakEndWave;	
	var bool	bBestTeammate; 
	var bool	bKilledMostZeds; 
	var bool	bEarnedMostDosh; 
	var bool	bAllSurvivedLastWave;
	var bool	bSomeSurvivedLastWave;
	var bool	bOneSurvivedLastWave;
	var bool	bKilledFleshpoundLastWave;
	var bool	bKilledScrakeLastWave;

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

/** Whether TargetAdhesion is enabled or not **/
var() config bool bTargetAdhesionEnabled;

var config protected bool bDebugTargetAdhesion;
var config protected bool bDebugAutoTarget;

/** Whether TargetAdhesion is enabled or not **/
var() config bool bAutoTargetEnabled;
/** How long to auto target for when going to iron sights **/
var() float AutoTargetTime;

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
 * @name Navigation
********************************************************************************************* */
//var KFNavigationHandle MyKFNavigationHandle;

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
	}
	if ( VarName == nameof(PWRI) )
	{
		`RecordAARWaveInfo(self);
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

reliable client function ClientRestart(Pawn NewPawn)
{
	Super.ClientRestart(NewPawn);

	if(NewPawn == none)
	{
		return;
	}

	UsablePawn = KFPawn_Human(NewPawn);

	// Reinitialize FOV
    FixFOV();

	// Upon spawning close all menus
	MyGFxManager.CloseMenus();

	// Clear out persistant dead bodies when players respawn
	if( WorldInfo.MyGoreEffectManager != none )
	{
		KFGoreManager(WorldInfo.MyGoreEffectManager).ResetPersistantGore(true);
	}

	// Spawn the amplification light
	if(AmplificationLight == none && AmplificationLightTemplate != none)
	{
		AmplificationLight = new(self) Class'PointLightComponent' (AmplificationLightTemplate);
		Pawn.AttachComponent(AmplificationLight);
	}

	// Reset Depth of Field
	EnableDepthOfField(false);
}

reliable client function ClientReset()
{
	// Flush to clear
	ResetGameplayPostProcessFX();

	// Reset Depth of Field
	EnableDepthOfField(false);

	Super.ClientReset();
}

function SpawnReconnectedPlayer()
{
	if ( WorldInfo.NetMode == NM_Client )
		return;

	WorldInfo.Game.RestartPlayer( Self );
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
		VoiceInterface.RegisterLocalTalker(0);
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
				KFPRI.ServerNotifyStartVOIP();
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
	super.ClientStartNetworkedVoice();

	KFPRI = KFPlayerReplicationInfo( PlayerReplicationInfo );
	if ( KFPRI != none )
	{
		KFPRI.VOIPStatusChanged( PlayerReplicationInfo, true );
		KFPRI.ServerNotifyStartVOIP();
	}
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

/*********************************************************************************************
* @name	Perks
********************************************************************************************* */

/** InitializePerks is called once after stats have been loaded */
native final 		 function ClientInitializePerks();
native final private function ResetPerkStatsLoaded();
native final private function LoadAllPerkLevels();
native final private function ReadStatsTimeout();


native final 		 function byte GetLevel();
native final simulated private function SetActivePerkLevel( byte NewLevel );
native final reliable server private event ServerSetLevel(class <KFPerk> PerkClass, byte NewLevel );
native final reliable server private event ClientSetLevelCheat( byte NewLevel );

/** Called by UI to change/modify our perk */
native final event						RequestPerkChange(byte NewPerkIndex);
native final reliable server private event  ServerSetPendingPerkUpdate( byte NewPerkIndex, int NewPerkBuild, byte NewLevel );
native final reliable server private event	ServerSelectPerk( byte NewPerkIndex, byte NewLevel );
native final 		function bool CanUpdatePerkInfo();
native final		function ApplyPendingPerks();

static function string GetPerkName( int Index )
{
	return default.PerkList[Index].PerkClass.default.PerkName;
}

unreliable server function ServerCallOutPawnCloaking(KFPawn_Monster CloakedPawn)
{
	if ( CloakedPawn != none )
	{
		CloakedPawn.CallOutCloaking();
	}
}

// If we are on the perk page and a level changes, update the menu
simulated event UpdatePerkLevelMenu( class <KFPerk> PerkClass )
{
	if ( MyGFxManager != none )
	{
		if ( KFGFxMenu_Perks( MyGFxManager.CurrentMenu ) != none )
		{
        	KFGFxMenu_Perks( MyGFxManager.CurrentMenu ).UpdateContainers( PerkClass );
		}
	}
}

event SetHaveUpdatePerk(bool bUsedUpdate)
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
function NotifyXPGain(class<KFPerk> PerkClass, int Amount)
{
	if( PerkClass != none && MyGFxHUD != none && MyGFxHUD.PlayerStatusContainer != none && IsLocalController() )
	{
		MyGFxHUD.PlayerStatusContainer.UpdateXP(Amount, 0, false, PerkClass);
	}
	
	`RecordAARPerkXPGain(self, PerkClass, Amount);	
}

/*
 * Network: Local Player
 */
function NotifyLevelUp(class<KFPerk> PerkClass, byte PerkLevel)
{
	local bool bTierUnlocked;

	if( PerkClass != none && IsLocalController() )
	{
		if(PerkLevel % 5 == 0)
		{
			bTierUnlocked = true;
			class'KFPerk'.static.SaveTierUnlockToConfig(PerkClass, 1, PerkLevel);
			class'KFLocalMessage_Priority'.static.ClientReceive( self, GMT_TierUnlocked );

		}
		else
		{
			bTierUnlocked = false;
			class'KFLocalMessage_Priority'.static.ClientReceive( self, GMT_LevelUp );
		}

		MyGFxHUD.LevelUpNotificationWidget.ShowLevelUpNotification(PerkClass, Perklevel, bTierUnlocked);

		// Update cached level for UI
		PerkList[GetPerkIndexFromClass(PerkClass)].PerkLevel = PerkLevel;

		// If this is our current perk, notify it of new level
		if(CurrentPerk.Class == PerkClass)
		{
			SetActivePerkLevel(PerkLevel);
			if(bTierUnlocked)
			{
				PostTierUnlock(PerkClass);
			}
		}

		UpdatePerkLevelMenu( PerkClass );
		ClientWriteAndFlushStats();
	}

	if( Role == ROLE_Authority )
	{
		`SafeDialogManager.PlayLevelUpDialog( self );
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

	if ( PlayerCamera != None )
	{
		PlayerCamera.CameraStyle = NewCamMode;
	}

	// Debugging - Show/Hide the player model using exec Camera()
	KFP = KFPawn(ViewTarget);
	if ( KFP != None )
	{
		KFP.SetMeshVisibility(NewCamMode != 'FirstPerson');
		// Disable aim offset in fixed camera (for anim debugging)
		KFP.bEnableAimOffset = (NewCamMode != 'Fixed');
	}

	if( NewCamMode == 'Boss' )
	{
		KFBoss = GetBoss();
		// If our current view target is not a boss, make sure we find one
		if(!ViewTarget.IsA('KFPawn_MonsterBoss'))
		{
			SetViewTarget(KFBoss);
		}

		// if our nightvision is active... disable it
		SetNightVision(false);

		//Show boss overlay
		if(KFBoss != none && KFBoss.Health > 0 && !PlayerReplicationInfo.bIsSpectator )
		{
			if(KFGameReplicationInfo(WorldInfo.GRI).AnyPlayersAlive()) //Boss intro
			{
				ShowBossNameplate(KFBoss);
			}
		}
	}
	else if( NewCamMode == 'FirstPerson' && !PlayerReplicationInfo.bIsSpectator )
	{
		// If are not in spectating mode and have a pawn to view, view it
		if( Pawn != none && ViewTarget != Pawn)
		{
			SetViewTarget(Pawn);
			HideBossNameplate();
		}
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
	if ( PlayerCamera != None )
	{
		PlayerCamera.CameraStyle = NewCamMode;
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
	local vector	FireDir, AimSpot, HitLocation, HitNormal, OldAim, AimOffset;
	local actor		BestTarget, HitActor;
	local float		bestAim, bestDist;
	local bool		bNoZAdjust, bInstantHit;
	local rotator	BaseAimRot, AimRot;

	bInstantHit = ( W == None || W.bInstantHit );
	BaseAimRot = (Pawn != None) ? Pawn.GetBaseAimRotation() : Rotation;

// BEGIN MOD
	if( W != none )
	{
		// Add in the weapon buffer rotation for recoil/sway
		BaseAimRot += WeaponBufferRotation;
	}

    // Added so we can call this function to get the aiming location on the client
    // including recoil/sway offsets, but without all the autoaim assistance
    // stuff below that will only work on ROLE_Authority
    // TODO: If we end up needing this autoaim assistance stuff for console
    // builds, then we'll need to figure out how t get the stuff below to work
    // on the client - Ramm
    if( Role < ROLE_Authority )
    {
        return BaseAimRot;
    }
// END MOD

	FireDir	= vector(BaseAimRot);
	HitActor = Trace(HitLocation, HitNormal, StartFireLoc + W.GetTraceRange() * FireDir, StartFireLoc, true);

	if ( (HitActor != None) && HitActor.bProjTarget )
	{
		BestTarget = HitActor;
		bNoZAdjust = true;
		OldAim = HitLocation;
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

		BestTarget = PickTarget(class'Pawn', bestAim, bestDist, FireDir, StartFireLoc, W.WeaponRange);
		if ( BestTarget == None )
		{
			return BaseAimRot;
		}
		OldAim = StartFireLoc + FireDir * bestDist;
	}

	ShotTarget = Pawn(BestTarget);
	if ( !AimingHelp(bInstantHit) )
	{
		return BaseAimRot;
	}

	// aim at target - help with leading also
	FireDir = BestTarget.Location - StartFireLoc;
	AimSpot = StartFireLoc + bestDist * Normal(FireDir);
	AimOffset = AimSpot - OldAim;

	if ( ShotTarget != None )
	{
	    // adjust Z of shooter if necessary
	    if ( bNoZAdjust )
	        AimSpot.Z = OldAim.Z;
	    else if ( AimOffset.Z < 0 )
	        AimSpot.Z = ShotTarget.Location.Z + 0.4 * ShotTarget.CylinderComponent.CollisionHeight;
	    else
	        AimSpot.Z = ShotTarget.Location.Z - 0.7 * ShotTarget.CylinderComponent.CollisionHeight;
	}
	else
	    AimSpot.Z = OldAim.Z;

	// if not leading, add slight random error ( significant at long distances )
	if ( !bNoZAdjust )
	{
		AimRot = rotator(AimSpot - StartFireLoc);
		if ( FOVAngle < DefaultFOV - 8 )
			AimRot.Yaw = AimRot.Yaw + 200 - Rand(400);
		else
			AimRot.Yaw = AimRot.Yaw + 375 - Rand(750);
		return AimRot;
	}
	return rotator(AimSpot - StartFireLoc);
}

/*********************************************************************************************
 * @name Player Movement
********************************************************************************************* */

/* HandleWalking:
	Called by PlayerController and PlayerInput to set bIsWalking flag, affecting Pawn's velocity */
function HandleWalking()
{
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

		KFPawn(Pawn).SetSprinting(bRun != 0 && !IsZero(Pawn.Acceleration));
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
	else if( bAutoTargetEnabled && Pawn != none && KFInput.CurrentAutoTarget != none && AutoTargetTime >= 0 )
	{
		AutoTargetTime -= DeltaTime;

        KFInput.ApplyAutoTarget( DeltaTime, KFWeapon(Pawn.Weapon), DeltaRot.Yaw, DeltaRot.Pitch );

        // The CurrentAutoTarget when we're done autotargeting it
        if( AutoTargetTime <= 0 )
        {
            KFInput.CurrentAutoTarget = none;
        }
	}
	// NOTE:  we probably only want to ApplyTargetAdhesion when we are moving as it hides the Adhesion a lot better
	else if( bTargetAdhesionEnabled && Pawn != none && (PlayerInput.aForward != 0 || PlayerInput.aStrafe != 0) )
	{
		KFInput.ApplyTargetAdhesion( DeltaTime, KFWeapon(Pawn.Weapon), DeltaRot.Yaw, DeltaRot.Pitch );
	}
}

/** updates auto-targeting */
function NewAutoTarget()
{
	if( Pawn != none )
	{
	    if( KFWeapon(Pawn.Weapon) != none && KFWeapon(Pawn.Weapon).bUsingSights )
	    {
	        StartAutoTargeting();
	    }
	}
}

/**
 * Start an instance of autotargeting when going to ironsights or during other actions
 */
simulated function StartAutoTargeting()
{
	if ( !IsLocalController()  )
	{
		return; // LocalPlayer Only
	}

    if( !PlayerInput.bUsingGamepad )
    {
        return;
    }

    KFPlayerInput(PlayerInput).InitAutoTarget();

    if( KFWeapon(Pawn.Weapon) != none )
    {
        AutoTargetTime = KFWeapon(Pawn.Weapon).default.ZoomInTime * 0.85;
    }
    else
    {
        AutoTargetTime = default.AutoTargetTime;
    }
}

/** Overloaded to make sure player is actually using gamepad */
function bool AimingHelp(bool bInstantHit)
{
	if( PlayerInput != none && !PlayerInput.bUsingGamepad )
    {
        return false;
    }

 	return super.AimingHelp( bInstantHit );
}

/*********************************************************************************************
 * @name Use / Interact
********************************************************************************************* */

static simulated function KFInterface_Usable GetCurrentUsableActor( Pawn P, optional bool bUseOnFind=false )
{
	local KFInterface_Usable UsableActor;
	local Actor A;

	if ( P != None )
	{
		// Check touching -- Useful when UsedBy() is implemented by subclass instead of kismet
		ForEach P.TouchingActors(class'Actor', A)
		{
			UsableActor = KFInterface_Usable( A );
			if ( UsableActor != none && UsableActor.GetIsUsable( P ) )
			{
				if( bUseOnFind )
				{
					A.UsedBy( P );
				}
				return UsableActor;
			}
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
		if( PC != none )
		{
			UsableActor = GetCurrentUsableActor( P );
			if( UsableActor != none )
			{
				PC.ReceiveLocalizedMessage( class'KFLocalMessage_Interaction', UsableActor.GetInteractionIndex() );
			}
			else
			{
				PC.ReceiveLocalizedMessage( class'KFLocalMessage_Interaction', IMT_None );
			}
		}
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
function SetGrabEffect( bool bValue )
{
	bGrabEffectIsActive = bValue;

	if(bGrabEffectIsActive)
	{
		ReceiveLocalizedMessage( class'KFLocalMessage_Interaction', IMT_ClotGrabWarning);
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
	else
	{
		if( bPlayingLowHealthSFX )
		{
			PostAkEvent( LowHealthStopEvent );
			bPlayingLowHealthSFX = false;

			SetRTPCValue( 'Health', 100, true );
		}
	}
}

/** Plays force feedback associated with shake, if available. Otherwise, plays default force feedback. */
simulated protected function DoForceFeedbackForScreenShake( CameraShake ShakeData, float Scale )
{
	local KFCameraShake KFCS;
	local int ShakeLevel;
	local float RotMag, LocMag, FOVMag;

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

function ShowBossNameplate( KFPawn_MonsterBoss KFBoss)
{
	if(MyGFxHUD != none)
	{
		MyGFxHUD.ShowBossNameplate(KFBoss.default.BossName, KFBoss.default.BossCaptionStrings[Rand(KFBoss.default.BossCaptionStrings.length)]);
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
		OnlineSub.ReadOnlineAvatar(NetID, 64, OnAvatarReceived);
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
	if(!KFGI.bDisablePublicTextChat || PlayerReplicationInfo.bAdmin)
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
	ChatMessage = PRI.PlayerName$": " $S;

    if (MyGFxManager != none)
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
    		//this check assigns the correct color to the message
    		if(Type != 'Event' && Type != 'None' )
    		{
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
			else
			{
				MyGFxHUD.HudChatBox.AddChatMessage(class'KFLocalMessage'.default.SystemString@S, class 'KFLocalMessage'.default.EventColor);
			}

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
	OpenChatBox();
}

exec function TeamTalk()
{
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

/*********************************************************************************************
 * @name Inventory
********************************************************************************************* */

// The player wants to fire.
exec function StartFire( optional byte FireModeNum )
{
	local KFInventoryManager KFIM;

	if (!KFPlayerInput(PlayerInput).bQuickWeaponSelect)
	{
		if (MyGFxHUD != none && MyGFxHUD.WeaponSelectWidget.bChangingWeapons)
		{
			KFIM = KFInventoryManager( Pawn.InvManager );
			KFIM.SetCurrentWeapon( KFIM.PendingWeapon );
			MyGFxHUD.WeaponSelectWidget.FadeOut();
			return;
		}
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
function OpenTraderMenu()
{
	if (Role == ROLE_Authority && Pawn != none)
	{
   		KFInventoryManager(Pawn.InvManager).bServerTraderMenuOpen = true;
 		ClientOpenTraderMenu();
	}
}

reliable client function ClientOpenTraderMenu()
{
	if (MyGFxManager != none)
	{
		MyGFxManager.OpenMenu( UI_Trader, false );
		`SafeTraderDialogManager.PlayOpenTraderMenuDialog( self );
	}
}

function CloseTraderMenu()
{
	if ( MyGFxManager != none )
	{
		MyGFxManager.CloseTraderMenu();
	}
}

function NotifyAddInventory(Inventory NewItem)
{
	local KFGFxMenu_Trader TraderMenu;
	local KFWeapon KFW;
	TraderMenu = KFGFxMenu_Trader(MyGFxManager.CurrentMenu);
	if( TraderMenu != none )
	{
		KFW = KFWeapon(NewItem);
		if(KFW != none)
		{
			TraderMenu.GiveExternalWeapon(KFW);
		}
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
 * Post Game Menu
 *********************************************************************************************/

reliable client function ClientOpenPostGameMenu()
{
	if (MyGFxManager != none)
	{
		MyGFxManager.bPostGameState = true;
		MyGFxManager.bCanCloseMenu = false;
		MyGFxManager.OpenMenu( UI_PostGame, false );
		MyHUD.bShowHUD = false;
		//`SafeTraderDialogManager.PlayOpenTraderMenuDialog( self );
	}
}

function ClosePostGameMenu()
{
	if ( MyGFxManager != none )
	{
		MyGFxManager.ClosePostGameMenu();
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

/* Pause()
Command to try to pause the game.
*/
exec function Pause()
{
	if( WorldInfo.NetMode == NM_Standalone )
	{
		super.Pause();
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
	
	OnlineSub.StatsInterface.ClearReadOnlineStatsCompleteDelegate( OnStatsInitialized );
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

		ClientLogWeldAndHealXP();
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
		StatsWrite.OnGameWon( MapName, Difficulty, GameLength, bCoop );
	}
}

/**
 * @brief Unlock an achievemnt on the client
 *
 * @param AchievementIndex the achievemnt's index
 */
reliable client event ClientUnlockAchievement( int AchievementIndex )
{
	if ( WorldInfo.NetMode != NM_DedicatedServer && IsLocalPlayerController() && !PlayerReplicationInfo.bOnlySpectator 
		&& !StatsWrite.HasCheated() && !StatsWrite.IsAchievementUnlocked(AchievementIndex) )
	{

`if(`notdefined(ShippingPC))
		`QALog("- probably unlocking achievement "$AchievementIndex, true);
`endif

		if (OnlineSub.PlayerInterface.UnlockAchievement(0, AchievementIndex))
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

	/* _TW_ANALYTICS__ */
	if ( 	`ValidStatsContext &&
			MonsterClass.static.IsStalkerClass() &&
			class'KFPerk'.static.IsDamageTypeOnThisPerk( class<KFDamageType>(DT), class'KFPerk_Commando'.static.GetPerkClass() ) )
	{
		`StatsContext.LogPlayerIntEvent(`StatID(PLAYER_XP_STALKER), self, class'KFPerk_Commando'.static.GetStalkerKillXP( Difficulty ));
	}
}
native reliable client private function ClientAddZedKill( class<KFPawn_Monster> MonsterClass, byte Difficulty, class<DamageType> DT );

/** Perk xp stat */
function AddPlayerXP(int XP, class<KFPerk> PerkClass)
{
	ClientAddPlayerXP(XP, PerkClass);
}
native reliable client private function ClientAddPlayerXP( int XP, class<KFPerk> PerkClass );

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

function ClientLogWeldAndHealXP()
{
	/* this is called from a client method */
	if( Role == ROLE_Authority )
	{
		if (StatsWrite.PerRoundHealXP > 0)
		{
			`RecordPlayerXP(`StatID(PLAYER_XP_HEAL), self, StatsWrite.PerRoundHealXP);
		}
		if (StatsWrite.PerRoundWeldXP > 0)
		{
			`RecordPlayerXP(`StatID(PLAYER_XP_WELD), self, StatsWrite.PerRoundWeldXP);
		}
	}
	else
	{
		ServerLogWeldAndHealXP(StatsWrite.PerRoundWeldXP, StatsWrite.PerRoundHealXP);
	}

	StatsWrite.PerRoundWeldXP = 0;
	StatsWrite.PerRoundHealXP = 0;
}
unreliable server function ServerLogWeldAndHealXP(int WeldingXP, int HealingXP)
{
	`RecordPlayerXP(`StatID(PLAYER_XP_HEAL), self, HealingXP);
	`RecordPlayerXP(`StatID(PLAYER_XP_WELD), self, WeldingXP);
}

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


	CollectibleFoundMsg = class'KFLocalMessage_Game'.default.FoundAMapCollectibleMessage;
	CollectibleFoundMsg = repl( CollectibleFoundMsg, "%x%", FinderPRI.PlayerName );
	CollectibleFoundMsg = repl( CollectibleFoundMsg, "%y%", class'KFLocalMessage_Game'.default.MapCollectibleName );
	CollectibleFoundMsg = repl( CollectibleFoundMsg, "%z%", KFMI.CollectiblesToFind - CollectibleID );

	MyGFxHUD.ShowNonCriticalMessage( CollectibleFoundMsg );
}

/** Called from native (AKFCollectibleActor::OnCollect) when the final collectible is found */
reliable client event OnAllMapCollectiblesFound()
{
	local string CollectibleFoundMsg;

	CollectibleFoundMsg = class'KFLocalMessage_Game'.default.FoundAllMapCollectiblesMessage;
	CollectibleFoundMsg = repl( CollectibleFoundMsg, "%x%", class'KFLocalMessage_Game'.default.MapCollectibleName );

	MyGFxHUD.ShowNonCriticalMessage( CollectibleFoundMsg );

	PostAkEvent( AllMapCollectiblesFoundEvent );
}

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
		DrawNextDebugLine( Canvas, out_YL, out_YPos, false, "AI Attack Mod: " @KFGI.DifficultyInfo.GetBaseAIDamageModifier() );
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

`if(`notdefined(ShippingPC))
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
    // Stop currently playing stingers when the map is being switched
    if( StingerAkComponent != none )
    {
        StingerAkComponent.StopEvents();
    }

    SetRTPCValue( 'Health', 100, true );
    PostAkEvent( LowHealthStopEvent );
	bPlayingLowHealthSFX = false;

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
		local KFGameInfo KFGI;
		local KFGameReplicationInfo KFGRI;
		local KFPlayerInput KFPI;

		Super.BeginState( PreviousStateName );
		SetTimer( 5.f, false, nameof(StartSpectate) );

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

		KFGI = KFGameInfo(WorldInfo.Game);
		// notify local player death (HUD, etc...)
		if( Role == ROLE_Authority && KFGI != none && KFGI.GetLivingPlayerCount() > 0
            && KFP != none && !KFP.bPendingDelete && !KFP.IsA( 'KFPawn_Customization' ) )
		{
			KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
			if( KFGRI != none && KFGRI.bMatchHasBegun )
			{
				ReceiveLocalizedMessage( class'KFLocalMessage_Priority', GMT_Died );
			}
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
			MyGFxHUD.ClearBuffIcons();
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

state Spectating
{
	event BeginState(Name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);

		if( MyGFxHUD != none )
		{
			MyGFxHUD.SetHUDSpectating(true);
		}

		if( Role == ROLE_Authority )
		{
			SpectatePlayer( SMODE_PawnFreeCam );

			NotifyChangeSpectateViewTarget();
		}
	}

	exec function StartFire (optional BYTE FireModeNum)
	{

	}

	exec function SpectateNextPlayer()
	{
		ServerViewNextPlayer();
		if( Role == ROLE_Authority )
		{
			NotifyChangeSpectateViewTarget();
		}
	}

	exec function SpectatePreviousPlayer()
	{
		ServerViewPrevPlayer();
		if( Role == ROLE_Authority )
		{
			NotifyChangeSpectateViewTarget();
		}
	}

	exec function SpectateChangeCamMode()
	{
		ServerNextSpectateMode();
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
}

/** Called when view target is changed while in spectating state */
function  NotifyChangeSpectateViewTarget()
{
	local KFPlayerReplicationInfo KFPRI;
	local KFPawn_Human KFP;

	KFP = KFPawn_Human(ViewTarget);

	if( MyGFxHUD != none && MyGFxHUD.SpectatorInfoWidget != none && KFP != none )
	{
		if( KFP == Pawn )
		{
			return;
		}

		KFPRI = KFPlayerReplicationInfo(KFP.PlayerReplicationInfo);
		if( KFPRI != none)
		{
			MyGFxHUD.SpectatorInfoWidget.SetSpectatedKFPRI(KFPRI);
		}
	}
}

reliable client event ClientSetViewTarget( Actor A, optional ViewTargetTransitionParams TransitionParams )
{
	super.ClientSetViewTarget( A, TransitionParams);
	if( IsSpectating() && ViewTarget != none )
	{
		NotifyChangeSpectateViewTarget();
	}
}

/** Switches between spectating modes (first-person, third-person, etc.) */
unreliable server function ServerNextSpectateMode()
{
	local KFPawn_Human HumanViewTarget;

	if( !IsSpectating() )
	{
		return;
	}

	// switch to roaming if human viewtarget is dead
	if( CurrentSpectateMode != SMODE_Roaming )
	{
		HumanViewTarget = KFPawn_Human(ViewTarget);
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

		if ( KFPawn_Human(ViewTarget) == None )
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
	local KFPawn_Human KFPHTarget;

	KFPHTarget = KFPawn_Human( ViewTarget );
	if( KFPHTarget == None || KFPHTarget.IsAliveAndWell() )
	{
		ServerViewNextPlayer();
	}
}

/** Switches to the next player view target (only in spectating modes that target players) */
unreliable server function ServerViewNextPlayer()
{
	switch ( CurrentSpectateMode )
	{
	case SMODE_PawnFreeCam:
	case SMODE_PawnThirdPerson:
	case SMODE_PawnFirstPerson:
		super.ServerViewNextPlayer();
		break;
	}
}

/*********************************************************************************************
 * @name Dialog and AAR
 *********************************************************************************************/
/** causes PWRI to be replicated! */
function ReplicatePWRI()
{
	if( Role == ROLE_Authority )
	{
		`RecordAARWaveInfo(self);
		PWRI.RepCount++;
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
	MatchStats.ReceiveAwardInfo(AwardID, PRI, Value);
}

/** Network: Local Player only */
reliable client function ReceiveTopWeapons(TopWeaponReplicationInfo TopWeapons)
{
	MatchStats.UnpackTopWeapons(TopWeapons);
}

/** Clear PWRI, but doesn't cause it to replicate */
function ResetLastWaveInfo()
{	
		PWRI.VectData1.X = 0;
		PWRI.VectData1.Y = 0;
		PWRI.VectData1.Z = 0;
		PWRI.VectData2.X = 0;
		PWRI.VectData2.Y = 0;
		PWRI.VectData2.Z = 0;
	    PWRI.bKilledMostZeds = false;
	    PWRI.bKilledFleshpoundLastWave = false;
	    PWRI.bKilledScrakeLastWave = false;
	    PWRI.ClassKilledByLastWave = none;
	    PWRI.bAllSurvivedLastWave = false;
	    PWRI.bSomeSurvivedLastWave = false;
	    PWRI.bOneSurvivedLastWave = false;
	    MatchStats.ZedsKilledLastWave = 0;
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
	super.NotifyKilled( Killer, Killed, KilledPawn, damageType );

	if( self == Killer && self != Killed )
	{
		if( !PWRI.bKilledFleshpoundLastWave && KilledPawn.IsA('KFPawn_ZedFleshpound') )
		{
			PWRI.bKilledFleshpoundLastWave = true;
		}
		else if( !PWRI.bKilledScrakeLastWave && KilledPawn.IsA('KFPawn_ZedScrake') )
		{
			PWRI.bKilledScrakeLastWave = true;
		}

		MatchStats.ZedsKilledLastWave++;
	}
}

function PlayTraderDialog( int DialogEventID )
{
	`SafeTraderDialogManager.PlayDialog( DialogEventID, self );
}

reliable client function ClientPlayTraderDialog( int DialogEventID )
{
	`SafeTraderDialogManager.PlayDialog( DialogEventID, self );
}

simulated function PlayTraderSelectItemDialog( bool bTooExpensive, bool bTooHeavy )
{
	`SafeTraderDialogManager.PlaySelectItemDialog( self, bTooExpensive, bTooHeavy );
}

unreliable server function ServerPlayLevelUpDialog()
{
	`SafeDialogManager.PlayLevelUpDialog( self );
}

unreliable server function ServerPlayVoiceCommsDialog( int CommsIndex )
{
	`SafeDialogManager.PlayVoiceCommandDialog( KFPawn_Human(Pawn), CommsIndex );
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
	        MyGFxManager.OpenPopup(ENotification, CachedTitle, CachedMessage, class'KFCommon_LocalizedStrings'.default.OKString);
	        return true;
        break;
    }

    return false;
}

event bool NotifyDisconnect(string Command)
{
	ClientWriteAndFlushStats();
	DestroyOnlineGame();

	return super.NotifyDisconnect(Command);
}

/** If we have an online game but can't join it or are leaving it, destroy it. */
event DestroyOnlineGame()
{
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
	OnlineSub.GameInterface.ClearOnlineDelegates();

	super.ClearOnlineDelegates();
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

	PauseWwiseEvent=AkEvent'AK_GLO_Runtime.Pause_All'
	ResumeWwiseEvent=AkEvent'AK_GLO_Runtime.Resume_All'

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
	NVG_DOF_MaxFarBlurSize=8.0
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
	//PerkList.Add((PerkClass=class'KFPerk_Gunslinger'))
	//PerkList.Add((PerkClass=class'KFPerk_MartialArtist'))
	//PerkList.Add((PerkClass=class'KFPerk_Sharpshooter'))
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

    AutoTargetTime=0.1
    MusicMessageType="Music"

    UpdateSpectatorActiveInterval=1.0
}
