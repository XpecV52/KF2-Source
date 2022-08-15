//=============================================================================
// KFGFxWidget_MusicNotification
//=============================================================================
// This element will display the track title and artist name of the current 
// music on music change
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 11/10/2014
//=============================================================================

class KFGFxWidget_MusicNotification extends GFxObject;

function InitializeHUD()
{
    
}

function ShowSongInfo(string SongInfoString)
{
    SetString("text", SongInfoString);
}

defaultproperties
{
   Name="Default__KFGFxWidget_MusicNotification"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
