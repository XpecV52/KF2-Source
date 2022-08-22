//=============================================================================
// KFGFxWidget_BaseParty
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 11/14/2013
//=============================================================================

class KFGFxWidget_BaseParty extends KFGFxObject_Container;

var localized string ReadyString, LeaveString, DefaultPlayerName, SquadString, SoloString, CreatePartyString, WaitingString, DeployingString, PlayerReadyString, PartyLeaderString;
var localized string MuteString, UnmuteString, AddFriendString, RemoveFriendString, ViewProfileString, VoteKickString;// Profile options
var localized string PartyLeaderSearchingForMatchString, PartyLeaderIsUpdatingMatchOptionsString, PartyLeaderInServerBrowserString, PartyLeaderInOtherMenuString, SearchingForGameString;
var localized string PartHostLeftString, PartyLeaderChangedString;
var localized string DownLoadingString, RemainingString;

var array<string> ProfileOptions;
var OnlineSubsystem OnlineSub;
var TWOnlineLobby OnlineLobby;
var bool bInLobby;
var KFPlayerController KFPC;
var KFGFxHUD_ChatBoxWidget PartyChatWidget;
var const string PerkPrefix;
var const string SearchingPrefix, ServerBrowserOpen, SearchingForGame, UpdatingOptions, InOtherMenu;
var int OccupiedSlots;
var UniqueNetId LastLeaderID;
var KFGfxMoviePlayer_Manager Manager;

var GFxObject ReadyButton;
var GFxObject LeaveButton;
var GFxObject CreatePartyButton;
var GFxObject SquadHeader;
var GFxObject Notification;

var int PlayerSlots;

var const UniqueNetId ZeroUniqueId;

enum EProfileOption
{
	EAdd_Friend,
	EToggle_Mute,
	EKick_Player,
	EView_Profile,
};

struct SMemberSlot
{
	var bool	bIsSlotTaken;
	var bool	bIsReady;
	var bool	bIsLeader;
	var byte	PerkLevel;
	var Texture2D Avatar;
	var class<KFPerk>	PerkClass;
	var UniqueNetId	PlayerUID;
	var transient GFxObject MemberSlotObject;
	var transient GFxObject PlayerNameTextField;
	var PlayerReplicationInfo PRI;
};

var bool bReadyButtonVisible;
var bool bCreatePartyVisible;

var SMemberSlot MemberSlots[12];

function InitializeWidget()
{
	local int SlotIndex;
	KFPC = KFPlayerController(GetPC());
	OnlineSub = KFPC.OnlineSub;
	if (OnlineSub != none)
	{
		OnlineLobby = OnlineSub.GetLobbyInterface();
	}

	for (SlotIndex = 0; SlotIndex < PlayerSlots; SlotIndex++)
	{
		InitializeMemberSlot(SlotIndex);
	}

	LeaveButton = GetObject("leaveButton");
	CreatePartyButton = GetObject("createPartyButton");
	SetBool("partyButtonVisible", bCreatePartyVisible);
	ReadyButton = GetObject("readyButton");
	SquadHeader = GetObject("squadHeader");
	InitNotificationUI();

	LocalizeText();

	UpdateInLobby(Manager.IsInLobby());
	RefreshParty();
}

function  LocalizeText()
{
	ReadyButton.SetString("label", ReadyString);
	LeaveButton.SetString("label", LeaveString);
	CreatePartyButton.SetString("label", CreatePartyString);

	SetString("deployingString", DeployingString);
	SetString("waitingString", WaitingString);

	SetString("selectPromptString", Localize("KFGFxWidget_ButtonPrompt", "ConfirmString", "KFGame"));
	SetString("backPromptString", Localize("KFGFxWidget_ButtonPrompt", "CancelString", "KFGame"));
}

function InitNotificationUI()
{
	Notification = GetObject("Notification");

	//@Josh Assign delgate here
	//OnlineSub.DownloadNotification = ShowDownLoadNotification;
}

function ShowDownLoadNotification(string ItemName, Float PercentComplete, int ItemsRemaining)
{
	local GFxObject NotificationInfoObject;

	if(Notification == none)
	{
		return;
	}

	NotificationInfoObject = CreateObject("Object");

	NotificationInfoObject.SetString("itemName"		, ItemName);
	NotificationInfoObject.SetFloat("percent"		, PercentComplete * 100);
	NotificationInfoObject.SetInt("queue"		, ItemsRemaining);
	NotificationInfoObject.SetString("downLoading"	, DownLoadingString);
	NotificationInfoObject.SetString("remaining"		, RemainingString);

	Notification.SetObject("notificationInfo", NotificationInfoObject);
}

