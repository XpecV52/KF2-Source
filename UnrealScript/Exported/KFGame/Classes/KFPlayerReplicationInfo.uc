//=============================================================================
// KFPlayerReplicationInfo
//=============================================================================
// A PlayerReplicationInfo is created for every player on a server (or in a standalone game).
// Players are PlayerControllers, or other Controllers with bIsPlayer=true
// PlayerReplicationInfos are replicated to all clients, and contain network game relevant information about the player,
// such as playername, score, etc.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFPlayerReplicationInfo extends PlayerReplicationInfo
	config(Game)
	native(ReplicationInfo)
	nativereplication
	dependson(KFVoteCollector, KFLocalMessage_VoiceComms);







	







	 



		
		
	



 


 
































































































































































































































#linenumber 52;

#linenumber 20;





































	














#linenumber 21;








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
const KFID_Native4kResolution = 169;#linenumber 22;

/** The time at which this PRI left the game */
var float LastQuitTime;
/** The number of times this PRI has reconnected to this game */
var byte NumTimesReconnected;

/** TRUE if this player has spawned in for the active round. This is used for realtime multipay on PS4 */
var bool bHasSpawnedIn;

/** UTC timestamp representing the last time a crate was gifted to this player. Tracked by server only */
var string LastCrateGiftTimestamp;
/** Seconds of gameplay for this player for crate gifting. Tracked by server only */
var int SecondsOfGameplay;

/** Whether or not dosh can be earned */
var bool bAllowDoshEarning;

/************************************
 *  Character class related variables
 ************************************/

/** This variable exists to tell native our max number of attachments */
const NUM_COSMETIC_ATTACHMENTS = 3;

/** List of all playable characters */
var const array<KFCharacterInfo_Human> CharacterArchetypes;

/** Replication info for player character customization */
struct native CustomizationInfo
{
	/** Index of the current char archetype among the AvailableCharArchetypes array */
	var const int CharacterIndex;
	var const int HeadMeshIndex;
	var const int HeadSkinIndex;
	var const int BodyMeshIndex;
	var const int BodySkinIndex;
	var const int AttachmentMeshIndices[3];
	var const int AttachmentSkinIndices[3];

	structcpptext
	{
		FCustomizationInfo& operator=(FCustomizationInfo& rhs)
		{
			CharacterIndex = rhs.CharacterIndex;
			HeadMeshIndex = rhs.HeadMeshIndex;
			HeadSkinIndex = rhs.HeadSkinIndex;
			BodyMeshIndex = rhs.BodyMeshIndex;
			BodySkinIndex = rhs.BodySkinIndex;
			for(INT i = 0; i < UCONST_NUM_COSMETIC_ATTACHMENTS /*MAX_COSMETIC_ATTACHMENTS*/; ++i)
			{
				AttachmentMeshIndices[i] = rhs.AttachmentMeshIndices[i];
				AttachmentSkinIndices[i] = rhs.AttachmentSkinIndices[i];
			}

			return *this;
		}
	}

	structdefaultproperties
	{
		// Index of `CLEARED_ATTACHMENT_INDEX implies don't use any attachment
		// Note: Array size should match MAX_COSMETIC_ATTACHMENTS
		AttachmentMeshIndices[0]=255
		AttachmentMeshIndices[1]=255
		AttachmentMeshIndices[2]=255
	}
};

/** Current customization settings */
var const repnotify CustomizationInfo RepCustomizationInfo;

/** Texture of render of custom character head. */
var	texture		CharPortrait;

/** 0 is Not Talking, 1 is Public, 2 is Team, 3 is Squad, 4 is Vehicle, 5 is Spectator, 6 is Sequestered Spectator */
var	repnotify byte	VOIPStatus;

/** TRUE if player has registered as a local talker with the OSS */
var repnotify bool bVOIPRegisteredWithOSS;

/** The cumulative amount of damage this player has dealt, resets on team change */
var int DamageDealtOnTeam;

/************************************
 *  Replicated Perk Data
 ************************************/
/** Selected perk info replicated to all */
var  	byte			NetPerkIndex; // @todo: replace with class?
var  			Class<KFPerk>	CurrentPerkClass;
var private 	byte	ActivePerkLevel;
/** Kill assists. Need an integer here because it is very easy to exceed 255 assists. */
var 			int 			Assists;
var 	byte			PlayerHealth; //represented as a percentage
var 	byte			PlayerHealthPercent; //represented as a percentage
/** The firebug range skill increases the range of fire weapons we need to tell other clients if it is on */
var 			bool 			bExtraFireRange;
/** The firebug splash damage skill changes the explosion template */
var 			bool 			bSplashActive;
/** The demo Nuke skill changes the explosion template */
var 			bool 			bNukeActive;
/** The demo Concussive skill changes the explosion template */
var 			bool 			bConcussiveActive;
/** Certain perks can supply ammo etc. We need to replicate that for the HUD */
var 			byte 			PerkSupplyLevel;

