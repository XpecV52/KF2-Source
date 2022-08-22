//=============================================================================
// KFGFxWidget_PartyInGame
//=============================================================================
// The party widget that is used while in game which usese the KFPlayerReplicationInfo to be updated
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 11/14/2013
//=============================================================================

class KFGFxWidget_PartyInGame extends KFGFxWidget_BaseParty;

function InitializeWidget()
{
	local KFGameReplicationInfo KFGRI;

	super.InitializeWidget();
	SetReadyButtonVisibility(true);

	KFGRI = KFGameReplicationInfo( GetPC().WorldInfo.GRI );
	if ( KFGRI != none )
	{
		if (KFGRI.bMatchHasBegun || KFGRI.bMatchIsOver)
		{
			GetObject("matchStartContainer").SetVisible(false);
			if (GetPC().PlayerReplicationInfo.bReadyToPlay || KFGRI.bMatchIsOver)
			{
				GetObject("readyButton").SetVisible(false);
			}
		}
		StartCountdown(KFGRI.RemainingTime, false);		
	}	
}

function LocalizeText()
{
	local int SlotIndex;

	super.LocalizeText();

	for ( SlotIndex = 0; SlotIndex < PlayerSlots; SlotIndex++ )
	{
		 MemberSlots[SlotIndex].MemberSlotObject.SetString("readyText", PlayerReadyString);
	}
}

function UpdateReadyButtonVisibility()
{
	local KFGameReplicationInfo KFGRI;
	if(bReadyButtonVisible)
	{
		KFGRI = KFGameReplicationInfo( GetPC().WorldInfo.GRI );
		if ( KFGRI != none )
		{
			if (KFGRI.bMatchHasBegun || KFGRI.bMatchIsOver)
			{
				GetObject("matchStartContainer").SetVisible(false);
				if (GetPC().PlayerReplicationInfo.bReadyToPlay || KFGRI.bMatchIsOver)
				{
					GetObject("readyButton").SetVisible(false);
				}
			}
		}
	}
}

/****************************************************************************
*	Slot Component Updates
****************************************************************************/
function OneSecondLoop()
{
	RefreshParty();
	UpdateReadyButtonVisibility();
}

//==============================================================
// @VOIP
//==============================================================

function UpdateVOIP(PlayerReplicationInfo PRI, bool bIsTalking)
{
	local int i;
	local KFPlayerReplicationInfo KFPRI;

	KFPRI = KFPlayerReplicationInfo(PRI);

	for (i = 0; i < PlayerSlots; i++)
	{
		if(MemberSlots[i].PlayerUID == KFPRI.UniqueId)
		{
			// TODO:  Right now we are using VOIPStatus to determine if someone is talking.  This does not take into account if we SHOULD show that someone is talking 
			// (i.e. Player 1 mutes Player 2.  Right now Player 2 can see that Player 1 is still talking. )
			MemberSlots[i].MemberSlotObject.SetBool("isTalking", bIsTalking);
		}
	}
}

//==============================================================
// Refreshing
//==============================================================

function GetKFPRIArray( out array<KFPlayerReplicationInfo> KFPRIArray )
{
	local PlayerController PC;
	local KFGameReplicationInfo KFGRI;

	PC = GetPC();

	if ( PC == none || PC.WorldInfo == none || PC.WorldInfo.GRI == none )
	{
	 	return;
	}

	KFGRI = KFGameReplicationInfo( GetPC().WorldInfo.GRI );
	if ( KFGRI != none )
	{
	 	KFGRI.GetKFPRIArray( KFPRIArray );
	}
}

// Calls the lobby component to see if a refresh is necessary and updates the necessary data
function RefreshParty()
{
	local array<KFPlayerReplicationInfo> KFPRIArray;
	local int SlotIndex;

	super.RefreshParty();

	GetKFPRIArray( KFPRIArray );
	if ( KFPRIArray.Length <= 0 )
	{
	 	return;
	}
	if(PartyChatWidget != none)
	{
		PartyChatWidget.SetLobbyChatVisible(KFPRIArray.Length > 1);
	}

	UpdateInLobby(KFPRIArray.Length > 1);		

	OccupiedSlots = KFPRIArray.Length;
	
	for ( SlotIndex = 0; SlotIndex < PlayerSlots; SlotIndex++ )
	{
		if ( SlotIndex < KFPRIArray.Length )
		{
            RefreshSlot( SlotIndex, KFPRIArray[SlotIndex] );
		}
		else if ( MemberSlots[SlotIndex].bIsSlotTaken )
		{
         	EmptySlot(SlotIndex);
		}
	}
	SetBool("bInParty", bInLobby || ( GetPC().WorldInfo.NetMode != NM_Standalone ));
	UpdateSoloSquadText();
}

