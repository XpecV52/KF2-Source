/*******************************************************************************
 * AIDebugTool generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AIDebugTool extends Object
    native(Debug);

enum ELogDrawingMode
{
    AIDH_DrawAll,
    AIDH_EntryDetails,
    AIDH_BlackBoard,
    AIDH_Preconditions,
    AIDH_SquadEnemy,
    AIDH_Animation,
    AIDH_Weapon,
    AIDH_MAX
};

struct String_Mirror
{
    var string Value;

    structdefaultproperties
    {
        Value=""
    }
};

struct native AIDebugLogLine
{
    var native String_Mirror Line;
    var native name LineCategory;
};

struct native AIDebugLogEntry
{
    var float TimeStamp;
    var Vector WorldPosition;
    var Vector EnemyPosition;
    var Vector Facing;
    var native String_Mirror BTStatus;
    var native array<String_Mirror> BlackBoardEntries;
    var native array<String_Mirror> BehaviorTrace;
    var native array<String_Mirror> Preconditions;
    var native array<String_Mirror> CommandStack;
    var native array<String_Mirror> SquadEnemyList;
    var native array<String_Mirror> LocalEnemyList;
    var native array<String_Mirror> InnerState;
    var native array<String_Mirror> AnimationProxy;
    var native array<Vector> Route;
    var init native array<init SpaceLineInfo> DebugLines;
    var native array<String_Mirror> WeaponInfo;
    var array<AIDebugLogLine> Lines;

    structdefaultproperties
    {
        TimeStamp=0
        WorldPosition=(X=0,Y=0,Z=0)
        EnemyPosition=(X=0,Y=0,Z=0)
        Facing=(X=0,Y=0,Z=0)
        Lines=none
    }
};

struct native AIDebugActorsLog
{
    var int Tail;
    var array<AIDebugLogEntry> Entries;
    var int NotEmptyElements;
    var private const int nIndex;

    structdefaultproperties
    {
        Tail=0
        Entries=none
        NotEmptyElements=0
        nIndex=0
    }
};

struct native ETQDebugEntry
{
    var float TimeStamp;
    var init native array<init String_Mirror> ExecutedQueries;

    structdefaultproperties
    {
        TimeStamp=0
    }
};

var transient float GameFrameTime;
var int BTPersonalLogSize;
var array<string> BTPersonalLog;
var BaseAIController DebugTarget;
var int EntryToDisplay;
var init transient array<init name> Filters;
var array<name> ColorCategories;
var array<Actor> UnreachableActors;
var int DrawingFlags;
var transient ETQDebugEntry CurrentETQLog;
var init array<init ETQDebugEntry> ETQLogHistory;
var bool bLoadOldLogs;
var transient Actor LoggingContext;
var native const Map_Mirror Logs;

// Export UAIDebugTool::execDrawLog(FFrame&, void* const)
native final function DrawLog(Canvas Canvas, Actor Actor);

// Export UAIDebugTool::execLoadLogFile(FFrame&, void* const)
native final function bool LoadLogFile(string Filename, optional bool bAppendMapName)
{
    bAppendMapName = true;                
}

// Export UAIDebugTool::execFlushLogs(FFrame&, void* const)
native final function FlushLogs(optional string DirName, optional BaseAIController AI);

// Export UAIDebugTool::execSetDebugTarget(FFrame&, void* const)
native final function SetDebugTarget(BaseAIController NewDebugTarget);

// Export UAIDebugTool::execLog(FFrame&, void* const)
native final function Log(Actor Actor, string LogText, optional name LogCategory);

// Export UAIDebugTool::execLogSpaceLine(FFrame&, void* const)
native final function LogSpaceLine(Actor Actor, Vector Start, Vector End, BaseAITypes.EDebugLineType Type, optional string Comment, optional name Category);

// Export UAIDebugTool::execSetContext(FFrame&, void* const)
native final function SetContext(Actor Actor);

// Export UAIDebugTool::execDisplayNextEntry(FFrame&, void* const)
native final function DisplayNextEntry(optional int Count, optional int Direction)
{
    Count = 1;
    Direction = 1;                
}

// Export UAIDebugTool::execToggleLogDrawingMode(FFrame&, void* const)
native final function ToggleLogDrawingMode(AIDebugTool.ELogDrawingMode Mode);

// Export UAIDebugTool::execSetHistoryFilter(FFrame&, void* const)
native final function SetHistoryFilter(name Filter, bool bVal);

// Export UAIDebugTool::execClearHistoryFilter(FFrame&, void* const)
native final function ClearHistoryFilter();

// Export UAIDebugTool::execColorHistory(FFrame&, void* const)
native final function ColorHistory(name Filter);

// Export UAIDebugTool::execClearHistoryColor(FFrame&, void* const)
native final function ClearHistoryColor();

// Export UAIDebugTool::execLogUnreachableActor(FFrame&, void* const)
native final function LogUnreachableActor(Actor inActor);

// Export UAIDebugTool::execFlushUnreachableActors(FFrame&, void* const)
native final function FlushUnreachableActors();

// Export UAIDebugTool::execAddETQLog(FFrame&, void* const)
native final function AddETQLog(string QueryName, string TestName, Actor Querier);

// Export UAIDebugTool::execFlushETQHistory(FFrame&, void* const)
native final function FlushETQHistory();

// Export UAIDebugTool::execAddBTLogEntry(FFrame&, void* const)
native final function AddBTLogEntry(string Entry);

// Export UAIDebugTool::execGetActorEntryLocation(FFrame&, void* const)
native final function Vector GetActorEntryLocation(optional Actor inActor, optional int Index)
{
    Index = -1;                
}

// Export UAIDebugTool::execDumpNativeCallStack(FFrame&, void* const)
native final function DumpNativeCallStack(Actor Actor, optional name LogCategory)
{
    LogCategory = 'CallStack';                
}

defaultproperties
{
    BTPersonalLogSize=23
}