/************************************
 *  Not replicated Perk Data,
 *  local client only
 ************************************/
var 			bool 			bPerkPrimarySupplyUsed;
var 			bool 			bPerkSecondarySupplyUsed;

/************************************
 *  Not replicated Voice Comms Request
 *  local client only -ZG
 ************************************/

var 			EVoiceCommsType CurrentVoiceCommsRequest;
var				float 			VoiceCommsStatusDisplayInterval;
var				int 			VoiceCommsStatusDisplayIntervalCount;
var				int 			VoiceCommsStatusDisplayIntervalMax;
var 			Texture2D 		CurrentIconToDisplay;

/************************************
 *  Replicated Unlocks
 ************************************/
 var  		byte		SharedUnlocks;

/************************************
 *  Objective
 ************************************/
 var		bool		bObjectivePlayer;

/************************************
 * Replicated, compressed locations of human players
 ************************************/
var private	Vector 		PawnLocationCompressed;
var private	Vector 		LastReplicatedSmoothedLocation;
var 		bool 		bShowNonRelevantPlayers;

/** Cached (non-replicated) player owner, used by server */
var KFPlayerController KFPlayerOwner;

/************************************
*  native
************************************/
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if ( bNetDirty )
		RepCustomizationInfo, NetPerkIndex, ActivePerkLevel, bHasSpawnedIn,
		CurrentPerkClass, bObjectivePlayer, Assists, PlayerHealth, PlayerHealthPercent,
		bExtraFireRange, bSplashActive, bNukeActive, bConcussiveActive, PerkSupplyLevel,
		CharPortrait, DamageDealtOnTeam, bVOIPRegisteredWithOSS;

  	// sent to non owning clients
 	if ( bNetDirty && (!bNetOwner || bDemoRecording) )
 		VOIPStatus, SharedUnlocks;

 	if( !bNetOwner && bNetDirty )
		PawnLocationCompressed;
}

simulated event ReplicatedEvent(name VarName)
{
	local KFPlayerController LocalPC;
	local PlayerNameIdPair newPlayer;

	if ( VarName == 'RepCustomizationInfo' )
	{
		CharacterCustomizationChanged();
	}
	else if ( VarName == nameof(VOIPStatus) )
	{
		VOIPStatusChanged(self, VOIPStatus > 0);
	}
	else if ( VarName == nameof(Score) )
	{
		UpdateTraderDosh();
	}
	else if ( VarName == 'PlayerName' )
	{
		LocalPC = KFPlayerController(GetALocalPlayerController());
		if( LocalPC != none )
		{
			newPlayer.PlayerName = PlayerName;
			LocalPC.RecentlyMetPlayers.AddItem(newPlayer);

			// Refresh the party widget when the name changes
			if( LocalPC.MyGFxManager != none )
			{
				LocalPC.MyGFxManager.ForceUpdateNextFrame();
			}
		}
	}
	else if (VarName == 'bVOIPRegisteredWithOSS')
	{
		OnTalkerRegistered();
	}


	if ( VarName == 'Team' )
	{
		ClientRecieveNewTeam();
	}

	Super.ReplicatedEvent(VarName);
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	if( Role == ROLE_Authority )
	{
		KFPlayerOwner = KFPlayerController( Owner );
	}
}

/*********************************************************************************************
`*Team management
*********************************************************************************************/
reliable server function ServerSwitchTeam();
reliable client function ClientRecieveNewTeam();

/*********************************************************************************************
`* Current Perk Level
********************************************************************************************* */

simulated function byte GetActivePerkLevel()
{
	return ActivePerkLevel;
}

/*********************************************************************************************
`* VOIP
********************************************************************************************* */


