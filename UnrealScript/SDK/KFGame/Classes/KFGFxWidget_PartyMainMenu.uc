//=============================================================================
// KFGFxWidget_PartyMainMenu
//=============================================================================
// The party widget that is used while in the main menu that uses the steam party system
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 11/14/2013
//=============================================================================

class KFGFxWidget_PartyMainMenu extends KFGFxWidget_BaseParty;

var bool bIsInParty;
var int prevMemberCount;

function OneSecondLoop()
{
	local ActiveLobbyInfo LobbyInfo;

	RefreshParty(); //@HSL - JRO - Moving this here so the +people icons properly go away when leaving parties
	if ( OnlineLobby != none && OnlineLobby.IsInLobby())
	{
	    SendMyOptions();
	    SendSearching();
	    UpdateInLobby(true);

		//@HSL_BEGIN - JRO - 8/2/2016 - Making sure users are aware of party discrepancies.
		OnlineLobby.GetCurrentLobby(LobbyInfo);
		if(prevMemberCount != LobbyInfo.Members.length && LobbyInfo.Members.length > 6)
		{
			Manager.OpenPopup(ENotification,
				Localize("Notifications", "PartySizeTitle",   "KFGameConsole"),
				Localize("Notifications", "PartySizeMessage", "KFGameConsole"),
				class'KFCommon_LocalizedStrings'.default.OKString);
		}
		prevMemberCount = LobbyInfo.Members.length;
		//@HSL_END
	}	
	else
	{
		//@HSL_BEGIN - JRO - 8/3/2016 - Make sure non-leader members don't get stuck in the overview screen when leaving a party
		if(class'WorldInfo'.static.IsConsoleBuild() && prevMemberCount != 0 && Manager != none && Manager.StartMenu != none)
		{
			Manager.StartMenu.ShowOverview(false, false, true, false);
		}
		//@HSL_END
		prevMemberCount = 0;
		UpdateInLobby(false);
	}
}

function InitializeWidget()
{
	super.InitializeWidget();
	SetReadyButtonVisibility(false);
}

function SendSearching()
{
	local string SearchingTextString;
	local string SearchingMessage;
	local UniqueNetId AdminId;
	local bool bIsLeader;

	if(Manager == none)
	{
		return;
	}

	if(OnlineLobby != none && OnlineLobby.IsInLobby())
	{
		OnlineLobby.GetLobbyAdmin( OnlineLobby.GetCurrentLobbyId(), AdminId);
		bIsLeader = OnlineLobby.GetMyId() == AdminId;

		if(bIsLeader)
		{
			if(Manager.CurrentMenuIndex == UI_Start)
			{
				if(Manager.bSearchingForGame)
				{
					SearchingTextString = SearchingForGameString;
					SetSearchingText(SearchingTextString);
					SearchingMessage = SearchingForGame;
				}
				//@HSL_BEGIN - JRO - PS4 supports parties outside of multiplayer menus
				else if(Manager.StartMenu.GetStartMenuState() == EMatchmaking)
				{
					SearchingMessage = UpdatingOptions;
				}
				else
				{
					SearchingMessage = InOtherMenu;
				}
				//@HSL_END
			}
			else if(Manager.CurrentMenuIndex == UI_ServerBrowserMenu)
			{
				SearchingMessage = ServerBrowserOpen;
			}
			else
			{
				SearchingMessage = InOtherMenu;
			}
			//Send message out to lobby
			OnlineLobby.LobbyMessage(SearchingPrefix$SearchingMessage);   	
		}
	}
	else if(Manager.bSearchingForGame)
	{
		SearchingTextString = SearchingForGameString;
		SetSearchingText(SearchingTextString);
	}
	else
	{
		SetSearchingText(SearchingTextString);
	}
}

function SetSearchingText(string Message)
{
	SetString("searchingText", Message);
}

