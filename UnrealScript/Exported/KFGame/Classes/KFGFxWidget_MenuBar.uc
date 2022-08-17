//=============================================================================
// KFGFxWidget_MenuBar
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 1/10/2014
//=============================================================================

class KFGFxWidget_MenuBar extends KFGFxObject_Menu;

var localized array<string> MenuStrings;
var localized string ExitString;
var localized string CancelString;

var localized string ServerBrowserString;
var localized string MatchmakingString;
var localized string SoloString;
var localized string OverviewString;

var localized array<string> TitleStrings;
var localized array<string> DescriptionStrings;

var string LastHomeString;

function InitializeCurrentMenu(byte CurrentMenuIndex)
{
	UpdateMenu(CurrentMenuIndex);
}

function  UpdateMenu(byte CurrentMenuIndex)
{
	local GFxObject DataProvider;
	local GFxObject TempObj;
	local byte i;
	DataProvider = CreateArray();


	GetObject("menuButtonBar").GetObject("dataProvider");

	for (i = 0; i < MenuStrings.length; i++)
	{
		if ( i == MenuStrings.length -1 && class'WorldInfo'.static.IsMenuLevel() && class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis) )
		{
			// Console doesn't show exit game in the main menu.
			break;
		}
	    TempObj = CreateObject( "Object" );
	    
		
		HandleButtonSpecialCase(i, TempObj);



		DataProvider.SetElementObject(i, TempObj);
		
	}

	DataProvider.SetInt("selectedIndex", CurrentMenuIndex);
	SetObject("dataObject", DataProvider);
}

function HandleButtonSpecialCase(byte ButtonIndex, out GFxObject GfxButton)
{
	GfxButton.SetInt( "index", ButtonIndex );		
	GfxButton.SetString( "label", MenuStrings[ButtonIndex] );
	GfxButton.SetBool( "enabled", true );

	switch (ButtonIndex)
	{
		case UI_GEAR:
			// Disable the gear button if we're a spectator (must be done through data provider since buttons don't exist yet)	
			GfxButton.SetBool( "enabled", CanUseGearButton() );			
			break;
	
		case UI_Start:
			GfxButton.SetString( "label",  GetHomeButtonName());
			GfxButton.SetBool( "bPulsing", ShouldStartMenuPulse() );
			break;
		case UI_Inventory:
			GfxButton.SetBool( "enabled", CanUseGearButton() );
			break;		
	}
}


// Opens the "Are you sure you want to quit" Confirmation
function OpenQuitPopUp()
{
	local string TitleString, DescriptionString;
	TitleString         = TitleStrings[Rand(TitleStrings.length)];
    DescriptionString   = DescriptionStrings[Rand(DescriptionStrings.length)];
    if(Manager != none)
    {
        Manager.OpenPopup(EConfirmation, TitleString, DescriptionString, ExitString, Class'KFCommon_LocalizedStrings'.default.CancelString, OnQuitConfirm );
    }
}

//called from delegate for popups
function OnQuitConfirm()
{
	consolecommand("quit");
}

function string GetHomeButtonName()
{
	local byte StartMenuState;

	if(Manager != none && Manager.StartMenu != none)
	{
		if(Manager.CurrentMenuIndex == UI_ServerBrowserMenu)
		{
			LastHomeString = ServerBrowserString;
			return LastHomeString;
		}

		StartMenuState = Manager.StartMenu.GetStartMenuState();
		if( Manager.CurrentMenuIndex == UI_Start )
		{
			switch (StartMenuState)
			{
				case EMatchmaking:
					LastHomeString = MatchmakingString;
					break;
				case EServerBrowser:
					LastHomeString = ServerBrowserString;
					break;
				case ESoloGame:
					LastHomeString = SoloString;	
					break;	
				case EOverview:
				case EServerBrowserOverview:
					LastHomeString = OverviewString;	
					break;	
				Default:
					LastHomeString = MenuStrings[0];
			}
		}
	}
	return LastHomeString;
}

function bool ShouldStartMenuPulse()
{
	if(Manager != none &&
		class'WorldInfo'.static.IsMenuLevel())
	{
		return Manager.CurrentMenuIndex != UI_Start && OnlineLobby.IsInLobby();
	}
	return false;
}

function bool CanUseGearButton()
{
	if( GetPC().Pawn != none && !Manager.bAfterLobby ||
		class'WorldInfo'.static.IsMenuLevel() )
	{
		return true;
	}
	return false;
}

defaultproperties
{
   MenuStrings(0)="HOME"
   MenuStrings(1)="PERKS"
   MenuStrings(2)="GEAR"
   MenuStrings(3)="INVENTORY"
   MenuStrings(4)="STORE"
   MenuStrings(5)="OPTIONS"
   MenuStrings(6)="EXIT"
   ExitString="EXIT"
   CancelString="CANCEL"
   ServerBrowserString="SERVER BROWSER"
   MatchmakingString="MATCHMAKING"
   SoloString="SOLO"
   OverviewString="MATCH OVERVIEW"
   TitleStrings(0)="Abandoning the fight already?"
   TitleStrings(1)="Leaving so soon?"
   TitleStrings(2)="Tired of getting chewed on?"
   DescriptionStrings(0)="Fine, go on and run for your pathetic life. You wouldn't last five minutes on the Killing Floor."
   DescriptionStrings(1)="Each second you are away another horde of freaks is born to feast on your friends. Are you just going to abandon them?"
   DescriptionStrings(2)="They're going to find you either way. They'll find you and they'll eat your heart, like a fleshy little snack."
   Name="Default__KFGFxWidget_MenuBar"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
