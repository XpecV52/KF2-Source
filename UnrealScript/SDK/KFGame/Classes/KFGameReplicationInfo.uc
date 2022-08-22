//=============================================================================
// KFGameReplicationInfo
//=============================================================================
// The KF 2 game replication class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Christian "schneidzekk" Schneider 8/27/2012
//=============================================================================

class KFGameReplicationInfo extends GameReplicationInfo
	native(ReplicationInfo)
	nativereplication;

/*************************************
* Pre game server welcome screen
*************************************/
struct native PreGameServerAdInfo
{
	var string     	BannerLink;             // Link to the banner image
	var string     	ServerMOTD;             // The server message of the day string
	var string 		WebsiteLink;			//url to the website of the server
};

var repnotify PreGameServerAdInfo ServerAdInfo;

var int PrimaryXPAccumulator;
var int SecondaryXPAccumulator;

/************************************
*  Traders
************************************/

/** Trader picked by the server and used for distance on HUD */
var		KFTraderTrigger		NextTrader;
/** Trader that is currently open for business */
var     KFTraderTrigger     OpenedTrader;

// used for debuging purposes to walk through the traders
var     int                 DebugingNextTraderIndex;

/** The Archtype that holds all of our trader information */
var KFGFxObject_TraderItems TraderItems;

/** Trader dialog manager */
var KFTraderDialogManager				TraderDialogManager;
var class<KFTraderDialogManager>		TraderDialogManagerClass;
var class<KFTraderVoiceGroupBase>		TraderVoiceGroupClass;

var repnotify bool bTraderIsOpen;
/** Replicates at beginning and end of waves to change track / track type */
var repnotify byte MusicTrackRepCount;

var repnotify byte RepKickVotes;
/** whether the current game can use stats */
var private const bool bIsUnrankedGame;

//Stored so that we can tell this on the AAR
var bool bMatchVictory;

/************************************
* Spawning
************************************/
var					byte						WaveMax;	// The "end" wave
var repnotify		byte						WaveNum; 	// The wave we are currently in
var					int							AIRemaining;
var					int							WaveTotalAICount;

/** Cached class references loaded once */
//var	array< class<KFPawn_Monster> >		AIClassList;

//@HSL_BEGIN - JRO - 3/21/2016 - PS4 Sessions
/************************************
* Console Sessions
************************************/
//console info
var repnotify string ConsoleGameSessionGuid;
var UniqueNetId ConsoleGameSessionHost;
var array<UniqueNetId> ConsoleGameSessionPendingPlayers;
//@HSL_END

/************************************
* Settings
************************************/
var    				byte						GameLength;
var    				byte						GameDifficulty;
var 				bool 						bCustom;

 /** Combined from the PRI unlocks, but does not subtract logged out players */
 var private const byte		GameSharedUnlocks;

/************************************
* Wave Debugging
************************************/
var                 float                       CurrentSineMod;
var                 float                       CurrentNextSpawnTime;
var                 float                       CurrentSineWavFreq;
var                 float                       CurrentNextSpawnTimeMod;
var                 int                         CurrentAIAliveCount;
var                 bool                        bCurrentSMFinishedSpawning;
var                 int                         CurrentMaxMonsters;
var                 float                       CurrentTimeTilNextSpawn;
var                 float                       CurrentTotalWavesActiveTime;
/** Spawn Debugging Is Active. */
var                 bool                        bDebugSpawnManager;

/************************************
* Tracking Map
************************************/
/** Tracking Map is Active. */
var                 bool                        bTrackingMapEnabled;

/************************************
* @name 	Map/Kick vote Collector
************************************/

var KFVoteCollector				VoteCollector;
var class<KFVoteCollector>		VoteCollectorClass;

/** Stores information for replicating recently used spawn volumes for the tracker map. */
struct native SpawnVolumeInfo
{
    var vector  VolumeLocation;
    var float   UsedTime;
    var bool    bPortalSpawn;
    var byte    VolumeAge;
};

/** Recently used spawn volumes for the tracker map. */
var SpawnVolumeInfo SpawnVolumeInfos[16];
/** Index of the last spawn volume added to the array. */
var int LastSpawnVolumeIndex;

/** Track recently failed spawns from spawn volumes and portal spawns. */
var SpawnVolumeInfo FailedSpawnInfos[8];
/** Index of the last spawn volume added to the array. */
var int LastFailedSpawnIndex;

/** Stores information for replicating live zeds for the tracker map. */
struct native ZedInfo
{
    var vector                  ZedLocation;
    var KFPawn_Monster          Zed;
    var class<KFPawn_Monster>   ZedClass;
    var vector                  LastTeleportLocation;
    var bool                    bUsingSuperSpeed;
    var vector                  EnemyLocation;
    var KFPawn                  Enemy;
};

/** List of live zeds for the tracker map. */
var ZedInfo ZedInfos[32];
/** How often to update replicating zeds for the tracker map. */
var float UpdateZedInfoInterval;

/** Stores information for replicating live players for the tracker map. */
struct native HumanInfo
{
    var vector                  HumanLocation;
    var KFPawn                  Human;
    var class<KFPawn>           HumanClass;
};

/** List of live players for the tracker map. */
var HumanInfo HumanInfos[6];
/** How often to update replicating humans for the tracker map. */
var float UpdateHumanInfoInterval;

/** Stores information for replicating pickups for the tracker map. */
struct native PickupInfo
{
    var vector                  PickupLocation;
    var int                     PickupType; // 0 = ammo, 1 = weapon, 2 = armor
};

