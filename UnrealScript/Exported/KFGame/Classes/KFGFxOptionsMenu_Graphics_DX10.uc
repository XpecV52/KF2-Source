//=============================================================================
// KFGFxOptionsMenu_Graphics_DX10
//=============================================================================
// Graphics menu with DX11 only features hidden
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 1/30/2015
//=============================================================================

class KFGFxOptionsMenu_Graphics_DX10 extends KFGFxOptionsMenu_Graphics;

var localized array<string> AmbientOcclusionStringOptions_DX10;

// Overridden to remove HBAO+ option
function SetAmbientOcclusionOptions(out GFxObject LocalizedObject)
{
	LocalizedObject.SetObject("ambientOcclusionOptions", MakeDataProvider(AmbientOcclusionStringOptions_DX10));
}

defaultproperties
{
   AmbientOcclusionStringOptions_DX10(0)="Off"
   AmbientOcclusionStringOptions_DX10(1)="SSAO"
   Name="Default__KFGFxOptionsMenu_Graphics_DX10"
   ObjectArchetype=KFGFxOptionsMenu_Graphics'KFGame.Default__KFGFxOptionsMenu_Graphics'
}
