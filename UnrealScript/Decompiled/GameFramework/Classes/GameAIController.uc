/*******************************************************************************
 * GameAIController generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GameAIController extends AIController
    abstract
    native
    config(Game)
    hidecategories(Navigation);

/** Current command stack, with the last element being the currently active (ticked) one */
var() const editinline transient GameAICommand CommandList;
var transient bool bHasRunawayCommandList;
var(Debug) config bool bAILogging;
var(Debug) config bool bAILogToWindow;
var(Debug) config bool bFlushAILogEachLine;
var(Debug) config bool bMapBasedLogName;
var(Debug) config bool bAIDrawDebug;
var transient bool bAIBroken;
var transient FileLog AILogFile;
var(Debug) float DebugTextMaxLen;
var(Debug) const transient array<AICmdHistoryItem> CommandHistory;
var(Debug) config int CommandHistoryNum;
/** List of categories to filter */
var(Debug) config array<config name> AILogFilter;
var string DemoActionString;

replication
{
     if(bDemoRecording)
        DemoActionString;
}

// Export UGameAIController::execAllCommands(FFrame&, void* const)
native final iterator function AllCommands(class<GameAICommand> BaseClass, out GameAICommand Cmd);

// Export UGameAIController::execPushCommand(FFrame&, void* const)
native function PushCommand(GameAICommand NewCommand);

// Export UGameAIController::execPopCommand(FFrame&, void* const)
native function PopCommand(GameAICommand ToBePoppedCommand);

// Export UGameAIController::execAbortCommand(FFrame&, void* const)
native function bool AbortCommand(GameAICommand AbortCmd, optional class<GameAICommand> AbortClass);

// Export UGameAIController::execGetActiveCommand(FFrame&, void* const)
native final function GameAICommand GetActiveCommand();

// Export UGameAIController::execCheckCommandCount(FFrame&, void* const)
native final function CheckCommandCount();

// Export UGameAIController::execDumpCommandStack(FFrame&, void* const)
native final function DumpCommandStack();

// Export UGameAIController::execFindCommandOfClass(FFrame&, void* const)
native final function GameAICommand FindCommandOfClass(class<GameAICommand> SearchClass);

// Export UGameAIController::execGetAICommandInStack(FFrame&, void* const)
native function GameAICommand GetAICommandInStack(const class<GameAICommand> InClass);

function float GetDestinationOffset();

function ReachedMoveGoal();

function ReachedIntermediateMoveGoal();

event Destroyed()
{
    super(Controller).Destroyed();
    if(AILogFile != none)
    {
        AILogFile.Destroy();
    }
    if(CommandList != none)
    {
        AbortCommand(CommandList);
    }
}

protected function RecordDemoAILog(coerce string LogText);

event AILog_Internal(coerce string LogText, optional name LogCategory, optional bool bForce, optional bool BugIt, optional bool bSkipExtraInfo)
{
    local int Idx;
    local string ActionStr, FinalStr, Filename;
    local GameAICommand ActiveCommand;
    local int FileNameLength;
    local Engine Eng;

    Eng = Class'Engine'.static.GetEngine();
    if(Eng.bDisableAILogging)
    {
        return;
    }
    if(!bForce && !bAILogging)
    {
        return;
    }
    if(WorldInfo.IsConsoleBuild(2))
    {
        return;
    }
    if(!bForce)
    {
        Idx = 0;
        J0xB3:

        if(Idx < AILogFilter.Length)
        {
            if(AILogFilter[Idx] == LogCategory)
            {
                return;
            }
            ++ Idx;
            goto J0xB3;
        }
    }
    if(AILogFile == none)
    {
        AILogFile = Spawn(Class'FileLog');
        if(bMapBasedLogName)
        {
            Filename = (WorldInfo.GetMapName() $ "_") $ string(self);
            Filename = Repl(Filename, "ai_", "", false);            
        }
        else
        {
            Filename = string(self);
        }
        if(Class'WorldInfo'.static.GetWorldInfo().IsConsoleBuild() == true)
        {
            FileNameLength = Len(Filename) + 6;
            if(FileNameLength > 40)
            {
                Filename = Right(Filename, 34);
            }
        }
        AILogFile.bKillDuringLevelTransition = true;
        AILogFile.bFlushEachWrite = bFlushAILogEachLine;
        AILogFile.bWantsAsyncWrites = !bFlushAILogEachLine;
        AILogFile.OpenLog(Filename, ".ailog");
    }
    ActionStr = string(GetStateName());
    ActiveCommand = GetActiveCommand();
    if(ActiveCommand != none)
    {
        ActionStr = (string(ActiveCommand.Class) $ ":") $ string(ActiveCommand.GetStateName());
    }
    FinalStr = (((("[" $ string(WorldInfo.TimeSeconds)) $ "]") @ ActionStr) $ ":") @ LogText;
    AILogFile.Logf(FinalStr);
    if(WorldInfo.IsRecordingDemo())
    {
        RecordDemoAILog(FinalStr);
    }
    if(bAILogToWindow)
    {
        LogInternal((((((string(Pawn) @ "[") $ string(WorldInfo.TimeSeconds)) $ "]") @ ActionStr) $ ":") @ LogText);
    }
}

function SetDesiredRotation(Rotator TargetDesiredRotation, optional bool InLockDesiredRotation, optional bool InUnlockWhenReached, optional float InterpolationTime)
{
    InLockDesiredRotation = false;
    InUnlockWhenReached = false;
    InterpolationTime = -1;
    if(Pawn != none)
    {
        Pawn.super(GameAIController).SetDesiredRotation(TargetDesiredRotation, InLockDesiredRotation, InUnlockWhenReached, InterpolationTime);
    }
}

final simulated event string GetActionString()
{
    local string ActionStr;
    local GameAICommand ActiveCmd;

    if(WorldInfo.IsPlayingDemo())
    {
        return DemoActionString;        
    }
    else
    {
        ActiveCmd = GetActiveCommand();
        if(ActiveCmd != none)
        {
            ActionStr = (string(ActiveCmd.Class) $ ":") $ string(ActiveCmd.GetStateName());            
        }
        else
        {
            ActionStr = (string(default.Class) $ ":") $ string(GetStateName());
        }
        return ActionStr;
    }
}

state DebugState
{
    function BeginState(name PreviousStateName)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            AILog_Internal("BEGINSTATE" @ string(PreviousStateName), 'State');
        }
    }

    function EndState(name NextStateName)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            AILog_Internal("ENDSTATE" @ string(NextStateName), 'State');
        }
    }

    function PushedState()
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            AILog_Internal("PUSHED", 'State');
        }
    }

    function PoppedState()
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            AILog_Internal("POPPED", 'State');
        }
    }

    function ContinuedState()
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            AILog_Internal("CONTINUED", 'State');
        }
    }

    function PausedState()
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            AILog_Internal("PAUSED", 'State');
        }
    }
    stop;    
}

defaultproperties
{
    CollisionType=ECollisionType.COLLIDE_CustomDefault
}