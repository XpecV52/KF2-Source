//=============================================================================
// Goal_WallToEnemy
//=============================================================================
// Returns (as goal) the KFWallPathNode that's closest to enemy, as long as
// enemy will be visible from that potential goal. Used to find ambush spots
// on walls for Crawlers.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
// Based on GOW Goal_FarthestNavInRange
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class Goal_WallToEnemy extends PathGoalEvaluator
	native(Waypoint);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var NavigationPoint BestNode;
var int				OptimalMaxDist;
var float			BestNavDist;

/** current best result */
//var NavigationPoint CurrentBest;

static function bool WallToEnemy(Pawn P, optional int InOptimalMaxDist=3000)
{
	local Goal_WallToEnemy Eval;

	Eval = Goal_WallToEnemy(P.CreatePathGoalEvaluator(default.class));

	Eval.OptimalMaxDist = InOptimalMaxDist;
	P.AddGoalEvaluator(Eval);
	return true;
}

function Recycle()
{
	OptimalMaxDist = default.OptimalMaxDist;
	BestNode = none;
	Super.Recycle();
}

defaultproperties
{
   MaxPathVisits=10000
   CacheIdx=18
   Name="Default__Goal_WallToEnemy"
   ObjectArchetype=PathGoalEvaluator'Engine.Default__PathGoalEvaluator'
}
