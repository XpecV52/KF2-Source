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
var int LastSystemTimeMinutes;

static function PreloadContentClasses();

function bool NeedPlayers();
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

	// Refresh online game data when returning to main menu
	// Leaving main menu, aka GameEnded(), happening too late
	if ( HasOption( Options, "Closed" ) )
	{
		class'KFGameEngine'.static.RefreshOnlineGameData();
	}

	LastSystemTimeMinutes = GetSystemTimeMinutes();
	BroadcastHandler = spawn(BroadcastHandlerClass);
}

/** 
 * Helper for periodic online game data update
 * note: Not 100% precise, because we don't bother with days rolling into months
 */
private function int GetSystemTimeMinutes()
{
	local int year,month,dayofweek,day,hour,minute,second,msec;
	GetSystemTime(year,month,dayofweek,day,hour,minute,second,msec);
	return minute + (hour * 60) + (day * 60 * 24);
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

exec function FinishCraft ()
{
	local KFPlayerController KFPC;
	
	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		if(KFPC.MyGfxManager != none && KFPC.MyGFxManager.InventoryMenu != none)
		{
			KFPC.MyGFxManager.InventoryMenu.FinishCraft();
		}
	}
}

auto State PendingMatch
{
	function RestartPlayer(Controller aPlayer)
	{
	}

	function Timer()
    {
   		local int SystemTimeMinutes;

		// Update every 30 minutes using system clock for suspend mode.
		// Originally tried using GameEnding(), but the TitleData response
		// doesn't come back in time for the new map.
		SystemTimeMinutes = GetSystemTimeMinutes();
		if ( (SystemTimeMinutes - LastSystemTimeMinutes) >= 30 )
		{
			class'KFGameEngine'.static.RefreshOnlineGameData();
			LastSystemTimeMinutes = SystemTimeMinutes;
		}
    }

    function BeginState(Name PreviousStateName)
    {
		bWaitingToStartMatch = true;
    }

	function EndState(Name NextStateName)
	{
	}
}