function SetSearchingText(string Message){}

function InitializeMemberSlot( int SlotIndex )
{
	MemberSlots[SlotIndex].MemberSlotObject = GetObject("squadMember" $ SlotIndex);
	MemberSlots[SlotIndex].PlayerNameTextField = MemberSlots[SlotIndex].MemberSlotObject.GetObject("playerNameText");	

	MemberSlots[SlotIndex].MemberSlotObject.SetString("leaderText",PartyLeaderString);
	
	EmptySlot( SlotIndex );
}

function bool isUserYourFriend(UniqueNetId PlayerID) 
{	
	return true;
}

function CreatePlayerOptions(UniqueNetId PlayerID, int SlotIndex)
{
	local PlayerController PC;
	local bool bConsoleBuild;

	PC = GetPC();
	//Clear the profile options
	ProfileOptions.Length = 0;
	bConsoleBuild = PC.WorldInfo.IsConsoleBuild();
	if ( !bConsoleBuild && PlayerID != PC.PlayerReplicationInfo.UniqueId)
	{
		//Are they your friend?
		if(!IsPlayerAFriend(PlayerID))
		{
			ProfileOptions.AddItem(AddFriendString);  //Not supported yet
		}
		else
		{
			ProfileOptions.AddItem(RemoveFriendString);  //Not supported yet	
		}
	}
	else
	{
		if(ProfileOptions.Find(AddFriendString) != INDEX_NONE)
		{
			ProfileOptions.RemoveItem(AddFriendString);
		}
		else if(ProfileOptions.Find(RemoveFriendString) != INDEX_NONE)
		{
			ProfileOptions.RemoveItem(RemoveFriendString);
		}
	}

	if( !PC.WorldInfo.IsMenuLevel() && PlayerID != PC.PlayerReplicationInfo.UniqueId ) //temp for now since voip and such does not work in the main menu
	{
		//Are they muted?
		// TODO:  This needs to check more than muted because if player 1 mutes player 2 then player 2 gets the unmute option that does nothing.
		if(PC.IsPlayerMuted(PlayerID))
		{
			ProfileOptions.AddItem(UnmuteString);
		}
		else
		{
			ProfileOptions.AddItem(MuteString);
		}

		ProfileOptions.AddItem(VoteKickString);
	}
	else
	{
		if(ProfileOptions.Find(UnmuteString) != INDEX_NONE)
		{
			ProfileOptions.RemoveItem(UnmuteString);
		}
		else if(ProfileOptions.Find(MuteString) != INDEX_NONE)
		{
			ProfileOptions.RemoveItem(MuteString);
		}

		if(ProfileOptions.Find(VoteKickString) != INDEX_NONE)
		{
			ProfileOptions.RemoveItem(VoteKickString);
		}
	}
	//View profile option Added at the end if we are on PC but first on console.
	if ( bConsoleBuild )
	{
		ProfileOptions.InsertItem(0, Localize("KFGFxWidget_BaseParty","ViewProfileString","KFGameConsole"));
	}
	else
	{
		ProfileOptions.AddItem(ViewProfileString);
	}


	// Setting everyone's list the same way for now.  Once we get perk switch working we won't do this for the Player.
	//if(PlayerID != GetPC().PlayerReplicationInfo.UniqueId)
	//{
		CreateList(MemberSlots[SlotIndex].MemberSlotObject.GetObject("optionsList"), ProfileOptions, 0);
	//}
}

function UpdateInLobby(bool bIsInLobby)
{
	local bool bShouldShowCreateParty;

	if(bIsInLobby != bInLobby)
	{
		bInLobby = bIsInLobby;
		RefreshParty();
	}
	
	if (bInLobby)
	{
		if(class'WorldInfo'.static.IsMenuLevel())
		{
			LeaveButton.SetVisible(true);
		}
		else
		{
			LeaveButton.SetVisible(false);
		}
	}
	else
	{	
		LeaveButton.SetVisible(false);

		//clear all party buttons other than your own
	}
	//@HSL_BEGIN - JRO - Handle the create party button in both situations for PS4
	if ( Manager.StartMenu != None)
	{
		if(GetPC().WorldInfo.IsMenuLevel())
		{
			bShouldShowCreateParty = Manager.GetMultiplayerMenuActive() && !bInLobby;
		}
		else if(class'WorldInfo'.static.IsConsoleBuild())
		{
			bShouldShowCreateParty = GetPC().WorldInfo.NetMode != NM_Standalone && !bInLobby;
		}
		
		if(bCreatePartyVisible != bShouldShowCreateParty)
		{
			bCreatePartyVisible = bShouldShowCreateParty;
			SetBool("partyButtonVisible",bCreatePartyVisible);
		}
	}

	//@HSL_END
	SetBool("bInParty", bIsInLobby);
}

