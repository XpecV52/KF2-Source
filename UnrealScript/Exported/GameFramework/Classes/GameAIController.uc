/**
* Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
*/
class GameAIController extends AIController
	dependson(GameTypes)
	abstract
	native
	config(Game);


/** Current command stack, with the last element being the currently active (ticked) one */
var() editinline transient const GameAICommand CommandList;

/** Whether this AI has a runaway loop or not.  If it does we are going to do AbortCommand( CommandList ) at the end of Tick().  **/
var transient bool bHasRunawayCommandList;

/** Debug log file, @see: AILog */
var transient FileLog AILogFile;

var(Debug) config bool bAILogging;
var(Debug) config bool bAILogToWindow;
var(Debug) config bool bFlushAILogEachLine;
var(Debug) config bool bMapBasedLogName;
var(Debug) config bool bAIDrawDebug;
var	transient	  bool bAIBroken;

var(Debug) float DebugTextMaxLen;
var(Debug) transient const array<AICmdHistoryItem> CommandHistory;
var(Debug) config int CommandHistoryNum;

/** List of categories to filter */
var(Debug) config array<Name> AILogFilter;

// DEMO RECORDING PROPERTIES - for saving AI info into demos
var string DemoActionString;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)


replication
{
	if( bDemoRecording )
		DemoActionString;
}

/** returns all AI Commands in the CommandList that are of the specified class or a subclass
 * @note this function is only useful on the server
 * @param BaseClass the base class of GameAICommand to return
 * @param (out) Cmd the returned GameAICommand for each iteration
 */
native final iterator function AllCommands(class<GameAICommand> BaseClass, out GameAICommand Cmd);

/**
 * PushCommand
 * pushes a new AI command on top of the command stack
 * @param NewCommand - command to place on top of stack
 */
native function PushCommand(GameAICommand NewCommand);

/**
 * PopCommand
 * will pop the passed command (and everything above it in the stack)
 * @param ToBePoppedCommand - the command to pop
 */
native function PopCommand(GameAICommand ToBePoppedCommand);

/** AbortCommand
* Aborts a command (and all of its children)
* @param AbortCmd - the command to abort (can be NULL, in which case AbortClass will be used to determine which command to abort
* @param AbortClass - not used unless AbortCmd is NULL, in which case the first command int he stack of class 'AbortClass' will be aborted (and all its children)
*/
native function bool AbortCommand( GameAICommand AbortCmd, optional class<GameAICommand> AbortClass );

native final function GameAICommand GetActiveCommand();
/** checks the command stack for too many commands and/or infinite recursion */
native final function CheckCommandCount();
native final function DumpCommandStack();
/** finds and returns the lowest command of the specified class on the stack (will return subclasses of the specified class) */
native final function coerce GameAICommand FindCommandOfClass(class<GameAICommand> SearchClass) const;

/** This will search the CommandList for the passed in command class. **/
native function GameAICommand GetAICommandInStack( const class<GameAICommand> InClass );

/** return desired offset to move position... used for MoveTo/MoveToward */
function float GetDestinationOffset();

// called from movetogoal when we arrive at our destination
function ReachedMoveGoal();
function ReachedIntermediateMoveGoal();

/**
* =====
* DEBUG
* =====
*/

event Destroyed()
{
	Super.Destroyed();
	if (AILogFile != None)
	{
		AILogFile.Destroy();
	}

	// so this cases handles when AI has been destroyed.  We need to give a chance to the AICmds to handle that case
	if( Commandlist != None )
	{
		AbortCommand( CommandList );
	}
}

protected function RecordDemoAILog( coerce string LogText );



event AILog_Internal( coerce string LogText, optional Name LogCategory, optional bool bForce, optional bool BugIt, optional bool bSkipExtraInfo )



