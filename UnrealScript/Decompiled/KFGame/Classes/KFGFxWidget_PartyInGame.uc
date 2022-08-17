/*******************************************************************************
 * KFGFxWidget_PartyInGame generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWidget_PartyInGame extends KFGFxWidget_BaseParty within GFxMoviePlayer;

function InitializeWidget()
{
    local KFGameReplicationInfo KFGRI;

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
    LocalizeText();
}

function LocalizeText()
{
    local int SlotIndex;

    super.LocalizeText();
    SlotIndex = 0;
    J0x15:

    if(SlotIndex < PlayerSlots)
    {
        MemberSlots[SlotIndex].MemberSlotObject.SetString("readyText", PlayerReadyString);
        ++ SlotIndex;
        goto J0x15;
    }
}

function UpdateReadyButtonVisibility()
{
    local KFGameReplicationInfo KFGRI;

    if(bReadyButtonVisible)
    {
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
        }
    }
}

function OneSecondLoop()
{
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
    local KFGameReplicationInfo KFGRI;

    PC = Outer.GetPC();
    if(((PC == none) || PC.WorldInfo == none) || PC.WorldInfo.GRI == none)
    {
        return;
    }
    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    if(KFGRI != none)
    {
        KFGRI.GetKFPRIArray(KFPRIArray);
    }
}

function RefreshParty()
{
    local array<KFPlayerReplicationInfo> KFPRIArray;
    local int SlotIndex;

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
    J0xA0:

    if(SlotIndex < PlayerSlots)
    {
        if(SlotIndex < KFPRIArray.Length)
        {
            RefreshSlot(SlotIndex, KFPRIArray[SlotIndex]);            
        }
        else
        {
            if(MemberSlots[SlotIndex].bIsSlotTaken)
            {
                EmptySlot(SlotIndex);
            }
        }
        ++ SlotIndex;
        goto J0xA0;
    }
    SetBool("bInParty", bInLobby || Outer.GetPC().WorldInfo.NetMode != NM_Standalone);
    UpdateSoloSquadText();
}

function RefreshSlot(int SlotIndex, KFPlayerReplicationInfo KFPRI)
{
    local string PlayerName;
    local UniqueNetId AdminId, PlayerID;
    local bool bIsLeader, bIsMyPlayer;
    local string PerkIconPath;
    local class<KFPerk> CurrentPerkClass;
    local byte CurrentPerkLevel;
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    if((KFPC.CurrentPerk == none) || KFPRI.CurrentPerkClass == none)
    {
        LogInternal("FAILED TO UPDATE SLOT: " @ string(SlotIndex), 'DevGFxUI');
        return;
    }
    UpdatePlayerReady(SlotIndex, KFPRI.bReadyToPlay && !KFGRI.bMatchHasBegun);
    CurrentPerkClass = KFPRI.CurrentPerkClass;
    CurrentPerkLevel = KFPRI.GetActivePerkLevel();
    if((MemberSlots[SlotIndex].PerkClass != CurrentPerkClass) || MemberSlots[SlotIndex].PerkLevel != CurrentPerkLevel)
    {
        MemberSlots[SlotIndex].PerkClass = CurrentPerkClass;
        PerkIconPath = "img://" $ CurrentPerkClass.static.GetPerkIconPath();
        UpdatePerk(SlotIndex, CurrentPerkClass.default.PerkName, string(CurrentPerkLevel), PerkIconPath);
    }
    if(MemberSlots[SlotIndex].PlayerUID != KFPRI.UniqueId)
    {
        MemberSlots[SlotIndex].bIsSlotTaken = true;
        PlayerID = KFPRI.UniqueId;
        MemberSlots[SlotIndex].PlayerUID = PlayerID;
        OnlineLobby.GetLobbyAdmin(OnlineLobby.GetCurrentLobbyId(), AdminId);
        if(Class'WorldInfo'.static.IsConsoleBuild(8))
        {
            bIsLeader = PlayerID == AdminId && Outer.GetPC().WorldInfo.NetMode != NM_Standalone;            
        }
        else
        {
            bIsLeader = PlayerID == AdminId;
        }
        bIsMyPlayer = Outer.GetPC().PlayerReplicationInfo.UniqueId == PlayerID;
        PlayerName = KFPRI.PlayerName;
        UpdatePlayerName(SlotIndex, PlayerName);
        SlotChanged(SlotIndex, true, bIsMyPlayer, bIsLeader);
    }
    CreatePlayerOptions(KFPRI.UniqueId, SlotIndex);
    MemberSlots[SlotIndex].MemberSlotObject.SetString("profileImageSource", KFPC.GetSteamAvatar(KFPRI.UniqueId));
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
            PC.ServerUnmutePlayer(PlayerNetId);            
        }
        else
        {
            PC.ServerMutePlayer(PlayerNetId);
        }
    }
}

function ViewProfile(int SlotIndex)
{
    local array<KFPlayerReplicationInfo> KFPRIArray;

    GetKFPRIArray(KFPRIArray);
    if(KFPRIArray.Length <= 0)
    {
        return;
    }
    if(KFPRIArray.Length > SlotIndex)
    {
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

function UpdatePlayerReady(int SlotIndex, bool bReady)
{
    MemberSlots[SlotIndex].MemberSlotObject.SetBool("ready", bReady);
    MemberSlots[SlotIndex].bIsReady = bReady;
}