// Check which aspect of the slot has changed and update it
function RefreshSlot(int SlotIndex, KFPlayerReplicationInfo KFPRI)
{
	local string PlayerName;
	local UniqueNetId AdminId;
	local UniqueNetId PlayerID;
	local bool bIsLeader;
	local bool bIsMyPlayer;
	local string PerkIconPath;
	local class<KFPerk> CurrentPerkClass;
	local byte CurrentPerkLevel;
	local KFGameReplicationInfo KFGRI;
	local PlayerController PC;

	PC = GetPC();
	KFGRI = KFGameReplicationInfo( PC.WorldInfo.GRI );

	if(KFPC.CurrentPerk == none || KFPRI.CurrentPerkClass == none)
	{
		`log("FAILED TO UPDATE SLOT: "@SlotIndex, ,'DevGFxUI');
		return;
	}
	
   	UpdatePlayerReady( SlotIndex, KFPRI.bReadyToPlay && !KFGRI.bMatchHasBegun );

	// Update this players perk information
	CurrentPerkClass = KFPRI.CurrentPerkClass;
	CurrentPerkLevel = KFPRI.GetActivePerkLevel();

	if ( MemberSlots[SlotIndex].PerkClass != CurrentPerkClass || MemberSlots[SlotIndex].PerkLevel != CurrentPerkLevel )
	{
		MemberSlots[SlotIndex].PerkClass = CurrentPerkClass;

		PerkIconPath = "img://"$CurrentPerkClass.static.GetPerkIconPath();
		UpdatePerk(SlotIndex, CurrentPerkClass.default.PerkName, string(CurrentPerkLevel), PerkIconPath);		
	}

	if ( MemberSlots[SlotIndex].PlayerUID != KFPRI.UniqueId )
 	{
		// Mark this slot as being filled
 		MemberSlots[SlotIndex].bIsSlotTaken = true;

 		// Get if we are the leader
		PlayerID = KFPRI.UniqueId;
		MemberSlots[SlotIndex].PlayerUID = PlayerID;
		MemberSlots[SlotIndex].PRI = KFPRI;

		if( OnlineLobby != none )
		{
			OnlineLobby.GetLobbyAdmin( OnlineLobby.GetCurrentLobbyId(), AdminId);
		}

		if ( class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis) )
		{
			// Console check to make sure we aren't in a solo game
			bIsLeader = (PlayerID == AdminId) && ( GetPC().WorldInfo.NetMode != NM_Standalone );
		}
		else
		{
			bIsLeader = (PlayerID == AdminId);
		}

		// Check if this is our player we are updating
		bIsMyPlayer = (GetPC().PlayerReplicationInfo.UniqueId == PlayerID);

		// Request this players avatar image
 		

		// Update this slots player name
	 	PlayerName = KFPRI.PlayerName;
		UpdatePlayerName( SlotIndex, PlayerName );

		// Update the players slot
		SlotChanged( SlotIndex, true, bIsMyPlayer, bIsLeader );
		// Update the muted state of this slotobject.
		MemberSlots[SlotIndex].MemberSlotObject.SetBool("isMuted", PC.IsPlayerMuted(PlayerID) );
 	}
	// E3 build force update of player name
	else if( class'WorldInfo'.static.IsE3Build() )
	{
		// Update this slots player name
		PlayerName = KFPRI.PlayerName;
		UpdatePlayerName( SlotIndex, PlayerName );
	}

	CreatePlayerOptions(KFPRI.UniqueId, SlotIndex);

	if( class'WorldInfo'.static.IsConsoleBuild( CONSOLE_Orbis ) )
	{
 		MemberSlots[SlotIndex].MemberSlotObject.SetString("profileImageSource", KFPC.GetPS4Avatar(KFPRI.PlayerName));
	}
	else
	{
		MemberSlots[SlotIndex].MemberSlotObject.SetString("profileImageSource", KFPC.GetSteamAvatar(KFPRI.UniqueId));
	}
}


function ToggelMuteOnPlayer(int SlotIndex)
{
	local array<KFPlayerReplicationInfo> KFPRIArray;
	local UniqueNetId PlayerNetID;
	local PlayerController PC;

	PC = GetPC();
	GetKFPRIArray( KFPRIArray );

	if ( KFPRIArray.Length <= 0 )
	{
	 	return;
	}

	if( KFPRIArray.Length > SlotIndex )
	{
		PlayerNetID = KFPRIArray[SlotIndex].UniqueId;
		if(PC.IsPlayerMuted(PlayerNetID))
		{
			PC.ServerUnMutePlayer(PlayerNetID, !class'WorldInfo'.static.IsConsoleBuild()); //@HSL - JRO - 8/2/2016 - 1-way muting on consoles
			if ( MemberSlots[SlotIndex].MemberSlotObject != None )
			{
				MemberSlots[SlotIndex].MemberSlotObject.SetBool("isMuted",false);
			}
		}
		else
		{
			PC.ServerMutePlayer(PlayerNetID, !class'WorldInfo'.static.IsConsoleBuild()); //@HSL - JRO - 8/2/2016 - 1-way muting on consoles
			if ( MemberSlots[SlotIndex].MemberSlotObject != None )
			{
				MemberSlots[SlotIndex].MemberSlotObject.SetBool("isMuted",true);
			}	
		}
		CreatePlayerOptions(PlayerNetID,SlotIndex);		
	}
	super.ToggelMuteOnPlayer(SlotIndex);
}

function ViewProfile(int SlotIndex)
{
	local array<KFPlayerReplicationInfo> KFPRIArray;
	GetKFPRIArray( KFPRIArray );

	if ( KFPRIArray.Length <= 0 || OnlineSub == None || OnlineSub.PlayerInterfaceEx == None )
	{
	 	return;
	}

	if( KFPRIArray.Length > SlotIndex )
	{
		//KFPRIArray[SlotIndex].UniqueId
		//OnlineSub.PlayerInterfaceEx.ShowGamerCardUIByUsername(GetLP().ControllerId,KFPRIArray[SlotIndex].PlayerName);
		if ( GetPC().WorldInfo.IsConsoleBuild(CONSOLE_Orbis) )
		{
			OnlineSub.PlayerInterfaceEx.ShowGamerCardUIByUsername(GetLP().ControllerId,KFPRIArray[SlotIndex].PlayerName);

		}
		else
		{
			OnlineSub.PlayerInterfaceEx.ShowGamerCardUI(GetLP().ControllerId,KFPRIArray[SlotIndex].UniqueId);
		}
		`log("View PLAYER profile: "@KFPRIArray[SlotIndex].PlayerName);
	}
}

