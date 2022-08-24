/*******************************************************************************
 * KFMission_LocalizedStrings generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFMission_LocalizedStrings extends Object
    native(UI);

var const localized string GrantedWeeklyString;
var const localized string WeeklyString;
var const localized string CurrentWeeklySettingsString;
var const localized string SpecialEventString;
var const localized string SpecialEventChanceDropString;
var const localized string GrantedSpecialEventString;
var const localized string DailyObjectiveString;
var const localized string RewardsString;
var const localized string RewardString;
var const localized string WeeklyOverview;
var const localized string ShortWeeklyString;
var const localized string ObjectivesString;
var const localized string SeasonalString;
var const localized string DealDamageString;
var const localized string EarnXPString;
var const localized string KillBossString;
var const localized string KillBossDescriptionString;
var const localized string CompleteMapString;
var const localized string KillZedsString;
var const localized string DealVersusDamageString;
var const localized string VersusKillsString;
var const localized string VersusCompletionString;
var const localized string VaultDoshString;
var private native const transient Map_Mirror WeeklyOutbreakInfo;

// Export UKFMission_LocalizedStrings::execGetCurrentWeeklyOutbreakInfo(FFrame&, void* const)
native static function KFWeeklyOutbreakInformation GetCurrentWeeklyOutbreakInfo();

// Export UKFMission_LocalizedStrings::execGetWeeklyOutbreakInfoByIndex(FFrame&, void* const)
native static function KFWeeklyOutbreakInformation GetWeeklyOutbreakInfoByIndex(int Index);

static function string GetCurrentSpecialEventString()
{
    return default.SpecialEventString;
}

defaultproperties
{
    GrantedWeeklyString="OUTBREAK COMPLETION REWARD"
    WeeklyString="HORZINE WEEKLY OUTBREAK"
    CurrentWeeklySettingsString="CURRENT OUTBREAK SETTINGS"
    SpecialEventString="SUMMER SIDESHOW"
    SpecialEventChanceDropString="LIMITED DROP ITEMS"
    GrantedSpecialEventString="COMPLETION REWARD"
    DailyObjectiveString="DAILY"
    RewardsString="OUTBREAK COMPLETION REWARD"
    RewardString="REWARD"
    WeeklyOverview="A new challenging game mode each week!"
    ShortWeeklyString="WEEKLY"
    ObjectivesString="Toggle Objectives"
    SeasonalString="SEASONAL"
    DealDamageString="Deal Damage:"
    EarnXPString="Earn XP:"
    KillBossString="Kill Boss:"
    CompleteMapString="Complete Match in Map:"
    KillZedsString="Kill Zeds:"
    DealVersusDamageString="Damage Versus Players as:"
    VersusKillsString="Kill Versus Players as:"
    VersusCompletionString="Complete Match as:"
    VaultDoshString="Vault Dosh"
}