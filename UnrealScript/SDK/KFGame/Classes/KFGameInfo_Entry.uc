//=============================================================================
// KFGameInfo_Entry
//=============================================================================
// The main menu's game info class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFGameInfo_Entry extends KFGameInfo;

var bool bInitialized;

function bool NeedPlayers()
{
	return false;
}

function Pawn SpawnDefaultPawnFor(Controller NewPlayer, NavigationPoint StartSpot) {}
function InitSpawnManager();
function InitTraderList();

function StartMatch()
{
	local PlayerController PC;
	local LocalPlayer LP;

	// To fix custom post processing effect not showing up in main menu
	foreach LocalPlayerControllers(class'PlayerController', PC)
	{
		LP = LocalPlayer(PC.Player);
		if(LP != None)
		{
			LP.RemoveAllPostProcessingChains();
			LP.InsertPostProcessingChain(LP.Outer.GetWorldPostProcessChain(),INDEX_NONE,true);
			if(PC.myHUD != None)
			{
				PC.myHUD.NotifyBindPostProcessEffects();
			}
		}
	}
}

function Tick( float DeltaTime )
{
	super.Tick(DeltaTime);	

    // Quick fix to get the music playing after the startup movies
	if( !bInitialized )
	{
		ForceMenuMusicTrack();
		bInitialized = true;
	}
}

// Parse options for this game...
event InitGame( string Options, out string ErrorMessage )
{
	if ( ParseOption( Options, "PerformUnitTests" ) ~= "1" )
	{
		if ( MyAutoTestManager == None )
		{
			MyAutoTestManager = spawn(AutoTestManagerClass);
		}
		MyAutoTestManager.InitializeOptions(Options);
	}

	BroadcastHandler = spawn(BroadcastHandlerClass);
}

auto State PendingMatch
{
	function RestartPlayer(Controller aPlayer)
	{
	}

	function Timer()
    {
    }

    function BeginState(Name PreviousStateName)
    {
		bWaitingToStartMatch = true;
    }

	function EndState(Name NextStateName)
	{
	}
}

exec function FinishCraft ()
{
	local KFPlayerController KFPC;
	`log("!!!!!!!!!!!!!!!!!!!!!!!!!");
	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		if(KFPC.MyGfxManager != none && KFPC.MyGFxManager.InventoryMenu != none)
		{
			KFPC.MyGFxManager.InventoryMenu.FinishCraft();
		}
	}
}

