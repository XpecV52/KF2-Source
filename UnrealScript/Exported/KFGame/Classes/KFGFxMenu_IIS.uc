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

enum EConditionalState
{
	ECS_UnTested,
	ECS_Failed,
	ECS_AsyncWaiting,
	ECS_CompleteSuccess,
};

var transient EConditionalState eHasInternet;
var transient EConditionalState eSaveDataLoaded;
var transient EConditionalState eHasTSSUpdates;
var transient EConditionalState eHasPlayfabUser;
var transient EConditionalState eHasPILogin;		// has PlayerInterface Login
var transient EConditionalState AutoLoginState;

var transient int LoginAttemptNum;
var transient int LoginAttemptedLast;
var transient bool bLoginForInvite;

var localized string OnError_LeftButton;
var localized string ErrorNoInternetTitle;
var localized string ErrorNoInternetDescription;
var localized string ErrorNoSaveDataLoadTitle;
var localized string ErrorNoSaveDataLoadDescription;
var localized string ErrorTSSFailedTitle;
var localized string ErrorTSSFailedDescription;
var localized string ErrorNoPlayfabTitle;
var localized string ErrorNoPlayfabDescription;
var localized string ErrorNoPlaystationNetworkTitle;
var localized string ErrorNoPlaystationNetworkDescription;
var localized string ErrorNoPlaystationPlusTitle;
var localized string ErrorNoPlaystationPlusDescription;

event AttemptAutoLogin(bool inLoginForInvite = false)
{
	bLoginForInvite = inLoginForInvite;
	AutoLoginState = ECS_AsyncWaiting;
	LoginToGame();
}

native function bool IsRunning();

function OneSecondLoop()
{
	if(class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetLoginStatus(0) == LS_NotLoggedIn && ShouldAttemptAutoLogin())
	{
		AttemptAutoLogin();
	}
}

native function bool ShouldAttemptAutoLogin();