//Use the pri array to access the player's UID to send to steam interface. 
//Adding and removing friends through steam will just bring up the overlay.  From there the player will have to click 
//the option to add or remove them based on the friend status.
function AddFriend(int SlotIndex)
{
	local array<KFPlayerReplicationInfo> KFPRIArray;
	local LocalPlayer LocPlayer;

	GetKFPRIArray( KFPRIArray );

	LocPlayer = LocalPlayer(GetPC().Player);

	if(LocPlayer == none)
	{
		return;
	}

	if ( KFPRIArray.Length <= 0 )
	{
	 	return;
	}

	if( SlotIndex < KFPRIArray.Length )
	{
		if( OnlineSub.IsFriend(LocPlayer.ControllerId,KFPRIArray[SlotIndex].UniqueId))
		{
			if( !OnlineSub.RemoveFriend( LocPlayer.ControllerId, KFPRIArray[SlotIndex].UniqueId ) )
			{
				`log("Failed to remove friend!");
			}
		}
		else
		{
			if( !OnlineSub.AddFriend( LocPlayer.ControllerId, KFPRIArray[SlotIndex].UniqueId ) )
			{
				`log("Failed to add friend!");
			}
		}
	}
}

function KickPlayer(int SlotIndex)
{
	local array<KFPlayerReplicationInfo> KFPRIArray;

	GetKFPRIArray( KFPRIArray );	

	if( KFPRIArray.Length <= 0 )
	{
	 	return;
	}

	if( SlotIndex < KFPRIArray.Length )
	{
		KFPlayerReplicationInfo(GetPC().PlayerReplicationInfo).ServerStartKickVote(KFPRIArray[SlotIndex], GetPC().PlayerReplicationInfo);	
	}	
}

function UpdatePlayerReady( int SlotIndex, bool bReady )
{
    MemberSlots[SlotIndex].MemberSlotObject.SetBool("ready", bReady);
   	MemberSlots[SlotIndex].bIsReady = bReady;
}

defaultproperties
{
}