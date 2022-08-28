/*******************************************************************************
 * KFGFxWidget_PartyInGame_Versus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWidget_PartyInGame_Versus extends KFGFxWidget_PartyInGame within GFxMoviePlayer;

var const localized string SwitchTeamsString;
var const localized string balanceWarningString;
var GFxObject SwitchTeamsButton;
var Texture2D ZedIconTexture;
var delegate<SortPlayers> __SortPlayers__Delegate;

function InitializeWidget()
{
    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    SwitchTeamsButton = GetObject("switchTeamsButton");
    super.InitializeWidget();
}

function LocalizeText()
{
    super(KFGFxWidget_BaseParty).LocalizeText();
    SetString("switchTeamsString", SwitchTeamsString);
}

function OneSecondLoop()
{
    super.OneSecondLoop();
    SetInt("myTeam", Outer.GetPC().PlayerReplicationInfo.GetTeamNum());
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
    local int I;

    I = 0;
    J0x0B:

    if(I < PlayerSlots)
    {
        if(MemberSlots[I].PRI != none)
        {
            MemberSlots[I].MemberSlotObject.SetInt("team", MemberSlots[I].PRI.GetTeamNum());
        }
        ++ I;
        goto J0x0B;
    }
}

function GetKFPRIArray(out array<KFPlayerReplicationInfo> KFPRIArray)
{
    super.GetKFPRIArray(KFPRIArray);
    if(KFPRIArray.Length > 0)
    {
        KFPRIArray.Sort(SortPlayers;
    }
}

delegate int SortPlayers(KFPlayerReplicationInfo A, KFPlayerReplicationInfo B)
{
    return ((A.GetTeamNum() > B.GetTeamNum()) ? -1 : 0);
}

function GFxObject RefreshSlot(int SlotIndex, KFPlayerReplicationInfo KFPRI)
{
    local byte CurrentTeamIndex;
    local string PlayerName;
    local UniqueNetId AdminId;
    local bool bIsLeader, bIsMyPlayer;
    local PlayerController PC;
    local GFxObject PlayerInfoObject, PerkIconObject;

    CurrentTeamIndex = KFPRI.GetTeamNum();
    PlayerInfoObject = Outer.CreateObject("Object");
    PC = Outer.GetPC();
    if(OnlineLobby != none)
    {
        OnlineLobby.GetLobbyAdmin(OnlineLobby.GetCurrentLobbyId(), AdminId);
    }
    bIsLeader = KFPRI.UniqueId == AdminId && KFPRI.UniqueId != ZeroUniqueId;
    PlayerInfoObject.SetBool("bLeader", bIsLeader);
    bIsMyPlayer = PC.PlayerReplicationInfo.UniqueId == KFPRI.UniqueId;
    MemberSlots[SlotIndex].PlayerUID = KFPRI.UniqueId;
    MemberSlots[SlotIndex].PRI = KFPRI;
    MemberSlots[SlotIndex].PerkClass = KFPRI.CurrentPerkClass;
    MemberSlots[SlotIndex].PerkLevel = string(KFPRI.GetActivePerkLevel());
    MemberSlots[SlotIndex].PrestigeLevel = string(KFPRI.GetActivePerkPrestigeLevel());
    PlayerInfoObject.SetBool("myPlayer", bIsMyPlayer);
    if(MemberSlots[SlotIndex].PerkClass != none)
    {
        PerkIconObject = Outer.CreateObject("Object");
        if(CurrentTeamIndex == 255)
        {
            PerkIconObject.SetString("perkIcon", "img://" $ PathName(ZedIconTexture));
            MemberSlots[SlotIndex].PerkClass = Class'KFPerk_Monster';            
        }
        else
        {
            PlayerInfoObject.SetString("perkLevel", MemberSlots[SlotIndex].PerkLevel);
            PerkIconObject = Outer.CreateObject("Object");
            PerkIconObject.SetString("perkIcon", "img://" $ MemberSlots[SlotIndex].PerkClass.static.GetPerkIconPath());
            PerkIconObject.SetString("prestigeIcon", MemberSlots[SlotIndex].PerkClass.static.GetPrestigeIconPath(KFPRI.GetActivePerkPrestigeLevel()));
        }
        PlayerInfoObject.SetObject("perkImageSource", PerkIconObject);
    }
    if(!bIsMyPlayer)
    {
        PlayerInfoObject.SetBool("muted", PC.IsPlayerMuted(KFPRI.UniqueId));
    }
    if(Class'WorldInfo'.static.IsE3Build())
    {
        PlayerName = KFPRI.PlayerName;        
    }
    else
    {
        PlayerName = KFPRI.PlayerName;
    }
    PlayerInfoObject.SetString("playerName", PlayerName);
    if(Class'WorldInfo'.static.IsConsoleBuild(8))
    {
        PlayerInfoObject.SetString("profileImageSource", "img://" $ KFPC.GetPS4Avatar(PlayerName));        
    }
    else
    {
        PlayerInfoObject.SetString("profileImageSource", "img://" $ KFPC.GetSteamAvatar(KFPRI.UniqueId));
    }
    if(KFGRI != none)
    {
        PlayerInfoObject.SetBool("ready", KFPRI.bReadyToPlay);
    }
    return PlayerInfoObject;
}

defaultproperties
{
    SwitchTeamsString="SWITCH TEAMS"
    balanceWarningString="WARNING: Teams will be auto-balanced"
    ZedIconTexture=Texture2D'UI_Widgets.MenuBarWidget_SWF_IF'
    PlayerSlots=12
}