{
	
	local int Idx;
	local String ActionStr, FinalStr;
	local String FileName;
	local GameAICommand ActiveCommand;
	local int FileNameLength;
	local Engine Eng;
	Eng = class'Engine'.static.GetEngine();
	

	if( Eng.bDisableAILogging )
	{
		return;
	}
	if( !bForce &&
		!bAILogging )
	{
		return;
	}

	if (WorldInfo.IsConsoleBuild(CONSOLE_PS3))
	{
		return;
	}

	if( !bForce )
	{
		for( Idx = 0; Idx < AILogFilter.Length; Idx++ )
		{
			if( AILogFilter[Idx] == LogCategory )
			{
				return;
			}
		}
	}

	if (AILogFile == None)
	{
		AILogFile = Spawn(class'FileLog');
		if (bMapBasedLogName)
		{
			FileName = WorldInfo.GetMapName()$"_"$string(self);
			FileName = Repl(FileName,"ai_","",false);
		}
		else
		{
			FileName = string(self);
		}

		// for consoles we need to make certain the filename is short enough
		if( class'WorldInfo'.static.GetWorldInfo().IsConsoleBuild() == TRUE )
		{
			// Include the file extension in determining the length
			FileNameLength = Len(Filename) + 6;
			// make sure file name isn't too long for consoles
			if(FileNameLength > 40)
			{
				// Make sure there is room for the .ailog part too
				FileName = Right(Filename,34);
			}
		}

		AILogFile.bKillDuringLevelTransition = TRUE;
		AILogFile.bFlushEachWrite = bFlushAILogEachLine;
		// Use async unless flushing was requested
		AILogFile.bWantsAsyncWrites = !bFlushAILogEachLine;
		AILogFile.OpenLog(FileName,".ailog");
	}

	ActionStr = String(GetStateName());
	ActiveCommand = GetActiveCommand();
	if (ActiveCommand != None)
	{
		ActionStr = String(ActiveCommand.Class)$":"$String(ActiveCommand.GetStateName());
	}

	FinalStr = "["$WorldInfo.TimeSeconds$"]"@ActionStr$":"@LogText;
	AILogFile.Logf(FinalStr);

	if (WorldInfo.IsRecordingDemo())
	{
		RecordDemoAILog(FinalStr);
	}

	if (bAILogToWindow) LogInternal(Pawn@"["$WorldInfo.TimeSeconds$"]"@ActionStr$":"@LogText);
	
}

/** SetDesiredRotation
  * Calls Pawn's SetDesiredRotation: Simple interface to Pawn
  */
function SetDesiredRotation(Rotator TargetDesiredRotation, bool InLockDesiredRotation=FALSE, bool InUnlockWhenReached=FALSE, FLOAT InterpolationTime=-1.f/*Use Default RotationRate*/)
{
	if ( Pawn!=none )
	{
		Pawn.SetDesiredRotation(TargetDesiredRotation, InLockDesiredRotation, InUnlockWhenReached, InterpolationTime);
	}
}

/**
 * ===========
 * DEBUG STATES
 * ===========
 */
state DEBUGSTATE
{
	function BeginState( Name PreviousStateName )
	{
		//debug
		if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal("BEGINSTATE"@PreviousStateName,'State',);};
	}

	function EndState( Name NextStateName )
	{
		//debug
		if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal("ENDSTATE"@NextStateName,'State',);};
	}

	function PushedState()
	{
		//debug
		if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal("PUSHED",'State',);};
	}

	function PoppedState()
	{
		//debug
		if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal("POPPED",'State',);};
	}

	function ContinuedState()
	{
		//debug
		if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal("CONTINUED",'State',);};
	}

	function PausedState()
	{
		//debug
		if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal("PAUSED",'State',);};
	}
}


/** @return a String with the Cmd and the State that the AI is in. **/
simulated final event string GetActionString()
{
	local string ActionStr;
	local GameAICommand ActiveCmd;

	if( WorldInfo.IsPlayingDemo() )
	{
		return DemoActionString;
	}
	else
	{
		ActiveCmd = GetActiveCommand();
		if( ActiveCmd != None )
		{
			ActionStr = string(ActiveCmd.Class)$":"$string(ActiveCmd.GetStateName());
		}
		else
		{
			ActionStr = string(default.Class)$":"$string(GetStateName());
		}

		return ActionStr;
	}
}

defaultproperties
{
   CollisionType=COLLIDE_CustomDefault
   Name="Default__GameAIController"
   ObjectArchetype=AIController'Engine.Default__AIController'
}