reliable server function ServerNotifyStartVoip()
{
	local int i;
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(Owner);

	//ClearTimer('ClearVOIP');

	if ( !KFGameInfo(WorldInfo.Game).bDisableVOIP && !KFGameInfo(WorldInfo.Game).bDisablePublicVOIPChannel )
	{
		if ( !bOnlySpectator )
		{
			bNetDirty = true;
			bForceNetUpdate = true;

			if(!KFPC.IsLocalController())
			{
				VOIPStatusChanged(self, true);
			}
            VOIPStatus = 1;

			KFPC.VoiceReceivers.Remove(0, KFPC.VoiceReceivers.Length);

			if ( KFPC.Pawn != none && KFPC.Pawn.Health > 0 )
			{
				for ( i = 0; i < WorldInfo.GRI.PRIArray.Length; i++ )
				{
					if ( !WorldInfo.GRI.PRIArray[i].bBot )
					{
						KFPC.VoiceReceivers.AddItem(WorldInfo.GRI.PRIArray[i].UniqueId);

						if ( PlayerController(WorldInfo.GRI.PRIArray[i].Owner) != none )
						{
							PlayerController(WorldInfo.GRI.PRIArray[i].Owner).VoiceSenders.AddItem(UniqueId);
						}
					}
				}
			}
			else if ( KFGameInfo(WorldInfo.Game).bEnableDeadToVOIP )
			{
				for ( i = 0; i < WorldInfo.GRI.PRIArray.Length; i++ )
				{
					if ( !WorldInfo.GRI.PRIArray[i].bBot )
					{
						KFPC.VoiceReceivers.AddItem(WorldInfo.GRI.PRIArray[i].UniqueId);

						if ( PlayerController(WorldInfo.GRI.PRIArray[i].Owner) != none )
						{
							PlayerController(WorldInfo.GRI.PRIArray[i].Owner).VoiceSenders.AddItem(UniqueId);
						}
					}
				}
			}

			if ( KFPC.VoiceReceivers.Length <= 0 )
			{
				KFPC.VoiceReceivers.AddItem(UniqueId);
			}
		}
		else
		{
			ServerStartSpectatorVoiceChat();
		}
	}
	else
	{
		KFPC.VoiceReceivers.Remove(0, KFPC.VoiceReceivers.Length);
		KFPC.VoiceReceivers.AddItem(UniqueId);
	}
}

reliable server function ServerNotifyStartTeamVoip()
{
	local byte TeamIndex;
	local int i;
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(Owner);

	//ClearTimer('ClearVOIP');

	if ( !KFGameInfo(WorldInfo.Game).bDisableVoip )
	{
		TeamIndex = GetTeamNum();

		if ( !bOnlySpectator )
		{
			bNetDirty = true;
			bForceNetUpdate = true;

			if(!KFPC.IsLocalController())
			{
				VOIPStatusChanged(self, true);
			}

            VOIPStatus = 2;

			KFPC.VoiceReceivers.Remove(0, KFPC.VoiceReceivers.Length);

			if ( KFPC.Pawn != none && KFPC.Pawn.Health > 0 )
			{
				for ( i = 0; i < WorldInfo.GRI.PRIArray.Length; i++ )
				{
					if ( !WorldInfo.GRI.PRIArray[i].bBot && (WorldInfo.GRI.PRIArray[i].GetTeamNum() == TeamIndex || !WorldInfo.GRI.bMatchHasBegun || WorldInfo.GRI.bMatchIsOver) )
					{
						KFPC.VoiceReceivers.AddItem(WorldInfo.GRI.PRIArray[i].UniqueId);

						if ( PlayerController(WorldInfo.GRI.PRIArray[i].Owner) != none )
						{
							PlayerController(WorldInfo.GRI.PRIArray[i].Owner).VoiceSenders.AddItem(UniqueId);
						}
					}
				}
			}
			else if ( KFGameInfo(WorldInfo.Game).bEnableDeadToVOIP )
			{
				for ( i = 0; i < WorldInfo.GRI.PRIArray.Length; i++ )
				{
					if ( !WorldInfo.GRI.PRIArray[i].bBot &&
						 (WorldInfo.GRI.PRIArray[i].GetTeamNum() == TeamIndex || !WorldInfo.GRI.bMatchHasBegun || WorldInfo.GRI.bMatchIsOver) )
					{
						KFPC.VoiceReceivers.AddItem(WorldInfo.GRI.PRIArray[i].UniqueId);

						if ( PlayerController(WorldInfo.GRI.PRIArray[i].Owner) != none )
						{
							PlayerController(WorldInfo.GRI.PRIArray[i].Owner).VoiceSenders.AddItem(UniqueId);
						}
					}
				}
			}

			if ( KFPC.VoiceReceivers.Length <= 0 )
			{
				KFPC.VoiceReceivers.AddItem(UniqueId);
			}
		}
		else
		{
			ServerStartSpectatorVoiceChat();
		}
	}
	else
	{
		KFPC.VoiceReceivers.Remove(0, KFPC.VoiceReceivers.Length);
		KFPC.VoiceReceivers.AddItem(UniqueId);
	}
}