/** List of active pickups for the tracker map. */
var PickupInfo PickupInfos[20];
/** How often to update replicating pickups for the tracker map. */
var float UpdatePickupInfoInterval;

/************************************
* GameConductor
************************************/

/** Tracking Map is Active. */
var bool            bGameConductorGraphingEnabled;

/** Keep track of the player accuracy over the last 10 secondse */
var float           PlayerAccuracyTracker[10];

/** Keep track of the player headdshot accuracy over the last 10 secondse */
var float           PlayerHeadshotAccuracyTracker[10];

/** Keep track of the aggregate player player skill over the last 10 secondse */
var float           AggregatePlayerSkillTracker[10];

/** Keep track of the zed total average lifespan over time */
var float           TotalZedLifeSpanAverageTracker[10];

/** Keep track of the zed current wave average lifespan over time */
var float           CurrentWaveZedLifeSpanAverageTracker[10];

/** Keep track of the zed average lifespan over the last 10 seconds */
var float           RecentZedLifeSpanAverageTracker[10];

/** Keep track of the players health over the last 10 seconds */
var float           PlayersHealthStatusTracker[10];

/** Keep track of the players ammo over the last 10 seconds */
var float           PlayersAmmoStatusTracker[10];

/** Keep track of the players combined status over the last 10 seconds */
var float           AggregatePlayersStatusTracker[10];

/** The current baseline for how long zeds should live */
var float           CurrentParZedLifeSpan;

/** Keep track of the overall rank and skill modifier the game conductor is using over the last 10 seconds */
var float           OverallRankAndSkillModifierTracker[10];

/** Keep track of the overall rank and skill modifier the game conductor is using over the last 10 seconds */
var float           ZedMovementSpeedModifierTracker[10];

/** Keep track of the overall rank and skill modifier the game conductor is using over the last 10 seconds */
var float           ZedSpawnRateModifierTracker[10];

/** Keep track of the overall rank and skill modifier the game conductor is using over the last 10 seconds */
var float           ZedSpawnRateTracker[10];

/** Replicate the current game conductor status */
var byte            CurrentGameConductorStatus;

/** The current baseline for how long zeds should live */
var float           VersusZedHealthMod;

/** The current baseline for how long zeds should live */
var float           VersusZedDamageMod;

/** The current game is a versus game */
var bool            bVersusGame;

/************************************
* Team Management
************************************/
var bool bAllowSwitchTeam;


/************************************
* Actor Iterators
************************************/

var array<KFDoorActor> DoorList;

/************************************
* Objectives
************************************/
var KFObjective 	CurrentObjective;

/************************************
*  native
************************************/

/************************************
*  Localization
************************************/

/************************************
*  Music
************************************/
/** Audio component used for playing music tracks via SeqAct_PlayMusicTrack */
var AkComponent                 MusicComp;
/** Currently playing music track */
var KFMusicTrackInfo            CurrentMusicTrackInfo;
/** Desired music intensity, based on gameplay and replicated by host */
var byte                        MusicIntensity;
/** replicated music track (allows server to force play/sync specific tracks) */
var repnotify KFMusicTrackInfo  ReplicatedMusicTrackInfo;

/************************************
*  Perks
************************************/

/************************************
*  debug
************************************/

/************************************
 *  Steam heartbeat
 ************************************/

var private float SteamHeartbeatAccumulator;
native function SendSteamHeartbeat();
native function SendSteamRequestItemDrop();

function native private EndOfWave();

cpptext
{
	INT* GetOptimizedRepList( BYTE* InDefault, FPropertyRetirement* Retire, INT* Ptr, UPackageMap* Map, UActorChannel* Channel );

	virtual void TickAuthoritative( FLOAT DeltaSeconds );
	virtual UBOOL IsUnrankedGame();
	virtual FString GetGameBalanceCol1() { return FString::Printf(TEXT(",%i,"), WaveNum); }
	virtual int GetWaveNum() { return WaveNum; }
	virtual int GetWaveMax() { return WaveMax; }
	virtual UBOOL GetWon() { return bMatchVictory; }
	virtual void TickSpecial(FLOAT DeltaSeconds);
}


/************************************
*  Replication
************************************/
replication
{
	if ( bNetDirty )
		bTraderIsOpen, NextTrader, WaveNum, AIRemaining, WaveTotalAICount,
		CurrentObjective, MusicIntensity, ReplicatedMusicTrackInfo, MusicTrackRepCount,
		bIsUnrankedGame, GameSharedUnlocks, ConsoleGameSessionGuid; //@HSL - JRO - 3/21/2016 - PS4 Sessions
	if ( bNetInitial )
		GameLength, GameDifficulty, WaveMax, bCustom, bVersusGame;
	if ( bNetInitial && Role == ROLE_Authority )
		ServerAdInfo;

// !SHIPPING_PC_GAME && !FINAL_RELEASE in C++
	if ( bDebugSpawnManager && bNetDirty )
		CurrentSineMod, CurrentNextSpawnTime, CurrentSineWavFreq, CurrentNextSpawnTimeMod,
        CurrentAIAliveCount, bCurrentSMFinishedSpawning, CurrentMaxMonsters, CurrentTimeTilNextSpawn,
        CurrentTotalWavesActiveTime;
    if( bNetDirty )
        bTrackingMapEnabled;
	if ( bTrackingMapEnabled && bNetDirty )
		SpawnVolumeInfos, ZedInfos, HumanInfos, FailedSpawnInfos, PickupInfos;
	if(VoteCollector != none && VoteCollector.bIsVoteInProgress)
		RepKickVotes;
    if( bNetDirty )
        bGameConductorGraphingEnabled;
	if ( bGameConductorGraphingEnabled && bNetDirty )
		PlayerAccuracyTracker, PlayerHeadshotAccuracyTracker, AggregatePlayerSkillTracker,
        TotalZedLifeSpanAverageTracker, CurrentWaveZedLifeSpanAverageTracker, RecentZedLifeSpanAverageTracker,
        PlayersHealthStatusTracker, PlayersAmmoStatusTracker, AggregatePlayersStatusTracker,
        CurrentParZedLifeSpan, OverallRankAndSkillModifierTracker, ZedMovementSpeedModifierTracker,
        ZedSpawnRateModifierTracker, ZedSpawnRateTracker, CurrentGameConductorStatus;

	if ( bGameConductorGraphingEnabled && bNetDirty && bVersusGame )
		VersusZedHealthMod, VersusZedDamageMod;
// endif
}

