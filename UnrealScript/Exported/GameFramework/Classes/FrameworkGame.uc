/**
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class FrameworkGame extends GameInfo
	config(game)
	native;

struct native RequiredMobileInputConfig
{
	var config string GroupName;
	var config init array<string> RequireZoneNames;
	var config bool bIsAttractModeGroup;
};

/** Holds a list of MobileInputZones to load */
var config array<RequiredMobileInputConfig> RequiredMobileInputConfigs;

defaultproperties
{
   RequiredMobileInputConfigs(0)=(GroupName="DebugGroup",RequireZoneNames=("DebugStickMoveZone","DebugStickLookZone","DebugLookZone"))
   Name="Default__FrameworkGame"
   ObjectArchetype=GameInfo'Engine.Default__GameInfo'
}