function ServerStartSpectatorVoiceChat()
{
	local int i;

	local KFPlayerController KFPC;

	KFPC = KFPlayerController(Owner);

	ClearTimer('ClearVOIP');

	KFPC.VoiceReceivers.Remove(0, KFPC.VoiceReceivers.Length);

	VOIPStatus =KFGameInfo(WorldInfo.Game).bPartitionSpectators ?  6 : 5;

	for ( i = 0; i < WorldInfo.GRI.PRIArray.Length; ++i )
	{
		if ( !WorldInfo.GRI.PRIArray[i].bBot &&
			(!KFGameInfo(WorldInfo.Game).bPartitionSpectators || WorldInfo.GRI.PRIArray[i].bOnlySpectator) )
		{
			KFPC.VoiceReceivers.AddItem(WorldInfo.GRI.PRIArray[i].UniqueId);

			if ( PlayerController(WorldInfo.GRI.PRIArray[i].Owner) != none )
			{
				PlayerController(WorldInfo.GRI.PRIArray[i].Owner).VoiceSenders.AddItem(UniqueId);
			}
		}
	}

	if ( KFPC.VoiceReceivers.Length <= 0 )
	{
		KFPC.VoiceReceivers.AddItem(UniqueId);
	}
}

reliable server function ServerNotifyStopVOIP()
{
	local KFPlayerController KFPC;

	VOIPStatus = 0;
	VOIPStatusChanged(self, false);

	KFPC = KFPlayerController(Owner);

	if( KFPC != none )
	{
	KFPC.VoiceReceivers.Remove(0, KFPC.VoiceReceivers.Length);
	}

	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		while ( KFPC.VoiceSenders.Find('Uid', UniqueId.Uid) != INDEX_NONE )
		{
			KFPC.VoiceSenders.RemoveItem(UniqueId);
		}
	}
}


simulated function VOIPStatusChanged( PlayerReplicationInfo Talker, bool bIsTalking )
{
	local KFPlayerController KFPC;
	local KFPlayerReplicationInfo TalkerKFPRI;
	local KFGFxHudWrapper MyGFxHUD;
	local OnlineSubsystem OSS;

	OSS = class'GameEngine'.static.GetOnlineSubsystem();

    foreach WorldInfo.LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		// BWJ - 10-4-16 - Exit out immediately if local player has a chat restriction
		if( OSS != None && OSS.HasChatRestriction( LocalPlayer(KFPC.Player).ControllerId ) )
		{
			return;
		}

		MyGFxHUD = KFGFxHudWrapper(KFPC.myHUD);

		TalkerKFPRI = KFPlayerReplicationInfo(Talker);
		if( TalkerKFPRI != none )
		{
			if( TalkerKFPRI.VOIPStatus == 6 && !KFPC.PlayerReplicationInfo.bOnlySpectator )
			{
				return;
			}
		}

		if(MyGFxHUD != none && MyGFxHUD.HudMovie != none)
		{
			MyGFxHUD.HudMovie.VOIPWidget.VOIPEventTriggered(Talker, bIsTalking);
		}

		if(KFPC.MyGFxManager != none)
		{
			KFPC.MyGFxManager.UpdateVOIP(Talker, bIsTalking);
		}
	}
}


simulated function OnTalkerRegistered()
{
	local PlayerController LocalPC;
	local int i;
	local KFPlayerReplicationInfo PRI;
	local OnlineSubsystem OnlineSub;

	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();

	LocalPC = GetALocalPlayerController();

	// If there is no PRI for the local player or GRI, we wait (really shouldn't be more than a frame) and try again
	if( LocalPC.PlayerReplicationInfo == None || WorldInfo.GRI == None )
	{
		SetTimer( 0.1, false, nameof(OnTalkerRegistered) );
	}

	if (LocalPC != none && LocalPC.PlayerReplicationInfo != none && WorldInfo.GRI != none)
	{
		// Local player has regigistered
		if (LocalPC.PlayerReplicationInfo == self)
		{
			// Register all other players that have been registered
			for (i = 0; i < WorldInfo.GRI.PRIArray.Length; i++)
			{
				PRI = KFPlayerReplicationInfo(WorldInfo.GRI.PRIArray[i]);
				if (PRI != self && PRI.bVOIPRegisteredWithOSS)
				{
					OnlineSub.VoiceInterface.RegisterRemoteTalker(PRI.UniqueId);
				}
			}
		}
		// Registering someone else other than the local player
		else if (KFPlayerReplicationInfo(LocalPC.PlayerReplicationInfo).bVOIPRegisteredWithOSS)
		{
			OnlineSub.VoiceInterface.RegisterRemoteTalker(UniqueId);
		}
	}
}


// JRO - Make sure the talking icon doesn't continue to show up after leaving
simulated function UnregisterPlayerFromSession()
{
	VOIPStatusChanged(self, false);
	super.UnregisterPlayerFromSession();
}

