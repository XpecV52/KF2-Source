//=============================================================================
// Goal_Random
//=============================================================================
// Path goal evaluator to find a random navigationpoint in a range
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class Goal_Random extends PathGoalEvaluator
	native(Waypoint);

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
var NavigationPoint Best;

static function bool FindRandom(Pawn P, optional int InMinDist = -1, optional int InMaxPathVisits = -1)
{
	local Goal_Random Eval;

	if (P != None)
	{
		Eval = Goal_Random(P.CreatePathGoalEvaluator(default.class));
		if (InMaxPathVisits > 0)
		{
			Eval.MaxPathVisits = InMaxPathVisits;
		}
		Eval.MinDist = InMinDist;
		P.AddGoalEvaluator(Eval);
		return true;
	}
	else
	{
		return false;
	}
}

function Recycle()
{
	Super.Recycle();
	MaxPathVisits = default.maxPathVisits;
	BestRating = default.BestRating;
	MinDist = default.MinDist;
}

defaultproperties
{
   MinDist=-1
   BestRating=-1.000000
   CacheIdx=17
   Name="Default__Goal_Random"
   ObjectArchetype=PathGoalEvaluator'Engine.Default__PathGoalEvaluator'
}