// Refresh a slot if any of it's values have changed or a player was removed
function RefreshParty()
{
	local ActiveLobbyInfo LobbyInfo;
	local UniqueNetId AdminId;
	local int SlotIndex;
	local bool bInParty;
	local PlayerController PC;
	local string PlayerName, ReadablePlayerName;
	super.RefreshParty();
	
	if ( OnlineLobby != none && OnlineLobby.GetCurrentLobby(LobbyInfo) )
	{
		//@HSL - JRO - Your own party slot wasn't updating in parties, this fixes it
		if(class'WorldInfo'.static.IsConsoleBuild())
		{
			InitializePerk();
		}

		OnlineLobby.GetLobbyAdmin( OnlineLobby.GetCurrentLobbyId(), AdminId);

		if(PartyChatWidget != none)
		{
			PartyChatWidget.SetLobbyChatVisible(LobbyInfo.Members.Length > 1);
		}

		if( AdminId != LastLeaderID )
		{	
			HandleLeaderChange(AdminId);	
		}		

		OccupiedSlots = LobbyInfo.Members.Length;
		bInParty = (OccupiedSlots > 1) || bInLobby;
		if(bIsInParty != bInParty)
		{
			//clear out the first slot since that is where you are
			EmptySlot(0);
			bIsInParty = bInParty;
		}

		for ( SlotIndex = 0; SlotIndex < PlayerSlots; SlotIndex++ )
		{
			if ( SlotIndex < LobbyInfo.Members.Length )
			{
	            RefreshSlot(SlotIndex, LobbyInfo.Members[SlotIndex].PlayerUID);
			}
			else if ( MemberSlots[SlotIndex].bIsSlotTaken )
			{
	         	EmptySlot(SlotIndex);
			}
		}
	}
	// If we are not in a party, only add our name to the party list
	else
	{
		PC = GetPC();
	    InitializePerk();
		RefreshSlot(0, PC.PlayerReplicationInfo.UniqueId);

	    bInParty = false || bInLobby;
		bIsInParty = bInParty;
	    SetSearchingText("");
		ReadablePlayerName = class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetPlayerNickname(0);
	    if(OnlineLobby != none)
	    {
			PlayerName = OnlineLobby.GetFriendNickname(PC.PlayerReplicationInfo.UniqueId);
	    }

	    UpdatePlayerName(0, PlayerName != "" ? PlayerName : ReadablePlayerName == DefaultPlayerName ? DefaultPlayerName$"0" : ReadablePlayerName );

		MemberSlots[0].PRI = PC.PlayerReplicationInfo;
		MemberSlots[0].PlayerUID = PC.PlayerReplicationInfo.UniqueId;
	    
	    if(PartyChatWidget != none)
		{
	    	PartyChatWidget.SetLobbyChatVisible(false);
		}
	    // Clear out the rest of the list if we are not in a lobby
	    for ( SlotIndex = 1; SlotIndex < PlayerSlots; SlotIndex++ )
		{
			if ( MemberSlots[SlotIndex].bIsSlotTaken )
			{
	         	EmptySlot(SlotIndex);
			}
		}
	}
	UpdateSoloSquadText();
}

function HandleLeaderChange(UniqueNetId AdminId)
{
	local string HostName;
	if(OnlineLobby != none)
	{
		HostName = OnlineLobby.GetFriendNickname(AdminId);
	}
	
	HostName = OnlineLobby.GetFriendNickname(AdminId);
	Manager.HandleSteamLobbyLeaderTakeOver(AdminId);
	if(LastLeaderID != ZeroUniqueId )
	{
		Manager.OpenPopup(ENotification, PartHostLeftString, HostName@PartyLeaderChangedString, class'KFCommon_LocalizedStrings'.default.OKString);
	}
	LastLeaderID = AdminId;
}

