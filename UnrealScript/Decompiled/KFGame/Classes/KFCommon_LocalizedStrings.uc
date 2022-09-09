/*******************************************************************************
 * KFCommon_LocalizedStrings generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFCommon_LocalizedStrings extends Object;

var const localized string PrestigeWarningString;
var const localized string PrestigeBonusString;
var const localized string FailedToReachInventoryServerString;
var const localized array<localized string> DifficultyStrings;
var const localized array<localized string> LengthStrings;
var const localized array<localized string> ServerTypeStrings;
var const localized array<localized string> PermissionStrings;
var const localized array<localized string> ConsolePermissionStrings;
var const localized array<localized string> ModeStrings;
var const localized string TeamSwappedString;
var const localized string NoPreferenceString;
var const localized string OKString;
var const localized string ConfirmString;
var const localized string CancelString;
var const localized string BackString;
var const localized string PerkUpdateNoticeString;
var const localized string NoticeString;
var const localized string AcceptString;
var const localized string DeclineString;
var const localized string BonusDoshString;
var const localized string YesString;
var const localized string NoString;
var const localized string DisbandPartyString;
var const localized string LeaveCurrentMenuString;
var const localized string StartOfflineGameString;
var const localized string StartOfflineGameDescriptionString;
var const localized string ZedString;
var const localized string HumanString;
var const localized string SpectatorString;
var const localized string UnableToSwitchTeamString;
var const localized string NoSwitchReasonString;
var const localized string TeamString;
var const localized string AllString;
var const localized string LoadingString;
var const localized string AutoTradeCompleteString;
var const localized string AutoFillCompleteString;
var const localized string WeaponUpgradeComepleteString;
var const localized string SecondaryWeaponPurchasedString;
var const localized string NoItemsPurchasedString;
var const localized string SetTakeoverServerPasswordTitle;
var const localized string FreeConsolePlayOverString;
var const localized string BuyGameString;
var const localized string CustomString;
var const localized string CancelConnectionString;
var const localized array<localized string> WeaponTypeStrings;
var const localized array<localized string> RarityStrings;
var const localized string MixerGaveAmmoString;
var const localized string MixerGaveArmorString;
var const localized string MixerGaveDoshString;
var const localized string MixerGaveGrenadeString;
var const localized string MixerGaveHealthString;
var const localized string MixerZedTimeString;
var const localized string MixerRageZedsString;
var const localized string MixerPukeString;
var const localized string MixerSpawnedFPString;
var const localized string MixerSpawnedScrakeString;
var const localized string MixerSpawnedMiniFPString;
var const localized string DiscordMenuPresenceString;
var const localized string DiscordPartyPresenceString;
var const localized string DiscordNetworkMatchString;
var const localized string DiscordSoloMatchString;
var const localized string DiscordMatchLobbyString;
var const localized string DiscordTraderTimeString;
var const localized string DiscordBossWaveString;
var const localized string DiscordWaveString;
var const localized string ProceedToTutorialString;
var const localized string ProceedToTutorialDescriptionString;
var const localized string NotAvailableInFreeTrialString;
var const localized string NetworkCheckFreeTrialFailedString;
var const localized string SpecialEffectsString;
var const localized string MicrophonePopupTitleString;
var const localized string MicrophonePopupSelectDeviceString;
var const localized string MicrophonePopupVolumeString;
var const localized string MicrophonePopupCheckString;
var const localized string MicrophonePopupStopString;
var const localized string MicrophonePopupRefreshString;
var const localized string FriendsListPopupTitleString;
var const localized string FriendsListPopupFriendString;
var const localized string FriendsListPopupFriendsString;
var const localized string FriendsListPopupOtherFriendsString;
var const localized string FriendsListPopupLinkButonString;
var const localized string ReturnString;
var const localized string InvitePopupTitleString;
var const localized string InvitePopupTextString;

static function array<string> GetDifficultyStringsArray()
{
    return default.DifficultyStrings;
}

static function string GetDifficultyString(float GameDifficulty)
{
    local byte DifficultyIndex;

    DifficultyIndex = Class'KFGameDifficultyInfo'.static.GetDifficultyIndex(GameDifficulty);
    if((0 < default.DifficultyStrings.Length) && DifficultyIndex < default.DifficultyStrings.Length)
    {
        return default.DifficultyStrings[DifficultyIndex];
    }
    return default.NoPreferenceString;
}

static function array<string> GetLengthStringsArray()
{
    return default.LengthStrings;
}

static function string GetLengthString(float LengthIndex)
{
    if((0 < default.LengthStrings.Length) && LengthIndex < float(default.LengthStrings.Length))
    {
        return default.LengthStrings[int(LengthIndex)];
    }
    return default.NoPreferenceString;
}

static function string GetServerTypeString(float ServerTypeIndex)
{
    if((0 < default.ServerTypeStrings.Length) && ServerTypeIndex < float(default.ServerTypeStrings.Length))
    {
        return default.ServerTypeStrings[int(ServerTypeIndex)];
    }
    return default.NoPreferenceString;
}

static function string GetPermissionString(float PermissionIndex)
{
    if((0 < default.PermissionStrings.Length) && PermissionIndex < float(default.PermissionStrings.Length))
    {
        return default.PermissionStrings[int(PermissionIndex)];
    }
    return default.NoPreferenceString;
}

static function array<string> GetPermissionStringsArray(bool bConsoleBuild)
{
    if(bConsoleBuild)
    {
        return default.ConsolePermissionStrings;        
    }
    else
    {
        return default.PermissionStrings;
    }
}

static function array<string> GetGameModeStringsArray()
{
    return default.ModeStrings;
}

static function string GetGameModeString(int GameModeIndex)
{
    if(GameModeIndex == -1)
    {
        return default.NoPreferenceString;
    }
    if((0 < default.ModeStrings.Length) && GameModeIndex < default.ModeStrings.Length)
    {
        return default.ModeStrings[GameModeIndex];
    }
    return default.NoPreferenceString;
}

static function string GetFriendlyMapName(string MapName)
{
    local KFMapSummary MapData;

    MapData = Class'KFUIDataStore_GameResource'.static.GetMapSummaryFromMapName(MapName);
    if((MapData != none) && MapData.DisplayName != "")
    {
        return MapData.DisplayName;        
    }
    else
    {
        return MapName;
    }
}

defaultproperties
{
    PrestigeWarningString="Reset Perk back to 0?  This cannot be undone."
    PrestigeBonusString="Prestige Bonus"
    FailedToReachInventoryServerString="Failed to reach item server.  Inventory will not be available."
    DifficultyStrings(0)="Normal"
    DifficultyStrings(1)="Hard"
    DifficultyStrings(2)="Suicidal"
    DifficultyStrings(3)="Hell on Earth"
    LengthStrings(0)="Short (4 Waves)"
    LengthStrings(1)="Medium (7 Waves)"
    LengthStrings(2)="Long (10 Waves)"
    ServerTypeStrings(0)="Ranked"
    ServerTypeStrings(1)="Ranked - Stock"
    ServerTypeStrings(2)="Ranked - Custom"
    ServerTypeStrings(3)="Unranked"
    PermissionStrings(0)="Public"
    PermissionStrings(1)="Private: Passworded"
    ConsolePermissionStrings(0)="Public"
    ConsolePermissionStrings(1)="Invite Only"
    ModeStrings(0)="Survival"
    ModeStrings(1)="Weekly"
    ModeStrings(2)="VS Survival"
    ModeStrings(3)="Endless"
    ModeStrings(4)="Objective"
    TeamSwappedString="You have been team swapped"
    NoPreferenceString="ANY"
    OKString="OK"
    ConfirmString="CONFIRM"
    CancelString="CANCEL"
    BackString="BACK"
    PerkUpdateNoticeString="Perk may be updated once per wave!"
    NoticeString="NOTICE!"
    AcceptString="Accept"
    DeclineString="Decline"
    BonusDoshString="REWARDS"
    YesString="YES"
    NoString="NO"
    DisbandPartyString="DISBAND PARTY"
    LeaveCurrentMenuString="Leave current menu?"
    StartOfflineGameString="Start Offline Game"
    StartOfflineGameDescriptionString="Starting an offline game will disband your party. 
Would you like to continue?"
    ZedString="ZED"
    HumanString="SURVIVOR"
    SpectatorString="SPECTATOR"
    UnableToSwitchTeamString="Unable to Switch Teams"
    NoSwitchReasonString="Switching teams would upset team balance"
    TeamString="TEAM"
    AllString="ALL"
    LoadingString="Loading..."
    AutoTradeCompleteString="Auto Trade Complete: "
    AutoFillCompleteString="Autofilled Supplies"
    WeaponUpgradeComepleteString="Weapon Upgraded"
    SecondaryWeaponPurchasedString="Secondary Weapon Purchased"
    NoItemsPurchasedString="No Items Purchased"
    SetTakeoverServerPasswordTitle="Enter a new password to protect your game:"
    FreeConsolePlayOverString="Thanks for playing Killing Floor 2! The free event is over, but you can purchase the game and get more information by selecting the Store button below."
    BuyGameString="STORE"
    CustomString="Custom"
    CancelConnectionString="Cancel Loading"
    WeaponTypeStrings(0)="PISTOL"
    WeaponTypeStrings(1)="SHOTGUN"
    WeaponTypeStrings(2)="RIFLE"
    WeaponTypeStrings(3)="PROJECTILE"
    WeaponTypeStrings(4)="FIRE"
    WeaponTypeStrings(5)="TECH"
    WeaponTypeStrings(6)="LAUNCHER"
    WeaponTypeStrings(7)="ASSAULT"
    WeaponTypeStrings(8)="MELEE"
    WeaponTypeStrings(9)="SMG"
    WeaponTypeStrings(10)="ALL"
    RarityStrings(0)="COMMON"
    RarityStrings(1)="UNCOMMON"
    RarityStrings(2)="RARE"
    RarityStrings(3)="EXCEPTIONAL"
    RarityStrings(4)="MASTERCRAFTED"
    RarityStrings(5)="EXCEEDINGLYRARE"
    RarityStrings(6)="ANY"
    MixerGaveAmmoString=", a Mixer viewer, has given you ammo"
    MixerGaveArmorString=", a Mixer viewer, has given you armor"
    MixerGaveDoshString=", a Mixer viewer, has given you Dosh"
    MixerGaveGrenadeString=", a Mixer viewer, has given you a grenade"
    MixerGaveHealthString=", a Mixer viewer, has healed you"
    MixerZedTimeString=", a Mixer viewer, has actived ZedTime"
    MixerRageZedsString=", a Mixer viewer, has enraged nearby Zeds!"
    MixerPukeString=", a Mixer viewer, has puked on you!"
    MixerSpawnedFPString=", a Mixer viewer, has spawned a Fleshpound!"
    MixerSpawnedScrakeString=", a Mixer viewer, has spawned a Scrake!"
    MixerSpawnedMiniFPString=", a Mixer viewer, has spawned some Quarter Pounds!"
    DiscordMenuPresenceString="In Main Menu"
    DiscordPartyPresenceString="Forming Party"
    DiscordNetworkMatchString="Network Match"
    DiscordSoloMatchString="Solo Match"
    DiscordMatchLobbyString=": Match Lobby"
    DiscordTraderTimeString=": Trader Time"
    DiscordBossWaveString=": Boss Wave"
    DiscordWaveString=": Wave "
    ProceedToTutorialString="PROCEED TO TRAINING?"
    ProceedToTutorialDescriptionString="Go to a controlled environment to learn the basics.  Grants selected level 0 perk to level 1 once completed."
    NotAvailableInFreeTrialString="Feature Not Available for Free Trial"
    NetworkCheckFreeTrialFailedString="Network Error: Free Event Status Unable to be Verified. Check Network Connection Status"
    SpecialEffectsString="Special Effects"
    MicrophonePopupTitleString="Configure your microphone"
    MicrophonePopupSelectDeviceString="Select device"
    MicrophonePopupVolumeString="Mic volume"
    MicrophonePopupCheckString="Check mic"
    MicrophonePopupStopString="Stop"
    MicrophonePopupRefreshString="Refresh"
    FriendsListPopupTitleString="Choose Friends to invite"
    FriendsListPopupFriendString="Search"
    FriendsListPopupFriendsString="Friends"
    FriendsListPopupOtherFriendsString="Friends from other platforms"
    FriendsListPopupLinkButonString="Link Account"
    ReturnString="RETURN"
    InvitePopupTitleString="Lobby Invitation"
    InvitePopupTextString=" has invited you to a lobby"
}