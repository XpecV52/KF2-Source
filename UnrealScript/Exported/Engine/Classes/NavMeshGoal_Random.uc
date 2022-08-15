/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 * this goal eval will not stop until its out of paths, and will return one of the nodes traversed at random
 */
class NavMeshGoal_Random extends NavMeshPathGoalEvaluator
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** minimum path distance before we start rating nodes; useful when you want to make sure the random decision covers a reasonable distance
 * and isn't just moving back and forth in a small area
 */
var int MinDist;

var float BestRating;
var private native pointer PartialGoal{FNavMeshEdgeBase};

static function bool FindRandom(NavigationHandle NavHandle, optional int InMinDist = -1, optional int InMaxPathVisits = -1)
{
	local NavMeshGoal_Random Eval;

	if (NavHandle != None)
	{
		Eval = NavMeshGoal_Random(NavHandle.CreatePathGoalEvaluator(default.class));
		if (InMaxPathVisits > 0)
		{
			Eval.MaxPathVisits = InMaxPathVisits;
		}
		Eval.MinDist = InMinDist;
		NavHandle.AddGoalEvaluator(Eval);
		return true;
	}
	else
	{
		return false;
	}
}

native function RecycleNative();

function Recycle()
{
	Super.Recycle();
	MaxPathVisits = default.maxPathVisits;
	BestRating = default.BestRating;
	MinDist = default.MinDist;
	RecycleNative();
}

defaultproperties
{
   MinDist=-1
   BestRating=-1.000000
   Name="Default__NavMeshGoal_Random"
   ObjectArchetype=NavMeshPathGoalEvaluator'Engine.Default__NavMeshPathGoalEvaluator'
}