simulated event ReplicatedEvent(name VarName)
{
 	if ( VarName == nameof(bTraderIsOpen) )
	{
		if ( bTraderIsOpen )
		{
	        FadeOutLingeringExplosions();
			NotifyWaveEnded();
			EndOfWave();
			OpenTrader();
		}
        else
        {
            CloseTrader();
        }
	}
    else if( VarName == nameof(ReplicatedMusicTrackInfo) )
    {
        ForceNewMusicTrack( ReplicatedMusicTrackInfo );
    }
    else if( VarName == nameof(MusicTrackRepCount) )
    {
		// don't start music for boss wave, boss will start it at end of monologue
        if( !IsFinalWave() )
        {
            PlayNewMusicTrack(true);
        }
    }
    else if( VarName == nameOf(bIsUnrankedGame) )
    {
    	if( bIsUnrankedGame )
    	{
    		`warn(GetFuncName() @ "Game is UNRANKED!");
    	}
    }
    else if( VarName == nameOf(RepKickVotes) )
    {
    	VoteCollector.UnPackVotes();
    }
    else if( VarName == 'ServerAdInfo')
	{
			ShowPreGameServerWelcomeScreen();
	}
	else if( VarName == 'WaveNum')
	{
			UpdateHUDWaveCount();
	}
//@HSL_BEGIN - JRO - 3/21/2016 - PS4 Sessions
	else if( VarName == 'ConsoleGameSessionGuid' )
	{
		KFPlayerController(GetALocalPlayerController()).TryJoinGameSession();
	}
//@HSL_END
	else
	{
		super.ReplicatedEvent(VarName);
	}
}

simulated event PostBeginPlay()
{
	local KFDoorActor Door;

	VoteCollector = new(Self) VoteCollectorClass;

	Super.PostBeginPlay();
	
//@HSL_BEGIN - JRO - 3/21/2016 - PS4 Sessions
	ConsoleGameSessionGuid = KFGameEngine(Class'Engine'.static.GetEngine()).ConsoleGameSessionGuid;
//@HSL_END

	// cache list of all doors actors (useful for HUD)
	ForEach DynamicActors(class'KFDoorActor', Door)
	{
		DoorList.AddItem(Door);
	}

	if( WorldInfo.NetMode != NM_DedicatedServer && TraderDialogManagerClass != none )
	{
		TraderDialogManager = Spawn(TraderDialogManagerClass);
	}

	// Override timer at a constant 1s instead of TimeDilation, so that it slows
	// down during zedtime.  Also, removed the SetTimer() call from Timer()
	SetTimer(1.f, true);
}

/** Called when the GameClass property is set (at startup for the server, after the variable has been replicated on clients) */
simulated function ReceivedGameClass()
{
	local class<KFGameInfo> KFGameClass;

	KFGameClass = class<KFGameInfo>(GameClass);
	if ( KFGameClass != None )
	{
		// Load/Cache game type specific classes (Network: All)
		KFGameClass.static.PreloadContentClasses(self);

		if( TraderDialogManager != none )
		{
			TraderDialogManager.TraderVoiceGroupClass = KFGameClass.default.TraderVoiceGroupClass;
		}

        if( KFGameClass.static.ShouldPlayMusicAtStart() && MusicComp == None )
        {
            PlayNewMusicTrack(false, true);
        }
	}

	DebugingNextTraderIndex = -1;

	Super.ReceivedGameClass();
}

simulated function UpdateHUDWaveCount()
{
	local KFPlayerController KFPC;

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		KFPC = KFPlayerController(GetALocalPlayerController());
		if( KFPC != none && KFPC.MyGFxHUD != none )
		{
			KFPC.MyGFxHUD.UpdateWaveCount();
		}
	}
}

/** Process wave end event on client */
simulated function NotifyWaveEnded()
{
	local PlayerReplicationInfo PRI;
	local KFPlayerReplicationInfo KFPRI;

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( WorldInfo.MyGoreEffectManager != none )
		{
			KFGoreManager(WorldInfo.MyGoreEffectManager).ResetPersistantGore(false);
		}
	}

	if ( CurrentObjective != none && !CurrentObjective.bIsCoopObjective )
	{
		CurrentObjective.FailObjective(OF_WaveEnded);
	}

	// Reset all supplier perks
	foreach PRIArray( PRI )
	{
		if( !PRI.bBot )
		{
			KFPRI = KFPlayerReplicationInfo( PRI );
			if( KFPRI != none )
			{
				KFPRI.bPerkPrimarySupplyUsed = false;
				KFPRI.bPerkSecondarySupplyUsed = false;
			}
		}
	}
}

/* Welcome screen shenanigans */
exec reliable client function ShowPreGameServerWelcomeScreen()
{
	local KFPlayerController KFPC;

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		return;
	}

	KFPC = KFPlayerController(GetALocalPlayerController());
	if(KFPC != none && KFPC.MyGFxManager != none)
	{
		KFPC.MyGFxManager.ShowWelcomeScreen();
	}

}

simulated function GetKFPRIArray(out array<KFPlayerReplicationInfo> KFPRIArray, optional bool bGetSpectators)
{
    local int i;
    local int Num;

    KFPRIArray.Remove(0, KFPRIArray.Length);
    for ( i = 0; i < PRIArray.Length; i++)
    {
		if ( PRIArray[i] != None && KFPlayerReplicationInfo(PRIArray[i]) != none &&
			 (bGetSpectators || !PRIArray[i].bOnlySpectator))
		{
			KFPRIArray[num++] = KFPlayerReplicationInfo(PRIArray[i]);
		}
    }
}

/** Fades out any lingering explosions in the world, called from ::ReplicatedEvent() */
simulated function FadeOutLingeringExplosions()
{
    local KFExplosionActorLingering LingeringExplosion;

    foreach DynamicActors( class'KFExplosionActorLingering', LingeringExplosion )
    {
        LingeringExplosion.FadeOut();
    }
}

simulated function OpenTrader(optional int time)
{
    local KFPlayerController KFPC;

	if( OpenedTrader != none )
	{
		return;
	}

	if( time > 0 && Role == ROLE_Authority )
	{
		bStopCountDown = false;
        RemainingTime = time;
		RemainingMinute = time;
	}

	OpenedTrader = NextTrader;

	if( OpenedTrader != none )
	{
		OpenedTrader.OpenTrader();

		`TraderDialogManager.PlayOpenTraderDialog( WaveNum, WaveMax, GetALocalPlayerController() );

		KFPC = KFPlayerController(GetALocalPlayerController());
		if( KFPC != none )
		{
			if( KFPC.MyGFxManager != none )
			{
				KFPC.MyGFxManager.OnTraderTimeStart();
			}
			if( KFPC.MyGFxHUD != none )
			{
				KFPC.MyGFxHUD.UpdateWaveCount();
			}
		}
	}
}

/** Cheat/Debugging */
simulated function OpenTraderNext(optional int time)
{
	local KFGameInfo kfGameInfo;

	kfGameInfo = KFGameInfo(WorldInfo.Game);

	if( kfGameInfo == none )
	{
		return;
	}

	if( time > 0 && Role == ROLE_Authority )
	{
		bStopCountDown = false;
        RemainingTime = time;
		RemainingMinute = time;
	}

	if( kfGameInfo.TraderList.Length > 0 )
	{
		if( DebugingNextTraderIndex == -1 && OpenedTrader != none )
		{
			// lets add the current trader to the end of list so it can be used again
			kfGameInfo.TraderList.AddItem(OpenedTrader);
		}

		if( DebugingNextTraderIndex + 1 >= kfGameInfo.TraderList.Length )
		{
			DebugingNextTraderIndex= -1;
		}

		DebugingNextTraderIndex = DebugingNextTraderIndex + 1;
		NextTrader = kfGameInfo.TraderList[ DebugingNextTraderIndex ];
		//kfGameInfo.TraderList.Remove( kfGameInfo.NextTraderIndex, 1 );
	}

	OpenedTrader = NextTrader;
	OpenedTrader.OpenTrader();

	`TraderDialogManager.PlayOpenTraderDialog( WaveNum, WaveMax, GetALocalPlayerController() );
}

simulated function CloseTrader()
{
    local KFPlayerController KFPC;
    local PlayerController LocalPC;

    LocalPC = GetALocalPlayerController();

	if (OpenedTrader != none)
	{
		bStopCountDown = true;
		OpenedTrader.CloseTrader();
		OpenedTrader = none;

		`TraderDialogManager.PlayCloseTraderDialog( LocalPC );
	}

    //KFPC.bPlayerUsedUpdatePerk should always be set to false here
    KFPC = KFPlayerController(LocalPC);
    if(KFPC != none)
    {
        KFPC.SetHaveUpdatePerk(false);
    }
}

