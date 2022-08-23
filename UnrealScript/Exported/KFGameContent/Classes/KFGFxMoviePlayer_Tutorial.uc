//=============================================================================
// KFGFxMoviePlayer_Tutorial
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 4/21/2016
//=============================================================================

class KFGFxMoviePlayer_Tutorial extends GFxMoviePlayer;

var name SoundThemeName;
var KFGFxTutorialContainer TutorialContainer;
var Array<STutorialSlide> TargetTutorialArray;
var KFGameInfo_Tutorial KFGI;
var KFTutorialSectionInfo TutorialSectionInfo;

var bool bUsingGamepad;
var GFxObject ManagerObject;

function Init(optional LocalPlayer LocPlay)
{
	super.Init(LocPlay);
	KFGI = KFGameInfo_Tutorial(GetPC().WorldInfo.Game);
}


/** Ties the GFxClikWidget variables to the .swf components and handles events */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
	local bool bHandled;

	bHandled = true;

	switch ( WidgetName )
	{
		case ( 'root1' ):
			if ( ManagerObject == none )
			{
				ManagerObject = Widget;
				// Let the menuManager know if we are on console.
				if ( class'WorldInfo'.static.IsConsoleBuild() )
				{
					ManagerObject.SetBool("bUsingGamepad", true);
				}
			}
		break;
		case ( 'tutorialPopup' ):
			if ( TutorialContainer == none )
			{
				TutorialContainer = KFGFxTutorialContainer(Widget);
				TutorialContainer.InitMenu();
				if(TargetTutorialArray.length > 0)
				{
					TutorialContainer.SetPopUpData(TargetTutorialArray);
				}
			}
		break;
		default:
			bHandled = false;
	}

	return bHandled;
}


/* This is only used for the controller to switch between different components in the trader menu
 and open / close the perk selector */
event bool FilterButtonInput(int ControllerId, name ButtonName, EInputEvent InputEvent)
{
	if ( !class'WorldInfo'.static.IsConsoleBuild() )
	{
		CheckIfUsingGamepad();
	}

 	return false;
}

// Checks if our form of input has changed
function CheckIfUsingGamepad()
{
	local bool bGamepad;
	
    bGamepad = GetUsingGamepad();
	if ( bUsingGamepad != bGamepad )
	{
		OnInputTypeChanged(bGamepad);
	}
}

function OnInputTypeChanged(bool bGamePad)
{
	bUsingGamepad = bGamepad;
	if(ManagerObject != none)
	{
		ManagerObject.SetBool("bUsingGamepad", bGamePad);
	}	
}

/** Return whether the player input says we are currently using the gamepad */
function bool GetUsingGamepad()
{
	local PlayerController PC;
	PC = GetPC();

	if( class'WorldInfo'.static.IsConsoleBuild() )
	{
		return true;
	}

    if ( PC == none || PC.PlayerInput == none )
	{
		return false;
	}
	// Always using the gamepad if we are on console.
    return PC.PlayerInput.bUsingGamepad;
}

function Callback_Done()
{
	if(KFGI != none)
	{
		KFGI.RemoveTutorialHud();
	}
}

function Callback_Skip()
{
	if(KFGI != none)
	{
		KFGI.RemoveTutorialHud();
	}
}

defaultproperties
{
   SoundThemeName="ButtonSoundTheme"
   MovieInfo=SwfMovie'UI_Tutorial.TutorialManager_SWF'
   bAutoPlay=True
   bCaptureInput=True
   bCaptureMouseInput=True
   CaptureKeys(0)="XboxTypeS_A"
   CaptureKeys(1)="XboxTypeS_B"
   CaptureKeys(2)="XboxTypeS_DPad_Left"
   CaptureKeys(3)="XboxTypeS_DPad_Right"
   CaptureKeys(4)="XboxTypeS_LeftTrigger"
   CaptureKeys(5)="XboxTypeS_RightTrigger"
   SoundThemes(0)=(ThemeName="ButtonSoundTheme",Theme=UISoundTheme'SoundsShared_UI.SoundTheme_Buttons')
   SoundThemes(1)=(ThemeName="UI",Theme=UISoundTheme'SoundsShared_UI.SoundTheme_UI')
   WidgetBindings(0)=(WidgetName="tutorialPopup",WidgetClass=Class'kfgamecontent.KFGFxTutorialContainer')
   Name="Default__KFGFxMoviePlayer_Tutorial"
   ObjectArchetype=GFxMoviePlayer'GFxUI.Default__GFxMoviePlayer'
}
