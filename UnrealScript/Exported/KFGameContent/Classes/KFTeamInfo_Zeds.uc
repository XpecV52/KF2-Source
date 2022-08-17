//=============================================================================
// KFTeamInfo_Zeds
//=============================================================================
// KFTeamInfo_Zeds
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Zane Gholson
//=============================================================================
class KFTeamInfo_Zeds extends KFTeamInfo_Human;

simulated function string GetHumanReadableName()
{
    // Temp team name hax - Ramm
    return "Zed"@TeamName;
}

defaultproperties
{
   TeamIndex=255
   Name="Default__KFTeamInfo_Zeds"
   ObjectArchetype=KFTeamInfo_Human'KFGame.Default__KFTeamInfo_Human'
}