/*********************************************************************************************
`* Kick Voting
********************************************************************************************* */

reliable client function ShowKickVote(PlayerReplicationInfo PRI, byte VoteDuration, bool bShowChoices)
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(Owner);

	if(KFPC != none && KFPC.MyGFxHUD != none)
	{
		KFPC.MyGFxHUD.ShowKickVote(PRI, VoteDuration, bShowChoices);
	}

	if(KFPC != none && KFPC.MyGFxManager != none && bShowChoices)
	{
		KFPC.MyGFxManager.ShowKickVote(PRI);
	}
}

reliable client function HideKickVote()
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(Owner);

	if(KFPC != none && KFPC.MyGFxHUD != none)
	{
		KFPC.MyGFxHUD.HideKickVote();
	}

	if(KFPC != none && KFPC.MyGFxManager != none)
	{
		KFPC.MyGFxManager.HideKickVote();
	}
}

reliable server function ServerStartKickVote(PlayerReplicationInfo Kickee, PlayerReplicationInfo Kicker)
{
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if(KFGRI != none)
	{
		KFGRI.ServerStartVoteKick(Kickee, Kicker);
	}
}

simulated function CastKickVote(PlayerReplicationInfo PRI, bool bKick)
{
	local KFPlayerController KFPC;

	ServerCastKickVote(self, bKick);

	KFPC = KFPlayerController(Owner);

	if(KFPC != none && KFPC.MyGFxManager != none)
	{
		KFPC.MyGFxManager.HideKickVote();
	}
}

reliable server function ServerCastKickVote(PlayerReplicationInfo PRI, bool bKick)
{
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if(KFGRI != none)
	{
		KFGRI.RecieveVoteKick(PRI, bKick);
	}
}

/*********************************************************************************************
`* Map Vote
********************************************************************************************* */

simulated function CastMapVote(int MapIndex, bool bDoubleClick)
{
	local KFGameInfo KFGI;

	ServerCastMapVote(self, KFGameReplicationInfo(WorldInfo.GRI).VoteCollector.MapList[MapIndex]);

	if(WorldInfo.NetMode == NM_StandAlone)
	{
		KFGI = KFGameInfo(WorldInfo.Game);
		if(KFGI != none)
		{
			//do insta map travel because we are impatient
			KFGI.UpdateCurrentMapVoteTime( bDoubleClick ? 0 : 5 );//insta ish
		}
	}
}

reliable server function ServerCastMapVote(PlayerReplicationInfo PRI, string MapName)
{
	local KFGameReplicationInfo kfGRI;
	local KFGameInfo KFGI;

	KFGI = KFGameInfo(WorldInfo.Game);
	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if(KFGI != none && KFGI.bDisableMapVote)
	{
		return;
	}

	if(KFGRI != none && !bOnlySpectator)
	{
		if(WorldInfo.NetMode == NM_StandAlone)
		{
			KFGRI.ReceiveVoteMap(PRI, KFGameReplicationInfo(WorldInfo.GRI).VoteCollector.MapList.Find(MapName));
		}
		else
		{
			KFGRI.ReceiveVoteMap(PRI, KFGI.GameMapCycles[KFGI.ActiveMapCycle].Maps.Find(MapName));
		}
	}
}

reliable client function RecieveAARMapOption(string MapOption)
{
	local KFGameReplicationInfo kfGRI;
	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if(KFGRI != none && KFGRI.VoteCollector != none)
	{
		KFGRI.VoteCollector.AddMapOption(MapOption);
	}
}

reliable client function RecieveTopMaps(TopVotes VoteObject)
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(Owner);

	if(KFPC != none && KFPC.MyGFxManager != none && KFPC.MyGFxManager.PostGameMenu != none)
	{
		KFPC.MyGFxManager.PostGameMenu.RecieveTopMaps( VoteObject );
	}
}

/*********************************************************************************************
`* Character Customization
********************************************************************************************* */

native reliable server private event ServerSetSharedUnlocks(byte NewUnlocks);

native reliable server private event ServerSetCharacterCustomization(CustomizationInfo NewMeshInfo);

native private function bool SaveCharacterConfig();
native private function bool LoadCharacterConfig(out int CharacterIndex);
native private function RetryCharacterOwnership();
native function ClearCharacterAttachment(int AttachmentIndex);

simulated function ClientInitialize(Controller C)
{
	// workaround for repeated repnotify!?!?
	if ( Role < ROLE_Authority && C == Owner )
	{
		return;
	}

	// Ignore the super since NotifyLocalPlayerTeamReceived is never used
	SetOwner( C );

	if ( C.IsLocalController() )
	{
		KFPlayerController(C).InitializeStats();
		SelectCharacter();
		class'KFUnlockManager'.static.InitSharedUnlocksFor(self);
	}
}

