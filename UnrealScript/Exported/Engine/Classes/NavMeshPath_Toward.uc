/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshPath_Toward extends NavMeshPathConstraint
	native(AI);

/** when TRUE we will bias against paths which leave our high level path pylon list (as marked by bPylonInHighLevelPath on the pylon ) */
var bool bBiasAgainstHighLevelPath;
/** when above is true, how much cost to apply to the heuristic when an edge leaves the high level path */
var float OutOfHighLevelPathBias;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Goal trying to find path toward */
var Actor	GoalActor;
/** Goal trying to find path toward */
var Vector GoalPoint;

static function bool TowardGoal( NavigationHandle NavHandle, Actor Goal )
{
	local NavMeshPath_Toward Con;

	if( NavHandle != None && Goal != None )
	{
		Con = NavMeshPath_Toward(NavHandle.CreatePathConstraint(default.class));
		if( Con != None )
		{
			Con.GoalActor = Goal;
			NavHandle.AddPathConstraint( Con );
			return TRUE;
		}
	}

	return FALSE;
}

static function bool TowardPoint( NavigationHandle NavHandle, Vector Point )
{
	local NavMeshPath_Toward Con;

	if( NavHandle != None && Point != Vect(0,0,0) )
	{
		Con = NavMeshPath_Toward(NavHandle.CreatePathConstraint(default.class));
		if( Con != None )
		{
			Con.GoalPoint = Point;
			NavHandle.AddPathConstraint( Con );
			return TRUE;
		}
	}

	return FALSE;
}

function Recycle()
{
	Super.Recycle();
	GoalActor=none;
	GoalPoint=default.GoalPoint;
}

defaultproperties
{
   bBiasAgainstHighLevelPath=True
   OutOfHighLevelPathBias=5000.000000
   Name="Default__NavMeshPath_Toward"
   ObjectArchetype=NavMeshPathConstraint'Engine.Default__NavMeshPathConstraint'
}