// Check which aspect of the slot has changed and update it
function RefreshSlot(int SlotIndex, UniqueNetId PlayerUID)
{
	local string PlayerName,ReadablePlayerName;	
	local UniqueNetId AdminId;
	local bool bIsLeader;
	local bool bIsMyPlayer;
	local bool bUpdateSlot;
	local PlayerController PC;

	PC = GetPC();

	if(OnlineLobby != none)
	{
		OnlineLobby.GetLobbyAdmin( OnlineLobby.GetCurrentLobbyId(), AdminId);
	}
	
	bIsLeader = (PlayerUID == AdminId);

	if ( !MemberSlots[SlotIndex].bIsSlotTaken )
	{
		MemberSlots[SlotIndex].bIsSlotTaken = true;
		bUpdateSlot = true;
	}

	if ( MemberSlots[SlotIndex].bIsLeader != bIsLeader )
	{
		MemberSlots[SlotIndex].bIsLeader = bIsLeader;
		bUpdateSlot = true;
	}

	if ( MemberSlots[SlotIndex].PlayerUID != PlayerUID )
	{
		MemberSlots[SlotIndex].PlayerUID = PlayerUID;
		bIsMyPlayer = (PC.PlayerReplicationInfo.UniqueId == PlayerUID);
		bUpdateSlot = true;
	}

	if(OnlineLobby != none)
	{
		PlayerName = OnlineLobby.GetFriendNickname(PlayerUID);
	}
	
	if (PlayerName == "")
	{
		ReadablePlayerName = PC.PlayerReplicationInfo.GetHumanReadableName();
		PlayerName = ReadablePlayerName == DefaultPlayerName ? DefaultPlayerName$SlotIndex : ReadablePlayerName;
	}
	// Make sure to use the name you just looked up.  -HSL_BB
	UpdatePlayerName(SlotIndex,PlayerName);
	
	if ( bUpdateSlot )
	{
		SlotChanged( SlotIndex, true, bIsMyPlayer, bIsLeader );
		CreatePlayerOptions(PlayerUID, SlotIndex);
	}

	if( class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis) )
	{
		MemberSlots[SlotIndex].MemberSlotObject.SetString("profileImageSource", KFPC.GetPS4Avatar(PlayerName));
	}
	else
	{
		MemberSlots[SlotIndex].MemberSlotObject.SetString("profileImageSource", KFPC.GetSteamAvatar(PlayerUID));
	}
}


function InitializePerk()
{
	local KFPerk CurrentPerk;
	local string PerkIconPath;
	local class<KFPerk> PerkClass;
	local byte PerkLevel;

	CurrentPerk = KFPC.GetPerk();
	if (CurrentPerk != none)
	{
		PerkClass = KFPlayerReplicationInfo(GetPC().PlayerReplicationInfo).CurrentPerkClass;
		PerkLevel = CurrentPerk.GetLevel();
		if (PerkClass != MemberSlots[0].PerkClass || PerkLevel != MemberSlots[0].PerkLevel)
		{
			MemberSlots[0].PerkClass = PerkClass;
			PerkIconPath = "img://"$CurrentPerk.GetPerkIconPath();
			UpdatePerk(0, CurrentPerk.PerkName, string(PerkLevel), PerkIconPath);
		}		
	}
}

/****************************************************************************
*	Sending / Receiving steam data
****************************************************************************/

// As a member of party, check to see if your options are different than the party leaders
function UpdatePerks(string Message)
{
	local array<string> PlayerInfoStrings;
	local UniqueNetId PlayerID;
	local string PerkName, IconPath, PerkLevel;
	local ActiveLobbyInfo LobbyInfo;
	local byte i;
	local int PerkIndex;

	ParseStringIntoArray(Message, PlayerInfoStrings, "/", true);
	class'OnlineSubsystem'.static.StringToUniqueNetId(PlayerInfoStrings[0], PlayerID);
	PerkIndex = int(PlayerInfoStrings[1]);
	PerkName = KFPC.PerkList[PerkIndex].PerkClass.default.PerkName;
	IconPath = "img://"$KFPC.PerkList[PerkIndex].PerkClass.static.GetPerkIconPath();
	PerkLevel = PlayerInfoStrings[2];

    if(OnlineLobby == none)
	{
		return;
	}

	if (OnlineLobby.GetCurrentLobby(LobbyInfo))
	{
		for (i = 0; i < LobbyInfo.Members.Length; i++)
		{
			if (LobbyInfo.Members[i].PlayerUID == PlayerID)
			{
				UpdatePlayerName( i, OnlineLobby.GetFriendNickname(PlayerID) );
				UpdatePerk(i, PerkName, PerkLevel, IconPath);
			}
		}
	}
}

function UpdateSearching(string Message)
{
	local string SearchingText;
	local string PartyLeaderName;
	local UniqueNetId AdminId;
		
	if(OnlineLobby != none)
	{
		OnlineLobby.GetLobbyAdmin( OnlineLobby.GetCurrentLobbyId(), AdminId);
		PartyLeaderName = OnlineLobby.GetFriendNickname(AdminId);
	}

	switch (Message)
	{
		case InOtherMenu:
			SearchingText = PartyLeaderInOtherMenuString;
			break;
	
		case ServerBrowserOpen:
			Manager.ChangeOverviewState(true);
			SearchingText = PartyLeaderInServerBrowserString;
			break;

		case SearchingForGame:
			SearchingText = PartyLeaderSearchingForMatchString;
			break;

		case UpdatingOptions:
			Manager.ChangeOverviewState(false);
			SearchingText = PartyLeaderIsUpdatingMatchOptionsString;
			break;

		case InOtherMenu:
			SearchingText = PartyLeaderInOtherMenuString;
			break;
	}

	SetSearchingText(PartyLeaderName @SearchingText);
}