/**
 * Network: Local Player
 * INDEX_NONE will load last character from config
 */
simulated event SelectCharacter( optional int CharIndex=INDEX_None )
{
	local OnlineProfileSettings Settings;

	// If settings are not loaded yet try again later via OnReadProfileSettingsComplete()
	Settings = class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings( LocalPlayer(GetALocalPlayerController().Player).ControllerId );
	if( Settings == none )
	{
		LogInternal("Not selecting character just yet since there's no profile settings");
		return;
	}

	LoadCharacterConfig(CharIndex);

	// Make sure we get a valid character
	if(!class'KFUnlockManager'.static.GetAvailable(CharacterArchetypes[CharIndex]))
	{
		CharIndex = GetAnyAvailableCharacter(CharIndex);
		LoadCharacterConfig(CharIndex);
	}

	// Resave, in case of invalid selection, and then replicate
	Settings.SetProfileSettingValueInt(KFID_StoredCharIndex, CharIndex);
	if ( Role < Role_Authority )
    {
		ServerSetCharacterCustomization( RepCustomizationInfo );
	}
	else
	{
		CharacterCustomizationChanged();
	}
}

/** Returns the first available unlocked character */
private simulated function int GetAnyAvailableCharacter(byte CharIndex)
{
	local byte i;

	for (i = 0; i < CharacterArchetypes.Length; i++)
	{
		if(class'KFUnlockManager'.static.GetAvailable(CharacterArchetypes[CharIndex]))
		{
			return i;
		}
	}

	return 0;
}

/** Config section name for a given character archetype index */
private simulated event string GetCharacterConfigSection(int Idx)
{
	return PathName(CharacterArchetypes[Idx]);
}

/** Called when RepCustomizationInfo is modified. Network: All*/
simulated event CharacterCustomizationChanged()
{
	local KFPawn_Human KFP;
	local KFCharacterInfoBase NewCharArch;

	if(WorldInfo.GRI != none && WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("character_change", self, CharacterArchetypes[RepCustomizationInfo.CharacterIndex].Name);

	foreach WorldInfo.AllPawns(class'KFPawn_Human', KFP)
	{
		if (KFP.PlayerReplicationInfo == self ||
			(KFP.DrivenVehicle != None && KFP.DrivenVehicle.PlayerReplicationInfo == self))
		{
			NewCharArch = CharacterArchetypes[RepCustomizationInfo.CharacterIndex];

			if( NewCharArch != KFP.CharacterArch )
			{
				// selected a new character
				KFP.SetCharacterArch( NewCharArch );
			}
			else if( WorldInfo.NetMode != NM_DedicatedServer )
			{
				// refresh cosmetics only
   				KFP.CharacterArch.SetCharacterMeshFromArch( KFP, self );
			}
		}
	}
}

reliable server private event ServerAnnounceNewSharedContent()
{
	if( WorldInfo.GRI != None && WorldInfo.GRI.bMatchHasBegun )
	{
		BroadcastLocalizedMessage( class'KFLocalMessage_Game', GMT_UserSharingContent, self);
	}
}

/*********************************************************************************************
* General
********************************************************************************************* */

function PlayerReplicationInfo Duplicate()
{
	local KFPlayerReplicationInfo NewKFPRI;

	NewKFPRI = KFPlayerReplicationInfo(super.Duplicate());
	NewKFPRI.LastQuitTime = LastQuitTime;
	NewKFPRI.NumTimesReconnected = NumTimesReconnected;
	return NewKFPRI;
}

function SetPlayerTeam( TeamInfo NewTeam )
{
	if( NewTeam != Team )
	{
		DamageDealtOnTeam = 0;
	}

	super.SetPlayerTeam( NewTeam );

	KFPlayerOwner = KFPlayerController( Owner );

	SetTimer( 1.f, true, nameOf(UpdateReplicatedVariables) );
}

function UpdateReplicatedVariables()
{
	if( !bIsSpectator &&
		KFPlayerOwner != none &&
		KFPlayerOwner.GetTeamNum() == 0 &&
		KFPlayerOwner.Pawn != none &&
		KFPlayerOwner.Pawn.IsAliveAndWell() )
	{
		UpdatePawnLocation();
	}
	else if( !IsZero( PawnLocationCompressed ) )
	{
		PawnLocationCompressed = vect(0,0,0);
	}

	UpdateReplicatedPlayerHealth();
}

/** Called once per second while on the human team to refresh replicated position */
function UpdatePawnLocation()
{
	PawnLocationCompressed = KFPlayerOwner.Pawn.Location;

	// Compress
	PawnLocationCompressed *= 0.01f;
}

function UpdateReplicatedPlayerHealth()
{
	local Pawn OwnerPawn;

	if( KFPlayerOwner != none )
	{
		OwnerPawn = KFPlayerOwner.Pawn;
		if( OwnerPawn != none && OwnerPawn.Health != PlayerHealth )
		{
			PlayerHealth = OwnerPawn.Health;
			PlayerHealthPercent = FloatToByte( float(OwnerPawn.Health) / float(OwnerPawn.HealthMax) );
		}
	}
}

simulated function SetSmoothedPawnIconLocation( vector NewLocation )
{
	LastReplicatedSmoothedLocation = NewLocation;
}

/** Return location used for overhead icon */
simulated function vector GetSmoothedPawnIconLocation(float BlendSpeed)
{
	local vector UncompressedLocation;

	UncompressedLocation = PawnLocationCompressed * 100.f;

	// if new location is nearby add some quick and dirty blending
	// @note: We're faking timestep and making a few assumptions about the HUD
	if ( BlendSpeed > 0 && !IsZero(UncompressedLocation) && VSizeSq(UncompressedLocation - LastReplicatedSmoothedLocation) < Square(768) )
	{
		LastReplicatedSmoothedLocation = VInterpTo( LastReplicatedSmoothedLocation,
                                UncompressedLocation, WorldInfo.DeltaSeconds,
                                VSize(UncompressedLocation - LastReplicatedSmoothedLocation) * BlendSpeed );
	}
	else
	{
		LastReplicatedSmoothedLocation = UncompressedLocation;
	}

	return LastReplicatedSmoothedLocation;
}

simulated function SetPlayerReady( bool bReady )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(Owner);

   	bReadyToPlay = bReady;
	ServerSetPlayerReady( bReady );
	if(KFPC != none && KFPC.LEDEffectsManager != none)
	{
		KFPC.LEDEffectsManager.PlayEffectSetReady(bReadyToPlay);
	}
}