function  UpdateSoloSquadText()
{
	if(occupiedSlots > 1)
	{
		SquadHeader.SetString("text", SquadString);
	}
	else
	{
		SquadHeader.SetString("text", SoloString);
	}
}

function CreatePerkList(GFxObject ListObject)
{
	local byte i;
	local GFxObject DataProvider;
	local GFxObject TempObject;

	DataProvider = ListObject.GetObject("dataProvider");
	for (i = 0; i < KFPC.PerkList.length; i++)
	{
		TempObject = CreateObject( "Object" );
		TempObject.SetString("Title", KFPC.PerkList[i].PerkClass.default.PerkName );
		TempObject.SetString("PerkLevel", string(KFPC.PerkList[i].PerkLevel) );
		TempObject.SetString("iconSource", "img://"$KFPC.PerkList[i].PerkClass.static.GetPerkIconPath() );
		
		DataProvider.SetElementObject(i, TempObject);
	}
}

function CreateList( GFxObject OptionList, array<string> TextArray, byte SelectedIndex )
{
	local byte i;
	local GFxObject DataProvider;
	local GFxObject ItemSlot;

	// @todo SetElementObject is sending out the information with each iteration
	// set it up so it only sends once on SetObject
	DataProvider = OptionList.GetObject("dataProvider");
	for (i = 0; i < TextArray.length; i++)
	{
		ItemSlot = CreateObject( "Object" );
		ItemSlot.SetString("label", TextArray[i] );
		DataProvider.SetElementObject(i, ItemSlot);		
    }
	DataProvider.ActionScriptVoid("invalidateData");
	OptionList.ActionScriptVoid("invalidateData");
}

function ProfileOptionClicked(int OptionIndex, int SlotIndex)
{
	local PlayerController PC;
	PC = GetPC();
    switch (OptionIndex)
    {
	    case EAdd_Friend:
	        if ( PC.WorldInfo.IsConsoleBuild() || PC.WorldInfo.IsMenuLevel()) // Console's first index is view profile.  HSL_BB
	        {
	            ViewProfile(SlotIndex);
	        }
	        else
	        {
	            AddFriend(SlotIndex);
	        }
	        break;
	    case EToggle_Mute:
	        if ( PC.WorldInfo.IsMenuLevel() ) // Can't mute in the menulevel so view profile. HSL_BB
	        {
	            ViewProfile(SlotIndex);
	        }
	        else
	        {
	            ToggelMuteOnPlayer(SlotIndex);
	        }
	        break;
	    case EKick_Player:
	        KickPlayer(SlotIndex);
	        break;
	    default:
	        ViewProfile(SlotIndex);
    }
}

function bool IsPlayerAFriend(UniqueNetId PlayerID)
{
	local LocalPlayer LocPlayer;
	
	LocPlayer = LocalPlayer(GetPC().Player);

	if(LocPlayer == none)
	{
		return false;
	}
	if(OnlineSub == none)
	{
		return false;
	}
	return OnlineSub.IsFriend(LocPlayer.ControllerId,PlayerID);
}

//Override these in MaineMenu and InGame party widgets so that they can get the Unique id of the players in the slots view PRIarray or lobby 
function ToggelMuteOnPlayer(int SlotIndex)
{

}

function ViewProfile(int SlotIndex)
{
}

function AddFriend(int SlotIndex)
{
	//Override this in child classes
}

function RemoveFriend(int SlotIndex)
{
	
}

function KickPlayer(int SlotIndex)
{
	
}

/****************************************************************************
*	@VOIP
****************************************************************************/

function UpdateVOIP(PlayerReplicationInfo PRI, bool bIsTalking);

/****************************************************************************
*	Refresh
****************************************************************************/

// Refresh a slot if any of it's values have changed or a player was removed
function RefreshParty()
{
	OccupiedSlots = 0;
	UpdateLock();
}

function StatsInit()
{
	if(MemberSlots[0].MemberSlotObject != none)
	{
//		CreatePerkList(MemberSlots[0].MemberSlotObject.GetObject("perksList"));
	}
}