function ToggelMuteOnPlayer(int SlotIndex)
{
	local ActiveLobbyInfo LobbyInfo;
	if( OnlineLobby != none )
	{
		OnlineLobby.GetCurrentLobby(LobbyInfo);
		if( LobbyInfo.Members.Length > SlotIndex )
		{
			`log("CALL MUTE FOR PLAYER: " @OnlineLobby.GetFriendNickname(LobbyInfo.Members[SlotIndex].PlayerUID) );
		}
	}
	super.ToggelMuteOnPlayer(SlotIndex);
}

function ViewProfile(int SlotIndex)
{
	local ActiveLobbyInfo LobbyInfo;
	if( OnlineLobby != none )
	{
		OnlineLobby.GetCurrentLobby(LobbyInfo);
		if( LobbyInfo.Members.Length > SlotIndex )
		{
			`log("View PLAYER profile: " @OnlineLobby.GetFriendNickname(LobbyInfo.Members[SlotIndex].PlayerUID) );
		}
	}

	if ( MemberSlots[SlotIndex].bIsSlotTaken )
	{
		if ( GetPC().WorldInfo.IsConsoleBuild(CONSOLE_Orbis) )
		{
			OnlineSub.PlayerInterfaceEx.ShowGamerCardUIByUsername(GetLP().ControllerId,OnlineLobby.GetFriendNickname(LobbyInfo.Members[SlotIndex].PlayerUID));
		}
		else
		{
			OnlineSub.PlayerInterfaceEx.ShowGamerCardUI(GetLP().ControllerId,MemberSlots[SlotIndex].PRI.UniqueId);
		}
	}
}

//Since the PRI Array doe not exist int he main menu, we are using the lobby to access PlayerUI's  
//Adding and removing friends through steam will just bring up the overlay.  From there the player will have to click 
//the option to add or remove them based on the friend status.
function AddFriend(int SlotIndex)
{
	local ActiveLobbyInfo LobbyInfo;
	local LocalPlayer LocPlayer;

	LocPlayer = LocalPlayer(GetPC().Player);

	if( OnlineLobby != none )
	{
		OnlineLobby.GetCurrentLobby(LobbyInfo);
		if( LobbyInfo.Members.Length > SlotIndex )
		{
			if( OnlineSub.IsFriend(LocPlayer.ControllerId, LobbyInfo.Members[SlotIndex].PlayerUID) )
			{
				if( !OnlineSub.RemoveFriend(LocPlayer.ControllerId, LobbyInfo.Members[SlotIndex].PlayerUID) )
				{
					`log("Failed to remove friend!");
				}
			}
			else
			{
				if( !OnlineSub.AddFriend(LocPlayer.ControllerId, LobbyInfo.Members[SlotIndex].PlayerUID) )
				{
					`log("Failed to add friend!");
				}
			}
		}
	}
}

// As the leader of the party, make sure the members have the latest information
function SendMyOptions()
{
	local KFPerk CurrentPerk;
	local int PerkIndex;
	local string CurrentLevel;
	local string PerkMessage;
	local string UIDStrings;
	local UniqueNetId MyUniqueId;



	CurrentPerk = KFPC.GetPerk();
	PerkIndex = KFPC.GetPerkIndexFromClass(CurrentPerk.Class);
	CurrentLevel = string(KFPC.GetLevel());

	MyUniqueId = OnlineLobby.GetMyId();
	UIDStrings = class'OnlineSubsystem'.static.UniqueNetIdToString(MyUniqueId);
	PerkMessage = PerkPrefix$UIDStrings$"/"$string(PerkIndex)$"/"$CurrentLevel;
	if(OnlineLobby != none)
	{
		OnlineLobby.LobbyMessage(PerkMessage);
	}
}

defaultproperties
{
	
}