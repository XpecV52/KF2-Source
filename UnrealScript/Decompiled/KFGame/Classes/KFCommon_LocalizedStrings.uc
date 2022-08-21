/*******************************************************************************
 * KFCommon_LocalizedStrings generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFCommon_LocalizedStrings extends Object;

var const localized array<localized string> DifficultyStrings;
var const localized array<localized string> LengthStrings;
var const localized array<localized string> ServerTypeStrings;
var const localized array<localized string> PermissionStrings;
var const localized array<localized string> ModeStrings;
var const localized string NoPreferenceString;
var const localized string OKString;
var const localized string ConfirmString;
var const localized string CancelString;
var const localized string BackString;
var const localized string PerkUpdateNoticeString;
var const localized string NoticeString;
var const localized string AcceptString;
var const localized string DeclineString;
var const localized string YesString;
var const localized string NoString;
var const localized string DisbandPartyString;
var const localized string LeaveCurrentMenuString;
var const localized string ZedString;
var const localized string HumanString;
var const localized string SpectatorString;
var const localized string UnableToSwitchTeamString;
var const localized string NoSwitchReasonString;
var const localized string TeamString;
var const localized string AllString;

static function array<string> GetDifficultyStringsArray()
{
    return default.DifficultyStrings;
}

static function string GetDifficultyString(float GameDifficulty)
{
    local byte DifficultyIndex;

    DifficultyIndex = Class'KFDifficultyInfo'.static.GetDifficultyIndex(GameDifficulty);
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

static function array<string> GetPermissionStringsArray()
{
    return default.PermissionStrings;
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

defaultproperties
{
    DifficultyStrings(0)="Normal"
    DifficultyStrings(1)="Hard"
    DifficultyStrings(2)="Suicidal"
    DifficultyStrings(3)="Hell on Earth"
    LengthStrings(0)="Short (4 Waves)"
    LengthStrings(1)="Medium (7 Waves)"
    LengthStrings(2)="Long (10 Waves)"
    ServerTypeStrings(0)="Ranked"
    ServerTypeStrings(1)="Ranked - Custom"
    ServerTypeStrings(2)="Unranked"
    PermissionStrings(0)="Public"
    PermissionStrings(1)="Friends only"
    PermissionStrings(2)="Private"
    ModeStrings(0)="Survival"
    ModeStrings(1)="VS Survival"
    NoPreferenceString="ANY"
    OKString="OK"
    ConfirmString="CONFIRM"
    CancelString="CANCEL"
    BackString="BACK"
    PerkUpdateNoticeString="Perk may be updated once per wave!"
    NoticeString="NOTICE!"
    AcceptString="Accept"
    DeclineString="Decline"
    YesString="Yes"
    NoString="No"
    DisbandPartyString="DISBAND PARTY"
    LeaveCurrentMenuString="Leave current menu?"
    ZedString="ZED"
    HumanString="SURVIVOR"
    SpectatorString="SPECTATOR"
    UnableToSwitchTeamString="Unable to Switch Teams"
    NoSwitchReasonString="Switching teams would upset team balance"
    TeamString="TEAM"
    AllString="ALL"
}