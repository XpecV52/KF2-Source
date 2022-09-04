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
const KFID_SafeFrameScale = 168;
const KFID_Native4kResolution = 169;
const KFID_HideRemoteHeadshotEffects = 170;
const KFID_SavedHeadshotID = 171;
const KFID_ToggleToRun = 172;
const KFID_ClassicPlayerInfo = 173;
const NUM_COSMETIC_ATTACHMENTS = 3;

struct native CustomizationInfo
{
    var const int CharacterIndex;
    var const int HeadMeshIndex;
    var const int HeadSkinIndex;
    var const int BodyMeshIndex;
    var const int BodySkinIndex;
    var const int AttachmentMeshIndices[3];
    var const int AttachmentSkinIndices[3];

    structdefaultproperties
    {
        CharacterIndex=0
        HeadMeshIndex=0
        HeadSkinIndex=0
        BodyMeshIndex=0
        BodySkinIndex=0
        AttachmentMeshIndices[0]=-1
        AttachmentMeshIndices[1]=-1
        AttachmentMeshIndices[2]=-1
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
var private byte ActivePerkPrestigeLevel;
var byte PlayerHealth;
var byte PlayerHealthPercent;
var byte PerkSupplyLevel;
var KFLocalMessage_VoiceComms.EVoiceCommsType CurrentVoiceCommsRequest;
var byte SharedUnlocks;
var bool bHasSpawnedIn;
var bool bAllowDoshEarning;
var repnotify bool bVOIPRegisteredWithOSS;
var bool bExtraFireRange;
var bool bSplashActive;
var bool bNukeActive;
var bool bConcussiveActive;
var bool bPerkPrimarySupplyUsed;
var bool bPerkSecondarySupplyUsed;
var bool bVotedToSkipTraderTime;
var bool bObjectivePlayer;
var bool bShowNonRelevantPlayers;
var transient bool bWaitingForInventory;
var bool bCarryingCollectible;
var string LastCrateGiftTimestamp;
var int SecondsOfGameplay;
var const array<KFCharacterInfo_Human> CharacterArchetypes;
var repnotify const CustomizationInfo RepCustomizationInfo;
var Texture CharPortrait;
var int DamageDealtOnTeam;
var class<KFPerk> CurrentPerkClass;
var int Assists;
var float VoiceCommsStatusDisplayInterval;
var int VoiceCommsStatusDisplayIntervalCount;
var int VoiceCommsStatusDisplayIntervalMax;
var private repnotify int CurrentHeadShotEffectID;
var private Vector PawnLocationCompressed;
var private Vector LastReplicatedSmoothedLocation;
var KFPlayerController KFPlayerOwner;
var transient int WaitingForInventoryCharacterIndex;

replication
{
     if(bNetDirty)
        ActivePerkLevel, ActivePerkPrestigeLevel, 
        Assists, CharPortrait, 
        CurrentHeadShotEffectID, CurrentPerkClass, 
        CurrentVoiceCommsRequest, DamageDealtOnTeam, 
        NetPerkIndex, PerkSupplyLevel, 
        PlayerHealth, PlayerHealthPercent, 
        RepCustomizationInfo, bCarryingCollectible, 
        bConcussiveActive, bExtraFireRange, 
        bHasSpawnedIn, bNukeActive, 
        bObjectivePlayer, bSplashActive, 
        bVOIPRegisteredWithOSS;

     if(bNetDirty && !bNetOwner || bDemoRecording)
        SharedUnlocks, VOIPStatus;

     if(!bNetOwner && bNetDirty)
        PawnLocationCompressed;
}

// Export UKFPlayerReplicationInfo::execStartLoadCosmeticContent(FFrame&, void* const)
native function bool StartLoadCosmeticContent(KFCharacterInfo_Human CharArch, int CosmeticType, int CosmeticIdx);

// Export UKFPlayerReplicationInfo::execStartLoadHeadshotFxContent(FFrame&, void* const)
native function StartLoadHeadshotFxContent();

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
                else
                {
                    if(VarName == 'bVOIPRegisteredWithOSS')
                    {
                        OnTalkerRegistered();                        
                    }
                    else
                    {
                        if(VarName == 'CurrentHeadShotEffectID')
                        {
                            CurrentHeadShotEffectIdChanged();
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

simulated function byte GetActivePerkPrestigeLevel()
{
    return ActivePerkPrestigeLevel;
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
    local KFGFxHudWrapper myGfxHUD;
    local OnlineSubsystem OSS;

    OSS = Class'GameEngine'.static.GetOnlineSubsystem();
    foreach WorldInfo.LocalPlayerControllers(Class'KFPlayerController', KFPC)
    {
        if((OSS != none) && OSS.HasChatRestriction(byte(LocalPlayer(KFPC.Player).ControllerId)))
        {            
            return;
        }
        myGfxHUD = KFGFxHudWrapper(KFPC.myHUD);
        TalkerKFPRI = KFPlayerReplicationInfo(Talker);
        if(TalkerKFPRI != none)
        {
            if((TalkerKFPRI.VOIPStatus == 6) && !KFPC.PlayerReplicationInfo.bOnlySpectator)
            {                
                return;
            }
        }
        if((myGfxHUD != none) && myGfxHUD.HudMovie != none)
        {
            myGfxHUD.HudMovie.VOIPWidget.VOIPEventTriggered(Talker, bIsTalking);
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
    local int I;
    local KFPlayerReplicationInfo PRI;
    local OnlineSubsystem OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    LocalPC = GetALocalPlayerController();
    if((LocalPC.PlayerReplicationInfo == none) || WorldInfo.GRI == none)
    {
        SetTimer(0.1, false, 'OnTalkerRegistered');
    }
    if(((LocalPC != none) && LocalPC.PlayerReplicationInfo != none) && WorldInfo.GRI != none)
    {
        if(LocalPC.PlayerReplicationInfo == self)
        {
            I = 0;
            J0x124:

            if(I < WorldInfo.GRI.PRIArray.Length)
            {
                PRI = KFPlayerReplicationInfo(WorldInfo.GRI.PRIArray[I]);
                if((PRI != self) && PRI.bVOIPRegisteredWithOSS)
                {
                    OnlineSub.VoiceInterface.RegisterRemoteTalker(PRI.UniqueId);
                }
                ++ I;
                goto J0x124;
            }            
        }
        else
        {
            if(KFPlayerReplicationInfo(LocalPC.PlayerReplicationInfo).bVOIPRegisteredWithOSS)
            {
                OnlineSub.VoiceInterface.RegisterRemoteTalker(UniqueId);
            }
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
    if((KFPC != none) && KFPC.myGfxHUD != none)
    {
        KFPC.myGfxHUD.ShowKickVote(PRI, VoteDuration, bShowChoices);
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
    if((KFPC != none) && KFPC.myGfxHUD != none)
    {
        KFPC.myGfxHUD.HideKickVote();
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

simulated function RequestSkiptTrader(PlayerReplicationInfo PRI)
{
    bVotedToSkipTraderTime = true;
    ServerRequestSkipTrader(self);
}

reliable server function ServerRequestSkipTrader(PlayerReplicationInfo PRI)
{
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if(KFGRI != none)
    {
        KFGRI.VoteCollector.RecieveSkipTraderTimeVote(PRI);
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

// Export UKFPlayerReplicationInfo::execServerSetCurrentHeadShotEffect(FFrame&, void* const)
private reliable server native final event ServerSetCurrentHeadShotEffect(int ItemId);

final simulated function int GetHeadShotEffectID()
{
    return CurrentHeadShotEffectID;
}

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
    local OnlineContentInterface OnlineContentInt;

    if((Role < ROLE_Authority) && C == Owner)
    {
        return;
    }
    SetOwner(C);
    if(C.IsLocalController())
    {
        KFPlayerController(C).InitializeStats();
        SelectCharacter();
        if(Class'WorldInfo'.static.IsConsoleBuild())
        {
            OnlineContentInt = Class'GameEngine'.static.GetOnlineSubsystem().ContentInterface;
            OnlineContentInt.ClearCrossTitleContentList(0, 2);
            OnlineContentInt.AddReadCrossTitleContentCompleteDelegate(0, 2, SharedContentInitChain_CrossTitleContentRead);
            if(!OnlineContentInt.ReadCrossTitleContentList(0, 2))
            {
                SharedContentInitChain_CrossTitleContentRead(true);
            }            
        }
        else
        {
            SharedContentInitChain_CrossTitleContentRead(true);
        }
    }
}

simulated function SharedContentInitChain_CrossTitleContentRead(bool bWasSuccessful)
{
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        Class'GameEngine'.static.GetOnlineSubsystem().ContentInterface.ClearReadCrossTitleContentCompleteDelegate(0, 2, SharedContentInitChain_CrossTitleContentRead);
        if(Class'GameEngine'.static.GetOnlineSubsystem().CurrentInventory.Length == 0)
        {
            Class'GameEngine'.static.GetPlayfabInterface().AddInventoryReadCompleteDelegate(SharedContentInitChain_InventoryRead_Playfab);            
        }
        else
        {
            SharedContentInitChain_InventoryRead_Playfab(true);
        }        
    }
    else
    {
        if(Class'GameEngine'.static.GetOnlineSubsystem().bInventoryReady == false)
        {
            Class'GameEngine'.static.GetOnlineSubsystem().AddOnInventoryReadCompleteDelegate(SharedContentInitChain_InventoryRead_Steamworks);            
        }
        else
        {
            SharedContentInitChain_InventoryRead_Steamworks();
        }
    }
}

simulated function SharedContentInitChain_InventoryRead_Steamworks()
{
    Class'GameEngine'.static.GetOnlineSubsystem().ClearOnInventoryReadCompleteDelegate(SharedContentInitChain_InventoryRead_Steamworks);
    Class'KFUnlockManager'.static.InitSharedUnlocksFor(self);
}

simulated function SharedContentInitChain_InventoryRead_Playfab(bool bWasSuccessful)
{
    local array<OnlineCrossTitleContent> CrossTitleContent;

    Class'GameEngine'.static.GetPlayfabInterface().ClearInventoryReadCompleteDelegate(OnInventoryReadComplete_Playfab);
    Class'GameEngine'.static.GetOnlineSubsystem().ContentInterface.GetCrossTitleContentList(0, 2, CrossTitleContent);
    Class'KFUnlockManager'.static.InitSharedUnlocksFor(self, CrossTitleContent);
}

function OnInventoryReadComplete_Steamworks()
{
    Class'GameEngine'.static.GetOnlineSubsystem().ClearOnInventoryReadCompleteDelegate(OnInventoryReadComplete_Steamworks);
    bWaitingForInventory = false;
    SelectCharacter(WaitingForInventoryCharacterIndex);
}

function OnInventoryReadComplete_Playfab(bool bWasSuccessful)
{
    if(bWasSuccessful)
    {
        Class'GameEngine'.static.GetPlayfabInterface().ClearInventoryReadCompleteDelegate(OnInventoryReadComplete_Playfab);
        bWaitingForInventory = false;
        SelectCharacter(WaitingForInventoryCharacterIndex);
    }
}

simulated event SelectCharacter(optional int CharIndex, optional bool bWaitForInventory)
{
    local OnlineProfileSettings Settings;

    CharIndex = -1;
    bWaitForInventory = false;
    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(LocalPlayer(GetALocalPlayerController().Player).ControllerId));
    if(Settings == none)
    {
        LogInternal("Not selecting character just yet since there's no profile settings");
        return;
    }
    if(bWaitForInventory)
    {
        if(bWaitingForInventory)
        {
            return;            
        }
        else
        {
            if(Class'WorldInfo'.static.IsConsoleBuild())
            {
                if(Class'GameEngine'.static.GetOnlineSubsystem().CurrentInventory.Length == 0)
                {
                    Class'GameEngine'.static.GetPlayfabInterface().AddInventoryReadCompleteDelegate(OnInventoryReadComplete_Playfab);
                    WaitingForInventoryCharacterIndex = CharIndex;
                    bWaitingForInventory = true;
                    return;
                }                
            }
            else
            {
                if(!Class'GameEngine'.static.GetOnlineSubsystem().bInventoryReady)
                {
                    Class'GameEngine'.static.GetOnlineSubsystem().AddOnInventoryReadCompleteDelegate(OnInventoryReadComplete_Steamworks);
                    WaitingForInventoryCharacterIndex = CharIndex;
                    bWaitingForInventory = true;
                    return;
                }
            }
        }
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

simulated event CurrentHeadShotEffectIdChanged()
{
    StartLoadHeadshotFxContent();
}

function PlayerReplicationInfo Duplicate()
{
    local KFPlayerReplicationInfo NewKFPRI;

    NewKFPRI = KFPlayerReplicationInfo(super.Duplicate());
    NewKFPRI.LastQuitTime = LastQuitTime;
    NewKFPRI.NumTimesReconnected = NumTimesReconnected;
    return NewKFPRI;
}

function OverrideWith(PlayerReplicationInfo PRI)
{
    super.OverrideWith(PRI);
    SetPlayerTeam(Team);
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
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Owner);
    bReadyToPlay = bReady;
    ServerSetPlayerReady(bReady);
    if((KFPC != none) && KFPC.LEDEffectsManager != none)
    {
        KFPC.LEDEffectsManager.PlayEffectSetReady(bReadyToPlay);
    }
}

private reliable server final function ServerSetPlayerReady(bool bReady)
{
    bReadyToPlay = bReady;
}

function AddDosh(int DoshAmount, optional bool bEarned)
{
    if(!bAllowDoshEarning && bEarned)
    {
        return;
    }
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
        if(KFPC.myGfxHUD != none)
        {
            KFPC.myGfxHUD.NotifyHUDofPRIDestroyed(self);
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
    bVotedToSkipTraderTime = false;
}

simulated function NotifyWaveStart()
{
    bPerkPrimarySupplyUsed = false;
    bPerkSecondarySupplyUsed = false;
}

// Export UKFPlayerReplicationInfo::execHasHadInitialSpawn(FFrame&, void* const)
native simulated function bool HasHadInitialSpawn();

simulated function SetCurrentVoiceCommsRequest(int NewValue)
{
    CurrentVoiceCommsRequest = byte(NewValue);
    bNetDirty = true;
    ClearVoiceCommsRequest();
    SetCurrentIconToVoiceCommsIcon();
}

simulated function SetCurrentIconToPerkIcon()
{
    CurrentVoiceCommsRequest = 10;
    bNetDirty = true;
    ClearVoiceCommsRequest();
}

simulated function SetCurrentIconToVoiceCommsIcon()
{
    SetTimer(VoiceCommsStatusDisplayInterval, false, 'SetCurrentIconToPerkIcon');
}

simulated function ClearVoiceCommsRequest()
{
    ClearTimer('SetCurrentIconToPerkIcon');
}

simulated function Texture2D GetCurrentIconToDisplay()
{
    if((CurrentVoiceCommsRequest == 10) && CurrentPerkClass != none)
    {
        return CurrentPerkClass.default.PerkIcon;
    }
    return Class'KFLocalMessage_VoiceComms'.default.VoiceCommsIcons[CurrentVoiceCommsRequest];
}

defaultproperties
{
    CurrentVoiceCommsRequest=EVoiceCommsType.VCT_NONE
    bAllowDoshEarning=true
    bShowNonRelevantPlayers=true
    SecondsOfGameplay=-1
    CharacterArchetypes(0)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_MrFoster_archetype'
    CharacterArchetypes(1)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Alberts_archetype'
    CharacterArchetypes(2)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_knight_archetype'
    CharacterArchetypes(3)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_briar_archetype'
    CharacterArchetypes(4)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_mark_archetype'
    CharacterArchetypes(5)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Jagerhorn_Archetype'
    CharacterArchetypes(6)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Ana_Archetype'
    CharacterArchetypes(7)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Masterson_archetype'
    CharacterArchetypes(8)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_alan_archetype'
    CharacterArchetypes(9)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Coleman_archetype'
    CharacterArchetypes(10)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_DJSkully_archetype'
    CharacterArchetypes(11)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_strasser_archetype'
    CharacterArchetypes(12)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Tanaka_Archetype'
    CharacterArchetypes(13)=KFCharacterInfo_Human'CHR_Playable_ARCH.chr_rockabilly_archetype'
    CharacterArchetypes(14)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_DAR_archetype'
    CharacterArchetypes(15)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_MrsFoster_archetype'
    CharacterArchetypes(16)=KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_BadSanta_Archetype'
    RepCustomizationInfo=(CharacterIndex=0,HeadMeshIndex=0,HeadSkinIndex=0,BodyMeshIndex=0,BodySkinIndex=0,AttachmentMeshIndices=-1,AttachmentMeshIndices[1]=-1,AttachmentMeshIndices[2]=-1,AttachmentSkinIndices=0,AttachmentSkinIndices[1]=0,AttachmentSkinIndices[2]=0)
    VoiceCommsStatusDisplayInterval=5
    VoiceCommsStatusDisplayIntervalMax=1
    CurrentHeadShotEffectID=-1
}