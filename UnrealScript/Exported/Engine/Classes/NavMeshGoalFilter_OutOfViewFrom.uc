/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshGoalFilter_OutOfViewFrom extends NavMeshGoal_Filter
	native(AI);

// the polygon that contains our goal point
var transient  private native pointer GoalPoly{FNavMeshPolyBase};

var transient vector OutOfViewLocation;

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


static function bool MustBeHiddenFromThisPoint( NavMeshGoal_GenericFilterContainer FilterContainer, Vector InOutOfViewLocation  )
{
	local NavMeshGoalFilter_OutOfViewFrom	Eval;

	if( FilterContainer != None )
	{
		Eval = NavMeshGoalFilter_OutOfViewFrom(FilterContainer.GetFilterOfType(default.class));

		if( Eval != None )
		{
			Eval.OutOfViewLocation = InOutOfViewLocation;
			FilterContainer.GoalFilters.AddItem(Eval);
			return TRUE;
		}
	}

	return FALSE;
}

defaultproperties
{
   Name="Default__NavMeshGoalFilter_OutOfViewFrom"
   ObjectArchetype=NavMeshGoal_Filter'Engine.Default__NavMeshGoal_Filter'
}
