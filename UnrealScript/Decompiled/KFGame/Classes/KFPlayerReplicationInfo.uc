/*******************************************************************************
 * KFPlayerReplicationInfo generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPlayerReplicationInfo extends PlayerReplicationInfo
    native(ReplicationInfo)
    nativereplication
    hidecategories(Navigation,Movement,Collision);

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
const NUM_COSMETIC_ATTACHMENTS = 3;

struct native CustomizationInfo
{
    var const byte CharacterIndex;
    var const byte HeadMeshIndex;
    var const byte HeadSkinIndex;
    var const byte BodyMeshIndex;
    var const byte BodySkinIndex;
    var const byte AttachmentMeshIndices[3];
    var const byte AttachmentSkinIndices[3];

    structdefaultproperties
    {
        CharacterIndex=0
        HeadMeshIndex=0
        HeadSkinIndex=0
        BodyMeshIndex=0
        BodySkinIndex=0
        AttachmentMeshIndices[0]=255
        AttachmentMeshIndices[1]=255
        AttachmentMeshIndices[2]=255
        AttachmentSkinIndices[0]=0
        AttachmentSkinIndices[1]=0
        AttachmentSkinIndices[2]=0
    }
};

var float LastQuitTime;
var byte NumTimesReconnected;
var repnotify byte VOIPStatus;
var byte NetPerkIndex;
var private byte ActivePerkLevel;
var byte PlayerHealth;
var byte PlayerHealthPercent;
var byte PerkSupplyLevel;
var byte SharedUnlocks;
var bool bHasSpawnedIn;
var bool bExtraFireRange;
var bool bSplashActive;
var bool bNukeActive;
var bool bConcussiveActive;
var bool bPerkPrimarySupplyUsed;
var bool bPerkSecondarySupplyUsed;
var bool bObjectivePlayer;
var bool bShowNonRelevantPlayers;
var string LastCrateGiftTimestamp;
var int SecondsOfGameplay;
var const array<KFCharacterInfo_Human> CharacterArchetypes;
var repnotify const CustomizationInfo RepCustomizationInfo;
var Texture CharPortrait;
var int DamageDealtOnTeam;
var class<KFPerk> CurrentPerkClass;
var int Assists;
var private Vector PawnLocationCompressed;
var private Vector LastReplicatedSmoothedLocation;
var KFPlayerController KFPlayerOwner;

replication
{
     if(bNetDirty)
        ActivePerkLevel, Assists, 
        CharPortrait, CurrentPerkClass, 
        DamageDealtOnTeam, NetPerkIndex, 
        PerkSupplyLevel, PlayerHealth, 
        PlayerHealthPercent, RepCustomizationInfo, 
        bConcussiveActive, bExtraFireRange, 
        bHasSpawnedIn, bNukeActive, 
        bObjectivePlayer, bSplashActive;

     if(bNetDirty && !bNetOwner || bDemoRecording)
        SharedUnlocks, VOIPStatus;

     if(!bNetOwner && bNetDirty)
        PawnLocationCompressed;
}

simulated event ReplicatedEvent(name VarName)
{
    local KFPlayerController LocalPC;
    local PlayerNameIdPair NewPlayer;

    if(VarName == 'RepCustomizationInfo')
    {
        CharacterCustomizationChanged();        
    }
    else
    {
        if(VarName == 'VOIPStatus')
        {
            VOIPStatusChanged(self, VOIPStatus > 0);            
        }
        else
        {
            if(VarName == 'Score')
            {
                UpdateTraderDosh();                
            }
            else
            {
                if(VarName == 'PlayerName')
                {
                    LocalPC = KFPlayerController(GetALocalPlayerController());
                    if(LocalPC != none)
                    {
                        NewPlayer.PlayerName = PlayerName;
                        LocalPC.RecentlyMetPlayers.AddItem(NewPlayer;
                        if(LocalPC.MyGFxManager != none)
                        {
                            LocalPC.MyGFxManager.ForceUpdateNextFrame();
                        }
                    }
                }
            }
        }
    }
    if(VarName == 'Team')
    {
        ClientRecieveNewTeam();
    }
    super.ReplicatedEvent(VarName);
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    if(Role == ROLE_Authority)
    {
        KFPlayerOwner = KFPlayerController(Owner);
    }
}

reliable server function ServerSwitchTeam();

reliable client simulated function ClientRecieveNewTeam();

simulated function byte GetActivePerkLevel()
{
    return ActivePerkLevel;
}

reliable server function ServerNotifyStartVoip()
{
    local int I;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Owner);
    if(!KFGameInfo(WorldInfo.Game).bDisableVOIP && !KFGameInfo(WorldInfo.Game).bDisablePublicVOIPChannel)
    {
        if(!bOnlySpectator)
        {
            bNetDirty = true;
            bForceNetUpdate = true;
            if(!KFPC.IsLocalController())
            {
                VOIPStatusChanged(self, true);
            }
            VOIPStatus = 1;
            KFPC.VoiceReceivers.Remove(0, KFPC.VoiceReceivers.Length;
            if((KFPC.Pawn != none) && KFPC.Pawn.Health > 0)
            {
                I = 0;
                J0x1AF:

                if(I < WorldInfo.GRI.PRIArray.Length)
                {
                    if(!WorldInfo.GRI.PRIArray[I].bBot)
                    {
                        KFPC.VoiceReceivers.AddItem(WorldInfo.GRI.PRIArray[I].UniqueId;
                        if(PlayerController(WorldInfo.GRI.PRIArray[I].Owner) != none)
                        {
                            PlayerController(WorldInfo.GRI.PRIArray[I].Owner).VoiceSenders.AddItem(UniqueId;
                        }
                    }
                    ++ I;
                    goto J0x1AF;
                }                
            }
            else
            {
                if(KFGameInfo(WorldInfo.Game).bEnableDeadToVOIP)
                {
                    I = 0;
                    J0x3F7:

                    if(I < WorldInfo.GRI.PRIArray.Length)
                    {
                        if(!WorldInfo.GRI.PRIArray[I].bBot)
                        {
                            KFPC.VoiceReceivers.AddItem(WorldInfo.GRI.PRIArray[I].UniqueId;
                            if(PlayerController(WorldInfo.GRI.PRIArray[I].Owner) != none)
                            {
                                PlayerController(WorldInfo.GRI.PRIArray[I].Owner).VoiceSenders.AddItem(UniqueId;
                            }
                        }
                        ++ I;
                        goto J0x3F7;
                    }
                }
            }
            if(KFPC.VoiceReceivers.Length <= 0)
            {
                KFPC.VoiceReceivers.AddItem(UniqueId;
            }            
        }
        else
        {
            ServerStartSpectatorVoiceChat();
        }        
    }
    else
    {
        KFPC.VoiceReceivers.Remove(0, KFPC.VoiceReceivers.Length;
        KFPC.VoiceReceivers.AddItem(UniqueId;
    }
}

reliable server function ServerNotifyStartTeamVoip()
{
    local byte TeamIndex;
    local int I;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Owner);
    if(!KFGameInfo(WorldInfo.Game).bDisableVOIP)
    {
        TeamIndex = GetTeamNum();
        if(!bOnlySpectator)
        {
            bNetDirty = true;
            bForceNetUpdate = true;
            if(!KFPC.IsLocalController())
            {
                VOIPStatusChanged(self, true);
            }
            VOIPStatus = 2;
            KFPC.VoiceReceivers.Remove(0, KFPC.VoiceReceivers.Length;
            if((KFPC.Pawn != none) && KFPC.Pawn.Health > 0)
            {
                I = 0;
                J0x17F:

                if(I < WorldInfo.GRI.PRIArray.Length)
                {
                    if(!WorldInfo.GRI.PRIArray[I].bBot && ((WorldInfo.GRI.PRIArray[I].GetTeamNum() == TeamIndex) || !WorldInfo.GRI.bMatchHasBegun) || WorldInfo.GRI.bMatchIsOver)
                    {
                        KFPC.VoiceReceivers.AddItem(WorldInfo.GRI.PRIArray[I].UniqueId;
                        if(PlayerController(WorldInfo.GRI.PRIArray[I].Owner) != none)
                        {
                            PlayerController(WorldInfo.GRI.PRIArray[I].Owner).VoiceSenders.AddItem(UniqueId;
                        }
                    }
                    ++ I;
                    goto J0x17F;
                }                
            }
            else
            {
                if(KFGameInfo(WorldInfo.Game).bEnableDeadToVOIP)
                {
                    I = 0;
                    J0x4A2:

                    if(I < WorldInfo.GRI.PRIArray.Length)
                    {
                        if(!WorldInfo.GRI.PRIArray[I].bBot && ((WorldInfo.GRI.PRIArray[I].GetTeamNum() == TeamIndex) || !WorldInfo.GRI.bMatchHasBegun) || WorldInfo.GRI.bMatchIsOver)
                        {
                            KFPC.VoiceReceivers.AddItem(WorldInfo.GRI.PRIArray[I].UniqueId;
                            if(PlayerController(WorldInfo.GRI.PRIArray[I].Owner) != none)
                            {
                                PlayerController(WorldInfo.GRI.PRIArray[I].Owner).VoiceSenders.AddItem(UniqueId;
                            }
                        }
                        ++ I;
                        goto J0x4A2;
                    }
                }
            }
            if(KFPC.VoiceReceivers.Length <= 0)
            {
                KFPC.VoiceReceivers.AddItem(UniqueId;
            }            
        }
        else
        {
            ServerStartSpectatorVoiceChat();
        }        
    }
    else
    {
        KFPC.VoiceReceivers.Remove(0, KFPC.VoiceReceivers.Length;
        KFPC.VoiceReceivers.AddItem(UniqueId;
    }
}

function ServerStartSpectatorVoiceChat()
{
    local int I;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Owner);
    ClearTimer('ClearVOIP');
    KFPC.VoiceReceivers.Remove(0, KFPC.VoiceReceivers.Length;
    VOIPStatus = ((KFGameInfo(WorldInfo.Game).bPartitionSpectators) ? 6 : 5);
    I = 0;
    J0xCB:

    if(I < WorldInfo.GRI.PRIArray.Length)
    {
        if(!WorldInfo.GRI.PRIArray[I].bBot && !KFGameInfo(WorldInfo.Game).bPartitionSpectators || WorldInfo.GRI.PRIArray[I].bOnlySpectator)
        {
            KFPC.VoiceReceivers.AddItem(WorldInfo.GRI.PRIArray[I].UniqueId;
            if(PlayerController(WorldInfo.GRI.PRIArray[I].Owner) != none)
            {
                PlayerController(WorldInfo.GRI.PRIArray[I].Owner).VoiceSenders.AddItem(UniqueId;
            }
        }
        ++ I;
        goto J0xCB;
    }
    if(KFPC.VoiceReceivers.Length <= 0)
    {
        KFPC.VoiceReceivers.AddItem(UniqueId;
    }
}

reliable server function ServerNotifyStopVOIP()
{
    local KFPlayerController KFPC;

    VOIPStatus = 0;
    VOIPStatusChanged(self, false);
    KFPC = KFPlayerController(Owner);
    if(KFPC != none)
    {
        KFPC.VoiceReceivers.Remove(0, KFPC.VoiceReceivers.Length;
    }
    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        J0xB7:

        if(KFPC.VoiceSenders.Find('Uid', UniqueId.Uid != -1)
        {
            KFPC.VoiceSenders.RemoveItem(UniqueId;
            goto J0xB7;
        }        
    }    
}

simulated function VOIPStatusChanged(PlayerReplicationInfo Talker, bool bIsTalking)
{
    local KFPlayerController KFPC;
    local KFPlayerReplicationInfo TalkerKFPRI;
    local KFGFxHudWrapper MyGFxHUD;
    local OnlineSubsystem OSS;

    OSS = Class'GameEngine'.static.GetOnlineSubsystem();
    foreach WorldInfo.LocalPlayerControllers(Class'KFPlayerController', KFPC)
    {
        if((OSS != none) && OSS.HasChatRestriction(byte(LocalPlayer(KFPC.Player).ControllerId)))
        {            
            return;
        }
        MyGFxHUD = KFGFxHudWrapper(KFPC.myHUD);
        TalkerKFPRI = KFPlayerReplicationInfo(Talker);
        if(TalkerKFPRI != none)
        {
            if((TalkerKFPRI.VOIPStatus == 6) && !KFPC.PlayerReplicationInfo.bOnlySpectator)
            {                
                return;
            }
        }
        if((MyGFxHUD != none) && MyGFxHUD.HudMovie != none)
        {
            MyGFxHUD.HudMovie.VOIPWidget.VOIPEventTriggered(Talker, bIsTalking);
        }
        if(KFPC.MyGFxManager != none)
        {
            KFPC.MyGFxManager.UpdateVOIP(Talker, bIsTalking);
        }        
    }    
}

simulated function UnregisterPlayerFromSession()
{
    VOIPStatusChanged(self, false);
    super.UnregisterPlayerFromSession();
}

reliable client simulated function ShowKickVote(PlayerReplicationInfo PRI, byte VoteDuration, bool bShowChoices)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Owner);
    if((KFPC != none) && KFPC.MyGFxHUD != none)
    {
        KFPC.MyGFxHUD.ShowKickVote(PRI, VoteDuration, bShowChoices);
    }
    if(((KFPC != none) && KFPC.MyGFxManager != none) && bShowChoices)
    {
        KFPC.MyGFxManager.ShowKickVote(PRI);
    }
}

reliable client simulated function HideKickVote()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Owner);
    if((KFPC != none) && KFPC.MyGFxHUD != none)
    {
        KFPC.MyGFxHUD.HideKickVote();
    }
    if((KFPC != none) && KFPC.MyGFxManager != none)
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
    if((KFPC != none) && KFPC.MyGFxManager != none)
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

simulated function CastMapVote(int MapIndex, bool bDoubleClick)
{
    local KFGameInfo KFGI;

    ServerCastMapVote(self, KFGameReplicationInfo(WorldInfo.GRI).VoteCollector.MapList[MapIndex]);
    if(WorldInfo.NetMode == NM_Standalone)
    {
        KFGI = KFGameInfo(WorldInfo.Game);
        if(KFGI != none)
        {
            KFGI.UpdateCurrentMapVoteTime(((bDoubleClick) ? 0 : 5));
        }
    }
}

reliable server function ServerCastMapVote(PlayerReplicationInfo PRI, string MapName)
{
    local KFGameReplicationInfo KFGRI;
    local KFGameInfo KFGI;

    KFGI = KFGameInfo(WorldInfo.Game);
    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if((KFGI != none) && KFGI.bDisableMapVote)
    {
        return;
    }
    if((KFGRI != none) && !bOnlySpectator)
    {
        if(WorldInfo.NetMode == NM_Standalone)
        {
            KFGRI.ReceiveVoteMap(PRI, KFGameReplicationInfo(WorldInfo.GRI).VoteCollector.MapList.Find(MapName);            
        }
        else
        {
            KFGRI.ReceiveVoteMap(PRI, KFGI.GameMapCycles[KFGI.ActiveMapCycle].Maps.Find(MapName);
        }
    }
}

reliable client simulated function RecieveAARMapOption(string MapOption)
{
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if((KFGRI != none) && KFGRI.VoteCollector != none)
    {
        KFGRI.VoteCollector.AddMapOption(MapOption);
    }
}

reliable client simulated function RecieveTopMaps(TopVotes VoteObject)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Owner);
    if(((KFPC != none) && KFPC.MyGFxManager != none) && KFPC.MyGFxManager.PostGameMenu != none)
    {
        KFPC.MyGFxManager.PostGameMenu.RecieveTopMaps(VoteObject);
    }
}

// Export UKFPlayerReplicationInfo::execServerSetSharedUnlocks(FFrame&, void* const)
private reliable server native final event ServerSetSharedUnlocks(byte NewUnlocks);

// Export UKFPlayerReplicationInfo::execServerSetCharacterCustomization(FFrame&, void* const)
private reliable server native final event ServerSetCharacterCustomization(CustomizationInfo NewMeshInfo);

// Export UKFPlayerReplicationInfo::execSaveCharacterConfig(FFrame&, void* const)
private native final function bool SaveCharacterConfig();

// Export UKFPlayerReplicationInfo::execLoadCharacterConfig(FFrame&, void* const)
private native final function bool LoadCharacterConfig(out int CharacterIndex);

// Export UKFPlayerReplicationInfo::execRetryCharacterOwnership(FFrame&, void* const)
private native final function RetryCharacterOwnership();

// Export UKFPlayerReplicationInfo::execClearCharacterAttachment(FFrame&, void* const)
native function ClearCharacterAttachment(int AttachmentIndex);

simulated function ClientInitialize(Controller C)
{
    if((Role < ROLE_Authority) && C == Owner)
    {
        return;
    }
    SetOwner(C);
    if(C.IsLocalController())
    {
        KFPlayerController(C).InitializeStats();
        SelectCharacter();
        Class'KFUnlockManager'.static.InitSharedUnlocksFor(self);
    }
}

simulated event SelectCharacter(optional int CharIndex)
{
    local OnlineProfileSettings Settings;

    CharIndex = -1;
    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(LocalPlayer(GetALocalPlayerController().Player).ControllerId));
    if(Settings == none)
    {
        LogInternal("Not selecting character just yet since there's no profile settings");
        return;
    }
    LoadCharacterConfig(CharIndex);
    if(!Class'KFUnlockManager'.static.GetAvailable((CharacterArchetypes[CharIndex])))
    {
        CharIndex = GetAnyAvailableCharacter(byte(CharIndex));
        LoadCharacterConfig(CharIndex);
    }
    Settings.SetProfileSettingValueInt(111, CharIndex);
    if(Role < ROLE_Authority)
    {
        ServerSetCharacterCustomization(RepCustomizationInfo);        
    }
    else
    {
        CharacterCustomizationChanged();
    }
}

private final simulated function int GetAnyAvailableCharacter(byte CharIndex)
{
    local byte I;

    I = 0;
    J0x0C:

    if(I < CharacterArchetypes.Length)
    {
        if(Class'KFUnlockManager'.static.GetAvailable((CharacterArchetypes[CharIndex])))
        {
            return I;
        }
        ++ I;
        goto J0x0C;
    }
    return 0;
}

private final simulated event string GetCharacterConfigSection(int Idx)
{
    return PathName(CharacterArchetypes[Idx]);
}

simulated event CharacterCustomizationChanged()
{
    local KFPawn_Human KFP;
    local KFCharacterInfoBase NewCharArch;

    if((WorldInfo.GRI != none) && WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging())
    {
        WorldInfo.TWLogEvent("character_change", self, string(CharacterArchetypes[RepCustomizationInfo.CharacterIndex].Name));
    }
    foreach WorldInfo.AllPawns(Class'KFPawn_Human', KFP)
    {
        if((KFP.PlayerReplicationInfo == self) || (KFP.DrivenVehicle != none) && KFP.DrivenVehicle.PlayerReplicationInfo == self)
        {
            NewCharArch = CharacterArchetypes[RepCustomizationInfo.CharacterIndex];
            if(NewCharArch != KFP.CharacterArch)
            {
                KFP.SetCharacterArch(NewCharArch);
                continue;
            }
            if(WorldInfo.NetMode != NM_DedicatedServer)
            {
                KFP.CharacterArch.SetCharacterMeshFromArch(KFP, self);
            }
        }        
    }    
}

private reliable server final event ServerAnnounceNewSharedContent()
{
    if((WorldInfo.GRI != none) && WorldInfo.GRI.bMatchHasBegun)
    {
        BroadcastLocalizedMessage(Class'KFLocalMessage_Game', 26, self);
    }
}

function PlayerReplicationInfo Duplicate()
{
    local KFPlayerReplicationInfo NewKFPRI;

    NewKFPRI = KFPlayerReplicationInfo(super.Duplicate());
    NewKFPRI.LastQuitTime = LastQuitTime;
    NewKFPRI.NumTimesReconnected = NumTimesReconnected;
    return NewKFPRI;
}

function SetPlayerTeam(TeamInfo NewTeam)
{
    if(NewTeam != Team)
    {
        DamageDealtOnTeam = 0;
    }
    super.SetPlayerTeam(NewTeam);
    KFPlayerOwner = KFPlayerController(Owner);
    SetTimer(1, true, 'UpdateReplicatedVariables');
}

function UpdateReplicatedVariables()
{
    if((((!bIsSpectator && KFPlayerOwner != none) && KFPlayerOwner.GetTeamNum() == 0) && KFPlayerOwner.Pawn != none) && KFPlayerOwner.Pawn.IsAliveAndWell())
    {
        UpdatePawnLocation();        
    }
    else
    {
        if(!IsZero(PawnLocationCompressed))
        {
            PawnLocationCompressed = vect(0, 0, 0);
        }
    }
    UpdateReplicatedPlayerHealth();
}

function UpdatePawnLocation()
{
    PawnLocationCompressed = KFPlayerOwner.Pawn.Location;
    PawnLocationCompressed *= 0.01;
}

function UpdateReplicatedPlayerHealth()
{
    local Pawn OwnerPawn;

    if(KFPlayerOwner != none)
    {
        OwnerPawn = KFPlayerOwner.Pawn;
        if((OwnerPawn != none) && OwnerPawn.Health != PlayerHealth)
        {
            PlayerHealth = byte(OwnerPawn.Health);
            PlayerHealthPercent = FloatToByte(float(OwnerPawn.Health) / float(OwnerPawn.HealthMax));
        }
    }
}

simulated function SetSmoothedPawnIconLocation(Vector NewLocation)
{
    LastReplicatedSmoothedLocation = NewLocation;
}

simulated function Vector GetSmoothedPawnIconLocation(float BlendSpeed)
{
    local Vector UncompressedLocation;

    UncompressedLocation = PawnLocationCompressed * 100;
    if(((BlendSpeed > float(0)) && !IsZero(UncompressedLocation)) && VSizeSq(UncompressedLocation - LastReplicatedSmoothedLocation) < Square(768))
    {
        LastReplicatedSmoothedLocation = VInterpTo(LastReplicatedSmoothedLocation, UncompressedLocation, WorldInfo.DeltaSeconds, VSize(UncompressedLocation - LastReplicatedSmoothedLocation) * BlendSpeed);        
    }
    else
    {
        LastReplicatedSmoothedLocation = UncompressedLocation;
    }
    return LastReplicatedSmoothedLocation;
}

simulated function SetPlayerReady(bool bReady)
{
    bReadyToPlay = bReady;
    ServerSetPlayerReady(bReady);
}

private reliable server final function ServerSetPlayerReady(bool bReady)
{
    bReadyToPlay = bReady;
}

function AddDosh(int DoshAmount, optional bool bEarned)
{
    Score = float(Max(0, int(Score + float(DoshAmount))));
    if(WorldInfo.NetMode == NM_ListenServer)
    {
        UpdateTraderDosh();
    }
    if(bEarned && DoshAmount > 0)
    {
        if((KFPlayerController(Owner) != none) && KFPlayerController(Owner).MatchStats != none)
        {
            KFPlayerController(Owner).MatchStats.RecordIntStat(1, DoshAmount);
        }
    }
}

simulated function UpdateTraderDosh()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Owner);
    if((KFPC != none) && KFPC.bClientTraderMenuOpen)
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
    if(KFPC != none)
    {
        if(KFPC.MyGFxHUD != none)
        {
            KFPC.MyGFxHUD.NotifyHUDofPRIDestroyed(self);
        }
        if((KFPC != Owner) && KFPC.MyGFxManager != none)
        {
            KFPC.MyGFxManager.RemotePlayerDisconnected(UniqueId);
        }
    }
}

function IncrementDeaths(optional int Amt)
{
    Amt = 1;
    if((WorldInfo.GRI != none) && WorldInfo.GRI.bMatchHasBegun)
    {
        super.IncrementDeaths(Amt);
    }
    PawnLocationCompressed = vect(0, 0, 0);
}

reliable client simulated function MarkSupplierOwnerUsed(KFPlayerReplicationInfo SupplierPRI, optional bool bReceivedPrimary, optional bool bReceivedSecondary)
{
    bReceivedPrimary = true;
    bReceivedSecondary = true;
    if(SupplierPRI != none)
    {
        SupplierPRI.MarkSupplierUsed(bReceivedPrimary, bReceivedSecondary);
    }
}

simulated function MarkSupplierUsed(bool bReceivedPrimary, bool bReceivedSecondary)
{
    bPerkPrimarySupplyUsed = bPerkPrimarySupplyUsed || bReceivedPrimary;
    bPerkSecondarySupplyUsed = bPerkSecondarySupplyUsed || bReceivedSecondary;
}

simulated function ResetSupplierUsed()
{
    local array<KFPlayerReplicationInfo> KFPRIArray;
    local int I;

    KFGameReplicationInfo(WorldInfo.GRI).GetKFPRIArray(KFPRIArray);
    I = 0;
    J0x52:

    if(I < KFPRIArray.Length)
    {
        KFPRIArray[I].bPerkPrimarySupplyUsed = false;
        KFPRIArray[I].bPerkSecondarySupplyUsed = false;
        ++ I;
        goto J0x52;
    }
}

simulated function NotifyWaveEnded()
{
    bPerkPrimarySupplyUsed = false;
    bPerkSecondarySupplyUsed = false;
}

// Export UKFPlayerReplicationInfo::execHasHadInitialSpawn(FFrame&, void* const)
native simulated function bool HasHadInitialSpawn();

defaultproperties
{
    bShowNonRelevantPlayers=true
    SecondsOfGameplay=-1
    CharacterArchetypes(0)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Alberts_archetype'
    CharacterArchetypes(1)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Knight_Archetype'
    CharacterArchetypes(2)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_briar_archetype'
    CharacterArchetypes(3)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Mark_archetype'
    CharacterArchetypes(4)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_MrFoster_archetype'
    CharacterArchetypes(5)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Jagerhorn_Archetype'
    CharacterArchetypes(6)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Ana_Archetype'
    CharacterArchetypes(7)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Masterson_Archetype'
    CharacterArchetypes(8)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Alan_Archetype'
    CharacterArchetypes(9)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Coleman_archetype'
    CharacterArchetypes(10)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_DJSkully_archetype'
    CharacterArchetypes(11)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Strasser_Archetype'
    CharacterArchetypes(12)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Tanaka_Archetype'
    CharacterArchetypes(13)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_rockabilly_archetype'
    RepCustomizationInfo=(CharacterIndex=0,HeadMeshIndex=0,HeadSkinIndex=0,BodyMeshIndex=0,BodySkinIndex=0,AttachmentMeshIndices=255,AttachmentMeshIndices[1]=255,AttachmentMeshIndices[2]=255,AttachmentSkinIndices=0,AttachmentSkinIndices[1]=0,AttachmentSkinIndices[2]=0)
}