simulated function int GetTraderTimeRemaining()
{
	return max(0, RemainingTime);
}


function float GetHeartbeatAccumulatorAmount()
{
	return SteamHeartbeatAccumulator;
}


//After action report
simulated function OnOpenAfterActionReport(optional float time)
{
	if( time > 0 && Role == ROLE_Authority )
	{
		bStopCountDown = false;
        RemainingTime = time;
		RemainingMinute = time;
	}
}

simulated function ProcessChanceDrop()
{
	`if (`__TW_NETWORKING_)
	SendSteamHeartbeat(); // be sure no time is lost at the end of match
	SendSteamRequestItemDrop(); // see if we've accumulated enough time
	`endif
}

simulated function int GetNextMapTimeRemaining()
{
	return max(0, RemainingTime);
}

/** Called from the GameInfo when the trader pod should be activated */
function SetWaveActive(bool bWaveActive, optional byte NewMusicIntensity)
{
    // set up music intensity for this wave
    MusicIntensity = NewMusicIntensity;
	bTraderIsOpen = !bWaveActive && bMatchHasBegun;
	bForceNetUpdate = true;

    //  replicate track change
    MusicTrackRepCount++;

    if( !IsFinalWave() && WorldInfo.NetMode != NM_DedicatedServer )
    {
        PlayNewMusicTrack( true );
    }
}

simulated function bool IsFinalWave()
{
	return (WaveNum == WaveMax);
}

// Called once a second
simulated event Timer()
{
    local KFGameInfo MyKFGameInfo;

	// Override super RemainingTime handling
	if( WorldInfo.Game == None || WorldInfo.Game.MatchIsInProgress() )
	{
		ElapsedTime++;
	}

    if( Role == ROLE_Authority && bDebugSpawnManager )
    {
        MyKFGameInfo = KFGameInfo(WorldInfo.Game);
        if( MyKFGameInfo != none )
        {
            CurrentAIAliveCount = KFGameInfo(WorldInfo.Game).AIAliveCount;
            if( MyKFGameInfo.SpawnManager != none )
            {
                bCurrentSMFinishedSpawning = MyKFGameInfo.SpawnManager.IsFinishedSpawning();
                CurrentMaxMonsters = MyKFGameInfo.SpawnManager.GetMaxMonsters();
                CurrentTimeTilNextSpawn = MyKFGameInfo.SpawnManager.TimeUntilNextSpawn;
                CurrentTotalWavesActiveTime = MyKFGameInfo.SpawnManager.TotalWavesActiveTime;
                CurrentSineMod = MyKFGameInfo.SpawnManager.GetSineMod();
            }
            else
            {
                bCurrentSMFinishedSpawning = true;
                CurrentMaxMonsters = 0;
                CurrentTimeTilNextSpawn = 0;
                CurrentTotalWavesActiveTime = 0;
            }
        }
    }

	if( WorldInfo.NetMode == NM_Client )
	{
		if( RemainingMinute != 0 )
		{
			RemainingTime = RemainingMinute;
			RemainingMinute = 0;
		}
	}

	if( RemainingTime > 0 && !bStopCountDown )
	{
		RemainingTime--;
		if( WorldInfo.NetMode != NM_Client )
		{
			// Sync the time every 5 seconds, like we did in RO2
			// Unreal's time get's out of sync rather fast
			if( RemainingTime % 5 == 0 )
			{
				RemainingMinute = RemainingTime;
			}
		}
	}
	// End super

	if( WorldInfo.NetMode != NM_DedicatedServer && OpenedTrader != none && RemainingTime > 0 )
	{
		`TraderDialogManager.PlayTraderTickDialog( RemainingTime, GetALocalPlayerController(), WorldInfo );
	}

    // set in native AK callback (ExitCueCallback)
    if( bPendingMusicTrackChange )
    {
        bPendingMusicTrackChange = false;
        PlayNewMusicTrack();
    }
    // fallback in case something goes wrong and we have no music playing
    else if( MusicComp != none && !MusicComp.IsPlaying() )
    {
        PlayNewMusictrack();
    }
}

