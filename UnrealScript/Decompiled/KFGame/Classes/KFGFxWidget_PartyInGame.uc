/*******************************************************************************
 * KFGFxWidget_PartyInGame generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWidget_PartyInGame extends KFGFxWidget_BaseParty within GFxMoviePlayer;

var KFGameReplicationInfo KFGRI;

function InitializeWidget()
{
    super.InitializeWidget();
    SetReadyButtonVisibility(true);
    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    if(KFGRI != none)
    {
        if(KFGRI.bMatchHasBegun || KFGRI.bMatchIsOver)
        {
            GetObject("matchStartContainer").SetVisible(false);
            if(Outer.GetPC().PlayerReplicationInfo.bReadyToPlay || KFGRI.bMatchIsOver)
            {
                GetObject("readyButton").SetVisible(false);
            }
        }
        StartCountdown(KFGRI.RemainingTime, false);
    }
    RefreshParty();
}

function UpdateReadyButtonVisibility()
{
    if(KFGRI == none)
    {
        return;
    }
    if(bReadyButtonVisible)
    {
        KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
        if(KFGRI != none)
        {
            if((KFGRI.bMatchHasBegun && !KFGRI.bMatchIsOver) && !Outer.GetPC().PlayerReplicationInfo.bReadyToPlay)
            {
                SetReadyButtonVisibility(true);
            }
            if(KFGRI.bMatchHasBegun || KFGRI.bMatchIsOver)
            {
                GetObject("matchStartContainer").SetVisible(false);
                if(Outer.GetPC().PlayerReplicationInfo.bReadyToPlay || KFGRI.bMatchIsOver)
                {
                    SetReadyButtonVisibility(false);
                }
            }
        }
    }
}

function OneSecondLoop()
{
    if(KFGRI == none)
    {
        KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    }
    RefreshParty();
    UpdateReadyButtonVisibility();
}

function UpdateVOIP(PlayerReplicationInfo PRI, bool bIsTalking)
{
    local int I;
    local KFPlayerReplicationInfo KFPRI;

    KFPRI = KFPlayerReplicationInfo(PRI);
    I = 0;
    J0x27:

    if(I < PlayerSlots)
    {
        if(MemberSlots[I].PlayerUID == KFPRI.UniqueId)
        {
            MemberSlots[I].MemberSlotObject.SetBool("isTalking", bIsTalking);
        }
        ++ I;
        goto J0x27;
    }
}

function GetKFPRIArray(out array<KFPlayerReplicationInfo> KFPRIArray)
{
    local PlayerController PC;

    PC = Outer.GetPC();
    if(((PC == none) || PC.WorldInfo == none) || PC.WorldInfo.GRI == none)
    {
        return;
    }
    if(KFGRI != none)
    {
        KFGRI.GetKFPRIArray(KFPRIArray);
    }
}

function RefreshParty()
{
    local array<KFPlayerReplicationInfo> KFPRIArray;
    local int SlotIndex;
    local GFxObject DataProvider;

    DataProvider = Outer.CreateArray();
    super.RefreshParty();
    GetKFPRIArray(KFPRIArray);
    if(KFPRIArray.Length <= 0)
    {
        return;
    }
    if(PartyChatWidget != none)
    {
        PartyChatWidget.SetLobbyChatVisible(KFPRIArray.Length > 1);
    }
    UpdateInLobby(KFPRIArray.Length > 1);
    OccupiedSlots = KFPRIArray.Length;
    SlotIndex = 0;
    J0xC9:

    if(SlotIndex < PlayerSlots)
    {
        if(SlotIndex < KFPRIArray.Length)
        {
            DataProvider.SetElementObject(SlotIndex, RefreshSlot(SlotIndex, KFPRIArray[SlotIndex]));
        }
        ++ SlotIndex;
        goto J0xC9;
    }
    SetBool("bInParty", bInLobby || Outer.GetPC().WorldInfo.NetMode != NM_Standalone);
    SetObject("squadInfo", DataProvider);
    UpdateSoloSquadText();
}

function GFxObject RefreshSlot(int SlotIndex, KFPlayerReplicationInfo KFPRI)
{
    local string PlayerName;
    local UniqueNetId AdminId;
    local bool bIsLeader, bIsMyPlayer;
    local PlayerController PC;
    local GFxObject PlayerInfoObject;

    PlayerInfoObject = Outer.CreateObject("Object");
    PC = Outer.GetPC();
    if(OnlineLobby != none)
    {
        OnlineLobby.GetLobbyAdmin(OnlineLobby.GetCurrentLobbyId(), AdminId);
    }
    bIsLeader = KFPRI.UniqueId == AdminId;
    PlayerInfoObject.SetBool("bLeader", bIsLeader);
    bIsMyPlayer = PC.PlayerReplicationInfo.UniqueId == KFPRI.UniqueId;
    MemberSlots[SlotIndex].PlayerUID = KFPRI.UniqueId;
    MemberSlots[SlotIndex].PRI = KFPRI;
    MemberSlots[SlotIndex].PerkClass = KFPRI.CurrentPerkClass;
    MemberSlots[SlotIndex].PerkLevel = string(KFPRI.GetActivePerkLevel());
    PlayerInfoObject.SetBool("myPlayer", bIsMyPlayer);
    if(MemberSlots[SlotIndex].PerkClass != none)
    {
        PlayerInfoObject.SetString("perkLevel", MemberSlots[SlotIndex].PerkLevel @ MemberSlots[SlotIndex].PerkClass.default.PerkName);
        PlayerInfoObject.SetString("perkIconPath", "img://" $ MemberSlots[SlotIndex].PerkClass.static.GetPerkIconPath());
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
        PlayerInfoObject.SetString("profileImageSource", KFPC.GetPS4Avatar(PlayerName));        
    }
    else
    {
        PlayerInfoObject.SetString("profileImageSource", KFPC.GetSteamAvatar(KFPRI.UniqueId));
    }
    if(KFGRI != none)
    {
        PlayerInfoObject.SetBool("ready", KFPRI.bReadyToPlay && !KFGRI.bMatchHasBegun);
    }
    return PlayerInfoObject;
}

function ToggelMuteOnPlayer(int SlotIndex)
{
    local array<KFPlayerReplicationInfo> KFPRIArray;
    local UniqueNetId PlayerNetId;
    local PlayerController PC;

    PC = Outer.GetPC();
    GetKFPRIArray(KFPRIArray);
    if(KFPRIArray.Length <= 0)
    {
        return;
    }
    if(KFPRIArray.Length > SlotIndex)
    {
        PlayerNetId = KFPRIArray[SlotIndex].UniqueId;
        if(PC.IsPlayerMuted(PlayerNetId))
        {
            PC.ServerUnmutePlayer(PlayerNetId, !Class'WorldInfo'.static.IsConsoleBuild());
            if(MemberSlots[SlotIndex].MemberSlotObject != none)
            {
                MemberSlots[SlotIndex].MemberSlotObject.SetBool("isMuted", false);
            }            
        }
        else
        {
            PC.ServerMutePlayer(PlayerNetId, !Class'WorldInfo'.static.IsConsoleBuild());
            if(MemberSlots[SlotIndex].MemberSlotObject != none)
            {
                MemberSlots[SlotIndex].MemberSlotObject.SetBool("isMuted", true);
            }
        }
    }
    super.ToggelMuteOnPlayer(SlotIndex);
}

function ViewProfile(int SlotIndex)
{
    local array<KFPlayerReplicationInfo> KFPRIArray;

    GetKFPRIArray(KFPRIArray);
    if(((KFPRIArray.Length <= 0) || OnlineSub == none) || EqualEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, (none)))
    {
        return;
    }
    if(KFPRIArray.Length > SlotIndex)
    {
        if(Outer.GetPC().WorldInfo.IsConsoleBuild(8))
        {
            OnlineSub.PlayerInterfaceEx.ShowGamerCardUIByUsername(byte(Outer.GetLP().ControllerId), KFPRIArray[SlotIndex].PlayerName);            
        }
        else
        {
            OnlineSub.PlayerInterfaceEx.ShowGamerCardUI(byte(Outer.GetLP().ControllerId), KFPRIArray[SlotIndex].UniqueId);
        }
        LogInternal("View PLAYER profile: " @ KFPRIArray[SlotIndex].PlayerName);
    }
}

function AddFriend(int SlotIndex)
{
    local array<KFPlayerReplicationInfo> KFPRIArray;
    local LocalPlayer LocPlayer;

    GetKFPRIArray(KFPRIArray);
    LocPlayer = LocalPlayer(Outer.GetPC().Player);
    if(LocPlayer == none)
    {
        return;
    }
    if(KFPRIArray.Length <= 0)
    {
        return;
    }
    if(SlotIndex < KFPRIArray.Length)
    {
        if(OnlineSub.IsFriend(byte(LocPlayer.ControllerId), KFPRIArray[SlotIndex].UniqueId))
        {
            if(!OnlineSub.RemoveFriend(byte(LocPlayer.ControllerId), KFPRIArray[SlotIndex].UniqueId))
            {
                LogInternal("Failed to remove friend!");
            }            
        }
        else
        {
            if(!OnlineSub.AddFriend(byte(LocPlayer.ControllerId), KFPRIArray[SlotIndex].UniqueId))
            {
                LogInternal("Failed to add friend!");
            }
        }
    }
}

function KickPlayer(int SlotIndex)
{
    local array<KFPlayerReplicationInfo> KFPRIArray;

    GetKFPRIArray(KFPRIArray);
    if(KFPRIArray.Length <= 0)
    {
        return;
    }
    if(SlotIndex < KFPRIArray.Length)
    {
        KFPlayerReplicationInfo(Outer.GetPC().PlayerReplicationInfo).ServerStartKickVote(KFPRIArray[SlotIndex], Outer.GetPC().PlayerReplicationInfo);
    }
}
