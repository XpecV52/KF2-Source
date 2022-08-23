//=============================================================================
// KFGFxTutorialContainer
//=============================================================================
// This is the UC representation for the GFxObject in the Tutorial Movie Player
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//  - Zane Gholson 2/24/2017
//=============================================================================

class KFGFxScreenSizeContainer extends KFGFxObject_Menu;

var localized string TitleString;
var localized string DescriptionString;
var localized string EnlargeString;
var localized string ShrinkString;

var KFPlayerInput KFPI;

function InitMenu( )
{
	KFPI = KFPlayerInput(GetPC().PlayerInput);
	LocalizeText();
	if(GetPC().WorldInfo.IsConsoleBuild())
	{
		UpdateUsingGamePad(true);
	}
	else if(KFPI != none)
	{
		UpdateUsingGamePad(KFPI.bUsingGamepad);
	}
	LocalizeText();
}

function UpdateUsingGamePad(bool bValue)
{
	SetBool("bUsingGamepad", bValue);
}

function LocalizeText()
{
	local GFxObject LocalizedObject;

	LocalizedObject = CreateObject( "Object" );
	
	LocalizedObject.SetString("title",			TitleString);
	LocalizedObject.SetString("description", 	DescriptionString);
	LocalizedObject.SetString("enlarge", 		EnlargeString);
	LocalizedObject.SetString("shrink", 		ShrinkString);
	LocalizedObject.SetString("confirm", 		class'KFCommon_LocalizedStrings'.default.ConfirmString);
	LocalizedObject.SetString("cancel", 		class'KFCommon_LocalizedStrings'.default.CancelString);

	SetObject("localizedText", LocalizedObject);
}

defaultproperties
{
   TitleString="Application will be displayed in the boxed area"
   DescriptionString="Adjust the area to fit the TV display"
   EnlargeString="Enlarge"
   ShrinkString="Shrink"
   Name="Default__KFGFxScreenSizeContainer"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
