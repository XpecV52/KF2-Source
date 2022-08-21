/*******************************************************************************
 * OnlineSubsystem generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class OnlineSubsystem extends Object
    abstract
    native
    config(Engine);

enum ELoginStatus
{
    LS_NotLoggedIn,
    LS_UsingLocalProfile,
    LS_LoggedIn,
    LS_MAX
};

enum EFeaturePrivilege
{
    FP_OnlinePlay,
    FP_CommunicationText,
    FP_CommunicationVideo,
    FP_CommunicationVoice,
    FP_ShareUserCreatedContent,
    FP_PurchaseContent,
    FP_ViewPlayerProfile,
    FP_ShowPresenceInformation,
    FP_RecordDVRClips,
    FP_CloudStorage,
    FP_PremiumContent,
    FP_PremiumVideoContent,
    FP_BrowseInternet,
    FP_SocialNetworkSharing,
    FP_KinectSharing,
    FP_FitnessUpload,
    FP_MAX
};

enum EFeaturePrivilegeLevel
{
    FPL_Disabled,
    FPL_EnabledFriendsOnly,
    FPL_Enabled,
    FPL_Unknown,
    FPL_MAX
};

enum ENetworkNotificationPosition
{
    NNP_TopLeft,
    NNP_TopCenter,
    NNP_TopRight,
    NNP_CenterLeft,
    NNP_Center,
    NNP_CenterRight,
    NNP_BottomLeft,
    NNP_BottomCenter,
    NNP_BottomRight,
    NNP_MAX
};

enum EOnlineGameState
{
    OGS_NoSession,
    OGS_Pending,
    OGS_Starting,
    OGS_InProgress,
    OGS_Ending,
    OGS_Ended,
    OGS_MAX
};

enum EOnlineEnumerationReadState
{
    OERS_NotStarted,
    OERS_InProgress,
    OERS_Done,
    OERS_Failed,
    OERS_MAX
};

enum OnGameInviteAcceptedResult
{
    OGIAR_Success,
    OGIAR_GeneralFailure,
    OGIAR_ServerActivity,
    OGIAR_WrongAccount,
    OGIAR_MAX
};

enum EOnlineFriendState
{
    OFS_Offline,
    OFS_Online,
    OFS_Away,
    OFS_Busy,
    OFS_MAX
};

enum EOnlineContentType
{
    OCT_Downloaded,
    OCT_SaveGame,
    OCT_MAX
};

enum EOnlineServerConnectionStatus
{
    OSCS_NotConnected,
    OSCS_Connected,
    OSCS_ConnectionDropped,
    OSCS_NoNetworkConnection,
    OSCS_ServiceUnavailable,
    OSCS_UpdateRequired,
    OSCS_ServersTooBusy,
    OSCS_DuplicateLoginDetected,
    OSCS_InvalidUser,
    OSCS_Banned,
    OSCS_TooYoung,
    OSCS_PSNUnavailable,
    OSCS_MAX
};

enum ENATType
{
    NAT_Unknown,
    NAT_Open,
    NAT_Moderate,
    NAT_Strict,
    NAT_MAX
};

enum ELanBeaconState
{
    LANB_NotUsingLanBeacon,
    LANB_Hosting,
    LANB_Searching,
    LANB_MAX
};

enum EOnlineAccountCreateStatus
{
    OACS_CreateSuccessful,
    OACS_UnknownError,
    OACS_InvalidUserName,
    OACS_InvalidPassword,
    OACS_InvalidUniqueUserName,
    OACS_UniqueUserNameInUse,
    OACS_ServiceUnavailable,
    OACS_MAX
};

enum EOnlineNewsType
{
    ONT_Unknown,
    ONT_GameNews,
    ONT_ContentAnnouncements,
    ONT_Misc,
    ONT_MAX
};

enum ItemType
{
    ITP_WeaponSkin,
    ITP_CharacterSkin,
    ITP_KeyCrate,
    ITP_CraftingComponent,
    ITP_Item,
    ITP_NONE,
    ITP_MAX
};

enum ItemRarity
{
    ITR_Common,
    ITR_Uncommon,
    ITR_Rare,
    ITR_Mythical,
    ITR_Legendary,
    ITR_ExceedinglyRare,
    ITR_NONE,
    ITR_MAX
};

struct native UniqueNetId
{
    var QWord Uid;

    structdefaultproperties
    {
        Uid=none
    }
};

struct native FriendsQuery
{
    var UniqueNetId UniqueId;
    var bool bIsFriend;

    structdefaultproperties
    {
        UniqueId=(Uid=none)
        bIsFriend=false
    }
};

struct native OnlineFriend
{
    var const UniqueNetId UniqueId;
    var const QWord SessionId;
    var const string NickName;
    var const string PresenceInfo;
    var const OnlineSubsystem.EOnlineFriendState FriendState;
    var const bool bIsOnline;
    var const bool bIsPlaying;
    var const bool bIsPlayingThisGame;
    var const bool bIsJoinable;
    var const bool bHasVoiceSupport;
    var bool bHaveInvited;
    var const bool bHasInvitedYou;

    structdefaultproperties
    {
        UniqueId=(Uid=none)
        SessionId=none
        NickName=""
        PresenceInfo=""
        FriendState=EOnlineFriendState.OFS_Offline
        bIsOnline=false
        bIsPlaying=false
        bIsPlayingThisGame=false
        bIsJoinable=false
        bHasVoiceSupport=false
        bHaveInvited=false
        bHasInvitedYou=false
    }
};

struct native OnlineContent
{
    var OnlineSubsystem.EOnlineContentType ContentType;
    var byte UserIndex;
    var bool bIsCorrupt;
    var int DeviceID;
    var int LicenseMask;
    var string FriendlyName;
    var string Filename;
    var string ContentPath;
    var array<string> ContentPackages;
    var array<string> ContentFiles;

    structdefaultproperties
    {
        ContentType=EOnlineContentType.OCT_Downloaded
        UserIndex=0
        bIsCorrupt=false
        DeviceID=0
        LicenseMask=0
        FriendlyName=""
        Filename=""
        ContentPath=""
        ContentPackages=none
        ContentFiles=none
    }
};

struct native OnlineCrossTitleContent extends OnlineContent
{
    var int TitleId;
};

struct native OnlineRegistrant
{
    var const UniqueNetId PlayerNetId;

    structdefaultproperties
    {
        PlayerNetId=(Uid=none)
    }
};

struct native OnlineArbitrationRegistrant extends OnlineRegistrant
{
    var const QWord MachineId;
    var const int Trustworthiness;
};

struct SpeechRecognizedWord
{
    var int WordId;
    var string WordText;
    var float Confidence;

    structdefaultproperties
    {
        WordId=0
        WordText=""
        Confidence=0
    }
};

struct native OnlinePlayerScore
{
    var UniqueNetId PlayerID;
    var int TeamID;
    var int Score;

    structdefaultproperties
    {
        PlayerID=(Uid=none)
        TeamID=0
        Score=0
    }
};

struct native LocalTalker
{
    var bool bHasVoice;
    var bool bHasNetworkedVoice;
    var bool bIsRecognizingSpeech;
    var bool bWasTalking;
    var bool bIsTalking;
    var bool bIsRegistered;

    structdefaultproperties
    {
        bHasVoice=false
        bHasNetworkedVoice=false
        bIsRecognizingSpeech=false
        bWasTalking=false
        bIsTalking=false
        bIsRegistered=false
    }
};

struct native RemoteTalker
{
    var UniqueNetId TalkerId;
    var float LastNotificationTime;
    var bool bWasTalking;
    var bool bIsTalking;
    var bool bIsRegistered;

    structdefaultproperties
    {
        TalkerId=(Uid=none)
        LastNotificationTime=0
        bWasTalking=false
        bIsTalking=false
        bIsRegistered=false
    }
};

struct native OnlineFriendMessage
{
    var UniqueNetId SendingPlayerId;
    var string SendingPlayerNick;
    var bool bIsFriendInvite;
    var bool bIsGameInvite;
    var bool bWasAccepted;
    var bool bWasDenied;
    var string Message;

    structdefaultproperties
    {
        SendingPlayerId=(Uid=none)
        SendingPlayerNick=""
        bIsFriendInvite=false
        bIsGameInvite=false
        bWasAccepted=false
        bWasDenied=false
        Message=""
    }
};

struct native NamedInterface
{
    var name InterfaceName;
    var Object InterfaceObject;

    structdefaultproperties
    {
        InterfaceName=None
        InterfaceObject=none
    }
};

struct native NamedInterfaceDef
{
    var name InterfaceName;
    var string InterfaceClassName;

    structdefaultproperties
    {
        InterfaceName=None
        InterfaceClassName=""
    }
};

struct native EmsFile
{
    var string Hash;
    var string DLName;
    var string Filename;
    var int FileSize;

    structdefaultproperties
    {
        Hash=""
        DLName=""
        Filename=""
        FileSize=0
    }
};

struct native TitleFile
{
    var string Filename;
    var OnlineSubsystem.EOnlineEnumerationReadState AsyncState;
    var array<byte> Data;

    structdefaultproperties
    {
        Filename=""
        AsyncState=EOnlineEnumerationReadState.OERS_NotStarted
        Data=none
    }
};

struct native CommunityContentFile
{
    var int ContentId;
    var int FileId;
    var int ContentType;
    var int FileSize;
    var UniqueNetId Owner;
    var int DownloadCount;
    var float AverageRating;
    var int RatingCount;
    var int LastRatingGiven;
    var string LocalFilePath;

    structdefaultproperties
    {
        ContentId=0
        FileId=0
        ContentType=0
        FileSize=0
        Owner=(Uid=none)
        DownloadCount=0
        AverageRating=0
        RatingCount=0
        LastRatingGiven=0
        LocalFilePath=""
    }
};

struct native CommunityContentMetadata
{
    var int ContentType;
    var array<SettingsProperty> MetadataItems;

    structdefaultproperties
    {
        ContentType=0
        MetadataItems=none
    }
};

struct native NamedSession
{
    var name SessionName;
    var native const transient Pointer SessionInfo;
    var OnlineGameSettings GameSettings;
    var array<OnlineRegistrant> Registrants;
    var array<OnlineArbitrationRegistrant> ArbitrationRegistrants;

    structdefaultproperties
    {
        SessionName=None
        GameSettings=none
        Registrants=none
        ArbitrationRegistrants=none
    }
};

struct native AchievementDetails
{
    var const int Id;
    var const string AchievementName;
    var const string Description;
    var const string HowTo;
    var Surface Image;
    var const byte MonthEarned;
    var const byte DayEarned;
    var const byte YearEarned;
    var const byte DayOfWeekEarned;
    var const int GamerPoints;
    var const bool bIsSecret;
    var const bool bWasAchievedOnline;
    var const bool bWasAchievedOffline;

    structdefaultproperties
    {
        Id=0
        AchievementName=""
        Description=""
        HowTo=""
        Image=none
        MonthEarned=0
        DayEarned=0
        YearEarned=0
        DayOfWeekEarned=0
        GamerPoints=0
        bIsSecret=false
        bWasAchievedOnline=false
        bWasAchievedOffline=false
    }
};

struct native OnlinePartyMember
{
    var const UniqueNetId UniqueId;
    var const string NickName;
    var const byte LocalUserNum;
    var const OnlineSubsystem.ENATType NatType;
    var const int TitleId;
    var const bool bIsLocal;
    var const bool bIsInPartyVoice;
    var const bool bIsTalking;
    var const bool bIsInGameSession;
    var const bool bIsPlayingThisGame;
    var const QWord SessionId;
    var const int Data1;
    var const int Data2;
    var const int Data3;
    var const int Data4;

    structdefaultproperties
    {
        UniqueId=(Uid=none)
        NickName=""
        LocalUserNum=0
        NatType=ENATType.NAT_Unknown
        TitleId=0
        bIsLocal=false
        bIsInPartyVoice=false
        bIsTalking=false
        bIsInGameSession=false
        bIsPlayingThisGame=false
        SessionId=none
        Data1=0
        Data2=0
        Data3=0
        Data4=0
    }
};

struct native SocialPostPrivileges
{
    var const bool bCanPostImage;
    var const bool bCanPostLink;

    structdefaultproperties
    {
        bCanPostImage=false
        bCanPostLink=false
    }
};

struct native SocialPostImageFlags
{
    var bool bIsUserGeneratedImage;
    var bool bIsGameGeneratedImage;
    var bool bIsAchievementImage;
    var bool bIsMediaImage;

    structdefaultproperties
    {
        bIsUserGeneratedImage=false
        bIsGameGeneratedImage=false
        bIsAchievementImage=false
        bIsMediaImage=false
    }
};

struct native SocialPostImageInfo
{
    var SocialPostImageFlags Flags;
    var string MessageText;
    var string TitleText;
    var string PictureCaption;
    var string PictureDescription;

    structdefaultproperties
    {
        Flags=(bIsUserGeneratedImage=false,bIsGameGeneratedImage=false,bIsAchievementImage=false,bIsMediaImage=false)
        MessageText=""
        TitleText=""
        PictureCaption=""
        PictureDescription=""
    }
};

struct native SocialPostLinkInfo extends SocialPostImageInfo
{
    var string TitleURL;
    var string PictureURL;
};

struct native CurrentInventoryEntry
{
    var const UniqueNetId Instance;
    var const int Definition;
    var const int Quantity;
    var int NewlyAdded;
    var int LastUsedTime;

    structdefaultproperties
    {
        Instance=(Uid=none)
        Definition=0
        Quantity=0
        NewlyAdded=0
        LastUsedTime=0
    }
};

struct native ItemProperties
{
    var int Definition;
    var string ProductId;
    var string SignedOfferId;
    var string Name;
    var OnlineSubsystem.ItemType Type;
    var OnlineSubsystem.ItemRarity Rarity;
    var string ShortDescription;
    var string Price;
    var int Quality;
    var string IconURL;
    var string IconURLLarge;
    var bool Tradeable;
    var bool Commodity;
    var string Description;
    var string Exchange;
    var string Bundle;
    var bool UniqueToOwn;

    structdefaultproperties
    {
        Definition=0
        ProductId=""
        SignedOfferId=""
        Name=""
        Type=ItemType.ITP_WeaponSkin
        Rarity=ItemRarity.ITR_Common
        ShortDescription=""
        Price=""
        Quality=0
        IconURL=""
        IconURLLarge=""
        Tradeable=false
        Commodity=false
        Description=""
        Exchange=""
        Bundle=""
        UniqueToOwn=false
    }
};

struct native ExchangeRule
{
    var int Definition;
    var int Quantity;

    structdefaultproperties
    {
        Definition=0
        Quantity=0
    }
};

struct native ExchangeRuleSets
{
    var array<ExchangeRule> Sources;
    var int Target;
    var OnlineSubsystem.ItemType Type;

    structdefaultproperties
    {
        Sources=none
        Target=0
        Type=ItemType.ITP_WeaponSkin
    }
};

var private native const noexport Pointer VfTable_FTickableObject;
var OnlineAccountInterface AccountInterface;
var OnlinePlayerInterface PlayerInterface;
var OnlinePlayerInterfaceEx PlayerInterfaceEx;
var OnlineSystemInterface SystemInterface;
var OnlineGameInterface GameInterface;
var OnlineContentInterface ContentInterface;
var OnlineVoiceInterface VoiceInterface;
var OnlineStatsInterface StatsInterface;
var OnlineNewsInterface NewsInterface;
var OnlinePartyChatInterface PartyChatInterface;
var OnlineTitleFileInterface TitleFileInterface;
var OnlineTitleFileCacheInterface TitleFileCacheInterface;
var UserCloudFileInterface UserCloudInterface;
var SharedCloudFileInterface SharedCloudInterface;
var OnlineSocialInterface SocialInterface;
var OnlineAuthInterface AuthInterface;
var array< delegate<OnInventoryReadComplete> > ReadInventoryCompleteDelegates;
var private array<NamedInterface> NamedInterfaces;
var config array<config NamedInterfaceDef> NamedInterfaceDefs;
var protected const array<NamedSession> Sessions;
var config bool bUseBuildIdOverride;
var config int BuildIdOverride;
var config string IniLocPatcherClassName;
var transient IniLocPatcher Patcher;
var config float AsyncMinCompletionTime;
var const array<CurrentInventoryEntry> CurrentInventory;
var array<ItemProperties> ItemPropertiesList;
var array<ExchangeRuleSets> ExchangeRuleSetList;
var delegate<OnInventoryReadComplete> __OnInventoryReadComplete__Delegate;
var delegate<OnReadOnlineAvatarComplete> __OnReadOnlineAvatarComplete__Delegate;
var delegate<OnReadOnlineAvatarByNameComplete> __OnReadOnlineAvatarByNameComplete__Delegate;

// Export UOnlineSubsystem::execOpenMarketPlaceSearch(FFrame&, void* const)
native function OpenMarketPlaceSearch(ItemProperties Item);

// Export UOnlineSubsystem::execOpenItemPurchaseOverlay(FFrame&, void* const)
native function OpenItemPurchaseOverlay(int SKU);

// Export UOnlineSubsystem::execOpenURL(FFrame&, void* const)
native function OpenURL(string WebsiteLink);

// Export UOnlineSubsystem::execIsExchangeable(FFrame&, void* const)
native function int IsExchangeable(int SourceSKU, out array<ExchangeRuleSets> Ret);

// Export UOnlineSubsystem::execClearNewlyAdded(FFrame&, void* const)
native function ClearNewlyAdded();

// Export UOnlineSubsystem::execExchangeReady(FFrame&, void* const)
native function bool ExchangeReady(const out ExchangeRuleSets Rule);

// Export UOnlineSubsystem::execExchange(FFrame&, void* const)
native function bool Exchange(const out ExchangeRuleSets Rule);

// Export UOnlineSubsystem::execExchangeDuplicates(FFrame&, void* const)
native function int ExchangeDuplicates(const out ExchangeRuleSets Rule);

delegate OnInventoryReadComplete();

function AddOnInventoryReadCompleteDelegate(delegate<OnInventoryReadComplete> ReadCompleteDelegate)
{
    if(ReadInventoryCompleteDelegates.Find(ReadCompleteDelegate == -1)
    {
        ReadInventoryCompleteDelegates.AddItem(ReadCompleteDelegate;
    }
}

function ClearOnInventoryReadCompleteDelegate(delegate<OnInventoryReadComplete> ReadCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = ReadInventoryCompleteDelegates.Find(ReadCompleteDelegate;
    if(RemoveIndex != -1)
    {
        ReadInventoryCompleteDelegates.Remove(RemoveIndex, 1;
    }
}

function ClearAllInventoryReadCompleteDelegates()
{
    local int I;

    I = 0;
    J0x0B:

    if(I < ReadInventoryCompleteDelegates.Length)
    {
        ReadInventoryCompleteDelegates.Remove(I, 1;
        ++ I;
        goto J0x0B;
    }
}

// Export UOnlineSubsystem::execInit(FFrame&, void* const)
native event bool Init();

event bool PostInit()
{
    local class<IniLocPatcher> IniLocPatcherClass;

    if(IniLocPatcherClassName != "")
    {
        LogInternal(("Loading " $ IniLocPatcherClassName) $ " for INI/Loc patching", 'DevMCP');
        IniLocPatcherClass = class<IniLocPatcher>(DynamicLoadObject(IniLocPatcherClassName, Class'Class'));
        Patcher = new IniLocPatcherClass;
        if(Patcher != none)
        {
            Patcher.Init();            
        }
        else
        {
            return false;
        }
    }
    return true;
}

event Exit();

event bool SetAccountInterface(Object NewInterface)
{
    AccountInterface = OnlineAccountInterface(NewInterface);
    return NotEqual_InterfaceInterface(AccountInterface, (none));
}

event bool SetPlayerInterface(Object NewInterface)
{
    PlayerInterface = OnlinePlayerInterface(NewInterface);
    return NotEqual_InterfaceInterface(PlayerInterface, (none));
}

event bool SetPlayerInterfaceEx(Object NewInterface)
{
    PlayerInterfaceEx = OnlinePlayerInterfaceEx(NewInterface);
    return NotEqual_InterfaceInterface(PlayerInterfaceEx, (none));
}

event bool SetSystemInterface(Object NewInterface)
{
    SystemInterface = OnlineSystemInterface(NewInterface);
    return NotEqual_InterfaceInterface(SystemInterface, (none));
}

event bool SetGameInterface(Object NewInterface)
{
    GameInterface = OnlineGameInterface(NewInterface);
    return NotEqual_InterfaceInterface(GameInterface, (none));
}

event bool SetContentInterface(Object NewInterface)
{
    ContentInterface = OnlineContentInterface(NewInterface);
    return NotEqual_InterfaceInterface(ContentInterface, (none));
}

event bool SetVoiceInterface(Object NewInterface)
{
    VoiceInterface = OnlineVoiceInterface(NewInterface);
    return NotEqual_InterfaceInterface(VoiceInterface, (none));
}

event bool SetStatsInterface(Object NewInterface)
{
    StatsInterface = OnlineStatsInterface(NewInterface);
    return NotEqual_InterfaceInterface(StatsInterface, (none));
}

event bool SetNewsInterface(Object NewInterface)
{
    NewsInterface = OnlineNewsInterface(NewInterface);
    return NotEqual_InterfaceInterface(NewsInterface, (none));
}

event bool SetPartyChatInterface(Object NewInterface)
{
    PartyChatInterface = OnlinePartyChatInterface(NewInterface);
    return NotEqual_InterfaceInterface(PartyChatInterface, (none));
}

event bool SetTitleFileInterface(Object NewInterface)
{
    TitleFileInterface = OnlineTitleFileInterface(NewInterface);
    return NotEqual_InterfaceInterface(TitleFileInterface, (none));
}

event bool SetTitleFileCacheInterface(Object NewInterface)
{
    TitleFileCacheInterface = OnlineTitleFileCacheInterface(NewInterface);
    return NotEqual_InterfaceInterface(TitleFileCacheInterface, (none));
}

event bool SetSocialInterface(Object InSocialInterface)
{
    SocialInterface = OnlineSocialInterface(InSocialInterface);
    return NotEqual_InterfaceInterface(SocialInterface, (none));
}

event bool SetAuthInterface(Object InAuthInterface)
{
    AuthInterface = OnlineAuthInterface(InAuthInterface);
    return NotEqual_InterfaceInterface(AuthInterface, (none));
}

event bool SetUserCloudInterface(Object InCloudInterface)
{
    UserCloudInterface = UserCloudFileInterface(InCloudInterface);
    return NotEqual_InterfaceInterface(UserCloudInterface, (none));
}

event bool SetSharedCloudInterface(Object InCloudInterface)
{
    SharedCloudInterface = SharedCloudFileInterface(InCloudInterface);
    return NotEqual_InterfaceInterface(SharedCloudInterface, (none));
}

event SetNamedInterface(name InterfaceName, Object NewInterface)
{
    local int InterfaceIndex;

    InterfaceIndex = NamedInterfaces.Find('InterfaceName', InterfaceName;
    if(InterfaceIndex == -1)
    {
        InterfaceIndex = NamedInterfaces.Length;
        NamedInterfaces.Length = NamedInterfaces.Length + 1;
        NamedInterfaces[InterfaceIndex].InterfaceName = InterfaceName;
    }
    NamedInterfaces[InterfaceIndex].InterfaceObject = NewInterface;
}

event Object GetNamedInterface(name InterfaceName)
{
    local int InterfaceIndex;

    InterfaceIndex = NamedInterfaces.Find('InterfaceName', InterfaceName;
    if(InterfaceIndex != -1)
    {
        return NamedInterfaces[InterfaceIndex].InterfaceObject;
    }
    return none;
}

// Export UOnlineSubsystem::execUniqueNetIdToString(FFrame&, void* const)
native static final function string UniqueNetIdToString(const out UniqueNetId IdToConvert);

// Export UOnlineSubsystem::execStringToUniqueNetId(FFrame&, void* const)
native static final function bool StringToUniqueNetId(string UniqueNetIdString, out UniqueNetId out_UniqueId);

// Export UOnlineSubsystem::execStringToUniqueNetIdDec(FFrame&, void* const)
native static final function bool StringToUniqueNetIdDec(string UniqueNetIdString, out UniqueNetId out_UniqueId);

event UniqueNetId GetPlayerUniqueNetIdFromIndex(int UserIndex)
{
    local UniqueNetId ReturnVal, NullId;

    if(EqualEqual_InterfaceInterface(PlayerInterface, (none)) || !PlayerInterface.GetUniquePlayerId(byte(UserIndex), ReturnVal))
    {
        ReturnVal = NullId;
    }
    return ReturnVal;
}

// Export UOnlineSubsystem::execGetBuildUniqueId(FFrame&, void* const)
native function int GetBuildUniqueId();

// Export UOnlineSubsystem::execGetNumSupportedLogins(FFrame&, void* const)
native static final function int GetNumSupportedLogins();

function bool IsInSession(name SessionName)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < Sessions.Length)
    {
        if(Sessions[I].SessionName == SessionName)
        {
            return true;
        }
        ++ I;
        goto J0x0B;
    }
    return false;
}

static function DumpGameSettings(const OnlineGameSettings GameSettings)
{
    LogInternal("    OnlineGameSettings: " $ string(GameSettings));
    LogInternal("      OwningPlayerName: " $ GameSettings.OwningPlayerName);
    LogInternal("      OwningPlayerId: " $ UniqueNetIdToString(GameSettings.OwningPlayerId));
    LogInternal("      PingInMs: " $ string(GameSettings.PingInMs));
    LogInternal("      NumPublicConnections: " $ string(GameSettings.NumPublicConnections));
    LogInternal("      NumOpenPublicConnections: " $ string(GameSettings.NumOpenPublicConnections));
    LogInternal("      NumPrivateConnections: " $ string(GameSettings.NumPrivateConnections));
    LogInternal("      NumOpenPrivateConnections: " $ string(GameSettings.NumOpenPrivateConnections));
    LogInternal("      bIsLanMatch: " $ string(GameSettings.bIsLanMatch));
    LogInternal("      bIsDedicated: " $ string(GameSettings.bIsDedicated));
    LogInternal("      bUsesStats: " $ string(GameSettings.bUsesStats));
    LogInternal("      bUsesArbitration: " $ string(GameSettings.bUsesArbitration));
    LogInternal("      bAntiCheatProtected: " $ string(GameSettings.bAntiCheatProtected));
    LogInternal("      bShouldAdvertise: " $ string(GameSettings.bShouldAdvertise));
    LogInternal("      bAllowJoinInProgress: " $ string(GameSettings.bAllowJoinInProgress));
    LogInternal("      bAllowInvites: " $ string(GameSettings.bAllowInvites));
    LogInternal("      bUsesPresence: " $ string(GameSettings.bUsesPresence));
    LogInternal("      bWasFromInvite: " $ string(GameSettings.bWasFromInvite));
    LogInternal("      bAllowJoinViaPresence: " $ string(GameSettings.bAllowJoinViaPresence));
    LogInternal("      bAllowJoinViaPresenceFriendsOnly: " $ string(GameSettings.bAllowJoinViaPresenceFriendsOnly));
    LogInternal("      GameState: " $ string(GameSettings.GameState));
}

function DumpSessionState()
{
    local int Index, PlayerIndex;
    local UniqueNetId NetId, ZeroId;

    NetId = ZeroId;
    ZeroId = NetId;
    LogInternal("Unreal online session state");
    LogInternal("-------------------------------------------------------------");
    LogInternal("");
    LogInternal("Number of sessions: " $ string(Sessions.Length));
    Index = 0;
    J0xBF:

    if(Index < Sessions.Length)
    {
        LogInternal("  Session: " $ string(Sessions[Index].SessionName));
        DumpGameSettings(Sessions[Index].GameSettings);
        LogInternal("");
        LogInternal("    Number of players: " $ string(Sessions[Index].Registrants.Length));
        PlayerIndex = 0;
        J0x198:

        if(PlayerIndex < Sessions[Index].Registrants.Length)
        {
            NetId = Sessions[Index].Registrants[PlayerIndex].PlayerNetId;
            LogInternal("      Player: " $ UniqueNetIdToString(NetId));
            ++ PlayerIndex;
            goto J0x198;
        }
        LogInternal("    Number of arbitrated players: " $ string(Sessions[Index].ArbitrationRegistrants.Length));
        PlayerIndex = 0;
        J0x2AD:

        if(PlayerIndex < Sessions[Index].ArbitrationRegistrants.Length)
        {
            NetId = Sessions[Index].ArbitrationRegistrants[PlayerIndex].PlayerNetId;
            LogInternal("      Player: " $ UniqueNetIdToString(NetId));
            ++ PlayerIndex;
            goto J0x2AD;
        }
        ++ Index;
        goto J0xBF;
    }
}

static function DumpNetIds(const out array<UniqueNetId> Players, string DebugLabel)
{
    local int PlayerIdx;
    local UniqueNetId NetId;

    PlayerIdx = 0;
    J0x0B:

    if(PlayerIdx < Players.Length)
    {
        NetId = Players[PlayerIdx];
        LogInternal(((((DebugLabel $ ": ") $ " PlayerIdx=") $ string(PlayerIdx)) $ " UniqueId=") $ UniqueNetIdToString(NetId));
        ++ PlayerIdx;
        goto J0x0B;
    }
}

function DumpVoiceRegistration();

function SetDebugSpewLevel(int DebugSpewLevel);

function TWOnlineLobby GetLobbyInterface();

function bool RegisterLocalTalker(byte LocalUserNum);

delegate OnReadOnlineAvatarComplete(const UniqueNetId PlayerNetId, Texture2D Avatar);

delegate OnReadOnlineAvatarByNameComplete(const string PlayerName, const string AvatarURL);

function ReadOnlineAvatar(const UniqueNetId PlayerNetId, int Size, delegate<OnReadOnlineAvatarComplete> ReadOnlineAvatarCompleteDelegate);

function ReadOnlineAvatarByName(const string InPlayerName, int Size, delegate<OnReadOnlineAvatarByNameComplete> ReadOnlineAvatarCompleteDelegate);

function bool ResetStats(bool bResetAchievements);

function bool IsFriend(byte LocalUserNum, UniqueNetId PlayerID);

function bool AddFriend(byte LocalUserNum, UniqueNetId NewFriend, optional string Message);

function bool RemoveFriend(byte LocalUserNum, UniqueNetId FormerFriend);

function ShowVoIPConfigUI();

function bool GetUniquePlayerId(byte LocalUserNum, out UniqueNetId PlayerID);

function bool Int64ToUniqueNetId(string UIDString, out UniqueNetId OutUID);

function string UniqueNetIdToInt64(const out UniqueNetId Uid);

function string UniqueNetIdToPlayerName(const out UniqueNetId Uid);

function OnlineSubsystem.ELoginStatus GetLoginStatus(byte LocalUserNum);

function OnlineSubsystem.ENATType GetNATType();

// Export UOnlineSubsystem::execGetUGCInterface(FFrame&, void* const)
native function TWOnlineUGCInterface GetUGCInterface();

// Export UOnlineSubsystem::execGetPlayerGroups(FFrame&, void* const)
native function GetPlayerGroups(out array<UniqueNetId> UserGroups);

// Export UOnlineSubsystem::execCheckPlayerGroup(FFrame&, void* const)
native function bool CheckPlayerGroup(UniqueNetId Group);

defaultproperties
{
    NamedInterfaceDefs(0)=(InterfaceName=RecentPlayersList,InterfaceClassName="Engine.OnlineRecentPlayersList")
}