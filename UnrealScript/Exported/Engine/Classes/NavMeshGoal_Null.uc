/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 * this goal eval will not stop until its out of paths, and will simply return the node with the least cost
 */
class NavMeshGoal_Null extends NavMeshPathGoalEvaluator
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var private native pointer PartialGoal{FNavMeshEdgeBase};

static function bool GoUntilBust( NavigationHandle NavHandle, optional int InMaxPathVisits=-1 )
{
	local NavMeshGoal_Null	Eval;

	if( NavHandle != None )
	{
		Eval = NavMeshGoal_Null(NavHandle.CreatePathGoalEvaluator(default.class));

		if( Eval != None )
		{
			if(InMaxPathVisits > 0)
			{
				Eval.MaxPathVisits = InMaxPathVisits;
			}
			NavHandle.AddGoalEvaluator( Eval );
			return TRUE;
		}
	}

	return FALSE;
}

native function RecycleNative();

function Recycle()
{
	Super.Recycle();
	MaxPathVisits=default.maxPathVisits;
	RecycleNative();
}

defaultproperties
{
   MaxPathVisits=2048
   Name="Default__NavMeshGoal_Null"
   ObjectArchetype=NavMeshPathGoalEvaluator'Engine.Default__NavMeshPathGoalEvaluator'
}
