/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 * this goal eval will not stop until its out of paths, and will simply return the node with the least cost
 */
class NavMeshGoal_GenericFilterContainer extends NavMeshPathGoalEvaluator
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var transient instanced array<NavMeshGoal_Filter> GoalFilters;

/** storage of the goal we found an determined was OK (for use when goal does not have a path, but we still want to know what the goal was) */
var transient private native pointer SuccessfulGoal{FNavMeshEdgeBase};

/** Ref to our NavHandle so we can interrogate it for Debug flags. **/
var transient protected NavigationHandle MyNavigationHandle;

/** array of locations that should be used to seed the working set initially  */
var transient array<vector> SeedLocations;



static function NavMeshGoal_GenericFilterContainer CreateAndAddFilterToNavHandle( NavigationHandle NavHandle, optional int InMaxPathVisits=-1)
{
	local NavMeshGoal_GenericFilterContainer	Eval;

	if( NavHandle != None )
	{
		Eval = NavMeshGoal_GenericFilterContainer(NavHandle.CreatePathGoalEvaluator(default.class));

		if( Eval != None )
		{
			if(InMaxPathVisits > 0)
			{
				Eval.MaxPathVisits = InMaxPathVisits;
			}

			Eval.MyNavigationHandle = NavHandle;
			Eval.SeedLocations[Eval.SeedLocations.length] = NavHandle.CachedPathParams.SearchStart;
			NavHandle.AddGoalEvaluator( Eval );
			return Eval;
		}
	}

	return none;
}

static function NavMeshGoal_GenericFilterContainer CreateAndAddFilterToNavHandleFromSeedList( NavigationHandle NavHandle, out array<vector> InSearchSeeds, optional int InMaxPathVisits=-1)
{
	local NavMeshGoal_GenericFilterContainer	Eval;

	if( NavHandle != None )
	{
		Eval = NavMeshGoal_GenericFilterContainer(NavHandle.CreatePathGoalEvaluator(default.class));

		if( Eval != None )
		{
			if(InMaxPathVisits > 0)
			{
				Eval.MaxPathVisits = InMaxPathVisits;
			}

			Eval.MyNavigationHandle = NavHandle;
			Eval.SeedLocations = InSearchSeeds;
			NavHandle.AddGoalEvaluator( Eval );
			return Eval;
		}
	}

	return none;
}

// indireciton to hook into a pool or something if we want
function NavMeshGoal_Filter GetFilterOfType(class<NavMeshGoal_Filter> Filter_Class)
{
	return new(self) Filter_Class;
}

/**
 * returns the center of the poly we found as a valid goal, or 0,0,0 if none found (uses SuccessfulGoal member var0
 */
native function vector GetGoalPoint();



function Recycle()
{
	Super.Recycle();

	GoalFilters.length = 0;
	MaxPathVisits = default.maxPathVisits;
	MyNavigationHandle = None;
}

defaultproperties
{
   MaxPathVisits=2048
   Name="Default__NavMeshGoal_GenericFilterContainer"
   ObjectArchetype=NavMeshPathGoalEvaluator'Engine.Default__NavMeshPathGoalEvaluator'
}