//@HSL_BEGIN - JRO - 8/24/2016 - Make sure the session guid gets reset when everyone has left.
simulated function RemovePRI(PlayerReplicationInfo PRI)
{
	local UniqueNetId NullId;

	Super.RemovePRI(PRI);

	if(WorldInfo.IsConsoleDedicatedServer())
	{
		if(PRIArray.Length == 0)
		{
			ConsoleGameSessionGuid = "";
			ConsoleGameSessionHost = NullId;
		}
	}
}
//@HSL_END

/** Called by the menu system to determine if perk changes are allowed */
simulated event bool CanChangePerks()
{
	return bTraderIsOpen;
}

/* DisplayDebug()
list important controller attributes on canvas
*/
simulated function DisplayDebug(HUD HUD, out float YL, out float YPos)
{
    local int TotalClots, NumSlashers, NumUnders, NumAlphas;
    //local KFPawn_ZedClot_Slasher KFPS;
    //local KFPawn_ZedClot_Alpha KFPA;
    //local KFPawn_ZedClot_Cyst KFPC;
    local KFPawn_Monster KFPM;
	local Canvas Canvas;

	Canvas = HUD.Canvas;

    Super.DisplayDebug(HUD, YL, YPos);

	//Canvas.SetDrawColor(0,255,255);

    if (HUD.ShouldDisplayDebug('gamestate'))
    {
        Canvas.SetPos(4,YPos);
    	Canvas.DrawText("---------- KFGameInfo GameState Info ----------");
    	YPos += YL;


    	foreach DynamicActors( class'KFPawn_Monster', KFPM )
    	{
    		if( KFPM.IsAliveAndWell() )
    		{
                if( KFPM.IsA('KFPawn_ZedClot_Slasher') )
                {
                    TotalClots++;
                    NumSlashers++;
                }
                else if( KFPM.IsA('KFPawn_ZedClot_Alpha') )
                {
                    TotalClots++;
                    NumAlphas++;
                }
                else if( KFPM.IsA('KFPawn_ZedClot_Cyst') )
                {
                    TotalClots++;
                    NumUnders++;
                }
    		}
    	}

    	if( TotalClots > 0 )
    	{
            Canvas.DrawText("TotalClots:" @ TotalClots @ ", Alpha%:" @ (Float(NumAlphas)/Float(TotalClots))*100 @ ", Slasher%:" @ (Float(NumSlashers)/Float(TotalClots))*100 @ ", UnderDev%:" @ (Float(NumUnders)/Float(TotalClots))*100, FALSE);
        	YPos += YL;
        	Canvas.SetPos(4,YPos);
    	}
    	else
    	{
        	Canvas.DrawText("TotalClots: 0", FALSE);
        	YPos += YL;
        	Canvas.SetPos(4,YPos);
    	}

    	Canvas.DrawText("CurrentSineMod:" @ CurrentSineMod @ ", CurrentNextSpawnTime:" @ CurrentNextSpawnTime, FALSE);
    	YPos += YL;
    	Canvas.SetPos(4,YPos);
	}

    if (HUD.ShouldDisplayDebug('gamespeed'))
    {
        Canvas.SetPos(4,YPos);
    	Canvas.DrawText("---------- GameSpeed Info ----------");
    	YPos += YL;

        Canvas.DrawText("GameSpeed:" @ WorldInfo.TimeDilation);
    	YPos += YL;
    	Canvas.SetPos(4,YPos);
	}
}

