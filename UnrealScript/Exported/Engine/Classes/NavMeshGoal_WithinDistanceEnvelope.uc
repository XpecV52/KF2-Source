/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshGoal_WithinDistanceEnvelope extends NavMeshPathGoalEvaluator
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** outer distance of envelope (distance from test actor) */
var() float	MaxDistance;
/** inner distance of envelope (distance from test actor) */
var() float MinDistance;
var() float MinTraversalDist;

var() vector EnvelopeTestPoint; 

static function bool GoalWithinEnvelopeToLoc( NavigationHandle NavHandle, vector InEnvelopeTestPoint, float InMaxDistance, float InMinDistance, optional float InMinTraversalDist )
{
	local NavMeshGoal_WithinDistanceEnvelope Eval;

	if( NavHandle != None )
	{
		Eval = NavMeshGoal_WithinDistanceEnvelope(NavHandle.CreatePathGoalEvaluator(default.class));
		if( Eval != None )
		{
			Eval.EnvelopeTestPoint = InEnvelopeTestPoint;
			Eval.MaxDistance = InMaxDistance;
			Eval.MinDistance = InMinDistance;
			Eval.MinTraversalDist = InMinTraversalDist;
			NavHandle.AddGoalEvaluator( Eval );
			return TRUE;
		}
	}

	return FALSE;
}

function Recycle()
{
	Super.Recycle();
	MaxDistance=default.MaxDistance;
	MinDistance=default.MinDistance;
	MinTraversalDist=default.MinTraversalDist;
	EnvelopeTestPoint=default.EnvelopeTestPoint;
}

defaultproperties
{
   Name="Default__NavMeshGoal_WithinDistanceEnvelope"
   ObjectArchetype=NavMeshPathGoalEvaluator'Engine.Default__NavMeshPathGoalEvaluator'
}