function OnOpen()
{
	SetString("loginText",Localize(string(self.Class.Name),"PressButtonToStart","KFGameConsole"));
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
	class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.ClearLoginStatusChangeDelegate(OnLoginStatusChange, 0);
	class'GameEngine'.static.GetOnlineSubsystem().ContentInterface.ClearQueryAvailableDownloadsComplete(0, OnQueryInitialContentComplete);
	class'GameEngine'.static.GetPlayfabInterface().ClearOnLoginCompleteDelegate(OnPlayfabLoginComplete);
	class'GameEngine'.static.GetPlayfabInterface().ClearStoreDataReadCompleteDelegate( OnPlayfabStoreReadComplete );
	class'GameEngine'.static.GetPlayfabInterface().ClearInventoryReadCompleteDelegate( OnPlayfabInventoryReadComplete );
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

function LoginLocal()
{
	local OnlineSubsystem OSS;

	OSS = class'GameEngine'.static.GetOnlineSubsystem();

	eHasInternet = ECS_CompleteSuccess;
	eHasTSSUpdates = ECS_CompleteSuccess;
	eHasPlayfabUser = ECS_CompleteSuccess;

	// TODO:  Add login stuff.  The following code changes the text to "Logging in..." and makes the loading movieclip play.
	SetString("loginText",Localize(string(self.Class.Name),"LoggingIn","KFGameConsole"));
	SetBool("showLoading", true);

	eHasPILogin = ECS_AsyncWaiting;
	OSS.PlayerInterface.AddLoginStatusChangeDelegate(OnLoginStatusChange, 0);
	OSS.PlayerInterface.Login(0, "E3 Demo Player", "", TRUE);

	eSaveDataLoaded = ECS_AsyncWaiting;
	OSS.ContentInterface.AddQueryAvailableDownloadsComplete(0, OnQueryInitialContentComplete);
	OSS.ContentInterface.QueryAvailableDownloads(0);
}


function LoginToGame()
{
	local OnlineSubsystem OSS;
	local PlayfabInterface playfab;
	local string cachedName, cachedPass;

	if(LoginAttemptedLast != LoginAttemptNum)
	{
		//This catches any duplicate calls to start login.
		return;
	}

	OSS = class'GameEngine'.static.GetOnlineSubsystem();

	LoginAttemptNum++;
	
	if(class'WorldInfo'.static.IsConsoleBuild() && class'WorldInfo'.static.IsE3Build())
	{
		LogInternal("("$Name$") KFGFxMenu_IIS::"$GetStateName()$":"$GetFuncName()@"Running Local login now!!! - Whoo E3");
		LoginLocal();
		return;
	}

	// TODO:  Add login stuff.  The following code changes the text to "Logging in..." and makes the loading movieclip play.
	SetString("loginText",Localize(string(self.Class.Name),"LoggingIn","KFGameConsole"));
	SetBool("showLoading", true);
	
	// Test PlayerInterface
	if(OSS.SystemInterface.HasLinkConnection())
	{
		eHasInternet = ECS_CompleteSuccess;
	}
	else
	{
		eHasInternet = ECS_Failed;
		OnLoginFailed();
		return;
	}

	cachedName = class'GameInfo'.default.DefaultPlayerName;
	cachedPass = "12345";

	//(const byte LocalUserNum, const out string LoginName, const out string Password,optional const bool bWantsLocalOnly = FALSE);
	if(eHasPILogin != ECS_CompleteSuccess && OSS.PlayerInterface.GetLoginStatus(0) == LS_NotLoggedIn)
	{
		LogInternal("("$Name$") KFGFxMenu_IIS::"$GetStateName()$":"$GetFuncName()@"WE are not logged in at start time");
		OSS.PlayerInterface.AddLoginStatusChangeDelegate(OnLoginStatusChange, 0);
		OSS.PlayerInterface.Login(0, cachedName, cachedPass);
		eHasPILogin = ECS_AsyncWaiting;
	}
	else if(eHasPlayfabUser != ECS_CompleteSuccess)
	{	
		playfab = class'GameEngine'.static.GetPlayfabInterface();
		if(playfab != none)
		{
			playfab.AddOnLoginCompleteDelegate(OnPlayfabLoginComplete);
			playfab.Login(OSS.PlayerInterface.GetPlayerNickname(0));
			eHasPlayfabUser = ECS_AsyncWaiting;
		}
	}

	if(eSaveDataLoaded != ECS_CompleteSuccess)
	{
		OSS.ContentInterface.AddQueryAvailableDownloadsComplete(0, OnQueryInitialContentComplete);
		OSS.ContentInterface.QueryAvailableDownloads(0);
		eSaveDataLoaded = ECS_AsyncWaiting;
	}

	// TODO - TSS implementaiton
	eHasTSSUpdates = ECS_CompleteSuccess;
}

function OnPlayfabLoginComplete(bool bWasSuccessful, string SessionTicket, string PlayfabId)
{
	LogInternal("("$Name$") KFGFxMenu_IIS::"$GetStateName()$":"$GetFuncName()@"bWasSuccessful:'"$bWasSuccessful$"'"@"SessionTicket:'"$SessionTicket$"'"@"PlayfabId:'"$PlayfabId$"'");

	class'GameEngine'.static.GetPlayfabInterface().ClearOnLoginCompleteDelegate(OnPlayfabLoginComplete);

	if( bWasSuccessful )
	{
		// Read Playfab store data
		class'GameEngine'.static.GetPlayfabInterface().AddStoreDataReadCompleteDelegate( OnPlayfabStoreReadComplete );
		class'GameEngine'.static.GetPlayfabInterface().ReadStoreData();
	}
	else
	{
		eHasPlayfabUser = ECS_Failed;
		OnLoginFailed();
	}
}


function OnPlayfabStoreReadComplete( bool bSuccessful )
{
	LogInternal("OnPlayfabStoreReadComplete"@bSuccessful);
	class'GameEngine'.static.GetPlayfabInterface().ClearStoreDataReadCompleteDelegate( OnPlayfabStoreReadComplete );

	if( bSuccessful )
	{
		// Read playfab inventory
		class'GameEngine'.static.GetPlayfabInterface().AddInventoryReadCompleteDelegate( OnPlayfabInventoryReadComplete );
		class'GameEngine'.static.GetPlayfabInterface().ReadInventory();
	}
	else
	{
		eHasPlayfabUser = ECS_Failed;
		OnLoginFailed();
	}
}


function OnPlayfabInventoryReadComplete( bool bSuccessful )
{
	LogInternal("OnPlayfabInventoryReadComplete"@bSuccessful);
	class'GameEngine'.static.GetPlayfabInterface().ClearInventoryReadCompleteDelegate( OnPlayfabInventoryReadComplete );

	if( bSuccessful )
	{
		// Read PSN store data
		class'GameEngine'.static.GetOnlineSubsystem().PlayerInterfaceEx.AddStoreDataReadCompleteDelegate( OnStoreDataRead );
		class'GameEngine'.static.GetOnlineSubsystem().PlayerInterfaceEx.ReadStoreData();
	}
	else
	{
		eHasPlayfabUser = ECS_Failed;
		OnLoginFailed();
	}
}


function OnStoreDataRead( bool bSuccessful )
{
	LogInternal("store data read"@bSuccessful);

	class'GameEngine'.static.GetOnlineSubsystem().PlayerInterfaceEx.ClearStoreDataReadCompleteDelegate( OnStoreDataRead );

	if( bSuccessful )
	{
		eHasPlayfabUser = ECS_CompleteSuccess;
		OnLoginToGameComplete();
	}
	else
	{
		eHasPlayfabUser = ECS_Failed;
		OnLoginFailed();
	}
}


function OnLoginStatusChange(ELoginStatus NewStatus,UniqueNetId NewId)
{
	local OnlineSubsystem OSS;
	OSS = class'GameEngine'.static.GetOnlineSubsystem();
	OSS.PlayerInterface.ClearLoginStatusChangeDelegate(OnLoginStatusChange, 0);

	LogInternal("("$Name$") KFGFxMenu_IIS::"$GetStateName()$":"$GetFuncName()@"NewStatus:'"$NewStatus$"'");

	if(NewStatus != LS_NotLoggedIn)
	{
		LogInternal("("$Name$") KFGFxMenu_IIS::"$GetStateName()$":"$GetFuncName()@"- Success -"@"NewStatus:'"$NewStatus$"'"@"eHasPlayfabUser:'"$eHasPlayfabUser$"'");
		eHasPILogin = ECS_CompleteSuccess;
		
		if(eHasPlayfabUser != ECS_CompleteSuccess)
		{
			eHasPlayfabUser = ECS_AsyncWaiting;
			LogInternal("("$Name$") KFGFxMenu_IIS::"$GetStateName()$":"$GetFuncName()@"PlayerInterface login success, assuming PSN login info set for playfab login"@OSS.PlayerInterface.GetPlayerNickname(0));

			class'GameEngine'.static.GetPlayfabInterface().AddOnLoginCompleteDelegate(OnPlayfabLoginComplete);
			class'GameEngine'.static.GetPlayfabInterface().Login(OSS.PlayerInterface.GetPlayerNickname(0));
		}
	}
	else
	{
		LogInternal("("$Name$") KFGFxMenu_IIS::"$GetStateName()$":"$GetFuncName()@"!!FAILED!!"@"NewStatus:'"$NewStatus$"'");
		eHasPILogin = ECS_Failed;
		OSS.PlayerInterface.ShowLoginUI(false);
	}

	OnLoginToGameComplete();
}

function OnQueryInitialContentComplete(bool bWasSuccess)
{
	local OnlineSubsystem OSS;

	OSS = class'GameEngine'.static.GetOnlineSubsystem();
	OSS.ContentInterface.ClearQueryAvailableDownloadsComplete(0, OnQueryInitialContentComplete);

	eSaveDataLoaded = bWasSuccess ? ECS_CompleteSuccess : ECS_Failed;
	OnLoginToGameComplete();
}

function OnLoginFailed()
{
	//Figure out how we failed and display the correct error
	LogInternal("("$Name$") KFGFxMenu_IIS::"$GetStateName()$":"$GetFuncName()@"LoginAttemptNum:'"$LoginAttemptNum$"'"@"LoginAttemptedLast:'"$LoginAttemptedLast$"'");

	AutoLoginState = ECS_Failed;

	OnOpen();

	if(Manager == none)
	{
		// Need to actually handle havning no manager to display popups with... but shouldn't ever happen
		LogInternal("("$Name$") KFGFxMenu_IIS::"$GetStateName()$":"$GetFuncName()@"There is no manager associated with this movie, how is that possible?");
		ScriptTrace();
	}
	else if(Manager.CurrentPopup != none)
	{
		LogInternal("("$Name$") KFGFxMenu_IIS::"$GetStateName()$":"$GetFuncName()@"There is already a movie playing at this time:"$"Manager.CurrentPopup:'"$Manager.CurrentPopup$"'");
		ScriptTrace();
	}

	// Default Case, took too long - onTimeout
	if(eHasInternet != ECS_CompleteSuccess)
	{
		Manager.OpenPopup(ENotification, ErrorNoInternetTitle, ErrorNoInternetDescription, OnError_LeftButton);
	}
	else if(eSaveDataLoaded == ECS_Failed)
	{
		Manager.OpenPopup(ENotification, ErrorNoSaveDataLoadTitle, ErrorNoSaveDataLoadDescription, OnError_LeftButton);
	}
	else if(eHasTSSUpdates == ECS_Failed)
	{
		Manager.OpenPopup(ENotification, ErrorTSSFailedTitle, ErrorTSSFailedDescription, OnError_LeftButton);
	}
	else if(eHasPlayfabUser == ECS_Failed)
	{
		Manager.OpenPopup(ENotification, ErrorNoPlayfabTitle, ErrorNoPlayfabDescription, OnError_LeftButton);
	}
	else if(eHasPILogin == ECS_Failed)
	{
		Manager.OpenPopup(ENotification, ErrorNoPlaystationNetworkTitle, ErrorNoPlaystationNetworkDescription, OnError_LeftButton);
		//Manager.OpenPopup(EConfirmation, ErrorNoPlaystationPlusTitle, ErrorNoPlaystationPlusDescription, OnError_LeftButton);
	}

	AutoLoginState = ECS_Failed;	
}

function OnLoginToGameComplete()
{
	local KFPlayerController PC;

	LogInternal("!!!!!"@"("$Name$") KFGFxMenu_IIS::"$GetStateName()$":"$GetFuncName()@"We have 'Finished' Logging in, proceed !!!!!");
	LogInternal("eHasInternet:'"$eHasInternet$"'"@"eHasPILogin:'"$eHasPILogin$"'"@"eSaveDataLoaded:'"$eSaveDataLoaded$"'"@"eHasTSSUpdates:'"$eHasTSSUpdates$"'"@"eHasPlayfabUser:'"$eHasPlayfabUser$"'");
	
	LoginAttemptedLast = LoginAttemptNum;
	PC = KFPlayerController(GetPC());

	if( eHasInternet == ECS_CompleteSuccess 
		&&	eHasPILogin == ECS_CompleteSuccess
		&& eSaveDataLoaded == ECS_CompleteSuccess
		&& eHasTSSUpdates == ECS_CompleteSuccess
		&& eHasPlayfabUser == ECS_CompleteSuccess
		)
	{
		AutoLoginState = ECS_CompleteSuccess;
		PC.ResetPerkStatsLoaded();
		PC.ClientInitializePerks();
		PC.ReceivedPlayer();

		// Refresh avatar
		if( PC.WorldInfo.IsConsoleBuild(CONSOLE_Orbis) &&
			!PC.WorldInfo.IsE3Build() )
		{
			PC.PlayerReplicationInfo.PlayerName = GetLP().GetNickname();
			PC.PlayerReplicationInfo.UniqueId = GetLP().GetUniqueNetId();
			PC.GetPS4Avatar( PC.PlayerReplicationInfo.PlayerName );
			if(bLoginForInvite)
			{
				PC.OnLoginForGameInviteComplete();
			}
		}
		
		Manager.PartyWidget.RefreshParty();
		
		if(!Manager.bSetGamma && !class'KFGameEngine'.static.CheckSkipGammaCheck())
		{
			Manager.OpenPopup(EGamma, "", Class'KFGFxOptionsMenu_Graphics'.default.AdjustGammaDescription, Class'KFGFxOptionsMenu_Graphics'.default.ResetGammaString, Class'KFGFxOptionsMenu_Graphics'.default.SetGammaString);
		}
		
		NativeLoginComplete();

		NowProgressToMenu();
	}
}

native function NativeLoginComplete();

function NowProgressToMenu()
{
	LogInternal("("$Name$") KFGFxMenu_IIS::"$GetStateName()$":"$GetFuncName());
	ScriptTrace();
	// For now just opening the start menu.
	Manager.OpenMenu( UI_Start );
}

defaultproperties
{
   Name="Default__KFGFxMenu_IIS"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