simulated function int GetNumPlayersAlive()
{
    local int i, NumPlayersAlive;
    local array< KFPlayerReplicationInfo > PRIs;

    GetKFPRIArray(PRIs);

    for ( i = 0; i < PRIs.Length; i++ )
    {
        if( PRIs[i].PlayerHealth > 0 )
        {
            NumPlayersAlive++;
        }
    }

    return NumPlayersAlive;
}

simulated function bool AnyPlayersAlive()
{
    return GetNumPlayersAlive() > 0;
}

/** Add recently used spawn volumes to the array for the tracker map */
function AddRecentSpawnVolume( vector VolumeLocation, optional bool bPortalSpawn )
{
    LastSpawnVolumeIndex++;

    if( LastSpawnVolumeIndex > (ArrayCount(SpawnVolumeInfos) - 1) )
    {
        LastSpawnVolumeIndex = 0;
    }

    SpawnVolumeInfos[LastSpawnVolumeIndex].VolumeLocation = VolumeLocation;
    SpawnVolumeInfos[LastSpawnVolumeIndex].UsedTime = WorldInfo.TimeSeconds;
    SpawnVolumeInfos[LastSpawnVolumeIndex].bPortalSpawn = bPortalSpawn;
    SpawnVolumeInfos[LastSpawnVolumeIndex].VolumeAge = 255;
    bNetDirty = true;
}

/** Add recently used spawn volumes to the array for the tracker map */
function AddFailedSpawn( vector SpawnLocation, optional bool bPortalSpawn )
{
    LastFailedSpawnIndex++;

    if( LastFailedSpawnIndex > (ArrayCount(FailedSpawnInfos) - 1) )
    {
        LastFailedSpawnIndex = 0;
    }

    FailedSpawnInfos[LastFailedSpawnIndex].VolumeLocation = SpawnLocation;
    FailedSpawnInfos[LastFailedSpawnIndex].UsedTime = WorldInfo.TimeSeconds;
    FailedSpawnInfos[LastFailedSpawnIndex].bPortalSpawn = bPortalSpawn;
    bNetDirty = true;
}

/** Network: Server */
event Tick(float DeltaTime)
{
	super.Tick( DeltaTime );

`if(`notdefined(ShippingPC))
	// If the tracker map is enabled update the various elements for replication
	if( bTrackingMapEnabled )
	{
        UpdateSpawnVolumes();

        if( UpdateZedInfoInterval <= 0 )
        {
            UpdateZedList();
            UpdateZedInfoInterval = default.UpdateZedInfoInterval;
        }
        else
        {
            UpdateZedInfoInterval -= DeltaTime;
        }

        if( UpdateHumanInfoInterval <= 0 )
        {
            UpdateHumanList();
            UpdateHumanInfoInterval = default.UpdateHumanInfoInterval;
        }
        else
        {
            UpdateHumanInfoInterval -= DeltaTime;
        }

        if( UpdatePickupInfoInterval <= 0 )
        {
            UpdatePickupList();
            UpdatePickupInfoInterval = default.UpdatePickupInfoInterval;
        }
        else
        {
            UpdatePickupInfoInterval -= DeltaTime;
        }
    }
`endif
}

/** Update the pickup array for the tracker map */
function UpdatePickupList()
{
    local int i, j;
	local KFGameInfo KFGameInfo;

	KFGameInfo = KFGameInfo(WorldInfo.Game);

	if( KFGameInfo == none )
	{
		return;
	}

    i=0;

    for (j = 0; j < KFGameInfo.AllPickupFactories.Length; j++)
    {
        if( i < ArrayCount(PickupInfos) )
        {
            if( KFGameInfo.AllPickupFactories[j] != none && !KFGameInfo.AllPickupFactories[j].bPickupHidden )
            {
                PickupInfos[i].PickupLocation = KFGameInfo.AllPickupFactories[j].Location;
                if( KFGameInfo.AllPickupFactories[j].CurrentPickupIsAmmo() )
                {
                    PickupInfos[i].PickupType = 0;
                }
                else if( KFGameInfo.AllPickupFactories[j].CurrentPickupIsWeapon() )
                {
                    PickupInfos[i].PickupType = 1;
                }
                else if( KFGameInfo.AllPickupFactories[j].CurrentPickupIsArmor() )
                {
                    PickupInfos[i].PickupType = 2;
                }
                else
                {
                    PickupInfos[i].PickupType = -1;
                }
                bNetDirty = true;
                i++;
            }
        }
    }

    // Zero out the rest
    for (i=i; i < ArrayCount(PickupInfos); i++)
    {
        PickupInfos[i].PickupLocation = vect(0,0,0);
        PickupInfos[i].PickupType = -1;
        bNetDirty = true;
    }
}

/** Update the spawn volumes array for the tracker map */
function UpdateSpawnVolumes()
{
    local int i;

	for (i = 0; i < ArrayCount(SpawnVolumeInfos); i++)
	{
        if( !IsZero(SpawnVolumeInfos[i].VolumeLocation) )
        {
            // Clear out older spawn volumes
            if( SpawnVolumeInfos[i].bPortalSpawn && `TimeSince(SpawnVolumeInfos[i].UsedTime) > 5.0 )
            {
                SpawnVolumeInfos[i].VolumeLocation = vect(0,0,0);
                bNetDirty = true;
            }
            else if( `TimeSince(SpawnVolumeInfos[i].UsedTime) > 30.0 )
            {
                SpawnVolumeInfos[i].VolumeLocation = vect(0,0,0);
                bNetDirty = true;
            }
            else
            {
                if( SpawnVolumeInfos[i].bPortalSpawn )
                {
                    SpawnVolumeInfos[i].VolumeAge = ((5 - `TimeSince(SpawnVolumeInfos[i].UsedTime))/5) * 255;
                }
                else
                {
                    SpawnVolumeInfos[i].VolumeAge = ((30 - `TimeSince(SpawnVolumeInfos[i].UsedTime))/30) * 255;
                }
            }
        }
	}

	for (i = 0; i < ArrayCount(FailedSpawnInfos); i++)
	{
        if( !IsZero(FailedSpawnInfos[i].VolumeLocation) )
        {
            // Clear out older failed spawns
            if( `TimeSince(FailedSpawnInfos[i].UsedTime) > 10.0 )
            {
                FailedSpawnInfos[i].VolumeLocation = vect(0,0,0);
                bNetDirty = true;
            }
        }
	}
}

