/*******************************************************************************
 * KFScriptedPawnSpawner generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFScriptedPawnSpawner extends Actor
    placeable
    hidecategories(Navigation);

/** Class of scripted pawn to spawn */
var(PawnInfo) class<KFPawn_Scripted> PawnClass;
/** Character archetype for the pawn */
var(PawnInfo) KFCharacterInfo_ScriptedPawn PawnCharacterInfo;
var float PawnHealth;
var float PawnHealthMax;
var transient KFPawn_Scripted Pawn;
var transient KFPawn_Scripted ReferencePawn;
var bool bUseReferencePawnHealth;
var bool bUseReferencePawnHealthMax;
var transient bool bReachedStart;
var transient bool bReachedGoal;
/** SplineActor where the pawn spawns. Pawn has no collision / can't be targeted until it reaches PathStart */
var(PathInfo) SplineActor PathSpawn;
/** SplineActor where the pawn is considered to have officially started its route */
var(PathInfo) SplineActor PathStart;
/** Possible SplineActors where the pawn's scripted movement is considered complete for gameplay purposes */
var(PathInfo) array<SplineActor> PathGoals;
var transient SplineActor PathGoal;
/** How many subsegments the pawn will move through along the spline between two SplineActors (i.e. the higher the granularity, the more closely the pawn follows the curve of the spline) */
var(PathInfo) int SegmentGranularity<ClampMin=0>;
var transient int NumSubSegments;
var transient int NumSubSegmentsFinished;
var delegate<Delegate_OnPawnStartedRoute> __Delegate_OnPawnStartedRoute__Delegate;
var delegate<Delegate_OnPawnReachedRouteMarker> __Delegate_OnPawnReachedRouteMarker__Delegate;
var delegate<Delegate_OnPawnReachedGoal> __Delegate_OnPawnReachedGoal__Delegate;
var delegate<Delegate_OnPawnEndedRoute> __Delegate_OnPawnEndedRoute__Delegate;

delegate Delegate_OnPawnStartedRoute(KFPawn_Scripted StartedPawn);

delegate Delegate_OnPawnReachedRouteMarker(int MarkerIdx, SplineActor Marker, int SubIdx);

delegate Delegate_OnPawnReachedGoal();

delegate Delegate_OnPawnEndedRoute(bool bSuccess);

event PostBeginPlay()
{
    super.PostBeginPlay();
    SetupProgress();
}

function SpawnPawn(bool bSpawnInactive)
{
    if(PathSpawn == none)
    {
        WarnInternal(string(self) $ "::SpawnPawn - PathSpawn is NONE");
        return;
    }
    if(PathStart == none)
    {
        WarnInternal(string(self) $ "::SpawnPawn - PathStart is NONE");
        return;
    }
    if(PathGoals.Length == 0)
    {
        WarnInternal(string(self) $ "::SpawnPawn - PathGoals is EMPTY");
        return;
    }
    if(PawnClass == none)
    {
        WarnInternal(string(self) $ "::SpawnPawn - PawnClass is none!");
        return;
    }
    Pawn = Spawn(PawnClass, self,, PathSpawn.Location, PathSpawn.Rotation,, true);
    if(Pawn == none)
    {
        WarnInternal(((string(self) $ "::SpawnPawn - cannot spawn ") $ string(PawnClass)) $ "!");
        return;
    }
    SetupPawn();
    Pawn.bStartInactive = bSpawnInactive;
    Pawn.StartRoute(PathSpawn, PathGoal, SegmentGranularity);
}

function SetupProgress()
{
    local array<SplineActor> Route;

    PathGoal = PathGoals[Rand(PathGoals.Length)];
    PathStart.FindSplinePathTo(PathGoal, Route);
    NumSubSegments = (Route.Length - 1) * (SegmentGranularity + 1);
    NumSubSegmentsFinished = 0;
}

simulated function float GetProgress()
{
    return float(NumSubSegmentsFinished) / float(NumSubSegments);
}

function SetupPawn()
{
    if(ReferencePawn != none)
    {
        if(bUseReferencePawnHealth)
        {
            PawnHealth = float(ReferencePawn.Health);
        }
        if(bUseReferencePawnHealthMax)
        {
            PawnHealthMax = float(ReferencePawn.HealthMax);
        }
    }
    Pawn.Initialize(PawnCharacterInfo, int(PawnHealth), int(PawnHealthMax));
    if(Pawn.Controller == none)
    {
        Pawn.SpawnDefaultController();
    }
    Pawn.__Delegate_OnReachedRouteMarker__Delegate = OnPawnReachedRouteMarker;
    Pawn.__Delegate_OnEndedRoute__Delegate = OnPawnEndedRoute;
}

function OnPawnReachedRouteMarker(int MarkerIdx, SplineActor Marker, int SubIdx)
{
    if(bReachedStart && !bReachedGoal)
    {
        ++ NumSubSegmentsFinished;
        if(__Delegate_OnPawnReachedRouteMarker__Delegate != none)
        {
            Delegate_OnPawnReachedRouteMarker(MarkerIdx, Marker, SubIdx);
        }
    }
    if(Marker == PathStart)
    {
        bReachedStart = true;
        Pawn.Start();
        if(__Delegate_OnPawnStartedRoute__Delegate != none)
        {
            Delegate_OnPawnStartedRoute(Pawn);
        }        
    }
    else
    {
        if(Marker == PathGoal)
        {
            bReachedGoal = true;
            Pawn.ReachedGoal();
            if(__Delegate_OnPawnReachedGoal__Delegate != none)
            {
                Delegate_OnPawnReachedGoal();
            }
        }
    }
}

function OnPawnEndedRoute(bool bSuccess)
{
    if(__Delegate_OnPawnEndedRoute__Delegate != none && !bReachedGoal)
    {
        Delegate_OnPawnEndedRoute(bSuccess);
    }
}

defaultproperties
{
    PawnClass=Class'KFPawn_Scripted'
    PawnHealth=100
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.Crowd.T_Crowd_Spline'
        SpriteCategoryName=Splines
        ReplacementPrimitive=none
        HiddenGame=true
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
        Scale=0.5
    object end
    // Reference: SpriteComponent'Default__KFScriptedPawnSpawner.Sprite'
    Components(0)=Sprite
}