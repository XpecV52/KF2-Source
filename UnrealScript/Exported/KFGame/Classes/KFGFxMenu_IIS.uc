//=============================================================================
// KFGFxMenu_IIS
//=============================================================================
// The Initial Interaction Screen displayed on Console.
//=============================================================================
//	Killing Floor 2
//  Bryan Brooks -  04/15/2016
//=============================================================================

class KFGFxMenu_IIS extends KFGFxObject_Menu
	native(UI)
	config(UI);

var delegate<OnAutoLoginComplete> AutoLoginCompleteDelegate;

/** TRUE if we are actively logging in */
var bool bLoggingIn;

var OnlineSubsystem OnlineSub;
var PlayfabInterface PlayfabInter;

/** TRUE if we need to force having a connection at login */
var bool bForceConnectionAtLogin;

delegate OnAutoLoginComplete();

event AttemptAutoLogin(delegate<OnAutoLoginComplete> del = none)
{
	AutoLoginCompleteDelegate = del;
	LoginToGame();
}


function OnOpen()
{
	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
	PlayfabInter = class'GameEngine'.static.GetPlayfabInterface();

	SetString("loginText", ConsoleLocalize( "PressButtonToStart" ) );
	SetBool("showLoading", false);
}

event OnClose()
{
	local KFGameViewportClient GVC;

	// Closing this menu.  Let the Game Viewport know that we've been here since it is persistent.
	GVC = KFGameViewportClient(GetGameViewportClient());
	if ( GVC != None )
	{
		GVC.bSeenIIS = true;
	}

	UnRegisterDelegates();
}


function UnRegisterDelegates()
{
}


event bool FilterButtonInput(int ControllerId, name ButtonName, EInputEvent InputEvent)
{
	if( ButtonName == 'XboxTypeS_A' && InputEvent == IE_Pressed && Manager != None && Manager.CurrentPopup == None )
	{
		// Uncomment to change visuals to the loading screen.
		LoginToGame();
		return true;
	}

	return false;
}


function LoginToGame()
{
	if(class'WorldInfo'.static.IsConsoleBuild() && class'WorldInfo'.static.IsE3Build())
	{
		OnlineSub.PlayerInterface.Login(0, "E3 Demo Player", "", TRUE);
	}

	if( bLoggingIn )
	{
		WarnInternal("Ignoring login while one is already occurring");
		return;
	}
	bLoggingIn = true;

	SetString("loginText", ConsoleLocalize( "LoggingIn") );
	SetBool("showLoading", true);

	KFPlayerController(GetPC()).StartLogin( OnLoginToGameComplete, AutoLoginCompleteDelegate != none );
}


function OnLoginToGameComplete()
{
	local KFPlayerController PC;

	PC = KFPlayerController(GetPC());

	PC.ResetPerkStatsLoaded();
	PC.ClientInitializePerks();
	
	Manager.PartyWidget.RefreshParty();
	
	// For now just opening the start menu.
	Manager.OpenMenu( UI_Start );
	bLoggingIn = false;

	if( AutoLoginCompleteDelegate != none )
	{
		AutoLoginCompleteDelegate();
		AutoLoginCompleteDelegate = none;
	}
}


function NotifyLoginFailed()
{
	// Reset login status when this occurs
	bLoggingIn = false;
	SetBool("showLoading", false);
}

defaultproperties
{
   Name="Default__KFGFxMenu_IIS"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
