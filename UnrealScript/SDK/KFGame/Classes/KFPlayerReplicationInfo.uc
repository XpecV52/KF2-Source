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
	dependson(KFVoteCollector);

`include(KFGame\KFGameAnalytics.uci);
`include(KFGame\KFMatchStats.uci);

/** The time at which this PRI left the game */
var float LastQuitTime;
/** The number of times this PRI has reconnected to this game */
var byte NumTimesReconnected;

/************************************
 *  Character class related variables
 ************************************/

/** This variable exists to tell native our max number of attachments */
const NUM_COSMETIC_ATTACHMENTS = `MAX_COSMETIC_ATTACHMENTS;

/** List of all playable characters */
var const array<KFCharacterInfo_Human> CharacterArchetypes;

/** Replication info for player character customization */
struct native CustomizationInfo
{
	/** Index of the current char archetype among the AvailableCharArchetypes array */
	var const byte CharacterIndex;
	var const byte HeadMeshIndex;
	var const byte HeadSkinIndex;
	var const byte BodyMeshIndex;
	var const byte BodySkinIndex;
	var const byte AttachmentMeshIndices[`MAX_COSMETIC_ATTACHMENTS];
	var const byte AttachmentSkinIndices[`MAX_COSMETIC_ATTACHMENTS];

	structdefaultproperties
	{
		// Index of `CLEARED_ATTACHMENT_INDEX implies don't use any attachment
		// Note: Array size should match MAX_COSMETIC_ATTACHMENTS
		AttachmentMeshIndices[0]=`CLEARED_ATTACHMENT_INDEX
		AttachmentMeshIndices[1]=`CLEARED_ATTACHMENT_INDEX
		AttachmentMeshIndices[2]=`CLEARED_ATTACHMENT_INDEX
	}
};

/** Current customization settings */
var const repnotify CustomizationInfo RepCustomizationInfo;

/** Texture of render of custom character head. */
var	texture	CharPortrait;

/** 0 is Not Talking, 1 is Public, 2 is Team, 3 is Squad, 4 is Vehicle, 5 is Spectator, 6 is Sequestered Spectator */
var	repnotify byte	VOIPStatus;

/************************************
 *  Replicated Perk Data
 ************************************/
/** Selected perk info replicated to all */
var  			byte			NetPerkIndex; // @todo: replace with class?
var  			Class<KFPerk>	CurrentPerkClass;
var private 	byte			ActivePerkLevel;
/** Kill assists. Need an integer here because it is very easy to exceed 255 assists. */
var 			int 			Assists;
var 			byte			PlayerHealth;
var 			byte			PlayerHealthMax;
/** The firebug range skill increases the range of fire weapons we need to tell other clients if it is on */
var 			bool 			bExtraFireRange;
/** The firebug splash damage skill changes the explosion template */
var 			bool 			bSplashActive;
/** The demo Nuke skill changes the explosion template */
var 			bool 			bNukeActive;
/** The demo Concussive skill changes the explosion template */
var 			bool 			bConcussiveActive;
/** Certain perks can supply ammo etc. We need to replicate that for the HUD */
var 			bool 			bPerkCanSupply;

/************************************
 *  Not replicated Perk Data,
 *  local client only
 ************************************/
var 			bool 			bPerkSupplyUsed;

/************************************
 *  Replicated Unlocks
 ************************************/
 var  		byte		SharedUnlocks;	

/************************************
 *  Objective
 ************************************/
 var		bool		bObjectivePlayer;

/************************************
*  native
************************************/
cpptext
{
	INT* GetOptimizedRepList( BYTE* InDefault, FPropertyRetirement* Retire, INT* Ptr, UPackageMap* Map, UActorChannel* Channel );
}

replication
{
	if ( bNetDirty )
		RepCustomizationInfo, NetPerkIndex, ActivePerkLevel,
		CurrentPerkClass, bObjectivePlayer, Assists, PlayerHealth, 
		PlayerHealthMax, bExtraFireRange, bSplashActive, bNukeActive, 
		bConcussiveActive, bPerkCanSupply;

  	// sent to non owning clients
 	if ( bNetDirty && (!bNetOwner || bDemoRecording) )
 		VOIPStatus, SharedUnlocks;
}

simulated event ReplicatedEvent(name VarName)
{
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
	Super.ReplicatedEvent(VarName);
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
}

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
	local KFGameInfo KFGI;

	KFPC = KFPlayerController(Owner);
	if(KFPC == none)
	{
		return;
	}

	KFGI = KFGameInfo(WorldInfo.Game);
	if( KFGI == none )
	{

	}

	if ( !KFGI.bDisableVOIP )
	{
		if ( !bOnlySpectator )
		{
			VOIPStatus = 1;
			bNetDirty = true;
			bForceNetUpdate = true;

			if(!KFPC.IsLocalController())
			{
				VOIPStatusChanged(self, true);
			}

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
			else if ( KFGI.bEnableDeadToDeadVOIP )
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
			else
			{
				VOIPStatus = 0;
				bNetDirty = true;
				bForceNetUpdate = true;
				if(!KFPC.IsLocalController())
				{
					VOIPStatusChanged(self, FALSE);
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
		VOIPStatus = 0;
		bNetDirty = true;
		bForceNetUpdate = true;
		if(!KFPC.IsLocalController())
		{
			VOIPStatusChanged(self, FALSE);
		}
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

	for ( i = 0; i < WorldInfo.GRI.PRIArray.Length; i++ )
	{
		if ( !WorldInfo.GRI.PRIArray[i].bBot && (!KFGameInfo(WorldInfo.Game).bPartitionSpectators ||
			 WorldInfo.GRI.PRIArray[i].GetTeamNum() >= 2 || WorldInfo.GRI.PRIArray[i].bOnlySpectator) )
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

    foreach WorldInfo.LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
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

	ServerCastMapVote(self, MapIndex);

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

reliable server function ServerCastMapVote(PlayerReplicationInfo PRI, int MapIndex)
{
	local KFGameReplicationInfo kfGRI;
	local KFGameInfo KFGI;

	KFGI = KFGameInfo(WorldInfo.Game);
	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if(KFGI != none && KFGI.bDisableMapVote)
	{
		return;
	}

	if(KFGRI != none)
	{
		KFGRI.ReceiveVoteMap(PRI, MapIndex);
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

/** Network: Local Player */
private simulated event SelectCharacter( optional int CharIndex=INDEX_None )
{
	// INDEX_NONE will load last character from config
	LoadCharacterConfig(CharIndex);

	if(!class'KFUnlockManager'.static.GetAvailable(CharacterArchetypes[CharIndex]))
	{
		CharIndex = GetAnyAvailableCharacter(CharIndex);
		LoadCharacterConfig(CharIndex);
	}

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

	`AnalyticsLog(("character_change", self, CharacterArchetypes[RepCustomizationInfo.CharacterIndex].Name));

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

simulated function SetPlayerReady( bool bReady )
{
   	bReadyToPlay = bReady;
	ServerSetPlayerReady( bReady );
}

reliable server private function ServerSetPlayerReady( bool bReady )
{
	bReadyToPlay = bReady;
}

/** Called on server to +/- dosh.  Do not modify score directly */
function AddDosh( int DoshAmount, optional bool bEarned )
{
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
		`RecordAARIntStat(KFPlayerController(Owner), DOSH_EARNED, DoshAmount);
		//`AnalyticsLog(( "dosh_earned", KFPlayerController(Owner).PlayerReplicationInfo, "#"$DoshAmount ));
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
}

reliable client function MarkSupplierOwnerUsed( KFPlayerReplicationInfo SupplierPRI )
{
	if( SupplierPRI != none )
	{
		SupplierPRI.MarkSupplierUsed();
	}
}

simulated function MarkSupplierUsed()
{
	bPerkSupplyUsed = true;
}

simulated function ResetSupplierUsed()
{
	local array<KFPlayerReplicationInfo> KFPRIArray;
	local int i;

	KFGameReplicationInfo(WorldInfo.GRI).GetKFPRIArray( KFPRIArray );
 
	for( i = 0; i < KFPRIArray.Length; ++i )
	{
		KFPRIArray[i].bPerkSupplyUsed = false;	
	}

}

defaultproperties
{
	// Playable characters from archetypes
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Alberts_archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Knight_Archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.chr_briar_archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Mark_archetype')
    CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_MrFoster_archetype')
 	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Jagerhorn_Archetype')
 	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Ana_Archetype')
    CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Masterson_Archetype')
 	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Alan_Archetype')
 	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Coleman_archetype')
 	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.chr_DJSkully_archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Strasser_Archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Tanaka_Archetype')
}