/** Update the zed array for the tracker map */
function UpdateZedList()
{
	local KFPawn_Monster KFPM;
    local int i;
    local bool bFoundZed;

	// Clear out dead or destroyed zeds
    for (i = 0; i < ArrayCount(ZedInfos); i++)
	{
        if( (ZedInfos[i].Zed == none && !IsZero(ZedInfos[i].ZedLocation))
            || (ZedInfos[i].Zed != none && !ZedInfos[i].Zed.IsAliveAndWell()) )
        {
            ZedInfos[i].ZedLocation = vect(0,0,0);
            ZedInfos[i].Zed = none;
            ZedInfos[i].ZedClass = none;
            ZedInfos[i].bUsingSuperSpeed = false;
            ZedInfos[i].Enemy = None;
            ZedInfos[i].EnemyLocation = vect(0,0,0);
            ZedInfos[i].LastTeleportLocation = vect(0,0,0);
            bNetDirty = true;
        }
	}

	foreach WorldInfo.Allpawns(class'KFPawn_Monster', KFPM)
	{
		if ( KFPM.IsAliveAndWell() )
		{
            bFoundZed = false;

        	// See if this zed is already in the array, and update it
            for (i = 0; i < ArrayCount(ZedInfos); i++)
        	{
                if( ZedInfos[i].Zed == KFPM )
                {
                    ZedInfos[i].ZedLocation = KFPM.Location;
                    ZedInfos[i].bUsingSuperSpeed = KFPM.bUseHiddenSpeed;

                    if( KFPM.Controller != none && KFAIController(KFPM.Controller) != none
                        && `TimeSince(KFAIController(KFPM.Controller).LastTeleportTime) < 5.0 )
                    {
                        ZedInfos[i].LastTeleportLocation = KFAIController(KFPM.Controller).LastTeleportLocation;
                    }
                    else
                    {
                        ZedInfos[i].LastTeleportLocation = vect(0,0,0);
                    }

                    if( KFPM.Controller != none && KFPM.Controller.Enemy != none )
                    {
                        ZedInfos[i].Enemy = KFPawn(KFPM.Controller.Enemy);
                        ZedInfos[i].EnemyLocation = KFPM.Controller.Enemy.Location;
                    }
                    else
                    {
                        ZedInfos[i].Enemy = None;
                        ZedInfos[i].EnemyLocation = vect(0,0,0);
                    }
                    bFoundZed = true;
                    bNetDirty = true;
                    break;
                }
        	}

            if( !bFoundZed )
            {
            	// Add this zed to an empty slot
                for (i = 0; i < ArrayCount(ZedInfos); i++)
            	{
                    if( ZedInfos[i].Zed == none )
                    {
                        ZedInfos[i].ZedLocation = KFPM.Location;
                        ZedInfos[i].Zed = KFPM;
                        ZedInfos[i].ZedClass = KFPM.class;
                        ZedInfos[i].bUsingSuperSpeed = KFPM.bUseHiddenSpeed;
                        if( KFPM.Controller != none && KFPM.Controller.Enemy != none )
                        {
                            ZedInfos[i].Enemy = KFPawn(KFPM.Controller.Enemy);
                            ZedInfos[i].EnemyLocation = KFPM.Controller.Enemy.Location;
                        }
                        else
                        {
                            ZedInfos[i].Enemy = None;
                            ZedInfos[i].EnemyLocation = vect(0,0,0);
                        }
                        if( KFPM.Controller != none && KFAIController(KFPM.Controller) != none
                            && `TimeSince(KFAIController(KFPM.Controller).LastTeleportTime) < 5.0 )
                        {
                            ZedInfos[i].LastTeleportLocation = KFAIController(KFPM.Controller).LastTeleportLocation;
                        }
                        else
                        {
                            ZedInfos[i].LastTeleportLocation = vect(0,0,0);
                        }
                        bNetDirty = true;
                        break;
                    }
            	}
        	}
		}
	}
}