// Empties the slot
function EmptySlot( int SlotIndex )
{
	MemberSlots[SlotIndex].PlayerUID = ZeroUniqueId;
   	MemberSlots[SlotIndex].bIsSlotTaken = false;
	MemberSlots[SlotIndex].bIsReady = false;
	MemberSlots[SlotIndex].bIsLeader = false;
	MemberSlots[SlotIndex].PerkClass = none;
	MemberSlots[SlotIndex].PRI = none;
	MemberSlots[SlotIndex].MemberSlotObject.SetString("profileImageSource", "");
	MemberSlots[SlotIndex].MemberSlotObject.SetBool("isMuted",false);

	UpdatePlayerName( SlotIndex, DefaultPlayerName$SlotIndex );
    SlotChanged( SlotIndex, false, false, false );
}

function UpdatePlayerName( int SlotIndex, string PlayerName )
{
	MemberSlots[SlotIndex].MemberSlotObject.SetString( "playerNameString", PlayerName );
}

function UpdatePerk( int SlotIndex, string PerkString, string Level, string IconPath )
{
	ActionScriptVoid("updatePerk");
}

function SlotChanged( int SlotIndex, bool bOccupied, bool bIsMyPlayer, bool bIsLeader )
{
	ActionScriptVoid("slotChanged");
}

function SetReadyButtonVisibility( bool bVisible )
{
	SetBool("readyButtonVisible", bVisible);
}

function bool ReceiveMessage(string Message, optional string MessageColor)
{	
	local array<string> PlayerInfoStrings;
	ParseStringIntoArray(Message, PlayerInfoStrings, PerkPrefix, true);
	
	// Perk update message
	if (InStr(Message, PerkPrefix) != -1)
	{
		UpdatePerks(repl(Message, PerkPrefix, ""));
		return false;
	}
	if(InStr(Message, SearchingPrefix) != -1)
	{
		UpdateSearching(repl(Message, SearchingPrefix, ""));
		return false;
	}
	// Send to chat box		
	if( PartyChatWidget != none )
	{
		if(MessageColor != "")
		{
			PartyChatWidget.AddChatMessage(message, MessageColor);	
		}
		else
		{
			PartyChatWidget.AddChatMessage(message, class 'KFLocalMessage'.default.SayColor);
		}
	}
	return true;
}

function UpdateLock()
{
	local WorldInfo TempWorldInfo;
	local KFGameReplicationInfo KFGRI;
	local bool bLocked;

	TempWorldInfo = class'WorldInfo'.static.GetWorldInfo();
	if ( TempWorldInfo != none && TempWorldInfo.GRI != none )
	{
		KFGRI = KFGameReplicationInfo(TempWorldInfo.GRI);

		if ( KFGRI != none && KFPC != none )
		{
			bLocked = ( KFGRI.CanChangePerks() && KFPC.bPlayerUsedUpdatePerk );
			SetBool( "locked", bLocked);
		}
	}
}

// As a member of party, check to see if your options are different than the party leaders
function UpdatePerks(string Message);

function UpdateSearching(string Message);

function SendSearching();


function StartCountdown(int CountdownTime, bool bFinalCountdown)
{
	ActionScriptVoid("startCountdown");
}

/**
 * @brief Tells AS to stop the countdown
 */
function StopCountdown()
{
	ActionScriptVoid("stopCountdown");
}

defaultproperties
{
   ReadyString="READY UP"
   LeaveString="LEAVE PARTY"
   DefaultPlayerName="Player"
   SquadString="SQUAD"
   SoloString="SOLO"
   CreatePartyString="CREATE PARTY"
   WaitingString="WAITING FOR PLAYERS"
   DeployingString="DEPLOYING IN "
   PlayerReadyString="[ READY ]"
   PartyLeaderString="Leader"
   MuteString="Mute Player"
   UnmuteString="Unmute Player"
   AddFriendString="Add Friend"
   RemoveFriendString="Remove Friend"
   ViewProfileString="View Profile"
   VoteKickString="Kick Player"
   PartyLeaderSearchingForMatchString="is searching for a match..."
   PartyLeaderIsUpdatingMatchOptionsString="is setting match options..."
   PartyLeaderInServerBrowserString="is searching the server browser..."
   PartyLeaderInOtherMenuString="is in another menu..."
   SearchingForGameString="Searching for online game..."
   PartHostLeftString="The party host has left"
   PartyLeaderChangedString="is now the new party host"
   DownLoadingString="Downloading:"
   RemainingString="Remaining:"
   bReadyButtonVisible=True
   PerkPrefix="%&1&%"
   SearchingPrefix="%&2&%"
   ServerBrowserOpen="ServerBrowser"
   SearchingForGame="SearchingForGame"
   UpdatingOptions="UpdatingOptions"
   InOtherMenu="InOtherMenu"
   PlayerSlots=6
   Name="Default__KFGFxWidget_BaseParty"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