reliable server private function ServerSetPlayerReady( bool bReady )
{
	bReadyToPlay = bReady;
}

/** Called on server to +/- dosh.  Do not modify score directly */
function AddDosh( int DoshAmount, optional bool bEarned )
{
    //If the game has turned off dosh earning for this PRI, early out.
    if (!bAllowDoshEarning && bEarned)
    {
        return;
    }

	// Dosh is stored in PRI->Score
	Score = Max(0, Score + DoshAmount);

    // If the trader menu is open, update our menus dosh
	if ( WorldInfo.NetMode == NM_ListenServer )
	{
		UpdateTraderDosh();
	}

	// If player worked for their dosh track it with the AAR
	if ( bEarned && DoshAmount > 0 )
	{
		if(KFPlayerController(Owner)!= none && KFPlayerController(Owner).MatchStats != none ){KFPlayerController(Owner).MatchStats.RecordIntStat(class'EphemeralMatchStats'.const.MATCH_EVENT_DOSH_EARNED,DoshAmount);};
	}
}

/** Update the dosh in our trader menu if it's open */
simulated function UpdateTraderDosh()
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(Owner);
	if( KFPC != none && KFPC.bClientTraderMenuOpen )
	{
		KFPC.NotifyTraderDoshChanged();
	}
}

simulated event Destroyed()
{
	NotifyHUDofPRIDestroyed();
	super.Destroyed();
}

simulated function NotifyHUDofPRIDestroyed()
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetALocalPlayerController());
	ServerNotifyStopVOIP();
	if( KFPC != none )
	{
		// notify HUD of player disconnect
		if( KFPC.MyGFxHUD != none )
		{
			KFPC.MyGFxHUD.NotifyHUDofPRIDestroyed(self);
	}

		// notify movie manager of remote player disconnect
		if( KFPC != Owner && KFPC.MyGFxManager != None )
	{
			KFPC.MyGFxManager.RemotePlayerDisconnected(UniqueId);
		}
	}
}

/**
 * @brief Increments the death count for the player
 * @details Chris: We have to overwrite it here because people might reconnect
 * 			in the lobby. Disconnecting means death and death means no start dosh.
 * @param Amt num deaths (How often can you die simultaniusly?)
 */
function IncrementDeaths( optional int Amt = 1 )
{
	if( WorldInfo.GRI != None && WorldInfo.GRI.bMatchHasBegun )
	{
		super.IncrementDeaths( Amt );
	}

	PawnLocationCompressed = vect(0,0,0);
}

reliable client function MarkSupplierOwnerUsed( KFPlayerReplicationInfo SupplierPRI, optional bool bReceivedPrimary=true, optional bool bReceivedSecondary=true )
{
	if( SupplierPRI != none )
	{
		SupplierPRI.MarkSupplierUsed( bReceivedPrimary, bReceivedSecondary );
	}
}

