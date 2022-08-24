//=============================================================================
// KFMission_LocalizedStrings
//=============================================================================
// This class is made to hold common references to localized string for Missions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 3/28/2017
//=============================================================================

class KFMission_LocalizedStrings extends Object
    native(UI);

var localized string GrantedWeeklyString;
var localized string WeeklyString;
var localized string CurrentWeeklySettingsString;

var localized string SpecialEventString;
var localized string SpecialEventChanceDropString;
var localized string GrantedSpecialEventString;

var localized string RewardsString;

var localized string WeeklyOverview;
var localized string ShortWeeklyString;
var localized string ObjectivesString;
var localized string SeasonalString;


var	const private native transient Map_Mirror WeeklyOutbreakInfo{TMultiMap<INT,class UKFWeeklyOutbreakInformation*>};

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native static function KFWeeklyOutbreakInformation GetCurrentWeeklyOutbreakInfo();
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
   SpecialEventString="SUMMER SIDE SHOW"
   SpecialEventChanceDropString="LIMITED DROP ITEMS"
   GrantedSpecialEventString="COMPLETION REWARD"
   RewardsString="OUTBREAK COMPLETION REWARD"
   WeeklyOverview="A new challenging game mode each week!"
   ShortWeeklyString="WEEKLY"
   ObjectivesString="Toggle Objectives"
   SeasonalString="SEASONAL"
   Name="Default__KFMission_LocalizedStrings"
   ObjectArchetype=Object'Core.Default__Object'
}
