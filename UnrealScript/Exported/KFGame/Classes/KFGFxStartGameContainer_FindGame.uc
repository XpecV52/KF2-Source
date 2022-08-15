//=============================================================================
// KFGFxStartGameContainer_FindGame
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 1/27/2015
//=============================================================================

class KFGFxStartGameContainer_FindGame extends KFGFxObject_Container;

var KFGFxMenu_StartGame StartMenu;

var localized string MultiplayerString;
var localized string SoloString;


//==============================================================
// Initialization
//==============================================================
function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );
	StartMenu = KFGFxMenu_StartGame( NewParentMenu );
	LocalizeMenu();
}

function LocalizeMenu()
{
	local GFxObject TextObject;
	TextObject = CreateObject("Object");
	// Localize static text
	TextObject.SetString("home",StartMenu.FindGameString);	
	TextObject.SetString("multiplayer",MultiplayerString);	
	TextObject.SetString("serverBrowser",StartMenu.ServerBrowserString);	
 	TextObject.SetString("solo",SoloString);	
	SetObject("localizedText", TextObject);
}

defaultproperties
{
   MultiplayerString="Online Matchmaking"
   SoloString="Play Solo Offline"
   Name="Default__KFGFxStartGameContainer_FindGame"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
