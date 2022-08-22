//=============================================================================
// KFGFxWidget_ButtonPrompt
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 11/17/2014
//=============================================================================

class KFGFxWidget_ButtonPrompt extends KFGFxObject_Menu;

var localized string CancelString;
var localized string ConfirmString;

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu(InManager);
	LocalizeWidget();
}

function LocalizeWidget()
{
	local GFxObject LocalizedObject;

	LocalizedObject = CreateObject("Object");

	LocalizedObject.SetString("cancel", CancelString);
	LocalizedObject.SetString("confirm", ConfirmString);
	LocalizedObject.SetString("reset",Localize("KFGFxOptionsMenu_Graphics","DefaultString","KFGame"));
	LocalizedObject.SetString("party", Localize("KFGFxWidget_BaseParty", "SquadString", "KFGame"));
	LocalizedObject.SetString("config", Localize("KFGFxPerksContainer_SkillsSummary", "ConfigureString", "KFGame"));


	SetObject("localizedText", LocalizedObject);
}

defaultproperties
{
   CancelString="BACK"
   ConfirmString="SELECT"
   Name="Default__KFGFxWidget_ButtonPrompt"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