simulated function MarkSupplierUsed( bool bReceivedPrimary, bool bReceivedSecondary )
{
	bPerkPrimarySupplyUsed = bPerkPrimarySupplyUsed || bReceivedPrimary;
	bPerkSecondarySupplyUsed = bPerkSecondarySupplyUsed || bReceivedSecondary;
}

simulated function ResetSupplierUsed()
{
	local array<KFPlayerReplicationInfo> KFPRIArray;
	local int i;

	KFGameReplicationInfo(WorldInfo.GRI).GetKFPRIArray( KFPRIArray );

	for( i = 0; i < KFPRIArray.Length; ++i )
	{
		KFPRIArray[i].bPerkPrimarySupplyUsed = false;
		KFPRIArray[i].bPerkSecondarySupplyUsed = false;
	}
}

/**
 * Called when a wave has ended.
 * Network: ALL
 */
simulated function NotifyWaveEnded()
{
	bPerkPrimarySupplyUsed = false;
	bPerkSecondarySupplyUsed = false;
}


// BWJ - 10-5-16 - Check to see if player has had initial spawn. used for PS4 realtime multiplay
native simulated function bool HasHadInitialSpawn();


simulated function SetCurrentVoiceCommsRequest(int NewValue)
{
	//cast it
	CurrentVoiceCommsRequest = EVoiceCommsType(NewValue);

	//clear timers
	ClearVoiceCommsRequest();
	//set timers
	SetCurrentIconToVoiceCommsIcon();
}

//this and SetCurrentIconToVoiceCommsIcon used for flashing last voice comms request icon
simulated function SetCurrentIconToPerkIcon()
{
	CurrentIconToDisplay = None;
	if(VoiceCommsStatusDisplayIntervalCount < VoiceCommsStatusDisplayIntervalMax)
	{
		//clear both timers and reset the count
		VoiceCommsStatusDisplayIntervalCount++;
		SetTimer( VoiceCommsStatusDisplayInterval, false, nameof(SetCurrentIconToVoiceCommsIcon) );
	}
	else
	{
		ClearVoiceCommsRequest();
	}
}

simulated function SetCurrentIconToVoiceCommsIcon()
{
	CurrentIconToDisplay = class'KFLocalMessage_VoiceComms'.default.VoiceCommsIcons[CurrentVoiceCommsRequest];
	SetTimer( VoiceCommsStatusDisplayInterval, false, nameof(SetCurrentIconToPerkIcon) );
}

simulated function ClearVoiceCommsRequest()
{
	ClearTimer('SetCurrentIconToPerkIcon');
	ClearTimer('SetCurrentIconToVoiceCommsIcon');
	VoiceCommsStatusDisplayIntervalCount = 0;
	CurrentIconToDisplay = None;
}

simulated function Texture2D GetCurrentIconToDisplay()
{
	if(CurrentIconToDisplay == none && CurrentPerkClass != none)
	{
		return CurrentPerkClass.default.PerkIcon;
	}

	return CurrentIconToDisplay;
}

defaultproperties
{
   CurrentVoiceCommsRequest=VCT_NONE
   bAllowDoshEarning=True
   bShowNonRelevantPlayers=True
   SecondsOfGameplay=-1
   CharacterArchetypes(0)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Alberts_archetype'
   CharacterArchetypes(1)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_knight_archetype'
   CharacterArchetypes(2)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_briar_archetype'
   CharacterArchetypes(3)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_mark_archetype'
   CharacterArchetypes(4)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_MrFoster_archetype'
   CharacterArchetypes(5)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Jagerhorn_Archetype'
   CharacterArchetypes(6)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Ana_Archetype'
   CharacterArchetypes(7)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Masterson_archetype'
   CharacterArchetypes(8)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_alan_archetype'
   CharacterArchetypes(9)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Coleman_archetype'
   CharacterArchetypes(10)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_DJSkully_archetype'
   CharacterArchetypes(11)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_strasser_archetype'
   CharacterArchetypes(12)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Tanaka_Archetype'
   CharacterArchetypes(13)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_rockabilly_archetype'
   RepCustomizationInfo=(AttachmentMeshIndices[0]=255,AttachmentMeshIndices[1]=255,AttachmentMeshIndices[2]=255)
   VoiceCommsStatusDisplayInterval=0.500000
   VoiceCommsStatusDisplayIntervalMax=5
   Name="Default__KFPlayerReplicationInfo"
   ObjectArchetype=PlayerReplicationInfo'Engine.Default__PlayerReplicationInfo'
}
