//=============================================================================
// KFGFxWidget_PartyInGame_Versus
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Zane Gholson
//=============================================================================


class KFGFxWidget_PartyInGame_Versus extends KFGFxWidget_PartyInGame;

var localized string SwitchTeamsString;
var localized string balanceWarningString;

var GFxObject SwitchTeamsButton;

var Texture2D ZedIConTexture;
var KFGameReplicationInfo KFGRI;

function InitializeWidget()
{
	KFGRI = KFGameReplicationInfo( GetPC().WorldInfo.GRI );;
	SwitchTeamsButton = GetObject("switchTeamsButton");
	super.InitializeWidget();
}

function LocalizeText()
{
	super.LocalizeText();
	SwitchTeamsButton.SetString("label", SwitchTeamsString);
}

function OneSecondLoop()
{
	super.OneSecondLoop();
	SetInt("myTeam", GetPC().PlayerReplicationInfo.GetTeamNum());
	UpdateTeams();
	UpdateBalanceWarning();
}

function UpdateBalanceWarning()
{
	if(KFGRI == none)
	{
		return;
	}

	if(KFGRI.AreTeamsOutOfBalanced())
	{
		SetString("balanceWarning", balanceWarningString);
	}
	else
	{
		SetString("balanceWarning", "");
	}
}

function UpdateTeams()
{
	local int i;

	for (i = 0; i < PlayerSlots; i++)
	{
		if(MemberSlots[i].PRI != none)
		{
			MemberSlots[i].MemberSlotObject.SetInt("team", MemberSlots[i].PRI.GetTeamNum());
		}
	}
}

function GetKFPRIArray( out array<KFPlayerReplicationInfo> KFPRIArray )
{
	super.GetKFPRIArray(KFPRIArray);

	if(KFPRIArray.length > 0)
	{
		//sort by team
		KFPRIArray.Sort(SortPlayers);
	}
}

delegate int SortPlayers(KFPlayerReplicationInfo A, KFPlayerReplicationInfo B)
{
	return A.GetTeamNum() > B.GetTeamNum() ? -1 : 0;
}

// Check which aspect of the slot has changed and update it
function RefreshSlot( int SlotIndex, KFPlayerReplicationInfo KFPRI )
{
	local string PlayerName;
	local UniqueNetId AdminId;
	local UniqueNetId PlayerID;
	local bool bIsLeader;
	local bool bIsMyPlayer;
	local string PerkIconPath;
	local class<KFPerk> CurrentPerkClass;
	local byte CurrentPerkLevel;
	local byte CurrentTeamIndex;
	local PlayerController PC;

	PC = GetPC();

	CurrentTeamIndex = KFPRI.GetTeamNum();
	PlayerID = KFPRI.UniqueId;
	if( OnlineLobby != none )
	{
		OnlineLobby.GetLobbyAdmin( OnlineLobby.GetCurrentLobbyId(), AdminId );
	}
	bIsLeader = (PlayerID == AdminId);
	// Check if this is our player we are updating
	bIsMyPlayer = ( PC.PlayerReplicationInfo.UniqueId == PlayerID );

   	UpdatePlayerReady( SlotIndex, KFPRI.bReadyToPlay && !KFGRI.bMatchHasBegun );

   	if( KFPRI.Team == none )
   	{
		EmptySlot(SlotIndex);
   		return;
   	}

   	CurrentPerkClass = KFPRI.CurrentPerkClass;  

   	if( CurrentTeamIndex == 255 ) //zed team
   	{
		if(CurrentPerkClass == none)
		{
			EmptySlot(SlotIndex);
		}
		else
		{
   			PerkIconPath = "img://" $ PathName(ZedIConTexture);

   			MemberSlots[SlotIndex].PerkClass = class'KFPerk_Monster';
			UpdatePerk( SlotIndex, "", "", PerkIconPath );			
		}
   	}
   	else//human team
   	{
   		// Update this players perk information
		CurrentPerkLevel = KFPRI.GetActivePerkLevel();

		if( CurrentPerkClass != none && CurrentPerkClass != class'KFPerk_Monster' &&
			(MemberSlots[SlotIndex].PerkClass != CurrentPerkClass || 
			MemberSlots[SlotIndex].PerkLevel != CurrentPerkLevel) )
		{
			MemberSlots[SlotIndex].PerkClass = CurrentPerkClass;
			MemberSlots[SlotIndex].PerkLevel = CurrentPerkLevel;
			PerkIconPath = "img://" $ CurrentPerkClass.static.GetPerkIconPath();
			UpdatePerk( SlotIndex, "", string(CurrentPerkLevel), PerkIconPath );		
		}	
   	}

	// Mark this slot as being filled
	MemberSlots[SlotIndex].bIsSlotTaken = true;
	// Get if we are the leader
	MemberSlots[SlotIndex].PlayerUID = PlayerID;
	
	// Update the players slot
	MemberSlots[SlotIndex].PRI = KFPRI;
	SlotChanged( SlotIndex, true, bIsMyPlayer, bIsLeader );
	// Update the muted state of this slotobject. -HSL_BB
	MemberSlots[SlotIndex].MemberSlotObject.SetBool("isMuted", PC.IsPlayerMuted(PlayerID) );

	//
	CreatePlayerOptions( KFPRI.UniqueId, SlotIndex );

	if( class'WorldInfo'.static.IsConsoleBuild( CONSOLE_Orbis ) )
	{
 		MemberSlots[SlotIndex].MemberSlotObject.SetString("profileImageSource", KFPC.GetPS4Avatar(KFPRI.PlayerName));
	}
	else
	{
		MemberSlots[SlotIndex].MemberSlotObject.SetString("profileImageSource", KFPC.GetSteamAvatar(KFPRI.UniqueId));
	}
   	// Update this slots player name
 	PlayerName = KFPRI.PlayerName;
	UpdatePlayerName( SlotIndex, PlayerName );
}

defaultproperties
{
   SwitchTeamsString="SWITCH TEAMS"
   balanceWarningString="WARNING: Teams will be auto-balanced"
   ZedIconTexture=Texture2D'UI_Widgets.MenuBarWidget_SWF_IF'
   PlayerSlots=12
   Name="Default__KFGFxWidget_PartyInGame_Versus"
   ObjectArchetype=KFGFxWidget_PartyInGame'KFGame.Default__KFGFxWidget_PartyInGame'
}