/** Update the human array for the tracker map */
function UpdateHumanList()
{
	local KFPawn_Human KFPH;
    local int i;
    local bool bFoundHuman;

	// Clear out dead or destroyed humans
    for (i = 0; i < ArrayCount(HumanInfos); i++)
	{
        if( (HumanInfos[i].Human == none && !IsZero(HumanInfos[i].HumanLocation))
            || (HumanInfos[i].Human != none && !HumanInfos[i].Human.IsAliveAndWell()) )
        {
            HumanInfos[i].HumanLocation = vect(0,0,0);
            HumanInfos[i].Human = none;
            HumanInfos[i].HumanClass = none;
            bNetDirty = true;
        }
	}

	foreach WorldInfo.Allpawns(class'KFPawn_Human', KFPH)
	{
		if ( KFPH.IsAliveAndWell() )
		{
            bFoundHuman = false;

        	// See if this human is already in the array, and update it
            for (i = 0; i < ArrayCount(HumanInfos); i++)
        	{
                if( HumanInfos[i].Human == KFPH )
                {
                    HumanInfos[i].HumanLocation = KFPH.Location;
                    bFoundHuman = true;
                    bNetDirty = true;
                    break;
                }
        	}

            if( !bFoundHuman )
            {
            	// Add this zed to an empty slot
                for (i = 0; i < ArrayCount(HumanInfos); i++)
            	{
                    if( HumanInfos[i].Human == none )
                    {
                        HumanInfos[i].HumanLocation = KFPH.Location;
                        HumanInfos[i].Human = KFPH;
                        HumanInfos[i].HumanClass = KFPH.class;
                        bNetDirty = true;
                        break;
                    }
            	}
        	}
		}
	}
}

native function UpdateMusicTrack( KFMusicTrackInfo NextMusicTrackInfo, bool bPlayStandardTrack );

simulated function PlayNewMusicTrack( optional bool bGameStateChanged, optional bool bForceAmbient )
{
    local KFMapInfo             KFMI;
    local class<KFGameInfo>     KFGameClass;
    local KFMusicTrackInfo      NextMusicTrackInfo;
    local bool                  bLoop;
	local bool					bPlayActionTrack;

    if ( class'KFGameEngine'.static.CheckNoMusic() )
    {
        return;
    }

	KFGameClass = class<KFGameInfo>(GameClass);
	if ( KFGameClass == None )
	{
		return;
	}

	// @todo: consider using music intensity (255?) for ambient music to simplify this logic
	bPlayActionTrack = (!bForceAmbient && KFGameClass.static.ShouldPlayActionMusicTrack(self));

    // if we've just transitioned into the "action" phase of the game,
    // check if we need to delay the action music
    if( bGameStateChanged )
    {
        if( bPlayActionTrack )
        {
            if( KFGameClass.default.ActionMusicDelay > 0 )
            {
                SetTimer( KFGameClass.default.ActionMusicDelay, false, nameof(PlayNewMusicTrack) );
                return;
            }
        }
    }
    else if( CurrentMusicTrackInfo != none )
    {
        bLoop = CurrentMusicTrackInfo.bLoop;
    }

    // loop if we're designated to loop or this is the boss wave
    if( bLoop || IsFinalWave() )
    {
        NextMusicTrackInfo = CurrentMusicTrackInfo;
    }
    else
    {
        KFMI = KFMapInfo(WorldInfo.GetMapInfo());
        if ( KFMI != none )
        {
            NextMusicTrackInfo = KFMI.GetNextMusicTrackByGameIntensity(bPlayActionTrack, MusicIntensity);
        }
        else
        {
            // Some maps might not be setup correctly, let's just grab a random default song
            NextMusicTrackInfo = class'KFMapInfo'.static.StaticGetRandomTrack(bPlayActionTrack);
        }
    }

    UpdateMusicTrack( NextMusicTrackInfo, KFGameEngine(Class'Engine'.static.GetEngine()).bMusicVocalsEnabled );
}

simulated function ForceNewMusicTrack( KFMusicTrackInfo ForcedTrackInfo )
{
    if( Role == ROLE_Authority )
    {
        ReplicatedMusicTrackInfo = ForcedTrackInfo;
    }

    UpdateMusicTrack( ForcedTrackInfo, KFGameEngine(Class'Engine'.static.GetEngine()).bMusicVocalsEnabled );
}

/***********************************************************
@name Voting
************************************************************/

function ServerStartVoteKick(PlayerReplicationInfo PRI_Kickee, PlayerReplicationInfo PRI_Kicker)
{
	if(VoteCollector != none)
	{
		VoteCollector.ServerStartVoteKick(PRI_Kickee, PRI_Kicker);
	}
}

reliable server function RecieveVoteKick(PlayerReplicationInfo PRI, bool bKick)
{
	if(VoteCollector != none)
	{
		VoteCollector.RecieveVoteKick(PRI, bKick);
	}
}

reliable server function ReceiveVoteMap(PlayerReplicationInfo PRI, int MapIndex)
{
	if(VoteCollector != none)
	{
		VoteCollector.ReceiveVoteMap( PRI, MapIndex);
	}
}

/***********************************************************
@name Ranking
************************************************************/

final private event NotifyGameUnranked()
{
	if( WorldInfo.Game != none )
	{
		WorldInfo.Game.UpdateGameSettings();
	}
}

/***********************************************************
@name Post Round Info
************************************************************/

function int GetCurrentRoundNumber();

/***********************************************************
@name Team management
************************************************************/
simulated function bool AreTeamsOutOfBalanced();

defaultproperties
{
	TraderItems=KFGFxObject_TraderItems'GP_Trader_ARCH.DefaultTraderItems'

	TraderDialogManagerClass=class'KFGame.KFTraderDialogManager'
	VoteCollectorClass=class'KFGame.KFVoteCollector'
	UpdateZedInfoInterval=0.5
	UpdateHumanInfoInterval=0.5
	UpdatePickupInfoInterval=1.0
	WaveMax=255
	bAllowSwitchTeam=false
}
