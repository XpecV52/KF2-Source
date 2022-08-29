//=============================================================================
// KFScriptedPawnSpawner
//=============================================================================
// Placeable actor that contains information about a scripted pawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFScriptedPawnSpawner extends Actor
	placeable;

// Class of scripted pawn to spawn
var(PawnInfo) class<KFPawn_Scripted> PawnClass;
// Character archetype for the pawn
var(PawnInfo) KFCharacterInfo_ScriptedPawn PawnCharacterInfo;

var float PawnHealth, PawnHealthMax;
var transient KFPawn_Scripted Pawn, ReferencePawn;
var bool bUseReferencePawnHealth, bUseReferencePawnHealthMax;

// SplineActor where the pawn spawns. Pawn has no collision / can't be targeted until it reaches PathStart
var(PathInfo) SplineActor PathSpawn;
// SplineActor where the pawn is considered to have officially started its route
var(PathInfo) SplineActor PathStart;
// Possible SplineActors where the pawn's scripted movement is considered complete for gameplay purposes
var(PathInfo) array<SplineActor> PathGoals;
var transient SplineActor PathGoal;
// How many subsegments the pawn will move through along the spline between two SplineActors (i.e. the higher the granularity, the more closely the pawn follows the curve of the spline)
var(PathInfo) int SegmentGranularity<ClampMin=0>;

var transient bool bReachedStart, bReachedGoal;
var transient float RouteDist, RouteDistTraversed;

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
	if (PathSpawn == none)
	{
		WarnInternal(self$"::SpawnPawn - PathSpawn is NONE");
		return;
	}

	if (PathStart == none)
	{
		WarnInternal(self$"::SpawnPawn - PathStart is NONE");
		return;
	}

	if (PathGoals.Length == 0)
	{
		WarnInternal(self$"::SpawnPawn - PathGoals is EMPTY");
		return;
	}

	if (PawnClass == none)
	{
		WarnInternal(self$"::SpawnPawn - PawnClass is none!");
		return;
	}

	Pawn = Spawn(PawnClass, self,, PathSpawn.Location, PathSpawn.Rotation,, true);
	if (Pawn == none)
	{
		WarnInternal(self$"::SpawnPawn - cannot spawn "$PawnClass$"!");
		return;
	}

	SetupPawn();

	Pawn.bStartInactive = bSpawnInactive;

	// The pawn needs to find a route from its spawn point to its goal
	Pawn.StartRoute(PathSpawn, PathGoal, SegmentGranularity);
}

function SetupProgress()
{
	local array<SplineActor> Route;
	local int i;

	// @TODO: don't just pick a random goal?
	PathGoal = PathGoals[Rand(PathGoals.Length)];
	PathStart.FindSplinePathTo(PathGoal, Route);
	for (i = 0; i < Route.Length - 1; ++i)
	{
		RouteDist += Route[i].FindSplineComponentTo(Route[i+1]).GetSplineLength();
	}
}

simulated function float GetProgress()
{
	return RouteDistTraversed / RouteDist;
}

function SetupPawn()
{
	if (ReferencePawn != none)
	{
		if (bUseReferencePawnHealth)
		{
			PawnHealth = ReferencePawn.Health;
		}

		if (bUseReferencePawnHealthMax)
		{
			PawnHealthMax = ReferencePawn.HealthMax;
		}
		// can set other stuff here, like maybe reusing the controller
	}

	Pawn.Initialize(PawnCharacterInfo, PawnHealth, PawnHealthMax);

	if (Pawn.Controller == none)
	{
		Pawn.SpawnDefaultController();
	}

	Pawn.Delegate_OnReachedRouteMarker = OnPawnReachedRouteMarker;
	Pawn.Delegate_OnEndedRoute = OnPawnEndedRoute;
}

function OnPawnReachedRouteMarker(int MarkerIdx, SplineActor Marker, int SubIdx, float DistSinceLastMarker)
{
	if (bReachedStart && !bReachedGoal)
	{
		RouteDistTraversed += DistSinceLastMarker;

		if (Delegate_OnPawnReachedRouteMarker != none)
		{
			Delegate_OnPawnReachedRouteMarker(MarkerIdx, Marker, SubIdx);
		}
	}

	if (Marker == PathStart)
	{
		bReachedStart = true;
		Pawn.Start();

		if (Delegate_OnPawnStartedRoute != none)
		{
			Delegate_OnPawnStartedRoute(Pawn);
		}
	}
	else if (Marker == PathGoal)
	{
		bReachedGoal = true;
		Pawn.ReachedGoal();

		if (Delegate_OnPawnReachedGoal != none)
		{
			Delegate_OnPawnReachedGoal();
		}
	}
}

function OnPawnEndedRoute(bool bSuccess)
{
	if (Delegate_OnPawnEndedRoute != none && !bReachedGoal)
	{
		Delegate_OnPawnEndedRoute(bSuccess);
	}
}

defaultproperties
{
   PawnClass=Class'KFGame.KFPawn_Scripted'
   PawnHealth=100.000000
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.Crowd.T_Crowd_Spline'
      SpriteCategoryName="Splines"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.500000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Name="Default__KFScriptedPawnSpawner"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
